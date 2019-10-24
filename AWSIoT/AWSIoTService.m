//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSIoTResources.h"

static NSString *const AWSInfoIoT = @"IoT";
NSString *const AWSIoTSDKVersion = @"2.12.1";


@interface AWSIoTResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSIoTResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"CertificateConflictException" : @(AWSIoTErrorCertificateConflict),
                            @"CertificateStateException" : @(AWSIoTErrorCertificateState),
                            @"CertificateValidationException" : @(AWSIoTErrorCertificateValidation),
                            @"ConflictingResourceUpdateException" : @(AWSIoTErrorConflictingResourceUpdate),
                            @"DeleteConflictException" : @(AWSIoTErrorDeleteConflict),
                            @"IndexNotReadyException" : @(AWSIoTErrorIndexNotReady),
                            @"InternalException" : @(AWSIoTErrorInternal),
                            @"InternalFailureException" : @(AWSIoTErrorInternalFailure),
                            @"InvalidAggregationException" : @(AWSIoTErrorInvalidAggregation),
                            @"InvalidQueryException" : @(AWSIoTErrorInvalidQuery),
                            @"InvalidRequestException" : @(AWSIoTErrorInvalidRequest),
                            @"InvalidResponseException" : @(AWSIoTErrorInvalidResponse),
                            @"InvalidStateTransitionException" : @(AWSIoTErrorInvalidStateTransition),
                            @"LimitExceededException" : @(AWSIoTErrorLimitExceeded),
                            @"MalformedPolicyException" : @(AWSIoTErrorMalformedPolicy),
                            @"NotConfiguredException" : @(AWSIoTErrorNotConfigured),
                            @"RegistrationCodeValidationException" : @(AWSIoTErrorRegistrationCodeValidation),
                            @"ResourceAlreadyExistsException" : @(AWSIoTErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSIoTErrorResourceNotFound),
                            @"ResourceRegistrationFailureException" : @(AWSIoTErrorResourceRegistrationFailure),
                            @"ServiceUnavailableException" : @(AWSIoTErrorServiceUnavailable),
                            @"SqlParseException" : @(AWSIoTErrorSqlParse),
                            @"TaskAlreadyExistsException" : @(AWSIoTErrorTaskAlreadyExists),
                            @"ThrottlingException" : @(AWSIoTErrorThrottling),
                            @"TransferAlreadyCompletedException" : @(AWSIoTErrorTransferAlreadyCompleted),
                            @"TransferConflictException" : @(AWSIoTErrorTransferConflict),
                            @"UnauthorizedException" : @(AWSIoTErrorUnauthorized),
                            @"VersionConflictException" : @(AWSIoTErrorVersionConflict),
                            @"VersionsLimitExceededException" : @(AWSIoTErrorVersionsLimitExceeded),
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
    	NSString *errorTypeString = [[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"];
        NSString *errorTypeHeader = [[errorTypeString componentsSeparatedByString:@":"] firstObject];

        if ([errorTypeString length] > 0 && errorTypeHeader) {
            if (errorCodeDictionary[errorTypeHeader]) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSIoTErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
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

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSIoT()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSIoT

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSIoTSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSIoT versions need to match. Check your SDK installation. AWSCore: %@ AWSIoT: %@", AWSiOSSDKVersion, AWSIoTSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultIoT {
    static AWSIoT *_defaultIoT = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoIoT];
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
        _defaultIoT = [[AWSIoT alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultIoT;
}

+ (void)registerIoTWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSIoT alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)IoTForKey:(NSString *)key {
    @synchronized(self) {
        AWSIoT *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoIoT
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSIoT registerIoTWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
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

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceIoT
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceIoT];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSIoTResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSIoTResponseSerializer alloc] initWithJSONDefinition:[[AWSIoTResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTAddThingToBillingGroupResponse *> *)addThingToBillingGroup:(AWSIoTAddThingToBillingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/billing-groups/addThingToBillingGroup"
                  targetPrefix:@""
                 operationName:@"AddThingToBillingGroup"
                   outputClass:[AWSIoTAddThingToBillingGroupResponse class]];
}

- (void)addThingToBillingGroup:(AWSIoTAddThingToBillingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTAddThingToBillingGroupResponse *response, NSError *error))completionHandler {
    [[self addThingToBillingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTAddThingToBillingGroupResponse *> * _Nonnull task) {
        AWSIoTAddThingToBillingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTAddThingToThingGroupResponse *> *)addThingToThingGroup:(AWSIoTAddThingToThingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/thing-groups/addThingToThingGroup"
                  targetPrefix:@""
                 operationName:@"AddThingToThingGroup"
                   outputClass:[AWSIoTAddThingToThingGroupResponse class]];
}

- (void)addThingToThingGroup:(AWSIoTAddThingToThingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTAddThingToThingGroupResponse *response, NSError *error))completionHandler {
    [[self addThingToThingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTAddThingToThingGroupResponse *> * _Nonnull task) {
        AWSIoTAddThingToThingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTAssociateTargetsWithJobResponse *> *)associateTargetsWithJob:(AWSIoTAssociateTargetsWithJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/jobs/{jobId}/targets"
                  targetPrefix:@""
                 operationName:@"AssociateTargetsWithJob"
                   outputClass:[AWSIoTAssociateTargetsWithJobResponse class]];
}

- (void)associateTargetsWithJob:(AWSIoTAssociateTargetsWithJobRequest *)request
     completionHandler:(void (^)(AWSIoTAssociateTargetsWithJobResponse *response, NSError *error))completionHandler {
    [[self associateTargetsWithJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTAssociateTargetsWithJobResponse *> * _Nonnull task) {
        AWSIoTAssociateTargetsWithJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)attachPolicy:(AWSIoTAttachPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/target-policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"AttachPolicy"
                   outputClass:nil];
}

- (void)attachPolicy:(AWSIoTAttachPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self attachPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTAttachSecurityProfileResponse *> *)attachSecurityProfile:(AWSIoTAttachSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/security-profiles/{securityProfileName}/targets"
                  targetPrefix:@""
                 operationName:@"AttachSecurityProfile"
                   outputClass:[AWSIoTAttachSecurityProfileResponse class]];
}

- (void)attachSecurityProfile:(AWSIoTAttachSecurityProfileRequest *)request
     completionHandler:(void (^)(AWSIoTAttachSecurityProfileResponse *response, NSError *error))completionHandler {
    [[self attachSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTAttachSecurityProfileResponse *> * _Nonnull task) {
        AWSIoTAttachSecurityProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCancelAuditMitigationActionsTaskResponse *> *)cancelAuditMitigationActionsTask:(AWSIoTCancelAuditMitigationActionsTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/audit/mitigationactions/tasks/{taskId}/cancel"
                  targetPrefix:@""
                 operationName:@"CancelAuditMitigationActionsTask"
                   outputClass:[AWSIoTCancelAuditMitigationActionsTaskResponse class]];
}

- (void)cancelAuditMitigationActionsTask:(AWSIoTCancelAuditMitigationActionsTaskRequest *)request
     completionHandler:(void (^)(AWSIoTCancelAuditMitigationActionsTaskResponse *response, NSError *error))completionHandler {
    [[self cancelAuditMitigationActionsTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCancelAuditMitigationActionsTaskResponse *> * _Nonnull task) {
        AWSIoTCancelAuditMitigationActionsTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCancelAuditTaskResponse *> *)cancelAuditTask:(AWSIoTCancelAuditTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/audit/tasks/{taskId}/cancel"
                  targetPrefix:@""
                 operationName:@"CancelAuditTask"
                   outputClass:[AWSIoTCancelAuditTaskResponse class]];
}

- (void)cancelAuditTask:(AWSIoTCancelAuditTaskRequest *)request
     completionHandler:(void (^)(AWSIoTCancelAuditTaskResponse *response, NSError *error))completionHandler {
    [[self cancelAuditTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCancelAuditTaskResponse *> * _Nonnull task) {
        AWSIoTCancelAuditTaskResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCancelJobResponse *> *)cancelJob:(AWSIoTCancelJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/jobs/{jobId}/cancel"
                  targetPrefix:@""
                 operationName:@"CancelJob"
                   outputClass:[AWSIoTCancelJobResponse class]];
}

- (void)cancelJob:(AWSIoTCancelJobRequest *)request
     completionHandler:(void (^)(AWSIoTCancelJobResponse *response, NSError *error))completionHandler {
    [[self cancelJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCancelJobResponse *> * _Nonnull task) {
        AWSIoTCancelJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)cancelJobExecution:(AWSIoTCancelJobExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/things/{thingName}/jobs/{jobId}/cancel"
                  targetPrefix:@""
                 operationName:@"CancelJobExecution"
                   outputClass:nil];
}

- (void)cancelJobExecution:(AWSIoTCancelJobExecutionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self cancelJobExecution:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTClearDefaultAuthorizerResponse *> *)clearDefaultAuthorizer:(AWSIoTClearDefaultAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/default-authorizer"
                  targetPrefix:@""
                 operationName:@"ClearDefaultAuthorizer"
                   outputClass:[AWSIoTClearDefaultAuthorizerResponse class]];
}

- (void)clearDefaultAuthorizer:(AWSIoTClearDefaultAuthorizerRequest *)request
     completionHandler:(void (^)(AWSIoTClearDefaultAuthorizerResponse *response, NSError *error))completionHandler {
    [[self clearDefaultAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTClearDefaultAuthorizerResponse *> * _Nonnull task) {
        AWSIoTClearDefaultAuthorizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateAuthorizerResponse *> *)createAuthorizer:(AWSIoTCreateAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/authorizer/{authorizerName}"
                  targetPrefix:@""
                 operationName:@"CreateAuthorizer"
                   outputClass:[AWSIoTCreateAuthorizerResponse class]];
}

- (void)createAuthorizer:(AWSIoTCreateAuthorizerRequest *)request
     completionHandler:(void (^)(AWSIoTCreateAuthorizerResponse *response, NSError *error))completionHandler {
    [[self createAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateAuthorizerResponse *> * _Nonnull task) {
        AWSIoTCreateAuthorizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateBillingGroupResponse *> *)createBillingGroup:(AWSIoTCreateBillingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/billing-groups/{billingGroupName}"
                  targetPrefix:@""
                 operationName:@"CreateBillingGroup"
                   outputClass:[AWSIoTCreateBillingGroupResponse class]];
}

- (void)createBillingGroup:(AWSIoTCreateBillingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTCreateBillingGroupResponse *response, NSError *error))completionHandler {
    [[self createBillingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateBillingGroupResponse *> * _Nonnull task) {
        AWSIoTCreateBillingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateDynamicThingGroupResponse *> *)createDynamicThingGroup:(AWSIoTCreateDynamicThingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/dynamic-thing-groups/{thingGroupName}"
                  targetPrefix:@""
                 operationName:@"CreateDynamicThingGroup"
                   outputClass:[AWSIoTCreateDynamicThingGroupResponse class]];
}

- (void)createDynamicThingGroup:(AWSIoTCreateDynamicThingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTCreateDynamicThingGroupResponse *response, NSError *error))completionHandler {
    [[self createDynamicThingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateDynamicThingGroupResponse *> * _Nonnull task) {
        AWSIoTCreateDynamicThingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateJobResponse *> *)createJob:(AWSIoTCreateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/jobs/{jobId}"
                  targetPrefix:@""
                 operationName:@"CreateJob"
                   outputClass:[AWSIoTCreateJobResponse class]];
}

- (void)createJob:(AWSIoTCreateJobRequest *)request
     completionHandler:(void (^)(AWSIoTCreateJobResponse *response, NSError *error))completionHandler {
    [[self createJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateJobResponse *> * _Nonnull task) {
        AWSIoTCreateJobResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateMitigationActionResponse *> *)createMitigationAction:(AWSIoTCreateMitigationActionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/mitigationactions/actions/{actionName}"
                  targetPrefix:@""
                 operationName:@"CreateMitigationAction"
                   outputClass:[AWSIoTCreateMitigationActionResponse class]];
}

- (void)createMitigationAction:(AWSIoTCreateMitigationActionRequest *)request
     completionHandler:(void (^)(AWSIoTCreateMitigationActionResponse *response, NSError *error))completionHandler {
    [[self createMitigationAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateMitigationActionResponse *> * _Nonnull task) {
        AWSIoTCreateMitigationActionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateOTAUpdateResponse *> *)createOTAUpdate:(AWSIoTCreateOTAUpdateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/otaUpdates/{otaUpdateId}"
                  targetPrefix:@""
                 operationName:@"CreateOTAUpdate"
                   outputClass:[AWSIoTCreateOTAUpdateResponse class]];
}

- (void)createOTAUpdate:(AWSIoTCreateOTAUpdateRequest *)request
     completionHandler:(void (^)(AWSIoTCreateOTAUpdateResponse *response, NSError *error))completionHandler {
    [[self createOTAUpdate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateOTAUpdateResponse *> * _Nonnull task) {
        AWSIoTCreateOTAUpdateResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateRoleAliasResponse *> *)createRoleAlias:(AWSIoTCreateRoleAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/role-aliases/{roleAlias}"
                  targetPrefix:@""
                 operationName:@"CreateRoleAlias"
                   outputClass:[AWSIoTCreateRoleAliasResponse class]];
}

- (void)createRoleAlias:(AWSIoTCreateRoleAliasRequest *)request
     completionHandler:(void (^)(AWSIoTCreateRoleAliasResponse *response, NSError *error))completionHandler {
    [[self createRoleAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateRoleAliasResponse *> * _Nonnull task) {
        AWSIoTCreateRoleAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateScheduledAuditResponse *> *)createScheduledAudit:(AWSIoTCreateScheduledAuditRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/audit/scheduledaudits/{scheduledAuditName}"
                  targetPrefix:@""
                 operationName:@"CreateScheduledAudit"
                   outputClass:[AWSIoTCreateScheduledAuditResponse class]];
}

- (void)createScheduledAudit:(AWSIoTCreateScheduledAuditRequest *)request
     completionHandler:(void (^)(AWSIoTCreateScheduledAuditResponse *response, NSError *error))completionHandler {
    [[self createScheduledAudit:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateScheduledAuditResponse *> * _Nonnull task) {
        AWSIoTCreateScheduledAuditResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateSecurityProfileResponse *> *)createSecurityProfile:(AWSIoTCreateSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/security-profiles/{securityProfileName}"
                  targetPrefix:@""
                 operationName:@"CreateSecurityProfile"
                   outputClass:[AWSIoTCreateSecurityProfileResponse class]];
}

- (void)createSecurityProfile:(AWSIoTCreateSecurityProfileRequest *)request
     completionHandler:(void (^)(AWSIoTCreateSecurityProfileResponse *response, NSError *error))completionHandler {
    [[self createSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateSecurityProfileResponse *> * _Nonnull task) {
        AWSIoTCreateSecurityProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateStreamResponse *> *)createStream:(AWSIoTCreateStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/streams/{streamId}"
                  targetPrefix:@""
                 operationName:@"CreateStream"
                   outputClass:[AWSIoTCreateStreamResponse class]];
}

- (void)createStream:(AWSIoTCreateStreamRequest *)request
     completionHandler:(void (^)(AWSIoTCreateStreamResponse *response, NSError *error))completionHandler {
    [[self createStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateStreamResponse *> * _Nonnull task) {
        AWSIoTCreateStreamResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateThingGroupResponse *> *)createThingGroup:(AWSIoTCreateThingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/thing-groups/{thingGroupName}"
                  targetPrefix:@""
                 operationName:@"CreateThingGroup"
                   outputClass:[AWSIoTCreateThingGroupResponse class]];
}

- (void)createThingGroup:(AWSIoTCreateThingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTCreateThingGroupResponse *response, NSError *error))completionHandler {
    [[self createThingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateThingGroupResponse *> * _Nonnull task) {
        AWSIoTCreateThingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTCreateThingTypeResponse *> *)createThingType:(AWSIoTCreateThingTypeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/thing-types/{thingTypeName}"
                  targetPrefix:@""
                 operationName:@"CreateThingType"
                   outputClass:[AWSIoTCreateThingTypeResponse class]];
}

- (void)createThingType:(AWSIoTCreateThingTypeRequest *)request
     completionHandler:(void (^)(AWSIoTCreateThingTypeResponse *response, NSError *error))completionHandler {
    [[self createThingType:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTCreateThingTypeResponse *> * _Nonnull task) {
        AWSIoTCreateThingTypeResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteAccountAuditConfigurationResponse *> *)deleteAccountAuditConfiguration:(AWSIoTDeleteAccountAuditConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/audit/configuration"
                  targetPrefix:@""
                 operationName:@"DeleteAccountAuditConfiguration"
                   outputClass:[AWSIoTDeleteAccountAuditConfigurationResponse class]];
}

- (void)deleteAccountAuditConfiguration:(AWSIoTDeleteAccountAuditConfigurationRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteAccountAuditConfigurationResponse *response, NSError *error))completionHandler {
    [[self deleteAccountAuditConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteAccountAuditConfigurationResponse *> * _Nonnull task) {
        AWSIoTDeleteAccountAuditConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteAuthorizerResponse *> *)deleteAuthorizer:(AWSIoTDeleteAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/authorizer/{authorizerName}"
                  targetPrefix:@""
                 operationName:@"DeleteAuthorizer"
                   outputClass:[AWSIoTDeleteAuthorizerResponse class]];
}

- (void)deleteAuthorizer:(AWSIoTDeleteAuthorizerRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteAuthorizerResponse *response, NSError *error))completionHandler {
    [[self deleteAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteAuthorizerResponse *> * _Nonnull task) {
        AWSIoTDeleteAuthorizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteBillingGroupResponse *> *)deleteBillingGroup:(AWSIoTDeleteBillingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/billing-groups/{billingGroupName}"
                  targetPrefix:@""
                 operationName:@"DeleteBillingGroup"
                   outputClass:[AWSIoTDeleteBillingGroupResponse class]];
}

- (void)deleteBillingGroup:(AWSIoTDeleteBillingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteBillingGroupResponse *response, NSError *error))completionHandler {
    [[self deleteBillingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteBillingGroupResponse *> * _Nonnull task) {
        AWSIoTDeleteBillingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteCACertificateResponse *> *)deleteCACertificate:(AWSIoTDeleteCACertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/cacertificate/{caCertificateId}"
                  targetPrefix:@""
                 operationName:@"DeleteCACertificate"
                   outputClass:[AWSIoTDeleteCACertificateResponse class]];
}

- (void)deleteCACertificate:(AWSIoTDeleteCACertificateRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteCACertificateResponse *response, NSError *error))completionHandler {
    [[self deleteCACertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteCACertificateResponse *> * _Nonnull task) {
        AWSIoTDeleteCACertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteDynamicThingGroupResponse *> *)deleteDynamicThingGroup:(AWSIoTDeleteDynamicThingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/dynamic-thing-groups/{thingGroupName}"
                  targetPrefix:@""
                 operationName:@"DeleteDynamicThingGroup"
                   outputClass:[AWSIoTDeleteDynamicThingGroupResponse class]];
}

- (void)deleteDynamicThingGroup:(AWSIoTDeleteDynamicThingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteDynamicThingGroupResponse *response, NSError *error))completionHandler {
    [[self deleteDynamicThingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteDynamicThingGroupResponse *> * _Nonnull task) {
        AWSIoTDeleteDynamicThingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteJob:(AWSIoTDeleteJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/jobs/{jobId}"
                  targetPrefix:@""
                 operationName:@"DeleteJob"
                   outputClass:nil];
}

- (void)deleteJob:(AWSIoTDeleteJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteJobExecution:(AWSIoTDeleteJobExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/things/{thingName}/jobs/{jobId}/executionNumber/{executionNumber}"
                  targetPrefix:@""
                 operationName:@"DeleteJobExecution"
                   outputClass:nil];
}

- (void)deleteJobExecution:(AWSIoTDeleteJobExecutionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteJobExecution:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteMitigationActionResponse *> *)deleteMitigationAction:(AWSIoTDeleteMitigationActionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/mitigationactions/actions/{actionName}"
                  targetPrefix:@""
                 operationName:@"DeleteMitigationAction"
                   outputClass:[AWSIoTDeleteMitigationActionResponse class]];
}

- (void)deleteMitigationAction:(AWSIoTDeleteMitigationActionRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteMitigationActionResponse *response, NSError *error))completionHandler {
    [[self deleteMitigationAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteMitigationActionResponse *> * _Nonnull task) {
        AWSIoTDeleteMitigationActionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteOTAUpdateResponse *> *)deleteOTAUpdate:(AWSIoTDeleteOTAUpdateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/otaUpdates/{otaUpdateId}"
                  targetPrefix:@""
                 operationName:@"DeleteOTAUpdate"
                   outputClass:[AWSIoTDeleteOTAUpdateResponse class]];
}

- (void)deleteOTAUpdate:(AWSIoTDeleteOTAUpdateRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteOTAUpdateResponse *response, NSError *error))completionHandler {
    [[self deleteOTAUpdate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteOTAUpdateResponse *> * _Nonnull task) {
        AWSIoTDeleteOTAUpdateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteRegistrationCodeResponse *> *)deleteRegistrationCode:(AWSIoTDeleteRegistrationCodeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/registrationcode"
                  targetPrefix:@""
                 operationName:@"DeleteRegistrationCode"
                   outputClass:[AWSIoTDeleteRegistrationCodeResponse class]];
}

- (void)deleteRegistrationCode:(AWSIoTDeleteRegistrationCodeRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteRegistrationCodeResponse *response, NSError *error))completionHandler {
    [[self deleteRegistrationCode:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteRegistrationCodeResponse *> * _Nonnull task) {
        AWSIoTDeleteRegistrationCodeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteRoleAliasResponse *> *)deleteRoleAlias:(AWSIoTDeleteRoleAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/role-aliases/{roleAlias}"
                  targetPrefix:@""
                 operationName:@"DeleteRoleAlias"
                   outputClass:[AWSIoTDeleteRoleAliasResponse class]];
}

- (void)deleteRoleAlias:(AWSIoTDeleteRoleAliasRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteRoleAliasResponse *response, NSError *error))completionHandler {
    [[self deleteRoleAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteRoleAliasResponse *> * _Nonnull task) {
        AWSIoTDeleteRoleAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteScheduledAuditResponse *> *)deleteScheduledAudit:(AWSIoTDeleteScheduledAuditRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/audit/scheduledaudits/{scheduledAuditName}"
                  targetPrefix:@""
                 operationName:@"DeleteScheduledAudit"
                   outputClass:[AWSIoTDeleteScheduledAuditResponse class]];
}

- (void)deleteScheduledAudit:(AWSIoTDeleteScheduledAuditRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteScheduledAuditResponse *response, NSError *error))completionHandler {
    [[self deleteScheduledAudit:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteScheduledAuditResponse *> * _Nonnull task) {
        AWSIoTDeleteScheduledAuditResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteSecurityProfileResponse *> *)deleteSecurityProfile:(AWSIoTDeleteSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/security-profiles/{securityProfileName}"
                  targetPrefix:@""
                 operationName:@"DeleteSecurityProfile"
                   outputClass:[AWSIoTDeleteSecurityProfileResponse class]];
}

- (void)deleteSecurityProfile:(AWSIoTDeleteSecurityProfileRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteSecurityProfileResponse *response, NSError *error))completionHandler {
    [[self deleteSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteSecurityProfileResponse *> * _Nonnull task) {
        AWSIoTDeleteSecurityProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteStreamResponse *> *)deleteStream:(AWSIoTDeleteStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/streams/{streamId}"
                  targetPrefix:@""
                 operationName:@"DeleteStream"
                   outputClass:[AWSIoTDeleteStreamResponse class]];
}

- (void)deleteStream:(AWSIoTDeleteStreamRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteStreamResponse *response, NSError *error))completionHandler {
    [[self deleteStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteStreamResponse *> * _Nonnull task) {
        AWSIoTDeleteStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteThingGroupResponse *> *)deleteThingGroup:(AWSIoTDeleteThingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/thing-groups/{thingGroupName}"
                  targetPrefix:@""
                 operationName:@"DeleteThingGroup"
                   outputClass:[AWSIoTDeleteThingGroupResponse class]];
}

- (void)deleteThingGroup:(AWSIoTDeleteThingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteThingGroupResponse *response, NSError *error))completionHandler {
    [[self deleteThingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteThingGroupResponse *> * _Nonnull task) {
        AWSIoTDeleteThingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeleteThingTypeResponse *> *)deleteThingType:(AWSIoTDeleteThingTypeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/thing-types/{thingTypeName}"
                  targetPrefix:@""
                 operationName:@"DeleteThingType"
                   outputClass:[AWSIoTDeleteThingTypeResponse class]];
}

- (void)deleteThingType:(AWSIoTDeleteThingTypeRequest *)request
     completionHandler:(void (^)(AWSIoTDeleteThingTypeResponse *response, NSError *error))completionHandler {
    [[self deleteThingType:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeleteThingTypeResponse *> * _Nonnull task) {
        AWSIoTDeleteThingTypeResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteV2LoggingLevel:(AWSIoTDeleteV2LoggingLevelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2LoggingLevel"
                  targetPrefix:@""
                 operationName:@"DeleteV2LoggingLevel"
                   outputClass:nil];
}

- (void)deleteV2LoggingLevel:(AWSIoTDeleteV2LoggingLevelRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteV2LoggingLevel:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDeprecateThingTypeResponse *> *)deprecateThingType:(AWSIoTDeprecateThingTypeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/thing-types/{thingTypeName}/deprecate"
                  targetPrefix:@""
                 operationName:@"DeprecateThingType"
                   outputClass:[AWSIoTDeprecateThingTypeResponse class]];
}

- (void)deprecateThingType:(AWSIoTDeprecateThingTypeRequest *)request
     completionHandler:(void (^)(AWSIoTDeprecateThingTypeResponse *response, NSError *error))completionHandler {
    [[self deprecateThingType:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDeprecateThingTypeResponse *> * _Nonnull task) {
        AWSIoTDeprecateThingTypeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeAccountAuditConfigurationResponse *> *)describeAccountAuditConfiguration:(AWSIoTDescribeAccountAuditConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/audit/configuration"
                  targetPrefix:@""
                 operationName:@"DescribeAccountAuditConfiguration"
                   outputClass:[AWSIoTDescribeAccountAuditConfigurationResponse class]];
}

- (void)describeAccountAuditConfiguration:(AWSIoTDescribeAccountAuditConfigurationRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeAccountAuditConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeAccountAuditConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeAccountAuditConfigurationResponse *> * _Nonnull task) {
        AWSIoTDescribeAccountAuditConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeAuditFindingResponse *> *)describeAuditFinding:(AWSIoTDescribeAuditFindingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/audit/findings/{findingId}"
                  targetPrefix:@""
                 operationName:@"DescribeAuditFinding"
                   outputClass:[AWSIoTDescribeAuditFindingResponse class]];
}

- (void)describeAuditFinding:(AWSIoTDescribeAuditFindingRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeAuditFindingResponse *response, NSError *error))completionHandler {
    [[self describeAuditFinding:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeAuditFindingResponse *> * _Nonnull task) {
        AWSIoTDescribeAuditFindingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeAuditMitigationActionsTaskResponse *> *)describeAuditMitigationActionsTask:(AWSIoTDescribeAuditMitigationActionsTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/audit/mitigationactions/tasks/{taskId}"
                  targetPrefix:@""
                 operationName:@"DescribeAuditMitigationActionsTask"
                   outputClass:[AWSIoTDescribeAuditMitigationActionsTaskResponse class]];
}

- (void)describeAuditMitigationActionsTask:(AWSIoTDescribeAuditMitigationActionsTaskRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeAuditMitigationActionsTaskResponse *response, NSError *error))completionHandler {
    [[self describeAuditMitigationActionsTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeAuditMitigationActionsTaskResponse *> * _Nonnull task) {
        AWSIoTDescribeAuditMitigationActionsTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeAuditTaskResponse *> *)describeAuditTask:(AWSIoTDescribeAuditTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/audit/tasks/{taskId}"
                  targetPrefix:@""
                 operationName:@"DescribeAuditTask"
                   outputClass:[AWSIoTDescribeAuditTaskResponse class]];
}

- (void)describeAuditTask:(AWSIoTDescribeAuditTaskRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeAuditTaskResponse *response, NSError *error))completionHandler {
    [[self describeAuditTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeAuditTaskResponse *> * _Nonnull task) {
        AWSIoTDescribeAuditTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeAuthorizerResponse *> *)describeAuthorizer:(AWSIoTDescribeAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/authorizer/{authorizerName}"
                  targetPrefix:@""
                 operationName:@"DescribeAuthorizer"
                   outputClass:[AWSIoTDescribeAuthorizerResponse class]];
}

- (void)describeAuthorizer:(AWSIoTDescribeAuthorizerRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeAuthorizerResponse *response, NSError *error))completionHandler {
    [[self describeAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeAuthorizerResponse *> * _Nonnull task) {
        AWSIoTDescribeAuthorizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeBillingGroupResponse *> *)describeBillingGroup:(AWSIoTDescribeBillingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/billing-groups/{billingGroupName}"
                  targetPrefix:@""
                 operationName:@"DescribeBillingGroup"
                   outputClass:[AWSIoTDescribeBillingGroupResponse class]];
}

- (void)describeBillingGroup:(AWSIoTDescribeBillingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeBillingGroupResponse *response, NSError *error))completionHandler {
    [[self describeBillingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeBillingGroupResponse *> * _Nonnull task) {
        AWSIoTDescribeBillingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeCACertificateResponse *> *)describeCACertificate:(AWSIoTDescribeCACertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/cacertificate/{caCertificateId}"
                  targetPrefix:@""
                 operationName:@"DescribeCACertificate"
                   outputClass:[AWSIoTDescribeCACertificateResponse class]];
}

- (void)describeCACertificate:(AWSIoTDescribeCACertificateRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeCACertificateResponse *response, NSError *error))completionHandler {
    [[self describeCACertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeCACertificateResponse *> * _Nonnull task) {
        AWSIoTDescribeCACertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeDefaultAuthorizerResponse *> *)describeDefaultAuthorizer:(AWSIoTDescribeDefaultAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/default-authorizer"
                  targetPrefix:@""
                 operationName:@"DescribeDefaultAuthorizer"
                   outputClass:[AWSIoTDescribeDefaultAuthorizerResponse class]];
}

- (void)describeDefaultAuthorizer:(AWSIoTDescribeDefaultAuthorizerRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeDefaultAuthorizerResponse *response, NSError *error))completionHandler {
    [[self describeDefaultAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeDefaultAuthorizerResponse *> * _Nonnull task) {
        AWSIoTDescribeDefaultAuthorizerResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeEventConfigurationsResponse *> *)describeEventConfigurations:(AWSIoTDescribeEventConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/event-configurations"
                  targetPrefix:@""
                 operationName:@"DescribeEventConfigurations"
                   outputClass:[AWSIoTDescribeEventConfigurationsResponse class]];
}

- (void)describeEventConfigurations:(AWSIoTDescribeEventConfigurationsRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeEventConfigurationsResponse *response, NSError *error))completionHandler {
    [[self describeEventConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeEventConfigurationsResponse *> * _Nonnull task) {
        AWSIoTDescribeEventConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeIndexResponse *> *)describeIndex:(AWSIoTDescribeIndexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/indices/{indexName}"
                  targetPrefix:@""
                 operationName:@"DescribeIndex"
                   outputClass:[AWSIoTDescribeIndexResponse class]];
}

- (void)describeIndex:(AWSIoTDescribeIndexRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeIndexResponse *response, NSError *error))completionHandler {
    [[self describeIndex:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeIndexResponse *> * _Nonnull task) {
        AWSIoTDescribeIndexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeJobResponse *> *)describeJob:(AWSIoTDescribeJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/jobs/{jobId}"
                  targetPrefix:@""
                 operationName:@"DescribeJob"
                   outputClass:[AWSIoTDescribeJobResponse class]];
}

- (void)describeJob:(AWSIoTDescribeJobRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeJobResponse *response, NSError *error))completionHandler {
    [[self describeJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeJobResponse *> * _Nonnull task) {
        AWSIoTDescribeJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeJobExecutionResponse *> *)describeJobExecution:(AWSIoTDescribeJobExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/things/{thingName}/jobs/{jobId}"
                  targetPrefix:@""
                 operationName:@"DescribeJobExecution"
                   outputClass:[AWSIoTDescribeJobExecutionResponse class]];
}

- (void)describeJobExecution:(AWSIoTDescribeJobExecutionRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeJobExecutionResponse *response, NSError *error))completionHandler {
    [[self describeJobExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeJobExecutionResponse *> * _Nonnull task) {
        AWSIoTDescribeJobExecutionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeMitigationActionResponse *> *)describeMitigationAction:(AWSIoTDescribeMitigationActionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/mitigationactions/actions/{actionName}"
                  targetPrefix:@""
                 operationName:@"DescribeMitigationAction"
                   outputClass:[AWSIoTDescribeMitigationActionResponse class]];
}

- (void)describeMitigationAction:(AWSIoTDescribeMitigationActionRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeMitigationActionResponse *response, NSError *error))completionHandler {
    [[self describeMitigationAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeMitigationActionResponse *> * _Nonnull task) {
        AWSIoTDescribeMitigationActionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeRoleAliasResponse *> *)describeRoleAlias:(AWSIoTDescribeRoleAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/role-aliases/{roleAlias}"
                  targetPrefix:@""
                 operationName:@"DescribeRoleAlias"
                   outputClass:[AWSIoTDescribeRoleAliasResponse class]];
}

- (void)describeRoleAlias:(AWSIoTDescribeRoleAliasRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeRoleAliasResponse *response, NSError *error))completionHandler {
    [[self describeRoleAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeRoleAliasResponse *> * _Nonnull task) {
        AWSIoTDescribeRoleAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeScheduledAuditResponse *> *)describeScheduledAudit:(AWSIoTDescribeScheduledAuditRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/audit/scheduledaudits/{scheduledAuditName}"
                  targetPrefix:@""
                 operationName:@"DescribeScheduledAudit"
                   outputClass:[AWSIoTDescribeScheduledAuditResponse class]];
}

- (void)describeScheduledAudit:(AWSIoTDescribeScheduledAuditRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeScheduledAuditResponse *response, NSError *error))completionHandler {
    [[self describeScheduledAudit:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeScheduledAuditResponse *> * _Nonnull task) {
        AWSIoTDescribeScheduledAuditResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeSecurityProfileResponse *> *)describeSecurityProfile:(AWSIoTDescribeSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/security-profiles/{securityProfileName}"
                  targetPrefix:@""
                 operationName:@"DescribeSecurityProfile"
                   outputClass:[AWSIoTDescribeSecurityProfileResponse class]];
}

- (void)describeSecurityProfile:(AWSIoTDescribeSecurityProfileRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeSecurityProfileResponse *response, NSError *error))completionHandler {
    [[self describeSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeSecurityProfileResponse *> * _Nonnull task) {
        AWSIoTDescribeSecurityProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeStreamResponse *> *)describeStream:(AWSIoTDescribeStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/streams/{streamId}"
                  targetPrefix:@""
                 operationName:@"DescribeStream"
                   outputClass:[AWSIoTDescribeStreamResponse class]];
}

- (void)describeStream:(AWSIoTDescribeStreamRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeStreamResponse *response, NSError *error))completionHandler {
    [[self describeStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeStreamResponse *> * _Nonnull task) {
        AWSIoTDescribeStreamResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeThingGroupResponse *> *)describeThingGroup:(AWSIoTDescribeThingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/thing-groups/{thingGroupName}"
                  targetPrefix:@""
                 operationName:@"DescribeThingGroup"
                   outputClass:[AWSIoTDescribeThingGroupResponse class]];
}

- (void)describeThingGroup:(AWSIoTDescribeThingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeThingGroupResponse *response, NSError *error))completionHandler {
    [[self describeThingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeThingGroupResponse *> * _Nonnull task) {
        AWSIoTDescribeThingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeThingRegistrationTaskResponse *> *)describeThingRegistrationTask:(AWSIoTDescribeThingRegistrationTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/thing-registration-tasks/{taskId}"
                  targetPrefix:@""
                 operationName:@"DescribeThingRegistrationTask"
                   outputClass:[AWSIoTDescribeThingRegistrationTaskResponse class]];
}

- (void)describeThingRegistrationTask:(AWSIoTDescribeThingRegistrationTaskRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeThingRegistrationTaskResponse *response, NSError *error))completionHandler {
    [[self describeThingRegistrationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeThingRegistrationTaskResponse *> * _Nonnull task) {
        AWSIoTDescribeThingRegistrationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDescribeThingTypeResponse *> *)describeThingType:(AWSIoTDescribeThingTypeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/thing-types/{thingTypeName}"
                  targetPrefix:@""
                 operationName:@"DescribeThingType"
                   outputClass:[AWSIoTDescribeThingTypeResponse class]];
}

- (void)describeThingType:(AWSIoTDescribeThingTypeRequest *)request
     completionHandler:(void (^)(AWSIoTDescribeThingTypeResponse *response, NSError *error))completionHandler {
    [[self describeThingType:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDescribeThingTypeResponse *> * _Nonnull task) {
        AWSIoTDescribeThingTypeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)detachPolicy:(AWSIoTDetachPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/target-policies/{policyName}"
                  targetPrefix:@""
                 operationName:@"DetachPolicy"
                   outputClass:nil];
}

- (void)detachPolicy:(AWSIoTDetachPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self detachPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTDetachSecurityProfileResponse *> *)detachSecurityProfile:(AWSIoTDetachSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/security-profiles/{securityProfileName}/targets"
                  targetPrefix:@""
                 operationName:@"DetachSecurityProfile"
                   outputClass:[AWSIoTDetachSecurityProfileResponse class]];
}

- (void)detachSecurityProfile:(AWSIoTDetachSecurityProfileRequest *)request
     completionHandler:(void (^)(AWSIoTDetachSecurityProfileResponse *response, NSError *error))completionHandler {
    [[self detachSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTDetachSecurityProfileResponse *> * _Nonnull task) {
        AWSIoTDetachSecurityProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disableTopicRule:(AWSIoTDisableTopicRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/rules/{ruleName}/disable"
                  targetPrefix:@""
                 operationName:@"DisableTopicRule"
                   outputClass:nil];
}

- (void)disableTopicRule:(AWSIoTDisableTopicRuleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disableTopicRule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)enableTopicRule:(AWSIoTEnableTopicRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/rules/{ruleName}/enable"
                  targetPrefix:@""
                 operationName:@"EnableTopicRule"
                   outputClass:nil];
}

- (void)enableTopicRule:(AWSIoTEnableTopicRuleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self enableTopicRule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTGetEffectivePoliciesResponse *> *)getEffectivePolicies:(AWSIoTGetEffectivePoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/effective-policies"
                  targetPrefix:@""
                 operationName:@"GetEffectivePolicies"
                   outputClass:[AWSIoTGetEffectivePoliciesResponse class]];
}

- (void)getEffectivePolicies:(AWSIoTGetEffectivePoliciesRequest *)request
     completionHandler:(void (^)(AWSIoTGetEffectivePoliciesResponse *response, NSError *error))completionHandler {
    [[self getEffectivePolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetEffectivePoliciesResponse *> * _Nonnull task) {
        AWSIoTGetEffectivePoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTGetIndexingConfigurationResponse *> *)getIndexingConfiguration:(AWSIoTGetIndexingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/indexing/config"
                  targetPrefix:@""
                 operationName:@"GetIndexingConfiguration"
                   outputClass:[AWSIoTGetIndexingConfigurationResponse class]];
}

- (void)getIndexingConfiguration:(AWSIoTGetIndexingConfigurationRequest *)request
     completionHandler:(void (^)(AWSIoTGetIndexingConfigurationResponse *response, NSError *error))completionHandler {
    [[self getIndexingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetIndexingConfigurationResponse *> * _Nonnull task) {
        AWSIoTGetIndexingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTGetJobDocumentResponse *> *)getJobDocument:(AWSIoTGetJobDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/jobs/{jobId}/job-document"
                  targetPrefix:@""
                 operationName:@"GetJobDocument"
                   outputClass:[AWSIoTGetJobDocumentResponse class]];
}

- (void)getJobDocument:(AWSIoTGetJobDocumentRequest *)request
     completionHandler:(void (^)(AWSIoTGetJobDocumentResponse *response, NSError *error))completionHandler {
    [[self getJobDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetJobDocumentResponse *> * _Nonnull task) {
        AWSIoTGetJobDocumentResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTGetOTAUpdateResponse *> *)getOTAUpdate:(AWSIoTGetOTAUpdateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/otaUpdates/{otaUpdateId}"
                  targetPrefix:@""
                 operationName:@"GetOTAUpdate"
                   outputClass:[AWSIoTGetOTAUpdateResponse class]];
}

- (void)getOTAUpdate:(AWSIoTGetOTAUpdateRequest *)request
     completionHandler:(void (^)(AWSIoTGetOTAUpdateResponse *response, NSError *error))completionHandler {
    [[self getOTAUpdate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetOTAUpdateResponse *> * _Nonnull task) {
        AWSIoTGetOTAUpdateResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTGetRegistrationCodeResponse *> *)getRegistrationCode:(AWSIoTGetRegistrationCodeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/registrationcode"
                  targetPrefix:@""
                 operationName:@"GetRegistrationCode"
                   outputClass:[AWSIoTGetRegistrationCodeResponse class]];
}

- (void)getRegistrationCode:(AWSIoTGetRegistrationCodeRequest *)request
     completionHandler:(void (^)(AWSIoTGetRegistrationCodeResponse *response, NSError *error))completionHandler {
    [[self getRegistrationCode:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetRegistrationCodeResponse *> * _Nonnull task) {
        AWSIoTGetRegistrationCodeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTGetStatisticsResponse *> *)getStatistics:(AWSIoTGetStatisticsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/indices/statistics"
                  targetPrefix:@""
                 operationName:@"GetStatistics"
                   outputClass:[AWSIoTGetStatisticsResponse class]];
}

- (void)getStatistics:(AWSIoTGetStatisticsRequest *)request
     completionHandler:(void (^)(AWSIoTGetStatisticsResponse *response, NSError *error))completionHandler {
    [[self getStatistics:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetStatisticsResponse *> * _Nonnull task) {
        AWSIoTGetStatisticsResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTGetV2LoggingOptionsResponse *> *)getV2LoggingOptions:(AWSIoTGetV2LoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2LoggingOptions"
                  targetPrefix:@""
                 operationName:@"GetV2LoggingOptions"
                   outputClass:[AWSIoTGetV2LoggingOptionsResponse class]];
}

- (void)getV2LoggingOptions:(AWSIoTGetV2LoggingOptionsRequest *)request
     completionHandler:(void (^)(AWSIoTGetV2LoggingOptionsResponse *response, NSError *error))completionHandler {
    [[self getV2LoggingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTGetV2LoggingOptionsResponse *> * _Nonnull task) {
        AWSIoTGetV2LoggingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListActiveViolationsResponse *> *)listActiveViolations:(AWSIoTListActiveViolationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/active-violations"
                  targetPrefix:@""
                 operationName:@"ListActiveViolations"
                   outputClass:[AWSIoTListActiveViolationsResponse class]];
}

- (void)listActiveViolations:(AWSIoTListActiveViolationsRequest *)request
     completionHandler:(void (^)(AWSIoTListActiveViolationsResponse *response, NSError *error))completionHandler {
    [[self listActiveViolations:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListActiveViolationsResponse *> * _Nonnull task) {
        AWSIoTListActiveViolationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListAttachedPoliciesResponse *> *)listAttachedPolicies:(AWSIoTListAttachedPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/attached-policies/{target}"
                  targetPrefix:@""
                 operationName:@"ListAttachedPolicies"
                   outputClass:[AWSIoTListAttachedPoliciesResponse class]];
}

- (void)listAttachedPolicies:(AWSIoTListAttachedPoliciesRequest *)request
     completionHandler:(void (^)(AWSIoTListAttachedPoliciesResponse *response, NSError *error))completionHandler {
    [[self listAttachedPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListAttachedPoliciesResponse *> * _Nonnull task) {
        AWSIoTListAttachedPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListAuditFindingsResponse *> *)listAuditFindings:(AWSIoTListAuditFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/audit/findings"
                  targetPrefix:@""
                 operationName:@"ListAuditFindings"
                   outputClass:[AWSIoTListAuditFindingsResponse class]];
}

- (void)listAuditFindings:(AWSIoTListAuditFindingsRequest *)request
     completionHandler:(void (^)(AWSIoTListAuditFindingsResponse *response, NSError *error))completionHandler {
    [[self listAuditFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListAuditFindingsResponse *> * _Nonnull task) {
        AWSIoTListAuditFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListAuditMitigationActionsExecutionsResponse *> *)listAuditMitigationActionsExecutions:(AWSIoTListAuditMitigationActionsExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/audit/mitigationactions/executions"
                  targetPrefix:@""
                 operationName:@"ListAuditMitigationActionsExecutions"
                   outputClass:[AWSIoTListAuditMitigationActionsExecutionsResponse class]];
}

- (void)listAuditMitigationActionsExecutions:(AWSIoTListAuditMitigationActionsExecutionsRequest *)request
     completionHandler:(void (^)(AWSIoTListAuditMitigationActionsExecutionsResponse *response, NSError *error))completionHandler {
    [[self listAuditMitigationActionsExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListAuditMitigationActionsExecutionsResponse *> * _Nonnull task) {
        AWSIoTListAuditMitigationActionsExecutionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListAuditMitigationActionsTasksResponse *> *)listAuditMitigationActionsTasks:(AWSIoTListAuditMitigationActionsTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/audit/mitigationactions/tasks"
                  targetPrefix:@""
                 operationName:@"ListAuditMitigationActionsTasks"
                   outputClass:[AWSIoTListAuditMitigationActionsTasksResponse class]];
}

- (void)listAuditMitigationActionsTasks:(AWSIoTListAuditMitigationActionsTasksRequest *)request
     completionHandler:(void (^)(AWSIoTListAuditMitigationActionsTasksResponse *response, NSError *error))completionHandler {
    [[self listAuditMitigationActionsTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListAuditMitigationActionsTasksResponse *> * _Nonnull task) {
        AWSIoTListAuditMitigationActionsTasksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListAuditTasksResponse *> *)listAuditTasks:(AWSIoTListAuditTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/audit/tasks"
                  targetPrefix:@""
                 operationName:@"ListAuditTasks"
                   outputClass:[AWSIoTListAuditTasksResponse class]];
}

- (void)listAuditTasks:(AWSIoTListAuditTasksRequest *)request
     completionHandler:(void (^)(AWSIoTListAuditTasksResponse *response, NSError *error))completionHandler {
    [[self listAuditTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListAuditTasksResponse *> * _Nonnull task) {
        AWSIoTListAuditTasksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListAuthorizersResponse *> *)listAuthorizers:(AWSIoTListAuthorizersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/authorizers/"
                  targetPrefix:@""
                 operationName:@"ListAuthorizers"
                   outputClass:[AWSIoTListAuthorizersResponse class]];
}

- (void)listAuthorizers:(AWSIoTListAuthorizersRequest *)request
     completionHandler:(void (^)(AWSIoTListAuthorizersResponse *response, NSError *error))completionHandler {
    [[self listAuthorizers:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListAuthorizersResponse *> * _Nonnull task) {
        AWSIoTListAuthorizersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListBillingGroupsResponse *> *)listBillingGroups:(AWSIoTListBillingGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/billing-groups"
                  targetPrefix:@""
                 operationName:@"ListBillingGroups"
                   outputClass:[AWSIoTListBillingGroupsResponse class]];
}

- (void)listBillingGroups:(AWSIoTListBillingGroupsRequest *)request
     completionHandler:(void (^)(AWSIoTListBillingGroupsResponse *response, NSError *error))completionHandler {
    [[self listBillingGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListBillingGroupsResponse *> * _Nonnull task) {
        AWSIoTListBillingGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListCACertificatesResponse *> *)listCACertificates:(AWSIoTListCACertificatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/cacertificates"
                  targetPrefix:@""
                 operationName:@"ListCACertificates"
                   outputClass:[AWSIoTListCACertificatesResponse class]];
}

- (void)listCACertificates:(AWSIoTListCACertificatesRequest *)request
     completionHandler:(void (^)(AWSIoTListCACertificatesResponse *response, NSError *error))completionHandler {
    [[self listCACertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListCACertificatesResponse *> * _Nonnull task) {
        AWSIoTListCACertificatesResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListCertificatesByCAResponse *> *)listCertificatesByCA:(AWSIoTListCertificatesByCARequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/certificates-by-ca/{caCertificateId}"
                  targetPrefix:@""
                 operationName:@"ListCertificatesByCA"
                   outputClass:[AWSIoTListCertificatesByCAResponse class]];
}

- (void)listCertificatesByCA:(AWSIoTListCertificatesByCARequest *)request
     completionHandler:(void (^)(AWSIoTListCertificatesByCAResponse *response, NSError *error))completionHandler {
    [[self listCertificatesByCA:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListCertificatesByCAResponse *> * _Nonnull task) {
        AWSIoTListCertificatesByCAResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListIndicesResponse *> *)listIndices:(AWSIoTListIndicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/indices"
                  targetPrefix:@""
                 operationName:@"ListIndices"
                   outputClass:[AWSIoTListIndicesResponse class]];
}

- (void)listIndices:(AWSIoTListIndicesRequest *)request
     completionHandler:(void (^)(AWSIoTListIndicesResponse *response, NSError *error))completionHandler {
    [[self listIndices:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListIndicesResponse *> * _Nonnull task) {
        AWSIoTListIndicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListJobExecutionsForJobResponse *> *)listJobExecutionsForJob:(AWSIoTListJobExecutionsForJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/jobs/{jobId}/things"
                  targetPrefix:@""
                 operationName:@"ListJobExecutionsForJob"
                   outputClass:[AWSIoTListJobExecutionsForJobResponse class]];
}

- (void)listJobExecutionsForJob:(AWSIoTListJobExecutionsForJobRequest *)request
     completionHandler:(void (^)(AWSIoTListJobExecutionsForJobResponse *response, NSError *error))completionHandler {
    [[self listJobExecutionsForJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListJobExecutionsForJobResponse *> * _Nonnull task) {
        AWSIoTListJobExecutionsForJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListJobExecutionsForThingResponse *> *)listJobExecutionsForThing:(AWSIoTListJobExecutionsForThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/things/{thingName}/jobs"
                  targetPrefix:@""
                 operationName:@"ListJobExecutionsForThing"
                   outputClass:[AWSIoTListJobExecutionsForThingResponse class]];
}

- (void)listJobExecutionsForThing:(AWSIoTListJobExecutionsForThingRequest *)request
     completionHandler:(void (^)(AWSIoTListJobExecutionsForThingResponse *response, NSError *error))completionHandler {
    [[self listJobExecutionsForThing:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListJobExecutionsForThingResponse *> * _Nonnull task) {
        AWSIoTListJobExecutionsForThingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListJobsResponse *> *)listJobs:(AWSIoTListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/jobs"
                  targetPrefix:@""
                 operationName:@"ListJobs"
                   outputClass:[AWSIoTListJobsResponse class]];
}

- (void)listJobs:(AWSIoTListJobsRequest *)request
     completionHandler:(void (^)(AWSIoTListJobsResponse *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListJobsResponse *> * _Nonnull task) {
        AWSIoTListJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListMitigationActionsResponse *> *)listMitigationActions:(AWSIoTListMitigationActionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/mitigationactions/actions"
                  targetPrefix:@""
                 operationName:@"ListMitigationActions"
                   outputClass:[AWSIoTListMitigationActionsResponse class]];
}

- (void)listMitigationActions:(AWSIoTListMitigationActionsRequest *)request
     completionHandler:(void (^)(AWSIoTListMitigationActionsResponse *response, NSError *error))completionHandler {
    [[self listMitigationActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListMitigationActionsResponse *> * _Nonnull task) {
        AWSIoTListMitigationActionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListOTAUpdatesResponse *> *)listOTAUpdates:(AWSIoTListOTAUpdatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/otaUpdates"
                  targetPrefix:@""
                 operationName:@"ListOTAUpdates"
                   outputClass:[AWSIoTListOTAUpdatesResponse class]];
}

- (void)listOTAUpdates:(AWSIoTListOTAUpdatesRequest *)request
     completionHandler:(void (^)(AWSIoTListOTAUpdatesResponse *response, NSError *error))completionHandler {
    [[self listOTAUpdates:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListOTAUpdatesResponse *> * _Nonnull task) {
        AWSIoTListOTAUpdatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListOutgoingCertificatesResponse *> *)listOutgoingCertificates:(AWSIoTListOutgoingCertificatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/certificates-out-going"
                  targetPrefix:@""
                 operationName:@"ListOutgoingCertificates"
                   outputClass:[AWSIoTListOutgoingCertificatesResponse class]];
}

- (void)listOutgoingCertificates:(AWSIoTListOutgoingCertificatesRequest *)request
     completionHandler:(void (^)(AWSIoTListOutgoingCertificatesResponse *response, NSError *error))completionHandler {
    [[self listOutgoingCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListOutgoingCertificatesResponse *> * _Nonnull task) {
        AWSIoTListOutgoingCertificatesResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListPolicyPrincipalsResponse *> *)listPolicyPrincipals:(AWSIoTListPolicyPrincipalsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policy-principals"
                  targetPrefix:@""
                 operationName:@"ListPolicyPrincipals"
                   outputClass:[AWSIoTListPolicyPrincipalsResponse class]];
}

- (void)listPolicyPrincipals:(AWSIoTListPolicyPrincipalsRequest *)request
     completionHandler:(void (^)(AWSIoTListPolicyPrincipalsResponse *response, NSError *error))completionHandler {
    [[self listPolicyPrincipals:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListPolicyPrincipalsResponse *> * _Nonnull task) {
        AWSIoTListPolicyPrincipalsResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListRoleAliasesResponse *> *)listRoleAliases:(AWSIoTListRoleAliasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/role-aliases"
                  targetPrefix:@""
                 operationName:@"ListRoleAliases"
                   outputClass:[AWSIoTListRoleAliasesResponse class]];
}

- (void)listRoleAliases:(AWSIoTListRoleAliasesRequest *)request
     completionHandler:(void (^)(AWSIoTListRoleAliasesResponse *response, NSError *error))completionHandler {
    [[self listRoleAliases:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListRoleAliasesResponse *> * _Nonnull task) {
        AWSIoTListRoleAliasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListScheduledAuditsResponse *> *)listScheduledAudits:(AWSIoTListScheduledAuditsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/audit/scheduledaudits"
                  targetPrefix:@""
                 operationName:@"ListScheduledAudits"
                   outputClass:[AWSIoTListScheduledAuditsResponse class]];
}

- (void)listScheduledAudits:(AWSIoTListScheduledAuditsRequest *)request
     completionHandler:(void (^)(AWSIoTListScheduledAuditsResponse *response, NSError *error))completionHandler {
    [[self listScheduledAudits:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListScheduledAuditsResponse *> * _Nonnull task) {
        AWSIoTListScheduledAuditsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListSecurityProfilesResponse *> *)listSecurityProfiles:(AWSIoTListSecurityProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/security-profiles"
                  targetPrefix:@""
                 operationName:@"ListSecurityProfiles"
                   outputClass:[AWSIoTListSecurityProfilesResponse class]];
}

- (void)listSecurityProfiles:(AWSIoTListSecurityProfilesRequest *)request
     completionHandler:(void (^)(AWSIoTListSecurityProfilesResponse *response, NSError *error))completionHandler {
    [[self listSecurityProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListSecurityProfilesResponse *> * _Nonnull task) {
        AWSIoTListSecurityProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListSecurityProfilesForTargetResponse *> *)listSecurityProfilesForTarget:(AWSIoTListSecurityProfilesForTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/security-profiles-for-target"
                  targetPrefix:@""
                 operationName:@"ListSecurityProfilesForTarget"
                   outputClass:[AWSIoTListSecurityProfilesForTargetResponse class]];
}

- (void)listSecurityProfilesForTarget:(AWSIoTListSecurityProfilesForTargetRequest *)request
     completionHandler:(void (^)(AWSIoTListSecurityProfilesForTargetResponse *response, NSError *error))completionHandler {
    [[self listSecurityProfilesForTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListSecurityProfilesForTargetResponse *> * _Nonnull task) {
        AWSIoTListSecurityProfilesForTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListStreamsResponse *> *)listStreams:(AWSIoTListStreamsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/streams"
                  targetPrefix:@""
                 operationName:@"ListStreams"
                   outputClass:[AWSIoTListStreamsResponse class]];
}

- (void)listStreams:(AWSIoTListStreamsRequest *)request
     completionHandler:(void (^)(AWSIoTListStreamsResponse *response, NSError *error))completionHandler {
    [[self listStreams:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListStreamsResponse *> * _Nonnull task) {
        AWSIoTListStreamsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListTagsForResourceResponse *> *)listTagsForResource:(AWSIoTListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSIoTListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSIoTListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSIoTListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListTagsForResourceResponse *> * _Nonnull task) {
        AWSIoTListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListTargetsForPolicyResponse *> *)listTargetsForPolicy:(AWSIoTListTargetsForPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/policy-targets/{policyName}"
                  targetPrefix:@""
                 operationName:@"ListTargetsForPolicy"
                   outputClass:[AWSIoTListTargetsForPolicyResponse class]];
}

- (void)listTargetsForPolicy:(AWSIoTListTargetsForPolicyRequest *)request
     completionHandler:(void (^)(AWSIoTListTargetsForPolicyResponse *response, NSError *error))completionHandler {
    [[self listTargetsForPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListTargetsForPolicyResponse *> * _Nonnull task) {
        AWSIoTListTargetsForPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListTargetsForSecurityProfileResponse *> *)listTargetsForSecurityProfile:(AWSIoTListTargetsForSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/security-profiles/{securityProfileName}/targets"
                  targetPrefix:@""
                 operationName:@"ListTargetsForSecurityProfile"
                   outputClass:[AWSIoTListTargetsForSecurityProfileResponse class]];
}

- (void)listTargetsForSecurityProfile:(AWSIoTListTargetsForSecurityProfileRequest *)request
     completionHandler:(void (^)(AWSIoTListTargetsForSecurityProfileResponse *response, NSError *error))completionHandler {
    [[self listTargetsForSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListTargetsForSecurityProfileResponse *> * _Nonnull task) {
        AWSIoTListTargetsForSecurityProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListThingGroupsResponse *> *)listThingGroups:(AWSIoTListThingGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/thing-groups"
                  targetPrefix:@""
                 operationName:@"ListThingGroups"
                   outputClass:[AWSIoTListThingGroupsResponse class]];
}

- (void)listThingGroups:(AWSIoTListThingGroupsRequest *)request
     completionHandler:(void (^)(AWSIoTListThingGroupsResponse *response, NSError *error))completionHandler {
    [[self listThingGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListThingGroupsResponse *> * _Nonnull task) {
        AWSIoTListThingGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListThingGroupsForThingResponse *> *)listThingGroupsForThing:(AWSIoTListThingGroupsForThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/things/{thingName}/thing-groups"
                  targetPrefix:@""
                 operationName:@"ListThingGroupsForThing"
                   outputClass:[AWSIoTListThingGroupsForThingResponse class]];
}

- (void)listThingGroupsForThing:(AWSIoTListThingGroupsForThingRequest *)request
     completionHandler:(void (^)(AWSIoTListThingGroupsForThingResponse *response, NSError *error))completionHandler {
    [[self listThingGroupsForThing:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListThingGroupsForThingResponse *> * _Nonnull task) {
        AWSIoTListThingGroupsForThingResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListThingRegistrationTaskReportsResponse *> *)listThingRegistrationTaskReports:(AWSIoTListThingRegistrationTaskReportsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/thing-registration-tasks/{taskId}/reports"
                  targetPrefix:@""
                 operationName:@"ListThingRegistrationTaskReports"
                   outputClass:[AWSIoTListThingRegistrationTaskReportsResponse class]];
}

- (void)listThingRegistrationTaskReports:(AWSIoTListThingRegistrationTaskReportsRequest *)request
     completionHandler:(void (^)(AWSIoTListThingRegistrationTaskReportsResponse *response, NSError *error))completionHandler {
    [[self listThingRegistrationTaskReports:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListThingRegistrationTaskReportsResponse *> * _Nonnull task) {
        AWSIoTListThingRegistrationTaskReportsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListThingRegistrationTasksResponse *> *)listThingRegistrationTasks:(AWSIoTListThingRegistrationTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/thing-registration-tasks"
                  targetPrefix:@""
                 operationName:@"ListThingRegistrationTasks"
                   outputClass:[AWSIoTListThingRegistrationTasksResponse class]];
}

- (void)listThingRegistrationTasks:(AWSIoTListThingRegistrationTasksRequest *)request
     completionHandler:(void (^)(AWSIoTListThingRegistrationTasksResponse *response, NSError *error))completionHandler {
    [[self listThingRegistrationTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListThingRegistrationTasksResponse *> * _Nonnull task) {
        AWSIoTListThingRegistrationTasksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListThingTypesResponse *> *)listThingTypes:(AWSIoTListThingTypesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/thing-types"
                  targetPrefix:@""
                 operationName:@"ListThingTypes"
                   outputClass:[AWSIoTListThingTypesResponse class]];
}

- (void)listThingTypes:(AWSIoTListThingTypesRequest *)request
     completionHandler:(void (^)(AWSIoTListThingTypesResponse *response, NSError *error))completionHandler {
    [[self listThingTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListThingTypesResponse *> * _Nonnull task) {
        AWSIoTListThingTypesResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListThingsInBillingGroupResponse *> *)listThingsInBillingGroup:(AWSIoTListThingsInBillingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/billing-groups/{billingGroupName}/things"
                  targetPrefix:@""
                 operationName:@"ListThingsInBillingGroup"
                   outputClass:[AWSIoTListThingsInBillingGroupResponse class]];
}

- (void)listThingsInBillingGroup:(AWSIoTListThingsInBillingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTListThingsInBillingGroupResponse *response, NSError *error))completionHandler {
    [[self listThingsInBillingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListThingsInBillingGroupResponse *> * _Nonnull task) {
        AWSIoTListThingsInBillingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListThingsInThingGroupResponse *> *)listThingsInThingGroup:(AWSIoTListThingsInThingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/thing-groups/{thingGroupName}/things"
                  targetPrefix:@""
                 operationName:@"ListThingsInThingGroup"
                   outputClass:[AWSIoTListThingsInThingGroupResponse class]];
}

- (void)listThingsInThingGroup:(AWSIoTListThingsInThingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTListThingsInThingGroupResponse *response, NSError *error))completionHandler {
    [[self listThingsInThingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListThingsInThingGroupResponse *> * _Nonnull task) {
        AWSIoTListThingsInThingGroupResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListV2LoggingLevelsResponse *> *)listV2LoggingLevels:(AWSIoTListV2LoggingLevelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2LoggingLevel"
                  targetPrefix:@""
                 operationName:@"ListV2LoggingLevels"
                   outputClass:[AWSIoTListV2LoggingLevelsResponse class]];
}

- (void)listV2LoggingLevels:(AWSIoTListV2LoggingLevelsRequest *)request
     completionHandler:(void (^)(AWSIoTListV2LoggingLevelsResponse *response, NSError *error))completionHandler {
    [[self listV2LoggingLevels:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListV2LoggingLevelsResponse *> * _Nonnull task) {
        AWSIoTListV2LoggingLevelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTListViolationEventsResponse *> *)listViolationEvents:(AWSIoTListViolationEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/violation-events"
                  targetPrefix:@""
                 operationName:@"ListViolationEvents"
                   outputClass:[AWSIoTListViolationEventsResponse class]];
}

- (void)listViolationEvents:(AWSIoTListViolationEventsRequest *)request
     completionHandler:(void (^)(AWSIoTListViolationEventsResponse *response, NSError *error))completionHandler {
    [[self listViolationEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTListViolationEventsResponse *> * _Nonnull task) {
        AWSIoTListViolationEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTRegisterCACertificateResponse *> *)registerCACertificate:(AWSIoTRegisterCACertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/cacertificate"
                  targetPrefix:@""
                 operationName:@"RegisterCACertificate"
                   outputClass:[AWSIoTRegisterCACertificateResponse class]];
}

- (void)registerCACertificate:(AWSIoTRegisterCACertificateRequest *)request
     completionHandler:(void (^)(AWSIoTRegisterCACertificateResponse *response, NSError *error))completionHandler {
    [[self registerCACertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTRegisterCACertificateResponse *> * _Nonnull task) {
        AWSIoTRegisterCACertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTRegisterCertificateResponse *> *)registerCertificate:(AWSIoTRegisterCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/certificate/register"
                  targetPrefix:@""
                 operationName:@"RegisterCertificate"
                   outputClass:[AWSIoTRegisterCertificateResponse class]];
}

- (void)registerCertificate:(AWSIoTRegisterCertificateRequest *)request
     completionHandler:(void (^)(AWSIoTRegisterCertificateResponse *response, NSError *error))completionHandler {
    [[self registerCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTRegisterCertificateResponse *> * _Nonnull task) {
        AWSIoTRegisterCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTRegisterThingResponse *> *)registerThing:(AWSIoTRegisterThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/things"
                  targetPrefix:@""
                 operationName:@"RegisterThing"
                   outputClass:[AWSIoTRegisterThingResponse class]];
}

- (void)registerThing:(AWSIoTRegisterThingRequest *)request
     completionHandler:(void (^)(AWSIoTRegisterThingResponse *response, NSError *error))completionHandler {
    [[self registerThing:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTRegisterThingResponse *> * _Nonnull task) {
        AWSIoTRegisterThingResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTRemoveThingFromBillingGroupResponse *> *)removeThingFromBillingGroup:(AWSIoTRemoveThingFromBillingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/billing-groups/removeThingFromBillingGroup"
                  targetPrefix:@""
                 operationName:@"RemoveThingFromBillingGroup"
                   outputClass:[AWSIoTRemoveThingFromBillingGroupResponse class]];
}

- (void)removeThingFromBillingGroup:(AWSIoTRemoveThingFromBillingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTRemoveThingFromBillingGroupResponse *response, NSError *error))completionHandler {
    [[self removeThingFromBillingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTRemoveThingFromBillingGroupResponse *> * _Nonnull task) {
        AWSIoTRemoveThingFromBillingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTRemoveThingFromThingGroupResponse *> *)removeThingFromThingGroup:(AWSIoTRemoveThingFromThingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/thing-groups/removeThingFromThingGroup"
                  targetPrefix:@""
                 operationName:@"RemoveThingFromThingGroup"
                   outputClass:[AWSIoTRemoveThingFromThingGroupResponse class]];
}

- (void)removeThingFromThingGroup:(AWSIoTRemoveThingFromThingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTRemoveThingFromThingGroupResponse *response, NSError *error))completionHandler {
    [[self removeThingFromThingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTRemoveThingFromThingGroupResponse *> * _Nonnull task) {
        AWSIoTRemoveThingFromThingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTSearchIndexResponse *> *)searchIndex:(AWSIoTSearchIndexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/indices/search"
                  targetPrefix:@""
                 operationName:@"SearchIndex"
                   outputClass:[AWSIoTSearchIndexResponse class]];
}

- (void)searchIndex:(AWSIoTSearchIndexRequest *)request
     completionHandler:(void (^)(AWSIoTSearchIndexResponse *response, NSError *error))completionHandler {
    [[self searchIndex:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTSearchIndexResponse *> * _Nonnull task) {
        AWSIoTSearchIndexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTSetDefaultAuthorizerResponse *> *)setDefaultAuthorizer:(AWSIoTSetDefaultAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/default-authorizer"
                  targetPrefix:@""
                 operationName:@"SetDefaultAuthorizer"
                   outputClass:[AWSIoTSetDefaultAuthorizerResponse class]];
}

- (void)setDefaultAuthorizer:(AWSIoTSetDefaultAuthorizerRequest *)request
     completionHandler:(void (^)(AWSIoTSetDefaultAuthorizerResponse *response, NSError *error))completionHandler {
    [[self setDefaultAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTSetDefaultAuthorizerResponse *> * _Nonnull task) {
        AWSIoTSetDefaultAuthorizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)setV2LoggingLevel:(AWSIoTSetV2LoggingLevelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2LoggingLevel"
                  targetPrefix:@""
                 operationName:@"SetV2LoggingLevel"
                   outputClass:nil];
}

- (void)setV2LoggingLevel:(AWSIoTSetV2LoggingLevelRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setV2LoggingLevel:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)setV2LoggingOptions:(AWSIoTSetV2LoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2LoggingOptions"
                  targetPrefix:@""
                 operationName:@"SetV2LoggingOptions"
                   outputClass:nil];
}

- (void)setV2LoggingOptions:(AWSIoTSetV2LoggingOptionsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setV2LoggingOptions:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTStartAuditMitigationActionsTaskResponse *> *)startAuditMitigationActionsTask:(AWSIoTStartAuditMitigationActionsTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/audit/mitigationactions/tasks/{taskId}"
                  targetPrefix:@""
                 operationName:@"StartAuditMitigationActionsTask"
                   outputClass:[AWSIoTStartAuditMitigationActionsTaskResponse class]];
}

- (void)startAuditMitigationActionsTask:(AWSIoTStartAuditMitigationActionsTaskRequest *)request
     completionHandler:(void (^)(AWSIoTStartAuditMitigationActionsTaskResponse *response, NSError *error))completionHandler {
    [[self startAuditMitigationActionsTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTStartAuditMitigationActionsTaskResponse *> * _Nonnull task) {
        AWSIoTStartAuditMitigationActionsTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTStartOnDemandAuditTaskResponse *> *)startOnDemandAuditTask:(AWSIoTStartOnDemandAuditTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/audit/tasks"
                  targetPrefix:@""
                 operationName:@"StartOnDemandAuditTask"
                   outputClass:[AWSIoTStartOnDemandAuditTaskResponse class]];
}

- (void)startOnDemandAuditTask:(AWSIoTStartOnDemandAuditTaskRequest *)request
     completionHandler:(void (^)(AWSIoTStartOnDemandAuditTaskResponse *response, NSError *error))completionHandler {
    [[self startOnDemandAuditTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTStartOnDemandAuditTaskResponse *> * _Nonnull task) {
        AWSIoTStartOnDemandAuditTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTStartThingRegistrationTaskResponse *> *)startThingRegistrationTask:(AWSIoTStartThingRegistrationTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/thing-registration-tasks"
                  targetPrefix:@""
                 operationName:@"StartThingRegistrationTask"
                   outputClass:[AWSIoTStartThingRegistrationTaskResponse class]];
}

- (void)startThingRegistrationTask:(AWSIoTStartThingRegistrationTaskRequest *)request
     completionHandler:(void (^)(AWSIoTStartThingRegistrationTaskResponse *response, NSError *error))completionHandler {
    [[self startThingRegistrationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTStartThingRegistrationTaskResponse *> * _Nonnull task) {
        AWSIoTStartThingRegistrationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTStopThingRegistrationTaskResponse *> *)stopThingRegistrationTask:(AWSIoTStopThingRegistrationTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/thing-registration-tasks/{taskId}/cancel"
                  targetPrefix:@""
                 operationName:@"StopThingRegistrationTask"
                   outputClass:[AWSIoTStopThingRegistrationTaskResponse class]];
}

- (void)stopThingRegistrationTask:(AWSIoTStopThingRegistrationTaskRequest *)request
     completionHandler:(void (^)(AWSIoTStopThingRegistrationTaskResponse *response, NSError *error))completionHandler {
    [[self stopThingRegistrationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTStopThingRegistrationTaskResponse *> * _Nonnull task) {
        AWSIoTStopThingRegistrationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTTagResourceResponse *> *)tagResource:(AWSIoTTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSIoTTagResourceResponse class]];
}

- (void)tagResource:(AWSIoTTagResourceRequest *)request
     completionHandler:(void (^)(AWSIoTTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTTagResourceResponse *> * _Nonnull task) {
        AWSIoTTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTTestAuthorizationResponse *> *)testAuthorization:(AWSIoTTestAuthorizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/test-authorization"
                  targetPrefix:@""
                 operationName:@"TestAuthorization"
                   outputClass:[AWSIoTTestAuthorizationResponse class]];
}

- (void)testAuthorization:(AWSIoTTestAuthorizationRequest *)request
     completionHandler:(void (^)(AWSIoTTestAuthorizationResponse *response, NSError *error))completionHandler {
    [[self testAuthorization:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTTestAuthorizationResponse *> * _Nonnull task) {
        AWSIoTTestAuthorizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTTestInvokeAuthorizerResponse *> *)testInvokeAuthorizer:(AWSIoTTestInvokeAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/authorizer/{authorizerName}/test"
                  targetPrefix:@""
                 operationName:@"TestInvokeAuthorizer"
                   outputClass:[AWSIoTTestInvokeAuthorizerResponse class]];
}

- (void)testInvokeAuthorizer:(AWSIoTTestInvokeAuthorizerRequest *)request
     completionHandler:(void (^)(AWSIoTTestInvokeAuthorizerResponse *response, NSError *error))completionHandler {
    [[self testInvokeAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTTestInvokeAuthorizerResponse *> * _Nonnull task) {
        AWSIoTTestInvokeAuthorizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUntagResourceResponse *> *)untagResource:(AWSIoTUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/untag"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSIoTUntagResourceResponse class]];
}

- (void)untagResource:(AWSIoTUntagResourceRequest *)request
     completionHandler:(void (^)(AWSIoTUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUntagResourceResponse *> * _Nonnull task) {
        AWSIoTUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateAccountAuditConfigurationResponse *> *)updateAccountAuditConfiguration:(AWSIoTUpdateAccountAuditConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/audit/configuration"
                  targetPrefix:@""
                 operationName:@"UpdateAccountAuditConfiguration"
                   outputClass:[AWSIoTUpdateAccountAuditConfigurationResponse class]];
}

- (void)updateAccountAuditConfiguration:(AWSIoTUpdateAccountAuditConfigurationRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateAccountAuditConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateAccountAuditConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateAccountAuditConfigurationResponse *> * _Nonnull task) {
        AWSIoTUpdateAccountAuditConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateAuthorizerResponse *> *)updateAuthorizer:(AWSIoTUpdateAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/authorizer/{authorizerName}"
                  targetPrefix:@""
                 operationName:@"UpdateAuthorizer"
                   outputClass:[AWSIoTUpdateAuthorizerResponse class]];
}

- (void)updateAuthorizer:(AWSIoTUpdateAuthorizerRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateAuthorizerResponse *response, NSError *error))completionHandler {
    [[self updateAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateAuthorizerResponse *> * _Nonnull task) {
        AWSIoTUpdateAuthorizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateBillingGroupResponse *> *)updateBillingGroup:(AWSIoTUpdateBillingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/billing-groups/{billingGroupName}"
                  targetPrefix:@""
                 operationName:@"UpdateBillingGroup"
                   outputClass:[AWSIoTUpdateBillingGroupResponse class]];
}

- (void)updateBillingGroup:(AWSIoTUpdateBillingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateBillingGroupResponse *response, NSError *error))completionHandler {
    [[self updateBillingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateBillingGroupResponse *> * _Nonnull task) {
        AWSIoTUpdateBillingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateCACertificate:(AWSIoTUpdateCACertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/cacertificate/{caCertificateId}"
                  targetPrefix:@""
                 operationName:@"UpdateCACertificate"
                   outputClass:nil];
}

- (void)updateCACertificate:(AWSIoTUpdateCACertificateRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateCACertificate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateDynamicThingGroupResponse *> *)updateDynamicThingGroup:(AWSIoTUpdateDynamicThingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/dynamic-thing-groups/{thingGroupName}"
                  targetPrefix:@""
                 operationName:@"UpdateDynamicThingGroup"
                   outputClass:[AWSIoTUpdateDynamicThingGroupResponse class]];
}

- (void)updateDynamicThingGroup:(AWSIoTUpdateDynamicThingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateDynamicThingGroupResponse *response, NSError *error))completionHandler {
    [[self updateDynamicThingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateDynamicThingGroupResponse *> * _Nonnull task) {
        AWSIoTUpdateDynamicThingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateEventConfigurationsResponse *> *)updateEventConfigurations:(AWSIoTUpdateEventConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/event-configurations"
                  targetPrefix:@""
                 operationName:@"UpdateEventConfigurations"
                   outputClass:[AWSIoTUpdateEventConfigurationsResponse class]];
}

- (void)updateEventConfigurations:(AWSIoTUpdateEventConfigurationsRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateEventConfigurationsResponse *response, NSError *error))completionHandler {
    [[self updateEventConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateEventConfigurationsResponse *> * _Nonnull task) {
        AWSIoTUpdateEventConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateIndexingConfigurationResponse *> *)updateIndexingConfiguration:(AWSIoTUpdateIndexingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/indexing/config"
                  targetPrefix:@""
                 operationName:@"UpdateIndexingConfiguration"
                   outputClass:[AWSIoTUpdateIndexingConfigurationResponse class]];
}

- (void)updateIndexingConfiguration:(AWSIoTUpdateIndexingConfigurationRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateIndexingConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateIndexingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateIndexingConfigurationResponse *> * _Nonnull task) {
        AWSIoTUpdateIndexingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateJob:(AWSIoTUpdateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/jobs/{jobId}"
                  targetPrefix:@""
                 operationName:@"UpdateJob"
                   outputClass:nil];
}

- (void)updateJob:(AWSIoTUpdateJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateMitigationActionResponse *> *)updateMitigationAction:(AWSIoTUpdateMitigationActionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/mitigationactions/actions/{actionName}"
                  targetPrefix:@""
                 operationName:@"UpdateMitigationAction"
                   outputClass:[AWSIoTUpdateMitigationActionResponse class]];
}

- (void)updateMitigationAction:(AWSIoTUpdateMitigationActionRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateMitigationActionResponse *response, NSError *error))completionHandler {
    [[self updateMitigationAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateMitigationActionResponse *> * _Nonnull task) {
        AWSIoTUpdateMitigationActionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateRoleAliasResponse *> *)updateRoleAlias:(AWSIoTUpdateRoleAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/role-aliases/{roleAlias}"
                  targetPrefix:@""
                 operationName:@"UpdateRoleAlias"
                   outputClass:[AWSIoTUpdateRoleAliasResponse class]];
}

- (void)updateRoleAlias:(AWSIoTUpdateRoleAliasRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateRoleAliasResponse *response, NSError *error))completionHandler {
    [[self updateRoleAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateRoleAliasResponse *> * _Nonnull task) {
        AWSIoTUpdateRoleAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateScheduledAuditResponse *> *)updateScheduledAudit:(AWSIoTUpdateScheduledAuditRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/audit/scheduledaudits/{scheduledAuditName}"
                  targetPrefix:@""
                 operationName:@"UpdateScheduledAudit"
                   outputClass:[AWSIoTUpdateScheduledAuditResponse class]];
}

- (void)updateScheduledAudit:(AWSIoTUpdateScheduledAuditRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateScheduledAuditResponse *response, NSError *error))completionHandler {
    [[self updateScheduledAudit:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateScheduledAuditResponse *> * _Nonnull task) {
        AWSIoTUpdateScheduledAuditResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateSecurityProfileResponse *> *)updateSecurityProfile:(AWSIoTUpdateSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/security-profiles/{securityProfileName}"
                  targetPrefix:@""
                 operationName:@"UpdateSecurityProfile"
                   outputClass:[AWSIoTUpdateSecurityProfileResponse class]];
}

- (void)updateSecurityProfile:(AWSIoTUpdateSecurityProfileRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateSecurityProfileResponse *response, NSError *error))completionHandler {
    [[self updateSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateSecurityProfileResponse *> * _Nonnull task) {
        AWSIoTUpdateSecurityProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateStreamResponse *> *)updateStream:(AWSIoTUpdateStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/streams/{streamId}"
                  targetPrefix:@""
                 operationName:@"UpdateStream"
                   outputClass:[AWSIoTUpdateStreamResponse class]];
}

- (void)updateStream:(AWSIoTUpdateStreamRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateStreamResponse *response, NSError *error))completionHandler {
    [[self updateStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateStreamResponse *> * _Nonnull task) {
        AWSIoTUpdateStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateThingGroupResponse *> *)updateThingGroup:(AWSIoTUpdateThingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/thing-groups/{thingGroupName}"
                  targetPrefix:@""
                 operationName:@"UpdateThingGroup"
                   outputClass:[AWSIoTUpdateThingGroupResponse class]];
}

- (void)updateThingGroup:(AWSIoTUpdateThingGroupRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateThingGroupResponse *response, NSError *error))completionHandler {
    [[self updateThingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateThingGroupResponse *> * _Nonnull task) {
        AWSIoTUpdateThingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTUpdateThingGroupsForThingResponse *> *)updateThingGroupsForThing:(AWSIoTUpdateThingGroupsForThingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/thing-groups/updateThingGroupsForThing"
                  targetPrefix:@""
                 operationName:@"UpdateThingGroupsForThing"
                   outputClass:[AWSIoTUpdateThingGroupsForThingResponse class]];
}

- (void)updateThingGroupsForThing:(AWSIoTUpdateThingGroupsForThingRequest *)request
     completionHandler:(void (^)(AWSIoTUpdateThingGroupsForThingResponse *response, NSError *error))completionHandler {
    [[self updateThingGroupsForThing:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTUpdateThingGroupsForThingResponse *> * _Nonnull task) {
        AWSIoTUpdateThingGroupsForThingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIoTValidateSecurityProfileBehaviorsResponse *> *)validateSecurityProfileBehaviors:(AWSIoTValidateSecurityProfileBehaviorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/security-profile-behaviors/validate"
                  targetPrefix:@""
                 operationName:@"ValidateSecurityProfileBehaviors"
                   outputClass:[AWSIoTValidateSecurityProfileBehaviorsResponse class]];
}

- (void)validateSecurityProfileBehaviors:(AWSIoTValidateSecurityProfileBehaviorsRequest *)request
     completionHandler:(void (^)(AWSIoTValidateSecurityProfileBehaviorsResponse *response, NSError *error))completionHandler {
    [[self validateSecurityProfileBehaviors:request] continueWithBlock:^id _Nullable(AWSTask<AWSIoTValidateSecurityProfileBehaviorsResponse *> * _Nonnull task) {
        AWSIoTValidateSecurityProfileBehaviorsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
