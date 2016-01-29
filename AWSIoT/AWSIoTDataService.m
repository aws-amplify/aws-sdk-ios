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

#import "AWSIoTDataService.h"
#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSNetworking.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSIoTDataResources.h"

@interface AWSIoTDataResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSIoTDataResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSIoTDataErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSIoTDataErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSIoTDataErrorMissingAuthenticationToken),
                            @"ConflictException" : @(AWSIoTDataErrorConflict),
                            @"InternalFailureException" : @(AWSIoTDataErrorInternalFailure),
                            @"InvalidRequestException" : @(AWSIoTDataErrorInvalidRequest),
                            @"MethodNotAllowedException" : @(AWSIoTDataErrorMethodNotAllowed),
                            @"RequestEntityTooLargeException" : @(AWSIoTDataErrorRequestEntityTooLarge),
                            @"ResourceNotFoundException" : @(AWSIoTDataErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSIoTDataErrorServiceUnavailable),
                            @"ThrottlingException" : @(AWSIoTDataErrorThrottling),
                            @"UnauthorizedException" : @(AWSIoTDataErrorUnauthorized),
                            @"UnsupportedDocumentEncodingException" : @(AWSIoTDataErrorUnsupportedDocumentEncoding),
                            };
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
        NSString *errorTypeStr = [[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"];
        NSString *errorTypeHeader = [[errorTypeStr componentsSeparatedByString:@":"] firstObject];

        if ([errorTypeStr length] > 0 && errorTypeHeader) {
            if (errorCodeDictionary[errorTypeHeader]) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeStr};
                    *error = [NSError errorWithDomain:AWSIoTDataErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeStr};
                    *error = [NSError errorWithDomain:AWSIoTDataErrorDomain
                                                 code:AWSIoTDataErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }

        if (self.outputClass) {
            responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
                                          fromJSONDictionary:responseObject
                                                       error:error];
        }
    }

    return responseObject;
}

@end

@interface AWSIoTDataRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSIoTDataRequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry &&
       currentRetryCount < self.maxRetryCount) {
        if ([error.domain isEqualToString:AWSIoTDataErrorDomain]) {
            switch (error.code) {
                case AWSIoTDataErrorIncompleteSignature:
                case AWSIoTDataErrorInvalidClientTokenId:
                case AWSIoTDataErrorMissingAuthenticationToken:
                    retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                    break;

                default:
                    break;
            }
        } else if ([error.domain isEqualToString:AWSGeneralErrorDomain]) {
            switch (error.code) {
                case AWSGeneralErrorSignatureDoesNotMatch:
                    retryType = AWSNetworkingRetryTypeShouldCorrectClockSkewAndRetry;
                    break;

                default:
                    break;
            }
        }
    }

    return retryType;
}

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSIoTData()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSIoTData

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultIoTData {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    static AWSIoTData *_defaultIoTData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultIoTData = [[AWSIoTData alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultIoTData;
}

+ (void)registerIoTDataWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSIoTData alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)IoTDataForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeIoTDataForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultIoTData` or `+ IoTDataForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                service:AWSServiceIoTData
                                           useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestSerializer = [AWSJSONRequestSerializer new];
        _configuration.retryHandler = [[AWSIoTDataRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.1"};

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
    if (!request) {
        request = [AWSRequest new];
    }

    AWSNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[AWSMTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }


    NSMutableDictionary *headers = [NSMutableDictionary new];

    networkingRequest.headers = headers;
    networkingRequest.HTTPMethod = HTTPMethod;
    networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSIoTDataResources sharedInstance] JSONObject]
                                                                                        actionName:operationName];
    networkingRequest.responseSerializer = [[AWSIoTDataResponseSerializer alloc] initWithJSONDefinition:[[AWSIoTDataResources sharedInstance] JSONObject]
                                                                                                 actionName:operationName
                                                                                                outputClass:outputClass];
    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (AWSTask<AWSIoTDataDeleteThingShadowResponse *> *)deleteThingShadow:(AWSIoTDataDeleteThingShadowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/things/{thingName}/shadow"
                  targetPrefix:@""
                 operationName:@"DeleteThingShadow"
                   outputClass:[AWSIoTDataDeleteThingShadowResponse class]];
}

- (void)deleteThingShadow:(AWSIoTDataDeleteThingShadowRequest *)request
        completionHandler:(void (^)(AWSIoTDataDeleteThingShadowResponse *response, NSError *error))completionHandler {
    [[self deleteThingShadow:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDataDeleteThingShadowResponse *> * _Nonnull task) {
        AWSIoTDataDeleteThingShadowResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDataGetThingShadowResponse *> *)getThingShadow:(AWSIoTDataGetThingShadowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/things/{thingName}/shadow"
                  targetPrefix:@""
                 operationName:@"GetThingShadow"
                   outputClass:[AWSIoTDataGetThingShadowResponse class]];
}

- (void)getThingShadow:(AWSIoTDataGetThingShadowRequest *)request
     completionHandler:(void (^)(AWSIoTDataGetThingShadowResponse *response, NSError *error))completionHandler {
    [[self getThingShadow:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDataGetThingShadowResponse *> * _Nonnull task) {
        AWSIoTDataGetThingShadowResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)publish:(AWSIoTDataPublishRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/topics/{topic}"
                  targetPrefix:@""
                 operationName:@"Publish"
                   outputClass:nil];
}

- (void)publish:(AWSIoTDataPublishRequest *)request
completionHandler:(void (^)(NSError *error))completionHandler {
    [[self publish:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDataUpdateThingShadowResponse *> *)updateThingShadow:(AWSIoTDataUpdateThingShadowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/things/{thingName}/shadow"
                  targetPrefix:@""
                 operationName:@"UpdateThingShadow"
                   outputClass:[AWSIoTDataUpdateThingShadowResponse class]];
}

- (void)updateThingShadow:(AWSIoTDataUpdateThingShadowRequest *)request
        completionHandler:(void (^)(AWSIoTDataUpdateThingShadowResponse *response, NSError *error))completionHandler {
    [[self updateThingShadow:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDataUpdateThingShadowResponse *> * _Nonnull task) {
        AWSIoTDataUpdateThingShadowResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }
        
        return nil;
    }];
}

@end
