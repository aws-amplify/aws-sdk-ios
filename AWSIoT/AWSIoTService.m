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

#import "AWSIoTService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSIoTResources.h"

@interface AWSIoTResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSIoTResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSIoTErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSIoTErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSIoTErrorMissingAuthenticationToken),
                            @"CertificateStateException" : @(AWSIoTErrorCertificateState),
                            @"DeleteConflictException" : @(AWSIoTErrorDeleteConflict),
                            @"InternalException" : @(AWSIoTErrorInternal),
                            @"InternalFailureException" : @(AWSIoTErrorInternalFailure),
                            @"InvalidRequestException" : @(AWSIoTErrorInvalidRequest),
                            @"LimitExceededException" : @(AWSIoTErrorLimitExceeded),
                            @"MalformedPolicyException" : @(AWSIoTErrorMalformedPolicy),
                            @"ResourceAlreadyExistsException" : @(AWSIoTErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSIoTErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSIoTErrorServiceUnavailable),
                            @"SqlParseException" : @(AWSIoTErrorSqlParse),
                            @"ThrottlingException" : @(AWSIoTErrorThrottling),
                            @"TransferAlreadyCompletedException" : @(AWSIoTErrorTransferAlreadyCompleted),
                            @"TransferConflictException" : @(AWSIoTErrorTransferConflict),
                            @"UnauthorizedException" : @(AWSIoTErrorUnauthorized),
                            @"VersionsLimitExceededException" : @(AWSIoTErrorVersionsLimitExceeded),
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
                    *error = [NSError errorWithDomain:AWSIoTErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeStr};
                    *error = [NSError errorWithDomain:AWSIoTErrorDomain
                                                 code:AWSIoTErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSIoTErrorDomain
                                     code:AWSIoTErrorUnknown
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

@interface AWSIoTRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSIoTRequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSIoTErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        switch (error.code) {
            case AWSIoTErrorIncompleteSignature:
            case AWSIoTErrorInvalidClientTokenId:
            case AWSIoTErrorMissingAuthenticationToken:
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

@interface AWSIoT()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSIoT

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultIoT {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    static AWSIoT *_defaultIoT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultIoT = [[AWSIoT alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultIoT;
}

+ (void)registerIoTWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSIoT alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)IoTForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeIoTForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultIoT` or `+ IoTForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                service:AWSServiceIoT
                                           useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];
        
        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestSerializer = [AWSJSONRequestSerializer new];
        _configuration.retryHandler = [[AWSIoTRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.0"};

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
    networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSIoTResources sharedInstance] JSONObject]
                                                                                        actionName:operationName];
    networkingRequest.responseSerializer = [[AWSIoTResponseSerializer alloc] initWithJSONDefinition:[[AWSIoTResources sharedInstance] JSONObject]
                                                                                                 actionName:operationName
                                                                                                outputClass:outputClass];
    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (AWSTask *)acceptCertificateTransfer:(AWSIoTAcceptCertificateTransferRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/accept-certificate-transfer/{certificateId}"
                  targetPrefix:@""
                 operationName:@"AcceptCertificateTransfer"
                   outputClass:nil];
}

