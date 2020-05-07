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

#import "AWSAppConfigService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAppConfigResources.h"

static NSString *const AWSInfoAppConfig = @"AppConfig";
NSString *const AWSAppConfigSDKVersion = @"2.13.3";


@interface AWSAppConfigResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSAppConfigResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSAppConfigErrorBadRequest),
                            @"ConflictException" : @(AWSAppConfigErrorConflict),
                            @"InternalServerException" : @(AWSAppConfigErrorInternalServer),
                            @"ResourceNotFoundException" : @(AWSAppConfigErrorResourceNotFound),
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
                    *error = [NSError errorWithDomain:AWSAppConfigErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSAppConfigErrorDomain
                                                 code:AWSAppConfigErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSAppConfigErrorDomain
                                     code:AWSAppConfigErrorUnknown
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

@interface AWSAppConfigRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAppConfigRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAppConfig()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAppConfig

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAppConfigSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAppConfig versions need to match. Check your SDK installation. AWSCore: %@ AWSAppConfig: %@", AWSiOSSDKVersion, AWSAppConfigSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAppConfig {
    static AWSAppConfig *_defaultAppConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAppConfig];
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
        _defaultAppConfig = [[AWSAppConfig alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAppConfig;
}

+ (void)registerAppConfigWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAppConfig alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AppConfigForKey:(NSString *)key {
    @synchronized(self) {
        AWSAppConfig *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAppConfig
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAppConfig registerAppConfigWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAppConfigForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAppConfig` or `+ AppConfigForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAppConfig
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAppConfig];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAppConfigRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSAppConfigResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAppConfigResponseSerializer alloc] initWithJSONDefinition:[[AWSAppConfigResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSAppConfigApplication *> *)createApplication:(AWSAppConfigCreateApplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications"
                  targetPrefix:@""
                 operationName:@"CreateApplication"
                   outputClass:[AWSAppConfigApplication class]];
}

- (void)createApplication:(AWSAppConfigCreateApplicationRequest *)request
     completionHandler:(void (^)(AWSAppConfigApplication *response, NSError *error))completionHandler {
    [[self createApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigApplication *> * _Nonnull task) {
        AWSAppConfigApplication *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigConfigurationProfile *> *)createConfigurationProfile:(AWSAppConfigCreateConfigurationProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications/{ApplicationId}/configurationprofiles"
                  targetPrefix:@""
                 operationName:@"CreateConfigurationProfile"
                   outputClass:[AWSAppConfigConfigurationProfile class]];
}

- (void)createConfigurationProfile:(AWSAppConfigCreateConfigurationProfileRequest *)request
     completionHandler:(void (^)(AWSAppConfigConfigurationProfile *response, NSError *error))completionHandler {
    [[self createConfigurationProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigConfigurationProfile *> * _Nonnull task) {
        AWSAppConfigConfigurationProfile *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigDeploymentStrategy *> *)createDeploymentStrategy:(AWSAppConfigCreateDeploymentStrategyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/deploymentstrategies"
                  targetPrefix:@""
                 operationName:@"CreateDeploymentStrategy"
                   outputClass:[AWSAppConfigDeploymentStrategy class]];
}

- (void)createDeploymentStrategy:(AWSAppConfigCreateDeploymentStrategyRequest *)request
     completionHandler:(void (^)(AWSAppConfigDeploymentStrategy *response, NSError *error))completionHandler {
    [[self createDeploymentStrategy:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigDeploymentStrategy *> * _Nonnull task) {
        AWSAppConfigDeploymentStrategy *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigEnvironment *> *)createEnvironment:(AWSAppConfigCreateEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications/{ApplicationId}/environments"
                  targetPrefix:@""
                 operationName:@"CreateEnvironment"
                   outputClass:[AWSAppConfigEnvironment class]];
}

- (void)createEnvironment:(AWSAppConfigCreateEnvironmentRequest *)request
     completionHandler:(void (^)(AWSAppConfigEnvironment *response, NSError *error))completionHandler {
    [[self createEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigEnvironment *> * _Nonnull task) {
        AWSAppConfigEnvironment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteApplication:(AWSAppConfigDeleteApplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/applications/{ApplicationId}"
                  targetPrefix:@""
                 operationName:@"DeleteApplication"
                   outputClass:nil];
}

- (void)deleteApplication:(AWSAppConfigDeleteApplicationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteApplication:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteConfigurationProfile:(AWSAppConfigDeleteConfigurationProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
                  targetPrefix:@""
                 operationName:@"DeleteConfigurationProfile"
                   outputClass:nil];
}

- (void)deleteConfigurationProfile:(AWSAppConfigDeleteConfigurationProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteConfigurationProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDeploymentStrategy:(AWSAppConfigDeleteDeploymentStrategyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/deployementstrategies/{DeploymentStrategyId}"
                  targetPrefix:@""
                 operationName:@"DeleteDeploymentStrategy"
                   outputClass:nil];
}

- (void)deleteDeploymentStrategy:(AWSAppConfigDeleteDeploymentStrategyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDeploymentStrategy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEnvironment:(AWSAppConfigDeleteEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}"
                  targetPrefix:@""
                 operationName:@"DeleteEnvironment"
                   outputClass:nil];
}

- (void)deleteEnvironment:(AWSAppConfigDeleteEnvironmentRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEnvironment:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigApplication *> *)getApplication:(AWSAppConfigGetApplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}"
                  targetPrefix:@""
                 operationName:@"GetApplication"
                   outputClass:[AWSAppConfigApplication class]];
}

- (void)getApplication:(AWSAppConfigGetApplicationRequest *)request
     completionHandler:(void (^)(AWSAppConfigApplication *response, NSError *error))completionHandler {
    [[self getApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigApplication *> * _Nonnull task) {
        AWSAppConfigApplication *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigConfiguration *> *)getConfiguration:(AWSAppConfigGetConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{Application}/environments/{Environment}/configurations/{Configuration}"
                  targetPrefix:@""
                 operationName:@"GetConfiguration"
                   outputClass:[AWSAppConfigConfiguration class]];
}

- (void)getConfiguration:(AWSAppConfigGetConfigurationRequest *)request
     completionHandler:(void (^)(AWSAppConfigConfiguration *response, NSError *error))completionHandler {
    [[self getConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigConfiguration *> * _Nonnull task) {
        AWSAppConfigConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigConfigurationProfile *> *)getConfigurationProfile:(AWSAppConfigGetConfigurationProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
                  targetPrefix:@""
                 operationName:@"GetConfigurationProfile"
                   outputClass:[AWSAppConfigConfigurationProfile class]];
}

- (void)getConfigurationProfile:(AWSAppConfigGetConfigurationProfileRequest *)request
     completionHandler:(void (^)(AWSAppConfigConfigurationProfile *response, NSError *error))completionHandler {
    [[self getConfigurationProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigConfigurationProfile *> * _Nonnull task) {
        AWSAppConfigConfigurationProfile *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigDeployment *> *)getDeployment:(AWSAppConfigGetDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}"
                  targetPrefix:@""
                 operationName:@"GetDeployment"
                   outputClass:[AWSAppConfigDeployment class]];
}

- (void)getDeployment:(AWSAppConfigGetDeploymentRequest *)request
     completionHandler:(void (^)(AWSAppConfigDeployment *response, NSError *error))completionHandler {
    [[self getDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigDeployment *> * _Nonnull task) {
        AWSAppConfigDeployment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigDeploymentStrategy *> *)getDeploymentStrategy:(AWSAppConfigGetDeploymentStrategyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/deploymentstrategies/{DeploymentStrategyId}"
                  targetPrefix:@""
                 operationName:@"GetDeploymentStrategy"
                   outputClass:[AWSAppConfigDeploymentStrategy class]];
}

- (void)getDeploymentStrategy:(AWSAppConfigGetDeploymentStrategyRequest *)request
     completionHandler:(void (^)(AWSAppConfigDeploymentStrategy *response, NSError *error))completionHandler {
    [[self getDeploymentStrategy:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigDeploymentStrategy *> * _Nonnull task) {
        AWSAppConfigDeploymentStrategy *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigEnvironment *> *)getEnvironment:(AWSAppConfigGetEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}"
                  targetPrefix:@""
                 operationName:@"GetEnvironment"
                   outputClass:[AWSAppConfigEnvironment class]];
}

- (void)getEnvironment:(AWSAppConfigGetEnvironmentRequest *)request
     completionHandler:(void (^)(AWSAppConfigEnvironment *response, NSError *error))completionHandler {
    [[self getEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigEnvironment *> * _Nonnull task) {
        AWSAppConfigEnvironment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigApplications *> *)listApplications:(AWSAppConfigListApplicationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications"
                  targetPrefix:@""
                 operationName:@"ListApplications"
                   outputClass:[AWSAppConfigApplications class]];
}

- (void)listApplications:(AWSAppConfigListApplicationsRequest *)request
     completionHandler:(void (^)(AWSAppConfigApplications *response, NSError *error))completionHandler {
    [[self listApplications:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigApplications *> * _Nonnull task) {
        AWSAppConfigApplications *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigConfigurationProfiles *> *)listConfigurationProfiles:(AWSAppConfigListConfigurationProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/configurationprofiles"
                  targetPrefix:@""
                 operationName:@"ListConfigurationProfiles"
                   outputClass:[AWSAppConfigConfigurationProfiles class]];
}

- (void)listConfigurationProfiles:(AWSAppConfigListConfigurationProfilesRequest *)request
     completionHandler:(void (^)(AWSAppConfigConfigurationProfiles *response, NSError *error))completionHandler {
    [[self listConfigurationProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigConfigurationProfiles *> * _Nonnull task) {
        AWSAppConfigConfigurationProfiles *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigDeploymentStrategies *> *)listDeploymentStrategies:(AWSAppConfigListDeploymentStrategiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/deploymentstrategies"
                  targetPrefix:@""
                 operationName:@"ListDeploymentStrategies"
                   outputClass:[AWSAppConfigDeploymentStrategies class]];
}

- (void)listDeploymentStrategies:(AWSAppConfigListDeploymentStrategiesRequest *)request
     completionHandler:(void (^)(AWSAppConfigDeploymentStrategies *response, NSError *error))completionHandler {
    [[self listDeploymentStrategies:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigDeploymentStrategies *> * _Nonnull task) {
        AWSAppConfigDeploymentStrategies *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigDeployments *> *)listDeployments:(AWSAppConfigListDeploymentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments"
                  targetPrefix:@""
                 operationName:@"ListDeployments"
                   outputClass:[AWSAppConfigDeployments class]];
}

- (void)listDeployments:(AWSAppConfigListDeploymentsRequest *)request
     completionHandler:(void (^)(AWSAppConfigDeployments *response, NSError *error))completionHandler {
    [[self listDeployments:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigDeployments *> * _Nonnull task) {
        AWSAppConfigDeployments *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigEnvironments *> *)listEnvironments:(AWSAppConfigListEnvironmentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/environments"
                  targetPrefix:@""
                 operationName:@"ListEnvironments"
                   outputClass:[AWSAppConfigEnvironments class]];
}

- (void)listEnvironments:(AWSAppConfigListEnvironmentsRequest *)request
     completionHandler:(void (^)(AWSAppConfigEnvironments *response, NSError *error))completionHandler {
    [[self listEnvironments:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigEnvironments *> * _Nonnull task) {
        AWSAppConfigEnvironments *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigResourceTags *> *)listTagsForResource:(AWSAppConfigListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSAppConfigResourceTags class]];
}

- (void)listTagsForResource:(AWSAppConfigListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSAppConfigResourceTags *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigResourceTags *> * _Nonnull task) {
        AWSAppConfigResourceTags *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigDeployment *> *)startDeployment:(AWSAppConfigStartDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments"
                  targetPrefix:@""
                 operationName:@"StartDeployment"
                   outputClass:[AWSAppConfigDeployment class]];
}

- (void)startDeployment:(AWSAppConfigStartDeploymentRequest *)request
     completionHandler:(void (^)(AWSAppConfigDeployment *response, NSError *error))completionHandler {
    [[self startDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigDeployment *> * _Nonnull task) {
        AWSAppConfigDeployment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigDeployment *> *)stopDeployment:(AWSAppConfigStopDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}"
                  targetPrefix:@""
                 operationName:@"StopDeployment"
                   outputClass:[AWSAppConfigDeployment class]];
}

- (void)stopDeployment:(AWSAppConfigStopDeploymentRequest *)request
     completionHandler:(void (^)(AWSAppConfigDeployment *response, NSError *error))completionHandler {
    [[self stopDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigDeployment *> * _Nonnull task) {
        AWSAppConfigDeployment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSAppConfigTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSAppConfigTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSAppConfigUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSAppConfigUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigApplication *> *)updateApplication:(AWSAppConfigUpdateApplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/applications/{ApplicationId}"
                  targetPrefix:@""
                 operationName:@"UpdateApplication"
                   outputClass:[AWSAppConfigApplication class]];
}

- (void)updateApplication:(AWSAppConfigUpdateApplicationRequest *)request
     completionHandler:(void (^)(AWSAppConfigApplication *response, NSError *error))completionHandler {
    [[self updateApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigApplication *> * _Nonnull task) {
        AWSAppConfigApplication *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigConfigurationProfile *> *)updateConfigurationProfile:(AWSAppConfigUpdateConfigurationProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
                  targetPrefix:@""
                 operationName:@"UpdateConfigurationProfile"
                   outputClass:[AWSAppConfigConfigurationProfile class]];
}

- (void)updateConfigurationProfile:(AWSAppConfigUpdateConfigurationProfileRequest *)request
     completionHandler:(void (^)(AWSAppConfigConfigurationProfile *response, NSError *error))completionHandler {
    [[self updateConfigurationProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigConfigurationProfile *> * _Nonnull task) {
        AWSAppConfigConfigurationProfile *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigDeploymentStrategy *> *)updateDeploymentStrategy:(AWSAppConfigUpdateDeploymentStrategyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/deploymentstrategies/{DeploymentStrategyId}"
                  targetPrefix:@""
                 operationName:@"UpdateDeploymentStrategy"
                   outputClass:[AWSAppConfigDeploymentStrategy class]];
}

- (void)updateDeploymentStrategy:(AWSAppConfigUpdateDeploymentStrategyRequest *)request
     completionHandler:(void (^)(AWSAppConfigDeploymentStrategy *response, NSError *error))completionHandler {
    [[self updateDeploymentStrategy:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigDeploymentStrategy *> * _Nonnull task) {
        AWSAppConfigDeploymentStrategy *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppConfigEnvironment *> *)updateEnvironment:(AWSAppConfigUpdateEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}"
                  targetPrefix:@""
                 operationName:@"UpdateEnvironment"
                   outputClass:[AWSAppConfigEnvironment class]];
}

- (void)updateEnvironment:(AWSAppConfigUpdateEnvironmentRequest *)request
     completionHandler:(void (^)(AWSAppConfigEnvironment *response, NSError *error))completionHandler {
    [[self updateEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppConfigEnvironment *> * _Nonnull task) {
        AWSAppConfigEnvironment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)validateConfiguration:(AWSAppConfigValidateConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/validators"
                  targetPrefix:@""
                 operationName:@"ValidateConfiguration"
                   outputClass:nil];
}

- (void)validateConfiguration:(AWSAppConfigValidateConfigurationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self validateConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
