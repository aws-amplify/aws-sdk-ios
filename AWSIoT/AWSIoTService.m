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

- (AWSTask *)attachPrincipalPolicy:(AWSIoTAttachPrincipalPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/principal-policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"AttachPrincipalPolicy"
                   outputClass:nil];
}

- (AWSTask *)attachThingPrincipal:(AWSIoTAttachThingPrincipalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/things/{thingName}/principals"
                  targetPrefix:@""
                 operationName:@"AttachThingPrincipal"
                   outputClass:[AWSIoTAttachThingPrincipalResponse class]];
}

- (AWSTask *)cancelCertificateTransfer:(AWSIoTCancelCertificateTransferRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/cancel-certificate-transfer/{certificateId}"
                  targetPrefix:@""
                 operationName:@"CancelCertificateTransfer"
                   outputClass:nil];
}

- (AWSTask *)createCertificateFromCsr:(AWSIoTCreateCertificateFromCsrRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/certificates"
                  targetPrefix:@""
                 operationName:@"CreateCertificateFromCsr"
                   outputClass:[AWSIoTCreateCertificateFromCsrResponse class]];
}

- (AWSTask *)createKeysAndCertificate:(AWSIoTCreateKeysAndCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/keys-and-certificate"
                  targetPrefix:@""
                 operationName:@"CreateKeysAndCertificate"
                   outputClass:[AWSIoTCreateKeysAndCertificateResponse class]];
}

- (AWSTask *)createPolicy:(AWSIoTCreatePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"CreatePolicy"
                   outputClass:[AWSIoTCreatePolicyResponse class]];
}

- (AWSTask *)createPolicyVersion:(AWSIoTCreatePolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/policies/{policyName}/version"
                  targetPrefix:@""
                 operationName:@"CreatePolicyVersion"
                   outputClass:[AWSIoTCreatePolicyVersionResponse class]];
}

- (AWSTask *)createThing:(AWSIoTCreateThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/things/{thingName}"
                  targetPrefix:@""
                 operationName:@"CreateThing"
                   outputClass:[AWSIoTCreateThingResponse class]];
}

- (AWSTask *)createTopicRule:(AWSIoTCreateTopicRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/rules/{ruleName}"
                  targetPrefix:@""
                 operationName:@"CreateTopicRule"
                   outputClass:nil];
}

- (AWSTask *)deleteCertificate:(AWSIoTDeleteCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/certificates/{certificateId}"
                  targetPrefix:@""
                 operationName:@"DeleteCertificate"
                   outputClass:nil];
}

- (AWSTask *)deletePolicy:(AWSIoTDeletePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"DeletePolicy"
                   outputClass:nil];
}

- (AWSTask *)deletePolicyVersion:(AWSIoTDeletePolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/policies/{policyName}/version/{policyVersionId}"
                  targetPrefix:@""
                 operationName:@"DeletePolicyVersion"
                   outputClass:nil];
}

- (AWSTask *)deleteThing:(AWSIoTDeleteThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/things/{thingName}"
                  targetPrefix:@""
                 operationName:@"DeleteThing"
                   outputClass:[AWSIoTDeleteThingResponse class]];
}

- (AWSTask *)deleteTopicRule:(AWSIoTDeleteTopicRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/rules/{ruleName}"
                  targetPrefix:@""
                 operationName:@"DeleteTopicRule"
                   outputClass:nil];
}

- (AWSTask *)describeCertificate:(AWSIoTDescribeCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/certificates/{certificateId}"
                  targetPrefix:@""
                 operationName:@"DescribeCertificate"
                   outputClass:[AWSIoTDescribeCertificateResponse class]];
}

- (AWSTask *)describeEndpoint:(AWSIoTDescribeEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/endpoint"
                  targetPrefix:@""
                 operationName:@"DescribeEndpoint"
                   outputClass:[AWSIoTDescribeEndpointResponse class]];
}

- (AWSTask *)describeThing:(AWSIoTDescribeThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/things/{thingName}"
                  targetPrefix:@""
                 operationName:@"DescribeThing"
                   outputClass:[AWSIoTDescribeThingResponse class]];
}

- (AWSTask *)detachPrincipalPolicy:(AWSIoTDetachPrincipalPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/principal-policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"DetachPrincipalPolicy"
                   outputClass:nil];
}

- (AWSTask *)detachThingPrincipal:(AWSIoTDetachThingPrincipalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/things/{thingName}/principals"
                  targetPrefix:@""
                 operationName:@"DetachThingPrincipal"
                   outputClass:[AWSIoTDetachThingPrincipalResponse class]];
}