- (void)acceptCertificateTransfer:(AWSIoTAcceptCertificateTransferRequest *)request
                completionHandler:(void (^)(NSError *error))completionHandler {
    [[self acceptCertificateTransfer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)attachPrincipalPolicy:(AWSIoTAttachPrincipalPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/principal-policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"AttachPrincipalPolicy"
                   outputClass:nil];
}

- (void)attachPrincipalPolicy:(AWSIoTAttachPrincipalPolicyRequest *)request
            completionHandler:(void (^)(NSError *error))completionHandler {
    [[self attachPrincipalPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSIoTAttachThingPrincipalResponse *> *)attachThingPrincipal:(AWSIoTAttachThingPrincipalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/things/{thingName}/principals"
                  targetPrefix:@""
                 operationName:@"AttachThingPrincipal"
                   outputClass:[AWSIoTAttachThingPrincipalResponse class]];
}

- (void)attachThingPrincipal:(AWSIoTAttachThingPrincipalRequest *)request
           completionHandler:(void (^)(AWSIoTAttachThingPrincipalResponse *response, NSError *error))completionHandler {
    [[self attachThingPrincipal:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTAttachThingPrincipalResponse *> * _Nonnull task) {
        AWSIoTAttachThingPrincipalResponse *result = task.result;
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

- (AWSTask *)cancelCertificateTransfer:(AWSIoTCancelCertificateTransferRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/cancel-certificate-transfer/{certificateId}"
                  targetPrefix:@""
                 operationName:@"CancelCertificateTransfer"
                   outputClass:nil];
}

- (void)cancelCertificateTransfer:(AWSIoTCancelCertificateTransferRequest *)request
                completionHandler:(void (^)(NSError *error))completionHandler {
    [[self cancelCertificateTransfer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSIoTCreateCertificateFromCsrResponse *> *)createCertificateFromCsr:(AWSIoTCreateCertificateFromCsrRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/certificates"
                  targetPrefix:@""
                 operationName:@"CreateCertificateFromCsr"
                   outputClass:[AWSIoTCreateCertificateFromCsrResponse class]];
}

- (void)createCertificateFromCsr:(AWSIoTCreateCertificateFromCsrRequest *)request
               completionHandler:(void (^)(AWSIoTCreateCertificateFromCsrResponse *response, NSError *error))completionHandler {
    [[self createCertificateFromCsr:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateCertificateFromCsrResponse *> * _Nonnull task) {
        AWSIoTCreateCertificateFromCsrResponse *result = task.result;
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

- (AWSTask<AWSIoTCreateKeysAndCertificateResponse *> *)createKeysAndCertificate:(AWSIoTCreateKeysAndCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/keys-and-certificate"
                  targetPrefix:@""
                 operationName:@"CreateKeysAndCertificate"
                   outputClass:[AWSIoTCreateKeysAndCertificateResponse class]];
}

- (void)createKeysAndCertificate:(AWSIoTCreateKeysAndCertificateRequest *)request
               completionHandler:(void (^)(AWSIoTCreateKeysAndCertificateResponse *response, NSError *error))completionHandler {
    [[self createKeysAndCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateKeysAndCertificateResponse *> * _Nonnull task) {
        AWSIoTCreateKeysAndCertificateResponse *result = task.result;
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

- (AWSTask<AWSIoTCreatePolicyResponse *> *)createPolicy:(AWSIoTCreatePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"CreatePolicy"
                   outputClass:[AWSIoTCreatePolicyResponse class]];
}

- (void)createPolicy:(AWSIoTCreatePolicyRequest *)request
   completionHandler:(void (^)(AWSIoTCreatePolicyResponse *response, NSError *error))completionHandler {
    [[self createPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreatePolicyResponse *> * _Nonnull task) {
        AWSIoTCreatePolicyResponse *result = task.result;
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

- (AWSTask<AWSIoTCreatePolicyVersionResponse *> *)createPolicyVersion:(AWSIoTCreatePolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/policies/{policyName}/version"
                  targetPrefix:@""
                 operationName:@"CreatePolicyVersion"
                   outputClass:[AWSIoTCreatePolicyVersionResponse class]];
}

- (void)createPolicyVersion:(AWSIoTCreatePolicyVersionRequest *)request
          completionHandler:(void (^)(AWSIoTCreatePolicyVersionResponse *response, NSError *error))completionHandler {
    [[self createPolicyVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreatePolicyVersionResponse *> * _Nonnull task) {
        AWSIoTCreatePolicyVersionResponse *result = task.result;
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

- (AWSTask<AWSIoTCreateThingResponse *> *)createThing:(AWSIoTCreateThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/things/{thingName}"
                  targetPrefix:@""
                 operationName:@"CreateThing"
                   outputClass:[AWSIoTCreateThingResponse class]];
}

- (void)createThing:(AWSIoTCreateThingRequest *)request
  completionHandler:(void (^)(AWSIoTCreateThingResponse *response, NSError *error))completionHandler {
    [[self createThing:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateThingResponse *> * _Nonnull task) {
        AWSIoTCreateThingResponse *result = task.result;
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

- (AWSTask *)createTopicRule:(AWSIoTCreateTopicRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/rules/{ruleName}"
                  targetPrefix:@""
                 operationName:@"CreateTopicRule"
                   outputClass:nil];
}

- (void)createTopicRule:(AWSIoTCreateTopicRuleRequest *)request
      completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createTopicRule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)deleteCertificate:(AWSIoTDeleteCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/certificates/{certificateId}"
                  targetPrefix:@""
                 operationName:@"DeleteCertificate"
                   outputClass:nil];
}

- (void)deleteCertificate:(AWSIoTDeleteCertificateRequest *)request
        completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCertificate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)deletePolicy:(AWSIoTDeletePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"DeletePolicy"
                   outputClass:nil];
}

- (void)deletePolicy:(AWSIoTDeletePolicyRequest *)request
   completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)deletePolicyVersion:(AWSIoTDeletePolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/policies/{policyName}/version/{policyVersionId}"
                  targetPrefix:@""
                 operationName:@"DeletePolicyVersion"
                   outputClass:nil];
}

- (void)deletePolicyVersion:(AWSIoTDeletePolicyVersionRequest *)request
          completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePolicyVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSIoTDeleteThingResponse *> *)deleteThing:(AWSIoTDeleteThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/things/{thingName}"
                  targetPrefix:@""
                 operationName:@"DeleteThing"
                   outputClass:[AWSIoTDeleteThingResponse class]];
}

- (void)deleteThing:(AWSIoTDeleteThingRequest *)request
  completionHandler:(void (^)(AWSIoTDeleteThingResponse *response, NSError *error))completionHandler {
    [[self deleteThing:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteThingResponse *> * _Nonnull task) {
        AWSIoTDeleteThingResponse *result = task.result;
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

- (AWSTask *)deleteTopicRule:(AWSIoTDeleteTopicRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/rules/{ruleName}"
                  targetPrefix:@""
                 operationName:@"DeleteTopicRule"
                   outputClass:nil];
}

- (void)deleteTopicRule:(AWSIoTDeleteTopicRuleRequest *)request
      completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteTopicRule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSIoTDescribeCertificateResponse *> *)describeCertificate:(AWSIoTDescribeCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/certificates/{certificateId}"
                  targetPrefix:@""
                 operationName:@"DescribeCertificate"
                   outputClass:[AWSIoTDescribeCertificateResponse class]];
}

- (void)describeCertificate:(AWSIoTDescribeCertificateRequest *)request
          completionHandler:(void (^)(AWSIoTDescribeCertificateResponse *response, NSError *error))completionHandler {
    [[self describeCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeCertificateResponse *> * _Nonnull task) {
        AWSIoTDescribeCertificateResponse *result = task.result;
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

- (AWSTask<AWSIoTDescribeEndpointResponse *> *)describeEndpoint:(AWSIoTDescribeEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/endpoint"
                  targetPrefix:@""
                 operationName:@"DescribeEndpoint"
                   outputClass:[AWSIoTDescribeEndpointResponse class]];
}

- (void)describeEndpoint:(AWSIoTDescribeEndpointRequest *)request
       completionHandler:(void (^)(AWSIoTDescribeEndpointResponse *response, NSError *error))completionHandler {
    [[self describeEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeEndpointResponse *> * _Nonnull task) {
        AWSIoTDescribeEndpointResponse *result = task.result;
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

- (AWSTask<AWSIoTDescribeThingResponse *> *)describeThing:(AWSIoTDescribeThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/things/{thingName}"
                  targetPrefix:@""
                 operationName:@"DescribeThing"
                   outputClass:[AWSIoTDescribeThingResponse class]];
}

- (void)describeThing:(AWSIoTDescribeThingRequest *)request
    completionHandler:(void (^)(AWSIoTDescribeThingResponse *response, NSError *error))completionHandler {
    [[self describeThing:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeThingResponse *> * _Nonnull task) {
        AWSIoTDescribeThingResponse *result = task.result;
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

- (AWSTask *)detachPrincipalPolicy:(AWSIoTDetachPrincipalPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/principal-policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"DetachPrincipalPolicy"
                   outputClass:nil];
}

- (void)detachPrincipalPolicy:(AWSIoTDetachPrincipalPolicyRequest *)request
            completionHandler:(void (^)(NSError *error))completionHandler {
    [[self detachPrincipalPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSIoTDetachThingPrincipalResponse *> *)detachThingPrincipal:(AWSIoTDetachThingPrincipalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/things/{thingName}/principals"
                  targetPrefix:@""
                 operationName:@"DetachThingPrincipal"
                   outputClass:[AWSIoTDetachThingPrincipalResponse class]];
}

- (void)detachThingPrincipal:(AWSIoTDetachThingPrincipalRequest *)request
           completionHandler:(void (^)(AWSIoTDetachThingPrincipalResponse *response, NSError *error))completionHandler {
    [[self detachThingPrincipal:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDetachThingPrincipalResponse *> * _Nonnull task) {
        AWSIoTDetachThingPrincipalResponse *result = task.result;
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

- (AWSTask<AWSIoTGetLoggingOptionsResponse *> *)getLoggingOptions:(AWSIoTGetLoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/loggingOptions"
                  targetPrefix:@""
                 operationName:@"GetLoggingOptions"
                   outputClass:[AWSIoTGetLoggingOptionsResponse class]];
}

- (void)getLoggingOptions:(AWSIoTGetLoggingOptionsRequest *)request
        completionHandler:(void (^)(AWSIoTGetLoggingOptionsResponse *response, NSError *error))completionHandler {
    [[self getLoggingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetLoggingOptionsResponse *> * _Nonnull task) {
        AWSIoTGetLoggingOptionsResponse *result = task.result;
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

- (AWSTask<AWSIoTGetPolicyResponse *> *)getPolicy:(AWSIoTGetPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"GetPolicy"
                   outputClass:[AWSIoTGetPolicyResponse class]];
}

- (void)getPolicy:(AWSIoTGetPolicyRequest *)request
completionHandler:(void (^)(AWSIoTGetPolicyResponse *response, NSError *error))completionHandler {
    [[self getPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetPolicyResponse *> * _Nonnull task) {
        AWSIoTGetPolicyResponse *result = task.result;
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

- (AWSTask<AWSIoTGetPolicyVersionResponse *> *)getPolicyVersion:(AWSIoTGetPolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies/{policyName}/version/{policyVersionId}"
                  targetPrefix:@""
                 operationName:@"GetPolicyVersion"
                   outputClass:[AWSIoTGetPolicyVersionResponse class]];
}

- (void)getPolicyVersion:(AWSIoTGetPolicyVersionRequest *)request
       completionHandler:(void (^)(AWSIoTGetPolicyVersionResponse *response, NSError *error))completionHandler {
    [[self getPolicyVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetPolicyVersionResponse *> * _Nonnull task) {
        AWSIoTGetPolicyVersionResponse *result = task.result;
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

- (AWSTask<AWSIoTGetTopicRuleResponse *> *)getTopicRule:(AWSIoTGetTopicRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/rules/{ruleName}"
                  targetPrefix:@""
                 operationName:@"GetTopicRule"
                   outputClass:[AWSIoTGetTopicRuleResponse class]];
}

- (void)getTopicRule:(AWSIoTGetTopicRuleRequest *)request
   completionHandler:(void (^)(AWSIoTGetTopicRuleResponse *response, NSError *error))completionHandler {
    [[self getTopicRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetTopicRuleResponse *> * _Nonnull task) {
        AWSIoTGetTopicRuleResponse *result = task.result;
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

- (AWSTask<AWSIoTListCertificatesResponse *> *)listCertificates:(AWSIoTListCertificatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/certificates"
                  targetPrefix:@""
                 operationName:@"ListCertificates"
                   outputClass:[AWSIoTListCertificatesResponse class]];
}

- (void)listCertificates:(AWSIoTListCertificatesRequest *)request
       completionHandler:(void (^)(AWSIoTListCertificatesResponse *response, NSError *error))completionHandler {
    [[self listCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListCertificatesResponse *> * _Nonnull task) {
        AWSIoTListCertificatesResponse *result = task.result;
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

- (AWSTask<AWSIoTListPoliciesResponse *> *)listPolicies:(AWSIoTListPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies"
                  targetPrefix:@""
                 operationName:@"ListPolicies"
                   outputClass:[AWSIoTListPoliciesResponse class]];
}

- (void)listPolicies:(AWSIoTListPoliciesRequest *)request
   completionHandler:(void (^)(AWSIoTListPoliciesResponse *response, NSError *error))completionHandler {
    [[self listPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListPoliciesResponse *> * _Nonnull task) {
        AWSIoTListPoliciesResponse *result = task.result;
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

- (AWSTask<AWSIoTListPolicyVersionsResponse *> *)listPolicyVersions:(AWSIoTListPolicyVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies/{policyName}/version"
                  targetPrefix:@""
                 operationName:@"ListPolicyVersions"
                   outputClass:[AWSIoTListPolicyVersionsResponse class]];
}

- (void)listPolicyVersions:(AWSIoTListPolicyVersionsRequest *)request
         completionHandler:(void (^)(AWSIoTListPolicyVersionsResponse *response, NSError *error))completionHandler {
    [[self listPolicyVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListPolicyVersionsResponse *> * _Nonnull task) {
        AWSIoTListPolicyVersionsResponse *result = task.result;
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

- (AWSTask<AWSIoTListPrincipalPoliciesResponse *> *)listPrincipalPolicies:(AWSIoTListPrincipalPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/principal-policies"
                  targetPrefix:@""
                 operationName:@"ListPrincipalPolicies"
                   outputClass:[AWSIoTListPrincipalPoliciesResponse class]];
}

- (void)listPrincipalPolicies:(AWSIoTListPrincipalPoliciesRequest *)request
            completionHandler:(void (^)(AWSIoTListPrincipalPoliciesResponse *response, NSError *error))completionHandler {
    [[self listPrincipalPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListPrincipalPoliciesResponse *> * _Nonnull task) {
        AWSIoTListPrincipalPoliciesResponse *result = task.result;
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

- (AWSTask<AWSIoTListPrincipalThingsResponse *> *)listPrincipalThings:(AWSIoTListPrincipalThingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/principals/things"
                  targetPrefix:@""
                 operationName:@"ListPrincipalThings"
                   outputClass:[AWSIoTListPrincipalThingsResponse class]];
}

- (void)listPrincipalThings:(AWSIoTListPrincipalThingsRequest *)request
          completionHandler:(void (^)(AWSIoTListPrincipalThingsResponse *response, NSError *error))completionHandler {
    [[self listPrincipalThings:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListPrincipalThingsResponse *> * _Nonnull task) {
        AWSIoTListPrincipalThingsResponse *result = task.result;
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

- (AWSTask<AWSIoTListThingPrincipalsResponse *> *)listThingPrincipals:(AWSIoTListThingPrincipalsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/things/{thingName}/principals"
                  targetPrefix:@""
                 operationName:@"ListThingPrincipals"
                   outputClass:[AWSIoTListThingPrincipalsResponse class]];
}

- (void)listThingPrincipals:(AWSIoTListThingPrincipalsRequest *)request
          completionHandler:(void (^)(AWSIoTListThingPrincipalsResponse *response, NSError *error))completionHandler {
    [[self listThingPrincipals:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListThingPrincipalsResponse *> * _Nonnull task) {
        AWSIoTListThingPrincipalsResponse *result = task.result;
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

- (AWSTask<AWSIoTListThingsResponse *> *)listThings:(AWSIoTListThingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/things"
                  targetPrefix:@""
                 operationName:@"ListThings"
                   outputClass:[AWSIoTListThingsResponse class]];
}

- (void)listThings:(AWSIoTListThingsRequest *)request
 completionHandler:(void (^)(AWSIoTListThingsResponse *response, NSError *error))completionHandler {
    [[self listThings:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListThingsResponse *> * _Nonnull task) {
        AWSIoTListThingsResponse *result = task.result;
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

- (AWSTask<AWSIoTListTopicRulesResponse *> *)listTopicRules:(AWSIoTListTopicRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/rules"
                  targetPrefix:@""
                 operationName:@"ListTopicRules"
                   outputClass:[AWSIoTListTopicRulesResponse class]];
}

- (void)listTopicRules:(AWSIoTListTopicRulesRequest *)request
     completionHandler:(void (^)(AWSIoTListTopicRulesResponse *response, NSError *error))completionHandler {
    [[self listTopicRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListTopicRulesResponse *> * _Nonnull task) {
        AWSIoTListTopicRulesResponse *result = task.result;
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

- (AWSTask *)rejectCertificateTransfer:(AWSIoTRejectCertificateTransferRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/reject-certificate-transfer/{certificateId}"
                  targetPrefix:@""
                 operationName:@"RejectCertificateTransfer"
                   outputClass:nil];
}

- (void)rejectCertificateTransfer:(AWSIoTRejectCertificateTransferRequest *)request
                completionHandler:(void (^)(NSError *error))completionHandler {
    [[self rejectCertificateTransfer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)replaceTopicRule:(AWSIoTReplaceTopicRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/rules/{ruleName}"
                  targetPrefix:@""
                 operationName:@"ReplaceTopicRule"
                   outputClass:nil];
}

- (void)replaceTopicRule:(AWSIoTReplaceTopicRuleRequest *)request
       completionHandler:(void (^)(NSError *error))completionHandler {
    [[self replaceTopicRule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)setDefaultPolicyVersion:(AWSIoTSetDefaultPolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/policies/{policyName}/version/{policyVersionId}"
                  targetPrefix:@""
                 operationName:@"SetDefaultPolicyVersion"
                   outputClass:nil];
}

- (void)setDefaultPolicyVersion:(AWSIoTSetDefaultPolicyVersionRequest *)request
              completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setDefaultPolicyVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)setLoggingOptions:(AWSIoTSetLoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/loggingOptions"
                  targetPrefix:@""
                 operationName:@"SetLoggingOptions"
                   outputClass:nil];
}

- (void)setLoggingOptions:(AWSIoTSetLoggingOptionsRequest *)request
        completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setLoggingOptions:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSIoTTransferCertificateResponse *> *)transferCertificate:(AWSIoTTransferCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/transfer-certificate/{certificateId}"
                  targetPrefix:@""
                 operationName:@"TransferCertificate"
                   outputClass:[AWSIoTTransferCertificateResponse class]];
}

- (void)transferCertificate:(AWSIoTTransferCertificateRequest *)request
          completionHandler:(void (^)(AWSIoTTransferCertificateResponse *response, NSError *error))completionHandler {
    [[self transferCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTTransferCertificateResponse *> * _Nonnull task) {
        AWSIoTTransferCertificateResponse *result = task.result;
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

- (AWSTask *)updateCertificate:(AWSIoTUpdateCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/certificates/{certificateId}"
                  targetPrefix:@""
                 operationName:@"UpdateCertificate"
                   outputClass:nil];
}

- (void)updateCertificate:(AWSIoTUpdateCertificateRequest *)request
        completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateCertificate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSIoTUpdateThingResponse *> *)updateThing:(AWSIoTUpdateThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/things/{thingName}"
                  targetPrefix:@""
                 operationName:@"UpdateThing"
                   outputClass:[AWSIoTUpdateThingResponse class]];
}

- (void)updateThing:(AWSIoTUpdateThingRequest *)request
  completionHandler:(void (^)(AWSIoTUpdateThingResponse *response, NSError *error))completionHandler {
    [[self updateThing:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateThingResponse *> * _Nonnull task) {
        AWSIoTUpdateThingResponse *result = task.result;
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
