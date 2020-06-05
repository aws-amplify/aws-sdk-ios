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

#import "AWSCloudfrontService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSCloudfrontResources.h"

static NSString *const AWSInfoCloudfront = @"Cloudfront";
NSString *const AWSCloudfrontSDKVersion = @"2.13.4";


@interface AWSCloudfrontResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSCloudfrontResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDenied" : @(AWSCloudfrontErrorAccessDenied),
                            @"BatchTooLarge" : @(AWSCloudfrontErrorBatchTooLarge),
                            @"CNAMEAlreadyExists" : @(AWSCloudfrontErrorCNAMEAlreadyExists),
                            @"CannotChangeImmutablePublicKeyFields" : @(AWSCloudfrontErrorCannotChangeImmutablePublicKeyFields),
                            @"CloudFrontOriginAccessIdentityAlreadyExists" : @(AWSCloudfrontErrorCloudFrontOriginAccessIdentityAlreadyExists),
                            @"CloudFrontOriginAccessIdentityInUse" : @(AWSCloudfrontErrorCloudFrontOriginAccessIdentityInUse),
                            @"DistributionAlreadyExists" : @(AWSCloudfrontErrorDistributionAlreadyExists),
                            @"DistributionNotDisabled" : @(AWSCloudfrontErrorDistributionNotDisabled),
                            @"FieldLevelEncryptionConfigAlreadyExists" : @(AWSCloudfrontErrorFieldLevelEncryptionConfigAlreadyExists),
                            @"FieldLevelEncryptionConfigInUse" : @(AWSCloudfrontErrorFieldLevelEncryptionConfigInUse),
                            @"FieldLevelEncryptionProfileAlreadyExists" : @(AWSCloudfrontErrorFieldLevelEncryptionProfileAlreadyExists),
                            @"FieldLevelEncryptionProfileInUse" : @(AWSCloudfrontErrorFieldLevelEncryptionProfileInUse),
                            @"FieldLevelEncryptionProfileSizeExceeded" : @(AWSCloudfrontErrorFieldLevelEncryptionProfileSizeExceeded),
                            @"IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior" : @(AWSCloudfrontErrorIllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior),
                            @"IllegalUpdate" : @(AWSCloudfrontErrorIllegalUpdate),
                            @"InconsistentQuantities" : @(AWSCloudfrontErrorInconsistentQuantities),
                            @"InvalidArgument" : @(AWSCloudfrontErrorInvalidArgument),
                            @"InvalidDefaultRootObject" : @(AWSCloudfrontErrorInvalidDefaultRootObject),
                            @"InvalidErrorCode" : @(AWSCloudfrontErrorInvalidErrorCode),
                            @"InvalidForwardCookies" : @(AWSCloudfrontErrorInvalidForwardCookies),
                            @"InvalidGeoRestrictionParameter" : @(AWSCloudfrontErrorInvalidGeoRestrictionParameter),
                            @"InvalidHeadersForS3Origin" : @(AWSCloudfrontErrorInvalidHeadersForS3Origin),
                            @"InvalidIfMatchVersion" : @(AWSCloudfrontErrorInvalidIfMatchVersion),
                            @"InvalidLambdaFunctionAssociation" : @(AWSCloudfrontErrorInvalidLambdaFunctionAssociation),
                            @"InvalidLocationCode" : @(AWSCloudfrontErrorInvalidLocationCode),
                            @"InvalidMinimumProtocolVersion" : @(AWSCloudfrontErrorInvalidMinimumProtocolVersion),
                            @"InvalidOrigin" : @(AWSCloudfrontErrorInvalidOrigin),
                            @"InvalidOriginAccessIdentity" : @(AWSCloudfrontErrorInvalidOriginAccessIdentity),
                            @"InvalidOriginKeepaliveTimeout" : @(AWSCloudfrontErrorInvalidOriginKeepaliveTimeout),
                            @"InvalidOriginReadTimeout" : @(AWSCloudfrontErrorInvalidOriginReadTimeout),
                            @"InvalidProtocolSettings" : @(AWSCloudfrontErrorInvalidProtocolSettings),
                            @"InvalidQueryStringParameters" : @(AWSCloudfrontErrorInvalidQueryStringParameters),
                            @"InvalidRelativePath" : @(AWSCloudfrontErrorInvalidRelativePath),
                            @"InvalidRequiredProtocol" : @(AWSCloudfrontErrorInvalidRequiredProtocol),
                            @"InvalidResponseCode" : @(AWSCloudfrontErrorInvalidResponseCode),
                            @"InvalidTTLOrder" : @(AWSCloudfrontErrorInvalidTTLOrder),
                            @"InvalidTagging" : @(AWSCloudfrontErrorInvalidTagging),
                            @"InvalidViewerCertificate" : @(AWSCloudfrontErrorInvalidViewerCertificate),
                            @"InvalidWebACLId" : @(AWSCloudfrontErrorInvalidWebACLId),
                            @"MissingBody" : @(AWSCloudfrontErrorMissingBody),
                            @"NoSuchCloudFrontOriginAccessIdentity" : @(AWSCloudfrontErrorNoSuchCloudFrontOriginAccessIdentity),
                            @"NoSuchDistribution" : @(AWSCloudfrontErrorNoSuchDistribution),
                            @"NoSuchFieldLevelEncryptionConfig" : @(AWSCloudfrontErrorNoSuchFieldLevelEncryptionConfig),
                            @"NoSuchFieldLevelEncryptionProfile" : @(AWSCloudfrontErrorNoSuchFieldLevelEncryptionProfile),
                            @"NoSuchInvalidation" : @(AWSCloudfrontErrorNoSuchInvalidation),
                            @"NoSuchOrigin" : @(AWSCloudfrontErrorNoSuchOrigin),
                            @"NoSuchPublicKey" : @(AWSCloudfrontErrorNoSuchPublicKey),
                            @"NoSuchResource" : @(AWSCloudfrontErrorNoSuchResource),
                            @"NoSuchStreamingDistribution" : @(AWSCloudfrontErrorNoSuchStreamingDistribution),
                            @"PreconditionFailed" : @(AWSCloudfrontErrorPreconditionFailed),
                            @"PublicKeyAlreadyExists" : @(AWSCloudfrontErrorPublicKeyAlreadyExists),
                            @"PublicKeyInUse" : @(AWSCloudfrontErrorPublicKeyInUse),
                            @"QueryArgProfileEmpty" : @(AWSCloudfrontErrorQueryArgProfileEmpty),
                            @"StreamingDistributionAlreadyExists" : @(AWSCloudfrontErrorStreamingDistributionAlreadyExists),
                            @"StreamingDistributionNotDisabled" : @(AWSCloudfrontErrorStreamingDistributionNotDisabled),
                            @"TooManyCacheBehaviors" : @(AWSCloudfrontErrorTooManyCacheBehaviors),
                            @"TooManyCertificates" : @(AWSCloudfrontErrorTooManyCertificates),
                            @"TooManyCloudFrontOriginAccessIdentities" : @(AWSCloudfrontErrorTooManyCloudFrontOriginAccessIdentities),
                            @"TooManyCookieNamesInWhiteList" : @(AWSCloudfrontErrorTooManyCookieNamesInWhiteList),
                            @"TooManyDistributionCNAMEs" : @(AWSCloudfrontErrorTooManyDistributionCNAMEs),
                            @"TooManyDistributions" : @(AWSCloudfrontErrorTooManyDistributions),
                            @"TooManyDistributionsAssociatedToFieldLevelEncryptionConfig" : @(AWSCloudfrontErrorTooManyDistributionsAssociatedToFieldLevelEncryptionConfig),
                            @"TooManyDistributionsWithLambdaAssociations" : @(AWSCloudfrontErrorTooManyDistributionsWithLambdaAssociations),
                            @"TooManyFieldLevelEncryptionConfigs" : @(AWSCloudfrontErrorTooManyFieldLevelEncryptionConfigs),
                            @"TooManyFieldLevelEncryptionContentTypeProfiles" : @(AWSCloudfrontErrorTooManyFieldLevelEncryptionContentTypeProfiles),
                            @"TooManyFieldLevelEncryptionEncryptionEntities" : @(AWSCloudfrontErrorTooManyFieldLevelEncryptionEncryptionEntities),
                            @"TooManyFieldLevelEncryptionFieldPatterns" : @(AWSCloudfrontErrorTooManyFieldLevelEncryptionFieldPatterns),
                            @"TooManyFieldLevelEncryptionProfiles" : @(AWSCloudfrontErrorTooManyFieldLevelEncryptionProfiles),
                            @"TooManyFieldLevelEncryptionQueryArgProfiles" : @(AWSCloudfrontErrorTooManyFieldLevelEncryptionQueryArgProfiles),
                            @"TooManyHeadersInForwardedValues" : @(AWSCloudfrontErrorTooManyHeadersInForwardedValues),
                            @"TooManyInvalidationsInProgress" : @(AWSCloudfrontErrorTooManyInvalidationsInProgress),
                            @"TooManyLambdaFunctionAssociations" : @(AWSCloudfrontErrorTooManyLambdaFunctionAssociations),
                            @"TooManyOriginCustomHeaders" : @(AWSCloudfrontErrorTooManyOriginCustomHeaders),
                            @"TooManyOriginGroupsPerDistribution" : @(AWSCloudfrontErrorTooManyOriginGroupsPerDistribution),
                            @"TooManyOrigins" : @(AWSCloudfrontErrorTooManyOrigins),
                            @"TooManyPublicKeys" : @(AWSCloudfrontErrorTooManyPublicKeys),
                            @"TooManyQueryStringParameters" : @(AWSCloudfrontErrorTooManyQueryStringParameters),
                            @"TooManyStreamingDistributionCNAMEs" : @(AWSCloudfrontErrorTooManyStreamingDistributionCNAMEs),
                            @"TooManyStreamingDistributions" : @(AWSCloudfrontErrorTooManyStreamingDistributions),
                            @"TooManyTrustedSigners" : @(AWSCloudfrontErrorTooManyTrustedSigners),
                            @"TrustedSignerDoesNotExist" : @(AWSCloudfrontErrorTrustedSignerDoesNotExist),
                            };
}

