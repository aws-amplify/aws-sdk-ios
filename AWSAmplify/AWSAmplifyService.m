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

#import "AWSAmplifyService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAmplifyResources.h"

static NSString *const AWSInfoAmplify = @"Amplify";
NSString *const AWSAmplifySDKVersion = @"2.13.5";


@interface AWSAmplifyResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSAmplifyResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSAmplifyErrorBadRequest),
                            @"DependentServiceFailureException" : @(AWSAmplifyErrorDependentServiceFailure),
                            @"InternalFailureException" : @(AWSAmplifyErrorInternalFailure),
                            @"LimitExceededException" : @(AWSAmplifyErrorLimitExceeded),
                            @"NotFoundException" : @(AWSAmplifyErrorNotFound),
                            @"ResourceNotFoundException" : @(AWSAmplifyErrorResourceNotFound),
                            @"UnauthorizedException" : @(AWSAmplifyErrorUnauthorized),
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
                    *error = [NSError errorWithDomain:AWSAmplifyErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSAmplifyErrorDomain
                                                 code:AWSAmplifyErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSAmplifyErrorDomain
                                     code:AWSAmplifyErrorUnknown
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

@interface AWSAmplifyRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAmplifyRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAmplify()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAmplify

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAmplifySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAmplify versions need to match. Check your SDK installation. AWSCore: %@ AWSAmplify: %@", AWSiOSSDKVersion, AWSAmplifySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAmplify {
    static AWSAmplify *_defaultAmplify = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAmplify];
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
        _defaultAmplify = [[AWSAmplify alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAmplify;
}

+ (void)registerAmplifyWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAmplify alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AmplifyForKey:(NSString *)key {
    @synchronized(self) {
        AWSAmplify *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAmplify
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAmplify registerAmplifyWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAmplifyForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAmplify` or `+ AmplifyForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAmplify
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAmplify];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAmplifyRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSAmplifyResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAmplifyResponseSerializer alloc] initWithJSONDefinition:[[AWSAmplifyResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSAmplifyCreateAppResult *> *)createApp:(AWSAmplifyCreateAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps"
                  targetPrefix:@""
                 operationName:@"CreateApp"
                   outputClass:[AWSAmplifyCreateAppResult class]];
}

- (void)createApp:(AWSAmplifyCreateAppRequest *)request
     completionHandler:(void (^)(AWSAmplifyCreateAppResult *response, NSError *error))completionHandler {
    [[self createApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyCreateAppResult *> * _Nonnull task) {
        AWSAmplifyCreateAppResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyCreateBackendEnvironmentResult *> *)createBackendEnvironment:(AWSAmplifyCreateBackendEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}/backendenvironments"
                  targetPrefix:@""
                 operationName:@"CreateBackendEnvironment"
                   outputClass:[AWSAmplifyCreateBackendEnvironmentResult class]];
}

- (void)createBackendEnvironment:(AWSAmplifyCreateBackendEnvironmentRequest *)request
     completionHandler:(void (^)(AWSAmplifyCreateBackendEnvironmentResult *response, NSError *error))completionHandler {
    [[self createBackendEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyCreateBackendEnvironmentResult *> * _Nonnull task) {
        AWSAmplifyCreateBackendEnvironmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyCreateBranchResult *> *)createBranch:(AWSAmplifyCreateBranchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}/branches"
                  targetPrefix:@""
                 operationName:@"CreateBranch"
                   outputClass:[AWSAmplifyCreateBranchResult class]];
}

- (void)createBranch:(AWSAmplifyCreateBranchRequest *)request
     completionHandler:(void (^)(AWSAmplifyCreateBranchResult *response, NSError *error))completionHandler {
    [[self createBranch:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyCreateBranchResult *> * _Nonnull task) {
        AWSAmplifyCreateBranchResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyCreateDeploymentResult *> *)createDeployment:(AWSAmplifyCreateDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}/branches/{branchName}/deployments"
                  targetPrefix:@""
                 operationName:@"CreateDeployment"
                   outputClass:[AWSAmplifyCreateDeploymentResult class]];
}

- (void)createDeployment:(AWSAmplifyCreateDeploymentRequest *)request
     completionHandler:(void (^)(AWSAmplifyCreateDeploymentResult *response, NSError *error))completionHandler {
    [[self createDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyCreateDeploymentResult *> * _Nonnull task) {
        AWSAmplifyCreateDeploymentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyCreateDomainAssociationResult *> *)createDomainAssociation:(AWSAmplifyCreateDomainAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}/domains"
                  targetPrefix:@""
                 operationName:@"CreateDomainAssociation"
                   outputClass:[AWSAmplifyCreateDomainAssociationResult class]];
}

- (void)createDomainAssociation:(AWSAmplifyCreateDomainAssociationRequest *)request
     completionHandler:(void (^)(AWSAmplifyCreateDomainAssociationResult *response, NSError *error))completionHandler {
    [[self createDomainAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyCreateDomainAssociationResult *> * _Nonnull task) {
        AWSAmplifyCreateDomainAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyCreateWebhookResult *> *)createWebhook:(AWSAmplifyCreateWebhookRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}/webhooks"
                  targetPrefix:@""
                 operationName:@"CreateWebhook"
                   outputClass:[AWSAmplifyCreateWebhookResult class]];
}

- (void)createWebhook:(AWSAmplifyCreateWebhookRequest *)request
     completionHandler:(void (^)(AWSAmplifyCreateWebhookResult *response, NSError *error))completionHandler {
    [[self createWebhook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyCreateWebhookResult *> * _Nonnull task) {
        AWSAmplifyCreateWebhookResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyDeleteAppResult *> *)deleteApp:(AWSAmplifyDeleteAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/apps/{appId}"
                  targetPrefix:@""
                 operationName:@"DeleteApp"
                   outputClass:[AWSAmplifyDeleteAppResult class]];
}

- (void)deleteApp:(AWSAmplifyDeleteAppRequest *)request
     completionHandler:(void (^)(AWSAmplifyDeleteAppResult *response, NSError *error))completionHandler {
    [[self deleteApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyDeleteAppResult *> * _Nonnull task) {
        AWSAmplifyDeleteAppResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyDeleteBackendEnvironmentResult *> *)deleteBackendEnvironment:(AWSAmplifyDeleteBackendEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/apps/{appId}/backendenvironments/{environmentName}"
                  targetPrefix:@""
                 operationName:@"DeleteBackendEnvironment"
                   outputClass:[AWSAmplifyDeleteBackendEnvironmentResult class]];
}

- (void)deleteBackendEnvironment:(AWSAmplifyDeleteBackendEnvironmentRequest *)request
     completionHandler:(void (^)(AWSAmplifyDeleteBackendEnvironmentResult *response, NSError *error))completionHandler {
    [[self deleteBackendEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyDeleteBackendEnvironmentResult *> * _Nonnull task) {
        AWSAmplifyDeleteBackendEnvironmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyDeleteBranchResult *> *)deleteBranch:(AWSAmplifyDeleteBranchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/apps/{appId}/branches/{branchName}"
                  targetPrefix:@""
                 operationName:@"DeleteBranch"
                   outputClass:[AWSAmplifyDeleteBranchResult class]];
}

- (void)deleteBranch:(AWSAmplifyDeleteBranchRequest *)request
     completionHandler:(void (^)(AWSAmplifyDeleteBranchResult *response, NSError *error))completionHandler {
    [[self deleteBranch:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyDeleteBranchResult *> * _Nonnull task) {
        AWSAmplifyDeleteBranchResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyDeleteDomainAssociationResult *> *)deleteDomainAssociation:(AWSAmplifyDeleteDomainAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/apps/{appId}/domains/{domainName}"
                  targetPrefix:@""
                 operationName:@"DeleteDomainAssociation"
                   outputClass:[AWSAmplifyDeleteDomainAssociationResult class]];
}

- (void)deleteDomainAssociation:(AWSAmplifyDeleteDomainAssociationRequest *)request
     completionHandler:(void (^)(AWSAmplifyDeleteDomainAssociationResult *response, NSError *error))completionHandler {
    [[self deleteDomainAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyDeleteDomainAssociationResult *> * _Nonnull task) {
        AWSAmplifyDeleteDomainAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyDeleteJobResult *> *)deleteJob:(AWSAmplifyDeleteJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/apps/{appId}/branches/{branchName}/jobs/{jobId}"
                  targetPrefix:@""
                 operationName:@"DeleteJob"
                   outputClass:[AWSAmplifyDeleteJobResult class]];
}

- (void)deleteJob:(AWSAmplifyDeleteJobRequest *)request
     completionHandler:(void (^)(AWSAmplifyDeleteJobResult *response, NSError *error))completionHandler {
    [[self deleteJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyDeleteJobResult *> * _Nonnull task) {
        AWSAmplifyDeleteJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyDeleteWebhookResult *> *)deleteWebhook:(AWSAmplifyDeleteWebhookRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/webhooks/{webhookId}"
                  targetPrefix:@""
                 operationName:@"DeleteWebhook"
                   outputClass:[AWSAmplifyDeleteWebhookResult class]];
}

- (void)deleteWebhook:(AWSAmplifyDeleteWebhookRequest *)request
     completionHandler:(void (^)(AWSAmplifyDeleteWebhookResult *response, NSError *error))completionHandler {
    [[self deleteWebhook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyDeleteWebhookResult *> * _Nonnull task) {
        AWSAmplifyDeleteWebhookResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyGenerateAccessLogsResult *> *)generateAccessLogs:(AWSAmplifyGenerateAccessLogsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}/accesslogs"
                  targetPrefix:@""
                 operationName:@"GenerateAccessLogs"
                   outputClass:[AWSAmplifyGenerateAccessLogsResult class]];
}

- (void)generateAccessLogs:(AWSAmplifyGenerateAccessLogsRequest *)request
     completionHandler:(void (^)(AWSAmplifyGenerateAccessLogsResult *response, NSError *error))completionHandler {
    [[self generateAccessLogs:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyGenerateAccessLogsResult *> * _Nonnull task) {
        AWSAmplifyGenerateAccessLogsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyGetAppResult *> *)getApp:(AWSAmplifyGetAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}"
                  targetPrefix:@""
                 operationName:@"GetApp"
                   outputClass:[AWSAmplifyGetAppResult class]];
}

- (void)getApp:(AWSAmplifyGetAppRequest *)request
     completionHandler:(void (^)(AWSAmplifyGetAppResult *response, NSError *error))completionHandler {
    [[self getApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyGetAppResult *> * _Nonnull task) {
        AWSAmplifyGetAppResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyGetArtifactUrlResult *> *)getArtifactUrl:(AWSAmplifyGetArtifactUrlRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/artifacts/{artifactId}"
                  targetPrefix:@""
                 operationName:@"GetArtifactUrl"
                   outputClass:[AWSAmplifyGetArtifactUrlResult class]];
}

- (void)getArtifactUrl:(AWSAmplifyGetArtifactUrlRequest *)request
     completionHandler:(void (^)(AWSAmplifyGetArtifactUrlResult *response, NSError *error))completionHandler {
    [[self getArtifactUrl:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyGetArtifactUrlResult *> * _Nonnull task) {
        AWSAmplifyGetArtifactUrlResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyGetBackendEnvironmentResult *> *)getBackendEnvironment:(AWSAmplifyGetBackendEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}/backendenvironments/{environmentName}"
                  targetPrefix:@""
                 operationName:@"GetBackendEnvironment"
                   outputClass:[AWSAmplifyGetBackendEnvironmentResult class]];
}

- (void)getBackendEnvironment:(AWSAmplifyGetBackendEnvironmentRequest *)request
     completionHandler:(void (^)(AWSAmplifyGetBackendEnvironmentResult *response, NSError *error))completionHandler {
    [[self getBackendEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyGetBackendEnvironmentResult *> * _Nonnull task) {
        AWSAmplifyGetBackendEnvironmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyGetBranchResult *> *)getBranch:(AWSAmplifyGetBranchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}/branches/{branchName}"
                  targetPrefix:@""
                 operationName:@"GetBranch"
                   outputClass:[AWSAmplifyGetBranchResult class]];
}

- (void)getBranch:(AWSAmplifyGetBranchRequest *)request
     completionHandler:(void (^)(AWSAmplifyGetBranchResult *response, NSError *error))completionHandler {
    [[self getBranch:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyGetBranchResult *> * _Nonnull task) {
        AWSAmplifyGetBranchResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyGetDomainAssociationResult *> *)getDomainAssociation:(AWSAmplifyGetDomainAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}/domains/{domainName}"
                  targetPrefix:@""
                 operationName:@"GetDomainAssociation"
                   outputClass:[AWSAmplifyGetDomainAssociationResult class]];
}

- (void)getDomainAssociation:(AWSAmplifyGetDomainAssociationRequest *)request
     completionHandler:(void (^)(AWSAmplifyGetDomainAssociationResult *response, NSError *error))completionHandler {
    [[self getDomainAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyGetDomainAssociationResult *> * _Nonnull task) {
        AWSAmplifyGetDomainAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyGetJobResult *> *)getJob:(AWSAmplifyGetJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}/branches/{branchName}/jobs/{jobId}"
                  targetPrefix:@""
                 operationName:@"GetJob"
                   outputClass:[AWSAmplifyGetJobResult class]];
}

- (void)getJob:(AWSAmplifyGetJobRequest *)request
     completionHandler:(void (^)(AWSAmplifyGetJobResult *response, NSError *error))completionHandler {
    [[self getJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyGetJobResult *> * _Nonnull task) {
        AWSAmplifyGetJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyGetWebhookResult *> *)getWebhook:(AWSAmplifyGetWebhookRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/webhooks/{webhookId}"
                  targetPrefix:@""
                 operationName:@"GetWebhook"
                   outputClass:[AWSAmplifyGetWebhookResult class]];
}

- (void)getWebhook:(AWSAmplifyGetWebhookRequest *)request
     completionHandler:(void (^)(AWSAmplifyGetWebhookResult *response, NSError *error))completionHandler {
    [[self getWebhook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyGetWebhookResult *> * _Nonnull task) {
        AWSAmplifyGetWebhookResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyListAppsResult *> *)listApps:(AWSAmplifyListAppsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps"
                  targetPrefix:@""
                 operationName:@"ListApps"
                   outputClass:[AWSAmplifyListAppsResult class]];
}

- (void)listApps:(AWSAmplifyListAppsRequest *)request
     completionHandler:(void (^)(AWSAmplifyListAppsResult *response, NSError *error))completionHandler {
    [[self listApps:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyListAppsResult *> * _Nonnull task) {
        AWSAmplifyListAppsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyListArtifactsResult *> *)listArtifacts:(AWSAmplifyListArtifactsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}/branches/{branchName}/jobs/{jobId}/artifacts"
                  targetPrefix:@""
                 operationName:@"ListArtifacts"
                   outputClass:[AWSAmplifyListArtifactsResult class]];
}

- (void)listArtifacts:(AWSAmplifyListArtifactsRequest *)request
     completionHandler:(void (^)(AWSAmplifyListArtifactsResult *response, NSError *error))completionHandler {
    [[self listArtifacts:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyListArtifactsResult *> * _Nonnull task) {
        AWSAmplifyListArtifactsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyListBackendEnvironmentsResult *> *)listBackendEnvironments:(AWSAmplifyListBackendEnvironmentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}/backendenvironments"
                  targetPrefix:@""
                 operationName:@"ListBackendEnvironments"
                   outputClass:[AWSAmplifyListBackendEnvironmentsResult class]];
}

- (void)listBackendEnvironments:(AWSAmplifyListBackendEnvironmentsRequest *)request
     completionHandler:(void (^)(AWSAmplifyListBackendEnvironmentsResult *response, NSError *error))completionHandler {
    [[self listBackendEnvironments:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyListBackendEnvironmentsResult *> * _Nonnull task) {
        AWSAmplifyListBackendEnvironmentsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyListBranchesResult *> *)listBranches:(AWSAmplifyListBranchesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}/branches"
                  targetPrefix:@""
                 operationName:@"ListBranches"
                   outputClass:[AWSAmplifyListBranchesResult class]];
}

- (void)listBranches:(AWSAmplifyListBranchesRequest *)request
     completionHandler:(void (^)(AWSAmplifyListBranchesResult *response, NSError *error))completionHandler {
    [[self listBranches:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyListBranchesResult *> * _Nonnull task) {
        AWSAmplifyListBranchesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyListDomainAssociationsResult *> *)listDomainAssociations:(AWSAmplifyListDomainAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}/domains"
                  targetPrefix:@""
                 operationName:@"ListDomainAssociations"
                   outputClass:[AWSAmplifyListDomainAssociationsResult class]];
}

- (void)listDomainAssociations:(AWSAmplifyListDomainAssociationsRequest *)request
     completionHandler:(void (^)(AWSAmplifyListDomainAssociationsResult *response, NSError *error))completionHandler {
    [[self listDomainAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyListDomainAssociationsResult *> * _Nonnull task) {
        AWSAmplifyListDomainAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyListJobsResult *> *)listJobs:(AWSAmplifyListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}/branches/{branchName}/jobs"
                  targetPrefix:@""
                 operationName:@"ListJobs"
                   outputClass:[AWSAmplifyListJobsResult class]];
}

- (void)listJobs:(AWSAmplifyListJobsRequest *)request
     completionHandler:(void (^)(AWSAmplifyListJobsResult *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyListJobsResult *> * _Nonnull task) {
        AWSAmplifyListJobsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyListTagsForResourceResponse *> *)listTagsForResource:(AWSAmplifyListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSAmplifyListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSAmplifyListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSAmplifyListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyListTagsForResourceResponse *> * _Nonnull task) {
        AWSAmplifyListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyListWebhooksResult *> *)listWebhooks:(AWSAmplifyListWebhooksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/apps/{appId}/webhooks"
                  targetPrefix:@""
                 operationName:@"ListWebhooks"
                   outputClass:[AWSAmplifyListWebhooksResult class]];
}

- (void)listWebhooks:(AWSAmplifyListWebhooksRequest *)request
     completionHandler:(void (^)(AWSAmplifyListWebhooksResult *response, NSError *error))completionHandler {
    [[self listWebhooks:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyListWebhooksResult *> * _Nonnull task) {
        AWSAmplifyListWebhooksResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyStartDeploymentResult *> *)startDeployment:(AWSAmplifyStartDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}/branches/{branchName}/deployments/start"
                  targetPrefix:@""
                 operationName:@"StartDeployment"
                   outputClass:[AWSAmplifyStartDeploymentResult class]];
}

- (void)startDeployment:(AWSAmplifyStartDeploymentRequest *)request
     completionHandler:(void (^)(AWSAmplifyStartDeploymentResult *response, NSError *error))completionHandler {
    [[self startDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyStartDeploymentResult *> * _Nonnull task) {
        AWSAmplifyStartDeploymentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyStartJobResult *> *)startJob:(AWSAmplifyStartJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}/branches/{branchName}/jobs"
                  targetPrefix:@""
                 operationName:@"StartJob"
                   outputClass:[AWSAmplifyStartJobResult class]];
}

- (void)startJob:(AWSAmplifyStartJobRequest *)request
     completionHandler:(void (^)(AWSAmplifyStartJobResult *response, NSError *error))completionHandler {
    [[self startJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyStartJobResult *> * _Nonnull task) {
        AWSAmplifyStartJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyStopJobResult *> *)stopJob:(AWSAmplifyStopJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/apps/{appId}/branches/{branchName}/jobs/{jobId}/stop"
                  targetPrefix:@""
                 operationName:@"StopJob"
                   outputClass:[AWSAmplifyStopJobResult class]];
}

- (void)stopJob:(AWSAmplifyStopJobRequest *)request
     completionHandler:(void (^)(AWSAmplifyStopJobResult *response, NSError *error))completionHandler {
    [[self stopJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyStopJobResult *> * _Nonnull task) {
        AWSAmplifyStopJobResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyTagResourceResponse *> *)tagResource:(AWSAmplifyTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSAmplifyTagResourceResponse class]];
}

- (void)tagResource:(AWSAmplifyTagResourceRequest *)request
     completionHandler:(void (^)(AWSAmplifyTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyTagResourceResponse *> * _Nonnull task) {
        AWSAmplifyTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyUntagResourceResponse *> *)untagResource:(AWSAmplifyUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSAmplifyUntagResourceResponse class]];
}

- (void)untagResource:(AWSAmplifyUntagResourceRequest *)request
     completionHandler:(void (^)(AWSAmplifyUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyUntagResourceResponse *> * _Nonnull task) {
        AWSAmplifyUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyUpdateAppResult *> *)updateApp:(AWSAmplifyUpdateAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}"
                  targetPrefix:@""
                 operationName:@"UpdateApp"
                   outputClass:[AWSAmplifyUpdateAppResult class]];
}

- (void)updateApp:(AWSAmplifyUpdateAppRequest *)request
     completionHandler:(void (^)(AWSAmplifyUpdateAppResult *response, NSError *error))completionHandler {
    [[self updateApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyUpdateAppResult *> * _Nonnull task) {
        AWSAmplifyUpdateAppResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyUpdateBranchResult *> *)updateBranch:(AWSAmplifyUpdateBranchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}/branches/{branchName}"
                  targetPrefix:@""
                 operationName:@"UpdateBranch"
                   outputClass:[AWSAmplifyUpdateBranchResult class]];
}

- (void)updateBranch:(AWSAmplifyUpdateBranchRequest *)request
     completionHandler:(void (^)(AWSAmplifyUpdateBranchResult *response, NSError *error))completionHandler {
    [[self updateBranch:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyUpdateBranchResult *> * _Nonnull task) {
        AWSAmplifyUpdateBranchResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyUpdateDomainAssociationResult *> *)updateDomainAssociation:(AWSAmplifyUpdateDomainAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/apps/{appId}/domains/{domainName}"
                  targetPrefix:@""
                 operationName:@"UpdateDomainAssociation"
                   outputClass:[AWSAmplifyUpdateDomainAssociationResult class]];
}

- (void)updateDomainAssociation:(AWSAmplifyUpdateDomainAssociationRequest *)request
     completionHandler:(void (^)(AWSAmplifyUpdateDomainAssociationResult *response, NSError *error))completionHandler {
    [[self updateDomainAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyUpdateDomainAssociationResult *> * _Nonnull task) {
        AWSAmplifyUpdateDomainAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAmplifyUpdateWebhookResult *> *)updateWebhook:(AWSAmplifyUpdateWebhookRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/webhooks/{webhookId}"
                  targetPrefix:@""
                 operationName:@"UpdateWebhook"
                   outputClass:[AWSAmplifyUpdateWebhookResult class]];
}

- (void)updateWebhook:(AWSAmplifyUpdateWebhookRequest *)request
     completionHandler:(void (^)(AWSAmplifyUpdateWebhookResult *response, NSError *error))completionHandler {
    [[self updateWebhook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAmplifyUpdateWebhookResult *> * _Nonnull task) {
        AWSAmplifyUpdateWebhookResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
