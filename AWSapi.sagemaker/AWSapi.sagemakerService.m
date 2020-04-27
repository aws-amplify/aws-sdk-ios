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

#import "AWSapi.sagemakerService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSapi.sagemakerResources.h"

static NSString *const AWSInfoapi.sagemaker = @"api.sagemaker";
NSString *const AWSapi.sagemakerSDKVersion = @"2.13.2";


@interface AWSapi.sagemakerResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSapi.sagemakerResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConflictException" : @(AWSapi.sagemakerErrorConflict),
                            @"ResourceInUse" : @(AWSapi.sagemakerErrorResourceInUse),
                            @"ResourceLimitExceeded" : @(AWSapi.sagemakerErrorResourceLimitExceeded),
                            @"ResourceNotFound" : @(AWSapi.sagemakerErrorResourceNotFound),
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
    	if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
	        if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSapi.sagemakerErrorDomain
	                                             code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        } else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSCognitoIdentityErrorDomain
	                                             code:AWSCognitoIdentityErrorUnknown
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        }
    	}
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSapi.sagemakerErrorDomain
                                     code:AWSapi.sagemakerErrorUnknown
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

@interface AWSapi.sagemakerRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSapi.sagemakerRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSapi.sagemaker()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSapi.sagemaker

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSapi.sagemakerSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSapi.sagemaker versions need to match. Check your SDK installation. AWSCore: %@ AWSapi.sagemaker: %@", AWSiOSSDKVersion, AWSapi.sagemakerSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultapi.sagemaker {
    static AWSapi.sagemaker *_defaultapi.sagemaker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoapi.sagemaker];
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
        _defaultapi.sagemaker = [[AWSapi.sagemaker alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultapi.sagemaker;
}

+ (void)registerapi.sagemakerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSapi.sagemaker alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)api.sagemakerForKey:(NSString *)key {
    @synchronized(self) {
        AWSapi.sagemaker *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoapi.sagemaker
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSapi.sagemaker registerapi.sagemakerWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeapi.sagemakerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultapi.sagemaker` or `+ api.sagemakerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceapi.sagemaker
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceapi.sagemaker];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSapi.sagemakerRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

		NSMutableDictionary *headers = [NSMutableDictionary new];
        headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
        networkingRequest.headers = headers;
        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSapi.sagemakerResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSapi.sagemakerResponseSerializer alloc] initWithJSONDefinition:[[AWSapi.sagemakerResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSapi.sagemakerAddTagsOutput *> *)addTags:(AWSapi.sagemakerAddTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"AddTags"
                   outputClass:[AWSapi.sagemakerAddTagsOutput class]];
}

- (void)addTags:(AWSapi.sagemakerAddTagsInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerAddTagsOutput *response, NSError *error))completionHandler {
    [[self addTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerAddTagsOutput *> * _Nonnull task) {
        AWSapi.sagemakerAddTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerAssociateTrialComponentResponse *> *)associateTrialComponent:(AWSapi.sagemakerAssociateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"AssociateTrialComponent"
                   outputClass:[AWSapi.sagemakerAssociateTrialComponentResponse class]];
}

- (void)associateTrialComponent:(AWSapi.sagemakerAssociateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerAssociateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self associateTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerAssociateTrialComponentResponse *> * _Nonnull task) {
        AWSapi.sagemakerAssociateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateAlgorithmOutput *> *)createAlgorithm:(AWSapi.sagemakerCreateAlgorithmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateAlgorithm"
                   outputClass:[AWSapi.sagemakerCreateAlgorithmOutput class]];
}

