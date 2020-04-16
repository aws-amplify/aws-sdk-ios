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

#import "AWSimagebuilderService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSimagebuilderResources.h"

static NSString *const AWSInfoimagebuilder = @"imagebuilder";
NSString *const AWSimagebuilderSDKVersion = @"2.13.2";


@interface AWSimagebuilderResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSimagebuilderResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"CallRateLimitExceededException" : @(AWSimagebuilderErrorCallRateLimitExceeded),
                            @"ClientException" : @(AWSimagebuilderErrorClient),
                            @"ForbiddenException" : @(AWSimagebuilderErrorForbidden),
                            @"IdempotentParameterMismatchException" : @(AWSimagebuilderErrorIdempotentParameterMismatch),
                            @"InvalidPaginationTokenException" : @(AWSimagebuilderErrorInvalidPaginationToken),
                            @"InvalidParameterException" : @(AWSimagebuilderErrorInvalidParameter),
                            @"InvalidParameterCombinationException" : @(AWSimagebuilderErrorInvalidParameterCombination),
                            @"InvalidParameterValueException" : @(AWSimagebuilderErrorInvalidParameterValue),
                            @"InvalidRequestException" : @(AWSimagebuilderErrorInvalidRequest),
                            @"InvalidVersionNumberException" : @(AWSimagebuilderErrorInvalidVersionNumber),
                            @"ResourceAlreadyExistsException" : @(AWSimagebuilderErrorResourceAlreadyExists),
                            @"ResourceDependencyException" : @(AWSimagebuilderErrorResourceDependency),
                            @"ResourceInUseException" : @(AWSimagebuilderErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSimagebuilderErrorResourceNotFound),
                            @"ServiceException" : @(AWSimagebuilderErrorService),
                            @"ServiceUnavailableException" : @(AWSimagebuilderErrorServiceUnavailable),
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
                    *error = [NSError errorWithDomain:AWSimagebuilderErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSimagebuilderErrorDomain
                                                 code:AWSimagebuilderErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSimagebuilderErrorDomain
                                     code:AWSimagebuilderErrorUnknown
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

@interface AWSimagebuilderRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSimagebuilderRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSimagebuilder()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSimagebuilder

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSimagebuilderSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSimagebuilder versions need to match. Check your SDK installation. AWSCore: %@ AWSimagebuilder: %@", AWSiOSSDKVersion, AWSimagebuilderSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultimagebuilder {
    static AWSimagebuilder *_defaultimagebuilder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoimagebuilder];
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
        _defaultimagebuilder = [[AWSimagebuilder alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultimagebuilder;
}

+ (void)registerimagebuilderWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSimagebuilder alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)imagebuilderForKey:(NSString *)key {
    @synchronized(self) {
        AWSimagebuilder *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoimagebuilder
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSimagebuilder registerimagebuilderWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeimagebuilderForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultimagebuilder` or `+ imagebuilderForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceimagebuilder
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceimagebuilder];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSimagebuilderRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSimagebuilderResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSimagebuilderResponseSerializer alloc] initWithJSONDefinition:[[AWSimagebuilderResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSimagebuilderCancelImageCreationResponse *> *)cancelImageCreation:(AWSimagebuilderCancelImageCreationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CancelImageCreation"
                  targetPrefix:@""
                 operationName:@"CancelImageCreation"
                   outputClass:[AWSimagebuilderCancelImageCreationResponse class]];
}