#pragma mark -

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
                originalRequest:(NSURLRequest *)originalRequest
                 currentRequest:(NSURLRequest *)currentRequest
                           data:(id)data
                          error:(NSError *__autoreleasing *)error {
    id responseObject = [super responseObjectForResponse:response
                                         originalRequest:originalRequest
                                          currentRequest:currentRequest
                                                    data:data
                                                   error:error];
    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
    	if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
	        if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSCloudfrontErrorDomain
	                                             code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        } else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSCognitoIdentityErrorDomain
	                                             code:AWSCognitoIdentityErrorUnknown
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        }
    	}
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSCloudfrontErrorDomain
                                     code:AWSCloudfrontErrorUnknown
                                 userInfo:nil];
    }

    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
        if (self.outputClass) {
            responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
                                          fromJSONDictionary:responseObject
                                                       error:error];
        }
    }
	
    return responseObject;
}

@end

@interface AWSCloudfrontRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCloudfrontRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSCloudfront()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSCloudfront

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSCloudfrontSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSCloudfront versions need to match. Check your SDK installation. AWSCore: %@ AWSCloudfront: %@", AWSiOSSDKVersion, AWSCloudfrontSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCloudfront {
    static AWSCloudfront *_defaultCloudfront = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCloudfront];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `awsconfiguration.json`, `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultCloudfront = [[AWSCloudfront alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCloudfront;
}

+ (void)registerCloudfrontWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCloudfront alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CloudfrontForKey:(NSString *)key {
    @synchronized(self) {
        AWSCloudfront *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCloudfront
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCloudfront registerCloudfrontWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeCloudfrontForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCloudfront` or `+ CloudfrontForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCloudfront
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceCloudfront];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSCloudfrontRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
        _networking = [[AWSNetworking alloc] initWithConfiguration:_configuration];
    }
    
    return self;
}

- (AWSTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AWSHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    
    @autoreleasepool {
        if (!request) {
            request = [AWSRequest new];
        }

        AWSNetworkingRequest *networkingRequest = request.internalRequest;
        if (request) {
            networkingRequest.parameters = [[AWSMTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
        } else {
            networkingRequest.parameters = @{};
        }

        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSXMLRequestSerializer alloc] initWithJSONDefinition:[[AWSCloudfrontResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSCloudfrontResponseSerializer alloc] initWithJSONDefinition:[[AWSCloudfrontResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult *> *)createCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/origin-access-identity/cloudfront"
                  targetPrefix:@""
                 operationName:@"CreateCloudFrontOriginAccessIdentity2019_03_26"
                   outputClass:[AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult class]];
}

- (void)createCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontCreateCloudFrontOriginAccessIdentityRequest *)request
     completionHandler:(void (^)(AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult *response, NSError *error))completionHandler {
    [[self createCloudFrontOriginAccessIdentity2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult *> * _Nonnull task) {
        AWSCloudfrontCreateCloudFrontOriginAccessIdentityResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontCreateDistributionResult *> *)createDistribution2019_03_26:(AWSCloudfrontCreateDistributionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/distribution"
                  targetPrefix:@""
                 operationName:@"CreateDistribution2019_03_26"
                   outputClass:[AWSCloudfrontCreateDistributionResult class]];
}

- (void)createDistribution2019_03_26:(AWSCloudfrontCreateDistributionRequest *)request
     completionHandler:(void (^)(AWSCloudfrontCreateDistributionResult *response, NSError *error))completionHandler {
    [[self createDistribution2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontCreateDistributionResult *> * _Nonnull task) {
        AWSCloudfrontCreateDistributionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontCreateDistributionWithTagsResult *> *)createDistributionWithTags2019_03_26:(AWSCloudfrontCreateDistributionWithTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/distribution?WithTags"
                  targetPrefix:@""
                 operationName:@"CreateDistributionWithTags2019_03_26"
                   outputClass:[AWSCloudfrontCreateDistributionWithTagsResult class]];
}

- (void)createDistributionWithTags2019_03_26:(AWSCloudfrontCreateDistributionWithTagsRequest *)request
     completionHandler:(void (^)(AWSCloudfrontCreateDistributionWithTagsResult *response, NSError *error))completionHandler {
    [[self createDistributionWithTags2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontCreateDistributionWithTagsResult *> * _Nonnull task) {
        AWSCloudfrontCreateDistributionWithTagsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontCreateFieldLevelEncryptionConfigResult *> *)createFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontCreateFieldLevelEncryptionConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/field-level-encryption"
                  targetPrefix:@""
                 operationName:@"CreateFieldLevelEncryptionConfig2019_03_26"
                   outputClass:[AWSCloudfrontCreateFieldLevelEncryptionConfigResult class]];
}

- (void)createFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontCreateFieldLevelEncryptionConfigRequest *)request
     completionHandler:(void (^)(AWSCloudfrontCreateFieldLevelEncryptionConfigResult *response, NSError *error))completionHandler {
    [[self createFieldLevelEncryptionConfig2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontCreateFieldLevelEncryptionConfigResult *> * _Nonnull task) {
        AWSCloudfrontCreateFieldLevelEncryptionConfigResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontCreateFieldLevelEncryptionProfileResult *> *)createFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontCreateFieldLevelEncryptionProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/field-level-encryption-profile"
                  targetPrefix:@""
                 operationName:@"CreateFieldLevelEncryptionProfile2019_03_26"
                   outputClass:[AWSCloudfrontCreateFieldLevelEncryptionProfileResult class]];
}

- (void)createFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontCreateFieldLevelEncryptionProfileRequest *)request
     completionHandler:(void (^)(AWSCloudfrontCreateFieldLevelEncryptionProfileResult *response, NSError *error))completionHandler {
    [[self createFieldLevelEncryptionProfile2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontCreateFieldLevelEncryptionProfileResult *> * _Nonnull task) {
        AWSCloudfrontCreateFieldLevelEncryptionProfileResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontCreateInvalidationResult *> *)createInvalidation2019_03_26:(AWSCloudfrontCreateInvalidationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/distribution/{DistributionId}/invalidation"
                  targetPrefix:@""
                 operationName:@"CreateInvalidation2019_03_26"
                   outputClass:[AWSCloudfrontCreateInvalidationResult class]];
}

- (void)createInvalidation2019_03_26:(AWSCloudfrontCreateInvalidationRequest *)request
     completionHandler:(void (^)(AWSCloudfrontCreateInvalidationResult *response, NSError *error))completionHandler {
    [[self createInvalidation2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontCreateInvalidationResult *> * _Nonnull task) {
        AWSCloudfrontCreateInvalidationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontCreatePublicKeyResult *> *)createPublicKey2019_03_26:(AWSCloudfrontCreatePublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/public-key"
                  targetPrefix:@""
                 operationName:@"CreatePublicKey2019_03_26"
                   outputClass:[AWSCloudfrontCreatePublicKeyResult class]];
}

- (void)createPublicKey2019_03_26:(AWSCloudfrontCreatePublicKeyRequest *)request
     completionHandler:(void (^)(AWSCloudfrontCreatePublicKeyResult *response, NSError *error))completionHandler {
    [[self createPublicKey2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontCreatePublicKeyResult *> * _Nonnull task) {
        AWSCloudfrontCreatePublicKeyResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontCreateStreamingDistributionResult *> *)createStreamingDistribution2019_03_26:(AWSCloudfrontCreateStreamingDistributionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/streaming-distribution"
                  targetPrefix:@""
                 operationName:@"CreateStreamingDistribution2019_03_26"
                   outputClass:[AWSCloudfrontCreateStreamingDistributionResult class]];
}

- (void)createStreamingDistribution2019_03_26:(AWSCloudfrontCreateStreamingDistributionRequest *)request
     completionHandler:(void (^)(AWSCloudfrontCreateStreamingDistributionResult *response, NSError *error))completionHandler {
    [[self createStreamingDistribution2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontCreateStreamingDistributionResult *> * _Nonnull task) {
        AWSCloudfrontCreateStreamingDistributionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontCreateStreamingDistributionWithTagsResult *> *)createStreamingDistributionWithTags2019_03_26:(AWSCloudfrontCreateStreamingDistributionWithTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/streaming-distribution?WithTags"
                  targetPrefix:@""
                 operationName:@"CreateStreamingDistributionWithTags2019_03_26"
                   outputClass:[AWSCloudfrontCreateStreamingDistributionWithTagsResult class]];
}

- (void)createStreamingDistributionWithTags2019_03_26:(AWSCloudfrontCreateStreamingDistributionWithTagsRequest *)request
     completionHandler:(void (^)(AWSCloudfrontCreateStreamingDistributionWithTagsResult *response, NSError *error))completionHandler {
    [[self createStreamingDistributionWithTags2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontCreateStreamingDistributionWithTagsResult *> * _Nonnull task) {
        AWSCloudfrontCreateStreamingDistributionWithTagsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2019-03-26/origin-access-identity/cloudfront/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteCloudFrontOriginAccessIdentity2019_03_26"
                   outputClass:nil];
}

- (void)deleteCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontDeleteCloudFrontOriginAccessIdentityRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCloudFrontOriginAccessIdentity2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDistribution2019_03_26:(AWSCloudfrontDeleteDistributionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2019-03-26/distribution/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteDistribution2019_03_26"
                   outputClass:nil];
}

- (void)deleteDistribution2019_03_26:(AWSCloudfrontDeleteDistributionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDistribution2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2019-03-26/field-level-encryption/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteFieldLevelEncryptionConfig2019_03_26"
                   outputClass:nil];
}

- (void)deleteFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontDeleteFieldLevelEncryptionConfigRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteFieldLevelEncryptionConfig2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2019-03-26/field-level-encryption-profile/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteFieldLevelEncryptionProfile2019_03_26"
                   outputClass:nil];
}

- (void)deleteFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontDeleteFieldLevelEncryptionProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteFieldLevelEncryptionProfile2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePublicKey2019_03_26:(AWSCloudfrontDeletePublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2019-03-26/public-key/{Id}"
                  targetPrefix:@""
                 operationName:@"DeletePublicKey2019_03_26"
                   outputClass:nil];
}

- (void)deletePublicKey2019_03_26:(AWSCloudfrontDeletePublicKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePublicKey2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteStreamingDistribution2019_03_26:(AWSCloudfrontDeleteStreamingDistributionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2019-03-26/streaming-distribution/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteStreamingDistribution2019_03_26"
                   outputClass:nil];
}

- (void)deleteStreamingDistribution2019_03_26:(AWSCloudfrontDeleteStreamingDistributionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteStreamingDistribution2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetCloudFrontOriginAccessIdentityResult *> *)getCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/origin-access-identity/cloudfront/{Id}"
                  targetPrefix:@""
                 operationName:@"GetCloudFrontOriginAccessIdentity2019_03_26"
                   outputClass:[AWSCloudfrontGetCloudFrontOriginAccessIdentityResult class]];
}

- (void)getCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontGetCloudFrontOriginAccessIdentityRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetCloudFrontOriginAccessIdentityResult *response, NSError *error))completionHandler {
    [[self getCloudFrontOriginAccessIdentity2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetCloudFrontOriginAccessIdentityResult *> * _Nonnull task) {
        AWSCloudfrontGetCloudFrontOriginAccessIdentityResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult *> *)getCloudFrontOriginAccessIdentityConfig2019_03_26:(AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/origin-access-identity/cloudfront/{Id}/config"
                  targetPrefix:@""
                 operationName:@"GetCloudFrontOriginAccessIdentityConfig2019_03_26"
                   outputClass:[AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult class]];
}

- (void)getCloudFrontOriginAccessIdentityConfig2019_03_26:(AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult *response, NSError *error))completionHandler {
    [[self getCloudFrontOriginAccessIdentityConfig2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult *> * _Nonnull task) {
        AWSCloudfrontGetCloudFrontOriginAccessIdentityConfigResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetDistributionResult *> *)getDistribution2019_03_26:(AWSCloudfrontGetDistributionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/distribution/{Id}"
                  targetPrefix:@""
                 operationName:@"GetDistribution2019_03_26"
                   outputClass:[AWSCloudfrontGetDistributionResult class]];
}

- (void)getDistribution2019_03_26:(AWSCloudfrontGetDistributionRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetDistributionResult *response, NSError *error))completionHandler {
    [[self getDistribution2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetDistributionResult *> * _Nonnull task) {
        AWSCloudfrontGetDistributionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetDistributionConfigResult *> *)getDistributionConfig2019_03_26:(AWSCloudfrontGetDistributionConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/distribution/{Id}/config"
                  targetPrefix:@""
                 operationName:@"GetDistributionConfig2019_03_26"
                   outputClass:[AWSCloudfrontGetDistributionConfigResult class]];
}

- (void)getDistributionConfig2019_03_26:(AWSCloudfrontGetDistributionConfigRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetDistributionConfigResult *response, NSError *error))completionHandler {
    [[self getDistributionConfig2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetDistributionConfigResult *> * _Nonnull task) {
        AWSCloudfrontGetDistributionConfigResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetFieldLevelEncryptionResult *> *)getFieldLevelEncryption2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/field-level-encryption/{Id}"
                  targetPrefix:@""
                 operationName:@"GetFieldLevelEncryption2019_03_26"
                   outputClass:[AWSCloudfrontGetFieldLevelEncryptionResult class]];
}

- (void)getFieldLevelEncryption2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetFieldLevelEncryptionResult *response, NSError *error))completionHandler {
    [[self getFieldLevelEncryption2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetFieldLevelEncryptionResult *> * _Nonnull task) {
        AWSCloudfrontGetFieldLevelEncryptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetFieldLevelEncryptionConfigResult *> *)getFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/field-level-encryption/{Id}/config"
                  targetPrefix:@""
                 operationName:@"GetFieldLevelEncryptionConfig2019_03_26"
                   outputClass:[AWSCloudfrontGetFieldLevelEncryptionConfigResult class]];
}

- (void)getFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionConfigRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetFieldLevelEncryptionConfigResult *response, NSError *error))completionHandler {
    [[self getFieldLevelEncryptionConfig2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetFieldLevelEncryptionConfigResult *> * _Nonnull task) {
        AWSCloudfrontGetFieldLevelEncryptionConfigResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetFieldLevelEncryptionProfileResult *> *)getFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/field-level-encryption-profile/{Id}"
                  targetPrefix:@""
                 operationName:@"GetFieldLevelEncryptionProfile2019_03_26"
                   outputClass:[AWSCloudfrontGetFieldLevelEncryptionProfileResult class]];
}

- (void)getFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionProfileRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetFieldLevelEncryptionProfileResult *response, NSError *error))completionHandler {
    [[self getFieldLevelEncryptionProfile2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetFieldLevelEncryptionProfileResult *> * _Nonnull task) {
        AWSCloudfrontGetFieldLevelEncryptionProfileResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult *> *)getFieldLevelEncryptionProfileConfig2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/field-level-encryption-profile/{Id}/config"
                  targetPrefix:@""
                 operationName:@"GetFieldLevelEncryptionProfileConfig2019_03_26"
                   outputClass:[AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult class]];
}

- (void)getFieldLevelEncryptionProfileConfig2019_03_26:(AWSCloudfrontGetFieldLevelEncryptionProfileConfigRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult *response, NSError *error))completionHandler {
    [[self getFieldLevelEncryptionProfileConfig2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult *> * _Nonnull task) {
        AWSCloudfrontGetFieldLevelEncryptionProfileConfigResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetInvalidationResult *> *)getInvalidation2019_03_26:(AWSCloudfrontGetInvalidationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/distribution/{DistributionId}/invalidation/{Id}"
                  targetPrefix:@""
                 operationName:@"GetInvalidation2019_03_26"
                   outputClass:[AWSCloudfrontGetInvalidationResult class]];
}

- (void)getInvalidation2019_03_26:(AWSCloudfrontGetInvalidationRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetInvalidationResult *response, NSError *error))completionHandler {
    [[self getInvalidation2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetInvalidationResult *> * _Nonnull task) {
        AWSCloudfrontGetInvalidationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetPublicKeyResult *> *)getPublicKey2019_03_26:(AWSCloudfrontGetPublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/public-key/{Id}"
                  targetPrefix:@""
                 operationName:@"GetPublicKey2019_03_26"
                   outputClass:[AWSCloudfrontGetPublicKeyResult class]];
}

- (void)getPublicKey2019_03_26:(AWSCloudfrontGetPublicKeyRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetPublicKeyResult *response, NSError *error))completionHandler {
    [[self getPublicKey2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetPublicKeyResult *> * _Nonnull task) {
        AWSCloudfrontGetPublicKeyResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetPublicKeyConfigResult *> *)getPublicKeyConfig2019_03_26:(AWSCloudfrontGetPublicKeyConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/public-key/{Id}/config"
                  targetPrefix:@""
                 operationName:@"GetPublicKeyConfig2019_03_26"
                   outputClass:[AWSCloudfrontGetPublicKeyConfigResult class]];
}

- (void)getPublicKeyConfig2019_03_26:(AWSCloudfrontGetPublicKeyConfigRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetPublicKeyConfigResult *response, NSError *error))completionHandler {
    [[self getPublicKeyConfig2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetPublicKeyConfigResult *> * _Nonnull task) {
        AWSCloudfrontGetPublicKeyConfigResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetStreamingDistributionResult *> *)getStreamingDistribution2019_03_26:(AWSCloudfrontGetStreamingDistributionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/streaming-distribution/{Id}"
                  targetPrefix:@""
                 operationName:@"GetStreamingDistribution2019_03_26"
                   outputClass:[AWSCloudfrontGetStreamingDistributionResult class]];
}

- (void)getStreamingDistribution2019_03_26:(AWSCloudfrontGetStreamingDistributionRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetStreamingDistributionResult *response, NSError *error))completionHandler {
    [[self getStreamingDistribution2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetStreamingDistributionResult *> * _Nonnull task) {
        AWSCloudfrontGetStreamingDistributionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontGetStreamingDistributionConfigResult *> *)getStreamingDistributionConfig2019_03_26:(AWSCloudfrontGetStreamingDistributionConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/streaming-distribution/{Id}/config"
                  targetPrefix:@""
                 operationName:@"GetStreamingDistributionConfig2019_03_26"
                   outputClass:[AWSCloudfrontGetStreamingDistributionConfigResult class]];
}

- (void)getStreamingDistributionConfig2019_03_26:(AWSCloudfrontGetStreamingDistributionConfigRequest *)request
     completionHandler:(void (^)(AWSCloudfrontGetStreamingDistributionConfigResult *response, NSError *error))completionHandler {
    [[self getStreamingDistributionConfig2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontGetStreamingDistributionConfigResult *> * _Nonnull task) {
        AWSCloudfrontGetStreamingDistributionConfigResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult *> *)listCloudFrontOriginAccessIdentities2019_03_26:(AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/origin-access-identity/cloudfront"
                  targetPrefix:@""
                 operationName:@"ListCloudFrontOriginAccessIdentities2019_03_26"
                   outputClass:[AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult class]];
}

- (void)listCloudFrontOriginAccessIdentities2019_03_26:(AWSCloudfrontListCloudFrontOriginAccessIdentitiesRequest *)request
     completionHandler:(void (^)(AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult *response, NSError *error))completionHandler {
    [[self listCloudFrontOriginAccessIdentities2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult *> * _Nonnull task) {
        AWSCloudfrontListCloudFrontOriginAccessIdentitiesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontListDistributionsResult *> *)listDistributions2019_03_26:(AWSCloudfrontListDistributionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/distribution"
                  targetPrefix:@""
                 operationName:@"ListDistributions2019_03_26"
                   outputClass:[AWSCloudfrontListDistributionsResult class]];
}

- (void)listDistributions2019_03_26:(AWSCloudfrontListDistributionsRequest *)request
     completionHandler:(void (^)(AWSCloudfrontListDistributionsResult *response, NSError *error))completionHandler {
    [[self listDistributions2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontListDistributionsResult *> * _Nonnull task) {
        AWSCloudfrontListDistributionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontListDistributionsByWebACLIdResult *> *)listDistributionsByWebACLId2019_03_26:(AWSCloudfrontListDistributionsByWebACLIdRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/distributionsByWebACLId/{WebACLId}"
                  targetPrefix:@""
                 operationName:@"ListDistributionsByWebACLId2019_03_26"
                   outputClass:[AWSCloudfrontListDistributionsByWebACLIdResult class]];
}

- (void)listDistributionsByWebACLId2019_03_26:(AWSCloudfrontListDistributionsByWebACLIdRequest *)request
     completionHandler:(void (^)(AWSCloudfrontListDistributionsByWebACLIdResult *response, NSError *error))completionHandler {
    [[self listDistributionsByWebACLId2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontListDistributionsByWebACLIdResult *> * _Nonnull task) {
        AWSCloudfrontListDistributionsByWebACLIdResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontListFieldLevelEncryptionConfigsResult *> *)listFieldLevelEncryptionConfigs2019_03_26:(AWSCloudfrontListFieldLevelEncryptionConfigsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/field-level-encryption"
                  targetPrefix:@""
                 operationName:@"ListFieldLevelEncryptionConfigs2019_03_26"
                   outputClass:[AWSCloudfrontListFieldLevelEncryptionConfigsResult class]];
}

- (void)listFieldLevelEncryptionConfigs2019_03_26:(AWSCloudfrontListFieldLevelEncryptionConfigsRequest *)request
     completionHandler:(void (^)(AWSCloudfrontListFieldLevelEncryptionConfigsResult *response, NSError *error))completionHandler {
    [[self listFieldLevelEncryptionConfigs2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontListFieldLevelEncryptionConfigsResult *> * _Nonnull task) {
        AWSCloudfrontListFieldLevelEncryptionConfigsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontListFieldLevelEncryptionProfilesResult *> *)listFieldLevelEncryptionProfiles2019_03_26:(AWSCloudfrontListFieldLevelEncryptionProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/field-level-encryption-profile"
                  targetPrefix:@""
                 operationName:@"ListFieldLevelEncryptionProfiles2019_03_26"
                   outputClass:[AWSCloudfrontListFieldLevelEncryptionProfilesResult class]];
}

- (void)listFieldLevelEncryptionProfiles2019_03_26:(AWSCloudfrontListFieldLevelEncryptionProfilesRequest *)request
     completionHandler:(void (^)(AWSCloudfrontListFieldLevelEncryptionProfilesResult *response, NSError *error))completionHandler {
    [[self listFieldLevelEncryptionProfiles2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontListFieldLevelEncryptionProfilesResult *> * _Nonnull task) {
        AWSCloudfrontListFieldLevelEncryptionProfilesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontListInvalidationsResult *> *)listInvalidations2019_03_26:(AWSCloudfrontListInvalidationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/distribution/{DistributionId}/invalidation"
                  targetPrefix:@""
                 operationName:@"ListInvalidations2019_03_26"
                   outputClass:[AWSCloudfrontListInvalidationsResult class]];
}

- (void)listInvalidations2019_03_26:(AWSCloudfrontListInvalidationsRequest *)request
     completionHandler:(void (^)(AWSCloudfrontListInvalidationsResult *response, NSError *error))completionHandler {
    [[self listInvalidations2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontListInvalidationsResult *> * _Nonnull task) {
        AWSCloudfrontListInvalidationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontListPublicKeysResult *> *)listPublicKeys2019_03_26:(AWSCloudfrontListPublicKeysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/public-key"
                  targetPrefix:@""
                 operationName:@"ListPublicKeys2019_03_26"
                   outputClass:[AWSCloudfrontListPublicKeysResult class]];
}

- (void)listPublicKeys2019_03_26:(AWSCloudfrontListPublicKeysRequest *)request
     completionHandler:(void (^)(AWSCloudfrontListPublicKeysResult *response, NSError *error))completionHandler {
    [[self listPublicKeys2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontListPublicKeysResult *> * _Nonnull task) {
        AWSCloudfrontListPublicKeysResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontListStreamingDistributionsResult *> *)listStreamingDistributions2019_03_26:(AWSCloudfrontListStreamingDistributionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/streaming-distribution"
                  targetPrefix:@""
                 operationName:@"ListStreamingDistributions2019_03_26"
                   outputClass:[AWSCloudfrontListStreamingDistributionsResult class]];
}

- (void)listStreamingDistributions2019_03_26:(AWSCloudfrontListStreamingDistributionsRequest *)request
     completionHandler:(void (^)(AWSCloudfrontListStreamingDistributionsResult *response, NSError *error))completionHandler {
    [[self listStreamingDistributions2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontListStreamingDistributionsResult *> * _Nonnull task) {
        AWSCloudfrontListStreamingDistributionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontListTagsForResourceResult *> *)listTagsForResource2019_03_26:(AWSCloudfrontListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-03-26/tagging"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource2019_03_26"
                   outputClass:[AWSCloudfrontListTagsForResourceResult class]];
}

- (void)listTagsForResource2019_03_26:(AWSCloudfrontListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSCloudfrontListTagsForResourceResult *response, NSError *error))completionHandler {
    [[self listTagsForResource2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontListTagsForResourceResult *> * _Nonnull task) {
        AWSCloudfrontListTagsForResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource2019_03_26:(AWSCloudfrontTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/tagging?Operation=Tag"
                  targetPrefix:@""
                 operationName:@"TagResource2019_03_26"
                   outputClass:nil];
}

- (void)tagResource2019_03_26:(AWSCloudfrontTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource2019_03_26:(AWSCloudfrontUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-03-26/tagging?Operation=Untag"
                  targetPrefix:@""
                 operationName:@"UntagResource2019_03_26"
                   outputClass:nil];
}

- (void)untagResource2019_03_26:(AWSCloudfrontUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult *> *)updateCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2019-03-26/origin-access-identity/cloudfront/{Id}/config"
                  targetPrefix:@""
                 operationName:@"UpdateCloudFrontOriginAccessIdentity2019_03_26"
                   outputClass:[AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult class]];
}

- (void)updateCloudFrontOriginAccessIdentity2019_03_26:(AWSCloudfrontUpdateCloudFrontOriginAccessIdentityRequest *)request
     completionHandler:(void (^)(AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult *response, NSError *error))completionHandler {
    [[self updateCloudFrontOriginAccessIdentity2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult *> * _Nonnull task) {
        AWSCloudfrontUpdateCloudFrontOriginAccessIdentityResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontUpdateDistributionResult *> *)updateDistribution2019_03_26:(AWSCloudfrontUpdateDistributionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2019-03-26/distribution/{Id}/config"
                  targetPrefix:@""
                 operationName:@"UpdateDistribution2019_03_26"
                   outputClass:[AWSCloudfrontUpdateDistributionResult class]];
}

- (void)updateDistribution2019_03_26:(AWSCloudfrontUpdateDistributionRequest *)request
     completionHandler:(void (^)(AWSCloudfrontUpdateDistributionResult *response, NSError *error))completionHandler {
    [[self updateDistribution2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontUpdateDistributionResult *> * _Nonnull task) {
        AWSCloudfrontUpdateDistributionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontUpdateFieldLevelEncryptionConfigResult *> *)updateFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2019-03-26/field-level-encryption/{Id}/config"
                  targetPrefix:@""
                 operationName:@"UpdateFieldLevelEncryptionConfig2019_03_26"
                   outputClass:[AWSCloudfrontUpdateFieldLevelEncryptionConfigResult class]];
}

- (void)updateFieldLevelEncryptionConfig2019_03_26:(AWSCloudfrontUpdateFieldLevelEncryptionConfigRequest *)request
     completionHandler:(void (^)(AWSCloudfrontUpdateFieldLevelEncryptionConfigResult *response, NSError *error))completionHandler {
    [[self updateFieldLevelEncryptionConfig2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontUpdateFieldLevelEncryptionConfigResult *> * _Nonnull task) {
        AWSCloudfrontUpdateFieldLevelEncryptionConfigResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontUpdateFieldLevelEncryptionProfileResult *> *)updateFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2019-03-26/field-level-encryption-profile/{Id}/config"
                  targetPrefix:@""
                 operationName:@"UpdateFieldLevelEncryptionProfile2019_03_26"
                   outputClass:[AWSCloudfrontUpdateFieldLevelEncryptionProfileResult class]];
}

- (void)updateFieldLevelEncryptionProfile2019_03_26:(AWSCloudfrontUpdateFieldLevelEncryptionProfileRequest *)request
     completionHandler:(void (^)(AWSCloudfrontUpdateFieldLevelEncryptionProfileResult *response, NSError *error))completionHandler {
    [[self updateFieldLevelEncryptionProfile2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontUpdateFieldLevelEncryptionProfileResult *> * _Nonnull task) {
        AWSCloudfrontUpdateFieldLevelEncryptionProfileResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontUpdatePublicKeyResult *> *)updatePublicKey2019_03_26:(AWSCloudfrontUpdatePublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2019-03-26/public-key/{Id}/config"
                  targetPrefix:@""
                 operationName:@"UpdatePublicKey2019_03_26"
                   outputClass:[AWSCloudfrontUpdatePublicKeyResult class]];
}

- (void)updatePublicKey2019_03_26:(AWSCloudfrontUpdatePublicKeyRequest *)request
     completionHandler:(void (^)(AWSCloudfrontUpdatePublicKeyResult *response, NSError *error))completionHandler {
    [[self updatePublicKey2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontUpdatePublicKeyResult *> * _Nonnull task) {
        AWSCloudfrontUpdatePublicKeyResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudfrontUpdateStreamingDistributionResult *> *)updateStreamingDistribution2019_03_26:(AWSCloudfrontUpdateStreamingDistributionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2019-03-26/streaming-distribution/{Id}/config"
                  targetPrefix:@""
                 operationName:@"UpdateStreamingDistribution2019_03_26"
                   outputClass:[AWSCloudfrontUpdateStreamingDistributionResult class]];
}

- (void)updateStreamingDistribution2019_03_26:(AWSCloudfrontUpdateStreamingDistributionRequest *)request
     completionHandler:(void (^)(AWSCloudfrontUpdateStreamingDistributionResult *response, NSError *error))completionHandler {
    [[self updateStreamingDistribution2019_03_26:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudfrontUpdateStreamingDistributionResult *> * _Nonnull task) {
        AWSCloudfrontUpdateStreamingDistributionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