- (void)createAlgorithm:(AWSapi.sagemakerCreateAlgorithmInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateAlgorithmOutput *response, NSError *error))completionHandler {
    [[self createAlgorithm:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateAlgorithmOutput *> * _Nonnull task) {
        AWSapi.sagemakerCreateAlgorithmOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateAppResponse *> *)createApp:(AWSapi.sagemakerCreateAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateApp"
                   outputClass:[AWSapi.sagemakerCreateAppResponse class]];
}

- (void)createApp:(AWSapi.sagemakerCreateAppRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateAppResponse *response, NSError *error))completionHandler {
    [[self createApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateAppResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateAutoMLJobResponse *> *)createAutoMLJob:(AWSapi.sagemakerCreateAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateAutoMLJob"
                   outputClass:[AWSapi.sagemakerCreateAutoMLJobResponse class]];
}

- (void)createAutoMLJob:(AWSapi.sagemakerCreateAutoMLJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateAutoMLJobResponse *response, NSError *error))completionHandler {
    [[self createAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateAutoMLJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateAutoMLJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateCodeRepositoryOutput *> *)createCodeRepository:(AWSapi.sagemakerCreateCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateCodeRepository"
                   outputClass:[AWSapi.sagemakerCreateCodeRepositoryOutput class]];
}

- (void)createCodeRepository:(AWSapi.sagemakerCreateCodeRepositoryInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateCodeRepositoryOutput *response, NSError *error))completionHandler {
    [[self createCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateCodeRepositoryOutput *> * _Nonnull task) {
        AWSapi.sagemakerCreateCodeRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateCompilationJobResponse *> *)createCompilationJob:(AWSapi.sagemakerCreateCompilationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateCompilationJob"
                   outputClass:[AWSapi.sagemakerCreateCompilationJobResponse class]];
}

- (void)createCompilationJob:(AWSapi.sagemakerCreateCompilationJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateCompilationJobResponse *response, NSError *error))completionHandler {
    [[self createCompilationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateCompilationJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateCompilationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateDomainResponse *> *)createDomain:(AWSapi.sagemakerCreateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateDomain"
                   outputClass:[AWSapi.sagemakerCreateDomainResponse class]];
}

- (void)createDomain:(AWSapi.sagemakerCreateDomainRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateDomainResponse *response, NSError *error))completionHandler {
    [[self createDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateDomainResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateEndpointOutput *> *)createEndpoint:(AWSapi.sagemakerCreateEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateEndpoint"
                   outputClass:[AWSapi.sagemakerCreateEndpointOutput class]];
}

- (void)createEndpoint:(AWSapi.sagemakerCreateEndpointInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateEndpointOutput *response, NSError *error))completionHandler {
    [[self createEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateEndpointOutput *> * _Nonnull task) {
        AWSapi.sagemakerCreateEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateEndpointConfigOutput *> *)createEndpointConfig:(AWSapi.sagemakerCreateEndpointConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateEndpointConfig"
                   outputClass:[AWSapi.sagemakerCreateEndpointConfigOutput class]];
}

- (void)createEndpointConfig:(AWSapi.sagemakerCreateEndpointConfigInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateEndpointConfigOutput *response, NSError *error))completionHandler {
    [[self createEndpointConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateEndpointConfigOutput *> * _Nonnull task) {
        AWSapi.sagemakerCreateEndpointConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateExperimentResponse *> *)createExperiment:(AWSapi.sagemakerCreateExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateExperiment"
                   outputClass:[AWSapi.sagemakerCreateExperimentResponse class]];
}

- (void)createExperiment:(AWSapi.sagemakerCreateExperimentRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateExperimentResponse *response, NSError *error))completionHandler {
    [[self createExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateExperimentResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateFlowDefinitionResponse *> *)createFlowDefinition:(AWSapi.sagemakerCreateFlowDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateFlowDefinition"
                   outputClass:[AWSapi.sagemakerCreateFlowDefinitionResponse class]];
}

- (void)createFlowDefinition:(AWSapi.sagemakerCreateFlowDefinitionRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateFlowDefinitionResponse *response, NSError *error))completionHandler {
    [[self createFlowDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateFlowDefinitionResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateFlowDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateHumanTaskUiResponse *> *)createHumanTaskUi:(AWSapi.sagemakerCreateHumanTaskUiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateHumanTaskUi"
                   outputClass:[AWSapi.sagemakerCreateHumanTaskUiResponse class]];
}

- (void)createHumanTaskUi:(AWSapi.sagemakerCreateHumanTaskUiRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateHumanTaskUiResponse *response, NSError *error))completionHandler {
    [[self createHumanTaskUi:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateHumanTaskUiResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateHumanTaskUiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateHyperParameterTuningJobResponse *> *)createHyperParameterTuningJob:(AWSapi.sagemakerCreateHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateHyperParameterTuningJob"
                   outputClass:[AWSapi.sagemakerCreateHyperParameterTuningJobResponse class]];
}

- (void)createHyperParameterTuningJob:(AWSapi.sagemakerCreateHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateHyperParameterTuningJobResponse *response, NSError *error))completionHandler {
    [[self createHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateHyperParameterTuningJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateHyperParameterTuningJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateLabelingJobResponse *> *)createLabelingJob:(AWSapi.sagemakerCreateLabelingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateLabelingJob"
                   outputClass:[AWSapi.sagemakerCreateLabelingJobResponse class]];
}

- (void)createLabelingJob:(AWSapi.sagemakerCreateLabelingJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateLabelingJobResponse *response, NSError *error))completionHandler {
    [[self createLabelingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateLabelingJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateLabelingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateModelOutput *> *)createModel:(AWSapi.sagemakerCreateModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateModel"
                   outputClass:[AWSapi.sagemakerCreateModelOutput class]];
}

- (void)createModel:(AWSapi.sagemakerCreateModelInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateModelOutput *response, NSError *error))completionHandler {
    [[self createModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateModelOutput *> * _Nonnull task) {
        AWSapi.sagemakerCreateModelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateModelPackageOutput *> *)createModelPackage:(AWSapi.sagemakerCreateModelPackageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateModelPackage"
                   outputClass:[AWSapi.sagemakerCreateModelPackageOutput class]];
}

- (void)createModelPackage:(AWSapi.sagemakerCreateModelPackageInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateModelPackageOutput *response, NSError *error))completionHandler {
    [[self createModelPackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateModelPackageOutput *> * _Nonnull task) {
        AWSapi.sagemakerCreateModelPackageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateMonitoringScheduleResponse *> *)createMonitoringSchedule:(AWSapi.sagemakerCreateMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateMonitoringSchedule"
                   outputClass:[AWSapi.sagemakerCreateMonitoringScheduleResponse class]];
}

- (void)createMonitoringSchedule:(AWSapi.sagemakerCreateMonitoringScheduleRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateMonitoringScheduleResponse *response, NSError *error))completionHandler {
    [[self createMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateMonitoringScheduleResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateMonitoringScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateNotebookInstanceOutput *> *)createNotebookInstance:(AWSapi.sagemakerCreateNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateNotebookInstance"
                   outputClass:[AWSapi.sagemakerCreateNotebookInstanceOutput class]];
}

- (void)createNotebookInstance:(AWSapi.sagemakerCreateNotebookInstanceInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateNotebookInstanceOutput *response, NSError *error))completionHandler {
    [[self createNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateNotebookInstanceOutput *> * _Nonnull task) {
        AWSapi.sagemakerCreateNotebookInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput *> *)createNotebookInstanceLifecycleConfig:(AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateNotebookInstanceLifecycleConfig"
                   outputClass:[AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput class]];
}

- (void)createNotebookInstanceLifecycleConfig:(AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput *response, NSError *error))completionHandler {
    [[self createNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput *> * _Nonnull task) {
        AWSapi.sagemakerCreateNotebookInstanceLifecycleConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreatePresignedDomainUrlResponse *> *)createPresignedDomainUrl:(AWSapi.sagemakerCreatePresignedDomainUrlRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreatePresignedDomainUrl"
                   outputClass:[AWSapi.sagemakerCreatePresignedDomainUrlResponse class]];
}

- (void)createPresignedDomainUrl:(AWSapi.sagemakerCreatePresignedDomainUrlRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreatePresignedDomainUrlResponse *response, NSError *error))completionHandler {
    [[self createPresignedDomainUrl:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreatePresignedDomainUrlResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreatePresignedDomainUrlResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput *> *)createPresignedNotebookInstanceUrl:(AWSapi.sagemakerCreatePresignedNotebookInstanceUrlInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreatePresignedNotebookInstanceUrl"
                   outputClass:[AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput class]];
}

- (void)createPresignedNotebookInstanceUrl:(AWSapi.sagemakerCreatePresignedNotebookInstanceUrlInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput *response, NSError *error))completionHandler {
    [[self createPresignedNotebookInstanceUrl:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput *> * _Nonnull task) {
        AWSapi.sagemakerCreatePresignedNotebookInstanceUrlOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateProcessingJobResponse *> *)createProcessingJob:(AWSapi.sagemakerCreateProcessingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateProcessingJob"
                   outputClass:[AWSapi.sagemakerCreateProcessingJobResponse class]];
}

- (void)createProcessingJob:(AWSapi.sagemakerCreateProcessingJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateProcessingJobResponse *response, NSError *error))completionHandler {
    [[self createProcessingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateProcessingJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateProcessingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateTrainingJobResponse *> *)createTrainingJob:(AWSapi.sagemakerCreateTrainingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTrainingJob"
                   outputClass:[AWSapi.sagemakerCreateTrainingJobResponse class]];
}

- (void)createTrainingJob:(AWSapi.sagemakerCreateTrainingJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateTrainingJobResponse *response, NSError *error))completionHandler {
    [[self createTrainingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateTrainingJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateTrainingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateTransformJobResponse *> *)createTransformJob:(AWSapi.sagemakerCreateTransformJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTransformJob"
                   outputClass:[AWSapi.sagemakerCreateTransformJobResponse class]];
}

- (void)createTransformJob:(AWSapi.sagemakerCreateTransformJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateTransformJobResponse *response, NSError *error))completionHandler {
    [[self createTransformJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateTransformJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateTransformJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateTrialResponse *> *)createTrial:(AWSapi.sagemakerCreateTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTrial"
                   outputClass:[AWSapi.sagemakerCreateTrialResponse class]];
}

- (void)createTrial:(AWSapi.sagemakerCreateTrialRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateTrialResponse *response, NSError *error))completionHandler {
    [[self createTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateTrialResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateTrialComponentResponse *> *)createTrialComponent:(AWSapi.sagemakerCreateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTrialComponent"
                   outputClass:[AWSapi.sagemakerCreateTrialComponentResponse class]];
}

- (void)createTrialComponent:(AWSapi.sagemakerCreateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self createTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateTrialComponentResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateUserProfileResponse *> *)createUserProfile:(AWSapi.sagemakerCreateUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateUserProfile"
                   outputClass:[AWSapi.sagemakerCreateUserProfileResponse class]];
}