- (AWSTask *)getLoggingOptions:(AWSIoTGetLoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/loggingOptions"
                  targetPrefix:@""
                 operationName:@"GetLoggingOptions"
                   outputClass:[AWSIoTGetLoggingOptionsResponse class]];
}

- (AWSTask *)getPolicy:(AWSIoTGetPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"GetPolicy"
                   outputClass:[AWSIoTGetPolicyResponse class]];
}

- (AWSTask *)getPolicyVersion:(AWSIoTGetPolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies/{policyName}/version/{policyVersionId}"
                  targetPrefix:@""
                 operationName:@"GetPolicyVersion"
                   outputClass:[AWSIoTGetPolicyVersionResponse class]];
}

- (AWSTask *)getTopicRule:(AWSIoTGetTopicRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/rules/{ruleName}"
                  targetPrefix:@""
                 operationName:@"GetTopicRule"
                   outputClass:[AWSIoTGetTopicRuleResponse class]];
}

- (AWSTask *)listCertificates:(AWSIoTListCertificatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/certificates"
                  targetPrefix:@""
                 operationName:@"ListCertificates"
                   outputClass:[AWSIoTListCertificatesResponse class]];
}

- (AWSTask *)listPolicies:(AWSIoTListPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies"
                  targetPrefix:@""
                 operationName:@"ListPolicies"
                   outputClass:[AWSIoTListPoliciesResponse class]];
}

- (AWSTask *)listPolicyVersions:(AWSIoTListPolicyVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies/{policyName}/version"
                  targetPrefix:@""
                 operationName:@"ListPolicyVersions"
                   outputClass:[AWSIoTListPolicyVersionsResponse class]];
}

- (AWSTask *)listPrincipalPolicies:(AWSIoTListPrincipalPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/principal-policies"
                  targetPrefix:@""
                 operationName:@"ListPrincipalPolicies"
                   outputClass:[AWSIoTListPrincipalPoliciesResponse class]];
}

- (AWSTask *)listPrincipalThings:(AWSIoTListPrincipalThingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/principals/things"
                  targetPrefix:@""
                 operationName:@"ListPrincipalThings"
                   outputClass:[AWSIoTListPrincipalThingsResponse class]];
}

- (AWSTask *)listThingPrincipals:(AWSIoTListThingPrincipalsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/things/{thingName}/principals"
                  targetPrefix:@""
                 operationName:@"ListThingPrincipals"
                   outputClass:[AWSIoTListThingPrincipalsResponse class]];
}

- (AWSTask *)listThings:(AWSIoTListThingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/things"
                  targetPrefix:@""
                 operationName:@"ListThings"
                   outputClass:[AWSIoTListThingsResponse class]];
}

- (AWSTask *)listTopicRules:(AWSIoTListTopicRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/rules"
                  targetPrefix:@""
                 operationName:@"ListTopicRules"
                   outputClass:[AWSIoTListTopicRulesResponse class]];
}

- (AWSTask *)rejectCertificateTransfer:(AWSIoTRejectCertificateTransferRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/reject-certificate-transfer/{certificateId}"
                  targetPrefix:@""
                 operationName:@"RejectCertificateTransfer"
                   outputClass:nil];
}

- (AWSTask *)replaceTopicRule:(AWSIoTReplaceTopicRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/rules/{ruleName}"
                  targetPrefix:@""
                 operationName:@"ReplaceTopicRule"
                   outputClass:nil];
}

- (AWSTask *)setDefaultPolicyVersion:(AWSIoTSetDefaultPolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/policies/{policyName}/version/{policyVersionId}"
                  targetPrefix:@""
                 operationName:@"SetDefaultPolicyVersion"
                   outputClass:nil];
}

- (AWSTask *)setLoggingOptions:(AWSIoTSetLoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/loggingOptions"
                  targetPrefix:@""
                 operationName:@"SetLoggingOptions"
                   outputClass:nil];
}

- (AWSTask *)transferCertificate:(AWSIoTTransferCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/transfer-certificate/{certificateId}"
                  targetPrefix:@""
                 operationName:@"TransferCertificate"
                   outputClass:[AWSIoTTransferCertificateResponse class]];
}

- (AWSTask *)updateCertificate:(AWSIoTUpdateCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/certificates/{certificateId}"
                  targetPrefix:@""
                 operationName:@"UpdateCertificate"
                   outputClass:nil];
}

- (AWSTask *)updateThing:(AWSIoTUpdateThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/things/{thingName}"
                  targetPrefix:@""
                 operationName:@"UpdateThing"
                   outputClass:[AWSIoTUpdateThingResponse class]];
}

@end
