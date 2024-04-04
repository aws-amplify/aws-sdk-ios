//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSConnectService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSConnectResources.h"

static NSString *const AWSInfoConnect = @"Connect";
NSString *const AWSConnectSDKVersion = @"2.35.0";


@interface AWSConnectResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSConnectResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSConnectErrorAccessDenied),
                            @"ConflictException" : @(AWSConnectErrorConflict),
                            @"ContactFlowNotPublishedException" : @(AWSConnectErrorContactFlowNotPublished),
                            @"ContactNotFoundException" : @(AWSConnectErrorContactNotFound),
                            @"DestinationNotAllowedException" : @(AWSConnectErrorDestinationNotAllowed),
                            @"DuplicateResourceException" : @(AWSConnectErrorDuplicateResource),
                            @"IdempotencyException" : @(AWSConnectErrorIdempotency),
                            @"InternalServiceException" : @(AWSConnectErrorInternalService),
                            @"InvalidContactFlowException" : @(AWSConnectErrorInvalidContactFlow),
                            @"InvalidContactFlowModuleException" : @(AWSConnectErrorInvalidContactFlowModule),
                            @"InvalidParameterException" : @(AWSConnectErrorInvalidParameter),
                            @"InvalidRequestException" : @(AWSConnectErrorInvalidRequest),
                            @"LimitExceededException" : @(AWSConnectErrorLimitExceeded),
                            @"MaximumResultReturnedException" : @(AWSConnectErrorMaximumResultReturned),
                            @"OutboundContactNotPermittedException" : @(AWSConnectErrorOutboundContactNotPermitted),
                            @"OutputTypeNotFoundException" : @(AWSConnectErrorOutputTypeNotFound),
                            @"PropertyValidationException" : @(AWSConnectErrorPropertyValidation),
                            @"ResourceConflictException" : @(AWSConnectErrorResourceConflict),
                            @"ResourceInUseException" : @(AWSConnectErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSConnectErrorResourceNotFound),
                            @"ResourceNotReadyException" : @(AWSConnectErrorResourceNotReady),
                            @"ServiceQuotaExceededException" : @(AWSConnectErrorServiceQuotaExceeded),
                            @"ThrottlingException" : @(AWSConnectErrorThrottling),
                            @"TooManyRequestsException" : @(AWSConnectErrorTooManyRequests),
                            @"UserNotFoundException" : @(AWSConnectErrorUserNotFound),
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
                    *error = [NSError errorWithDomain:AWSConnectErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSConnectErrorDomain
                                                 code:AWSConnectErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSConnectErrorDomain
                                     code:AWSConnectErrorUnknown
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

@interface AWSConnectRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSConnectRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSConnect()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSConnect

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSConnectSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSConnect versions need to match. Check your SDK installation. AWSCore: %@ AWSConnect: %@", AWSiOSSDKVersion, AWSConnectSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultConnect {
    static AWSConnect *_defaultConnect = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoConnect];
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
        _defaultConnect = [[AWSConnect alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultConnect;
}

+ (void)registerConnectWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSConnect alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ConnectForKey:(NSString *)key {
    @synchronized(self) {
        AWSConnect *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoConnect
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSConnect registerConnectWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeConnectForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultConnect` or `+ ConnectForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceConnect
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceConnect];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSConnectRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSConnectResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSConnectResponseSerializer alloc] initWithJSONDefinition:[[AWSConnectResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSConnectActivateEvaluationFormResponse *> *)activateEvaluationForm:(AWSConnectActivateEvaluationFormRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/evaluation-forms/{InstanceId}/{EvaluationFormId}/activate"
                  targetPrefix:@""
                 operationName:@"ActivateEvaluationForm"
                   outputClass:[AWSConnectActivateEvaluationFormResponse class]];
}

- (void)activateEvaluationForm:(AWSConnectActivateEvaluationFormRequest *)request
     completionHandler:(void (^)(AWSConnectActivateEvaluationFormResponse *response, NSError *error))completionHandler {
    [[self activateEvaluationForm:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectActivateEvaluationFormResponse *> * _Nonnull task) {
        AWSConnectActivateEvaluationFormResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectAssociateAnalyticsDataSetResponse *> *)associateAnalyticsDataSet:(AWSConnectAssociateAnalyticsDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/analytics-data/instance/{InstanceId}/association"
                  targetPrefix:@""
                 operationName:@"AssociateAnalyticsDataSet"
                   outputClass:[AWSConnectAssociateAnalyticsDataSetResponse class]];
}

- (void)associateAnalyticsDataSet:(AWSConnectAssociateAnalyticsDataSetRequest *)request
     completionHandler:(void (^)(AWSConnectAssociateAnalyticsDataSetResponse *response, NSError *error))completionHandler {
    [[self associateAnalyticsDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectAssociateAnalyticsDataSetResponse *> * _Nonnull task) {
        AWSConnectAssociateAnalyticsDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)associateApprovedOrigin:(AWSConnectAssociateApprovedOriginRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/instance/{InstanceId}/approved-origin"
                  targetPrefix:@""
                 operationName:@"AssociateApprovedOrigin"
                   outputClass:nil];
}

- (void)associateApprovedOrigin:(AWSConnectAssociateApprovedOriginRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateApprovedOrigin:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)associateBot:(AWSConnectAssociateBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/instance/{InstanceId}/bot"
                  targetPrefix:@""
                 operationName:@"AssociateBot"
                   outputClass:nil];
}

- (void)associateBot:(AWSConnectAssociateBotRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateBot:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectAssociateDefaultVocabularyResponse *> *)associateDefaultVocabulary:(AWSConnectAssociateDefaultVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/default-vocabulary/{InstanceId}/{LanguageCode}"
                  targetPrefix:@""
                 operationName:@"AssociateDefaultVocabulary"
                   outputClass:[AWSConnectAssociateDefaultVocabularyResponse class]];
}

- (void)associateDefaultVocabulary:(AWSConnectAssociateDefaultVocabularyRequest *)request
     completionHandler:(void (^)(AWSConnectAssociateDefaultVocabularyResponse *response, NSError *error))completionHandler {
    [[self associateDefaultVocabulary:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectAssociateDefaultVocabularyResponse *> * _Nonnull task) {
        AWSConnectAssociateDefaultVocabularyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectAssociateFlowResponse *> *)associateFlow:(AWSConnectAssociateFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/flow-associations/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"AssociateFlow"
                   outputClass:[AWSConnectAssociateFlowResponse class]];
}

- (void)associateFlow:(AWSConnectAssociateFlowRequest *)request
     completionHandler:(void (^)(AWSConnectAssociateFlowResponse *response, NSError *error))completionHandler {
    [[self associateFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectAssociateFlowResponse *> * _Nonnull task) {
        AWSConnectAssociateFlowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectAssociateInstanceStorageConfigResponse *> *)associateInstanceStorageConfig:(AWSConnectAssociateInstanceStorageConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/instance/{InstanceId}/storage-config"
                  targetPrefix:@""
                 operationName:@"AssociateInstanceStorageConfig"
                   outputClass:[AWSConnectAssociateInstanceStorageConfigResponse class]];
}

- (void)associateInstanceStorageConfig:(AWSConnectAssociateInstanceStorageConfigRequest *)request
     completionHandler:(void (^)(AWSConnectAssociateInstanceStorageConfigResponse *response, NSError *error))completionHandler {
    [[self associateInstanceStorageConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectAssociateInstanceStorageConfigResponse *> * _Nonnull task) {
        AWSConnectAssociateInstanceStorageConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)associateLambdaFunction:(AWSConnectAssociateLambdaFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/instance/{InstanceId}/lambda-function"
                  targetPrefix:@""
                 operationName:@"AssociateLambdaFunction"
                   outputClass:nil];
}

- (void)associateLambdaFunction:(AWSConnectAssociateLambdaFunctionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateLambdaFunction:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)associateLexBot:(AWSConnectAssociateLexBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/instance/{InstanceId}/lex-bot"
                  targetPrefix:@""
                 operationName:@"AssociateLexBot"
                   outputClass:nil];
}

- (void)associateLexBot:(AWSConnectAssociateLexBotRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateLexBot:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)associatePhoneNumberContactFlow:(AWSConnectAssociatePhoneNumberContactFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/phone-number/{PhoneNumberId}/contact-flow"
                  targetPrefix:@""
                 operationName:@"AssociatePhoneNumberContactFlow"
                   outputClass:nil];
}

- (void)associatePhoneNumberContactFlow:(AWSConnectAssociatePhoneNumberContactFlowRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associatePhoneNumberContactFlow:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)associateQueueQuickConnects:(AWSConnectAssociateQueueQuickConnectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/queues/{InstanceId}/{QueueId}/associate-quick-connects"
                  targetPrefix:@""
                 operationName:@"AssociateQueueQuickConnects"
                   outputClass:nil];
}

- (void)associateQueueQuickConnects:(AWSConnectAssociateQueueQuickConnectsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateQueueQuickConnects:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)associateRoutingProfileQueues:(AWSConnectAssociateRoutingProfileQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/routing-profiles/{InstanceId}/{RoutingProfileId}/associate-queues"
                  targetPrefix:@""
                 operationName:@"AssociateRoutingProfileQueues"
                   outputClass:nil];
}

- (void)associateRoutingProfileQueues:(AWSConnectAssociateRoutingProfileQueuesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateRoutingProfileQueues:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectAssociateSecurityKeyResponse *> *)associateSecurityKey:(AWSConnectAssociateSecurityKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/instance/{InstanceId}/security-key"
                  targetPrefix:@""
                 operationName:@"AssociateSecurityKey"
                   outputClass:[AWSConnectAssociateSecurityKeyResponse class]];
}

