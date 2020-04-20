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

#import "AWSapigatewayService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSapigatewayResources.h"

static NSString *const AWSInfoapigateway = @"apigateway";
NSString *const AWSapigatewaySDKVersion = @"2.13.2";


@interface AWSapigatewayResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSapigatewayResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSapigatewayErrorAccessDenied),
                            @"BadRequestException" : @(AWSapigatewayErrorBadRequest),
                            @"ConflictException" : @(AWSapigatewayErrorConflict),
                            @"NotFoundException" : @(AWSapigatewayErrorNotFound),
                            @"TooManyRequestsException" : @(AWSapigatewayErrorTooManyRequests),
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
                    *error = [NSError errorWithDomain:AWSapigatewayErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSapigatewayErrorDomain
                                                 code:AWSapigatewayErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSapigatewayErrorDomain
                                     code:AWSapigatewayErrorUnknown
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

@interface AWSapigatewayRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSapigatewayRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSapigateway()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSapigateway

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSapigatewaySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSapigateway versions need to match. Check your SDK installation. AWSCore: %@ AWSapigateway: %@", AWSiOSSDKVersion, AWSapigatewaySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultapigateway {
    static AWSapigateway *_defaultapigateway = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoapigateway];
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
        _defaultapigateway = [[AWSapigateway alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultapigateway;
}

+ (void)registerapigatewayWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSapigateway alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)apigatewayForKey:(NSString *)key {
    @synchronized(self) {
        AWSapigateway *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoapigateway
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSapigateway registerapigatewayWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeapigatewayForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultapigateway` or `+ apigatewayForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceapigateway
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceapigateway];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSapigatewayRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSapigatewayResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSapigatewayResponseSerializer alloc] initWithJSONDefinition:[[AWSapigatewayResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSapigatewayCreateApiResponse *> *)createApi:(AWSapigatewayCreateApiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/apis"
                  targetPrefix:@""
                 operationName:@"CreateApi"
                   outputClass:[AWSapigatewayCreateApiResponse class]];
}

