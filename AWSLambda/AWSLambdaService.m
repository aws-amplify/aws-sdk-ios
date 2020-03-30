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

#import "AWSLambdaService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSLambdaResources.h"
#import "AWSLambdaRequestRetryHandler.h"

static NSString *const AWSInfoLambda = @"Lambda";
NSString *const AWSLambdaSDKVersion = @"2.13.1";


@interface AWSLambdaResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSLambdaResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"CodeStorageExceededException" : @(AWSLambdaErrorCodeStorageExceeded),
                            @"EC2AccessDeniedException" : @(AWSLambdaErrorEC2AccessDenied),
                            @"EC2ThrottledException" : @(AWSLambdaErrorEC2Throttled),
                            @"EC2UnexpectedException" : @(AWSLambdaErrorEC2Unexpected),
                            @"ENILimitReachedException" : @(AWSLambdaErrorENILimitReached),
                            @"InvalidParameterValueException" : @(AWSLambdaErrorInvalidParameterValue),
                            @"InvalidRequestContentException" : @(AWSLambdaErrorInvalidRequestContent),
                            @"InvalidRuntimeException" : @(AWSLambdaErrorInvalidRuntime),
                            @"InvalidSecurityGroupIDException" : @(AWSLambdaErrorInvalidSecurityGroupID),
                            @"InvalidSubnetIDException" : @(AWSLambdaErrorInvalidSubnetID),
                            @"InvalidZipFileException" : @(AWSLambdaErrorInvalidZipFile),
                            @"KMSAccessDeniedException" : @(AWSLambdaErrorKMSAccessDenied),
                            @"KMSDisabledException" : @(AWSLambdaErrorKMSDisabled),
                            @"KMSInvalidStateException" : @(AWSLambdaErrorKMSInvalidState),
                            @"KMSNotFoundException" : @(AWSLambdaErrorKMSNotFound),
                            @"PolicyLengthExceededException" : @(AWSLambdaErrorPolicyLengthExceeded),
                            @"PreconditionFailedException" : @(AWSLambdaErrorPreconditionFailed),
                            @"ProvisionedConcurrencyConfigNotFoundException" : @(AWSLambdaErrorProvisionedConcurrencyConfigNotFound),
                            @"RequestTooLargeException" : @(AWSLambdaErrorRequestTooLarge),
                            @"ResourceConflictException" : @(AWSLambdaErrorResourceConflict),
                            @"ResourceInUseException" : @(AWSLambdaErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSLambdaErrorResourceNotFound),
                            @"ResourceNotReadyException" : @(AWSLambdaErrorResourceNotReady),
                            @"ServiceException" : @(AWSLambdaErrorService),
                            @"SubnetIPAddressLimitReachedException" : @(AWSLambdaErrorSubnetIPAddressLimitReached),
                            @"TooManyRequestsException" : @(AWSLambdaErrorTooManyRequests),
                            @"UnsupportedMediaTypeException" : @(AWSLambdaErrorUnsupportedMediaType),
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

	if (*error) {
        NSMutableDictionary *richUserInfo = [NSMutableDictionary dictionaryWithDictionary:(*error).userInfo];
        [richUserInfo setObject:@"responseStatusCode" forKey:@([response statusCode])];
        [richUserInfo setObject:@"responseHeaders" forKey:[response allHeaderFields]];
        [richUserInfo setObject:@"responseDataSize" forKey:@(data?[data length]:0)];
        *error = [NSError errorWithDomain:(*error).domain
                                     code:(*error).code
                                 userInfo:richUserInfo];
        
    }
    
    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
        NSString *errorTypeHeader = [[[[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"] componentsSeparatedByString:@":"] firstObject];
        
        //server may also return error message in the body, need to catch it.
        if (errorTypeHeader == nil) {
            errorTypeHeader = [responseObject objectForKey:@"__type"];
        }
        
        if (errorCodeDictionary[[[errorTypeHeader componentsSeparatedByString:@"#"] lastObject]]) {
            if (error) {
                NSMutableDictionary *userInfo = [@{
                                                   NSLocalizedFailureReasonErrorKey : errorTypeHeader,
                                                   @"responseStatusCode" : @([response statusCode]),
                                                   @"responseHeaders" : [response allHeaderFields],
                                                   @"responseDataSize" : @(data?[data length]:0),
                                                   } mutableCopy];
                [userInfo addEntriesFromDictionary:responseObject];
                *error = [NSError errorWithDomain:AWSLambdaErrorDomain
                                             code:[[errorCodeDictionary objectForKey:[[errorTypeHeader componentsSeparatedByString:@"#"] lastObject]] integerValue]
                                         userInfo:userInfo];
            }
            return responseObject;
        } else if ([[errorTypeHeader componentsSeparatedByString:@"#"] lastObject]) {
            if (error) {
                NSMutableDictionary *userInfo = [@{
                                                   NSLocalizedFailureReasonErrorKey : errorTypeHeader,
                                                   @"responseStatusCode" : @([response statusCode]),
                                                   @"responseHeaders" : [response allHeaderFields],
                                                   @"responseDataSize" : @(data?[data length]:0),
                                                   } mutableCopy];
                [userInfo addEntriesFromDictionary:responseObject];
                *error = [NSError errorWithDomain:AWSLambdaErrorDomain
                                             code:AWSLambdaErrorUnknown
                                         userInfo:userInfo];
            }
            return responseObject;
        } else if (response.statusCode/100 != 2) {
            //should be an error if not a 2xx response.
            if (error) {
                *error = [NSError errorWithDomain:AWSLambdaErrorDomain
                                             code:AWSLambdaErrorUnknown
                                         userInfo:responseObject];
            } 
            return responseObject;
        }
        
        
        if (self.outputClass) {
            responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
                                          fromJSONDictionary:responseObject
                                                       error:error];
        }
    }
    
    if (responseObject == nil ||
        ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject count] == 0)) {
        return @{@"responseStatusCode" : @([response statusCode]),
                 @"responseHeaders" : [response allHeaderFields],
                 @"responseDataSize" : @(data?[data length]:0),
                 };
    }
	
    return responseObject;
}