- (void)createUserProfile:(AWSapi.sagemakerCreateUserProfileRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateUserProfileResponse *response, NSError *error))completionHandler {
    [[self createUserProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateUserProfileResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateUserProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerCreateWorkteamResponse *> *)createWorkteam:(AWSapi.sagemakerCreateWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateWorkteam"
                   outputClass:[AWSapi.sagemakerCreateWorkteamResponse class]];
}

- (void)createWorkteam:(AWSapi.sagemakerCreateWorkteamRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerCreateWorkteamResponse *response, NSError *error))completionHandler {
    [[self createWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerCreateWorkteamResponse *> * _Nonnull task) {
        AWSapi.sagemakerCreateWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAlgorithm:(AWSapi.sagemakerDeleteAlgorithmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteAlgorithm"
                   outputClass:nil];
}

- (void)deleteAlgorithm:(AWSapi.sagemakerDeleteAlgorithmInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAlgorithm:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteApp:(AWSapi.sagemakerDeleteAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteApp"
                   outputClass:nil];
}

- (void)deleteApp:(AWSapi.sagemakerDeleteAppRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteApp:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCodeRepository:(AWSapi.sagemakerDeleteCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteCodeRepository"
                   outputClass:nil];
}

- (void)deleteCodeRepository:(AWSapi.sagemakerDeleteCodeRepositoryInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDomain:(AWSapi.sagemakerDeleteDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteDomain"
                   outputClass:nil];
}

- (void)deleteDomain:(AWSapi.sagemakerDeleteDomainRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDomain:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEndpoint:(AWSapi.sagemakerDeleteEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteEndpoint"
                   outputClass:nil];
}

- (void)deleteEndpoint:(AWSapi.sagemakerDeleteEndpointInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEndpoint:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEndpointConfig:(AWSapi.sagemakerDeleteEndpointConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteEndpointConfig"
                   outputClass:nil];
}

- (void)deleteEndpointConfig:(AWSapi.sagemakerDeleteEndpointConfigInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEndpointConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDeleteExperimentResponse *> *)deleteExperiment:(AWSapi.sagemakerDeleteExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteExperiment"
                   outputClass:[AWSapi.sagemakerDeleteExperimentResponse class]];
}

- (void)deleteExperiment:(AWSapi.sagemakerDeleteExperimentRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDeleteExperimentResponse *response, NSError *error))completionHandler {
    [[self deleteExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDeleteExperimentResponse *> * _Nonnull task) {
        AWSapi.sagemakerDeleteExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDeleteFlowDefinitionResponse *> *)deleteFlowDefinition:(AWSapi.sagemakerDeleteFlowDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteFlowDefinition"
                   outputClass:[AWSapi.sagemakerDeleteFlowDefinitionResponse class]];
}

- (void)deleteFlowDefinition:(AWSapi.sagemakerDeleteFlowDefinitionRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDeleteFlowDefinitionResponse *response, NSError *error))completionHandler {
    [[self deleteFlowDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDeleteFlowDefinitionResponse *> * _Nonnull task) {
        AWSapi.sagemakerDeleteFlowDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteModel:(AWSapi.sagemakerDeleteModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteModel"
                   outputClass:nil];
}

- (void)deleteModel:(AWSapi.sagemakerDeleteModelInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteModel:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteModelPackage:(AWSapi.sagemakerDeleteModelPackageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteModelPackage"
                   outputClass:nil];
}

- (void)deleteModelPackage:(AWSapi.sagemakerDeleteModelPackageInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteModelPackage:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteMonitoringSchedule:(AWSapi.sagemakerDeleteMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteMonitoringSchedule"
                   outputClass:nil];
}

- (void)deleteMonitoringSchedule:(AWSapi.sagemakerDeleteMonitoringScheduleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNotebookInstance:(AWSapi.sagemakerDeleteNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteNotebookInstance"
                   outputClass:nil];
}

- (void)deleteNotebookInstance:(AWSapi.sagemakerDeleteNotebookInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNotebookInstanceLifecycleConfig:(AWSapi.sagemakerDeleteNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteNotebookInstanceLifecycleConfig"
                   outputClass:nil];
}

- (void)deleteNotebookInstanceLifecycleConfig:(AWSapi.sagemakerDeleteNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDeleteTagsOutput *> *)deleteTags:(AWSapi.sagemakerDeleteTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteTags"
                   outputClass:[AWSapi.sagemakerDeleteTagsOutput class]];
}

- (void)deleteTags:(AWSapi.sagemakerDeleteTagsInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerDeleteTagsOutput *response, NSError *error))completionHandler {
    [[self deleteTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDeleteTagsOutput *> * _Nonnull task) {
        AWSapi.sagemakerDeleteTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDeleteTrialResponse *> *)deleteTrial:(AWSapi.sagemakerDeleteTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteTrial"
                   outputClass:[AWSapi.sagemakerDeleteTrialResponse class]];
}

- (void)deleteTrial:(AWSapi.sagemakerDeleteTrialRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDeleteTrialResponse *response, NSError *error))completionHandler {
    [[self deleteTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDeleteTrialResponse *> * _Nonnull task) {
        AWSapi.sagemakerDeleteTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDeleteTrialComponentResponse *> *)deleteTrialComponent:(AWSapi.sagemakerDeleteTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteTrialComponent"
                   outputClass:[AWSapi.sagemakerDeleteTrialComponentResponse class]];
}

- (void)deleteTrialComponent:(AWSapi.sagemakerDeleteTrialComponentRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDeleteTrialComponentResponse *response, NSError *error))completionHandler {
    [[self deleteTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDeleteTrialComponentResponse *> * _Nonnull task) {
        AWSapi.sagemakerDeleteTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUserProfile:(AWSapi.sagemakerDeleteUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteUserProfile"
                   outputClass:nil];
}

- (void)deleteUserProfile:(AWSapi.sagemakerDeleteUserProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUserProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDeleteWorkteamResponse *> *)deleteWorkteam:(AWSapi.sagemakerDeleteWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteWorkteam"
                   outputClass:[AWSapi.sagemakerDeleteWorkteamResponse class]];
}

- (void)deleteWorkteam:(AWSapi.sagemakerDeleteWorkteamRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDeleteWorkteamResponse *response, NSError *error))completionHandler {
    [[self deleteWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDeleteWorkteamResponse *> * _Nonnull task) {
        AWSapi.sagemakerDeleteWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeAlgorithmOutput *> *)describeAlgorithm:(AWSapi.sagemakerDescribeAlgorithmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeAlgorithm"
                   outputClass:[AWSapi.sagemakerDescribeAlgorithmOutput class]];
}

- (void)describeAlgorithm:(AWSapi.sagemakerDescribeAlgorithmInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeAlgorithmOutput *response, NSError *error))completionHandler {
    [[self describeAlgorithm:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeAlgorithmOutput *> * _Nonnull task) {
        AWSapi.sagemakerDescribeAlgorithmOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeAppResponse *> *)describeApp:(AWSapi.sagemakerDescribeAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeApp"
                   outputClass:[AWSapi.sagemakerDescribeAppResponse class]];
}

- (void)describeApp:(AWSapi.sagemakerDescribeAppRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeAppResponse *response, NSError *error))completionHandler {
    [[self describeApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeAppResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeAutoMLJobResponse *> *)describeAutoMLJob:(AWSapi.sagemakerDescribeAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeAutoMLJob"
                   outputClass:[AWSapi.sagemakerDescribeAutoMLJobResponse class]];
}

- (void)describeAutoMLJob:(AWSapi.sagemakerDescribeAutoMLJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeAutoMLJobResponse *response, NSError *error))completionHandler {
    [[self describeAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeAutoMLJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeAutoMLJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeCodeRepositoryOutput *> *)describeCodeRepository:(AWSapi.sagemakerDescribeCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeCodeRepository"
                   outputClass:[AWSapi.sagemakerDescribeCodeRepositoryOutput class]];
}

- (void)describeCodeRepository:(AWSapi.sagemakerDescribeCodeRepositoryInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeCodeRepositoryOutput *response, NSError *error))completionHandler {
    [[self describeCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeCodeRepositoryOutput *> * _Nonnull task) {
        AWSapi.sagemakerDescribeCodeRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeCompilationJobResponse *> *)describeCompilationJob:(AWSapi.sagemakerDescribeCompilationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeCompilationJob"
                   outputClass:[AWSapi.sagemakerDescribeCompilationJobResponse class]];
}

- (void)describeCompilationJob:(AWSapi.sagemakerDescribeCompilationJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeCompilationJobResponse *response, NSError *error))completionHandler {
    [[self describeCompilationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeCompilationJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeCompilationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeDomainResponse *> *)describeDomain:(AWSapi.sagemakerDescribeDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeDomain"
                   outputClass:[AWSapi.sagemakerDescribeDomainResponse class]];
}

- (void)describeDomain:(AWSapi.sagemakerDescribeDomainRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeDomainResponse *response, NSError *error))completionHandler {
    [[self describeDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeDomainResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeEndpointOutput *> *)describeEndpoint:(AWSapi.sagemakerDescribeEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeEndpoint"
                   outputClass:[AWSapi.sagemakerDescribeEndpointOutput class]];
}

- (void)describeEndpoint:(AWSapi.sagemakerDescribeEndpointInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeEndpointOutput *response, NSError *error))completionHandler {
    [[self describeEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeEndpointOutput *> * _Nonnull task) {
        AWSapi.sagemakerDescribeEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeEndpointConfigOutput *> *)describeEndpointConfig:(AWSapi.sagemakerDescribeEndpointConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeEndpointConfig"
                   outputClass:[AWSapi.sagemakerDescribeEndpointConfigOutput class]];
}

- (void)describeEndpointConfig:(AWSapi.sagemakerDescribeEndpointConfigInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeEndpointConfigOutput *response, NSError *error))completionHandler {
    [[self describeEndpointConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeEndpointConfigOutput *> * _Nonnull task) {
        AWSapi.sagemakerDescribeEndpointConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeExperimentResponse *> *)describeExperiment:(AWSapi.sagemakerDescribeExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeExperiment"
                   outputClass:[AWSapi.sagemakerDescribeExperimentResponse class]];
}

- (void)describeExperiment:(AWSapi.sagemakerDescribeExperimentRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeExperimentResponse *response, NSError *error))completionHandler {
    [[self describeExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeExperimentResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeFlowDefinitionResponse *> *)describeFlowDefinition:(AWSapi.sagemakerDescribeFlowDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeFlowDefinition"
                   outputClass:[AWSapi.sagemakerDescribeFlowDefinitionResponse class]];
}

- (void)describeFlowDefinition:(AWSapi.sagemakerDescribeFlowDefinitionRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeFlowDefinitionResponse *response, NSError *error))completionHandler {
    [[self describeFlowDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeFlowDefinitionResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeFlowDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeHumanTaskUiResponse *> *)describeHumanTaskUi:(AWSapi.sagemakerDescribeHumanTaskUiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeHumanTaskUi"
                   outputClass:[AWSapi.sagemakerDescribeHumanTaskUiResponse class]];
}

- (void)describeHumanTaskUi:(AWSapi.sagemakerDescribeHumanTaskUiRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeHumanTaskUiResponse *response, NSError *error))completionHandler {
    [[self describeHumanTaskUi:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeHumanTaskUiResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeHumanTaskUiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeHyperParameterTuningJobResponse *> *)describeHyperParameterTuningJob:(AWSapi.sagemakerDescribeHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeHyperParameterTuningJob"
                   outputClass:[AWSapi.sagemakerDescribeHyperParameterTuningJobResponse class]];
}

- (void)describeHyperParameterTuningJob:(AWSapi.sagemakerDescribeHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeHyperParameterTuningJobResponse *response, NSError *error))completionHandler {
    [[self describeHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeHyperParameterTuningJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeHyperParameterTuningJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeLabelingJobResponse *> *)describeLabelingJob:(AWSapi.sagemakerDescribeLabelingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeLabelingJob"
                   outputClass:[AWSapi.sagemakerDescribeLabelingJobResponse class]];
}

- (void)describeLabelingJob:(AWSapi.sagemakerDescribeLabelingJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeLabelingJobResponse *response, NSError *error))completionHandler {
    [[self describeLabelingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeLabelingJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeLabelingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeModelOutput *> *)describeModel:(AWSapi.sagemakerDescribeModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeModel"
                   outputClass:[AWSapi.sagemakerDescribeModelOutput class]];
}

- (void)describeModel:(AWSapi.sagemakerDescribeModelInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeModelOutput *response, NSError *error))completionHandler {
    [[self describeModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeModelOutput *> * _Nonnull task) {
        AWSapi.sagemakerDescribeModelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeModelPackageOutput *> *)describeModelPackage:(AWSapi.sagemakerDescribeModelPackageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeModelPackage"
                   outputClass:[AWSapi.sagemakerDescribeModelPackageOutput class]];
}

- (void)describeModelPackage:(AWSapi.sagemakerDescribeModelPackageInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeModelPackageOutput *response, NSError *error))completionHandler {
    [[self describeModelPackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeModelPackageOutput *> * _Nonnull task) {
        AWSapi.sagemakerDescribeModelPackageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeMonitoringScheduleResponse *> *)describeMonitoringSchedule:(AWSapi.sagemakerDescribeMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeMonitoringSchedule"
                   outputClass:[AWSapi.sagemakerDescribeMonitoringScheduleResponse class]];
}

- (void)describeMonitoringSchedule:(AWSapi.sagemakerDescribeMonitoringScheduleRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeMonitoringScheduleResponse *response, NSError *error))completionHandler {
    [[self describeMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeMonitoringScheduleResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeMonitoringScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeNotebookInstanceOutput *> *)describeNotebookInstance:(AWSapi.sagemakerDescribeNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeNotebookInstance"
                   outputClass:[AWSapi.sagemakerDescribeNotebookInstanceOutput class]];
}

- (void)describeNotebookInstance:(AWSapi.sagemakerDescribeNotebookInstanceInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeNotebookInstanceOutput *response, NSError *error))completionHandler {
    [[self describeNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeNotebookInstanceOutput *> * _Nonnull task) {
        AWSapi.sagemakerDescribeNotebookInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput *> *)describeNotebookInstanceLifecycleConfig:(AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeNotebookInstanceLifecycleConfig"
                   outputClass:[AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput class]];
}

- (void)describeNotebookInstanceLifecycleConfig:(AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput *response, NSError *error))completionHandler {
    [[self describeNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput *> * _Nonnull task) {
        AWSapi.sagemakerDescribeNotebookInstanceLifecycleConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeProcessingJobResponse *> *)describeProcessingJob:(AWSapi.sagemakerDescribeProcessingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeProcessingJob"
                   outputClass:[AWSapi.sagemakerDescribeProcessingJobResponse class]];
}

- (void)describeProcessingJob:(AWSapi.sagemakerDescribeProcessingJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeProcessingJobResponse *response, NSError *error))completionHandler {
    [[self describeProcessingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeProcessingJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeProcessingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeSubscribedWorkteamResponse *> *)describeSubscribedWorkteam:(AWSapi.sagemakerDescribeSubscribedWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeSubscribedWorkteam"
                   outputClass:[AWSapi.sagemakerDescribeSubscribedWorkteamResponse class]];
}

- (void)describeSubscribedWorkteam:(AWSapi.sagemakerDescribeSubscribedWorkteamRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeSubscribedWorkteamResponse *response, NSError *error))completionHandler {
    [[self describeSubscribedWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeSubscribedWorkteamResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeSubscribedWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeTrainingJobResponse *> *)describeTrainingJob:(AWSapi.sagemakerDescribeTrainingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTrainingJob"
                   outputClass:[AWSapi.sagemakerDescribeTrainingJobResponse class]];
}

- (void)describeTrainingJob:(AWSapi.sagemakerDescribeTrainingJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeTrainingJobResponse *response, NSError *error))completionHandler {
    [[self describeTrainingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeTrainingJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeTrainingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeTransformJobResponse *> *)describeTransformJob:(AWSapi.sagemakerDescribeTransformJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTransformJob"
                   outputClass:[AWSapi.sagemakerDescribeTransformJobResponse class]];
}

- (void)describeTransformJob:(AWSapi.sagemakerDescribeTransformJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeTransformJobResponse *response, NSError *error))completionHandler {
    [[self describeTransformJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeTransformJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeTransformJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeTrialResponse *> *)describeTrial:(AWSapi.sagemakerDescribeTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTrial"
                   outputClass:[AWSapi.sagemakerDescribeTrialResponse class]];
}

- (void)describeTrial:(AWSapi.sagemakerDescribeTrialRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeTrialResponse *response, NSError *error))completionHandler {
    [[self describeTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeTrialResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeTrialComponentResponse *> *)describeTrialComponent:(AWSapi.sagemakerDescribeTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTrialComponent"
                   outputClass:[AWSapi.sagemakerDescribeTrialComponentResponse class]];
}

- (void)describeTrialComponent:(AWSapi.sagemakerDescribeTrialComponentRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeTrialComponentResponse *response, NSError *error))completionHandler {
    [[self describeTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeTrialComponentResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeUserProfileResponse *> *)describeUserProfile:(AWSapi.sagemakerDescribeUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeUserProfile"
                   outputClass:[AWSapi.sagemakerDescribeUserProfileResponse class]];
}

- (void)describeUserProfile:(AWSapi.sagemakerDescribeUserProfileRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeUserProfileResponse *response, NSError *error))completionHandler {
    [[self describeUserProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeUserProfileResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeUserProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeWorkforceResponse *> *)describeWorkforce:(AWSapi.sagemakerDescribeWorkforceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeWorkforce"
                   outputClass:[AWSapi.sagemakerDescribeWorkforceResponse class]];
}

- (void)describeWorkforce:(AWSapi.sagemakerDescribeWorkforceRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeWorkforceResponse *response, NSError *error))completionHandler {
    [[self describeWorkforce:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeWorkforceResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeWorkforceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDescribeWorkteamResponse *> *)describeWorkteam:(AWSapi.sagemakerDescribeWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeWorkteam"
                   outputClass:[AWSapi.sagemakerDescribeWorkteamResponse class]];
}

- (void)describeWorkteam:(AWSapi.sagemakerDescribeWorkteamRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDescribeWorkteamResponse *response, NSError *error))completionHandler {
    [[self describeWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDescribeWorkteamResponse *> * _Nonnull task) {
        AWSapi.sagemakerDescribeWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerDisassociateTrialComponentResponse *> *)disassociateTrialComponent:(AWSapi.sagemakerDisassociateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DisassociateTrialComponent"
                   outputClass:[AWSapi.sagemakerDisassociateTrialComponentResponse class]];
}

- (void)disassociateTrialComponent:(AWSapi.sagemakerDisassociateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerDisassociateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self disassociateTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerDisassociateTrialComponentResponse *> * _Nonnull task) {
        AWSapi.sagemakerDisassociateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerGetSearchSuggestionsResponse *> *)getSearchSuggestions:(AWSapi.sagemakerGetSearchSuggestionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"GetSearchSuggestions"
                   outputClass:[AWSapi.sagemakerGetSearchSuggestionsResponse class]];
}