- (void)associateSecurityKey:(AWSConnectAssociateSecurityKeyRequest *)request
     completionHandler:(void (^)(AWSConnectAssociateSecurityKeyResponse *response, NSError *error))completionHandler {
    [[self associateSecurityKey:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectAssociateSecurityKeyResponse *> * _Nonnull task) {
        AWSConnectAssociateSecurityKeyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectAssociateTrafficDistributionGroupUserResponse *> *)associateTrafficDistributionGroupUser:(AWSConnectAssociateTrafficDistributionGroupUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/traffic-distribution-group/{TrafficDistributionGroupId}/user"
                  targetPrefix:@""
                 operationName:@"AssociateTrafficDistributionGroupUser"
                   outputClass:[AWSConnectAssociateTrafficDistributionGroupUserResponse class]];
}

- (void)associateTrafficDistributionGroupUser:(AWSConnectAssociateTrafficDistributionGroupUserRequest *)request
     completionHandler:(void (^)(AWSConnectAssociateTrafficDistributionGroupUserResponse *response, NSError *error))completionHandler {
    [[self associateTrafficDistributionGroupUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectAssociateTrafficDistributionGroupUserResponse *> * _Nonnull task) {
        AWSConnectAssociateTrafficDistributionGroupUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)associateUserProficiencies:(AWSConnectAssociateUserProficienciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/users/{InstanceId}/{UserId}/associate-proficiencies"
                  targetPrefix:@""
                 operationName:@"AssociateUserProficiencies"
                   outputClass:nil];
}

- (void)associateUserProficiencies:(AWSConnectAssociateUserProficienciesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateUserProficiencies:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectBatchAssociateAnalyticsDataSetResponse *> *)batchAssociateAnalyticsDataSet:(AWSConnectBatchAssociateAnalyticsDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/analytics-data/instance/{InstanceId}/associations"
                  targetPrefix:@""
                 operationName:@"BatchAssociateAnalyticsDataSet"
                   outputClass:[AWSConnectBatchAssociateAnalyticsDataSetResponse class]];
}

- (void)batchAssociateAnalyticsDataSet:(AWSConnectBatchAssociateAnalyticsDataSetRequest *)request
     completionHandler:(void (^)(AWSConnectBatchAssociateAnalyticsDataSetResponse *response, NSError *error))completionHandler {
    [[self batchAssociateAnalyticsDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectBatchAssociateAnalyticsDataSetResponse *> * _Nonnull task) {
        AWSConnectBatchAssociateAnalyticsDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectBatchDisassociateAnalyticsDataSetResponse *> *)batchDisassociateAnalyticsDataSet:(AWSConnectBatchDisassociateAnalyticsDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/analytics-data/instance/{InstanceId}/associations"
                  targetPrefix:@""
                 operationName:@"BatchDisassociateAnalyticsDataSet"
                   outputClass:[AWSConnectBatchDisassociateAnalyticsDataSetResponse class]];
}

- (void)batchDisassociateAnalyticsDataSet:(AWSConnectBatchDisassociateAnalyticsDataSetRequest *)request
     completionHandler:(void (^)(AWSConnectBatchDisassociateAnalyticsDataSetResponse *response, NSError *error))completionHandler {
    [[self batchDisassociateAnalyticsDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectBatchDisassociateAnalyticsDataSetResponse *> * _Nonnull task) {
        AWSConnectBatchDisassociateAnalyticsDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectBatchGetFlowAssociationResponse *> *)batchGetFlowAssociation:(AWSConnectBatchGetFlowAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/flow-associations-batch/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"BatchGetFlowAssociation"
                   outputClass:[AWSConnectBatchGetFlowAssociationResponse class]];
}

- (void)batchGetFlowAssociation:(AWSConnectBatchGetFlowAssociationRequest *)request
     completionHandler:(void (^)(AWSConnectBatchGetFlowAssociationResponse *response, NSError *error))completionHandler {
    [[self batchGetFlowAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectBatchGetFlowAssociationResponse *> * _Nonnull task) {
        AWSConnectBatchGetFlowAssociationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectBatchPutContactResponse *> *)batchPutContact:(AWSConnectBatchPutContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/contact/batch/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"BatchPutContact"
                   outputClass:[AWSConnectBatchPutContactResponse class]];
}

- (void)batchPutContact:(AWSConnectBatchPutContactRequest *)request
     completionHandler:(void (^)(AWSConnectBatchPutContactResponse *response, NSError *error))completionHandler {
    [[self batchPutContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectBatchPutContactResponse *> * _Nonnull task) {
        AWSConnectBatchPutContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectClaimPhoneNumberResponse *> *)claimPhoneNumber:(AWSConnectClaimPhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/phone-number/claim"
                  targetPrefix:@""
                 operationName:@"ClaimPhoneNumber"
                   outputClass:[AWSConnectClaimPhoneNumberResponse class]];
}

- (void)claimPhoneNumber:(AWSConnectClaimPhoneNumberRequest *)request
     completionHandler:(void (^)(AWSConnectClaimPhoneNumberResponse *response, NSError *error))completionHandler {
    [[self claimPhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectClaimPhoneNumberResponse *> * _Nonnull task) {
        AWSConnectClaimPhoneNumberResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateAgentStatusResponse *> *)createAgentStatus:(AWSConnectCreateAgentStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/agent-status/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateAgentStatus"
                   outputClass:[AWSConnectCreateAgentStatusResponse class]];
}

- (void)createAgentStatus:(AWSConnectCreateAgentStatusRequest *)request
     completionHandler:(void (^)(AWSConnectCreateAgentStatusResponse *response, NSError *error))completionHandler {
    [[self createAgentStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateAgentStatusResponse *> * _Nonnull task) {
        AWSConnectCreateAgentStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateContactFlowResponse *> *)createContactFlow:(AWSConnectCreateContactFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/contact-flows/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateContactFlow"
                   outputClass:[AWSConnectCreateContactFlowResponse class]];
}

- (void)createContactFlow:(AWSConnectCreateContactFlowRequest *)request
     completionHandler:(void (^)(AWSConnectCreateContactFlowResponse *response, NSError *error))completionHandler {
    [[self createContactFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateContactFlowResponse *> * _Nonnull task) {
        AWSConnectCreateContactFlowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateContactFlowModuleResponse *> *)createContactFlowModule:(AWSConnectCreateContactFlowModuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/contact-flow-modules/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateContactFlowModule"
                   outputClass:[AWSConnectCreateContactFlowModuleResponse class]];
}

- (void)createContactFlowModule:(AWSConnectCreateContactFlowModuleRequest *)request
     completionHandler:(void (^)(AWSConnectCreateContactFlowModuleResponse *response, NSError *error))completionHandler {
    [[self createContactFlowModule:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateContactFlowModuleResponse *> * _Nonnull task) {
        AWSConnectCreateContactFlowModuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateEvaluationFormResponse *> *)createEvaluationForm:(AWSConnectCreateEvaluationFormRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/evaluation-forms/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateEvaluationForm"
                   outputClass:[AWSConnectCreateEvaluationFormResponse class]];
}

- (void)createEvaluationForm:(AWSConnectCreateEvaluationFormRequest *)request
     completionHandler:(void (^)(AWSConnectCreateEvaluationFormResponse *response, NSError *error))completionHandler {
    [[self createEvaluationForm:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateEvaluationFormResponse *> * _Nonnull task) {
        AWSConnectCreateEvaluationFormResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateHoursOfOperationResponse *> *)createHoursOfOperation:(AWSConnectCreateHoursOfOperationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/hours-of-operations/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateHoursOfOperation"
                   outputClass:[AWSConnectCreateHoursOfOperationResponse class]];
}

- (void)createHoursOfOperation:(AWSConnectCreateHoursOfOperationRequest *)request
     completionHandler:(void (^)(AWSConnectCreateHoursOfOperationResponse *response, NSError *error))completionHandler {
    [[self createHoursOfOperation:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateHoursOfOperationResponse *> * _Nonnull task) {
        AWSConnectCreateHoursOfOperationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateInstanceResponse *> *)createInstance:(AWSConnectCreateInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/instance"
                  targetPrefix:@""
                 operationName:@"CreateInstance"
                   outputClass:[AWSConnectCreateInstanceResponse class]];
}

- (void)createInstance:(AWSConnectCreateInstanceRequest *)request
     completionHandler:(void (^)(AWSConnectCreateInstanceResponse *response, NSError *error))completionHandler {
    [[self createInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateInstanceResponse *> * _Nonnull task) {
        AWSConnectCreateInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateIntegrationAssociationResponse *> *)createIntegrationAssociation:(AWSConnectCreateIntegrationAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/instance/{InstanceId}/integration-associations"
                  targetPrefix:@""
                 operationName:@"CreateIntegrationAssociation"
                   outputClass:[AWSConnectCreateIntegrationAssociationResponse class]];
}

- (void)createIntegrationAssociation:(AWSConnectCreateIntegrationAssociationRequest *)request
     completionHandler:(void (^)(AWSConnectCreateIntegrationAssociationResponse *response, NSError *error))completionHandler {
    [[self createIntegrationAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateIntegrationAssociationResponse *> * _Nonnull task) {
        AWSConnectCreateIntegrationAssociationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateParticipantResponse *> *)createParticipant:(AWSConnectCreateParticipantRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/create-participant"
                  targetPrefix:@""
                 operationName:@"CreateParticipant"
                   outputClass:[AWSConnectCreateParticipantResponse class]];
}

- (void)createParticipant:(AWSConnectCreateParticipantRequest *)request
     completionHandler:(void (^)(AWSConnectCreateParticipantResponse *response, NSError *error))completionHandler {
    [[self createParticipant:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateParticipantResponse *> * _Nonnull task) {
        AWSConnectCreateParticipantResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreatePersistentContactAssociationResponse *> *)createPersistentContactAssociation:(AWSConnectCreatePersistentContactAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/persistent-contact-association/{InstanceId}/{InitialContactId}"
                  targetPrefix:@""
                 operationName:@"CreatePersistentContactAssociation"
                   outputClass:[AWSConnectCreatePersistentContactAssociationResponse class]];
}

- (void)createPersistentContactAssociation:(AWSConnectCreatePersistentContactAssociationRequest *)request
     completionHandler:(void (^)(AWSConnectCreatePersistentContactAssociationResponse *response, NSError *error))completionHandler {
    [[self createPersistentContactAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreatePersistentContactAssociationResponse *> * _Nonnull task) {
        AWSConnectCreatePersistentContactAssociationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createPredefinedAttribute:(AWSConnectCreatePredefinedAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/predefined-attributes/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreatePredefinedAttribute"
                   outputClass:nil];
}

- (void)createPredefinedAttribute:(AWSConnectCreatePredefinedAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createPredefinedAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreatePromptResponse *> *)createPrompt:(AWSConnectCreatePromptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prompts/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreatePrompt"
                   outputClass:[AWSConnectCreatePromptResponse class]];
}

- (void)createPrompt:(AWSConnectCreatePromptRequest *)request
     completionHandler:(void (^)(AWSConnectCreatePromptResponse *response, NSError *error))completionHandler {
    [[self createPrompt:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreatePromptResponse *> * _Nonnull task) {
        AWSConnectCreatePromptResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateQueueResponse *> *)createQueue:(AWSConnectCreateQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/queues/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateQueue"
                   outputClass:[AWSConnectCreateQueueResponse class]];
}

- (void)createQueue:(AWSConnectCreateQueueRequest *)request
     completionHandler:(void (^)(AWSConnectCreateQueueResponse *response, NSError *error))completionHandler {
    [[self createQueue:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateQueueResponse *> * _Nonnull task) {
        AWSConnectCreateQueueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateQuickConnectResponse *> *)createQuickConnect:(AWSConnectCreateQuickConnectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/quick-connects/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateQuickConnect"
                   outputClass:[AWSConnectCreateQuickConnectResponse class]];
}

- (void)createQuickConnect:(AWSConnectCreateQuickConnectRequest *)request
     completionHandler:(void (^)(AWSConnectCreateQuickConnectResponse *response, NSError *error))completionHandler {
    [[self createQuickConnect:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateQuickConnectResponse *> * _Nonnull task) {
        AWSConnectCreateQuickConnectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateRoutingProfileResponse *> *)createRoutingProfile:(AWSConnectCreateRoutingProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/routing-profiles/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateRoutingProfile"
                   outputClass:[AWSConnectCreateRoutingProfileResponse class]];
}

- (void)createRoutingProfile:(AWSConnectCreateRoutingProfileRequest *)request
     completionHandler:(void (^)(AWSConnectCreateRoutingProfileResponse *response, NSError *error))completionHandler {
    [[self createRoutingProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateRoutingProfileResponse *> * _Nonnull task) {
        AWSConnectCreateRoutingProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateRuleResponse *> *)createRule:(AWSConnectCreateRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/rules/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateRule"
                   outputClass:[AWSConnectCreateRuleResponse class]];
}

- (void)createRule:(AWSConnectCreateRuleRequest *)request
     completionHandler:(void (^)(AWSConnectCreateRuleResponse *response, NSError *error))completionHandler {
    [[self createRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateRuleResponse *> * _Nonnull task) {
        AWSConnectCreateRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateSecurityProfileResponse *> *)createSecurityProfile:(AWSConnectCreateSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/security-profiles/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateSecurityProfile"
                   outputClass:[AWSConnectCreateSecurityProfileResponse class]];
}

- (void)createSecurityProfile:(AWSConnectCreateSecurityProfileRequest *)request
     completionHandler:(void (^)(AWSConnectCreateSecurityProfileResponse *response, NSError *error))completionHandler {
    [[self createSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateSecurityProfileResponse *> * _Nonnull task) {
        AWSConnectCreateSecurityProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateTaskTemplateResponse *> *)createTaskTemplate:(AWSConnectCreateTaskTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/instance/{InstanceId}/task/template"
                  targetPrefix:@""
                 operationName:@"CreateTaskTemplate"
                   outputClass:[AWSConnectCreateTaskTemplateResponse class]];
}

- (void)createTaskTemplate:(AWSConnectCreateTaskTemplateRequest *)request
     completionHandler:(void (^)(AWSConnectCreateTaskTemplateResponse *response, NSError *error))completionHandler {
    [[self createTaskTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateTaskTemplateResponse *> * _Nonnull task) {
        AWSConnectCreateTaskTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateTrafficDistributionGroupResponse *> *)createTrafficDistributionGroup:(AWSConnectCreateTrafficDistributionGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/traffic-distribution-group"
                  targetPrefix:@""
                 operationName:@"CreateTrafficDistributionGroup"
                   outputClass:[AWSConnectCreateTrafficDistributionGroupResponse class]];
}

- (void)createTrafficDistributionGroup:(AWSConnectCreateTrafficDistributionGroupRequest *)request
     completionHandler:(void (^)(AWSConnectCreateTrafficDistributionGroupResponse *response, NSError *error))completionHandler {
    [[self createTrafficDistributionGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateTrafficDistributionGroupResponse *> * _Nonnull task) {
        AWSConnectCreateTrafficDistributionGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateUseCaseResponse *> *)createUseCase:(AWSConnectCreateUseCaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases"
                  targetPrefix:@""
                 operationName:@"CreateUseCase"
                   outputClass:[AWSConnectCreateUseCaseResponse class]];
}

- (void)createUseCase:(AWSConnectCreateUseCaseRequest *)request
     completionHandler:(void (^)(AWSConnectCreateUseCaseResponse *response, NSError *error))completionHandler {
    [[self createUseCase:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateUseCaseResponse *> * _Nonnull task) {
        AWSConnectCreateUseCaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateUserResponse *> *)createUser:(AWSConnectCreateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/users/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateUser"
                   outputClass:[AWSConnectCreateUserResponse class]];
}

- (void)createUser:(AWSConnectCreateUserRequest *)request
     completionHandler:(void (^)(AWSConnectCreateUserResponse *response, NSError *error))completionHandler {
    [[self createUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateUserResponse *> * _Nonnull task) {
        AWSConnectCreateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateUserHierarchyGroupResponse *> *)createUserHierarchyGroup:(AWSConnectCreateUserHierarchyGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/user-hierarchy-groups/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateUserHierarchyGroup"
                   outputClass:[AWSConnectCreateUserHierarchyGroupResponse class]];
}

- (void)createUserHierarchyGroup:(AWSConnectCreateUserHierarchyGroupRequest *)request
     completionHandler:(void (^)(AWSConnectCreateUserHierarchyGroupResponse *response, NSError *error))completionHandler {
    [[self createUserHierarchyGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateUserHierarchyGroupResponse *> * _Nonnull task) {
        AWSConnectCreateUserHierarchyGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateViewResponse *> *)createView:(AWSConnectCreateViewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/views/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateView"
                   outputClass:[AWSConnectCreateViewResponse class]];
}

- (void)createView:(AWSConnectCreateViewRequest *)request
     completionHandler:(void (^)(AWSConnectCreateViewResponse *response, NSError *error))completionHandler {
    [[self createView:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateViewResponse *> * _Nonnull task) {
        AWSConnectCreateViewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateViewVersionResponse *> *)createViewVersion:(AWSConnectCreateViewVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/views/{InstanceId}/{ViewId}/versions"
                  targetPrefix:@""
                 operationName:@"CreateViewVersion"
                   outputClass:[AWSConnectCreateViewVersionResponse class]];
}

- (void)createViewVersion:(AWSConnectCreateViewVersionRequest *)request
     completionHandler:(void (^)(AWSConnectCreateViewVersionResponse *response, NSError *error))completionHandler {
    [[self createViewVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateViewVersionResponse *> * _Nonnull task) {
        AWSConnectCreateViewVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectCreateVocabularyResponse *> *)createVocabulary:(AWSConnectCreateVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/vocabulary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"CreateVocabulary"
                   outputClass:[AWSConnectCreateVocabularyResponse class]];
}

- (void)createVocabulary:(AWSConnectCreateVocabularyRequest *)request
     completionHandler:(void (^)(AWSConnectCreateVocabularyResponse *response, NSError *error))completionHandler {
    [[self createVocabulary:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectCreateVocabularyResponse *> * _Nonnull task) {
        AWSConnectCreateVocabularyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDeactivateEvaluationFormResponse *> *)deactivateEvaluationForm:(AWSConnectDeactivateEvaluationFormRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/evaluation-forms/{InstanceId}/{EvaluationFormId}/deactivate"
                  targetPrefix:@""
                 operationName:@"DeactivateEvaluationForm"
                   outputClass:[AWSConnectDeactivateEvaluationFormResponse class]];
}

- (void)deactivateEvaluationForm:(AWSConnectDeactivateEvaluationFormRequest *)request
     completionHandler:(void (^)(AWSConnectDeactivateEvaluationFormResponse *response, NSError *error))completionHandler {
    [[self deactivateEvaluationForm:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDeactivateEvaluationFormResponse *> * _Nonnull task) {
        AWSConnectDeactivateEvaluationFormResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteContactEvaluation:(AWSConnectDeleteContactEvaluationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/contact-evaluations/{InstanceId}/{EvaluationId}"
                  targetPrefix:@""
                 operationName:@"DeleteContactEvaluation"
                   outputClass:nil];
}

- (void)deleteContactEvaluation:(AWSConnectDeleteContactEvaluationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteContactEvaluation:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDeleteContactFlowResponse *> *)deleteContactFlow:(AWSConnectDeleteContactFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/contact-flows/{InstanceId}/{ContactFlowId}"
                  targetPrefix:@""
                 operationName:@"DeleteContactFlow"
                   outputClass:[AWSConnectDeleteContactFlowResponse class]];
}

- (void)deleteContactFlow:(AWSConnectDeleteContactFlowRequest *)request
     completionHandler:(void (^)(AWSConnectDeleteContactFlowResponse *response, NSError *error))completionHandler {
    [[self deleteContactFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDeleteContactFlowResponse *> * _Nonnull task) {
        AWSConnectDeleteContactFlowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDeleteContactFlowModuleResponse *> *)deleteContactFlowModule:(AWSConnectDeleteContactFlowModuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}"
                  targetPrefix:@""
                 operationName:@"DeleteContactFlowModule"
                   outputClass:[AWSConnectDeleteContactFlowModuleResponse class]];
}

- (void)deleteContactFlowModule:(AWSConnectDeleteContactFlowModuleRequest *)request
     completionHandler:(void (^)(AWSConnectDeleteContactFlowModuleResponse *response, NSError *error))completionHandler {
    [[self deleteContactFlowModule:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDeleteContactFlowModuleResponse *> * _Nonnull task) {
        AWSConnectDeleteContactFlowModuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEvaluationForm:(AWSConnectDeleteEvaluationFormRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/evaluation-forms/{InstanceId}/{EvaluationFormId}"
                  targetPrefix:@""
                 operationName:@"DeleteEvaluationForm"
                   outputClass:nil];
}

- (void)deleteEvaluationForm:(AWSConnectDeleteEvaluationFormRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEvaluationForm:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteHoursOfOperation:(AWSConnectDeleteHoursOfOperationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/hours-of-operations/{InstanceId}/{HoursOfOperationId}"
                  targetPrefix:@""
                 operationName:@"DeleteHoursOfOperation"
                   outputClass:nil];
}

- (void)deleteHoursOfOperation:(AWSConnectDeleteHoursOfOperationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteHoursOfOperation:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteInstance:(AWSConnectDeleteInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/instance/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"DeleteInstance"
                   outputClass:nil];
}

- (void)deleteInstance:(AWSConnectDeleteInstanceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteIntegrationAssociation:(AWSConnectDeleteIntegrationAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}"
                  targetPrefix:@""
                 operationName:@"DeleteIntegrationAssociation"
                   outputClass:nil];
}

- (void)deleteIntegrationAssociation:(AWSConnectDeleteIntegrationAssociationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteIntegrationAssociation:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePredefinedAttribute:(AWSConnectDeletePredefinedAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/predefined-attributes/{InstanceId}/{Name}"
                  targetPrefix:@""
                 operationName:@"DeletePredefinedAttribute"
                   outputClass:nil];
}

- (void)deletePredefinedAttribute:(AWSConnectDeletePredefinedAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePredefinedAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePrompt:(AWSConnectDeletePromptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prompts/{InstanceId}/{PromptId}"
                  targetPrefix:@""
                 operationName:@"DeletePrompt"
                   outputClass:nil];
}

- (void)deletePrompt:(AWSConnectDeletePromptRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePrompt:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteQueue:(AWSConnectDeleteQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/queues/{InstanceId}/{QueueId}"
                  targetPrefix:@""
                 operationName:@"DeleteQueue"
                   outputClass:nil];
}

- (void)deleteQueue:(AWSConnectDeleteQueueRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteQueue:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteQuickConnect:(AWSConnectDeleteQuickConnectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/quick-connects/{InstanceId}/{QuickConnectId}"
                  targetPrefix:@""
                 operationName:@"DeleteQuickConnect"
                   outputClass:nil];
}

- (void)deleteQuickConnect:(AWSConnectDeleteQuickConnectRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteQuickConnect:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRoutingProfile:(AWSConnectDeleteRoutingProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/routing-profiles/{InstanceId}/{RoutingProfileId}"
                  targetPrefix:@""
                 operationName:@"DeleteRoutingProfile"
                   outputClass:nil];
}

- (void)deleteRoutingProfile:(AWSConnectDeleteRoutingProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRoutingProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRule:(AWSConnectDeleteRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/rules/{InstanceId}/{RuleId}"
                  targetPrefix:@""
                 operationName:@"DeleteRule"
                   outputClass:nil];
}

- (void)deleteRule:(AWSConnectDeleteRuleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSecurityProfile:(AWSConnectDeleteSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/security-profiles/{InstanceId}/{SecurityProfileId}"
                  targetPrefix:@""
                 operationName:@"DeleteSecurityProfile"
                   outputClass:nil];
}

- (void)deleteSecurityProfile:(AWSConnectDeleteSecurityProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDeleteTaskTemplateResponse *> *)deleteTaskTemplate:(AWSConnectDeleteTaskTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/instance/{InstanceId}/task/template/{TaskTemplateId}"
                  targetPrefix:@""
                 operationName:@"DeleteTaskTemplate"
                   outputClass:[AWSConnectDeleteTaskTemplateResponse class]];
}

- (void)deleteTaskTemplate:(AWSConnectDeleteTaskTemplateRequest *)request
     completionHandler:(void (^)(AWSConnectDeleteTaskTemplateResponse *response, NSError *error))completionHandler {
    [[self deleteTaskTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDeleteTaskTemplateResponse *> * _Nonnull task) {
        AWSConnectDeleteTaskTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDeleteTrafficDistributionGroupResponse *> *)deleteTrafficDistributionGroup:(AWSConnectDeleteTrafficDistributionGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/traffic-distribution-group/{TrafficDistributionGroupId}"
                  targetPrefix:@""
                 operationName:@"DeleteTrafficDistributionGroup"
                   outputClass:[AWSConnectDeleteTrafficDistributionGroupResponse class]];
}

- (void)deleteTrafficDistributionGroup:(AWSConnectDeleteTrafficDistributionGroupRequest *)request
     completionHandler:(void (^)(AWSConnectDeleteTrafficDistributionGroupResponse *response, NSError *error))completionHandler {
    [[self deleteTrafficDistributionGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDeleteTrafficDistributionGroupResponse *> * _Nonnull task) {
        AWSConnectDeleteTrafficDistributionGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUseCase:(AWSConnectDeleteUseCaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases/{UseCaseId}"
                  targetPrefix:@""
                 operationName:@"DeleteUseCase"
                   outputClass:nil];
}

- (void)deleteUseCase:(AWSConnectDeleteUseCaseRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUseCase:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUser:(AWSConnectDeleteUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/users/{InstanceId}/{UserId}"
                  targetPrefix:@""
                 operationName:@"DeleteUser"
                   outputClass:nil];
}

- (void)deleteUser:(AWSConnectDeleteUserRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUser:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUserHierarchyGroup:(AWSConnectDeleteUserHierarchyGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}"
                  targetPrefix:@""
                 operationName:@"DeleteUserHierarchyGroup"
                   outputClass:nil];
}

- (void)deleteUserHierarchyGroup:(AWSConnectDeleteUserHierarchyGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUserHierarchyGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDeleteViewResponse *> *)deleteView:(AWSConnectDeleteViewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/views/{InstanceId}/{ViewId}"
                  targetPrefix:@""
                 operationName:@"DeleteView"
                   outputClass:[AWSConnectDeleteViewResponse class]];
}

- (void)deleteView:(AWSConnectDeleteViewRequest *)request
     completionHandler:(void (^)(AWSConnectDeleteViewResponse *response, NSError *error))completionHandler {
    [[self deleteView:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDeleteViewResponse *> * _Nonnull task) {
        AWSConnectDeleteViewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDeleteViewVersionResponse *> *)deleteViewVersion:(AWSConnectDeleteViewVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/views/{InstanceId}/{ViewId}/versions/{ViewVersion}"
                  targetPrefix:@""
                 operationName:@"DeleteViewVersion"
                   outputClass:[AWSConnectDeleteViewVersionResponse class]];
}

- (void)deleteViewVersion:(AWSConnectDeleteViewVersionRequest *)request
     completionHandler:(void (^)(AWSConnectDeleteViewVersionResponse *response, NSError *error))completionHandler {
    [[self deleteViewVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDeleteViewVersionResponse *> * _Nonnull task) {
        AWSConnectDeleteViewVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDeleteVocabularyResponse *> *)deleteVocabulary:(AWSConnectDeleteVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/vocabulary-remove/{InstanceId}/{VocabularyId}"
                  targetPrefix:@""
                 operationName:@"DeleteVocabulary"
                   outputClass:[AWSConnectDeleteVocabularyResponse class]];
}

- (void)deleteVocabulary:(AWSConnectDeleteVocabularyRequest *)request
     completionHandler:(void (^)(AWSConnectDeleteVocabularyResponse *response, NSError *error))completionHandler {
    [[self deleteVocabulary:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDeleteVocabularyResponse *> * _Nonnull task) {
        AWSConnectDeleteVocabularyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeAgentStatusResponse *> *)describeAgentStatus:(AWSConnectDescribeAgentStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/agent-status/{InstanceId}/{AgentStatusId}"
                  targetPrefix:@""
                 operationName:@"DescribeAgentStatus"
                   outputClass:[AWSConnectDescribeAgentStatusResponse class]];
}

- (void)describeAgentStatus:(AWSConnectDescribeAgentStatusRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeAgentStatusResponse *response, NSError *error))completionHandler {
    [[self describeAgentStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeAgentStatusResponse *> * _Nonnull task) {
        AWSConnectDescribeAgentStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeContactResponse *> *)describeContact:(AWSConnectDescribeContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/contacts/{InstanceId}/{ContactId}"
                  targetPrefix:@""
                 operationName:@"DescribeContact"
                   outputClass:[AWSConnectDescribeContactResponse class]];
}

- (void)describeContact:(AWSConnectDescribeContactRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeContactResponse *response, NSError *error))completionHandler {
    [[self describeContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeContactResponse *> * _Nonnull task) {
        AWSConnectDescribeContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeContactEvaluationResponse *> *)describeContactEvaluation:(AWSConnectDescribeContactEvaluationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/contact-evaluations/{InstanceId}/{EvaluationId}"
                  targetPrefix:@""
                 operationName:@"DescribeContactEvaluation"
                   outputClass:[AWSConnectDescribeContactEvaluationResponse class]];
}

- (void)describeContactEvaluation:(AWSConnectDescribeContactEvaluationRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeContactEvaluationResponse *response, NSError *error))completionHandler {
    [[self describeContactEvaluation:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeContactEvaluationResponse *> * _Nonnull task) {
        AWSConnectDescribeContactEvaluationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeContactFlowResponse *> *)describeContactFlow:(AWSConnectDescribeContactFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/contact-flows/{InstanceId}/{ContactFlowId}"
                  targetPrefix:@""
                 operationName:@"DescribeContactFlow"
                   outputClass:[AWSConnectDescribeContactFlowResponse class]];
}

- (void)describeContactFlow:(AWSConnectDescribeContactFlowRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeContactFlowResponse *response, NSError *error))completionHandler {
    [[self describeContactFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeContactFlowResponse *> * _Nonnull task) {
        AWSConnectDescribeContactFlowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeContactFlowModuleResponse *> *)describeContactFlowModule:(AWSConnectDescribeContactFlowModuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}"
                  targetPrefix:@""
                 operationName:@"DescribeContactFlowModule"
                   outputClass:[AWSConnectDescribeContactFlowModuleResponse class]];
}

- (void)describeContactFlowModule:(AWSConnectDescribeContactFlowModuleRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeContactFlowModuleResponse *response, NSError *error))completionHandler {
    [[self describeContactFlowModule:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeContactFlowModuleResponse *> * _Nonnull task) {
        AWSConnectDescribeContactFlowModuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeEvaluationFormResponse *> *)describeEvaluationForm:(AWSConnectDescribeEvaluationFormRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/evaluation-forms/{InstanceId}/{EvaluationFormId}"
                  targetPrefix:@""
                 operationName:@"DescribeEvaluationForm"
                   outputClass:[AWSConnectDescribeEvaluationFormResponse class]];
}

- (void)describeEvaluationForm:(AWSConnectDescribeEvaluationFormRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeEvaluationFormResponse *response, NSError *error))completionHandler {
    [[self describeEvaluationForm:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeEvaluationFormResponse *> * _Nonnull task) {
        AWSConnectDescribeEvaluationFormResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeHoursOfOperationResponse *> *)describeHoursOfOperation:(AWSConnectDescribeHoursOfOperationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/hours-of-operations/{InstanceId}/{HoursOfOperationId}"
                  targetPrefix:@""
                 operationName:@"DescribeHoursOfOperation"
                   outputClass:[AWSConnectDescribeHoursOfOperationResponse class]];
}

- (void)describeHoursOfOperation:(AWSConnectDescribeHoursOfOperationRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeHoursOfOperationResponse *response, NSError *error))completionHandler {
    [[self describeHoursOfOperation:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeHoursOfOperationResponse *> * _Nonnull task) {
        AWSConnectDescribeHoursOfOperationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeInstanceResponse *> *)describeInstance:(AWSConnectDescribeInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"DescribeInstance"
                   outputClass:[AWSConnectDescribeInstanceResponse class]];
}

- (void)describeInstance:(AWSConnectDescribeInstanceRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeInstanceResponse *response, NSError *error))completionHandler {
    [[self describeInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeInstanceResponse *> * _Nonnull task) {
        AWSConnectDescribeInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeInstanceAttributeResponse *> *)describeInstanceAttribute:(AWSConnectDescribeInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/attribute/{AttributeType}"
                  targetPrefix:@""
                 operationName:@"DescribeInstanceAttribute"
                   outputClass:[AWSConnectDescribeInstanceAttributeResponse class]];
}

- (void)describeInstanceAttribute:(AWSConnectDescribeInstanceAttributeRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeInstanceAttributeResponse *response, NSError *error))completionHandler {
    [[self describeInstanceAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeInstanceAttributeResponse *> * _Nonnull task) {
        AWSConnectDescribeInstanceAttributeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeInstanceStorageConfigResponse *> *)describeInstanceStorageConfig:(AWSConnectDescribeInstanceStorageConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/storage-config/{AssociationId}"
                  targetPrefix:@""
                 operationName:@"DescribeInstanceStorageConfig"
                   outputClass:[AWSConnectDescribeInstanceStorageConfigResponse class]];
}

- (void)describeInstanceStorageConfig:(AWSConnectDescribeInstanceStorageConfigRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeInstanceStorageConfigResponse *response, NSError *error))completionHandler {
    [[self describeInstanceStorageConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeInstanceStorageConfigResponse *> * _Nonnull task) {
        AWSConnectDescribeInstanceStorageConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribePhoneNumberResponse *> *)describePhoneNumber:(AWSConnectDescribePhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/phone-number/{PhoneNumberId}"
                  targetPrefix:@""
                 operationName:@"DescribePhoneNumber"
                   outputClass:[AWSConnectDescribePhoneNumberResponse class]];
}

- (void)describePhoneNumber:(AWSConnectDescribePhoneNumberRequest *)request
     completionHandler:(void (^)(AWSConnectDescribePhoneNumberResponse *response, NSError *error))completionHandler {
    [[self describePhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribePhoneNumberResponse *> * _Nonnull task) {
        AWSConnectDescribePhoneNumberResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribePredefinedAttributeResponse *> *)describePredefinedAttribute:(AWSConnectDescribePredefinedAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/predefined-attributes/{InstanceId}/{Name}"
                  targetPrefix:@""
                 operationName:@"DescribePredefinedAttribute"
                   outputClass:[AWSConnectDescribePredefinedAttributeResponse class]];
}

- (void)describePredefinedAttribute:(AWSConnectDescribePredefinedAttributeRequest *)request
     completionHandler:(void (^)(AWSConnectDescribePredefinedAttributeResponse *response, NSError *error))completionHandler {
    [[self describePredefinedAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribePredefinedAttributeResponse *> * _Nonnull task) {
        AWSConnectDescribePredefinedAttributeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribePromptResponse *> *)describePrompt:(AWSConnectDescribePromptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prompts/{InstanceId}/{PromptId}"
                  targetPrefix:@""
                 operationName:@"DescribePrompt"
                   outputClass:[AWSConnectDescribePromptResponse class]];
}

- (void)describePrompt:(AWSConnectDescribePromptRequest *)request
     completionHandler:(void (^)(AWSConnectDescribePromptResponse *response, NSError *error))completionHandler {
    [[self describePrompt:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribePromptResponse *> * _Nonnull task) {
        AWSConnectDescribePromptResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeQueueResponse *> *)describeQueue:(AWSConnectDescribeQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/queues/{InstanceId}/{QueueId}"
                  targetPrefix:@""
                 operationName:@"DescribeQueue"
                   outputClass:[AWSConnectDescribeQueueResponse class]];
}

- (void)describeQueue:(AWSConnectDescribeQueueRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeQueueResponse *response, NSError *error))completionHandler {
    [[self describeQueue:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeQueueResponse *> * _Nonnull task) {
        AWSConnectDescribeQueueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeQuickConnectResponse *> *)describeQuickConnect:(AWSConnectDescribeQuickConnectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/quick-connects/{InstanceId}/{QuickConnectId}"
                  targetPrefix:@""
                 operationName:@"DescribeQuickConnect"
                   outputClass:[AWSConnectDescribeQuickConnectResponse class]];
}

- (void)describeQuickConnect:(AWSConnectDescribeQuickConnectRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeQuickConnectResponse *response, NSError *error))completionHandler {
    [[self describeQuickConnect:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeQuickConnectResponse *> * _Nonnull task) {
        AWSConnectDescribeQuickConnectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeRoutingProfileResponse *> *)describeRoutingProfile:(AWSConnectDescribeRoutingProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/routing-profiles/{InstanceId}/{RoutingProfileId}"
                  targetPrefix:@""
                 operationName:@"DescribeRoutingProfile"
                   outputClass:[AWSConnectDescribeRoutingProfileResponse class]];
}

- (void)describeRoutingProfile:(AWSConnectDescribeRoutingProfileRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeRoutingProfileResponse *response, NSError *error))completionHandler {
    [[self describeRoutingProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeRoutingProfileResponse *> * _Nonnull task) {
        AWSConnectDescribeRoutingProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeRuleResponse *> *)describeRule:(AWSConnectDescribeRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/rules/{InstanceId}/{RuleId}"
                  targetPrefix:@""
                 operationName:@"DescribeRule"
                   outputClass:[AWSConnectDescribeRuleResponse class]];
}

- (void)describeRule:(AWSConnectDescribeRuleRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeRuleResponse *response, NSError *error))completionHandler {
    [[self describeRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeRuleResponse *> * _Nonnull task) {
        AWSConnectDescribeRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeSecurityProfileResponse *> *)describeSecurityProfile:(AWSConnectDescribeSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/security-profiles/{InstanceId}/{SecurityProfileId}"
                  targetPrefix:@""
                 operationName:@"DescribeSecurityProfile"
                   outputClass:[AWSConnectDescribeSecurityProfileResponse class]];
}

- (void)describeSecurityProfile:(AWSConnectDescribeSecurityProfileRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeSecurityProfileResponse *response, NSError *error))completionHandler {
    [[self describeSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeSecurityProfileResponse *> * _Nonnull task) {
        AWSConnectDescribeSecurityProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeTrafficDistributionGroupResponse *> *)describeTrafficDistributionGroup:(AWSConnectDescribeTrafficDistributionGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/traffic-distribution-group/{TrafficDistributionGroupId}"
                  targetPrefix:@""
                 operationName:@"DescribeTrafficDistributionGroup"
                   outputClass:[AWSConnectDescribeTrafficDistributionGroupResponse class]];
}

- (void)describeTrafficDistributionGroup:(AWSConnectDescribeTrafficDistributionGroupRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeTrafficDistributionGroupResponse *response, NSError *error))completionHandler {
    [[self describeTrafficDistributionGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeTrafficDistributionGroupResponse *> * _Nonnull task) {
        AWSConnectDescribeTrafficDistributionGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeUserResponse *> *)describeUser:(AWSConnectDescribeUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/users/{InstanceId}/{UserId}"
                  targetPrefix:@""
                 operationName:@"DescribeUser"
                   outputClass:[AWSConnectDescribeUserResponse class]];
}

- (void)describeUser:(AWSConnectDescribeUserRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeUserResponse *response, NSError *error))completionHandler {
    [[self describeUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeUserResponse *> * _Nonnull task) {
        AWSConnectDescribeUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeUserHierarchyGroupResponse *> *)describeUserHierarchyGroup:(AWSConnectDescribeUserHierarchyGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}"
                  targetPrefix:@""
                 operationName:@"DescribeUserHierarchyGroup"
                   outputClass:[AWSConnectDescribeUserHierarchyGroupResponse class]];
}

- (void)describeUserHierarchyGroup:(AWSConnectDescribeUserHierarchyGroupRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeUserHierarchyGroupResponse *response, NSError *error))completionHandler {
    [[self describeUserHierarchyGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeUserHierarchyGroupResponse *> * _Nonnull task) {
        AWSConnectDescribeUserHierarchyGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeUserHierarchyStructureResponse *> *)describeUserHierarchyStructure:(AWSConnectDescribeUserHierarchyStructureRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/user-hierarchy-structure/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"DescribeUserHierarchyStructure"
                   outputClass:[AWSConnectDescribeUserHierarchyStructureResponse class]];
}

- (void)describeUserHierarchyStructure:(AWSConnectDescribeUserHierarchyStructureRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeUserHierarchyStructureResponse *response, NSError *error))completionHandler {
    [[self describeUserHierarchyStructure:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeUserHierarchyStructureResponse *> * _Nonnull task) {
        AWSConnectDescribeUserHierarchyStructureResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeViewResponse *> *)describeView:(AWSConnectDescribeViewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/views/{InstanceId}/{ViewId}"
                  targetPrefix:@""
                 operationName:@"DescribeView"
                   outputClass:[AWSConnectDescribeViewResponse class]];
}

- (void)describeView:(AWSConnectDescribeViewRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeViewResponse *response, NSError *error))completionHandler {
    [[self describeView:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeViewResponse *> * _Nonnull task) {
        AWSConnectDescribeViewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDescribeVocabularyResponse *> *)describeVocabulary:(AWSConnectDescribeVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/vocabulary/{InstanceId}/{VocabularyId}"
                  targetPrefix:@""
                 operationName:@"DescribeVocabulary"
                   outputClass:[AWSConnectDescribeVocabularyResponse class]];
}

- (void)describeVocabulary:(AWSConnectDescribeVocabularyRequest *)request
     completionHandler:(void (^)(AWSConnectDescribeVocabularyResponse *response, NSError *error))completionHandler {
    [[self describeVocabulary:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDescribeVocabularyResponse *> * _Nonnull task) {
        AWSConnectDescribeVocabularyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateAnalyticsDataSet:(AWSConnectDisassociateAnalyticsDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/analytics-data/instance/{InstanceId}/association"
                  targetPrefix:@""
                 operationName:@"DisassociateAnalyticsDataSet"
                   outputClass:nil];
}

- (void)disassociateAnalyticsDataSet:(AWSConnectDisassociateAnalyticsDataSetRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateAnalyticsDataSet:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateApprovedOrigin:(AWSConnectDisassociateApprovedOriginRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/instance/{InstanceId}/approved-origin"
                  targetPrefix:@""
                 operationName:@"DisassociateApprovedOrigin"
                   outputClass:nil];
}

- (void)disassociateApprovedOrigin:(AWSConnectDisassociateApprovedOriginRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateApprovedOrigin:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateBot:(AWSConnectDisassociateBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/instance/{InstanceId}/bot"
                  targetPrefix:@""
                 operationName:@"DisassociateBot"
                   outputClass:nil];
}

- (void)disassociateBot:(AWSConnectDisassociateBotRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateBot:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDisassociateFlowResponse *> *)disassociateFlow:(AWSConnectDisassociateFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/flow-associations/{InstanceId}/{ResourceId}/{ResourceType}"
                  targetPrefix:@""
                 operationName:@"DisassociateFlow"
                   outputClass:[AWSConnectDisassociateFlowResponse class]];
}

- (void)disassociateFlow:(AWSConnectDisassociateFlowRequest *)request
     completionHandler:(void (^)(AWSConnectDisassociateFlowResponse *response, NSError *error))completionHandler {
    [[self disassociateFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDisassociateFlowResponse *> * _Nonnull task) {
        AWSConnectDisassociateFlowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateInstanceStorageConfig:(AWSConnectDisassociateInstanceStorageConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/instance/{InstanceId}/storage-config/{AssociationId}"
                  targetPrefix:@""
                 operationName:@"DisassociateInstanceStorageConfig"
                   outputClass:nil];
}

- (void)disassociateInstanceStorageConfig:(AWSConnectDisassociateInstanceStorageConfigRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateInstanceStorageConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateLambdaFunction:(AWSConnectDisassociateLambdaFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/instance/{InstanceId}/lambda-function"
                  targetPrefix:@""
                 operationName:@"DisassociateLambdaFunction"
                   outputClass:nil];
}

- (void)disassociateLambdaFunction:(AWSConnectDisassociateLambdaFunctionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateLambdaFunction:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateLexBot:(AWSConnectDisassociateLexBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/instance/{InstanceId}/lex-bot"
                  targetPrefix:@""
                 operationName:@"DisassociateLexBot"
                   outputClass:nil];
}

- (void)disassociateLexBot:(AWSConnectDisassociateLexBotRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateLexBot:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociatePhoneNumberContactFlow:(AWSConnectDisassociatePhoneNumberContactFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/phone-number/{PhoneNumberId}/contact-flow"
                  targetPrefix:@""
                 operationName:@"DisassociatePhoneNumberContactFlow"
                   outputClass:nil];
}

- (void)disassociatePhoneNumberContactFlow:(AWSConnectDisassociatePhoneNumberContactFlowRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociatePhoneNumberContactFlow:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateQueueQuickConnects:(AWSConnectDisassociateQueueQuickConnectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/queues/{InstanceId}/{QueueId}/disassociate-quick-connects"
                  targetPrefix:@""
                 operationName:@"DisassociateQueueQuickConnects"
                   outputClass:nil];
}

- (void)disassociateQueueQuickConnects:(AWSConnectDisassociateQueueQuickConnectsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateQueueQuickConnects:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateRoutingProfileQueues:(AWSConnectDisassociateRoutingProfileQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/routing-profiles/{InstanceId}/{RoutingProfileId}/disassociate-queues"
                  targetPrefix:@""
                 operationName:@"DisassociateRoutingProfileQueues"
                   outputClass:nil];
}

- (void)disassociateRoutingProfileQueues:(AWSConnectDisassociateRoutingProfileQueuesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateRoutingProfileQueues:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateSecurityKey:(AWSConnectDisassociateSecurityKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/instance/{InstanceId}/security-key/{AssociationId}"
                  targetPrefix:@""
                 operationName:@"DisassociateSecurityKey"
                   outputClass:nil];
}

- (void)disassociateSecurityKey:(AWSConnectDisassociateSecurityKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateSecurityKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDisassociateTrafficDistributionGroupUserResponse *> *)disassociateTrafficDistributionGroupUser:(AWSConnectDisassociateTrafficDistributionGroupUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/traffic-distribution-group/{TrafficDistributionGroupId}/user"
                  targetPrefix:@""
                 operationName:@"DisassociateTrafficDistributionGroupUser"
                   outputClass:[AWSConnectDisassociateTrafficDistributionGroupUserResponse class]];
}

- (void)disassociateTrafficDistributionGroupUser:(AWSConnectDisassociateTrafficDistributionGroupUserRequest *)request
     completionHandler:(void (^)(AWSConnectDisassociateTrafficDistributionGroupUserResponse *response, NSError *error))completionHandler {
    [[self disassociateTrafficDistributionGroupUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDisassociateTrafficDistributionGroupUserResponse *> * _Nonnull task) {
        AWSConnectDisassociateTrafficDistributionGroupUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateUserProficiencies:(AWSConnectDisassociateUserProficienciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/users/{InstanceId}/{UserId}/disassociate-proficiencies"
                  targetPrefix:@""
                 operationName:@"DisassociateUserProficiencies"
                   outputClass:nil];
}

- (void)disassociateUserProficiencies:(AWSConnectDisassociateUserProficienciesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateUserProficiencies:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectDismissUserContactResponse *> *)dismissUserContact:(AWSConnectDismissUserContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/users/{InstanceId}/{UserId}/contact"
                  targetPrefix:@""
                 operationName:@"DismissUserContact"
                   outputClass:[AWSConnectDismissUserContactResponse class]];
}

- (void)dismissUserContact:(AWSConnectDismissUserContactRequest *)request
     completionHandler:(void (^)(AWSConnectDismissUserContactResponse *response, NSError *error))completionHandler {
    [[self dismissUserContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectDismissUserContactResponse *> * _Nonnull task) {
        AWSConnectDismissUserContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectGetContactAttributesResponse *> *)getContactAttributes:(AWSConnectGetContactAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/contact/attributes/{InstanceId}/{InitialContactId}"
                  targetPrefix:@""
                 operationName:@"GetContactAttributes"
                   outputClass:[AWSConnectGetContactAttributesResponse class]];
}

- (void)getContactAttributes:(AWSConnectGetContactAttributesRequest *)request
     completionHandler:(void (^)(AWSConnectGetContactAttributesResponse *response, NSError *error))completionHandler {
    [[self getContactAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectGetContactAttributesResponse *> * _Nonnull task) {
        AWSConnectGetContactAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectGetCurrentMetricDataResponse *> *)getCurrentMetricData:(AWSConnectGetCurrentMetricDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/metrics/current/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"GetCurrentMetricData"
                   outputClass:[AWSConnectGetCurrentMetricDataResponse class]];
}

- (void)getCurrentMetricData:(AWSConnectGetCurrentMetricDataRequest *)request
     completionHandler:(void (^)(AWSConnectGetCurrentMetricDataResponse *response, NSError *error))completionHandler {
    [[self getCurrentMetricData:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectGetCurrentMetricDataResponse *> * _Nonnull task) {
        AWSConnectGetCurrentMetricDataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectGetCurrentUserDataResponse *> *)getCurrentUserData:(AWSConnectGetCurrentUserDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/metrics/userdata/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"GetCurrentUserData"
                   outputClass:[AWSConnectGetCurrentUserDataResponse class]];
}

- (void)getCurrentUserData:(AWSConnectGetCurrentUserDataRequest *)request
     completionHandler:(void (^)(AWSConnectGetCurrentUserDataResponse *response, NSError *error))completionHandler {
    [[self getCurrentUserData:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectGetCurrentUserDataResponse *> * _Nonnull task) {
        AWSConnectGetCurrentUserDataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectGetFederationTokenResponse *> *)getFederationToken:(AWSConnectGetFederationTokenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/user/federate/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"GetFederationToken"
                   outputClass:[AWSConnectGetFederationTokenResponse class]];
}

- (void)getFederationToken:(AWSConnectGetFederationTokenRequest *)request
     completionHandler:(void (^)(AWSConnectGetFederationTokenResponse *response, NSError *error))completionHandler {
    [[self getFederationToken:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectGetFederationTokenResponse *> * _Nonnull task) {
        AWSConnectGetFederationTokenResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectGetFlowAssociationResponse *> *)getFlowAssociation:(AWSConnectGetFlowAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/flow-associations/{InstanceId}/{ResourceId}/{ResourceType}"
                  targetPrefix:@""
                 operationName:@"GetFlowAssociation"
                   outputClass:[AWSConnectGetFlowAssociationResponse class]];
}

- (void)getFlowAssociation:(AWSConnectGetFlowAssociationRequest *)request
     completionHandler:(void (^)(AWSConnectGetFlowAssociationResponse *response, NSError *error))completionHandler {
    [[self getFlowAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectGetFlowAssociationResponse *> * _Nonnull task) {
        AWSConnectGetFlowAssociationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectGetMetricDataResponse *> *)getMetricData:(AWSConnectGetMetricDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/metrics/historical/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"GetMetricData"
                   outputClass:[AWSConnectGetMetricDataResponse class]];
}

- (void)getMetricData:(AWSConnectGetMetricDataRequest *)request
     completionHandler:(void (^)(AWSConnectGetMetricDataResponse *response, NSError *error))completionHandler {
    [[self getMetricData:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectGetMetricDataResponse *> * _Nonnull task) {
        AWSConnectGetMetricDataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectGetMetricDataV2Response *> *)getMetricDataV2:(AWSConnectGetMetricDataV2Request *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/metrics/data"
                  targetPrefix:@""
                 operationName:@"GetMetricDataV2"
                   outputClass:[AWSConnectGetMetricDataV2Response class]];
}

- (void)getMetricDataV2:(AWSConnectGetMetricDataV2Request *)request
     completionHandler:(void (^)(AWSConnectGetMetricDataV2Response *response, NSError *error))completionHandler {
    [[self getMetricDataV2:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectGetMetricDataV2Response *> * _Nonnull task) {
        AWSConnectGetMetricDataV2Response *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectGetPromptFileResponse *> *)getPromptFile:(AWSConnectGetPromptFileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prompts/{InstanceId}/{PromptId}/file"
                  targetPrefix:@""
                 operationName:@"GetPromptFile"
                   outputClass:[AWSConnectGetPromptFileResponse class]];
}

- (void)getPromptFile:(AWSConnectGetPromptFileRequest *)request
     completionHandler:(void (^)(AWSConnectGetPromptFileResponse *response, NSError *error))completionHandler {
    [[self getPromptFile:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectGetPromptFileResponse *> * _Nonnull task) {
        AWSConnectGetPromptFileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectGetTaskTemplateResponse *> *)getTaskTemplate:(AWSConnectGetTaskTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/task/template/{TaskTemplateId}"
                  targetPrefix:@""
                 operationName:@"GetTaskTemplate"
                   outputClass:[AWSConnectGetTaskTemplateResponse class]];
}

- (void)getTaskTemplate:(AWSConnectGetTaskTemplateRequest *)request
     completionHandler:(void (^)(AWSConnectGetTaskTemplateResponse *response, NSError *error))completionHandler {
    [[self getTaskTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectGetTaskTemplateResponse *> * _Nonnull task) {
        AWSConnectGetTaskTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectGetTrafficDistributionResponse *> *)getTrafficDistribution:(AWSConnectGetTrafficDistributionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/traffic-distribution/{Id}"
                  targetPrefix:@""
                 operationName:@"GetTrafficDistribution"
                   outputClass:[AWSConnectGetTrafficDistributionResponse class]];
}

- (void)getTrafficDistribution:(AWSConnectGetTrafficDistributionRequest *)request
     completionHandler:(void (^)(AWSConnectGetTrafficDistributionResponse *response, NSError *error))completionHandler {
    [[self getTrafficDistribution:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectGetTrafficDistributionResponse *> * _Nonnull task) {
        AWSConnectGetTrafficDistributionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectImportPhoneNumberResponse *> *)importPhoneNumber:(AWSConnectImportPhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/phone-number/import"
                  targetPrefix:@""
                 operationName:@"ImportPhoneNumber"
                   outputClass:[AWSConnectImportPhoneNumberResponse class]];
}

- (void)importPhoneNumber:(AWSConnectImportPhoneNumberRequest *)request
     completionHandler:(void (^)(AWSConnectImportPhoneNumberResponse *response, NSError *error))completionHandler {
    [[self importPhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectImportPhoneNumberResponse *> * _Nonnull task) {
        AWSConnectImportPhoneNumberResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListAgentStatusResponse *> *)listAgentStatuses:(AWSConnectListAgentStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/agent-status/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListAgentStatuses"
                   outputClass:[AWSConnectListAgentStatusResponse class]];
}

- (void)listAgentStatuses:(AWSConnectListAgentStatusRequest *)request
     completionHandler:(void (^)(AWSConnectListAgentStatusResponse *response, NSError *error))completionHandler {
    [[self listAgentStatuses:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListAgentStatusResponse *> * _Nonnull task) {
        AWSConnectListAgentStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListAnalyticsDataAssociationsResponse *> *)listAnalyticsDataAssociations:(AWSConnectListAnalyticsDataAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/analytics-data/instance/{InstanceId}/association"
                  targetPrefix:@""
                 operationName:@"ListAnalyticsDataAssociations"
                   outputClass:[AWSConnectListAnalyticsDataAssociationsResponse class]];
}

- (void)listAnalyticsDataAssociations:(AWSConnectListAnalyticsDataAssociationsRequest *)request
     completionHandler:(void (^)(AWSConnectListAnalyticsDataAssociationsResponse *response, NSError *error))completionHandler {
    [[self listAnalyticsDataAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListAnalyticsDataAssociationsResponse *> * _Nonnull task) {
        AWSConnectListAnalyticsDataAssociationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListApprovedOriginsResponse *> *)listApprovedOrigins:(AWSConnectListApprovedOriginsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/approved-origins"
                  targetPrefix:@""
                 operationName:@"ListApprovedOrigins"
                   outputClass:[AWSConnectListApprovedOriginsResponse class]];
}

- (void)listApprovedOrigins:(AWSConnectListApprovedOriginsRequest *)request
     completionHandler:(void (^)(AWSConnectListApprovedOriginsResponse *response, NSError *error))completionHandler {
    [[self listApprovedOrigins:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListApprovedOriginsResponse *> * _Nonnull task) {
        AWSConnectListApprovedOriginsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListBotsResponse *> *)listBots:(AWSConnectListBotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/bots"
                  targetPrefix:@""
                 operationName:@"ListBots"
                   outputClass:[AWSConnectListBotsResponse class]];
}

- (void)listBots:(AWSConnectListBotsRequest *)request
     completionHandler:(void (^)(AWSConnectListBotsResponse *response, NSError *error))completionHandler {
    [[self listBots:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListBotsResponse *> * _Nonnull task) {
        AWSConnectListBotsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListContactEvaluationsResponse *> *)listContactEvaluations:(AWSConnectListContactEvaluationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/contact-evaluations/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListContactEvaluations"
                   outputClass:[AWSConnectListContactEvaluationsResponse class]];
}

- (void)listContactEvaluations:(AWSConnectListContactEvaluationsRequest *)request
     completionHandler:(void (^)(AWSConnectListContactEvaluationsResponse *response, NSError *error))completionHandler {
    [[self listContactEvaluations:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListContactEvaluationsResponse *> * _Nonnull task) {
        AWSConnectListContactEvaluationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListContactFlowModulesResponse *> *)listContactFlowModules:(AWSConnectListContactFlowModulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/contact-flow-modules-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListContactFlowModules"
                   outputClass:[AWSConnectListContactFlowModulesResponse class]];
}

- (void)listContactFlowModules:(AWSConnectListContactFlowModulesRequest *)request
     completionHandler:(void (^)(AWSConnectListContactFlowModulesResponse *response, NSError *error))completionHandler {
    [[self listContactFlowModules:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListContactFlowModulesResponse *> * _Nonnull task) {
        AWSConnectListContactFlowModulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListContactFlowsResponse *> *)listContactFlows:(AWSConnectListContactFlowsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/contact-flows-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListContactFlows"
                   outputClass:[AWSConnectListContactFlowsResponse class]];
}

- (void)listContactFlows:(AWSConnectListContactFlowsRequest *)request
     completionHandler:(void (^)(AWSConnectListContactFlowsResponse *response, NSError *error))completionHandler {
    [[self listContactFlows:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListContactFlowsResponse *> * _Nonnull task) {
        AWSConnectListContactFlowsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListContactReferencesResponse *> *)listContactReferences:(AWSConnectListContactReferencesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/contact/references/{InstanceId}/{ContactId}"
                  targetPrefix:@""
                 operationName:@"ListContactReferences"
                   outputClass:[AWSConnectListContactReferencesResponse class]];
}

- (void)listContactReferences:(AWSConnectListContactReferencesRequest *)request
     completionHandler:(void (^)(AWSConnectListContactReferencesResponse *response, NSError *error))completionHandler {
    [[self listContactReferences:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListContactReferencesResponse *> * _Nonnull task) {
        AWSConnectListContactReferencesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListDefaultVocabulariesResponse *> *)listDefaultVocabularies:(AWSConnectListDefaultVocabulariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/default-vocabulary-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListDefaultVocabularies"
                   outputClass:[AWSConnectListDefaultVocabulariesResponse class]];
}

- (void)listDefaultVocabularies:(AWSConnectListDefaultVocabulariesRequest *)request
     completionHandler:(void (^)(AWSConnectListDefaultVocabulariesResponse *response, NSError *error))completionHandler {
    [[self listDefaultVocabularies:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListDefaultVocabulariesResponse *> * _Nonnull task) {
        AWSConnectListDefaultVocabulariesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListEvaluationFormVersionsResponse *> *)listEvaluationFormVersions:(AWSConnectListEvaluationFormVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/evaluation-forms/{InstanceId}/{EvaluationFormId}/versions"
                  targetPrefix:@""
                 operationName:@"ListEvaluationFormVersions"
                   outputClass:[AWSConnectListEvaluationFormVersionsResponse class]];
}

- (void)listEvaluationFormVersions:(AWSConnectListEvaluationFormVersionsRequest *)request
     completionHandler:(void (^)(AWSConnectListEvaluationFormVersionsResponse *response, NSError *error))completionHandler {
    [[self listEvaluationFormVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListEvaluationFormVersionsResponse *> * _Nonnull task) {
        AWSConnectListEvaluationFormVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListEvaluationFormsResponse *> *)listEvaluationForms:(AWSConnectListEvaluationFormsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/evaluation-forms/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListEvaluationForms"
                   outputClass:[AWSConnectListEvaluationFormsResponse class]];
}

- (void)listEvaluationForms:(AWSConnectListEvaluationFormsRequest *)request
     completionHandler:(void (^)(AWSConnectListEvaluationFormsResponse *response, NSError *error))completionHandler {
    [[self listEvaluationForms:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListEvaluationFormsResponse *> * _Nonnull task) {
        AWSConnectListEvaluationFormsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListFlowAssociationsResponse *> *)listFlowAssociations:(AWSConnectListFlowAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/flow-associations-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListFlowAssociations"
                   outputClass:[AWSConnectListFlowAssociationsResponse class]];
}

- (void)listFlowAssociations:(AWSConnectListFlowAssociationsRequest *)request
     completionHandler:(void (^)(AWSConnectListFlowAssociationsResponse *response, NSError *error))completionHandler {
    [[self listFlowAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListFlowAssociationsResponse *> * _Nonnull task) {
        AWSConnectListFlowAssociationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListHoursOfOperationsResponse *> *)listHoursOfOperations:(AWSConnectListHoursOfOperationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/hours-of-operations-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListHoursOfOperations"
                   outputClass:[AWSConnectListHoursOfOperationsResponse class]];
}

- (void)listHoursOfOperations:(AWSConnectListHoursOfOperationsRequest *)request
     completionHandler:(void (^)(AWSConnectListHoursOfOperationsResponse *response, NSError *error))completionHandler {
    [[self listHoursOfOperations:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListHoursOfOperationsResponse *> * _Nonnull task) {
        AWSConnectListHoursOfOperationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListInstanceAttributesResponse *> *)listInstanceAttributes:(AWSConnectListInstanceAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/attributes"
                  targetPrefix:@""
                 operationName:@"ListInstanceAttributes"
                   outputClass:[AWSConnectListInstanceAttributesResponse class]];
}

- (void)listInstanceAttributes:(AWSConnectListInstanceAttributesRequest *)request
     completionHandler:(void (^)(AWSConnectListInstanceAttributesResponse *response, NSError *error))completionHandler {
    [[self listInstanceAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListInstanceAttributesResponse *> * _Nonnull task) {
        AWSConnectListInstanceAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListInstanceStorageConfigsResponse *> *)listInstanceStorageConfigs:(AWSConnectListInstanceStorageConfigsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/storage-configs"
                  targetPrefix:@""
                 operationName:@"ListInstanceStorageConfigs"
                   outputClass:[AWSConnectListInstanceStorageConfigsResponse class]];
}

- (void)listInstanceStorageConfigs:(AWSConnectListInstanceStorageConfigsRequest *)request
     completionHandler:(void (^)(AWSConnectListInstanceStorageConfigsResponse *response, NSError *error))completionHandler {
    [[self listInstanceStorageConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListInstanceStorageConfigsResponse *> * _Nonnull task) {
        AWSConnectListInstanceStorageConfigsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListInstancesResponse *> *)listInstances:(AWSConnectListInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance"
                  targetPrefix:@""
                 operationName:@"ListInstances"
                   outputClass:[AWSConnectListInstancesResponse class]];
}

- (void)listInstances:(AWSConnectListInstancesRequest *)request
     completionHandler:(void (^)(AWSConnectListInstancesResponse *response, NSError *error))completionHandler {
    [[self listInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListInstancesResponse *> * _Nonnull task) {
        AWSConnectListInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListIntegrationAssociationsResponse *> *)listIntegrationAssociations:(AWSConnectListIntegrationAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/integration-associations"
                  targetPrefix:@""
                 operationName:@"ListIntegrationAssociations"
                   outputClass:[AWSConnectListIntegrationAssociationsResponse class]];
}

- (void)listIntegrationAssociations:(AWSConnectListIntegrationAssociationsRequest *)request
     completionHandler:(void (^)(AWSConnectListIntegrationAssociationsResponse *response, NSError *error))completionHandler {
    [[self listIntegrationAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListIntegrationAssociationsResponse *> * _Nonnull task) {
        AWSConnectListIntegrationAssociationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListLambdaFunctionsResponse *> *)listLambdaFunctions:(AWSConnectListLambdaFunctionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/lambda-functions"
                  targetPrefix:@""
                 operationName:@"ListLambdaFunctions"
                   outputClass:[AWSConnectListLambdaFunctionsResponse class]];
}

- (void)listLambdaFunctions:(AWSConnectListLambdaFunctionsRequest *)request
     completionHandler:(void (^)(AWSConnectListLambdaFunctionsResponse *response, NSError *error))completionHandler {
    [[self listLambdaFunctions:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListLambdaFunctionsResponse *> * _Nonnull task) {
        AWSConnectListLambdaFunctionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListLexBotsResponse *> *)listLexBots:(AWSConnectListLexBotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/lex-bots"
                  targetPrefix:@""
                 operationName:@"ListLexBots"
                   outputClass:[AWSConnectListLexBotsResponse class]];
}

- (void)listLexBots:(AWSConnectListLexBotsRequest *)request
     completionHandler:(void (^)(AWSConnectListLexBotsResponse *response, NSError *error))completionHandler {
    [[self listLexBots:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListLexBotsResponse *> * _Nonnull task) {
        AWSConnectListLexBotsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListPhoneNumbersResponse *> *)listPhoneNumbers:(AWSConnectListPhoneNumbersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/phone-numbers-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListPhoneNumbers"
                   outputClass:[AWSConnectListPhoneNumbersResponse class]];
}

- (void)listPhoneNumbers:(AWSConnectListPhoneNumbersRequest *)request
     completionHandler:(void (^)(AWSConnectListPhoneNumbersResponse *response, NSError *error))completionHandler {
    [[self listPhoneNumbers:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListPhoneNumbersResponse *> * _Nonnull task) {
        AWSConnectListPhoneNumbersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListPhoneNumbersV2Response *> *)listPhoneNumbersV2:(AWSConnectListPhoneNumbersV2Request *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/phone-number/list"
                  targetPrefix:@""
                 operationName:@"ListPhoneNumbersV2"
                   outputClass:[AWSConnectListPhoneNumbersV2Response class]];
}

- (void)listPhoneNumbersV2:(AWSConnectListPhoneNumbersV2Request *)request
     completionHandler:(void (^)(AWSConnectListPhoneNumbersV2Response *response, NSError *error))completionHandler {
    [[self listPhoneNumbersV2:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListPhoneNumbersV2Response *> * _Nonnull task) {
        AWSConnectListPhoneNumbersV2Response *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListPredefinedAttributesResponse *> *)listPredefinedAttributes:(AWSConnectListPredefinedAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/predefined-attributes/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListPredefinedAttributes"
                   outputClass:[AWSConnectListPredefinedAttributesResponse class]];
}

- (void)listPredefinedAttributes:(AWSConnectListPredefinedAttributesRequest *)request
     completionHandler:(void (^)(AWSConnectListPredefinedAttributesResponse *response, NSError *error))completionHandler {
    [[self listPredefinedAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListPredefinedAttributesResponse *> * _Nonnull task) {
        AWSConnectListPredefinedAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListPromptsResponse *> *)listPrompts:(AWSConnectListPromptsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prompts-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListPrompts"
                   outputClass:[AWSConnectListPromptsResponse class]];
}

- (void)listPrompts:(AWSConnectListPromptsRequest *)request
     completionHandler:(void (^)(AWSConnectListPromptsResponse *response, NSError *error))completionHandler {
    [[self listPrompts:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListPromptsResponse *> * _Nonnull task) {
        AWSConnectListPromptsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListQueueQuickConnectsResponse *> *)listQueueQuickConnects:(AWSConnectListQueueQuickConnectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/queues/{InstanceId}/{QueueId}/quick-connects"
                  targetPrefix:@""
                 operationName:@"ListQueueQuickConnects"
                   outputClass:[AWSConnectListQueueQuickConnectsResponse class]];
}

- (void)listQueueQuickConnects:(AWSConnectListQueueQuickConnectsRequest *)request
     completionHandler:(void (^)(AWSConnectListQueueQuickConnectsResponse *response, NSError *error))completionHandler {
    [[self listQueueQuickConnects:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListQueueQuickConnectsResponse *> * _Nonnull task) {
        AWSConnectListQueueQuickConnectsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListQueuesResponse *> *)listQueues:(AWSConnectListQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/queues-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListQueues"
                   outputClass:[AWSConnectListQueuesResponse class]];
}

- (void)listQueues:(AWSConnectListQueuesRequest *)request
     completionHandler:(void (^)(AWSConnectListQueuesResponse *response, NSError *error))completionHandler {
    [[self listQueues:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListQueuesResponse *> * _Nonnull task) {
        AWSConnectListQueuesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListQuickConnectsResponse *> *)listQuickConnects:(AWSConnectListQuickConnectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/quick-connects/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListQuickConnects"
                   outputClass:[AWSConnectListQuickConnectsResponse class]];
}

- (void)listQuickConnects:(AWSConnectListQuickConnectsRequest *)request
     completionHandler:(void (^)(AWSConnectListQuickConnectsResponse *response, NSError *error))completionHandler {
    [[self listQuickConnects:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListQuickConnectsResponse *> * _Nonnull task) {
        AWSConnectListQuickConnectsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListRealtimeContactAnalysisSegmentsV2Response *> *)listRealtimeContactAnalysisSegmentsV2:(AWSConnectListRealtimeContactAnalysisSegmentsV2Request *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/list-real-time-analysis-segments-v2/{InstanceId}/{ContactId}"
                  targetPrefix:@""
                 operationName:@"ListRealtimeContactAnalysisSegmentsV2"
                   outputClass:[AWSConnectListRealtimeContactAnalysisSegmentsV2Response class]];
}

- (void)listRealtimeContactAnalysisSegmentsV2:(AWSConnectListRealtimeContactAnalysisSegmentsV2Request *)request
     completionHandler:(void (^)(AWSConnectListRealtimeContactAnalysisSegmentsV2Response *response, NSError *error))completionHandler {
    [[self listRealtimeContactAnalysisSegmentsV2:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListRealtimeContactAnalysisSegmentsV2Response *> * _Nonnull task) {
        AWSConnectListRealtimeContactAnalysisSegmentsV2Response *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListRoutingProfileQueuesResponse *> *)listRoutingProfileQueues:(AWSConnectListRoutingProfileQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/routing-profiles/{InstanceId}/{RoutingProfileId}/queues"
                  targetPrefix:@""
                 operationName:@"ListRoutingProfileQueues"
                   outputClass:[AWSConnectListRoutingProfileQueuesResponse class]];
}

- (void)listRoutingProfileQueues:(AWSConnectListRoutingProfileQueuesRequest *)request
     completionHandler:(void (^)(AWSConnectListRoutingProfileQueuesResponse *response, NSError *error))completionHandler {
    [[self listRoutingProfileQueues:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListRoutingProfileQueuesResponse *> * _Nonnull task) {
        AWSConnectListRoutingProfileQueuesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListRoutingProfilesResponse *> *)listRoutingProfiles:(AWSConnectListRoutingProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/routing-profiles-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListRoutingProfiles"
                   outputClass:[AWSConnectListRoutingProfilesResponse class]];
}

- (void)listRoutingProfiles:(AWSConnectListRoutingProfilesRequest *)request
     completionHandler:(void (^)(AWSConnectListRoutingProfilesResponse *response, NSError *error))completionHandler {
    [[self listRoutingProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListRoutingProfilesResponse *> * _Nonnull task) {
        AWSConnectListRoutingProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListRulesResponse *> *)listRules:(AWSConnectListRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/rules/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListRules"
                   outputClass:[AWSConnectListRulesResponse class]];
}

- (void)listRules:(AWSConnectListRulesRequest *)request
     completionHandler:(void (^)(AWSConnectListRulesResponse *response, NSError *error))completionHandler {
    [[self listRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListRulesResponse *> * _Nonnull task) {
        AWSConnectListRulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListSecurityKeysResponse *> *)listSecurityKeys:(AWSConnectListSecurityKeysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/security-keys"
                  targetPrefix:@""
                 operationName:@"ListSecurityKeys"
                   outputClass:[AWSConnectListSecurityKeysResponse class]];
}

- (void)listSecurityKeys:(AWSConnectListSecurityKeysRequest *)request
     completionHandler:(void (^)(AWSConnectListSecurityKeysResponse *response, NSError *error))completionHandler {
    [[self listSecurityKeys:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListSecurityKeysResponse *> * _Nonnull task) {
        AWSConnectListSecurityKeysResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListSecurityProfileApplicationsResponse *> *)listSecurityProfileApplications:(AWSConnectListSecurityProfileApplicationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/security-profiles-applications/{InstanceId}/{SecurityProfileId}"
                  targetPrefix:@""
                 operationName:@"ListSecurityProfileApplications"
                   outputClass:[AWSConnectListSecurityProfileApplicationsResponse class]];
}

- (void)listSecurityProfileApplications:(AWSConnectListSecurityProfileApplicationsRequest *)request
     completionHandler:(void (^)(AWSConnectListSecurityProfileApplicationsResponse *response, NSError *error))completionHandler {
    [[self listSecurityProfileApplications:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListSecurityProfileApplicationsResponse *> * _Nonnull task) {
        AWSConnectListSecurityProfileApplicationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListSecurityProfilePermissionsResponse *> *)listSecurityProfilePermissions:(AWSConnectListSecurityProfilePermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/security-profiles-permissions/{InstanceId}/{SecurityProfileId}"
                  targetPrefix:@""
                 operationName:@"ListSecurityProfilePermissions"
                   outputClass:[AWSConnectListSecurityProfilePermissionsResponse class]];
}

- (void)listSecurityProfilePermissions:(AWSConnectListSecurityProfilePermissionsRequest *)request
     completionHandler:(void (^)(AWSConnectListSecurityProfilePermissionsResponse *response, NSError *error))completionHandler {
    [[self listSecurityProfilePermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListSecurityProfilePermissionsResponse *> * _Nonnull task) {
        AWSConnectListSecurityProfilePermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListSecurityProfilesResponse *> *)listSecurityProfiles:(AWSConnectListSecurityProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/security-profiles-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListSecurityProfiles"
                   outputClass:[AWSConnectListSecurityProfilesResponse class]];
}

- (void)listSecurityProfiles:(AWSConnectListSecurityProfilesRequest *)request
     completionHandler:(void (^)(AWSConnectListSecurityProfilesResponse *response, NSError *error))completionHandler {
    [[self listSecurityProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListSecurityProfilesResponse *> * _Nonnull task) {
        AWSConnectListSecurityProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListTagsForResourceResponse *> *)listTagsForResource:(AWSConnectListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSConnectListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSConnectListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSConnectListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListTagsForResourceResponse *> * _Nonnull task) {
        AWSConnectListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListTaskTemplatesResponse *> *)listTaskTemplates:(AWSConnectListTaskTemplatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/task/template"
                  targetPrefix:@""
                 operationName:@"ListTaskTemplates"
                   outputClass:[AWSConnectListTaskTemplatesResponse class]];
}

- (void)listTaskTemplates:(AWSConnectListTaskTemplatesRequest *)request
     completionHandler:(void (^)(AWSConnectListTaskTemplatesResponse *response, NSError *error))completionHandler {
    [[self listTaskTemplates:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListTaskTemplatesResponse *> * _Nonnull task) {
        AWSConnectListTaskTemplatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListTrafficDistributionGroupUsersResponse *> *)listTrafficDistributionGroupUsers:(AWSConnectListTrafficDistributionGroupUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/traffic-distribution-group/{TrafficDistributionGroupId}/user"
                  targetPrefix:@""
                 operationName:@"ListTrafficDistributionGroupUsers"
                   outputClass:[AWSConnectListTrafficDistributionGroupUsersResponse class]];
}

- (void)listTrafficDistributionGroupUsers:(AWSConnectListTrafficDistributionGroupUsersRequest *)request
     completionHandler:(void (^)(AWSConnectListTrafficDistributionGroupUsersResponse *response, NSError *error))completionHandler {
    [[self listTrafficDistributionGroupUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListTrafficDistributionGroupUsersResponse *> * _Nonnull task) {
        AWSConnectListTrafficDistributionGroupUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListTrafficDistributionGroupsResponse *> *)listTrafficDistributionGroups:(AWSConnectListTrafficDistributionGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/traffic-distribution-groups"
                  targetPrefix:@""
                 operationName:@"ListTrafficDistributionGroups"
                   outputClass:[AWSConnectListTrafficDistributionGroupsResponse class]];
}

- (void)listTrafficDistributionGroups:(AWSConnectListTrafficDistributionGroupsRequest *)request
     completionHandler:(void (^)(AWSConnectListTrafficDistributionGroupsResponse *response, NSError *error))completionHandler {
    [[self listTrafficDistributionGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListTrafficDistributionGroupsResponse *> * _Nonnull task) {
        AWSConnectListTrafficDistributionGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListUseCasesResponse *> *)listUseCases:(AWSConnectListUseCasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases"
                  targetPrefix:@""
                 operationName:@"ListUseCases"
                   outputClass:[AWSConnectListUseCasesResponse class]];
}

- (void)listUseCases:(AWSConnectListUseCasesRequest *)request
     completionHandler:(void (^)(AWSConnectListUseCasesResponse *response, NSError *error))completionHandler {
    [[self listUseCases:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListUseCasesResponse *> * _Nonnull task) {
        AWSConnectListUseCasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListUserHierarchyGroupsResponse *> *)listUserHierarchyGroups:(AWSConnectListUserHierarchyGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/user-hierarchy-groups-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListUserHierarchyGroups"
                   outputClass:[AWSConnectListUserHierarchyGroupsResponse class]];
}

- (void)listUserHierarchyGroups:(AWSConnectListUserHierarchyGroupsRequest *)request
     completionHandler:(void (^)(AWSConnectListUserHierarchyGroupsResponse *response, NSError *error))completionHandler {
    [[self listUserHierarchyGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListUserHierarchyGroupsResponse *> * _Nonnull task) {
        AWSConnectListUserHierarchyGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListUserProficienciesResponse *> *)listUserProficiencies:(AWSConnectListUserProficienciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/users/{InstanceId}/{UserId}/proficiencies"
                  targetPrefix:@""
                 operationName:@"ListUserProficiencies"
                   outputClass:[AWSConnectListUserProficienciesResponse class]];
}

- (void)listUserProficiencies:(AWSConnectListUserProficienciesRequest *)request
     completionHandler:(void (^)(AWSConnectListUserProficienciesResponse *response, NSError *error))completionHandler {
    [[self listUserProficiencies:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListUserProficienciesResponse *> * _Nonnull task) {
        AWSConnectListUserProficienciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListUsersResponse *> *)listUsers:(AWSConnectListUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/users-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListUsers"
                   outputClass:[AWSConnectListUsersResponse class]];
}

- (void)listUsers:(AWSConnectListUsersRequest *)request
     completionHandler:(void (^)(AWSConnectListUsersResponse *response, NSError *error))completionHandler {
    [[self listUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListUsersResponse *> * _Nonnull task) {
        AWSConnectListUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListViewVersionsResponse *> *)listViewVersions:(AWSConnectListViewVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/views/{InstanceId}/{ViewId}/versions"
                  targetPrefix:@""
                 operationName:@"ListViewVersions"
                   outputClass:[AWSConnectListViewVersionsResponse class]];
}

- (void)listViewVersions:(AWSConnectListViewVersionsRequest *)request
     completionHandler:(void (^)(AWSConnectListViewVersionsResponse *response, NSError *error))completionHandler {
    [[self listViewVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListViewVersionsResponse *> * _Nonnull task) {
        AWSConnectListViewVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectListViewsResponse *> *)listViews:(AWSConnectListViewsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/views/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"ListViews"
                   outputClass:[AWSConnectListViewsResponse class]];
}

- (void)listViews:(AWSConnectListViewsRequest *)request
     completionHandler:(void (^)(AWSConnectListViewsResponse *response, NSError *error))completionHandler {
    [[self listViews:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectListViewsResponse *> * _Nonnull task) {
        AWSConnectListViewsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectMonitorContactResponse *> *)monitorContact:(AWSConnectMonitorContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/monitor"
                  targetPrefix:@""
                 operationName:@"MonitorContact"
                   outputClass:[AWSConnectMonitorContactResponse class]];
}

- (void)monitorContact:(AWSConnectMonitorContactRequest *)request
     completionHandler:(void (^)(AWSConnectMonitorContactResponse *response, NSError *error))completionHandler {
    [[self monitorContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectMonitorContactResponse *> * _Nonnull task) {
        AWSConnectMonitorContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectPauseContactResponse *> *)pauseContact:(AWSConnectPauseContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/pause"
                  targetPrefix:@""
                 operationName:@"PauseContact"
                   outputClass:[AWSConnectPauseContactResponse class]];
}

- (void)pauseContact:(AWSConnectPauseContactRequest *)request
     completionHandler:(void (^)(AWSConnectPauseContactResponse *response, NSError *error))completionHandler {
    [[self pauseContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectPauseContactResponse *> * _Nonnull task) {
        AWSConnectPauseContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectPutUserStatusResponse *> *)putUserStatus:(AWSConnectPutUserStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/users/{InstanceId}/{UserId}/status"
                  targetPrefix:@""
                 operationName:@"PutUserStatus"
                   outputClass:[AWSConnectPutUserStatusResponse class]];
}

- (void)putUserStatus:(AWSConnectPutUserStatusRequest *)request
     completionHandler:(void (^)(AWSConnectPutUserStatusResponse *response, NSError *error))completionHandler {
    [[self putUserStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectPutUserStatusResponse *> * _Nonnull task) {
        AWSConnectPutUserStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)releasePhoneNumber:(AWSConnectReleasePhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/phone-number/{PhoneNumberId}"
                  targetPrefix:@""
                 operationName:@"ReleasePhoneNumber"
                   outputClass:nil];
}

- (void)releasePhoneNumber:(AWSConnectReleasePhoneNumberRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self releasePhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectReplicateInstanceResponse *> *)replicateInstance:(AWSConnectReplicateInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/instance/{InstanceId}/replicate"
                  targetPrefix:@""
                 operationName:@"ReplicateInstance"
                   outputClass:[AWSConnectReplicateInstanceResponse class]];
}

- (void)replicateInstance:(AWSConnectReplicateInstanceRequest *)request
     completionHandler:(void (^)(AWSConnectReplicateInstanceResponse *response, NSError *error))completionHandler {
    [[self replicateInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectReplicateInstanceResponse *> * _Nonnull task) {
        AWSConnectReplicateInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectResumeContactResponse *> *)resumeContact:(AWSConnectResumeContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/resume"
                  targetPrefix:@""
                 operationName:@"ResumeContact"
                   outputClass:[AWSConnectResumeContactResponse class]];
}

- (void)resumeContact:(AWSConnectResumeContactRequest *)request
     completionHandler:(void (^)(AWSConnectResumeContactResponse *response, NSError *error))completionHandler {
    [[self resumeContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectResumeContactResponse *> * _Nonnull task) {
        AWSConnectResumeContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectResumeContactRecordingResponse *> *)resumeContactRecording:(AWSConnectResumeContactRecordingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/resume-recording"
                  targetPrefix:@""
                 operationName:@"ResumeContactRecording"
                   outputClass:[AWSConnectResumeContactRecordingResponse class]];
}

- (void)resumeContactRecording:(AWSConnectResumeContactRecordingRequest *)request
     completionHandler:(void (^)(AWSConnectResumeContactRecordingResponse *response, NSError *error))completionHandler {
    [[self resumeContactRecording:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectResumeContactRecordingResponse *> * _Nonnull task) {
        AWSConnectResumeContactRecordingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchAvailablePhoneNumbersResponse *> *)searchAvailablePhoneNumbers:(AWSConnectSearchAvailablePhoneNumbersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/phone-number/search-available"
                  targetPrefix:@""
                 operationName:@"SearchAvailablePhoneNumbers"
                   outputClass:[AWSConnectSearchAvailablePhoneNumbersResponse class]];
}

- (void)searchAvailablePhoneNumbers:(AWSConnectSearchAvailablePhoneNumbersRequest *)request
     completionHandler:(void (^)(AWSConnectSearchAvailablePhoneNumbersResponse *response, NSError *error))completionHandler {
    [[self searchAvailablePhoneNumbers:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchAvailablePhoneNumbersResponse *> * _Nonnull task) {
        AWSConnectSearchAvailablePhoneNumbersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchContactsResponse *> *)searchContacts:(AWSConnectSearchContactsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/search-contacts"
                  targetPrefix:@""
                 operationName:@"SearchContacts"
                   outputClass:[AWSConnectSearchContactsResponse class]];
}

- (void)searchContacts:(AWSConnectSearchContactsRequest *)request
     completionHandler:(void (^)(AWSConnectSearchContactsResponse *response, NSError *error))completionHandler {
    [[self searchContacts:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchContactsResponse *> * _Nonnull task) {
        AWSConnectSearchContactsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchHoursOfOperationsResponse *> *)searchHoursOfOperations:(AWSConnectSearchHoursOfOperationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/search-hours-of-operations"
                  targetPrefix:@""
                 operationName:@"SearchHoursOfOperations"
                   outputClass:[AWSConnectSearchHoursOfOperationsResponse class]];
}

- (void)searchHoursOfOperations:(AWSConnectSearchHoursOfOperationsRequest *)request
     completionHandler:(void (^)(AWSConnectSearchHoursOfOperationsResponse *response, NSError *error))completionHandler {
    [[self searchHoursOfOperations:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchHoursOfOperationsResponse *> * _Nonnull task) {
        AWSConnectSearchHoursOfOperationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchPredefinedAttributesResponse *> *)searchPredefinedAttributes:(AWSConnectSearchPredefinedAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/search-predefined-attributes"
                  targetPrefix:@""
                 operationName:@"SearchPredefinedAttributes"
                   outputClass:[AWSConnectSearchPredefinedAttributesResponse class]];
}

- (void)searchPredefinedAttributes:(AWSConnectSearchPredefinedAttributesRequest *)request
     completionHandler:(void (^)(AWSConnectSearchPredefinedAttributesResponse *response, NSError *error))completionHandler {
    [[self searchPredefinedAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchPredefinedAttributesResponse *> * _Nonnull task) {
        AWSConnectSearchPredefinedAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchPromptsResponse *> *)searchPrompts:(AWSConnectSearchPromptsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/search-prompts"
                  targetPrefix:@""
                 operationName:@"SearchPrompts"
                   outputClass:[AWSConnectSearchPromptsResponse class]];
}

- (void)searchPrompts:(AWSConnectSearchPromptsRequest *)request
     completionHandler:(void (^)(AWSConnectSearchPromptsResponse *response, NSError *error))completionHandler {
    [[self searchPrompts:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchPromptsResponse *> * _Nonnull task) {
        AWSConnectSearchPromptsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchQueuesResponse *> *)searchQueues:(AWSConnectSearchQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/search-queues"
                  targetPrefix:@""
                 operationName:@"SearchQueues"
                   outputClass:[AWSConnectSearchQueuesResponse class]];
}

- (void)searchQueues:(AWSConnectSearchQueuesRequest *)request
     completionHandler:(void (^)(AWSConnectSearchQueuesResponse *response, NSError *error))completionHandler {
    [[self searchQueues:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchQueuesResponse *> * _Nonnull task) {
        AWSConnectSearchQueuesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchQuickConnectsResponse *> *)searchQuickConnects:(AWSConnectSearchQuickConnectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/search-quick-connects"
                  targetPrefix:@""
                 operationName:@"SearchQuickConnects"
                   outputClass:[AWSConnectSearchQuickConnectsResponse class]];
}

- (void)searchQuickConnects:(AWSConnectSearchQuickConnectsRequest *)request
     completionHandler:(void (^)(AWSConnectSearchQuickConnectsResponse *response, NSError *error))completionHandler {
    [[self searchQuickConnects:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchQuickConnectsResponse *> * _Nonnull task) {
        AWSConnectSearchQuickConnectsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchResourceTagsResponse *> *)searchResourceTags:(AWSConnectSearchResourceTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/search-resource-tags"
                  targetPrefix:@""
                 operationName:@"SearchResourceTags"
                   outputClass:[AWSConnectSearchResourceTagsResponse class]];
}

- (void)searchResourceTags:(AWSConnectSearchResourceTagsRequest *)request
     completionHandler:(void (^)(AWSConnectSearchResourceTagsResponse *response, NSError *error))completionHandler {
    [[self searchResourceTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchResourceTagsResponse *> * _Nonnull task) {
        AWSConnectSearchResourceTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchRoutingProfilesResponse *> *)searchRoutingProfiles:(AWSConnectSearchRoutingProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/search-routing-profiles"
                  targetPrefix:@""
                 operationName:@"SearchRoutingProfiles"
                   outputClass:[AWSConnectSearchRoutingProfilesResponse class]];
}

- (void)searchRoutingProfiles:(AWSConnectSearchRoutingProfilesRequest *)request
     completionHandler:(void (^)(AWSConnectSearchRoutingProfilesResponse *response, NSError *error))completionHandler {
    [[self searchRoutingProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchRoutingProfilesResponse *> * _Nonnull task) {
        AWSConnectSearchRoutingProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchSecurityProfilesResponse *> *)searchSecurityProfiles:(AWSConnectSearchSecurityProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/search-security-profiles"
                  targetPrefix:@""
                 operationName:@"SearchSecurityProfiles"
                   outputClass:[AWSConnectSearchSecurityProfilesResponse class]];
}

- (void)searchSecurityProfiles:(AWSConnectSearchSecurityProfilesRequest *)request
     completionHandler:(void (^)(AWSConnectSearchSecurityProfilesResponse *response, NSError *error))completionHandler {
    [[self searchSecurityProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchSecurityProfilesResponse *> * _Nonnull task) {
        AWSConnectSearchSecurityProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchUsersResponse *> *)searchUsers:(AWSConnectSearchUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/search-users"
                  targetPrefix:@""
                 operationName:@"SearchUsers"
                   outputClass:[AWSConnectSearchUsersResponse class]];
}

- (void)searchUsers:(AWSConnectSearchUsersRequest *)request
     completionHandler:(void (^)(AWSConnectSearchUsersResponse *response, NSError *error))completionHandler {
    [[self searchUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchUsersResponse *> * _Nonnull task) {
        AWSConnectSearchUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSearchVocabulariesResponse *> *)searchVocabularies:(AWSConnectSearchVocabulariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/vocabulary-summary/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"SearchVocabularies"
                   outputClass:[AWSConnectSearchVocabulariesResponse class]];
}

- (void)searchVocabularies:(AWSConnectSearchVocabulariesRequest *)request
     completionHandler:(void (^)(AWSConnectSearchVocabulariesResponse *response, NSError *error))completionHandler {
    [[self searchVocabularies:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSearchVocabulariesResponse *> * _Nonnull task) {
        AWSConnectSearchVocabulariesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSendChatIntegrationEventResponse *> *)sendChatIntegrationEvent:(AWSConnectSendChatIntegrationEventRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/chat-integration-event"
                  targetPrefix:@""
                 operationName:@"SendChatIntegrationEvent"
                   outputClass:[AWSConnectSendChatIntegrationEventResponse class]];
}

- (void)sendChatIntegrationEvent:(AWSConnectSendChatIntegrationEventRequest *)request
     completionHandler:(void (^)(AWSConnectSendChatIntegrationEventResponse *response, NSError *error))completionHandler {
    [[self sendChatIntegrationEvent:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSendChatIntegrationEventResponse *> * _Nonnull task) {
        AWSConnectSendChatIntegrationEventResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectStartChatContactResponse *> *)startChatContact:(AWSConnectStartChatContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/contact/chat"
                  targetPrefix:@""
                 operationName:@"StartChatContact"
                   outputClass:[AWSConnectStartChatContactResponse class]];
}

- (void)startChatContact:(AWSConnectStartChatContactRequest *)request
     completionHandler:(void (^)(AWSConnectStartChatContactResponse *response, NSError *error))completionHandler {
    [[self startChatContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectStartChatContactResponse *> * _Nonnull task) {
        AWSConnectStartChatContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectStartContactEvaluationResponse *> *)startContactEvaluation:(AWSConnectStartContactEvaluationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/contact-evaluations/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"StartContactEvaluation"
                   outputClass:[AWSConnectStartContactEvaluationResponse class]];
}

- (void)startContactEvaluation:(AWSConnectStartContactEvaluationRequest *)request
     completionHandler:(void (^)(AWSConnectStartContactEvaluationResponse *response, NSError *error))completionHandler {
    [[self startContactEvaluation:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectStartContactEvaluationResponse *> * _Nonnull task) {
        AWSConnectStartContactEvaluationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectStartContactRecordingResponse *> *)startContactRecording:(AWSConnectStartContactRecordingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/start-recording"
                  targetPrefix:@""
                 operationName:@"StartContactRecording"
                   outputClass:[AWSConnectStartContactRecordingResponse class]];
}

- (void)startContactRecording:(AWSConnectStartContactRecordingRequest *)request
     completionHandler:(void (^)(AWSConnectStartContactRecordingResponse *response, NSError *error))completionHandler {
    [[self startContactRecording:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectStartContactRecordingResponse *> * _Nonnull task) {
        AWSConnectStartContactRecordingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectStartContactStreamingResponse *> *)startContactStreaming:(AWSConnectStartContactStreamingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/start-streaming"
                  targetPrefix:@""
                 operationName:@"StartContactStreaming"
                   outputClass:[AWSConnectStartContactStreamingResponse class]];
}

- (void)startContactStreaming:(AWSConnectStartContactStreamingRequest *)request
     completionHandler:(void (^)(AWSConnectStartContactStreamingResponse *response, NSError *error))completionHandler {
    [[self startContactStreaming:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectStartContactStreamingResponse *> * _Nonnull task) {
        AWSConnectStartContactStreamingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectStartOutboundVoiceContactResponse *> *)startOutboundVoiceContact:(AWSConnectStartOutboundVoiceContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/contact/outbound-voice"
                  targetPrefix:@""
                 operationName:@"StartOutboundVoiceContact"
                   outputClass:[AWSConnectStartOutboundVoiceContactResponse class]];
}

- (void)startOutboundVoiceContact:(AWSConnectStartOutboundVoiceContactRequest *)request
     completionHandler:(void (^)(AWSConnectStartOutboundVoiceContactResponse *response, NSError *error))completionHandler {
    [[self startOutboundVoiceContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectStartOutboundVoiceContactResponse *> * _Nonnull task) {
        AWSConnectStartOutboundVoiceContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectStartTaskContactResponse *> *)startTaskContact:(AWSConnectStartTaskContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/contact/task"
                  targetPrefix:@""
                 operationName:@"StartTaskContact"
                   outputClass:[AWSConnectStartTaskContactResponse class]];
}

- (void)startTaskContact:(AWSConnectStartTaskContactRequest *)request
     completionHandler:(void (^)(AWSConnectStartTaskContactResponse *response, NSError *error))completionHandler {
    [[self startTaskContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectStartTaskContactResponse *> * _Nonnull task) {
        AWSConnectStartTaskContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectStartWebRTCContactResponse *> *)startWebRTCContact:(AWSConnectStartWebRTCContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/contact/webrtc"
                  targetPrefix:@""
                 operationName:@"StartWebRTCContact"
                   outputClass:[AWSConnectStartWebRTCContactResponse class]];
}

- (void)startWebRTCContact:(AWSConnectStartWebRTCContactRequest *)request
     completionHandler:(void (^)(AWSConnectStartWebRTCContactResponse *response, NSError *error))completionHandler {
    [[self startWebRTCContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectStartWebRTCContactResponse *> * _Nonnull task) {
        AWSConnectStartWebRTCContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectStopContactResponse *> *)stopContact:(AWSConnectStopContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/stop"
                  targetPrefix:@""
                 operationName:@"StopContact"
                   outputClass:[AWSConnectStopContactResponse class]];
}

- (void)stopContact:(AWSConnectStopContactRequest *)request
     completionHandler:(void (^)(AWSConnectStopContactResponse *response, NSError *error))completionHandler {
    [[self stopContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectStopContactResponse *> * _Nonnull task) {
        AWSConnectStopContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectStopContactRecordingResponse *> *)stopContactRecording:(AWSConnectStopContactRecordingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/stop-recording"
                  targetPrefix:@""
                 operationName:@"StopContactRecording"
                   outputClass:[AWSConnectStopContactRecordingResponse class]];
}

- (void)stopContactRecording:(AWSConnectStopContactRecordingRequest *)request
     completionHandler:(void (^)(AWSConnectStopContactRecordingResponse *response, NSError *error))completionHandler {
    [[self stopContactRecording:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectStopContactRecordingResponse *> * _Nonnull task) {
        AWSConnectStopContactRecordingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectStopContactStreamingResponse *> *)stopContactStreaming:(AWSConnectStopContactStreamingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/stop-streaming"
                  targetPrefix:@""
                 operationName:@"StopContactStreaming"
                   outputClass:[AWSConnectStopContactStreamingResponse class]];
}

- (void)stopContactStreaming:(AWSConnectStopContactStreamingRequest *)request
     completionHandler:(void (^)(AWSConnectStopContactStreamingResponse *response, NSError *error))completionHandler {
    [[self stopContactStreaming:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectStopContactStreamingResponse *> * _Nonnull task) {
        AWSConnectStopContactStreamingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSubmitContactEvaluationResponse *> *)submitContactEvaluation:(AWSConnectSubmitContactEvaluationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact-evaluations/{InstanceId}/{EvaluationId}/submit"
                  targetPrefix:@""
                 operationName:@"SubmitContactEvaluation"
                   outputClass:[AWSConnectSubmitContactEvaluationResponse class]];
}

- (void)submitContactEvaluation:(AWSConnectSubmitContactEvaluationRequest *)request
     completionHandler:(void (^)(AWSConnectSubmitContactEvaluationResponse *response, NSError *error))completionHandler {
    [[self submitContactEvaluation:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSubmitContactEvaluationResponse *> * _Nonnull task) {
        AWSConnectSubmitContactEvaluationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectSuspendContactRecordingResponse *> *)suspendContactRecording:(AWSConnectSuspendContactRecordingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/suspend-recording"
                  targetPrefix:@""
                 operationName:@"SuspendContactRecording"
                   outputClass:[AWSConnectSuspendContactRecordingResponse class]];
}

- (void)suspendContactRecording:(AWSConnectSuspendContactRecordingRequest *)request
     completionHandler:(void (^)(AWSConnectSuspendContactRecordingResponse *response, NSError *error))completionHandler {
    [[self suspendContactRecording:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectSuspendContactRecordingResponse *> * _Nonnull task) {
        AWSConnectSuspendContactRecordingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectTagContactResponse *> *)tagContact:(AWSConnectTagContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/tags"
                  targetPrefix:@""
                 operationName:@"TagContact"
                   outputClass:[AWSConnectTagContactResponse class]];
}

- (void)tagContact:(AWSConnectTagContactRequest *)request
     completionHandler:(void (^)(AWSConnectTagContactResponse *response, NSError *error))completionHandler {
    [[self tagContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectTagContactResponse *> * _Nonnull task) {
        AWSConnectTagContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSConnectTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSConnectTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectTransferContactResponse *> *)transferContact:(AWSConnectTransferContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/transfer"
                  targetPrefix:@""
                 operationName:@"TransferContact"
                   outputClass:[AWSConnectTransferContactResponse class]];
}

- (void)transferContact:(AWSConnectTransferContactRequest *)request
     completionHandler:(void (^)(AWSConnectTransferContactResponse *response, NSError *error))completionHandler {
    [[self transferContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectTransferContactResponse *> * _Nonnull task) {
        AWSConnectTransferContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUntagContactResponse *> *)untagContact:(AWSConnectUntagContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/contact/tags/{InstanceId}/{ContactId}"
                  targetPrefix:@""
                 operationName:@"UntagContact"
                   outputClass:[AWSConnectUntagContactResponse class]];
}

- (void)untagContact:(AWSConnectUntagContactRequest *)request
     completionHandler:(void (^)(AWSConnectUntagContactResponse *response, NSError *error))completionHandler {
    [[self untagContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUntagContactResponse *> * _Nonnull task) {
        AWSConnectUntagContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSConnectUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSConnectUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateAgentStatus:(AWSConnectUpdateAgentStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/agent-status/{InstanceId}/{AgentStatusId}"
                  targetPrefix:@""
                 operationName:@"UpdateAgentStatus"
                   outputClass:nil];
}

- (void)updateAgentStatus:(AWSConnectUpdateAgentStatusRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateAgentStatus:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateContactResponse *> *)updateContact:(AWSConnectUpdateContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contacts/{InstanceId}/{ContactId}"
                  targetPrefix:@""
                 operationName:@"UpdateContact"
                   outputClass:[AWSConnectUpdateContactResponse class]];
}

- (void)updateContact:(AWSConnectUpdateContactRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateContactResponse *response, NSError *error))completionHandler {
    [[self updateContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateContactResponse *> * _Nonnull task) {
        AWSConnectUpdateContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateContactAttributesResponse *> *)updateContactAttributes:(AWSConnectUpdateContactAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/attributes"
                  targetPrefix:@""
                 operationName:@"UpdateContactAttributes"
                   outputClass:[AWSConnectUpdateContactAttributesResponse class]];
}

- (void)updateContactAttributes:(AWSConnectUpdateContactAttributesRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateContactAttributesResponse *response, NSError *error))completionHandler {
    [[self updateContactAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateContactAttributesResponse *> * _Nonnull task) {
        AWSConnectUpdateContactAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateContactEvaluationResponse *> *)updateContactEvaluation:(AWSConnectUpdateContactEvaluationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact-evaluations/{InstanceId}/{EvaluationId}"
                  targetPrefix:@""
                 operationName:@"UpdateContactEvaluation"
                   outputClass:[AWSConnectUpdateContactEvaluationResponse class]];
}

- (void)updateContactEvaluation:(AWSConnectUpdateContactEvaluationRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateContactEvaluationResponse *response, NSError *error))completionHandler {
    [[self updateContactEvaluation:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateContactEvaluationResponse *> * _Nonnull task) {
        AWSConnectUpdateContactEvaluationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateContactFlowContentResponse *> *)updateContactFlowContent:(AWSConnectUpdateContactFlowContentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact-flows/{InstanceId}/{ContactFlowId}/content"
                  targetPrefix:@""
                 operationName:@"UpdateContactFlowContent"
                   outputClass:[AWSConnectUpdateContactFlowContentResponse class]];
}

- (void)updateContactFlowContent:(AWSConnectUpdateContactFlowContentRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateContactFlowContentResponse *response, NSError *error))completionHandler {
    [[self updateContactFlowContent:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateContactFlowContentResponse *> * _Nonnull task) {
        AWSConnectUpdateContactFlowContentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateContactFlowMetadataResponse *> *)updateContactFlowMetadata:(AWSConnectUpdateContactFlowMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact-flows/{InstanceId}/{ContactFlowId}/metadata"
                  targetPrefix:@""
                 operationName:@"UpdateContactFlowMetadata"
                   outputClass:[AWSConnectUpdateContactFlowMetadataResponse class]];
}

- (void)updateContactFlowMetadata:(AWSConnectUpdateContactFlowMetadataRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateContactFlowMetadataResponse *response, NSError *error))completionHandler {
    [[self updateContactFlowMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateContactFlowMetadataResponse *> * _Nonnull task) {
        AWSConnectUpdateContactFlowMetadataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateContactFlowModuleContentResponse *> *)updateContactFlowModuleContent:(AWSConnectUpdateContactFlowModuleContentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/content"
                  targetPrefix:@""
                 operationName:@"UpdateContactFlowModuleContent"
                   outputClass:[AWSConnectUpdateContactFlowModuleContentResponse class]];
}

- (void)updateContactFlowModuleContent:(AWSConnectUpdateContactFlowModuleContentRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateContactFlowModuleContentResponse *response, NSError *error))completionHandler {
    [[self updateContactFlowModuleContent:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateContactFlowModuleContentResponse *> * _Nonnull task) {
        AWSConnectUpdateContactFlowModuleContentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateContactFlowModuleMetadataResponse *> *)updateContactFlowModuleMetadata:(AWSConnectUpdateContactFlowModuleMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/metadata"
                  targetPrefix:@""
                 operationName:@"UpdateContactFlowModuleMetadata"
                   outputClass:[AWSConnectUpdateContactFlowModuleMetadataResponse class]];
}

- (void)updateContactFlowModuleMetadata:(AWSConnectUpdateContactFlowModuleMetadataRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateContactFlowModuleMetadataResponse *response, NSError *error))completionHandler {
    [[self updateContactFlowModuleMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateContactFlowModuleMetadataResponse *> * _Nonnull task) {
        AWSConnectUpdateContactFlowModuleMetadataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateContactFlowNameResponse *> *)updateContactFlowName:(AWSConnectUpdateContactFlowNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact-flows/{InstanceId}/{ContactFlowId}/name"
                  targetPrefix:@""
                 operationName:@"UpdateContactFlowName"
                   outputClass:[AWSConnectUpdateContactFlowNameResponse class]];
}

- (void)updateContactFlowName:(AWSConnectUpdateContactFlowNameRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateContactFlowNameResponse *response, NSError *error))completionHandler {
    [[self updateContactFlowName:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateContactFlowNameResponse *> * _Nonnull task) {
        AWSConnectUpdateContactFlowNameResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateContactRoutingDataResponse *> *)updateContactRoutingData:(AWSConnectUpdateContactRoutingDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contacts/{InstanceId}/{ContactId}/routing-data"
                  targetPrefix:@""
                 operationName:@"UpdateContactRoutingData"
                   outputClass:[AWSConnectUpdateContactRoutingDataResponse class]];
}

- (void)updateContactRoutingData:(AWSConnectUpdateContactRoutingDataRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateContactRoutingDataResponse *response, NSError *error))completionHandler {
    [[self updateContactRoutingData:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateContactRoutingDataResponse *> * _Nonnull task) {
        AWSConnectUpdateContactRoutingDataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateContactScheduleResponse *> *)updateContactSchedule:(AWSConnectUpdateContactScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/contact/schedule"
                  targetPrefix:@""
                 operationName:@"UpdateContactSchedule"
                   outputClass:[AWSConnectUpdateContactScheduleResponse class]];
}

- (void)updateContactSchedule:(AWSConnectUpdateContactScheduleRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateContactScheduleResponse *response, NSError *error))completionHandler {
    [[self updateContactSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateContactScheduleResponse *> * _Nonnull task) {
        AWSConnectUpdateContactScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateEvaluationFormResponse *> *)updateEvaluationForm:(AWSConnectUpdateEvaluationFormRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/evaluation-forms/{InstanceId}/{EvaluationFormId}"
                  targetPrefix:@""
                 operationName:@"UpdateEvaluationForm"
                   outputClass:[AWSConnectUpdateEvaluationFormResponse class]];
}

- (void)updateEvaluationForm:(AWSConnectUpdateEvaluationFormRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateEvaluationFormResponse *response, NSError *error))completionHandler {
    [[self updateEvaluationForm:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateEvaluationFormResponse *> * _Nonnull task) {
        AWSConnectUpdateEvaluationFormResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateHoursOfOperation:(AWSConnectUpdateHoursOfOperationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/hours-of-operations/{InstanceId}/{HoursOfOperationId}"
                  targetPrefix:@""
                 operationName:@"UpdateHoursOfOperation"
                   outputClass:nil];
}

- (void)updateHoursOfOperation:(AWSConnectUpdateHoursOfOperationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateHoursOfOperation:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateInstanceAttribute:(AWSConnectUpdateInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/instance/{InstanceId}/attribute/{AttributeType}"
                  targetPrefix:@""
                 operationName:@"UpdateInstanceAttribute"
                   outputClass:nil];
}

- (void)updateInstanceAttribute:(AWSConnectUpdateInstanceAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateInstanceAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateInstanceStorageConfig:(AWSConnectUpdateInstanceStorageConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/instance/{InstanceId}/storage-config/{AssociationId}"
                  targetPrefix:@""
                 operationName:@"UpdateInstanceStorageConfig"
                   outputClass:nil];
}

- (void)updateInstanceStorageConfig:(AWSConnectUpdateInstanceStorageConfigRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateInstanceStorageConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateParticipantRoleConfigResponse *> *)updateParticipantRoleConfig:(AWSConnectUpdateParticipantRoleConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/contact/participant-role-config/{InstanceId}/{ContactId}"
                  targetPrefix:@""
                 operationName:@"UpdateParticipantRoleConfig"
                   outputClass:[AWSConnectUpdateParticipantRoleConfigResponse class]];
}

- (void)updateParticipantRoleConfig:(AWSConnectUpdateParticipantRoleConfigRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateParticipantRoleConfigResponse *response, NSError *error))completionHandler {
    [[self updateParticipantRoleConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateParticipantRoleConfigResponse *> * _Nonnull task) {
        AWSConnectUpdateParticipantRoleConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdatePhoneNumberResponse *> *)updatePhoneNumber:(AWSConnectUpdatePhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/phone-number/{PhoneNumberId}"
                  targetPrefix:@""
                 operationName:@"UpdatePhoneNumber"
                   outputClass:[AWSConnectUpdatePhoneNumberResponse class]];
}

- (void)updatePhoneNumber:(AWSConnectUpdatePhoneNumberRequest *)request
     completionHandler:(void (^)(AWSConnectUpdatePhoneNumberResponse *response, NSError *error))completionHandler {
    [[self updatePhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdatePhoneNumberResponse *> * _Nonnull task) {
        AWSConnectUpdatePhoneNumberResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updatePhoneNumberMetadata:(AWSConnectUpdatePhoneNumberMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/phone-number/{PhoneNumberId}/metadata"
                  targetPrefix:@""
                 operationName:@"UpdatePhoneNumberMetadata"
                   outputClass:nil];
}

- (void)updatePhoneNumberMetadata:(AWSConnectUpdatePhoneNumberMetadataRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updatePhoneNumberMetadata:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updatePredefinedAttribute:(AWSConnectUpdatePredefinedAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/predefined-attributes/{InstanceId}/{Name}"
                  targetPrefix:@""
                 operationName:@"UpdatePredefinedAttribute"
                   outputClass:nil];
}

- (void)updatePredefinedAttribute:(AWSConnectUpdatePredefinedAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updatePredefinedAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdatePromptResponse *> *)updatePrompt:(AWSConnectUpdatePromptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prompts/{InstanceId}/{PromptId}"
                  targetPrefix:@""
                 operationName:@"UpdatePrompt"
                   outputClass:[AWSConnectUpdatePromptResponse class]];
}

- (void)updatePrompt:(AWSConnectUpdatePromptRequest *)request
     completionHandler:(void (^)(AWSConnectUpdatePromptResponse *response, NSError *error))completionHandler {
    [[self updatePrompt:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdatePromptResponse *> * _Nonnull task) {
        AWSConnectUpdatePromptResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateQueueHoursOfOperation:(AWSConnectUpdateQueueHoursOfOperationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/queues/{InstanceId}/{QueueId}/hours-of-operation"
                  targetPrefix:@""
                 operationName:@"UpdateQueueHoursOfOperation"
                   outputClass:nil];
}

- (void)updateQueueHoursOfOperation:(AWSConnectUpdateQueueHoursOfOperationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateQueueHoursOfOperation:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateQueueMaxContacts:(AWSConnectUpdateQueueMaxContactsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/queues/{InstanceId}/{QueueId}/max-contacts"
                  targetPrefix:@""
                 operationName:@"UpdateQueueMaxContacts"
                   outputClass:nil];
}

- (void)updateQueueMaxContacts:(AWSConnectUpdateQueueMaxContactsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateQueueMaxContacts:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateQueueName:(AWSConnectUpdateQueueNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/queues/{InstanceId}/{QueueId}/name"
                  targetPrefix:@""
                 operationName:@"UpdateQueueName"
                   outputClass:nil];
}

- (void)updateQueueName:(AWSConnectUpdateQueueNameRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateQueueName:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateQueueOutboundCallerConfig:(AWSConnectUpdateQueueOutboundCallerConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/queues/{InstanceId}/{QueueId}/outbound-caller-config"
                  targetPrefix:@""
                 operationName:@"UpdateQueueOutboundCallerConfig"
                   outputClass:nil];
}

- (void)updateQueueOutboundCallerConfig:(AWSConnectUpdateQueueOutboundCallerConfigRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateQueueOutboundCallerConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateQueueStatus:(AWSConnectUpdateQueueStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/queues/{InstanceId}/{QueueId}/status"
                  targetPrefix:@""
                 operationName:@"UpdateQueueStatus"
                   outputClass:nil];
}

- (void)updateQueueStatus:(AWSConnectUpdateQueueStatusRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateQueueStatus:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateQuickConnectConfig:(AWSConnectUpdateQuickConnectConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/quick-connects/{InstanceId}/{QuickConnectId}/config"
                  targetPrefix:@""
                 operationName:@"UpdateQuickConnectConfig"
                   outputClass:nil];
}

- (void)updateQuickConnectConfig:(AWSConnectUpdateQuickConnectConfigRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateQuickConnectConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateQuickConnectName:(AWSConnectUpdateQuickConnectNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/quick-connects/{InstanceId}/{QuickConnectId}/name"
                  targetPrefix:@""
                 operationName:@"UpdateQuickConnectName"
                   outputClass:nil];
}

- (void)updateQuickConnectName:(AWSConnectUpdateQuickConnectNameRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateQuickConnectName:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateRoutingProfileAgentAvailabilityTimer:(AWSConnectUpdateRoutingProfileAgentAvailabilityTimerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/routing-profiles/{InstanceId}/{RoutingProfileId}/agent-availability-timer"
                  targetPrefix:@""
                 operationName:@"UpdateRoutingProfileAgentAvailabilityTimer"
                   outputClass:nil];
}

- (void)updateRoutingProfileAgentAvailabilityTimer:(AWSConnectUpdateRoutingProfileAgentAvailabilityTimerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateRoutingProfileAgentAvailabilityTimer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateRoutingProfileConcurrency:(AWSConnectUpdateRoutingProfileConcurrencyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/routing-profiles/{InstanceId}/{RoutingProfileId}/concurrency"
                  targetPrefix:@""
                 operationName:@"UpdateRoutingProfileConcurrency"
                   outputClass:nil];
}

- (void)updateRoutingProfileConcurrency:(AWSConnectUpdateRoutingProfileConcurrencyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateRoutingProfileConcurrency:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateRoutingProfileDefaultOutboundQueue:(AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/routing-profiles/{InstanceId}/{RoutingProfileId}/default-outbound-queue"
                  targetPrefix:@""
                 operationName:@"UpdateRoutingProfileDefaultOutboundQueue"
                   outputClass:nil];
}

- (void)updateRoutingProfileDefaultOutboundQueue:(AWSConnectUpdateRoutingProfileDefaultOutboundQueueRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateRoutingProfileDefaultOutboundQueue:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateRoutingProfileName:(AWSConnectUpdateRoutingProfileNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/routing-profiles/{InstanceId}/{RoutingProfileId}/name"
                  targetPrefix:@""
                 operationName:@"UpdateRoutingProfileName"
                   outputClass:nil];
}

- (void)updateRoutingProfileName:(AWSConnectUpdateRoutingProfileNameRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateRoutingProfileName:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateRoutingProfileQueues:(AWSConnectUpdateRoutingProfileQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/routing-profiles/{InstanceId}/{RoutingProfileId}/queues"
                  targetPrefix:@""
                 operationName:@"UpdateRoutingProfileQueues"
                   outputClass:nil];
}

- (void)updateRoutingProfileQueues:(AWSConnectUpdateRoutingProfileQueuesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateRoutingProfileQueues:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateRule:(AWSConnectUpdateRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/rules/{InstanceId}/{RuleId}"
                  targetPrefix:@""
                 operationName:@"UpdateRule"
                   outputClass:nil];
}

- (void)updateRule:(AWSConnectUpdateRuleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateRule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateSecurityProfile:(AWSConnectUpdateSecurityProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/security-profiles/{InstanceId}/{SecurityProfileId}"
                  targetPrefix:@""
                 operationName:@"UpdateSecurityProfile"
                   outputClass:nil];
}

- (void)updateSecurityProfile:(AWSConnectUpdateSecurityProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateSecurityProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateTaskTemplateResponse *> *)updateTaskTemplate:(AWSConnectUpdateTaskTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/instance/{InstanceId}/task/template/{TaskTemplateId}"
                  targetPrefix:@""
                 operationName:@"UpdateTaskTemplate"
                   outputClass:[AWSConnectUpdateTaskTemplateResponse class]];
}

- (void)updateTaskTemplate:(AWSConnectUpdateTaskTemplateRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateTaskTemplateResponse *response, NSError *error))completionHandler {
    [[self updateTaskTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateTaskTemplateResponse *> * _Nonnull task) {
        AWSConnectUpdateTaskTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateTrafficDistributionResponse *> *)updateTrafficDistribution:(AWSConnectUpdateTrafficDistributionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/traffic-distribution/{Id}"
                  targetPrefix:@""
                 operationName:@"UpdateTrafficDistribution"
                   outputClass:[AWSConnectUpdateTrafficDistributionResponse class]];
}

- (void)updateTrafficDistribution:(AWSConnectUpdateTrafficDistributionRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateTrafficDistributionResponse *response, NSError *error))completionHandler {
    [[self updateTrafficDistribution:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateTrafficDistributionResponse *> * _Nonnull task) {
        AWSConnectUpdateTrafficDistributionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateUserHierarchy:(AWSConnectUpdateUserHierarchyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/users/{InstanceId}/{UserId}/hierarchy"
                  targetPrefix:@""
                 operationName:@"UpdateUserHierarchy"
                   outputClass:nil];
}

- (void)updateUserHierarchy:(AWSConnectUpdateUserHierarchyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateUserHierarchy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateUserHierarchyGroupName:(AWSConnectUpdateUserHierarchyGroupNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}/name"
                  targetPrefix:@""
                 operationName:@"UpdateUserHierarchyGroupName"
                   outputClass:nil];
}

- (void)updateUserHierarchyGroupName:(AWSConnectUpdateUserHierarchyGroupNameRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateUserHierarchyGroupName:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateUserHierarchyStructure:(AWSConnectUpdateUserHierarchyStructureRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/user-hierarchy-structure/{InstanceId}"
                  targetPrefix:@""
                 operationName:@"UpdateUserHierarchyStructure"
                   outputClass:nil];
}

- (void)updateUserHierarchyStructure:(AWSConnectUpdateUserHierarchyStructureRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateUserHierarchyStructure:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateUserIdentityInfo:(AWSConnectUpdateUserIdentityInfoRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/users/{InstanceId}/{UserId}/identity-info"
                  targetPrefix:@""
                 operationName:@"UpdateUserIdentityInfo"
                   outputClass:nil];
}

- (void)updateUserIdentityInfo:(AWSConnectUpdateUserIdentityInfoRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateUserIdentityInfo:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateUserPhoneConfig:(AWSConnectUpdateUserPhoneConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/users/{InstanceId}/{UserId}/phone-config"
                  targetPrefix:@""
                 operationName:@"UpdateUserPhoneConfig"
                   outputClass:nil];
}

- (void)updateUserPhoneConfig:(AWSConnectUpdateUserPhoneConfigRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateUserPhoneConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateUserProficiencies:(AWSConnectUpdateUserProficienciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/users/{InstanceId}/{UserId}/proficiencies"
                  targetPrefix:@""
                 operationName:@"UpdateUserProficiencies"
                   outputClass:nil];
}

- (void)updateUserProficiencies:(AWSConnectUpdateUserProficienciesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateUserProficiencies:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateUserRoutingProfile:(AWSConnectUpdateUserRoutingProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/users/{InstanceId}/{UserId}/routing-profile"
                  targetPrefix:@""
                 operationName:@"UpdateUserRoutingProfile"
                   outputClass:nil];
}

- (void)updateUserRoutingProfile:(AWSConnectUpdateUserRoutingProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateUserRoutingProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateUserSecurityProfiles:(AWSConnectUpdateUserSecurityProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/users/{InstanceId}/{UserId}/security-profiles"
                  targetPrefix:@""
                 operationName:@"UpdateUserSecurityProfiles"
                   outputClass:nil];
}

- (void)updateUserSecurityProfiles:(AWSConnectUpdateUserSecurityProfilesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateUserSecurityProfiles:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateViewContentResponse *> *)updateViewContent:(AWSConnectUpdateViewContentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/views/{InstanceId}/{ViewId}"
                  targetPrefix:@""
                 operationName:@"UpdateViewContent"
                   outputClass:[AWSConnectUpdateViewContentResponse class]];
}

- (void)updateViewContent:(AWSConnectUpdateViewContentRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateViewContentResponse *response, NSError *error))completionHandler {
    [[self updateViewContent:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateViewContentResponse *> * _Nonnull task) {
        AWSConnectUpdateViewContentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectUpdateViewMetadataResponse *> *)updateViewMetadata:(AWSConnectUpdateViewMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/views/{InstanceId}/{ViewId}/metadata"
                  targetPrefix:@""
                 operationName:@"UpdateViewMetadata"
                   outputClass:[AWSConnectUpdateViewMetadataResponse class]];
}

- (void)updateViewMetadata:(AWSConnectUpdateViewMetadataRequest *)request
     completionHandler:(void (^)(AWSConnectUpdateViewMetadataResponse *response, NSError *error))completionHandler {
    [[self updateViewMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectUpdateViewMetadataResponse *> * _Nonnull task) {
        AWSConnectUpdateViewMetadataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