- (void)createApi:(AWSapigatewayCreateApiRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateApiResponse *response, NSError *error))completionHandler {
    [[self createApi:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateApiResponse *> * _Nonnull task) {
        AWSapigatewayCreateApiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateApiMappingResponse *> *)createApiMapping:(AWSapigatewayCreateApiMappingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/domainnames/{domainName}/apimappings"
                  targetPrefix:@""
                 operationName:@"CreateApiMapping"
                   outputClass:[AWSapigatewayCreateApiMappingResponse class]];
}

- (void)createApiMapping:(AWSapigatewayCreateApiMappingRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateApiMappingResponse *response, NSError *error))completionHandler {
    [[self createApiMapping:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateApiMappingResponse *> * _Nonnull task) {
        AWSapigatewayCreateApiMappingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateAuthorizerResponse *> *)createAuthorizer:(AWSapigatewayCreateAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/apis/{apiId}/authorizers"
                  targetPrefix:@""
                 operationName:@"CreateAuthorizer"
                   outputClass:[AWSapigatewayCreateAuthorizerResponse class]];
}

- (void)createAuthorizer:(AWSapigatewayCreateAuthorizerRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateAuthorizerResponse *response, NSError *error))completionHandler {
    [[self createAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateAuthorizerResponse *> * _Nonnull task) {
        AWSapigatewayCreateAuthorizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateDeploymentResponse *> *)createDeployment:(AWSapigatewayCreateDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/apis/{apiId}/deployments"
                  targetPrefix:@""
                 operationName:@"CreateDeployment"
                   outputClass:[AWSapigatewayCreateDeploymentResponse class]];
}

- (void)createDeployment:(AWSapigatewayCreateDeploymentRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateDeploymentResponse *response, NSError *error))completionHandler {
    [[self createDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateDeploymentResponse *> * _Nonnull task) {
        AWSapigatewayCreateDeploymentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateDomainNameResponse *> *)createDomainName:(AWSapigatewayCreateDomainNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/domainnames"
                  targetPrefix:@""
                 operationName:@"CreateDomainName"
                   outputClass:[AWSapigatewayCreateDomainNameResponse class]];
}

- (void)createDomainName:(AWSapigatewayCreateDomainNameRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateDomainNameResponse *response, NSError *error))completionHandler {
    [[self createDomainName:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateDomainNameResponse *> * _Nonnull task) {
        AWSapigatewayCreateDomainNameResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateIntegrationResult *> *)createIntegration:(AWSapigatewayCreateIntegrationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/apis/{apiId}/integrations"
                  targetPrefix:@""
                 operationName:@"CreateIntegration"
                   outputClass:[AWSapigatewayCreateIntegrationResult class]];
}

- (void)createIntegration:(AWSapigatewayCreateIntegrationRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateIntegrationResult *response, NSError *error))completionHandler {
    [[self createIntegration:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateIntegrationResult *> * _Nonnull task) {
        AWSapigatewayCreateIntegrationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateIntegrationResponseResponse *> *)createIntegrationResponse:(AWSapigatewayCreateIntegrationResponseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses"
                  targetPrefix:@""
                 operationName:@"CreateIntegrationResponse"
                   outputClass:[AWSapigatewayCreateIntegrationResponseResponse class]];
}

- (void)createIntegrationResponse:(AWSapigatewayCreateIntegrationResponseRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateIntegrationResponseResponse *response, NSError *error))completionHandler {
    [[self createIntegrationResponse:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateIntegrationResponseResponse *> * _Nonnull task) {
        AWSapigatewayCreateIntegrationResponseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateModelResponse *> *)createModel:(AWSapigatewayCreateModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/apis/{apiId}/models"
                  targetPrefix:@""
                 operationName:@"CreateModel"
                   outputClass:[AWSapigatewayCreateModelResponse class]];
}

- (void)createModel:(AWSapigatewayCreateModelRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateModelResponse *response, NSError *error))completionHandler {
    [[self createModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateModelResponse *> * _Nonnull task) {
        AWSapigatewayCreateModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateRouteResult *> *)createRoute:(AWSapigatewayCreateRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/apis/{apiId}/routes"
                  targetPrefix:@""
                 operationName:@"CreateRoute"
                   outputClass:[AWSapigatewayCreateRouteResult class]];
}

- (void)createRoute:(AWSapigatewayCreateRouteRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateRouteResult *response, NSError *error))completionHandler {
    [[self createRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateRouteResult *> * _Nonnull task) {
        AWSapigatewayCreateRouteResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateRouteResponseResponse *> *)createRouteResponse:(AWSapigatewayCreateRouteResponseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/apis/{apiId}/routes/{routeId}/routeresponses"
                  targetPrefix:@""
                 operationName:@"CreateRouteResponse"
                   outputClass:[AWSapigatewayCreateRouteResponseResponse class]];
}

- (void)createRouteResponse:(AWSapigatewayCreateRouteResponseRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateRouteResponseResponse *response, NSError *error))completionHandler {
    [[self createRouteResponse:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateRouteResponseResponse *> * _Nonnull task) {
        AWSapigatewayCreateRouteResponseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateStageResponse *> *)createStage:(AWSapigatewayCreateStageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/apis/{apiId}/stages"
                  targetPrefix:@""
                 operationName:@"CreateStage"
                   outputClass:[AWSapigatewayCreateStageResponse class]];
}

- (void)createStage:(AWSapigatewayCreateStageRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateStageResponse *response, NSError *error))completionHandler {
    [[self createStage:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateStageResponse *> * _Nonnull task) {
        AWSapigatewayCreateStageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayCreateVpcLinkResponse *> *)createVpcLink:(AWSapigatewayCreateVpcLinkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/vpclinks"
                  targetPrefix:@""
                 operationName:@"CreateVpcLink"
                   outputClass:[AWSapigatewayCreateVpcLinkResponse class]];
}

- (void)createVpcLink:(AWSapigatewayCreateVpcLinkRequest *)request
     completionHandler:(void (^)(AWSapigatewayCreateVpcLinkResponse *response, NSError *error))completionHandler {
    [[self createVpcLink:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayCreateVpcLinkResponse *> * _Nonnull task) {
        AWSapigatewayCreateVpcLinkResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAccessLogSettings:(AWSapigatewayDeleteAccessLogSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/stages/{stageName}/accesslogsettings"
                  targetPrefix:@""
                 operationName:@"DeleteAccessLogSettings"
                   outputClass:nil];
}

- (void)deleteAccessLogSettings:(AWSapigatewayDeleteAccessLogSettingsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAccessLogSettings:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteApi:(AWSapigatewayDeleteApiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}"
                  targetPrefix:@""
                 operationName:@"DeleteApi"
                   outputClass:nil];
}

- (void)deleteApi:(AWSapigatewayDeleteApiRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteApi:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteApiMapping:(AWSapigatewayDeleteApiMappingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/domainnames/{domainName}/apimappings/{apiMappingId}"
                  targetPrefix:@""
                 operationName:@"DeleteApiMapping"
                   outputClass:nil];
}

- (void)deleteApiMapping:(AWSapigatewayDeleteApiMappingRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteApiMapping:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAuthorizer:(AWSapigatewayDeleteAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/authorizers/{authorizerId}"
                  targetPrefix:@""
                 operationName:@"DeleteAuthorizer"
                   outputClass:nil];
}

- (void)deleteAuthorizer:(AWSapigatewayDeleteAuthorizerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCorsConfiguration:(AWSapigatewayDeleteCorsConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/cors"
                  targetPrefix:@""
                 operationName:@"DeleteCorsConfiguration"
                   outputClass:nil];
}

- (void)deleteCorsConfiguration:(AWSapigatewayDeleteCorsConfigurationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCorsConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDeployment:(AWSapigatewayDeleteDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/deployments/{deploymentId}"
                  targetPrefix:@""
                 operationName:@"DeleteDeployment"
                   outputClass:nil];
}

- (void)deleteDeployment:(AWSapigatewayDeleteDeploymentRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDeployment:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDomainName:(AWSapigatewayDeleteDomainNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/domainnames/{domainName}"
                  targetPrefix:@""
                 operationName:@"DeleteDomainName"
                   outputClass:nil];
}

- (void)deleteDomainName:(AWSapigatewayDeleteDomainNameRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDomainName:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteIntegration:(AWSapigatewayDeleteIntegrationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/integrations/{integrationId}"
                  targetPrefix:@""
                 operationName:@"DeleteIntegration"
                   outputClass:nil];
}

- (void)deleteIntegration:(AWSapigatewayDeleteIntegrationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteIntegration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteIntegrationResponse:(AWSapigatewayDeleteIntegrationResponseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses/{integrationResponseId}"
                  targetPrefix:@""
                 operationName:@"DeleteIntegrationResponse"
                   outputClass:nil];
}

- (void)deleteIntegrationResponse:(AWSapigatewayDeleteIntegrationResponseRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteIntegrationResponse:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteModel:(AWSapigatewayDeleteModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/models/{modelId}"
                  targetPrefix:@""
                 operationName:@"DeleteModel"
                   outputClass:nil];
}

- (void)deleteModel:(AWSapigatewayDeleteModelRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteModel:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRoute:(AWSapigatewayDeleteRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/routes/{routeId}"
                  targetPrefix:@""
                 operationName:@"DeleteRoute"
                   outputClass:nil];
}

- (void)deleteRoute:(AWSapigatewayDeleteRouteRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRoute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRouteRequestParameter:(AWSapigatewayDeleteRouteRequestParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/routes/{routeId}/requestparameters/{requestParameterKey}"
                  targetPrefix:@""
                 operationName:@"DeleteRouteRequestParameter"
                   outputClass:nil];
}

- (void)deleteRouteRequestParameter:(AWSapigatewayDeleteRouteRequestParameterRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRouteRequestParameter:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRouteResponse:(AWSapigatewayDeleteRouteResponseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/routes/{routeId}/routeresponses/{routeResponseId}"
                  targetPrefix:@""
                 operationName:@"DeleteRouteResponse"
                   outputClass:nil];
}

- (void)deleteRouteResponse:(AWSapigatewayDeleteRouteResponseRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRouteResponse:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRouteSettings:(AWSapigatewayDeleteRouteSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/stages/{stageName}/routesettings/{routeKey}"
                  targetPrefix:@""
                 operationName:@"DeleteRouteSettings"
                   outputClass:nil];
}

- (void)deleteRouteSettings:(AWSapigatewayDeleteRouteSettingsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRouteSettings:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteStage:(AWSapigatewayDeleteStageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/apis/{apiId}/stages/{stageName}"
                  targetPrefix:@""
                 operationName:@"DeleteStage"
                   outputClass:nil];
}

- (void)deleteStage:(AWSapigatewayDeleteStageRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteStage:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayDeleteVpcLinkResponse *> *)deleteVpcLink:(AWSapigatewayDeleteVpcLinkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/vpclinks/{vpcLinkId}"
                  targetPrefix:@""
                 operationName:@"DeleteVpcLink"
                   outputClass:[AWSapigatewayDeleteVpcLinkResponse class]];
}

- (void)deleteVpcLink:(AWSapigatewayDeleteVpcLinkRequest *)request
     completionHandler:(void (^)(AWSapigatewayDeleteVpcLinkResponse *response, NSError *error))completionHandler {
    [[self deleteVpcLink:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayDeleteVpcLinkResponse *> * _Nonnull task) {
        AWSapigatewayDeleteVpcLinkResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayExportApiResponse *> *)exportApi:(AWSapigatewayExportApiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/exports/{specification}"
                  targetPrefix:@""
                 operationName:@"ExportApi"
                   outputClass:[AWSapigatewayExportApiResponse class]];
}

- (void)exportApi:(AWSapigatewayExportApiRequest *)request
     completionHandler:(void (^)(AWSapigatewayExportApiResponse *response, NSError *error))completionHandler {
    [[self exportApi:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayExportApiResponse *> * _Nonnull task) {
        AWSapigatewayExportApiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetApiResponse *> *)getApi:(AWSapigatewayGetApiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}"
                  targetPrefix:@""
                 operationName:@"GetApi"
                   outputClass:[AWSapigatewayGetApiResponse class]];
}

- (void)getApi:(AWSapigatewayGetApiRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetApiResponse *response, NSError *error))completionHandler {
    [[self getApi:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetApiResponse *> * _Nonnull task) {
        AWSapigatewayGetApiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetApiMappingResponse *> *)getApiMapping:(AWSapigatewayGetApiMappingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/domainnames/{domainName}/apimappings/{apiMappingId}"
                  targetPrefix:@""
                 operationName:@"GetApiMapping"
                   outputClass:[AWSapigatewayGetApiMappingResponse class]];
}

- (void)getApiMapping:(AWSapigatewayGetApiMappingRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetApiMappingResponse *response, NSError *error))completionHandler {
    [[self getApiMapping:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetApiMappingResponse *> * _Nonnull task) {
        AWSapigatewayGetApiMappingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetApiMappingsResponse *> *)getApiMappings:(AWSapigatewayGetApiMappingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/domainnames/{domainName}/apimappings"
                  targetPrefix:@""
                 operationName:@"GetApiMappings"
                   outputClass:[AWSapigatewayGetApiMappingsResponse class]];
}

- (void)getApiMappings:(AWSapigatewayGetApiMappingsRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetApiMappingsResponse *response, NSError *error))completionHandler {
    [[self getApiMappings:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetApiMappingsResponse *> * _Nonnull task) {
        AWSapigatewayGetApiMappingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetApisResponse *> *)getApis:(AWSapigatewayGetApisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis"
                  targetPrefix:@""
                 operationName:@"GetApis"
                   outputClass:[AWSapigatewayGetApisResponse class]];
}

- (void)getApis:(AWSapigatewayGetApisRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetApisResponse *response, NSError *error))completionHandler {
    [[self getApis:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetApisResponse *> * _Nonnull task) {
        AWSapigatewayGetApisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetAuthorizerResponse *> *)getAuthorizer:(AWSapigatewayGetAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/authorizers/{authorizerId}"
                  targetPrefix:@""
                 operationName:@"GetAuthorizer"
                   outputClass:[AWSapigatewayGetAuthorizerResponse class]];
}

- (void)getAuthorizer:(AWSapigatewayGetAuthorizerRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetAuthorizerResponse *response, NSError *error))completionHandler {
    [[self getAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetAuthorizerResponse *> * _Nonnull task) {
        AWSapigatewayGetAuthorizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetAuthorizersResponse *> *)getAuthorizers:(AWSapigatewayGetAuthorizersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/authorizers"
                  targetPrefix:@""
                 operationName:@"GetAuthorizers"
                   outputClass:[AWSapigatewayGetAuthorizersResponse class]];
}

- (void)getAuthorizers:(AWSapigatewayGetAuthorizersRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetAuthorizersResponse *response, NSError *error))completionHandler {
    [[self getAuthorizers:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetAuthorizersResponse *> * _Nonnull task) {
        AWSapigatewayGetAuthorizersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetDeploymentResponse *> *)getDeployment:(AWSapigatewayGetDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/deployments/{deploymentId}"
                  targetPrefix:@""
                 operationName:@"GetDeployment"
                   outputClass:[AWSapigatewayGetDeploymentResponse class]];
}

- (void)getDeployment:(AWSapigatewayGetDeploymentRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetDeploymentResponse *response, NSError *error))completionHandler {
    [[self getDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetDeploymentResponse *> * _Nonnull task) {
        AWSapigatewayGetDeploymentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetDeploymentsResponse *> *)getDeployments:(AWSapigatewayGetDeploymentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/deployments"
                  targetPrefix:@""
                 operationName:@"GetDeployments"
                   outputClass:[AWSapigatewayGetDeploymentsResponse class]];
}

- (void)getDeployments:(AWSapigatewayGetDeploymentsRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetDeploymentsResponse *response, NSError *error))completionHandler {
    [[self getDeployments:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetDeploymentsResponse *> * _Nonnull task) {
        AWSapigatewayGetDeploymentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetDomainNameResponse *> *)getDomainName:(AWSapigatewayGetDomainNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/domainnames/{domainName}"
                  targetPrefix:@""
                 operationName:@"GetDomainName"
                   outputClass:[AWSapigatewayGetDomainNameResponse class]];
}

- (void)getDomainName:(AWSapigatewayGetDomainNameRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetDomainNameResponse *response, NSError *error))completionHandler {
    [[self getDomainName:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetDomainNameResponse *> * _Nonnull task) {
        AWSapigatewayGetDomainNameResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetDomainNamesResponse *> *)getDomainNames:(AWSapigatewayGetDomainNamesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/domainnames"
                  targetPrefix:@""
                 operationName:@"GetDomainNames"
                   outputClass:[AWSapigatewayGetDomainNamesResponse class]];
}

- (void)getDomainNames:(AWSapigatewayGetDomainNamesRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetDomainNamesResponse *response, NSError *error))completionHandler {
    [[self getDomainNames:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetDomainNamesResponse *> * _Nonnull task) {
        AWSapigatewayGetDomainNamesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetIntegrationResult *> *)getIntegration:(AWSapigatewayGetIntegrationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/integrations/{integrationId}"
                  targetPrefix:@""
                 operationName:@"GetIntegration"
                   outputClass:[AWSapigatewayGetIntegrationResult class]];
}

- (void)getIntegration:(AWSapigatewayGetIntegrationRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetIntegrationResult *response, NSError *error))completionHandler {
    [[self getIntegration:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetIntegrationResult *> * _Nonnull task) {
        AWSapigatewayGetIntegrationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetIntegrationResponseResponse *> *)getIntegrationResponse:(AWSapigatewayGetIntegrationResponseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses/{integrationResponseId}"
                  targetPrefix:@""
                 operationName:@"GetIntegrationResponse"
                   outputClass:[AWSapigatewayGetIntegrationResponseResponse class]];
}

- (void)getIntegrationResponse:(AWSapigatewayGetIntegrationResponseRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetIntegrationResponseResponse *response, NSError *error))completionHandler {
    [[self getIntegrationResponse:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetIntegrationResponseResponse *> * _Nonnull task) {
        AWSapigatewayGetIntegrationResponseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetIntegrationResponsesResponse *> *)getIntegrationResponses:(AWSapigatewayGetIntegrationResponsesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses"
                  targetPrefix:@""
                 operationName:@"GetIntegrationResponses"
                   outputClass:[AWSapigatewayGetIntegrationResponsesResponse class]];
}

- (void)getIntegrationResponses:(AWSapigatewayGetIntegrationResponsesRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetIntegrationResponsesResponse *response, NSError *error))completionHandler {
    [[self getIntegrationResponses:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetIntegrationResponsesResponse *> * _Nonnull task) {
        AWSapigatewayGetIntegrationResponsesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetIntegrationsResponse *> *)getIntegrations:(AWSapigatewayGetIntegrationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/integrations"
                  targetPrefix:@""
                 operationName:@"GetIntegrations"
                   outputClass:[AWSapigatewayGetIntegrationsResponse class]];
}

- (void)getIntegrations:(AWSapigatewayGetIntegrationsRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetIntegrationsResponse *response, NSError *error))completionHandler {
    [[self getIntegrations:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetIntegrationsResponse *> * _Nonnull task) {
        AWSapigatewayGetIntegrationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetModelResponse *> *)getModel:(AWSapigatewayGetModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/models/{modelId}"
                  targetPrefix:@""
                 operationName:@"GetModel"
                   outputClass:[AWSapigatewayGetModelResponse class]];
}

- (void)getModel:(AWSapigatewayGetModelRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetModelResponse *response, NSError *error))completionHandler {
    [[self getModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetModelResponse *> * _Nonnull task) {
        AWSapigatewayGetModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetModelTemplateResponse *> *)getModelTemplate:(AWSapigatewayGetModelTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/models/{modelId}/template"
                  targetPrefix:@""
                 operationName:@"GetModelTemplate"
                   outputClass:[AWSapigatewayGetModelTemplateResponse class]];
}

- (void)getModelTemplate:(AWSapigatewayGetModelTemplateRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetModelTemplateResponse *response, NSError *error))completionHandler {
    [[self getModelTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetModelTemplateResponse *> * _Nonnull task) {
        AWSapigatewayGetModelTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetModelsResponse *> *)getModels:(AWSapigatewayGetModelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/models"
                  targetPrefix:@""
                 operationName:@"GetModels"
                   outputClass:[AWSapigatewayGetModelsResponse class]];
}

- (void)getModels:(AWSapigatewayGetModelsRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetModelsResponse *response, NSError *error))completionHandler {
    [[self getModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetModelsResponse *> * _Nonnull task) {
        AWSapigatewayGetModelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetRouteResult *> *)getRoute:(AWSapigatewayGetRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/routes/{routeId}"
                  targetPrefix:@""
                 operationName:@"GetRoute"
                   outputClass:[AWSapigatewayGetRouteResult class]];
}

- (void)getRoute:(AWSapigatewayGetRouteRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetRouteResult *response, NSError *error))completionHandler {
    [[self getRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetRouteResult *> * _Nonnull task) {
        AWSapigatewayGetRouteResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetRouteResponseResponse *> *)getRouteResponse:(AWSapigatewayGetRouteResponseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/routes/{routeId}/routeresponses/{routeResponseId}"
                  targetPrefix:@""
                 operationName:@"GetRouteResponse"
                   outputClass:[AWSapigatewayGetRouteResponseResponse class]];
}

- (void)getRouteResponse:(AWSapigatewayGetRouteResponseRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetRouteResponseResponse *response, NSError *error))completionHandler {
    [[self getRouteResponse:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetRouteResponseResponse *> * _Nonnull task) {
        AWSapigatewayGetRouteResponseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetRouteResponsesResponse *> *)getRouteResponses:(AWSapigatewayGetRouteResponsesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/routes/{routeId}/routeresponses"
                  targetPrefix:@""
                 operationName:@"GetRouteResponses"
                   outputClass:[AWSapigatewayGetRouteResponsesResponse class]];
}

- (void)getRouteResponses:(AWSapigatewayGetRouteResponsesRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetRouteResponsesResponse *response, NSError *error))completionHandler {
    [[self getRouteResponses:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetRouteResponsesResponse *> * _Nonnull task) {
        AWSapigatewayGetRouteResponsesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetRoutesResponse *> *)getRoutes:(AWSapigatewayGetRoutesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/routes"
                  targetPrefix:@""
                 operationName:@"GetRoutes"
                   outputClass:[AWSapigatewayGetRoutesResponse class]];
}

- (void)getRoutes:(AWSapigatewayGetRoutesRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetRoutesResponse *response, NSError *error))completionHandler {
    [[self getRoutes:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetRoutesResponse *> * _Nonnull task) {
        AWSapigatewayGetRoutesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetStageResponse *> *)getStage:(AWSapigatewayGetStageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/stages/{stageName}"
                  targetPrefix:@""
                 operationName:@"GetStage"
                   outputClass:[AWSapigatewayGetStageResponse class]];
}

- (void)getStage:(AWSapigatewayGetStageRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetStageResponse *response, NSError *error))completionHandler {
    [[self getStage:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetStageResponse *> * _Nonnull task) {
        AWSapigatewayGetStageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetStagesResponse *> *)getStages:(AWSapigatewayGetStagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/apis/{apiId}/stages"
                  targetPrefix:@""
                 operationName:@"GetStages"
                   outputClass:[AWSapigatewayGetStagesResponse class]];
}

- (void)getStages:(AWSapigatewayGetStagesRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetStagesResponse *response, NSError *error))completionHandler {
    [[self getStages:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetStagesResponse *> * _Nonnull task) {
        AWSapigatewayGetStagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetTagsResponse *> *)getTags:(AWSapigatewayGetTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"GetTags"
                   outputClass:[AWSapigatewayGetTagsResponse class]];
}

- (void)getTags:(AWSapigatewayGetTagsRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetTagsResponse *response, NSError *error))completionHandler {
    [[self getTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetTagsResponse *> * _Nonnull task) {
        AWSapigatewayGetTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetVpcLinkResponse *> *)getVpcLink:(AWSapigatewayGetVpcLinkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/vpclinks/{vpcLinkId}"
                  targetPrefix:@""
                 operationName:@"GetVpcLink"
                   outputClass:[AWSapigatewayGetVpcLinkResponse class]];
}

- (void)getVpcLink:(AWSapigatewayGetVpcLinkRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetVpcLinkResponse *response, NSError *error))completionHandler {
    [[self getVpcLink:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetVpcLinkResponse *> * _Nonnull task) {
        AWSapigatewayGetVpcLinkResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayGetVpcLinksResponse *> *)getVpcLinks:(AWSapigatewayGetVpcLinksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/vpclinks"
                  targetPrefix:@""
                 operationName:@"GetVpcLinks"
                   outputClass:[AWSapigatewayGetVpcLinksResponse class]];
}

- (void)getVpcLinks:(AWSapigatewayGetVpcLinksRequest *)request
     completionHandler:(void (^)(AWSapigatewayGetVpcLinksResponse *response, NSError *error))completionHandler {
    [[self getVpcLinks:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayGetVpcLinksResponse *> * _Nonnull task) {
        AWSapigatewayGetVpcLinksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayImportApiResponse *> *)importApi:(AWSapigatewayImportApiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/apis"
                  targetPrefix:@""
                 operationName:@"ImportApi"
                   outputClass:[AWSapigatewayImportApiResponse class]];
}

- (void)importApi:(AWSapigatewayImportApiRequest *)request
     completionHandler:(void (^)(AWSapigatewayImportApiResponse *response, NSError *error))completionHandler {
    [[self importApi:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayImportApiResponse *> * _Nonnull task) {
        AWSapigatewayImportApiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayReimportApiResponse *> *)reimportApi:(AWSapigatewayReimportApiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/apis/{apiId}"
                  targetPrefix:@""
                 operationName:@"ReimportApi"
                   outputClass:[AWSapigatewayReimportApiResponse class]];
}

- (void)reimportApi:(AWSapigatewayReimportApiRequest *)request
     completionHandler:(void (^)(AWSapigatewayReimportApiResponse *response, NSError *error))completionHandler {
    [[self reimportApi:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayReimportApiResponse *> * _Nonnull task) {
        AWSapigatewayReimportApiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayTagResourceResponse *> *)tagResource:(AWSapigatewayTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSapigatewayTagResourceResponse class]];
}

- (void)tagResource:(AWSapigatewayTagResourceRequest *)request
     completionHandler:(void (^)(AWSapigatewayTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayTagResourceResponse *> * _Nonnull task) {
        AWSapigatewayTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSapigatewayUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSapigatewayUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateApiResponse *> *)updateApi:(AWSapigatewayUpdateApiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/apis/{apiId}"
                  targetPrefix:@""
                 operationName:@"UpdateApi"
                   outputClass:[AWSapigatewayUpdateApiResponse class]];
}

- (void)updateApi:(AWSapigatewayUpdateApiRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateApiResponse *response, NSError *error))completionHandler {
    [[self updateApi:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateApiResponse *> * _Nonnull task) {
        AWSapigatewayUpdateApiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateApiMappingResponse *> *)updateApiMapping:(AWSapigatewayUpdateApiMappingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/domainnames/{domainName}/apimappings/{apiMappingId}"
                  targetPrefix:@""
                 operationName:@"UpdateApiMapping"
                   outputClass:[AWSapigatewayUpdateApiMappingResponse class]];
}

- (void)updateApiMapping:(AWSapigatewayUpdateApiMappingRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateApiMappingResponse *response, NSError *error))completionHandler {
    [[self updateApiMapping:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateApiMappingResponse *> * _Nonnull task) {
        AWSapigatewayUpdateApiMappingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateAuthorizerResponse *> *)updateAuthorizer:(AWSapigatewayUpdateAuthorizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/apis/{apiId}/authorizers/{authorizerId}"
                  targetPrefix:@""
                 operationName:@"UpdateAuthorizer"
                   outputClass:[AWSapigatewayUpdateAuthorizerResponse class]];
}

- (void)updateAuthorizer:(AWSapigatewayUpdateAuthorizerRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateAuthorizerResponse *response, NSError *error))completionHandler {
    [[self updateAuthorizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateAuthorizerResponse *> * _Nonnull task) {
        AWSapigatewayUpdateAuthorizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateDeploymentResponse *> *)updateDeployment:(AWSapigatewayUpdateDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/apis/{apiId}/deployments/{deploymentId}"
                  targetPrefix:@""
                 operationName:@"UpdateDeployment"
                   outputClass:[AWSapigatewayUpdateDeploymentResponse class]];
}

- (void)updateDeployment:(AWSapigatewayUpdateDeploymentRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateDeploymentResponse *response, NSError *error))completionHandler {
    [[self updateDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateDeploymentResponse *> * _Nonnull task) {
        AWSapigatewayUpdateDeploymentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateDomainNameResponse *> *)updateDomainName:(AWSapigatewayUpdateDomainNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/domainnames/{domainName}"
                  targetPrefix:@""
                 operationName:@"UpdateDomainName"
                   outputClass:[AWSapigatewayUpdateDomainNameResponse class]];
}

- (void)updateDomainName:(AWSapigatewayUpdateDomainNameRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateDomainNameResponse *response, NSError *error))completionHandler {
    [[self updateDomainName:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateDomainNameResponse *> * _Nonnull task) {
        AWSapigatewayUpdateDomainNameResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateIntegrationResult *> *)updateIntegration:(AWSapigatewayUpdateIntegrationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/apis/{apiId}/integrations/{integrationId}"
                  targetPrefix:@""
                 operationName:@"UpdateIntegration"
                   outputClass:[AWSapigatewayUpdateIntegrationResult class]];
}

- (void)updateIntegration:(AWSapigatewayUpdateIntegrationRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateIntegrationResult *response, NSError *error))completionHandler {
    [[self updateIntegration:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateIntegrationResult *> * _Nonnull task) {
        AWSapigatewayUpdateIntegrationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateIntegrationResponseResponse *> *)updateIntegrationResponse:(AWSapigatewayUpdateIntegrationResponseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses/{integrationResponseId}"
                  targetPrefix:@""
                 operationName:@"UpdateIntegrationResponse"
                   outputClass:[AWSapigatewayUpdateIntegrationResponseResponse class]];
}

- (void)updateIntegrationResponse:(AWSapigatewayUpdateIntegrationResponseRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateIntegrationResponseResponse *response, NSError *error))completionHandler {
    [[self updateIntegrationResponse:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateIntegrationResponseResponse *> * _Nonnull task) {
        AWSapigatewayUpdateIntegrationResponseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateModelResponse *> *)updateModel:(AWSapigatewayUpdateModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/apis/{apiId}/models/{modelId}"
                  targetPrefix:@""
                 operationName:@"UpdateModel"
                   outputClass:[AWSapigatewayUpdateModelResponse class]];
}

- (void)updateModel:(AWSapigatewayUpdateModelRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateModelResponse *response, NSError *error))completionHandler {
    [[self updateModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateModelResponse *> * _Nonnull task) {
        AWSapigatewayUpdateModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateRouteResult *> *)updateRoute:(AWSapigatewayUpdateRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/apis/{apiId}/routes/{routeId}"
                  targetPrefix:@""
                 operationName:@"UpdateRoute"
                   outputClass:[AWSapigatewayUpdateRouteResult class]];
}

- (void)updateRoute:(AWSapigatewayUpdateRouteRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateRouteResult *response, NSError *error))completionHandler {
    [[self updateRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateRouteResult *> * _Nonnull task) {
        AWSapigatewayUpdateRouteResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateRouteResponseResponse *> *)updateRouteResponse:(AWSapigatewayUpdateRouteResponseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/apis/{apiId}/routes/{routeId}/routeresponses/{routeResponseId}"
                  targetPrefix:@""
                 operationName:@"UpdateRouteResponse"
                   outputClass:[AWSapigatewayUpdateRouteResponseResponse class]];
}

- (void)updateRouteResponse:(AWSapigatewayUpdateRouteResponseRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateRouteResponseResponse *response, NSError *error))completionHandler {
    [[self updateRouteResponse:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateRouteResponseResponse *> * _Nonnull task) {
        AWSapigatewayUpdateRouteResponseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateStageResponse *> *)updateStage:(AWSapigatewayUpdateStageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/apis/{apiId}/stages/{stageName}"
                  targetPrefix:@""
                 operationName:@"UpdateStage"
                   outputClass:[AWSapigatewayUpdateStageResponse class]];
}

- (void)updateStage:(AWSapigatewayUpdateStageRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateStageResponse *response, NSError *error))completionHandler {
    [[self updateStage:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateStageResponse *> * _Nonnull task) {
        AWSapigatewayUpdateStageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapigatewayUpdateVpcLinkResponse *> *)updateVpcLink:(AWSapigatewayUpdateVpcLinkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v2/vpclinks/{vpcLinkId}"
                  targetPrefix:@""
                 operationName:@"UpdateVpcLink"
                   outputClass:[AWSapigatewayUpdateVpcLinkResponse class]];
}

- (void)updateVpcLink:(AWSapigatewayUpdateVpcLinkRequest *)request
     completionHandler:(void (^)(AWSapigatewayUpdateVpcLinkResponse *response, NSError *error))completionHandler {
    [[self updateVpcLink:request] continueWithBlock:^id _Nullable(AWSTask<AWSapigatewayUpdateVpcLinkResponse *> * _Nonnull task) {
        AWSapigatewayUpdateVpcLinkResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