- (void)getSearchSuggestions:(AWSapi.sagemakerGetSearchSuggestionsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerGetSearchSuggestionsResponse *response, NSError *error))completionHandler {
    [[self getSearchSuggestions:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerGetSearchSuggestionsResponse *> * _Nonnull task) {
        AWSapi.sagemakerGetSearchSuggestionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListAlgorithmsOutput *> *)listAlgorithms:(AWSapi.sagemakerListAlgorithmsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListAlgorithms"
                   outputClass:[AWSapi.sagemakerListAlgorithmsOutput class]];
}

- (void)listAlgorithms:(AWSapi.sagemakerListAlgorithmsInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerListAlgorithmsOutput *response, NSError *error))completionHandler {
    [[self listAlgorithms:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListAlgorithmsOutput *> * _Nonnull task) {
        AWSapi.sagemakerListAlgorithmsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListAppsResponse *> *)listApps:(AWSapi.sagemakerListAppsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListApps"
                   outputClass:[AWSapi.sagemakerListAppsResponse class]];
}

- (void)listApps:(AWSapi.sagemakerListAppsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListAppsResponse *response, NSError *error))completionHandler {
    [[self listApps:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListAppsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListAppsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListAutoMLJobsResponse *> *)listAutoMLJobs:(AWSapi.sagemakerListAutoMLJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListAutoMLJobs"
                   outputClass:[AWSapi.sagemakerListAutoMLJobsResponse class]];
}

- (void)listAutoMLJobs:(AWSapi.sagemakerListAutoMLJobsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListAutoMLJobsResponse *response, NSError *error))completionHandler {
    [[self listAutoMLJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListAutoMLJobsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListAutoMLJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListCandidatesForAutoMLJobResponse *> *)listCandidatesForAutoMLJob:(AWSapi.sagemakerListCandidatesForAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListCandidatesForAutoMLJob"
                   outputClass:[AWSapi.sagemakerListCandidatesForAutoMLJobResponse class]];
}

- (void)listCandidatesForAutoMLJob:(AWSapi.sagemakerListCandidatesForAutoMLJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListCandidatesForAutoMLJobResponse *response, NSError *error))completionHandler {
    [[self listCandidatesForAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListCandidatesForAutoMLJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerListCandidatesForAutoMLJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListCodeRepositoriesOutput *> *)listCodeRepositories:(AWSapi.sagemakerListCodeRepositoriesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListCodeRepositories"
                   outputClass:[AWSapi.sagemakerListCodeRepositoriesOutput class]];
}

- (void)listCodeRepositories:(AWSapi.sagemakerListCodeRepositoriesInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerListCodeRepositoriesOutput *response, NSError *error))completionHandler {
    [[self listCodeRepositories:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListCodeRepositoriesOutput *> * _Nonnull task) {
        AWSapi.sagemakerListCodeRepositoriesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListCompilationJobsResponse *> *)listCompilationJobs:(AWSapi.sagemakerListCompilationJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListCompilationJobs"
                   outputClass:[AWSapi.sagemakerListCompilationJobsResponse class]];
}

- (void)listCompilationJobs:(AWSapi.sagemakerListCompilationJobsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListCompilationJobsResponse *response, NSError *error))completionHandler {
    [[self listCompilationJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListCompilationJobsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListCompilationJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListDomainsResponse *> *)listDomains:(AWSapi.sagemakerListDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListDomains"
                   outputClass:[AWSapi.sagemakerListDomainsResponse class]];
}

- (void)listDomains:(AWSapi.sagemakerListDomainsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListDomainsResponse *response, NSError *error))completionHandler {
    [[self listDomains:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListDomainsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListDomainsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListEndpointConfigsOutput *> *)listEndpointConfigs:(AWSapi.sagemakerListEndpointConfigsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListEndpointConfigs"
                   outputClass:[AWSapi.sagemakerListEndpointConfigsOutput class]];
}

- (void)listEndpointConfigs:(AWSapi.sagemakerListEndpointConfigsInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerListEndpointConfigsOutput *response, NSError *error))completionHandler {
    [[self listEndpointConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListEndpointConfigsOutput *> * _Nonnull task) {
        AWSapi.sagemakerListEndpointConfigsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListEndpointsOutput *> *)listEndpoints:(AWSapi.sagemakerListEndpointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListEndpoints"
                   outputClass:[AWSapi.sagemakerListEndpointsOutput class]];
}

- (void)listEndpoints:(AWSapi.sagemakerListEndpointsInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerListEndpointsOutput *response, NSError *error))completionHandler {
    [[self listEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListEndpointsOutput *> * _Nonnull task) {
        AWSapi.sagemakerListEndpointsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListExperimentsResponse *> *)listExperiments:(AWSapi.sagemakerListExperimentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListExperiments"
                   outputClass:[AWSapi.sagemakerListExperimentsResponse class]];
}

- (void)listExperiments:(AWSapi.sagemakerListExperimentsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListExperimentsResponse *response, NSError *error))completionHandler {
    [[self listExperiments:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListExperimentsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListExperimentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListFlowDefinitionsResponse *> *)listFlowDefinitions:(AWSapi.sagemakerListFlowDefinitionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListFlowDefinitions"
                   outputClass:[AWSapi.sagemakerListFlowDefinitionsResponse class]];
}

- (void)listFlowDefinitions:(AWSapi.sagemakerListFlowDefinitionsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListFlowDefinitionsResponse *response, NSError *error))completionHandler {
    [[self listFlowDefinitions:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListFlowDefinitionsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListFlowDefinitionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListHumanTaskUisResponse *> *)listHumanTaskUis:(AWSapi.sagemakerListHumanTaskUisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListHumanTaskUis"
                   outputClass:[AWSapi.sagemakerListHumanTaskUisResponse class]];
}

- (void)listHumanTaskUis:(AWSapi.sagemakerListHumanTaskUisRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListHumanTaskUisResponse *response, NSError *error))completionHandler {
    [[self listHumanTaskUis:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListHumanTaskUisResponse *> * _Nonnull task) {
        AWSapi.sagemakerListHumanTaskUisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListHyperParameterTuningJobsResponse *> *)listHyperParameterTuningJobs:(AWSapi.sagemakerListHyperParameterTuningJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListHyperParameterTuningJobs"
                   outputClass:[AWSapi.sagemakerListHyperParameterTuningJobsResponse class]];
}

- (void)listHyperParameterTuningJobs:(AWSapi.sagemakerListHyperParameterTuningJobsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListHyperParameterTuningJobsResponse *response, NSError *error))completionHandler {
    [[self listHyperParameterTuningJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListHyperParameterTuningJobsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListHyperParameterTuningJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListLabelingJobsResponse *> *)listLabelingJobs:(AWSapi.sagemakerListLabelingJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListLabelingJobs"
                   outputClass:[AWSapi.sagemakerListLabelingJobsResponse class]];
}

- (void)listLabelingJobs:(AWSapi.sagemakerListLabelingJobsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListLabelingJobsResponse *response, NSError *error))completionHandler {
    [[self listLabelingJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListLabelingJobsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListLabelingJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListLabelingJobsForWorkteamResponse *> *)listLabelingJobsForWorkteam:(AWSapi.sagemakerListLabelingJobsForWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListLabelingJobsForWorkteam"
                   outputClass:[AWSapi.sagemakerListLabelingJobsForWorkteamResponse class]];
}

- (void)listLabelingJobsForWorkteam:(AWSapi.sagemakerListLabelingJobsForWorkteamRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListLabelingJobsForWorkteamResponse *response, NSError *error))completionHandler {
    [[self listLabelingJobsForWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListLabelingJobsForWorkteamResponse *> * _Nonnull task) {
        AWSapi.sagemakerListLabelingJobsForWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListModelPackagesOutput *> *)listModelPackages:(AWSapi.sagemakerListModelPackagesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListModelPackages"
                   outputClass:[AWSapi.sagemakerListModelPackagesOutput class]];
}

- (void)listModelPackages:(AWSapi.sagemakerListModelPackagesInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerListModelPackagesOutput *response, NSError *error))completionHandler {
    [[self listModelPackages:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListModelPackagesOutput *> * _Nonnull task) {
        AWSapi.sagemakerListModelPackagesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListModelsOutput *> *)listModels:(AWSapi.sagemakerListModelsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListModels"
                   outputClass:[AWSapi.sagemakerListModelsOutput class]];
}

- (void)listModels:(AWSapi.sagemakerListModelsInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerListModelsOutput *response, NSError *error))completionHandler {
    [[self listModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListModelsOutput *> * _Nonnull task) {
        AWSapi.sagemakerListModelsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListMonitoringExecutionsResponse *> *)listMonitoringExecutions:(AWSapi.sagemakerListMonitoringExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListMonitoringExecutions"
                   outputClass:[AWSapi.sagemakerListMonitoringExecutionsResponse class]];
}

- (void)listMonitoringExecutions:(AWSapi.sagemakerListMonitoringExecutionsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListMonitoringExecutionsResponse *response, NSError *error))completionHandler {
    [[self listMonitoringExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListMonitoringExecutionsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListMonitoringExecutionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListMonitoringSchedulesResponse *> *)listMonitoringSchedules:(AWSapi.sagemakerListMonitoringSchedulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListMonitoringSchedules"
                   outputClass:[AWSapi.sagemakerListMonitoringSchedulesResponse class]];
}

- (void)listMonitoringSchedules:(AWSapi.sagemakerListMonitoringSchedulesRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListMonitoringSchedulesResponse *response, NSError *error))completionHandler {
    [[self listMonitoringSchedules:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListMonitoringSchedulesResponse *> * _Nonnull task) {
        AWSapi.sagemakerListMonitoringSchedulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput *> *)listNotebookInstanceLifecycleConfigs:(AWSapi.sagemakerListNotebookInstanceLifecycleConfigsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListNotebookInstanceLifecycleConfigs"
                   outputClass:[AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput class]];
}

- (void)listNotebookInstanceLifecycleConfigs:(AWSapi.sagemakerListNotebookInstanceLifecycleConfigsInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput *response, NSError *error))completionHandler {
    [[self listNotebookInstanceLifecycleConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput *> * _Nonnull task) {
        AWSapi.sagemakerListNotebookInstanceLifecycleConfigsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListNotebookInstancesOutput *> *)listNotebookInstances:(AWSapi.sagemakerListNotebookInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListNotebookInstances"
                   outputClass:[AWSapi.sagemakerListNotebookInstancesOutput class]];
}

- (void)listNotebookInstances:(AWSapi.sagemakerListNotebookInstancesInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerListNotebookInstancesOutput *response, NSError *error))completionHandler {
    [[self listNotebookInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListNotebookInstancesOutput *> * _Nonnull task) {
        AWSapi.sagemakerListNotebookInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListProcessingJobsResponse *> *)listProcessingJobs:(AWSapi.sagemakerListProcessingJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListProcessingJobs"
                   outputClass:[AWSapi.sagemakerListProcessingJobsResponse class]];
}

- (void)listProcessingJobs:(AWSapi.sagemakerListProcessingJobsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListProcessingJobsResponse *response, NSError *error))completionHandler {
    [[self listProcessingJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListProcessingJobsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListProcessingJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListSubscribedWorkteamsResponse *> *)listSubscribedWorkteams:(AWSapi.sagemakerListSubscribedWorkteamsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListSubscribedWorkteams"
                   outputClass:[AWSapi.sagemakerListSubscribedWorkteamsResponse class]];
}

- (void)listSubscribedWorkteams:(AWSapi.sagemakerListSubscribedWorkteamsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListSubscribedWorkteamsResponse *response, NSError *error))completionHandler {
    [[self listSubscribedWorkteams:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListSubscribedWorkteamsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListSubscribedWorkteamsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListTagsOutput *> *)listTags:(AWSapi.sagemakerListTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTags"
                   outputClass:[AWSapi.sagemakerListTagsOutput class]];
}

- (void)listTags:(AWSapi.sagemakerListTagsInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerListTagsOutput *response, NSError *error))completionHandler {
    [[self listTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListTagsOutput *> * _Nonnull task) {
        AWSapi.sagemakerListTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListTrainingJobsResponse *> *)listTrainingJobs:(AWSapi.sagemakerListTrainingJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrainingJobs"
                   outputClass:[AWSapi.sagemakerListTrainingJobsResponse class]];
}

- (void)listTrainingJobs:(AWSapi.sagemakerListTrainingJobsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListTrainingJobsResponse *response, NSError *error))completionHandler {
    [[self listTrainingJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListTrainingJobsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListTrainingJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse *> *)listTrainingJobsForHyperParameterTuningJob:(AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrainingJobsForHyperParameterTuningJob"
                   outputClass:[AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse class]];
}

- (void)listTrainingJobsForHyperParameterTuningJob:(AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse *response, NSError *error))completionHandler {
    [[self listTrainingJobsForHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse *> * _Nonnull task) {
        AWSapi.sagemakerListTrainingJobsForHyperParameterTuningJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListTransformJobsResponse *> *)listTransformJobs:(AWSapi.sagemakerListTransformJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTransformJobs"
                   outputClass:[AWSapi.sagemakerListTransformJobsResponse class]];
}

- (void)listTransformJobs:(AWSapi.sagemakerListTransformJobsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListTransformJobsResponse *response, NSError *error))completionHandler {
    [[self listTransformJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListTransformJobsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListTransformJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListTrialComponentsResponse *> *)listTrialComponents:(AWSapi.sagemakerListTrialComponentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrialComponents"
                   outputClass:[AWSapi.sagemakerListTrialComponentsResponse class]];
}

- (void)listTrialComponents:(AWSapi.sagemakerListTrialComponentsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListTrialComponentsResponse *response, NSError *error))completionHandler {
    [[self listTrialComponents:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListTrialComponentsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListTrialComponentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListTrialsResponse *> *)listTrials:(AWSapi.sagemakerListTrialsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrials"
                   outputClass:[AWSapi.sagemakerListTrialsResponse class]];
}

- (void)listTrials:(AWSapi.sagemakerListTrialsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListTrialsResponse *response, NSError *error))completionHandler {
    [[self listTrials:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListTrialsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListTrialsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListUserProfilesResponse *> *)listUserProfiles:(AWSapi.sagemakerListUserProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListUserProfiles"
                   outputClass:[AWSapi.sagemakerListUserProfilesResponse class]];
}

- (void)listUserProfiles:(AWSapi.sagemakerListUserProfilesRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListUserProfilesResponse *response, NSError *error))completionHandler {
    [[self listUserProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListUserProfilesResponse *> * _Nonnull task) {
        AWSapi.sagemakerListUserProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerListWorkteamsResponse *> *)listWorkteams:(AWSapi.sagemakerListWorkteamsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListWorkteams"
                   outputClass:[AWSapi.sagemakerListWorkteamsResponse class]];
}

- (void)listWorkteams:(AWSapi.sagemakerListWorkteamsRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerListWorkteamsResponse *response, NSError *error))completionHandler {
    [[self listWorkteams:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerListWorkteamsResponse *> * _Nonnull task) {
        AWSapi.sagemakerListWorkteamsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerRenderUiTemplateResponse *> *)renderUiTemplate:(AWSapi.sagemakerRenderUiTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"RenderUiTemplate"
                   outputClass:[AWSapi.sagemakerRenderUiTemplateResponse class]];
}

- (void)renderUiTemplate:(AWSapi.sagemakerRenderUiTemplateRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerRenderUiTemplateResponse *response, NSError *error))completionHandler {
    [[self renderUiTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerRenderUiTemplateResponse *> * _Nonnull task) {
        AWSapi.sagemakerRenderUiTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerSearchResponse *> *)search:(AWSapi.sagemakerSearchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"Search"
                   outputClass:[AWSapi.sagemakerSearchResponse class]];
}

- (void)search:(AWSapi.sagemakerSearchRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerSearchResponse *response, NSError *error))completionHandler {
    [[self search:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerSearchResponse *> * _Nonnull task) {
        AWSapi.sagemakerSearchResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)startMonitoringSchedule:(AWSapi.sagemakerStartMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StartMonitoringSchedule"
                   outputClass:nil];
}

- (void)startMonitoringSchedule:(AWSapi.sagemakerStartMonitoringScheduleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self startMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)startNotebookInstance:(AWSapi.sagemakerStartNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StartNotebookInstance"
                   outputClass:nil];
}

