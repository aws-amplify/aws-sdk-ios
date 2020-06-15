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

#import "AWSAppconfigService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAppconfigResources.h"

static NSString *const AWSInfoAppconfig = @"Appconfig";
NSString *const AWSAppconfigSDKVersion = @"2.13.4";


@interface AWSAppconfigResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSAppconfigResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSAppconfigErrorBadRequest),
                            @"ConflictException" : @(AWSAppconfigErrorConflict),
                            @"InternalServerException" : @(AWSAppconfigErrorInternalServer),
                            @"PayloadTooLargeException" : @(AWSAppconfigErrorPayloadTooLarge),
                            @"ResourceNotFoundException" : @(AWSAppconfigErrorResourceNotFound),
                            @"ServiceQuotaExceededException" : @(AWSAppconfigErrorServiceQuotaExceeded),
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
                    *error = [NSError errorWithDomain:AWSAppconfigErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSAppconfigErrorDomain
                                                 code:AWSAppconfigErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSAppconfigErrorDomain
                                     code:AWSAppconfigErrorUnknown
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

@interface AWSAppconfigRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAppconfigRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAppconfig()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAppconfig

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAppconfigSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAppconfig versions need to match. Check your SDK installation. AWSCore: %@ AWSAppconfig: %@", AWSiOSSDKVersion, AWSAppconfigSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAppconfig {
    static AWSAppconfig *_defaultAppconfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAppconfig];
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
        _defaultAppconfig = [[AWSAppconfig alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAppconfig;
}

+ (void)registerAppconfigWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAppconfig alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AppconfigForKey:(NSString *)key {
    @synchronized(self) {
        AWSAppconfig *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAppconfig
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAppconfig registerAppconfigWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAppconfigForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAppconfig` or `+ AppconfigForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAppconfig
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAppconfig];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAppconfigRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSAppconfigResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAppconfigResponseSerializer alloc] initWithJSONDefinition:[[AWSAppconfigResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSAppconfigApplication *> *)createApplication:(AWSAppconfigCreateApplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications"
                  targetPrefix:@""
                 operationName:@"CreateApplication"
                   outputClass:[AWSAppconfigApplication class]];
}

- (void)createApplication:(AWSAppconfigCreateApplicationRequest *)request
     completionHandler:(void (^)(AWSAppconfigApplication *response, NSError *error))completionHandler {
    [[self createApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigApplication *> * _Nonnull task) {
        AWSAppconfigApplication *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigConfigurationProfile *> *)createConfigurationProfile:(AWSAppconfigCreateConfigurationProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications/{ApplicationId}/configurationprofiles"
                  targetPrefix:@""
                 operationName:@"CreateConfigurationProfile"
                   outputClass:[AWSAppconfigConfigurationProfile class]];
}

- (void)createConfigurationProfile:(AWSAppconfigCreateConfigurationProfileRequest *)request
     completionHandler:(void (^)(AWSAppconfigConfigurationProfile *response, NSError *error))completionHandler {
    [[self createConfigurationProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigConfigurationProfile *> * _Nonnull task) {
        AWSAppconfigConfigurationProfile *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigDeploymentStrategy *> *)createDeploymentStrategy:(AWSAppconfigCreateDeploymentStrategyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/deploymentstrategies"
                  targetPrefix:@""
                 operationName:@"CreateDeploymentStrategy"
                   outputClass:[AWSAppconfigDeploymentStrategy class]];
}

- (void)createDeploymentStrategy:(AWSAppconfigCreateDeploymentStrategyRequest *)request
     completionHandler:(void (^)(AWSAppconfigDeploymentStrategy *response, NSError *error))completionHandler {
    [[self createDeploymentStrategy:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigDeploymentStrategy *> * _Nonnull task) {
        AWSAppconfigDeploymentStrategy *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigEnvironment *> *)createEnvironment:(AWSAppconfigCreateEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications/{ApplicationId}/environments"
                  targetPrefix:@""
                 operationName:@"CreateEnvironment"
                   outputClass:[AWSAppconfigEnvironment class]];
}

- (void)createEnvironment:(AWSAppconfigCreateEnvironmentRequest *)request
     completionHandler:(void (^)(AWSAppconfigEnvironment *response, NSError *error))completionHandler {
    [[self createEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigEnvironment *> * _Nonnull task) {
        AWSAppconfigEnvironment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigHostedConfigurationVersion *> *)createHostedConfigurationVersion:(AWSAppconfigCreateHostedConfigurationVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions"
                  targetPrefix:@""
                 operationName:@"CreateHostedConfigurationVersion"
                   outputClass:[AWSAppconfigHostedConfigurationVersion class]];
}

- (void)createHostedConfigurationVersion:(AWSAppconfigCreateHostedConfigurationVersionRequest *)request
     completionHandler:(void (^)(AWSAppconfigHostedConfigurationVersion *response, NSError *error))completionHandler {
    [[self createHostedConfigurationVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigHostedConfigurationVersion *> * _Nonnull task) {
        AWSAppconfigHostedConfigurationVersion *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteApplication:(AWSAppconfigDeleteApplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/applications/{ApplicationId}"
                  targetPrefix:@""
                 operationName:@"DeleteApplication"
                   outputClass:nil];
}

- (void)deleteApplication:(AWSAppconfigDeleteApplicationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteApplication:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteConfigurationProfile:(AWSAppconfigDeleteConfigurationProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
                  targetPrefix:@""
                 operationName:@"DeleteConfigurationProfile"
                   outputClass:nil];
}

- (void)deleteConfigurationProfile:(AWSAppconfigDeleteConfigurationProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteConfigurationProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDeploymentStrategy:(AWSAppconfigDeleteDeploymentStrategyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/deployementstrategies/{DeploymentStrategyId}"
                  targetPrefix:@""
                 operationName:@"DeleteDeploymentStrategy"
                   outputClass:nil];
}

- (void)deleteDeploymentStrategy:(AWSAppconfigDeleteDeploymentStrategyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDeploymentStrategy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEnvironment:(AWSAppconfigDeleteEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}"
                  targetPrefix:@""
                 operationName:@"DeleteEnvironment"
                   outputClass:nil];
}

- (void)deleteEnvironment:(AWSAppconfigDeleteEnvironmentRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEnvironment:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteHostedConfigurationVersion:(AWSAppconfigDeleteHostedConfigurationVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions/{VersionNumber}"
                  targetPrefix:@""
                 operationName:@"DeleteHostedConfigurationVersion"
                   outputClass:nil];
}

- (void)deleteHostedConfigurationVersion:(AWSAppconfigDeleteHostedConfigurationVersionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteHostedConfigurationVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigApplication *> *)getApplication:(AWSAppconfigGetApplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}"
                  targetPrefix:@""
                 operationName:@"GetApplication"
                   outputClass:[AWSAppconfigApplication class]];
}

- (void)getApplication:(AWSAppconfigGetApplicationRequest *)request
     completionHandler:(void (^)(AWSAppconfigApplication *response, NSError *error))completionHandler {
    [[self getApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigApplication *> * _Nonnull task) {
        AWSAppconfigApplication *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigConfiguration *> *)getConfiguration:(AWSAppconfigGetConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{Application}/environments/{Environment}/configurations/{Configuration}"
                  targetPrefix:@""
                 operationName:@"GetConfiguration"
                   outputClass:[AWSAppconfigConfiguration class]];
}

- (void)getConfiguration:(AWSAppconfigGetConfigurationRequest *)request
     completionHandler:(void (^)(AWSAppconfigConfiguration *response, NSError *error))completionHandler {
    [[self getConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigConfiguration *> * _Nonnull task) {
        AWSAppconfigConfiguration *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigConfigurationProfile *> *)getConfigurationProfile:(AWSAppconfigGetConfigurationProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
                  targetPrefix:@""
                 operationName:@"GetConfigurationProfile"
                   outputClass:[AWSAppconfigConfigurationProfile class]];
}

- (void)getConfigurationProfile:(AWSAppconfigGetConfigurationProfileRequest *)request
     completionHandler:(void (^)(AWSAppconfigConfigurationProfile *response, NSError *error))completionHandler {
    [[self getConfigurationProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigConfigurationProfile *> * _Nonnull task) {
        AWSAppconfigConfigurationProfile *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigDeployment *> *)getDeployment:(AWSAppconfigGetDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}"
                  targetPrefix:@""
                 operationName:@"GetDeployment"
                   outputClass:[AWSAppconfigDeployment class]];
}

- (void)getDeployment:(AWSAppconfigGetDeploymentRequest *)request
     completionHandler:(void (^)(AWSAppconfigDeployment *response, NSError *error))completionHandler {
    [[self getDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigDeployment *> * _Nonnull task) {
        AWSAppconfigDeployment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigDeploymentStrategy *> *)getDeploymentStrategy:(AWSAppconfigGetDeploymentStrategyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/deploymentstrategies/{DeploymentStrategyId}"
                  targetPrefix:@""
                 operationName:@"GetDeploymentStrategy"
                   outputClass:[AWSAppconfigDeploymentStrategy class]];
}

- (void)getDeploymentStrategy:(AWSAppconfigGetDeploymentStrategyRequest *)request
     completionHandler:(void (^)(AWSAppconfigDeploymentStrategy *response, NSError *error))completionHandler {
    [[self getDeploymentStrategy:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigDeploymentStrategy *> * _Nonnull task) {
        AWSAppconfigDeploymentStrategy *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigEnvironment *> *)getEnvironment:(AWSAppconfigGetEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}"
                  targetPrefix:@""
                 operationName:@"GetEnvironment"
                   outputClass:[AWSAppconfigEnvironment class]];
}

- (void)getEnvironment:(AWSAppconfigGetEnvironmentRequest *)request
     completionHandler:(void (^)(AWSAppconfigEnvironment *response, NSError *error))completionHandler {
    [[self getEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigEnvironment *> * _Nonnull task) {
        AWSAppconfigEnvironment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigHostedConfigurationVersion *> *)getHostedConfigurationVersion:(AWSAppconfigGetHostedConfigurationVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions/{VersionNumber}"
                  targetPrefix:@""
                 operationName:@"GetHostedConfigurationVersion"
                   outputClass:[AWSAppconfigHostedConfigurationVersion class]];
}

- (void)getHostedConfigurationVersion:(AWSAppconfigGetHostedConfigurationVersionRequest *)request
     completionHandler:(void (^)(AWSAppconfigHostedConfigurationVersion *response, NSError *error))completionHandler {
    [[self getHostedConfigurationVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigHostedConfigurationVersion *> * _Nonnull task) {
        AWSAppconfigHostedConfigurationVersion *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigApplications *> *)listApplications:(AWSAppconfigListApplicationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications"
                  targetPrefix:@""
                 operationName:@"ListApplications"
                   outputClass:[AWSAppconfigApplications class]];
}

- (void)listApplications:(AWSAppconfigListApplicationsRequest *)request
     completionHandler:(void (^)(AWSAppconfigApplications *response, NSError *error))completionHandler {
    [[self listApplications:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigApplications *> * _Nonnull task) {
        AWSAppconfigApplications *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigConfigurationProfiles *> *)listConfigurationProfiles:(AWSAppconfigListConfigurationProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/configurationprofiles"
                  targetPrefix:@""
                 operationName:@"ListConfigurationProfiles"
                   outputClass:[AWSAppconfigConfigurationProfiles class]];
}

- (void)listConfigurationProfiles:(AWSAppconfigListConfigurationProfilesRequest *)request
     completionHandler:(void (^)(AWSAppconfigConfigurationProfiles *response, NSError *error))completionHandler {
    [[self listConfigurationProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigConfigurationProfiles *> * _Nonnull task) {
        AWSAppconfigConfigurationProfiles *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigDeploymentStrategies *> *)listDeploymentStrategies:(AWSAppconfigListDeploymentStrategiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/deploymentstrategies"
                  targetPrefix:@""
                 operationName:@"ListDeploymentStrategies"
                   outputClass:[AWSAppconfigDeploymentStrategies class]];
}

- (void)listDeploymentStrategies:(AWSAppconfigListDeploymentStrategiesRequest *)request
     completionHandler:(void (^)(AWSAppconfigDeploymentStrategies *response, NSError *error))completionHandler {
    [[self listDeploymentStrategies:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigDeploymentStrategies *> * _Nonnull task) {
        AWSAppconfigDeploymentStrategies *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigDeployments *> *)listDeployments:(AWSAppconfigListDeploymentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments"
                  targetPrefix:@""
                 operationName:@"ListDeployments"
                   outputClass:[AWSAppconfigDeployments class]];
}

- (void)listDeployments:(AWSAppconfigListDeploymentsRequest *)request
     completionHandler:(void (^)(AWSAppconfigDeployments *response, NSError *error))completionHandler {
    [[self listDeployments:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigDeployments *> * _Nonnull task) {
        AWSAppconfigDeployments *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigEnvironments *> *)listEnvironments:(AWSAppconfigListEnvironmentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/environments"
                  targetPrefix:@""
                 operationName:@"ListEnvironments"
                   outputClass:[AWSAppconfigEnvironments class]];
}

- (void)listEnvironments:(AWSAppconfigListEnvironmentsRequest *)request
     completionHandler:(void (^)(AWSAppconfigEnvironments *response, NSError *error))completionHandler {
    [[self listEnvironments:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigEnvironments *> * _Nonnull task) {
        AWSAppconfigEnvironments *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigHostedConfigurationVersions *> *)listHostedConfigurationVersions:(AWSAppconfigListHostedConfigurationVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/hostedconfigurationversions"
                  targetPrefix:@""
                 operationName:@"ListHostedConfigurationVersions"
                   outputClass:[AWSAppconfigHostedConfigurationVersions class]];
}

- (void)listHostedConfigurationVersions:(AWSAppconfigListHostedConfigurationVersionsRequest *)request
     completionHandler:(void (^)(AWSAppconfigHostedConfigurationVersions *response, NSError *error))completionHandler {
    [[self listHostedConfigurationVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigHostedConfigurationVersions *> * _Nonnull task) {
        AWSAppconfigHostedConfigurationVersions *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigResourceTags *> *)listTagsForResource:(AWSAppconfigListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSAppconfigResourceTags class]];
}

- (void)listTagsForResource:(AWSAppconfigListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSAppconfigResourceTags *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigResourceTags *> * _Nonnull task) {
        AWSAppconfigResourceTags *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigDeployment *> *)startDeployment:(AWSAppconfigStartDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments"
                  targetPrefix:@""
                 operationName:@"StartDeployment"
                   outputClass:[AWSAppconfigDeployment class]];
}

- (void)startDeployment:(AWSAppconfigStartDeploymentRequest *)request
     completionHandler:(void (^)(AWSAppconfigDeployment *response, NSError *error))completionHandler {
    [[self startDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigDeployment *> * _Nonnull task) {
        AWSAppconfigDeployment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigDeployment *> *)stopDeployment:(AWSAppconfigStopDeploymentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}"
                  targetPrefix:@""
                 operationName:@"StopDeployment"
                   outputClass:[AWSAppconfigDeployment class]];
}

- (void)stopDeployment:(AWSAppconfigStopDeploymentRequest *)request
     completionHandler:(void (^)(AWSAppconfigDeployment *response, NSError *error))completionHandler {
    [[self stopDeployment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigDeployment *> * _Nonnull task) {
        AWSAppconfigDeployment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSAppconfigTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSAppconfigTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSAppconfigUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSAppconfigUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigApplication *> *)updateApplication:(AWSAppconfigUpdateApplicationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/applications/{ApplicationId}"
                  targetPrefix:@""
                 operationName:@"UpdateApplication"
                   outputClass:[AWSAppconfigApplication class]];
}

- (void)updateApplication:(AWSAppconfigUpdateApplicationRequest *)request
     completionHandler:(void (^)(AWSAppconfigApplication *response, NSError *error))completionHandler {
    [[self updateApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigApplication *> * _Nonnull task) {
        AWSAppconfigApplication *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigConfigurationProfile *> *)updateConfigurationProfile:(AWSAppconfigUpdateConfigurationProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}"
                  targetPrefix:@""
                 operationName:@"UpdateConfigurationProfile"
                   outputClass:[AWSAppconfigConfigurationProfile class]];
}

- (void)updateConfigurationProfile:(AWSAppconfigUpdateConfigurationProfileRequest *)request
     completionHandler:(void (^)(AWSAppconfigConfigurationProfile *response, NSError *error))completionHandler {
    [[self updateConfigurationProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigConfigurationProfile *> * _Nonnull task) {
        AWSAppconfigConfigurationProfile *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigDeploymentStrategy *> *)updateDeploymentStrategy:(AWSAppconfigUpdateDeploymentStrategyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/deploymentstrategies/{DeploymentStrategyId}"
                  targetPrefix:@""
                 operationName:@"UpdateDeploymentStrategy"
                   outputClass:[AWSAppconfigDeploymentStrategy class]];
}

- (void)updateDeploymentStrategy:(AWSAppconfigUpdateDeploymentStrategyRequest *)request
     completionHandler:(void (^)(AWSAppconfigDeploymentStrategy *response, NSError *error))completionHandler {
    [[self updateDeploymentStrategy:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigDeploymentStrategy *> * _Nonnull task) {
        AWSAppconfigDeploymentStrategy *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppconfigEnvironment *> *)updateEnvironment:(AWSAppconfigUpdateEnvironmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/applications/{ApplicationId}/environments/{EnvironmentId}"
                  targetPrefix:@""
                 operationName:@"UpdateEnvironment"
                   outputClass:[AWSAppconfigEnvironment class]];
}

- (void)updateEnvironment:(AWSAppconfigUpdateEnvironmentRequest *)request
     completionHandler:(void (^)(AWSAppconfigEnvironment *response, NSError *error))completionHandler {
    [[self updateEnvironment:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppconfigEnvironment *> * _Nonnull task) {
        AWSAppconfigEnvironment *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)validateConfiguration:(AWSAppconfigValidateConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/validators"
                  targetPrefix:@""
                 operationName:@"ValidateConfiguration"
                   outputClass:nil];
}

- (void)validateConfiguration:(AWSAppconfigValidateConfigurationRequest *)request
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
