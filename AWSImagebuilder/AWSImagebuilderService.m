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

#import "AWSImagebuilderService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSImagebuilderResources.h"

static NSString *const AWSInfoImagebuilder = @"Imagebuilder";
NSString *const AWSImagebuilderSDKVersion = @"2.13.3";


@interface AWSImagebuilderResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSImagebuilderResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"CallRateLimitExceededException" : @(AWSImagebuilderErrorCallRateLimitExceeded),
                            @"ClientException" : @(AWSImagebuilderErrorClient),
                            @"ForbiddenException" : @(AWSImagebuilderErrorForbidden),
                            @"IdempotentParameterMismatchException" : @(AWSImagebuilderErrorIdempotentParameterMismatch),
                            @"InvalidPaginationTokenException" : @(AWSImagebuilderErrorInvalidPaginationToken),
                            @"InvalidParameterException" : @(AWSImagebuilderErrorInvalidParameter),
                            @"InvalidParameterCombinationException" : @(AWSImagebuilderErrorInvalidParameterCombination),
                            @"InvalidParameterValueException" : @(AWSImagebuilderErrorInvalidParameterValue),
                            @"InvalidRequestException" : @(AWSImagebuilderErrorInvalidRequest),
                            @"InvalidVersionNumberException" : @(AWSImagebuilderErrorInvalidVersionNumber),
                            @"ResourceAlreadyExistsException" : @(AWSImagebuilderErrorResourceAlreadyExists),
                            @"ResourceDependencyException" : @(AWSImagebuilderErrorResourceDependency),
                            @"ResourceInUseException" : @(AWSImagebuilderErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSImagebuilderErrorResourceNotFound),
                            @"ServiceException" : @(AWSImagebuilderErrorService),
                            @"ServiceUnavailableException" : @(AWSImagebuilderErrorServiceUnavailable),
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
                    *error = [NSError errorWithDomain:AWSImagebuilderErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSImagebuilderErrorDomain
                                                 code:AWSImagebuilderErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSImagebuilderErrorDomain
                                     code:AWSImagebuilderErrorUnknown
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

@interface AWSImagebuilderRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSImagebuilderRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSImagebuilder()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSImagebuilder

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSImagebuilderSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSImagebuilder versions need to match. Check your SDK installation. AWSCore: %@ AWSImagebuilder: %@", AWSiOSSDKVersion, AWSImagebuilderSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultImagebuilder {
    static AWSImagebuilder *_defaultImagebuilder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoImagebuilder];
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
        _defaultImagebuilder = [[AWSImagebuilder alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultImagebuilder;
}

+ (void)registerImagebuilderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSImagebuilder alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ImagebuilderForKey:(NSString *)key {
    @synchronized(self) {
        AWSImagebuilder *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoImagebuilder
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSImagebuilder registerImagebuilderWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeImagebuilderForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultImagebuilder` or `+ ImagebuilderForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceImagebuilder
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceImagebuilder];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSImagebuilderRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSImagebuilderResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSImagebuilderResponseSerializer alloc] initWithJSONDefinition:[[AWSImagebuilderResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSImagebuilderCancelImageCreationResponse *> *)cancelImageCreation:(AWSImagebuilderCancelImageCreationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CancelImageCreation"
                  targetPrefix:@""
                 operationName:@"CancelImageCreation"
                   outputClass:[AWSImagebuilderCancelImageCreationResponse class]];
}

- (void)cancelImageCreation:(AWSImagebuilderCancelImageCreationRequest *)request
     completionHandler:(void (^)(AWSImagebuilderCancelImageCreationResponse *response, NSError *error))completionHandler {
    [[self cancelImageCreation:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderCancelImageCreationResponse *> * _Nonnull task) {
        AWSImagebuilderCancelImageCreationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderCreateComponentResponse *> *)createComponent:(AWSImagebuilderCreateComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateComponent"
                  targetPrefix:@""
                 operationName:@"CreateComponent"
                   outputClass:[AWSImagebuilderCreateComponentResponse class]];
}

- (void)createComponent:(AWSImagebuilderCreateComponentRequest *)request
     completionHandler:(void (^)(AWSImagebuilderCreateComponentResponse *response, NSError *error))completionHandler {
    [[self createComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderCreateComponentResponse *> * _Nonnull task) {
        AWSImagebuilderCreateComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderCreateDistributionConfigurationResponse *> *)createDistributionConfiguration:(AWSImagebuilderCreateDistributionConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateDistributionConfiguration"
                  targetPrefix:@""
                 operationName:@"CreateDistributionConfiguration"
                   outputClass:[AWSImagebuilderCreateDistributionConfigurationResponse class]];
}

- (void)createDistributionConfiguration:(AWSImagebuilderCreateDistributionConfigurationRequest *)request
     completionHandler:(void (^)(AWSImagebuilderCreateDistributionConfigurationResponse *response, NSError *error))completionHandler {
    [[self createDistributionConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderCreateDistributionConfigurationResponse *> * _Nonnull task) {
        AWSImagebuilderCreateDistributionConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderCreateImageResponse *> *)createImage:(AWSImagebuilderCreateImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateImage"
                  targetPrefix:@""
                 operationName:@"CreateImage"
                   outputClass:[AWSImagebuilderCreateImageResponse class]];
}

- (void)createImage:(AWSImagebuilderCreateImageRequest *)request
     completionHandler:(void (^)(AWSImagebuilderCreateImageResponse *response, NSError *error))completionHandler {
    [[self createImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderCreateImageResponse *> * _Nonnull task) {
        AWSImagebuilderCreateImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderCreateImagePipelineResponse *> *)createImagePipeline:(AWSImagebuilderCreateImagePipelineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateImagePipeline"
                  targetPrefix:@""
                 operationName:@"CreateImagePipeline"
                   outputClass:[AWSImagebuilderCreateImagePipelineResponse class]];
}

- (void)createImagePipeline:(AWSImagebuilderCreateImagePipelineRequest *)request
     completionHandler:(void (^)(AWSImagebuilderCreateImagePipelineResponse *response, NSError *error))completionHandler {
    [[self createImagePipeline:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderCreateImagePipelineResponse *> * _Nonnull task) {
        AWSImagebuilderCreateImagePipelineResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderCreateImageRecipeResponse *> *)createImageRecipe:(AWSImagebuilderCreateImageRecipeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateImageRecipe"
                  targetPrefix:@""
                 operationName:@"CreateImageRecipe"
                   outputClass:[AWSImagebuilderCreateImageRecipeResponse class]];
}

- (void)createImageRecipe:(AWSImagebuilderCreateImageRecipeRequest *)request
     completionHandler:(void (^)(AWSImagebuilderCreateImageRecipeResponse *response, NSError *error))completionHandler {
    [[self createImageRecipe:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderCreateImageRecipeResponse *> * _Nonnull task) {
        AWSImagebuilderCreateImageRecipeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderCreateInfrastructureConfigurationResponse *> *)createInfrastructureConfiguration:(AWSImagebuilderCreateInfrastructureConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateInfrastructureConfiguration"
                  targetPrefix:@""
                 operationName:@"CreateInfrastructureConfiguration"
                   outputClass:[AWSImagebuilderCreateInfrastructureConfigurationResponse class]];
}

- (void)createInfrastructureConfiguration:(AWSImagebuilderCreateInfrastructureConfigurationRequest *)request
     completionHandler:(void (^)(AWSImagebuilderCreateInfrastructureConfigurationResponse *response, NSError *error))completionHandler {
    [[self createInfrastructureConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderCreateInfrastructureConfigurationResponse *> * _Nonnull task) {
        AWSImagebuilderCreateInfrastructureConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderDeleteComponentResponse *> *)deleteComponent:(AWSImagebuilderDeleteComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteComponent"
                  targetPrefix:@""
                 operationName:@"DeleteComponent"
                   outputClass:[AWSImagebuilderDeleteComponentResponse class]];
}

- (void)deleteComponent:(AWSImagebuilderDeleteComponentRequest *)request
     completionHandler:(void (^)(AWSImagebuilderDeleteComponentResponse *response, NSError *error))completionHandler {
    [[self deleteComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderDeleteComponentResponse *> * _Nonnull task) {
        AWSImagebuilderDeleteComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderDeleteDistributionConfigurationResponse *> *)deleteDistributionConfiguration:(AWSImagebuilderDeleteDistributionConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteDistributionConfiguration"
                  targetPrefix:@""
                 operationName:@"DeleteDistributionConfiguration"
                   outputClass:[AWSImagebuilderDeleteDistributionConfigurationResponse class]];
}

- (void)deleteDistributionConfiguration:(AWSImagebuilderDeleteDistributionConfigurationRequest *)request
     completionHandler:(void (^)(AWSImagebuilderDeleteDistributionConfigurationResponse *response, NSError *error))completionHandler {
    [[self deleteDistributionConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderDeleteDistributionConfigurationResponse *> * _Nonnull task) {
        AWSImagebuilderDeleteDistributionConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderDeleteImageResponse *> *)deleteImage:(AWSImagebuilderDeleteImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteImage"
                  targetPrefix:@""
                 operationName:@"DeleteImage"
                   outputClass:[AWSImagebuilderDeleteImageResponse class]];
}

- (void)deleteImage:(AWSImagebuilderDeleteImageRequest *)request
     completionHandler:(void (^)(AWSImagebuilderDeleteImageResponse *response, NSError *error))completionHandler {
    [[self deleteImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderDeleteImageResponse *> * _Nonnull task) {
        AWSImagebuilderDeleteImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderDeleteImagePipelineResponse *> *)deleteImagePipeline:(AWSImagebuilderDeleteImagePipelineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteImagePipeline"
                  targetPrefix:@""
                 operationName:@"DeleteImagePipeline"
                   outputClass:[AWSImagebuilderDeleteImagePipelineResponse class]];
}

- (void)deleteImagePipeline:(AWSImagebuilderDeleteImagePipelineRequest *)request
     completionHandler:(void (^)(AWSImagebuilderDeleteImagePipelineResponse *response, NSError *error))completionHandler {
    [[self deleteImagePipeline:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderDeleteImagePipelineResponse *> * _Nonnull task) {
        AWSImagebuilderDeleteImagePipelineResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderDeleteImageRecipeResponse *> *)deleteImageRecipe:(AWSImagebuilderDeleteImageRecipeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteImageRecipe"
                  targetPrefix:@""
                 operationName:@"DeleteImageRecipe"
                   outputClass:[AWSImagebuilderDeleteImageRecipeResponse class]];
}

- (void)deleteImageRecipe:(AWSImagebuilderDeleteImageRecipeRequest *)request
     completionHandler:(void (^)(AWSImagebuilderDeleteImageRecipeResponse *response, NSError *error))completionHandler {
    [[self deleteImageRecipe:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderDeleteImageRecipeResponse *> * _Nonnull task) {
        AWSImagebuilderDeleteImageRecipeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderDeleteInfrastructureConfigurationResponse *> *)deleteInfrastructureConfiguration:(AWSImagebuilderDeleteInfrastructureConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteInfrastructureConfiguration"
                  targetPrefix:@""
                 operationName:@"DeleteInfrastructureConfiguration"
                   outputClass:[AWSImagebuilderDeleteInfrastructureConfigurationResponse class]];
}

- (void)deleteInfrastructureConfiguration:(AWSImagebuilderDeleteInfrastructureConfigurationRequest *)request
     completionHandler:(void (^)(AWSImagebuilderDeleteInfrastructureConfigurationResponse *response, NSError *error))completionHandler {
    [[self deleteInfrastructureConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderDeleteInfrastructureConfigurationResponse *> * _Nonnull task) {
        AWSImagebuilderDeleteInfrastructureConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderGetComponentResponse *> *)getComponent:(AWSImagebuilderGetComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetComponent"
                  targetPrefix:@""
                 operationName:@"GetComponent"
                   outputClass:[AWSImagebuilderGetComponentResponse class]];
}

- (void)getComponent:(AWSImagebuilderGetComponentRequest *)request
     completionHandler:(void (^)(AWSImagebuilderGetComponentResponse *response, NSError *error))completionHandler {
    [[self getComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderGetComponentResponse *> * _Nonnull task) {
        AWSImagebuilderGetComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderGetComponentPolicyResponse *> *)getComponentPolicy:(AWSImagebuilderGetComponentPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetComponentPolicy"
                  targetPrefix:@""
                 operationName:@"GetComponentPolicy"
                   outputClass:[AWSImagebuilderGetComponentPolicyResponse class]];
}

- (void)getComponentPolicy:(AWSImagebuilderGetComponentPolicyRequest *)request
     completionHandler:(void (^)(AWSImagebuilderGetComponentPolicyResponse *response, NSError *error))completionHandler {
    [[self getComponentPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderGetComponentPolicyResponse *> * _Nonnull task) {
        AWSImagebuilderGetComponentPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderGetDistributionConfigurationResponse *> *)getDistributionConfiguration:(AWSImagebuilderGetDistributionConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetDistributionConfiguration"
                  targetPrefix:@""
                 operationName:@"GetDistributionConfiguration"
                   outputClass:[AWSImagebuilderGetDistributionConfigurationResponse class]];
}

- (void)getDistributionConfiguration:(AWSImagebuilderGetDistributionConfigurationRequest *)request
     completionHandler:(void (^)(AWSImagebuilderGetDistributionConfigurationResponse *response, NSError *error))completionHandler {
    [[self getDistributionConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderGetDistributionConfigurationResponse *> * _Nonnull task) {
        AWSImagebuilderGetDistributionConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderGetImageResponse *> *)getImage:(AWSImagebuilderGetImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetImage"
                  targetPrefix:@""
                 operationName:@"GetImage"
                   outputClass:[AWSImagebuilderGetImageResponse class]];
}

- (void)getImage:(AWSImagebuilderGetImageRequest *)request
     completionHandler:(void (^)(AWSImagebuilderGetImageResponse *response, NSError *error))completionHandler {
    [[self getImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderGetImageResponse *> * _Nonnull task) {
        AWSImagebuilderGetImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderGetImagePipelineResponse *> *)getImagePipeline:(AWSImagebuilderGetImagePipelineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetImagePipeline"
                  targetPrefix:@""
                 operationName:@"GetImagePipeline"
                   outputClass:[AWSImagebuilderGetImagePipelineResponse class]];
}

- (void)getImagePipeline:(AWSImagebuilderGetImagePipelineRequest *)request
     completionHandler:(void (^)(AWSImagebuilderGetImagePipelineResponse *response, NSError *error))completionHandler {
    [[self getImagePipeline:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderGetImagePipelineResponse *> * _Nonnull task) {
        AWSImagebuilderGetImagePipelineResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderGetImagePolicyResponse *> *)getImagePolicy:(AWSImagebuilderGetImagePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetImagePolicy"
                  targetPrefix:@""
                 operationName:@"GetImagePolicy"
                   outputClass:[AWSImagebuilderGetImagePolicyResponse class]];
}

- (void)getImagePolicy:(AWSImagebuilderGetImagePolicyRequest *)request
     completionHandler:(void (^)(AWSImagebuilderGetImagePolicyResponse *response, NSError *error))completionHandler {
    [[self getImagePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderGetImagePolicyResponse *> * _Nonnull task) {
        AWSImagebuilderGetImagePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderGetImageRecipeResponse *> *)getImageRecipe:(AWSImagebuilderGetImageRecipeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetImageRecipe"
                  targetPrefix:@""
                 operationName:@"GetImageRecipe"
                   outputClass:[AWSImagebuilderGetImageRecipeResponse class]];
}

- (void)getImageRecipe:(AWSImagebuilderGetImageRecipeRequest *)request
     completionHandler:(void (^)(AWSImagebuilderGetImageRecipeResponse *response, NSError *error))completionHandler {
    [[self getImageRecipe:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderGetImageRecipeResponse *> * _Nonnull task) {
        AWSImagebuilderGetImageRecipeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderGetImageRecipePolicyResponse *> *)getImageRecipePolicy:(AWSImagebuilderGetImageRecipePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetImageRecipePolicy"
                  targetPrefix:@""
                 operationName:@"GetImageRecipePolicy"
                   outputClass:[AWSImagebuilderGetImageRecipePolicyResponse class]];
}

- (void)getImageRecipePolicy:(AWSImagebuilderGetImageRecipePolicyRequest *)request
     completionHandler:(void (^)(AWSImagebuilderGetImageRecipePolicyResponse *response, NSError *error))completionHandler {
    [[self getImageRecipePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderGetImageRecipePolicyResponse *> * _Nonnull task) {
        AWSImagebuilderGetImageRecipePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderGetInfrastructureConfigurationResponse *> *)getInfrastructureConfiguration:(AWSImagebuilderGetInfrastructureConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetInfrastructureConfiguration"
                  targetPrefix:@""
                 operationName:@"GetInfrastructureConfiguration"
                   outputClass:[AWSImagebuilderGetInfrastructureConfigurationResponse class]];
}

- (void)getInfrastructureConfiguration:(AWSImagebuilderGetInfrastructureConfigurationRequest *)request
     completionHandler:(void (^)(AWSImagebuilderGetInfrastructureConfigurationResponse *response, NSError *error))completionHandler {
    [[self getInfrastructureConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderGetInfrastructureConfigurationResponse *> * _Nonnull task) {
        AWSImagebuilderGetInfrastructureConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderImportComponentResponse *> *)importComponent:(AWSImagebuilderImportComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/ImportComponent"
                  targetPrefix:@""
                 operationName:@"ImportComponent"
                   outputClass:[AWSImagebuilderImportComponentResponse class]];
}

- (void)importComponent:(AWSImagebuilderImportComponentRequest *)request
     completionHandler:(void (^)(AWSImagebuilderImportComponentResponse *response, NSError *error))completionHandler {
    [[self importComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderImportComponentResponse *> * _Nonnull task) {
        AWSImagebuilderImportComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderListComponentBuildVersionsResponse *> *)listComponentBuildVersions:(AWSImagebuilderListComponentBuildVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListComponentBuildVersions"
                  targetPrefix:@""
                 operationName:@"ListComponentBuildVersions"
                   outputClass:[AWSImagebuilderListComponentBuildVersionsResponse class]];
}

- (void)listComponentBuildVersions:(AWSImagebuilderListComponentBuildVersionsRequest *)request
     completionHandler:(void (^)(AWSImagebuilderListComponentBuildVersionsResponse *response, NSError *error))completionHandler {
    [[self listComponentBuildVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderListComponentBuildVersionsResponse *> * _Nonnull task) {
        AWSImagebuilderListComponentBuildVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderListComponentsResponse *> *)listComponents:(AWSImagebuilderListComponentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListComponents"
                  targetPrefix:@""
                 operationName:@"ListComponents"
                   outputClass:[AWSImagebuilderListComponentsResponse class]];
}

- (void)listComponents:(AWSImagebuilderListComponentsRequest *)request
     completionHandler:(void (^)(AWSImagebuilderListComponentsResponse *response, NSError *error))completionHandler {
    [[self listComponents:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderListComponentsResponse *> * _Nonnull task) {
        AWSImagebuilderListComponentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderListDistributionConfigurationsResponse *> *)listDistributionConfigurations:(AWSImagebuilderListDistributionConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListDistributionConfigurations"
                  targetPrefix:@""
                 operationName:@"ListDistributionConfigurations"
                   outputClass:[AWSImagebuilderListDistributionConfigurationsResponse class]];
}

- (void)listDistributionConfigurations:(AWSImagebuilderListDistributionConfigurationsRequest *)request
     completionHandler:(void (^)(AWSImagebuilderListDistributionConfigurationsResponse *response, NSError *error))completionHandler {
    [[self listDistributionConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderListDistributionConfigurationsResponse *> * _Nonnull task) {
        AWSImagebuilderListDistributionConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderListImageBuildVersionsResponse *> *)listImageBuildVersions:(AWSImagebuilderListImageBuildVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListImageBuildVersions"
                  targetPrefix:@""
                 operationName:@"ListImageBuildVersions"
                   outputClass:[AWSImagebuilderListImageBuildVersionsResponse class]];
}

- (void)listImageBuildVersions:(AWSImagebuilderListImageBuildVersionsRequest *)request
     completionHandler:(void (^)(AWSImagebuilderListImageBuildVersionsResponse *response, NSError *error))completionHandler {
    [[self listImageBuildVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderListImageBuildVersionsResponse *> * _Nonnull task) {
        AWSImagebuilderListImageBuildVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderListImagePipelineImagesResponse *> *)listImagePipelineImages:(AWSImagebuilderListImagePipelineImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListImagePipelineImages"
                  targetPrefix:@""
                 operationName:@"ListImagePipelineImages"
                   outputClass:[AWSImagebuilderListImagePipelineImagesResponse class]];
}

- (void)listImagePipelineImages:(AWSImagebuilderListImagePipelineImagesRequest *)request
     completionHandler:(void (^)(AWSImagebuilderListImagePipelineImagesResponse *response, NSError *error))completionHandler {
    [[self listImagePipelineImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderListImagePipelineImagesResponse *> * _Nonnull task) {
        AWSImagebuilderListImagePipelineImagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderListImagePipelinesResponse *> *)listImagePipelines:(AWSImagebuilderListImagePipelinesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListImagePipelines"
                  targetPrefix:@""
                 operationName:@"ListImagePipelines"
                   outputClass:[AWSImagebuilderListImagePipelinesResponse class]];
}

- (void)listImagePipelines:(AWSImagebuilderListImagePipelinesRequest *)request
     completionHandler:(void (^)(AWSImagebuilderListImagePipelinesResponse *response, NSError *error))completionHandler {
    [[self listImagePipelines:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderListImagePipelinesResponse *> * _Nonnull task) {
        AWSImagebuilderListImagePipelinesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderListImageRecipesResponse *> *)listImageRecipes:(AWSImagebuilderListImageRecipesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListImageRecipes"
                  targetPrefix:@""
                 operationName:@"ListImageRecipes"
                   outputClass:[AWSImagebuilderListImageRecipesResponse class]];
}

- (void)listImageRecipes:(AWSImagebuilderListImageRecipesRequest *)request
     completionHandler:(void (^)(AWSImagebuilderListImageRecipesResponse *response, NSError *error))completionHandler {
    [[self listImageRecipes:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderListImageRecipesResponse *> * _Nonnull task) {
        AWSImagebuilderListImageRecipesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderListImagesResponse *> *)listImages:(AWSImagebuilderListImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListImages"
                  targetPrefix:@""
                 operationName:@"ListImages"
                   outputClass:[AWSImagebuilderListImagesResponse class]];
}

- (void)listImages:(AWSImagebuilderListImagesRequest *)request
     completionHandler:(void (^)(AWSImagebuilderListImagesResponse *response, NSError *error))completionHandler {
    [[self listImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderListImagesResponse *> * _Nonnull task) {
        AWSImagebuilderListImagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderListInfrastructureConfigurationsResponse *> *)listInfrastructureConfigurations:(AWSImagebuilderListInfrastructureConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListInfrastructureConfigurations"
                  targetPrefix:@""
                 operationName:@"ListInfrastructureConfigurations"
                   outputClass:[AWSImagebuilderListInfrastructureConfigurationsResponse class]];
}

- (void)listInfrastructureConfigurations:(AWSImagebuilderListInfrastructureConfigurationsRequest *)request
     completionHandler:(void (^)(AWSImagebuilderListInfrastructureConfigurationsResponse *response, NSError *error))completionHandler {
    [[self listInfrastructureConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderListInfrastructureConfigurationsResponse *> * _Nonnull task) {
        AWSImagebuilderListInfrastructureConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderListTagsForResourceResponse *> *)listTagsForResource:(AWSImagebuilderListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSImagebuilderListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSImagebuilderListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSImagebuilderListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderListTagsForResourceResponse *> * _Nonnull task) {
        AWSImagebuilderListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderPutComponentPolicyResponse *> *)putComponentPolicy:(AWSImagebuilderPutComponentPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/PutComponentPolicy"
                  targetPrefix:@""
                 operationName:@"PutComponentPolicy"
                   outputClass:[AWSImagebuilderPutComponentPolicyResponse class]];
}

- (void)putComponentPolicy:(AWSImagebuilderPutComponentPolicyRequest *)request
     completionHandler:(void (^)(AWSImagebuilderPutComponentPolicyResponse *response, NSError *error))completionHandler {
    [[self putComponentPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderPutComponentPolicyResponse *> * _Nonnull task) {
        AWSImagebuilderPutComponentPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderPutImagePolicyResponse *> *)putImagePolicy:(AWSImagebuilderPutImagePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/PutImagePolicy"
                  targetPrefix:@""
                 operationName:@"PutImagePolicy"
                   outputClass:[AWSImagebuilderPutImagePolicyResponse class]];
}

- (void)putImagePolicy:(AWSImagebuilderPutImagePolicyRequest *)request
     completionHandler:(void (^)(AWSImagebuilderPutImagePolicyResponse *response, NSError *error))completionHandler {
    [[self putImagePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderPutImagePolicyResponse *> * _Nonnull task) {
        AWSImagebuilderPutImagePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderPutImageRecipePolicyResponse *> *)putImageRecipePolicy:(AWSImagebuilderPutImageRecipePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/PutImageRecipePolicy"
                  targetPrefix:@""
                 operationName:@"PutImageRecipePolicy"
                   outputClass:[AWSImagebuilderPutImageRecipePolicyResponse class]];
}

- (void)putImageRecipePolicy:(AWSImagebuilderPutImageRecipePolicyRequest *)request
     completionHandler:(void (^)(AWSImagebuilderPutImageRecipePolicyResponse *response, NSError *error))completionHandler {
    [[self putImageRecipePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderPutImageRecipePolicyResponse *> * _Nonnull task) {
        AWSImagebuilderPutImageRecipePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderStartImagePipelineExecutionResponse *> *)startImagePipelineExecution:(AWSImagebuilderStartImagePipelineExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/StartImagePipelineExecution"
                  targetPrefix:@""
                 operationName:@"StartImagePipelineExecution"
                   outputClass:[AWSImagebuilderStartImagePipelineExecutionResponse class]];
}

- (void)startImagePipelineExecution:(AWSImagebuilderStartImagePipelineExecutionRequest *)request
     completionHandler:(void (^)(AWSImagebuilderStartImagePipelineExecutionResponse *response, NSError *error))completionHandler {
    [[self startImagePipelineExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderStartImagePipelineExecutionResponse *> * _Nonnull task) {
        AWSImagebuilderStartImagePipelineExecutionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderTagResourceResponse *> *)tagResource:(AWSImagebuilderTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSImagebuilderTagResourceResponse class]];
}

- (void)tagResource:(AWSImagebuilderTagResourceRequest *)request
     completionHandler:(void (^)(AWSImagebuilderTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderTagResourceResponse *> * _Nonnull task) {
        AWSImagebuilderTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderUntagResourceResponse *> *)untagResource:(AWSImagebuilderUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSImagebuilderUntagResourceResponse class]];
}

- (void)untagResource:(AWSImagebuilderUntagResourceRequest *)request
     completionHandler:(void (^)(AWSImagebuilderUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderUntagResourceResponse *> * _Nonnull task) {
        AWSImagebuilderUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderUpdateDistributionConfigurationResponse *> *)updateDistributionConfiguration:(AWSImagebuilderUpdateDistributionConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/UpdateDistributionConfiguration"
                  targetPrefix:@""
                 operationName:@"UpdateDistributionConfiguration"
                   outputClass:[AWSImagebuilderUpdateDistributionConfigurationResponse class]];
}

- (void)updateDistributionConfiguration:(AWSImagebuilderUpdateDistributionConfigurationRequest *)request
     completionHandler:(void (^)(AWSImagebuilderUpdateDistributionConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateDistributionConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderUpdateDistributionConfigurationResponse *> * _Nonnull task) {
        AWSImagebuilderUpdateDistributionConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderUpdateImagePipelineResponse *> *)updateImagePipeline:(AWSImagebuilderUpdateImagePipelineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/UpdateImagePipeline"
                  targetPrefix:@""
                 operationName:@"UpdateImagePipeline"
                   outputClass:[AWSImagebuilderUpdateImagePipelineResponse class]];
}

- (void)updateImagePipeline:(AWSImagebuilderUpdateImagePipelineRequest *)request
     completionHandler:(void (^)(AWSImagebuilderUpdateImagePipelineResponse *response, NSError *error))completionHandler {
    [[self updateImagePipeline:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderUpdateImagePipelineResponse *> * _Nonnull task) {
        AWSImagebuilderUpdateImagePipelineResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSImagebuilderUpdateInfrastructureConfigurationResponse *> *)updateInfrastructureConfiguration:(AWSImagebuilderUpdateInfrastructureConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/UpdateInfrastructureConfiguration"
                  targetPrefix:@""
                 operationName:@"UpdateInfrastructureConfiguration"
                   outputClass:[AWSImagebuilderUpdateInfrastructureConfigurationResponse class]];
}

- (void)updateInfrastructureConfiguration:(AWSImagebuilderUpdateInfrastructureConfigurationRequest *)request
     completionHandler:(void (^)(AWSImagebuilderUpdateInfrastructureConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateInfrastructureConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSImagebuilderUpdateInfrastructureConfigurationResponse *> * _Nonnull task) {
        AWSImagebuilderUpdateInfrastructureConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