- (void)startNotebookInstance:(AWSapi.sagemakerStartNotebookInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self startNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopAutoMLJob:(AWSapi.sagemakerStopAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopAutoMLJob"
                   outputClass:nil];
}

- (void)stopAutoMLJob:(AWSapi.sagemakerStopAutoMLJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopCompilationJob:(AWSapi.sagemakerStopCompilationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopCompilationJob"
                   outputClass:nil];
}

- (void)stopCompilationJob:(AWSapi.sagemakerStopCompilationJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopCompilationJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopHyperParameterTuningJob:(AWSapi.sagemakerStopHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopHyperParameterTuningJob"
                   outputClass:nil];
}

- (void)stopHyperParameterTuningJob:(AWSapi.sagemakerStopHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopLabelingJob:(AWSapi.sagemakerStopLabelingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopLabelingJob"
                   outputClass:nil];
}

- (void)stopLabelingJob:(AWSapi.sagemakerStopLabelingJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopLabelingJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopMonitoringSchedule:(AWSapi.sagemakerStopMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopMonitoringSchedule"
                   outputClass:nil];
}

- (void)stopMonitoringSchedule:(AWSapi.sagemakerStopMonitoringScheduleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopNotebookInstance:(AWSapi.sagemakerStopNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopNotebookInstance"
                   outputClass:nil];
}

