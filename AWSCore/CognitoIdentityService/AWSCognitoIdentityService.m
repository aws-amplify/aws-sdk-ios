/**
 * Copyright 2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 */

#import "AWSCognitoIdentityService.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSNetworking.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"

NSString *const AWSCIBDefinitionFileName = @"cib-2014-06-30";

@interface AWSCognitoIdentityServiceResponseSerializer : AWSJSONResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

@end

@implementation AWSCognitoIdentityServiceResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSCognitoIdentityServiceErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSCognitoIdentityServiceErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSCognitoIdentityServiceErrorMissingAuthenticationToken),
                            @"InternalErrorException" : @(AWSCognitoIdentityServiceErrorInternalError),
                            @"InvalidParameterException" : @(AWSCognitoIdentityServiceErrorInvalidParameter),
                            @"LimitExceededException" : @(AWSCognitoIdentityServiceErrorLimitExceeded),
                            @"NotAuthorizedException" : @(AWSCognitoIdentityServiceErrorNotAuthorized),
                            @"ResourceConflictException" : @(AWSCognitoIdentityServiceErrorResourceConflict),
                            @"ResourceNotFoundException" : @(AWSCognitoIdentityServiceErrorResourceNotFound),
                            @"TooManyRequestsException" : @(AWSCognitoIdentityServiceErrorTooManyRequests),
                            };
}

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSCognitoIdentityServiceResponseSerializer *serializer = [AWSCognitoIdentityServiceResponseSerializer serializerWithResource:resource actionName:actionName];
    serializer.outputClass = outputClass;

    return serializer;
}

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
        if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSCognitoIdentityServiceErrorDomain
                                             code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
                                         userInfo:responseObject];
            }
            return responseObject;
        } else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSCognitoIdentityServiceErrorDomain
                                             code:AWSCognitoIdentityServiceErrorUnknown
                                         userInfo:responseObject];
            }
            return responseObject;
        }

        if (self.outputClass) {
            responseObject = [MTLJSONAdapter modelOfClass:self.outputClass
                                       fromJSONDictionary:responseObject
                                                    error:error];
        }
    }

    return responseObject;
}

@end

@interface AWSCognitoIdentityServiceRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCognitoIdentityServiceRequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSCognitoIdentityServiceErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        switch (error.code) {
            case AWSCognitoIdentityServiceErrorIncompleteSignature:
            case AWSCognitoIdentityServiceErrorInvalidClientTokenId:
            case AWSCognitoIdentityServiceErrorMissingAuthenticationToken:
                retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                break;

            default:
                break;
        }
    }

    return retryType;
}

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSCognitoIdentityService()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@implementation AWSCognitoIdentityService

+ (instancetype)defaultCognitoIdentityService {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSCognitoIdentityService *_defaultCognitoIdentityService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultCognitoIdentityService = [[AWSCognitoIdentityService alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultCognitoIdentityService;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                                          service:AWSServiceCognitoIdentityBroker];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSCognitoIdentityServiceRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Host" : _configuration.endpoint.hostName,
                                   @"Content-Type" : @"application/x-amz-json-1.1"};

        _networking = [AWSNetworking networking:_configuration];
    }

    return self;
}

- (BFTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AWSHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    if (!request) {
        request = [AWSRequest new];
    }

    AWSNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[MTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }

    NSMutableDictionary *parameters = [NSMutableDictionary new];
    __block NSString *blockSafeURLString = [URLString copy];
    [networkingRequest.parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *stringToFind = [NSString stringWithFormat:@"{%@}", key];
        if ([blockSafeURLString rangeOfString:stringToFind].location == NSNotFound) {
            [parameters setObject:obj forKey:key];
        } else {
            blockSafeURLString = [blockSafeURLString stringByReplacingOccurrencesOfString:stringToFind
                                                                               withString:obj];
        }
    }];
    networkingRequest.parameters = parameters;

    NSMutableDictionary *headers = [NSMutableDictionary new];
    headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];

    networkingRequest.headers = headers;
    networkingRequest.URLString = blockSafeURLString;
    networkingRequest.HTTPMethod = HTTPMethod;
    networkingRequest.responseSerializer = [AWSCognitoIdentityServiceResponseSerializer serializerWithOutputClass:outputClass resource:AWSCIBDefinitionFileName actionName:operationName];
    networkingRequest.requestSerializer = [AWSJSONRequestSerializer serializerWithResource:AWSCIBDefinitionFileName actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)createIdentityPool:(AWSCognitoIdentityServiceCreateIdentityPoolInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"CreateIdentityPool"
                   outputClass:[AWSCognitoIdentityServiceIdentityPool class]];
}

- (BFTask *)deleteIdentityPool:(AWSCognitoIdentityServiceDeleteIdentityPoolInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"DeleteIdentityPool"
                   outputClass:nil];
}

- (BFTask *)describeIdentityPool:(AWSCognitoIdentityServiceDescribeIdentityPoolInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"DescribeIdentityPool"
                   outputClass:[AWSCognitoIdentityServiceIdentityPool class]];
}

- (BFTask *)getId:(AWSCognitoIdentityServiceGetIdInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"GetId"
                   outputClass:[AWSCognitoIdentityServiceGetIdResponse class]];
}

- (BFTask *)getOpenIdToken:(AWSCognitoIdentityServiceGetOpenIdTokenInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"GetOpenIdToken"
                   outputClass:[AWSCognitoIdentityServiceGetOpenIdTokenResponse class]];
}

- (BFTask *)listIdentities:(AWSCognitoIdentityServiceListIdentitiesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"ListIdentities"
                   outputClass:[AWSCognitoIdentityServiceListIdentitiesResponse class]];
}

- (BFTask *)listIdentityPools:(AWSCognitoIdentityServiceListIdentityPoolsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"ListIdentityPools"
                   outputClass:[AWSCognitoIdentityServiceListIdentityPoolsResponse class]];
}

- (BFTask *)unlinkIdentity:(AWSCognitoIdentityServiceUnlinkIdentityInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"UnlinkIdentity"
                   outputClass:nil];
}

- (BFTask *)updateIdentityPool:(AWSCognitoIdentityServiceIdentityPool *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"UpdateIdentityPool"
                   outputClass:[AWSCognitoIdentityServiceIdentityPool class]];
}

@end