- (void)cancelImageCreation:(AWSimagebuilderCancelImageCreationRequest *)request
     completionHandler:(void (^)(AWSimagebuilderCancelImageCreationResponse *response, NSError *error))completionHandler {
    [[self cancelImageCreation:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderCancelImageCreationResponse *> * _Nonnull task) {
        AWSimagebuilderCancelImageCreationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderCreateComponentResponse *> *)createComponent:(AWSimagebuilderCreateComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateComponent"
                  targetPrefix:@""
                 operationName:@"CreateComponent"
                   outputClass:[AWSimagebuilderCreateComponentResponse class]];
}

- (void)createComponent:(AWSimagebuilderCreateComponentRequest *)request
     completionHandler:(void (^)(AWSimagebuilderCreateComponentResponse *response, NSError *error))completionHandler {
    [[self createComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderCreateComponentResponse *> * _Nonnull task) {
        AWSimagebuilderCreateComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderCreateDistributionConfigurationResponse *> *)createDistributionConfiguration:(AWSimagebuilderCreateDistributionConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateDistributionConfiguration"
                  targetPrefix:@""
                 operationName:@"CreateDistributionConfiguration"
                   outputClass:[AWSimagebuilderCreateDistributionConfigurationResponse class]];
}

- (void)createDistributionConfiguration:(AWSimagebuilderCreateDistributionConfigurationRequest *)request
     completionHandler:(void (^)(AWSimagebuilderCreateDistributionConfigurationResponse *response, NSError *error))completionHandler {
    [[self createDistributionConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderCreateDistributionConfigurationResponse *> * _Nonnull task) {
        AWSimagebuilderCreateDistributionConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderCreateImageResponse *> *)createImage:(AWSimagebuilderCreateImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateImage"
                  targetPrefix:@""
                 operationName:@"CreateImage"
                   outputClass:[AWSimagebuilderCreateImageResponse class]];
}

- (void)createImage:(AWSimagebuilderCreateImageRequest *)request
     completionHandler:(void (^)(AWSimagebuilderCreateImageResponse *response, NSError *error))completionHandler {
    [[self createImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderCreateImageResponse *> * _Nonnull task) {
        AWSimagebuilderCreateImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderCreateImagePipelineResponse *> *)createImagePipeline:(AWSimagebuilderCreateImagePipelineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateImagePipeline"
                  targetPrefix:@""
                 operationName:@"CreateImagePipeline"
                   outputClass:[AWSimagebuilderCreateImagePipelineResponse class]];
}

- (void)createImagePipeline:(AWSimagebuilderCreateImagePipelineRequest *)request
     completionHandler:(void (^)(AWSimagebuilderCreateImagePipelineResponse *response, NSError *error))completionHandler {
    [[self createImagePipeline:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderCreateImagePipelineResponse *> * _Nonnull task) {
        AWSimagebuilderCreateImagePipelineResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderCreateImageRecipeResponse *> *)createImageRecipe:(AWSimagebuilderCreateImageRecipeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateImageRecipe"
                  targetPrefix:@""
                 operationName:@"CreateImageRecipe"
                   outputClass:[AWSimagebuilderCreateImageRecipeResponse class]];
}

- (void)createImageRecipe:(AWSimagebuilderCreateImageRecipeRequest *)request
     completionHandler:(void (^)(AWSimagebuilderCreateImageRecipeResponse *response, NSError *error))completionHandler {
    [[self createImageRecipe:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderCreateImageRecipeResponse *> * _Nonnull task) {
        AWSimagebuilderCreateImageRecipeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderCreateInfrastructureConfigurationResponse *> *)createInfrastructureConfiguration:(AWSimagebuilderCreateInfrastructureConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/CreateInfrastructureConfiguration"
                  targetPrefix:@""
                 operationName:@"CreateInfrastructureConfiguration"
                   outputClass:[AWSimagebuilderCreateInfrastructureConfigurationResponse class]];
}

- (void)createInfrastructureConfiguration:(AWSimagebuilderCreateInfrastructureConfigurationRequest *)request
     completionHandler:(void (^)(AWSimagebuilderCreateInfrastructureConfigurationResponse *response, NSError *error))completionHandler {
    [[self createInfrastructureConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderCreateInfrastructureConfigurationResponse *> * _Nonnull task) {
        AWSimagebuilderCreateInfrastructureConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderDeleteComponentResponse *> *)deleteComponent:(AWSimagebuilderDeleteComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteComponent"
                  targetPrefix:@""
                 operationName:@"DeleteComponent"
                   outputClass:[AWSimagebuilderDeleteComponentResponse class]];
}

- (void)deleteComponent:(AWSimagebuilderDeleteComponentRequest *)request
     completionHandler:(void (^)(AWSimagebuilderDeleteComponentResponse *response, NSError *error))completionHandler {
    [[self deleteComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderDeleteComponentResponse *> * _Nonnull task) {
        AWSimagebuilderDeleteComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderDeleteDistributionConfigurationResponse *> *)deleteDistributionConfiguration:(AWSimagebuilderDeleteDistributionConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteDistributionConfiguration"
                  targetPrefix:@""
                 operationName:@"DeleteDistributionConfiguration"
                   outputClass:[AWSimagebuilderDeleteDistributionConfigurationResponse class]];
}

- (void)deleteDistributionConfiguration:(AWSimagebuilderDeleteDistributionConfigurationRequest *)request
     completionHandler:(void (^)(AWSimagebuilderDeleteDistributionConfigurationResponse *response, NSError *error))completionHandler {
    [[self deleteDistributionConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderDeleteDistributionConfigurationResponse *> * _Nonnull task) {
        AWSimagebuilderDeleteDistributionConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderDeleteImageResponse *> *)deleteImage:(AWSimagebuilderDeleteImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteImage"
                  targetPrefix:@""
                 operationName:@"DeleteImage"
                   outputClass:[AWSimagebuilderDeleteImageResponse class]];
}

- (void)deleteImage:(AWSimagebuilderDeleteImageRequest *)request
     completionHandler:(void (^)(AWSimagebuilderDeleteImageResponse *response, NSError *error))completionHandler {
    [[self deleteImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderDeleteImageResponse *> * _Nonnull task) {
        AWSimagebuilderDeleteImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderDeleteImagePipelineResponse *> *)deleteImagePipeline:(AWSimagebuilderDeleteImagePipelineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteImagePipeline"
                  targetPrefix:@""
                 operationName:@"DeleteImagePipeline"
                   outputClass:[AWSimagebuilderDeleteImagePipelineResponse class]];
}

- (void)deleteImagePipeline:(AWSimagebuilderDeleteImagePipelineRequest *)request
     completionHandler:(void (^)(AWSimagebuilderDeleteImagePipelineResponse *response, NSError *error))completionHandler {
    [[self deleteImagePipeline:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderDeleteImagePipelineResponse *> * _Nonnull task) {
        AWSimagebuilderDeleteImagePipelineResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderDeleteImageRecipeResponse *> *)deleteImageRecipe:(AWSimagebuilderDeleteImageRecipeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteImageRecipe"
                  targetPrefix:@""
                 operationName:@"DeleteImageRecipe"
                   outputClass:[AWSimagebuilderDeleteImageRecipeResponse class]];
}

- (void)deleteImageRecipe:(AWSimagebuilderDeleteImageRecipeRequest *)request
     completionHandler:(void (^)(AWSimagebuilderDeleteImageRecipeResponse *response, NSError *error))completionHandler {
    [[self deleteImageRecipe:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderDeleteImageRecipeResponse *> * _Nonnull task) {
        AWSimagebuilderDeleteImageRecipeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderDeleteInfrastructureConfigurationResponse *> *)deleteInfrastructureConfiguration:(AWSimagebuilderDeleteInfrastructureConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/DeleteInfrastructureConfiguration"
                  targetPrefix:@""
                 operationName:@"DeleteInfrastructureConfiguration"
                   outputClass:[AWSimagebuilderDeleteInfrastructureConfigurationResponse class]];
}

- (void)deleteInfrastructureConfiguration:(AWSimagebuilderDeleteInfrastructureConfigurationRequest *)request
     completionHandler:(void (^)(AWSimagebuilderDeleteInfrastructureConfigurationResponse *response, NSError *error))completionHandler {
    [[self deleteInfrastructureConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderDeleteInfrastructureConfigurationResponse *> * _Nonnull task) {
        AWSimagebuilderDeleteInfrastructureConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderGetComponentResponse *> *)getComponent:(AWSimagebuilderGetComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetComponent"
                  targetPrefix:@""
                 operationName:@"GetComponent"
                   outputClass:[AWSimagebuilderGetComponentResponse class]];
}

- (void)getComponent:(AWSimagebuilderGetComponentRequest *)request
     completionHandler:(void (^)(AWSimagebuilderGetComponentResponse *response, NSError *error))completionHandler {
    [[self getComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderGetComponentResponse *> * _Nonnull task) {
        AWSimagebuilderGetComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderGetComponentPolicyResponse *> *)getComponentPolicy:(AWSimagebuilderGetComponentPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetComponentPolicy"
                  targetPrefix:@""
                 operationName:@"GetComponentPolicy"
                   outputClass:[AWSimagebuilderGetComponentPolicyResponse class]];
}

- (void)getComponentPolicy:(AWSimagebuilderGetComponentPolicyRequest *)request
     completionHandler:(void (^)(AWSimagebuilderGetComponentPolicyResponse *response, NSError *error))completionHandler {
    [[self getComponentPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderGetComponentPolicyResponse *> * _Nonnull task) {
        AWSimagebuilderGetComponentPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderGetDistributionConfigurationResponse *> *)getDistributionConfiguration:(AWSimagebuilderGetDistributionConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetDistributionConfiguration"
                  targetPrefix:@""
                 operationName:@"GetDistributionConfiguration"
                   outputClass:[AWSimagebuilderGetDistributionConfigurationResponse class]];
}

- (void)getDistributionConfiguration:(AWSimagebuilderGetDistributionConfigurationRequest *)request
     completionHandler:(void (^)(AWSimagebuilderGetDistributionConfigurationResponse *response, NSError *error))completionHandler {
    [[self getDistributionConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderGetDistributionConfigurationResponse *> * _Nonnull task) {
        AWSimagebuilderGetDistributionConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderGetImageResponse *> *)getImage:(AWSimagebuilderGetImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetImage"
                  targetPrefix:@""
                 operationName:@"GetImage"
                   outputClass:[AWSimagebuilderGetImageResponse class]];
}

- (void)getImage:(AWSimagebuilderGetImageRequest *)request
     completionHandler:(void (^)(AWSimagebuilderGetImageResponse *response, NSError *error))completionHandler {
    [[self getImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderGetImageResponse *> * _Nonnull task) {
        AWSimagebuilderGetImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderGetImagePipelineResponse *> *)getImagePipeline:(AWSimagebuilderGetImagePipelineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetImagePipeline"
                  targetPrefix:@""
                 operationName:@"GetImagePipeline"
                   outputClass:[AWSimagebuilderGetImagePipelineResponse class]];
}

- (void)getImagePipeline:(AWSimagebuilderGetImagePipelineRequest *)request
     completionHandler:(void (^)(AWSimagebuilderGetImagePipelineResponse *response, NSError *error))completionHandler {
    [[self getImagePipeline:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderGetImagePipelineResponse *> * _Nonnull task) {
        AWSimagebuilderGetImagePipelineResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderGetImagePolicyResponse *> *)getImagePolicy:(AWSimagebuilderGetImagePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetImagePolicy"
                  targetPrefix:@""
                 operationName:@"GetImagePolicy"
                   outputClass:[AWSimagebuilderGetImagePolicyResponse class]];
}

- (void)getImagePolicy:(AWSimagebuilderGetImagePolicyRequest *)request
     completionHandler:(void (^)(AWSimagebuilderGetImagePolicyResponse *response, NSError *error))completionHandler {
    [[self getImagePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderGetImagePolicyResponse *> * _Nonnull task) {
        AWSimagebuilderGetImagePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderGetImageRecipeResponse *> *)getImageRecipe:(AWSimagebuilderGetImageRecipeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetImageRecipe"
                  targetPrefix:@""
                 operationName:@"GetImageRecipe"
                   outputClass:[AWSimagebuilderGetImageRecipeResponse class]];
}

- (void)getImageRecipe:(AWSimagebuilderGetImageRecipeRequest *)request
     completionHandler:(void (^)(AWSimagebuilderGetImageRecipeResponse *response, NSError *error))completionHandler {
    [[self getImageRecipe:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderGetImageRecipeResponse *> * _Nonnull task) {
        AWSimagebuilderGetImageRecipeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderGetImageRecipePolicyResponse *> *)getImageRecipePolicy:(AWSimagebuilderGetImageRecipePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetImageRecipePolicy"
                  targetPrefix:@""
                 operationName:@"GetImageRecipePolicy"
                   outputClass:[AWSimagebuilderGetImageRecipePolicyResponse class]];
}

- (void)getImageRecipePolicy:(AWSimagebuilderGetImageRecipePolicyRequest *)request
     completionHandler:(void (^)(AWSimagebuilderGetImageRecipePolicyResponse *response, NSError *error))completionHandler {
    [[self getImageRecipePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderGetImageRecipePolicyResponse *> * _Nonnull task) {
        AWSimagebuilderGetImageRecipePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderGetInfrastructureConfigurationResponse *> *)getInfrastructureConfiguration:(AWSimagebuilderGetInfrastructureConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/GetInfrastructureConfiguration"
                  targetPrefix:@""
                 operationName:@"GetInfrastructureConfiguration"
                   outputClass:[AWSimagebuilderGetInfrastructureConfigurationResponse class]];
}

- (void)getInfrastructureConfiguration:(AWSimagebuilderGetInfrastructureConfigurationRequest *)request
     completionHandler:(void (^)(AWSimagebuilderGetInfrastructureConfigurationResponse *response, NSError *error))completionHandler {
    [[self getInfrastructureConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderGetInfrastructureConfigurationResponse *> * _Nonnull task) {
        AWSimagebuilderGetInfrastructureConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderImportComponentResponse *> *)importComponent:(AWSimagebuilderImportComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/ImportComponent"
                  targetPrefix:@""
                 operationName:@"ImportComponent"
                   outputClass:[AWSimagebuilderImportComponentResponse class]];
}

- (void)importComponent:(AWSimagebuilderImportComponentRequest *)request
     completionHandler:(void (^)(AWSimagebuilderImportComponentResponse *response, NSError *error))completionHandler {
    [[self importComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderImportComponentResponse *> * _Nonnull task) {
        AWSimagebuilderImportComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderListComponentBuildVersionsResponse *> *)listComponentBuildVersions:(AWSimagebuilderListComponentBuildVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListComponentBuildVersions"
                  targetPrefix:@""
                 operationName:@"ListComponentBuildVersions"
                   outputClass:[AWSimagebuilderListComponentBuildVersionsResponse class]];
}

- (void)listComponentBuildVersions:(AWSimagebuilderListComponentBuildVersionsRequest *)request
     completionHandler:(void (^)(AWSimagebuilderListComponentBuildVersionsResponse *response, NSError *error))completionHandler {
    [[self listComponentBuildVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderListComponentBuildVersionsResponse *> * _Nonnull task) {
        AWSimagebuilderListComponentBuildVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderListComponentsResponse *> *)listComponents:(AWSimagebuilderListComponentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListComponents"
                  targetPrefix:@""
                 operationName:@"ListComponents"
                   outputClass:[AWSimagebuilderListComponentsResponse class]];
}

- (void)listComponents:(AWSimagebuilderListComponentsRequest *)request
     completionHandler:(void (^)(AWSimagebuilderListComponentsResponse *response, NSError *error))completionHandler {
    [[self listComponents:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderListComponentsResponse *> * _Nonnull task) {
        AWSimagebuilderListComponentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderListDistributionConfigurationsResponse *> *)listDistributionConfigurations:(AWSimagebuilderListDistributionConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListDistributionConfigurations"
                  targetPrefix:@""
                 operationName:@"ListDistributionConfigurations"
                   outputClass:[AWSimagebuilderListDistributionConfigurationsResponse class]];
}

- (void)listDistributionConfigurations:(AWSimagebuilderListDistributionConfigurationsRequest *)request
     completionHandler:(void (^)(AWSimagebuilderListDistributionConfigurationsResponse *response, NSError *error))completionHandler {
    [[self listDistributionConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderListDistributionConfigurationsResponse *> * _Nonnull task) {
        AWSimagebuilderListDistributionConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderListImageBuildVersionsResponse *> *)listImageBuildVersions:(AWSimagebuilderListImageBuildVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListImageBuildVersions"
                  targetPrefix:@""
                 operationName:@"ListImageBuildVersions"
                   outputClass:[AWSimagebuilderListImageBuildVersionsResponse class]];
}

- (void)listImageBuildVersions:(AWSimagebuilderListImageBuildVersionsRequest *)request
     completionHandler:(void (^)(AWSimagebuilderListImageBuildVersionsResponse *response, NSError *error))completionHandler {
    [[self listImageBuildVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderListImageBuildVersionsResponse *> * _Nonnull task) {
        AWSimagebuilderListImageBuildVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderListImagePipelineImagesResponse *> *)listImagePipelineImages:(AWSimagebuilderListImagePipelineImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListImagePipelineImages"
                  targetPrefix:@""
                 operationName:@"ListImagePipelineImages"
                   outputClass:[AWSimagebuilderListImagePipelineImagesResponse class]];
}

- (void)listImagePipelineImages:(AWSimagebuilderListImagePipelineImagesRequest *)request
     completionHandler:(void (^)(AWSimagebuilderListImagePipelineImagesResponse *response, NSError *error))completionHandler {
    [[self listImagePipelineImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderListImagePipelineImagesResponse *> * _Nonnull task) {
        AWSimagebuilderListImagePipelineImagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderListImagePipelinesResponse *> *)listImagePipelines:(AWSimagebuilderListImagePipelinesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListImagePipelines"
                  targetPrefix:@""
                 operationName:@"ListImagePipelines"
                   outputClass:[AWSimagebuilderListImagePipelinesResponse class]];
}

- (void)listImagePipelines:(AWSimagebuilderListImagePipelinesRequest *)request
     completionHandler:(void (^)(AWSimagebuilderListImagePipelinesResponse *response, NSError *error))completionHandler {
    [[self listImagePipelines:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderListImagePipelinesResponse *> * _Nonnull task) {
        AWSimagebuilderListImagePipelinesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderListImageRecipesResponse *> *)listImageRecipes:(AWSimagebuilderListImageRecipesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListImageRecipes"
                  targetPrefix:@""
                 operationName:@"ListImageRecipes"
                   outputClass:[AWSimagebuilderListImageRecipesResponse class]];
}

- (void)listImageRecipes:(AWSimagebuilderListImageRecipesRequest *)request
     completionHandler:(void (^)(AWSimagebuilderListImageRecipesResponse *response, NSError *error))completionHandler {
    [[self listImageRecipes:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderListImageRecipesResponse *> * _Nonnull task) {
        AWSimagebuilderListImageRecipesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderListImagesResponse *> *)listImages:(AWSimagebuilderListImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListImages"
                  targetPrefix:@""
                 operationName:@"ListImages"
                   outputClass:[AWSimagebuilderListImagesResponse class]];
}

- (void)listImages:(AWSimagebuilderListImagesRequest *)request
     completionHandler:(void (^)(AWSimagebuilderListImagesResponse *response, NSError *error))completionHandler {
    [[self listImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderListImagesResponse *> * _Nonnull task) {
        AWSimagebuilderListImagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderListInfrastructureConfigurationsResponse *> *)listInfrastructureConfigurations:(AWSimagebuilderListInfrastructureConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListInfrastructureConfigurations"
                  targetPrefix:@""
                 operationName:@"ListInfrastructureConfigurations"
                   outputClass:[AWSimagebuilderListInfrastructureConfigurationsResponse class]];
}

- (void)listInfrastructureConfigurations:(AWSimagebuilderListInfrastructureConfigurationsRequest *)request
     completionHandler:(void (^)(AWSimagebuilderListInfrastructureConfigurationsResponse *response, NSError *error))completionHandler {
    [[self listInfrastructureConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderListInfrastructureConfigurationsResponse *> * _Nonnull task) {
        AWSimagebuilderListInfrastructureConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderListTagsForResourceResponse *> *)listTagsForResource:(AWSimagebuilderListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSimagebuilderListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSimagebuilderListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSimagebuilderListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderListTagsForResourceResponse *> * _Nonnull task) {
        AWSimagebuilderListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderPutComponentPolicyResponse *> *)putComponentPolicy:(AWSimagebuilderPutComponentPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/PutComponentPolicy"
                  targetPrefix:@""
                 operationName:@"PutComponentPolicy"
                   outputClass:[AWSimagebuilderPutComponentPolicyResponse class]];
}

- (void)putComponentPolicy:(AWSimagebuilderPutComponentPolicyRequest *)request
     completionHandler:(void (^)(AWSimagebuilderPutComponentPolicyResponse *response, NSError *error))completionHandler {
    [[self putComponentPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderPutComponentPolicyResponse *> * _Nonnull task) {
        AWSimagebuilderPutComponentPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderPutImagePolicyResponse *> *)putImagePolicy:(AWSimagebuilderPutImagePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/PutImagePolicy"
                  targetPrefix:@""
                 operationName:@"PutImagePolicy"
                   outputClass:[AWSimagebuilderPutImagePolicyResponse class]];
}

- (void)putImagePolicy:(AWSimagebuilderPutImagePolicyRequest *)request
     completionHandler:(void (^)(AWSimagebuilderPutImagePolicyResponse *response, NSError *error))completionHandler {
    [[self putImagePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderPutImagePolicyResponse *> * _Nonnull task) {
        AWSimagebuilderPutImagePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderPutImageRecipePolicyResponse *> *)putImageRecipePolicy:(AWSimagebuilderPutImageRecipePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/PutImageRecipePolicy"
                  targetPrefix:@""
                 operationName:@"PutImageRecipePolicy"
                   outputClass:[AWSimagebuilderPutImageRecipePolicyResponse class]];
}

- (void)putImageRecipePolicy:(AWSimagebuilderPutImageRecipePolicyRequest *)request
     completionHandler:(void (^)(AWSimagebuilderPutImageRecipePolicyResponse *response, NSError *error))completionHandler {
    [[self putImageRecipePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderPutImageRecipePolicyResponse *> * _Nonnull task) {
        AWSimagebuilderPutImageRecipePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderStartImagePipelineExecutionResponse *> *)startImagePipelineExecution:(AWSimagebuilderStartImagePipelineExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/StartImagePipelineExecution"
                  targetPrefix:@""
                 operationName:@"StartImagePipelineExecution"
                   outputClass:[AWSimagebuilderStartImagePipelineExecutionResponse class]];
}

- (void)startImagePipelineExecution:(AWSimagebuilderStartImagePipelineExecutionRequest *)request
     completionHandler:(void (^)(AWSimagebuilderStartImagePipelineExecutionResponse *response, NSError *error))completionHandler {
    [[self startImagePipelineExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderStartImagePipelineExecutionResponse *> * _Nonnull task) {
        AWSimagebuilderStartImagePipelineExecutionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderTagResourceResponse *> *)tagResource:(AWSimagebuilderTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSimagebuilderTagResourceResponse class]];
}

- (void)tagResource:(AWSimagebuilderTagResourceRequest *)request
     completionHandler:(void (^)(AWSimagebuilderTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderTagResourceResponse *> * _Nonnull task) {
        AWSimagebuilderTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderUntagResourceResponse *> *)untagResource:(AWSimagebuilderUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSimagebuilderUntagResourceResponse class]];
}

- (void)untagResource:(AWSimagebuilderUntagResourceRequest *)request
     completionHandler:(void (^)(AWSimagebuilderUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderUntagResourceResponse *> * _Nonnull task) {
        AWSimagebuilderUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderUpdateDistributionConfigurationResponse *> *)updateDistributionConfiguration:(AWSimagebuilderUpdateDistributionConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/UpdateDistributionConfiguration"
                  targetPrefix:@""
                 operationName:@"UpdateDistributionConfiguration"
                   outputClass:[AWSimagebuilderUpdateDistributionConfigurationResponse class]];
}

- (void)updateDistributionConfiguration:(AWSimagebuilderUpdateDistributionConfigurationRequest *)request
     completionHandler:(void (^)(AWSimagebuilderUpdateDistributionConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateDistributionConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderUpdateDistributionConfigurationResponse *> * _Nonnull task) {
        AWSimagebuilderUpdateDistributionConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderUpdateImagePipelineResponse *> *)updateImagePipeline:(AWSimagebuilderUpdateImagePipelineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/UpdateImagePipeline"
                  targetPrefix:@""
                 operationName:@"UpdateImagePipeline"
                   outputClass:[AWSimagebuilderUpdateImagePipelineResponse class]];
}

- (void)updateImagePipeline:(AWSimagebuilderUpdateImagePipelineRequest *)request
     completionHandler:(void (^)(AWSimagebuilderUpdateImagePipelineResponse *response, NSError *error))completionHandler {
    [[self updateImagePipeline:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderUpdateImagePipelineResponse *> * _Nonnull task) {
        AWSimagebuilderUpdateImagePipelineResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSimagebuilderUpdateInfrastructureConfigurationResponse *> *)updateInfrastructureConfiguration:(AWSimagebuilderUpdateInfrastructureConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/UpdateInfrastructureConfiguration"
                  targetPrefix:@""
                 operationName:@"UpdateInfrastructureConfiguration"
                   outputClass:[AWSimagebuilderUpdateInfrastructureConfigurationResponse class]];
}

- (void)updateInfrastructureConfiguration:(AWSimagebuilderUpdateInfrastructureConfigurationRequest *)request
     completionHandler:(void (^)(AWSimagebuilderUpdateInfrastructureConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateInfrastructureConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSimagebuilderUpdateInfrastructureConfigurationResponse *> * _Nonnull task) {
        AWSimagebuilderUpdateInfrastructureConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