@end


@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSLambda()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSLambda

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSLambdaSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSLambda versions need to match. Check your SDK installation. AWSCore: %@ AWSLambda: %@", AWSiOSSDKVersion, AWSLambdaSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultLambda {
    static AWSLambda *_defaultLambda = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoLambda];
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
        _defaultLambda = [[AWSLambda alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultLambda;
}

+ (void)registerLambdaWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSLambda alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)LambdaForKey:(NSString *)key {
    @synchronized(self) {
        AWSLambda *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoLambda
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSLambda registerLambdaWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeLambdaForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultLambda` or `+ LambdaForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceLambda
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceLambda];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSLambdaRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSLambdaResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSLambdaResponseSerializer alloc] initWithJSONDefinition:[[AWSLambdaResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSLambdaAddLayerVersionPermissionResponse *> *)addLayerVersionPermission:(AWSLambdaAddLayerVersionPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy"
                  targetPrefix:@""
                 operationName:@"AddLayerVersionPermission"
                   outputClass:[AWSLambdaAddLayerVersionPermissionResponse class]];
}

- (void)addLayerVersionPermission:(AWSLambdaAddLayerVersionPermissionRequest *)request
     completionHandler:(void (^)(AWSLambdaAddLayerVersionPermissionResponse *response, NSError *error))completionHandler {
    [[self addLayerVersionPermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaAddLayerVersionPermissionResponse *> * _Nonnull task) {
        AWSLambdaAddLayerVersionPermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaAddPermissionResponse *> *)addPermission:(AWSLambdaAddPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-03-31/functions/{FunctionName}/policy"
                  targetPrefix:@""
                 operationName:@"AddPermission"
                   outputClass:[AWSLambdaAddPermissionResponse class]];
}

- (void)addPermission:(AWSLambdaAddPermissionRequest *)request
     completionHandler:(void (^)(AWSLambdaAddPermissionResponse *response, NSError *error))completionHandler {
    [[self addPermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaAddPermissionResponse *> * _Nonnull task) {
        AWSLambdaAddPermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaAliasConfiguration *> *)createAlias:(AWSLambdaCreateAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-03-31/functions/{FunctionName}/aliases"
                  targetPrefix:@""
                 operationName:@"CreateAlias"
                   outputClass:[AWSLambdaAliasConfiguration class]];
}

- (void)createAlias:(AWSLambdaCreateAliasRequest *)request
     completionHandler:(void (^)(AWSLambdaAliasConfiguration *response, NSError *error))completionHandler {
    [[self createAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaAliasConfiguration *> * _Nonnull task) {
        AWSLambdaAliasConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)createEventSourceMapping:(AWSLambdaCreateEventSourceMappingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-03-31/event-source-mappings/"
                  targetPrefix:@""
                 operationName:@"CreateEventSourceMapping"
                   outputClass:[AWSLambdaEventSourceMappingConfiguration class]];
}

- (void)createEventSourceMapping:(AWSLambdaCreateEventSourceMappingRequest *)request
     completionHandler:(void (^)(AWSLambdaEventSourceMappingConfiguration *response, NSError *error))completionHandler {
    [[self createEventSourceMapping:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaEventSourceMappingConfiguration *> * _Nonnull task) {
        AWSLambdaEventSourceMappingConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaFunctionConfiguration *> *)createFunction:(AWSLambdaCreateFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-03-31/functions"
                  targetPrefix:@""
                 operationName:@"CreateFunction"
                   outputClass:[AWSLambdaFunctionConfiguration class]];
}

- (void)createFunction:(AWSLambdaCreateFunctionRequest *)request
     completionHandler:(void (^)(AWSLambdaFunctionConfiguration *response, NSError *error))completionHandler {
    [[self createFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaFunctionConfiguration *> * _Nonnull task) {
        AWSLambdaFunctionConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAlias:(AWSLambdaDeleteAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-03-31/functions/{FunctionName}/aliases/{Name}"
                  targetPrefix:@""
                 operationName:@"DeleteAlias"
                   outputClass:nil];
}

- (void)deleteAlias:(AWSLambdaDeleteAliasRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAlias:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)deleteEventSourceMapping:(AWSLambdaDeleteEventSourceMappingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-03-31/event-source-mappings/{UUID}"
                  targetPrefix:@""
                 operationName:@"DeleteEventSourceMapping"
                   outputClass:[AWSLambdaEventSourceMappingConfiguration class]];
}

- (void)deleteEventSourceMapping:(AWSLambdaDeleteEventSourceMappingRequest *)request
     completionHandler:(void (^)(AWSLambdaEventSourceMappingConfiguration *response, NSError *error))completionHandler {
    [[self deleteEventSourceMapping:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaEventSourceMappingConfiguration *> * _Nonnull task) {
        AWSLambdaEventSourceMappingConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteFunction:(AWSLambdaDeleteFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-03-31/functions/{FunctionName}"
                  targetPrefix:@""
                 operationName:@"DeleteFunction"
                   outputClass:nil];
}

- (void)deleteFunction:(AWSLambdaDeleteFunctionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteFunction:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteFunctionConcurrency:(AWSLambdaDeleteFunctionConcurrencyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-10-31/functions/{FunctionName}/concurrency"
                  targetPrefix:@""
                 operationName:@"DeleteFunctionConcurrency"
                   outputClass:nil];
}

- (void)deleteFunctionConcurrency:(AWSLambdaDeleteFunctionConcurrencyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteFunctionConcurrency:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteFunctionEventInvokeConfig:(AWSLambdaDeleteFunctionEventInvokeConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2019-09-25/functions/{FunctionName}/event-invoke-config"
                  targetPrefix:@""
                 operationName:@"DeleteFunctionEventInvokeConfig"
                   outputClass:nil];
}

- (void)deleteFunctionEventInvokeConfig:(AWSLambdaDeleteFunctionEventInvokeConfigRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteFunctionEventInvokeConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteLayerVersion:(AWSLambdaDeleteLayerVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2018-10-31/layers/{LayerName}/versions/{VersionNumber}"
                  targetPrefix:@""
                 operationName:@"DeleteLayerVersion"
                   outputClass:nil];
}

- (void)deleteLayerVersion:(AWSLambdaDeleteLayerVersionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteLayerVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteProvisionedConcurrencyConfig:(AWSLambdaDeleteProvisionedConcurrencyConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2019-09-30/functions/{FunctionName}/provisioned-concurrency"
                  targetPrefix:@""
                 operationName:@"DeleteProvisionedConcurrencyConfig"
                   outputClass:nil];
}

- (void)deleteProvisionedConcurrencyConfig:(AWSLambdaDeleteProvisionedConcurrencyConfigRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteProvisionedConcurrencyConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaGetAccountSettingsResponse *> *)getAccountSettings:(AWSLambdaGetAccountSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2016-08-19/account-settings/"
                  targetPrefix:@""
                 operationName:@"GetAccountSettings"
                   outputClass:[AWSLambdaGetAccountSettingsResponse class]];
}

- (void)getAccountSettings:(AWSLambdaGetAccountSettingsRequest *)request
     completionHandler:(void (^)(AWSLambdaGetAccountSettingsResponse *response, NSError *error))completionHandler {
    [[self getAccountSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaGetAccountSettingsResponse *> * _Nonnull task) {
        AWSLambdaGetAccountSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaAliasConfiguration *> *)getAlias:(AWSLambdaGetAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-03-31/functions/{FunctionName}/aliases/{Name}"
                  targetPrefix:@""
                 operationName:@"GetAlias"
                   outputClass:[AWSLambdaAliasConfiguration class]];
}

- (void)getAlias:(AWSLambdaGetAliasRequest *)request
     completionHandler:(void (^)(AWSLambdaAliasConfiguration *response, NSError *error))completionHandler {
    [[self getAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaAliasConfiguration *> * _Nonnull task) {
        AWSLambdaAliasConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)getEventSourceMapping:(AWSLambdaGetEventSourceMappingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-03-31/event-source-mappings/{UUID}"
                  targetPrefix:@""
                 operationName:@"GetEventSourceMapping"
                   outputClass:[AWSLambdaEventSourceMappingConfiguration class]];
}

- (void)getEventSourceMapping:(AWSLambdaGetEventSourceMappingRequest *)request
     completionHandler:(void (^)(AWSLambdaEventSourceMappingConfiguration *response, NSError *error))completionHandler {
    [[self getEventSourceMapping:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaEventSourceMappingConfiguration *> * _Nonnull task) {
        AWSLambdaEventSourceMappingConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaGetFunctionResponse *> *)getFunction:(AWSLambdaGetFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-03-31/functions/{FunctionName}"
                  targetPrefix:@""
                 operationName:@"GetFunction"
                   outputClass:[AWSLambdaGetFunctionResponse class]];
}

- (void)getFunction:(AWSLambdaGetFunctionRequest *)request
     completionHandler:(void (^)(AWSLambdaGetFunctionResponse *response, NSError *error))completionHandler {
    [[self getFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaGetFunctionResponse *> * _Nonnull task) {
        AWSLambdaGetFunctionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaGetFunctionConcurrencyResponse *> *)getFunctionConcurrency:(AWSLambdaGetFunctionConcurrencyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-09-30/functions/{FunctionName}/concurrency"
                  targetPrefix:@""
                 operationName:@"GetFunctionConcurrency"
                   outputClass:[AWSLambdaGetFunctionConcurrencyResponse class]];
}

- (void)getFunctionConcurrency:(AWSLambdaGetFunctionConcurrencyRequest *)request
     completionHandler:(void (^)(AWSLambdaGetFunctionConcurrencyResponse *response, NSError *error))completionHandler {
    [[self getFunctionConcurrency:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaGetFunctionConcurrencyResponse *> * _Nonnull task) {
        AWSLambdaGetFunctionConcurrencyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaFunctionConfiguration *> *)getFunctionConfiguration:(AWSLambdaGetFunctionConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-03-31/functions/{FunctionName}/configuration"
                  targetPrefix:@""
                 operationName:@"GetFunctionConfiguration"
                   outputClass:[AWSLambdaFunctionConfiguration class]];
}

- (void)getFunctionConfiguration:(AWSLambdaGetFunctionConfigurationRequest *)request
     completionHandler:(void (^)(AWSLambdaFunctionConfiguration *response, NSError *error))completionHandler {
    [[self getFunctionConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaFunctionConfiguration *> * _Nonnull task) {
        AWSLambdaFunctionConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaFunctionEventInvokeConfig *> *)getFunctionEventInvokeConfig:(AWSLambdaGetFunctionEventInvokeConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-09-25/functions/{FunctionName}/event-invoke-config"
                  targetPrefix:@""
                 operationName:@"GetFunctionEventInvokeConfig"
                   outputClass:[AWSLambdaFunctionEventInvokeConfig class]];
}

- (void)getFunctionEventInvokeConfig:(AWSLambdaGetFunctionEventInvokeConfigRequest *)request
     completionHandler:(void (^)(AWSLambdaFunctionEventInvokeConfig *response, NSError *error))completionHandler {
    [[self getFunctionEventInvokeConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaFunctionEventInvokeConfig *> * _Nonnull task) {
        AWSLambdaFunctionEventInvokeConfig *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaGetLayerVersionResponse *> *)getLayerVersion:(AWSLambdaGetLayerVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2018-10-31/layers/{LayerName}/versions/{VersionNumber}"
                  targetPrefix:@""
                 operationName:@"GetLayerVersion"
                   outputClass:[AWSLambdaGetLayerVersionResponse class]];
}

- (void)getLayerVersion:(AWSLambdaGetLayerVersionRequest *)request
     completionHandler:(void (^)(AWSLambdaGetLayerVersionResponse *response, NSError *error))completionHandler {
    [[self getLayerVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaGetLayerVersionResponse *> * _Nonnull task) {
        AWSLambdaGetLayerVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaGetLayerVersionResponse *> *)getLayerVersionByArn:(AWSLambdaGetLayerVersionByArnRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2018-10-31/layers?find=LayerVersion"
                  targetPrefix:@""
                 operationName:@"GetLayerVersionByArn"
                   outputClass:[AWSLambdaGetLayerVersionResponse class]];
}

- (void)getLayerVersionByArn:(AWSLambdaGetLayerVersionByArnRequest *)request
     completionHandler:(void (^)(AWSLambdaGetLayerVersionResponse *response, NSError *error))completionHandler {
    [[self getLayerVersionByArn:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaGetLayerVersionResponse *> * _Nonnull task) {
        AWSLambdaGetLayerVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaGetLayerVersionPolicyResponse *> *)getLayerVersionPolicy:(AWSLambdaGetLayerVersionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy"
                  targetPrefix:@""
                 operationName:@"GetLayerVersionPolicy"
                   outputClass:[AWSLambdaGetLayerVersionPolicyResponse class]];
}

- (void)getLayerVersionPolicy:(AWSLambdaGetLayerVersionPolicyRequest *)request
     completionHandler:(void (^)(AWSLambdaGetLayerVersionPolicyResponse *response, NSError *error))completionHandler {
    [[self getLayerVersionPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaGetLayerVersionPolicyResponse *> * _Nonnull task) {
        AWSLambdaGetLayerVersionPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaGetPolicyResponse *> *)getPolicy:(AWSLambdaGetPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-03-31/functions/{FunctionName}/policy"
                  targetPrefix:@""
                 operationName:@"GetPolicy"
                   outputClass:[AWSLambdaGetPolicyResponse class]];
}

- (void)getPolicy:(AWSLambdaGetPolicyRequest *)request
     completionHandler:(void (^)(AWSLambdaGetPolicyResponse *response, NSError *error))completionHandler {
    [[self getPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaGetPolicyResponse *> * _Nonnull task) {
        AWSLambdaGetPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaGetProvisionedConcurrencyConfigResponse *> *)getProvisionedConcurrencyConfig:(AWSLambdaGetProvisionedConcurrencyConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-09-30/functions/{FunctionName}/provisioned-concurrency"
                  targetPrefix:@""
                 operationName:@"GetProvisionedConcurrencyConfig"
                   outputClass:[AWSLambdaGetProvisionedConcurrencyConfigResponse class]];
}

- (void)getProvisionedConcurrencyConfig:(AWSLambdaGetProvisionedConcurrencyConfigRequest *)request
     completionHandler:(void (^)(AWSLambdaGetProvisionedConcurrencyConfigResponse *response, NSError *error))completionHandler {
    [[self getProvisionedConcurrencyConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaGetProvisionedConcurrencyConfigResponse *> * _Nonnull task) {
        AWSLambdaGetProvisionedConcurrencyConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaInvocationResponse *> *)invoke:(AWSLambdaInvocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-03-31/functions/{FunctionName}/invocations"
                  targetPrefix:@""
                 operationName:@"Invoke"
                   outputClass:[AWSLambdaInvocationResponse class]];
}

- (void)invoke:(AWSLambdaInvocationRequest *)request
     completionHandler:(void (^)(AWSLambdaInvocationResponse *response, NSError *error))completionHandler {
    [[self invoke:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaInvocationResponse *> * _Nonnull task) {
        AWSLambdaInvocationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaInvokeAsyncResponse *> *)invokeAsync:(AWSLambdaInvokeAsyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2014-11-13/functions/{FunctionName}/invoke-async/"
                  targetPrefix:@""
                 operationName:@"InvokeAsync"
                   outputClass:[AWSLambdaInvokeAsyncResponse class]];
}

- (void)invokeAsync:(AWSLambdaInvokeAsyncRequest *)request
     completionHandler:(void (^)(AWSLambdaInvokeAsyncResponse *response, NSError *error))completionHandler {
    [[self invokeAsync:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaInvokeAsyncResponse *> * _Nonnull task) {
        AWSLambdaInvokeAsyncResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaListAliasesResponse *> *)listAliases:(AWSLambdaListAliasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-03-31/functions/{FunctionName}/aliases"
                  targetPrefix:@""
                 operationName:@"ListAliases"
                   outputClass:[AWSLambdaListAliasesResponse class]];
}

- (void)listAliases:(AWSLambdaListAliasesRequest *)request
     completionHandler:(void (^)(AWSLambdaListAliasesResponse *response, NSError *error))completionHandler {
    [[self listAliases:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaListAliasesResponse *> * _Nonnull task) {
        AWSLambdaListAliasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaListEventSourceMappingsResponse *> *)listEventSourceMappings:(AWSLambdaListEventSourceMappingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-03-31/event-source-mappings/"
                  targetPrefix:@""
                 operationName:@"ListEventSourceMappings"
                   outputClass:[AWSLambdaListEventSourceMappingsResponse class]];
}

- (void)listEventSourceMappings:(AWSLambdaListEventSourceMappingsRequest *)request
     completionHandler:(void (^)(AWSLambdaListEventSourceMappingsResponse *response, NSError *error))completionHandler {
    [[self listEventSourceMappings:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaListEventSourceMappingsResponse *> * _Nonnull task) {
        AWSLambdaListEventSourceMappingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaListFunctionEventInvokeConfigsResponse *> *)listFunctionEventInvokeConfigs:(AWSLambdaListFunctionEventInvokeConfigsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-09-25/functions/{FunctionName}/event-invoke-config/list"
                  targetPrefix:@""
                 operationName:@"ListFunctionEventInvokeConfigs"
                   outputClass:[AWSLambdaListFunctionEventInvokeConfigsResponse class]];
}

- (void)listFunctionEventInvokeConfigs:(AWSLambdaListFunctionEventInvokeConfigsRequest *)request
     completionHandler:(void (^)(AWSLambdaListFunctionEventInvokeConfigsResponse *response, NSError *error))completionHandler {
    [[self listFunctionEventInvokeConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaListFunctionEventInvokeConfigsResponse *> * _Nonnull task) {
        AWSLambdaListFunctionEventInvokeConfigsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaListFunctionsResponse *> *)listFunctions:(AWSLambdaListFunctionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-03-31/functions/"
                  targetPrefix:@""
                 operationName:@"ListFunctions"
                   outputClass:[AWSLambdaListFunctionsResponse class]];
}

- (void)listFunctions:(AWSLambdaListFunctionsRequest *)request
     completionHandler:(void (^)(AWSLambdaListFunctionsResponse *response, NSError *error))completionHandler {
    [[self listFunctions:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaListFunctionsResponse *> * _Nonnull task) {
        AWSLambdaListFunctionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaListLayerVersionsResponse *> *)listLayerVersions:(AWSLambdaListLayerVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2018-10-31/layers/{LayerName}/versions"
                  targetPrefix:@""
                 operationName:@"ListLayerVersions"
                   outputClass:[AWSLambdaListLayerVersionsResponse class]];
}

- (void)listLayerVersions:(AWSLambdaListLayerVersionsRequest *)request
     completionHandler:(void (^)(AWSLambdaListLayerVersionsResponse *response, NSError *error))completionHandler {
    [[self listLayerVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaListLayerVersionsResponse *> * _Nonnull task) {
        AWSLambdaListLayerVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaListLayersResponse *> *)listLayers:(AWSLambdaListLayersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2018-10-31/layers"
                  targetPrefix:@""
                 operationName:@"ListLayers"
                   outputClass:[AWSLambdaListLayersResponse class]];
}

- (void)listLayers:(AWSLambdaListLayersRequest *)request
     completionHandler:(void (^)(AWSLambdaListLayersResponse *response, NSError *error))completionHandler {
    [[self listLayers:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaListLayersResponse *> * _Nonnull task) {
        AWSLambdaListLayersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaListProvisionedConcurrencyConfigsResponse *> *)listProvisionedConcurrencyConfigs:(AWSLambdaListProvisionedConcurrencyConfigsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2019-09-30/functions/{FunctionName}/provisioned-concurrency?List=ALL"
                  targetPrefix:@""
                 operationName:@"ListProvisionedConcurrencyConfigs"
                   outputClass:[AWSLambdaListProvisionedConcurrencyConfigsResponse class]];
}

- (void)listProvisionedConcurrencyConfigs:(AWSLambdaListProvisionedConcurrencyConfigsRequest *)request
     completionHandler:(void (^)(AWSLambdaListProvisionedConcurrencyConfigsResponse *response, NSError *error))completionHandler {
    [[self listProvisionedConcurrencyConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaListProvisionedConcurrencyConfigsResponse *> * _Nonnull task) {
        AWSLambdaListProvisionedConcurrencyConfigsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaListTagsResponse *> *)listTags:(AWSLambdaListTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-03-31/tags/{ARN}"
                  targetPrefix:@""
                 operationName:@"ListTags"
                   outputClass:[AWSLambdaListTagsResponse class]];
}

- (void)listTags:(AWSLambdaListTagsRequest *)request
     completionHandler:(void (^)(AWSLambdaListTagsResponse *response, NSError *error))completionHandler {
    [[self listTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaListTagsResponse *> * _Nonnull task) {
        AWSLambdaListTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaListVersionsByFunctionResponse *> *)listVersionsByFunction:(AWSLambdaListVersionsByFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-03-31/functions/{FunctionName}/versions"
                  targetPrefix:@""
                 operationName:@"ListVersionsByFunction"
                   outputClass:[AWSLambdaListVersionsByFunctionResponse class]];
}

- (void)listVersionsByFunction:(AWSLambdaListVersionsByFunctionRequest *)request
     completionHandler:(void (^)(AWSLambdaListVersionsByFunctionResponse *response, NSError *error))completionHandler {
    [[self listVersionsByFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaListVersionsByFunctionResponse *> * _Nonnull task) {
        AWSLambdaListVersionsByFunctionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaPublishLayerVersionResponse *> *)publishLayerVersion:(AWSLambdaPublishLayerVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2018-10-31/layers/{LayerName}/versions"
                  targetPrefix:@""
                 operationName:@"PublishLayerVersion"
                   outputClass:[AWSLambdaPublishLayerVersionResponse class]];
}

- (void)publishLayerVersion:(AWSLambdaPublishLayerVersionRequest *)request
     completionHandler:(void (^)(AWSLambdaPublishLayerVersionResponse *response, NSError *error))completionHandler {
    [[self publishLayerVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaPublishLayerVersionResponse *> * _Nonnull task) {
        AWSLambdaPublishLayerVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaFunctionConfiguration *> *)publishVersion:(AWSLambdaPublishVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-03-31/functions/{FunctionName}/versions"
                  targetPrefix:@""
                 operationName:@"PublishVersion"
                   outputClass:[AWSLambdaFunctionConfiguration class]];
}

- (void)publishVersion:(AWSLambdaPublishVersionRequest *)request
     completionHandler:(void (^)(AWSLambdaFunctionConfiguration *response, NSError *error))completionHandler {
    [[self publishVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaFunctionConfiguration *> * _Nonnull task) {
        AWSLambdaFunctionConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaConcurrency *> *)putFunctionConcurrency:(AWSLambdaPutFunctionConcurrencyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2017-10-31/functions/{FunctionName}/concurrency"
                  targetPrefix:@""
                 operationName:@"PutFunctionConcurrency"
                   outputClass:[AWSLambdaConcurrency class]];
}

- (void)putFunctionConcurrency:(AWSLambdaPutFunctionConcurrencyRequest *)request
     completionHandler:(void (^)(AWSLambdaConcurrency *response, NSError *error))completionHandler {
    [[self putFunctionConcurrency:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaConcurrency *> * _Nonnull task) {
        AWSLambdaConcurrency *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaFunctionEventInvokeConfig *> *)putFunctionEventInvokeConfig:(AWSLambdaPutFunctionEventInvokeConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2019-09-25/functions/{FunctionName}/event-invoke-config"
                  targetPrefix:@""
                 operationName:@"PutFunctionEventInvokeConfig"
                   outputClass:[AWSLambdaFunctionEventInvokeConfig class]];
}

- (void)putFunctionEventInvokeConfig:(AWSLambdaPutFunctionEventInvokeConfigRequest *)request
     completionHandler:(void (^)(AWSLambdaFunctionEventInvokeConfig *response, NSError *error))completionHandler {
    [[self putFunctionEventInvokeConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaFunctionEventInvokeConfig *> * _Nonnull task) {
        AWSLambdaFunctionEventInvokeConfig *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaPutProvisionedConcurrencyConfigResponse *> *)putProvisionedConcurrencyConfig:(AWSLambdaPutProvisionedConcurrencyConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2019-09-30/functions/{FunctionName}/provisioned-concurrency"
                  targetPrefix:@""
                 operationName:@"PutProvisionedConcurrencyConfig"
                   outputClass:[AWSLambdaPutProvisionedConcurrencyConfigResponse class]];
}

- (void)putProvisionedConcurrencyConfig:(AWSLambdaPutProvisionedConcurrencyConfigRequest *)request
     completionHandler:(void (^)(AWSLambdaPutProvisionedConcurrencyConfigResponse *response, NSError *error))completionHandler {
    [[self putProvisionedConcurrencyConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaPutProvisionedConcurrencyConfigResponse *> * _Nonnull task) {
        AWSLambdaPutProvisionedConcurrencyConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)removeLayerVersionPermission:(AWSLambdaRemoveLayerVersionPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy/{StatementId}"
                  targetPrefix:@""
                 operationName:@"RemoveLayerVersionPermission"
                   outputClass:nil];
}

- (void)removeLayerVersionPermission:(AWSLambdaRemoveLayerVersionPermissionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeLayerVersionPermission:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)removePermission:(AWSLambdaRemovePermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-03-31/functions/{FunctionName}/policy/{StatementId}"
                  targetPrefix:@""
                 operationName:@"RemovePermission"
                   outputClass:nil];
}

- (void)removePermission:(AWSLambdaRemovePermissionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removePermission:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSLambdaTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-03-31/tags/{ARN}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSLambdaTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSLambdaUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-03-31/tags/{ARN}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSLambdaUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaAliasConfiguration *> *)updateAlias:(AWSLambdaUpdateAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2015-03-31/functions/{FunctionName}/aliases/{Name}"
                  targetPrefix:@""
                 operationName:@"UpdateAlias"
                   outputClass:[AWSLambdaAliasConfiguration class]];
}

- (void)updateAlias:(AWSLambdaUpdateAliasRequest *)request
     completionHandler:(void (^)(AWSLambdaAliasConfiguration *response, NSError *error))completionHandler {
    [[self updateAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaAliasConfiguration *> * _Nonnull task) {
        AWSLambdaAliasConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaEventSourceMappingConfiguration *> *)updateEventSourceMapping:(AWSLambdaUpdateEventSourceMappingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2015-03-31/event-source-mappings/{UUID}"
                  targetPrefix:@""
                 operationName:@"UpdateEventSourceMapping"
                   outputClass:[AWSLambdaEventSourceMappingConfiguration class]];
}

- (void)updateEventSourceMapping:(AWSLambdaUpdateEventSourceMappingRequest *)request
     completionHandler:(void (^)(AWSLambdaEventSourceMappingConfiguration *response, NSError *error))completionHandler {
    [[self updateEventSourceMapping:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaEventSourceMappingConfiguration *> * _Nonnull task) {
        AWSLambdaEventSourceMappingConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaFunctionConfiguration *> *)updateFunctionCode:(AWSLambdaUpdateFunctionCodeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2015-03-31/functions/{FunctionName}/code"
                  targetPrefix:@""
                 operationName:@"UpdateFunctionCode"
                   outputClass:[AWSLambdaFunctionConfiguration class]];
}

- (void)updateFunctionCode:(AWSLambdaUpdateFunctionCodeRequest *)request
     completionHandler:(void (^)(AWSLambdaFunctionConfiguration *response, NSError *error))completionHandler {
    [[self updateFunctionCode:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaFunctionConfiguration *> * _Nonnull task) {
        AWSLambdaFunctionConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaFunctionConfiguration *> *)updateFunctionConfiguration:(AWSLambdaUpdateFunctionConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2015-03-31/functions/{FunctionName}/configuration"
                  targetPrefix:@""
                 operationName:@"UpdateFunctionConfiguration"
                   outputClass:[AWSLambdaFunctionConfiguration class]];
}

- (void)updateFunctionConfiguration:(AWSLambdaUpdateFunctionConfigurationRequest *)request
     completionHandler:(void (^)(AWSLambdaFunctionConfiguration *response, NSError *error))completionHandler {
    [[self updateFunctionConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaFunctionConfiguration *> * _Nonnull task) {
        AWSLambdaFunctionConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLambdaFunctionEventInvokeConfig *> *)updateFunctionEventInvokeConfig:(AWSLambdaUpdateFunctionEventInvokeConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2019-09-25/functions/{FunctionName}/event-invoke-config"
                  targetPrefix:@""
                 operationName:@"UpdateFunctionEventInvokeConfig"
                   outputClass:[AWSLambdaFunctionEventInvokeConfig class]];
}

- (void)updateFunctionEventInvokeConfig:(AWSLambdaUpdateFunctionEventInvokeConfigRequest *)request
     completionHandler:(void (^)(AWSLambdaFunctionEventInvokeConfig *response, NSError *error))completionHandler {
    [[self updateFunctionEventInvokeConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSLambdaFunctionEventInvokeConfig *> * _Nonnull task) {
        AWSLambdaFunctionEventInvokeConfig *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