- (void)stopNotebookInstance:(AWSapi.sagemakerStopNotebookInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopProcessingJob:(AWSapi.sagemakerStopProcessingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopProcessingJob"
                   outputClass:nil];
}

- (void)stopProcessingJob:(AWSapi.sagemakerStopProcessingJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopProcessingJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopTrainingJob:(AWSapi.sagemakerStopTrainingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopTrainingJob"
                   outputClass:nil];
}

- (void)stopTrainingJob:(AWSapi.sagemakerStopTrainingJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopTrainingJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopTransformJob:(AWSapi.sagemakerStopTransformJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopTransformJob"
                   outputClass:nil];
}

- (void)stopTransformJob:(AWSapi.sagemakerStopTransformJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopTransformJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateCodeRepositoryOutput *> *)updateCodeRepository:(AWSapi.sagemakerUpdateCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateCodeRepository"
                   outputClass:[AWSapi.sagemakerUpdateCodeRepositoryOutput class]];
}

- (void)updateCodeRepository:(AWSapi.sagemakerUpdateCodeRepositoryInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateCodeRepositoryOutput *response, NSError *error))completionHandler {
    [[self updateCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateCodeRepositoryOutput *> * _Nonnull task) {
        AWSapi.sagemakerUpdateCodeRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateDomainResponse *> *)updateDomain:(AWSapi.sagemakerUpdateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateDomain"
                   outputClass:[AWSapi.sagemakerUpdateDomainResponse class]];
}

- (void)updateDomain:(AWSapi.sagemakerUpdateDomainRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateDomainResponse *response, NSError *error))completionHandler {
    [[self updateDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateDomainResponse *> * _Nonnull task) {
        AWSapi.sagemakerUpdateDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateEndpointOutput *> *)updateEndpoint:(AWSapi.sagemakerUpdateEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateEndpoint"
                   outputClass:[AWSapi.sagemakerUpdateEndpointOutput class]];
}

- (void)updateEndpoint:(AWSapi.sagemakerUpdateEndpointInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateEndpointOutput *response, NSError *error))completionHandler {
    [[self updateEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateEndpointOutput *> * _Nonnull task) {
        AWSapi.sagemakerUpdateEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput *> *)updateEndpointWeightsAndCapacities:(AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateEndpointWeightsAndCapacities"
                   outputClass:[AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput class]];
}

- (void)updateEndpointWeightsAndCapacities:(AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput *response, NSError *error))completionHandler {
    [[self updateEndpointWeightsAndCapacities:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput *> * _Nonnull task) {
        AWSapi.sagemakerUpdateEndpointWeightsAndCapacitiesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateExperimentResponse *> *)updateExperiment:(AWSapi.sagemakerUpdateExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateExperiment"
                   outputClass:[AWSapi.sagemakerUpdateExperimentResponse class]];
}

- (void)updateExperiment:(AWSapi.sagemakerUpdateExperimentRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateExperimentResponse *response, NSError *error))completionHandler {
    [[self updateExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateExperimentResponse *> * _Nonnull task) {
        AWSapi.sagemakerUpdateExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateMonitoringScheduleResponse *> *)updateMonitoringSchedule:(AWSapi.sagemakerUpdateMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateMonitoringSchedule"
                   outputClass:[AWSapi.sagemakerUpdateMonitoringScheduleResponse class]];
}

- (void)updateMonitoringSchedule:(AWSapi.sagemakerUpdateMonitoringScheduleRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateMonitoringScheduleResponse *response, NSError *error))completionHandler {
    [[self updateMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateMonitoringScheduleResponse *> * _Nonnull task) {
        AWSapi.sagemakerUpdateMonitoringScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateNotebookInstanceOutput *> *)updateNotebookInstance:(AWSapi.sagemakerUpdateNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateNotebookInstance"
                   outputClass:[AWSapi.sagemakerUpdateNotebookInstanceOutput class]];
}

- (void)updateNotebookInstance:(AWSapi.sagemakerUpdateNotebookInstanceInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateNotebookInstanceOutput *response, NSError *error))completionHandler {
    [[self updateNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateNotebookInstanceOutput *> * _Nonnull task) {
        AWSapi.sagemakerUpdateNotebookInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput *> *)updateNotebookInstanceLifecycleConfig:(AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateNotebookInstanceLifecycleConfig"
                   outputClass:[AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput class]];
}

- (void)updateNotebookInstanceLifecycleConfig:(AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput *response, NSError *error))completionHandler {
    [[self updateNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput *> * _Nonnull task) {
        AWSapi.sagemakerUpdateNotebookInstanceLifecycleConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateTrialResponse *> *)updateTrial:(AWSapi.sagemakerUpdateTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateTrial"
                   outputClass:[AWSapi.sagemakerUpdateTrialResponse class]];
}

- (void)updateTrial:(AWSapi.sagemakerUpdateTrialRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateTrialResponse *response, NSError *error))completionHandler {
    [[self updateTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateTrialResponse *> * _Nonnull task) {
        AWSapi.sagemakerUpdateTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateTrialComponentResponse *> *)updateTrialComponent:(AWSapi.sagemakerUpdateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateTrialComponent"
                   outputClass:[AWSapi.sagemakerUpdateTrialComponentResponse class]];
}

- (void)updateTrialComponent:(AWSapi.sagemakerUpdateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self updateTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateTrialComponentResponse *> * _Nonnull task) {
        AWSapi.sagemakerUpdateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateUserProfileResponse *> *)updateUserProfile:(AWSapi.sagemakerUpdateUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateUserProfile"
                   outputClass:[AWSapi.sagemakerUpdateUserProfileResponse class]];
}

- (void)updateUserProfile:(AWSapi.sagemakerUpdateUserProfileRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateUserProfileResponse *response, NSError *error))completionHandler {
    [[self updateUserProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateUserProfileResponse *> * _Nonnull task) {
        AWSapi.sagemakerUpdateUserProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateWorkforceResponse *> *)updateWorkforce:(AWSapi.sagemakerUpdateWorkforceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateWorkforce"
                   outputClass:[AWSapi.sagemakerUpdateWorkforceResponse class]];
}

- (void)updateWorkforce:(AWSapi.sagemakerUpdateWorkforceRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateWorkforceResponse *response, NSError *error))completionHandler {
    [[self updateWorkforce:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateWorkforceResponse *> * _Nonnull task) {
        AWSapi.sagemakerUpdateWorkforceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.sagemakerUpdateWorkteamResponse *> *)updateWorkteam:(AWSapi.sagemakerUpdateWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateWorkteam"
                   outputClass:[AWSapi.sagemakerUpdateWorkteamResponse class]];
}

- (void)updateWorkteam:(AWSapi.sagemakerUpdateWorkteamRequest *)request
     completionHandler:(void (^)(AWSapi.sagemakerUpdateWorkteamResponse *response, NSError *error))completionHandler {
    [[self updateWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.sagemakerUpdateWorkteamResponse *> * _Nonnull task) {
        AWSapi.sagemakerUpdateWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
