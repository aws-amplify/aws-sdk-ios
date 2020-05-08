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

#import "AWSSageMakerServiceService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSageMakerServiceResources.h"

static NSString *const AWSInfoSageMakerService = @"SageMakerService";
NSString *const AWSSageMakerServiceSDKVersion = @"2.13.3";


@interface AWSSageMakerServiceResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSageMakerServiceResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConflictException" : @(AWSSageMakerServiceErrorConflict),
                            @"ResourceInUse" : @(AWSSageMakerServiceErrorResourceInUse),
                            @"ResourceLimitExceeded" : @(AWSSageMakerServiceErrorResourceLimitExceeded),
                            @"ResourceNotFound" : @(AWSSageMakerServiceErrorResourceNotFound),
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
	                *error = [NSError errorWithDomain:AWSSageMakerServiceErrorDomain
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
        *error = [NSError errorWithDomain:AWSSageMakerServiceErrorDomain
                                     code:AWSSageMakerServiceErrorUnknown
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

@interface AWSSageMakerServiceRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSageMakerServiceRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSageMakerService()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSageMakerService

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSageMakerServiceSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSageMakerService versions need to match. Check your SDK installation. AWSCore: %@ AWSSageMakerService: %@", AWSiOSSDKVersion, AWSSageMakerServiceSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSageMakerService {
    static AWSSageMakerService *_defaultSageMakerService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSageMakerService];
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
        _defaultSageMakerService = [[AWSSageMakerService alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSageMakerService;
}

+ (void)registerSageMakerServiceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSageMakerService alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SageMakerServiceForKey:(NSString *)key {
    @synchronized(self) {
        AWSSageMakerService *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSageMakerService
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSageMakerService registerSageMakerServiceWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSageMakerServiceForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSageMakerService` or `+ SageMakerServiceForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSageMakerService
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSageMakerService];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSageMakerServiceRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSageMakerServiceResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSageMakerServiceResponseSerializer alloc] initWithJSONDefinition:[[AWSSageMakerServiceResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSageMakerServiceAddTagsOutput *> *)addTags:(AWSSageMakerServiceAddTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"AddTags"
                   outputClass:[AWSSageMakerServiceAddTagsOutput class]];
}

- (void)addTags:(AWSSageMakerServiceAddTagsInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceAddTagsOutput *response, NSError *error))completionHandler {
    [[self addTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceAddTagsOutput *> * _Nonnull task) {
        AWSSageMakerServiceAddTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceAssociateTrialComponentResponse *> *)associateTrialComponent:(AWSSageMakerServiceAssociateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"AssociateTrialComponent"
                   outputClass:[AWSSageMakerServiceAssociateTrialComponentResponse class]];
}

- (void)associateTrialComponent:(AWSSageMakerServiceAssociateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceAssociateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self associateTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceAssociateTrialComponentResponse *> * _Nonnull task) {
        AWSSageMakerServiceAssociateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateAlgorithmOutput *> *)createAlgorithm:(AWSSageMakerServiceCreateAlgorithmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateAlgorithm"
                   outputClass:[AWSSageMakerServiceCreateAlgorithmOutput class]];
}

- (void)createAlgorithm:(AWSSageMakerServiceCreateAlgorithmInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateAlgorithmOutput *response, NSError *error))completionHandler {
    [[self createAlgorithm:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateAlgorithmOutput *> * _Nonnull task) {
        AWSSageMakerServiceCreateAlgorithmOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateAppResponse *> *)createApp:(AWSSageMakerServiceCreateAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateApp"
                   outputClass:[AWSSageMakerServiceCreateAppResponse class]];
}

- (void)createApp:(AWSSageMakerServiceCreateAppRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateAppResponse *response, NSError *error))completionHandler {
    [[self createApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateAppResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateAutoMLJobResponse *> *)createAutoMLJob:(AWSSageMakerServiceCreateAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateAutoMLJob"
                   outputClass:[AWSSageMakerServiceCreateAutoMLJobResponse class]];
}

- (void)createAutoMLJob:(AWSSageMakerServiceCreateAutoMLJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateAutoMLJobResponse *response, NSError *error))completionHandler {
    [[self createAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateAutoMLJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateAutoMLJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateCodeRepositoryOutput *> *)createCodeRepository:(AWSSageMakerServiceCreateCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateCodeRepository"
                   outputClass:[AWSSageMakerServiceCreateCodeRepositoryOutput class]];
}

- (void)createCodeRepository:(AWSSageMakerServiceCreateCodeRepositoryInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateCodeRepositoryOutput *response, NSError *error))completionHandler {
    [[self createCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateCodeRepositoryOutput *> * _Nonnull task) {
        AWSSageMakerServiceCreateCodeRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateCompilationJobResponse *> *)createCompilationJob:(AWSSageMakerServiceCreateCompilationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateCompilationJob"
                   outputClass:[AWSSageMakerServiceCreateCompilationJobResponse class]];
}

- (void)createCompilationJob:(AWSSageMakerServiceCreateCompilationJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateCompilationJobResponse *response, NSError *error))completionHandler {
    [[self createCompilationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateCompilationJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateCompilationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateDomainResponse *> *)createDomain:(AWSSageMakerServiceCreateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateDomain"
                   outputClass:[AWSSageMakerServiceCreateDomainResponse class]];
}

- (void)createDomain:(AWSSageMakerServiceCreateDomainRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateDomainResponse *response, NSError *error))completionHandler {
    [[self createDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateDomainResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateEndpointOutput *> *)createEndpoint:(AWSSageMakerServiceCreateEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateEndpoint"
                   outputClass:[AWSSageMakerServiceCreateEndpointOutput class]];
}

- (void)createEndpoint:(AWSSageMakerServiceCreateEndpointInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateEndpointOutput *response, NSError *error))completionHandler {
    [[self createEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateEndpointOutput *> * _Nonnull task) {
        AWSSageMakerServiceCreateEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateEndpointConfigOutput *> *)createEndpointConfig:(AWSSageMakerServiceCreateEndpointConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateEndpointConfig"
                   outputClass:[AWSSageMakerServiceCreateEndpointConfigOutput class]];
}

- (void)createEndpointConfig:(AWSSageMakerServiceCreateEndpointConfigInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateEndpointConfigOutput *response, NSError *error))completionHandler {
    [[self createEndpointConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateEndpointConfigOutput *> * _Nonnull task) {
        AWSSageMakerServiceCreateEndpointConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateExperimentResponse *> *)createExperiment:(AWSSageMakerServiceCreateExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateExperiment"
                   outputClass:[AWSSageMakerServiceCreateExperimentResponse class]];
}

- (void)createExperiment:(AWSSageMakerServiceCreateExperimentRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateExperimentResponse *response, NSError *error))completionHandler {
    [[self createExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateExperimentResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateFlowDefinitionResponse *> *)createFlowDefinition:(AWSSageMakerServiceCreateFlowDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateFlowDefinition"
                   outputClass:[AWSSageMakerServiceCreateFlowDefinitionResponse class]];
}

- (void)createFlowDefinition:(AWSSageMakerServiceCreateFlowDefinitionRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateFlowDefinitionResponse *response, NSError *error))completionHandler {
    [[self createFlowDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateFlowDefinitionResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateFlowDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateHumanTaskUiResponse *> *)createHumanTaskUi:(AWSSageMakerServiceCreateHumanTaskUiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateHumanTaskUi"
                   outputClass:[AWSSageMakerServiceCreateHumanTaskUiResponse class]];
}

- (void)createHumanTaskUi:(AWSSageMakerServiceCreateHumanTaskUiRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateHumanTaskUiResponse *response, NSError *error))completionHandler {
    [[self createHumanTaskUi:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateHumanTaskUiResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateHumanTaskUiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateHyperParameterTuningJobResponse *> *)createHyperParameterTuningJob:(AWSSageMakerServiceCreateHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateHyperParameterTuningJob"
                   outputClass:[AWSSageMakerServiceCreateHyperParameterTuningJobResponse class]];
}

- (void)createHyperParameterTuningJob:(AWSSageMakerServiceCreateHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateHyperParameterTuningJobResponse *response, NSError *error))completionHandler {
    [[self createHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateHyperParameterTuningJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateHyperParameterTuningJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateLabelingJobResponse *> *)createLabelingJob:(AWSSageMakerServiceCreateLabelingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateLabelingJob"
                   outputClass:[AWSSageMakerServiceCreateLabelingJobResponse class]];
}

- (void)createLabelingJob:(AWSSageMakerServiceCreateLabelingJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateLabelingJobResponse *response, NSError *error))completionHandler {
    [[self createLabelingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateLabelingJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateLabelingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateModelOutput *> *)createModel:(AWSSageMakerServiceCreateModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateModel"
                   outputClass:[AWSSageMakerServiceCreateModelOutput class]];
}

- (void)createModel:(AWSSageMakerServiceCreateModelInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateModelOutput *response, NSError *error))completionHandler {
    [[self createModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateModelOutput *> * _Nonnull task) {
        AWSSageMakerServiceCreateModelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateModelPackageOutput *> *)createModelPackage:(AWSSageMakerServiceCreateModelPackageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateModelPackage"
                   outputClass:[AWSSageMakerServiceCreateModelPackageOutput class]];
}

- (void)createModelPackage:(AWSSageMakerServiceCreateModelPackageInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateModelPackageOutput *response, NSError *error))completionHandler {
    [[self createModelPackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateModelPackageOutput *> * _Nonnull task) {
        AWSSageMakerServiceCreateModelPackageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateMonitoringScheduleResponse *> *)createMonitoringSchedule:(AWSSageMakerServiceCreateMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateMonitoringSchedule"
                   outputClass:[AWSSageMakerServiceCreateMonitoringScheduleResponse class]];
}

- (void)createMonitoringSchedule:(AWSSageMakerServiceCreateMonitoringScheduleRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateMonitoringScheduleResponse *response, NSError *error))completionHandler {
    [[self createMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateMonitoringScheduleResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateMonitoringScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateNotebookInstanceOutput *> *)createNotebookInstance:(AWSSageMakerServiceCreateNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateNotebookInstance"
                   outputClass:[AWSSageMakerServiceCreateNotebookInstanceOutput class]];
}

- (void)createNotebookInstance:(AWSSageMakerServiceCreateNotebookInstanceInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateNotebookInstanceOutput *response, NSError *error))completionHandler {
    [[self createNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateNotebookInstanceOutput *> * _Nonnull task) {
        AWSSageMakerServiceCreateNotebookInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput *> *)createNotebookInstanceLifecycleConfig:(AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateNotebookInstanceLifecycleConfig"
                   outputClass:[AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput class]];
}

- (void)createNotebookInstanceLifecycleConfig:(AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput *response, NSError *error))completionHandler {
    [[self createNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput *> * _Nonnull task) {
        AWSSageMakerServiceCreateNotebookInstanceLifecycleConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreatePresignedDomainUrlResponse *> *)createPresignedDomainUrl:(AWSSageMakerServiceCreatePresignedDomainUrlRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreatePresignedDomainUrl"
                   outputClass:[AWSSageMakerServiceCreatePresignedDomainUrlResponse class]];
}

- (void)createPresignedDomainUrl:(AWSSageMakerServiceCreatePresignedDomainUrlRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreatePresignedDomainUrlResponse *response, NSError *error))completionHandler {
    [[self createPresignedDomainUrl:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreatePresignedDomainUrlResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreatePresignedDomainUrlResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput *> *)createPresignedNotebookInstanceUrl:(AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreatePresignedNotebookInstanceUrl"
                   outputClass:[AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput class]];
}

- (void)createPresignedNotebookInstanceUrl:(AWSSageMakerServiceCreatePresignedNotebookInstanceUrlInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput *response, NSError *error))completionHandler {
    [[self createPresignedNotebookInstanceUrl:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput *> * _Nonnull task) {
        AWSSageMakerServiceCreatePresignedNotebookInstanceUrlOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateProcessingJobResponse *> *)createProcessingJob:(AWSSageMakerServiceCreateProcessingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateProcessingJob"
                   outputClass:[AWSSageMakerServiceCreateProcessingJobResponse class]];
}

- (void)createProcessingJob:(AWSSageMakerServiceCreateProcessingJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateProcessingJobResponse *response, NSError *error))completionHandler {
    [[self createProcessingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateProcessingJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateProcessingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateTrainingJobResponse *> *)createTrainingJob:(AWSSageMakerServiceCreateTrainingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTrainingJob"
                   outputClass:[AWSSageMakerServiceCreateTrainingJobResponse class]];
}

- (void)createTrainingJob:(AWSSageMakerServiceCreateTrainingJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateTrainingJobResponse *response, NSError *error))completionHandler {
    [[self createTrainingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateTrainingJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateTrainingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateTransformJobResponse *> *)createTransformJob:(AWSSageMakerServiceCreateTransformJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTransformJob"
                   outputClass:[AWSSageMakerServiceCreateTransformJobResponse class]];
}

- (void)createTransformJob:(AWSSageMakerServiceCreateTransformJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateTransformJobResponse *response, NSError *error))completionHandler {
    [[self createTransformJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateTransformJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateTransformJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateTrialResponse *> *)createTrial:(AWSSageMakerServiceCreateTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTrial"
                   outputClass:[AWSSageMakerServiceCreateTrialResponse class]];
}

- (void)createTrial:(AWSSageMakerServiceCreateTrialRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateTrialResponse *response, NSError *error))completionHandler {
    [[self createTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateTrialResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateTrialComponentResponse *> *)createTrialComponent:(AWSSageMakerServiceCreateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTrialComponent"
                   outputClass:[AWSSageMakerServiceCreateTrialComponentResponse class]];
}

- (void)createTrialComponent:(AWSSageMakerServiceCreateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self createTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateTrialComponentResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateUserProfileResponse *> *)createUserProfile:(AWSSageMakerServiceCreateUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateUserProfile"
                   outputClass:[AWSSageMakerServiceCreateUserProfileResponse class]];
}

- (void)createUserProfile:(AWSSageMakerServiceCreateUserProfileRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateUserProfileResponse *response, NSError *error))completionHandler {
    [[self createUserProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateUserProfileResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateUserProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceCreateWorkteamResponse *> *)createWorkteam:(AWSSageMakerServiceCreateWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateWorkteam"
                   outputClass:[AWSSageMakerServiceCreateWorkteamResponse class]];
}

- (void)createWorkteam:(AWSSageMakerServiceCreateWorkteamRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceCreateWorkteamResponse *response, NSError *error))completionHandler {
    [[self createWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceCreateWorkteamResponse *> * _Nonnull task) {
        AWSSageMakerServiceCreateWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAlgorithm:(AWSSageMakerServiceDeleteAlgorithmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteAlgorithm"
                   outputClass:nil];
}

- (void)deleteAlgorithm:(AWSSageMakerServiceDeleteAlgorithmInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAlgorithm:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteApp:(AWSSageMakerServiceDeleteAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteApp"
                   outputClass:nil];
}

- (void)deleteApp:(AWSSageMakerServiceDeleteAppRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteApp:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCodeRepository:(AWSSageMakerServiceDeleteCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteCodeRepository"
                   outputClass:nil];
}

- (void)deleteCodeRepository:(AWSSageMakerServiceDeleteCodeRepositoryInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDomain:(AWSSageMakerServiceDeleteDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteDomain"
                   outputClass:nil];
}

- (void)deleteDomain:(AWSSageMakerServiceDeleteDomainRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDomain:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEndpoint:(AWSSageMakerServiceDeleteEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteEndpoint"
                   outputClass:nil];
}

- (void)deleteEndpoint:(AWSSageMakerServiceDeleteEndpointInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEndpoint:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEndpointConfig:(AWSSageMakerServiceDeleteEndpointConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteEndpointConfig"
                   outputClass:nil];
}

- (void)deleteEndpointConfig:(AWSSageMakerServiceDeleteEndpointConfigInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEndpointConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDeleteExperimentResponse *> *)deleteExperiment:(AWSSageMakerServiceDeleteExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteExperiment"
                   outputClass:[AWSSageMakerServiceDeleteExperimentResponse class]];
}

- (void)deleteExperiment:(AWSSageMakerServiceDeleteExperimentRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDeleteExperimentResponse *response, NSError *error))completionHandler {
    [[self deleteExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDeleteExperimentResponse *> * _Nonnull task) {
        AWSSageMakerServiceDeleteExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDeleteFlowDefinitionResponse *> *)deleteFlowDefinition:(AWSSageMakerServiceDeleteFlowDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteFlowDefinition"
                   outputClass:[AWSSageMakerServiceDeleteFlowDefinitionResponse class]];
}

- (void)deleteFlowDefinition:(AWSSageMakerServiceDeleteFlowDefinitionRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDeleteFlowDefinitionResponse *response, NSError *error))completionHandler {
    [[self deleteFlowDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDeleteFlowDefinitionResponse *> * _Nonnull task) {
        AWSSageMakerServiceDeleteFlowDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteModel:(AWSSageMakerServiceDeleteModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteModel"
                   outputClass:nil];
}

- (void)deleteModel:(AWSSageMakerServiceDeleteModelInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteModel:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteModelPackage:(AWSSageMakerServiceDeleteModelPackageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteModelPackage"
                   outputClass:nil];
}

- (void)deleteModelPackage:(AWSSageMakerServiceDeleteModelPackageInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteModelPackage:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteMonitoringSchedule:(AWSSageMakerServiceDeleteMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteMonitoringSchedule"
                   outputClass:nil];
}

- (void)deleteMonitoringSchedule:(AWSSageMakerServiceDeleteMonitoringScheduleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNotebookInstance:(AWSSageMakerServiceDeleteNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteNotebookInstance"
                   outputClass:nil];
}

- (void)deleteNotebookInstance:(AWSSageMakerServiceDeleteNotebookInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNotebookInstanceLifecycleConfig:(AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteNotebookInstanceLifecycleConfig"
                   outputClass:nil];
}

- (void)deleteNotebookInstanceLifecycleConfig:(AWSSageMakerServiceDeleteNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDeleteTagsOutput *> *)deleteTags:(AWSSageMakerServiceDeleteTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteTags"
                   outputClass:[AWSSageMakerServiceDeleteTagsOutput class]];
}

- (void)deleteTags:(AWSSageMakerServiceDeleteTagsInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceDeleteTagsOutput *response, NSError *error))completionHandler {
    [[self deleteTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDeleteTagsOutput *> * _Nonnull task) {
        AWSSageMakerServiceDeleteTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDeleteTrialResponse *> *)deleteTrial:(AWSSageMakerServiceDeleteTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteTrial"
                   outputClass:[AWSSageMakerServiceDeleteTrialResponse class]];
}

- (void)deleteTrial:(AWSSageMakerServiceDeleteTrialRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDeleteTrialResponse *response, NSError *error))completionHandler {
    [[self deleteTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDeleteTrialResponse *> * _Nonnull task) {
        AWSSageMakerServiceDeleteTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDeleteTrialComponentResponse *> *)deleteTrialComponent:(AWSSageMakerServiceDeleteTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteTrialComponent"
                   outputClass:[AWSSageMakerServiceDeleteTrialComponentResponse class]];
}

- (void)deleteTrialComponent:(AWSSageMakerServiceDeleteTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDeleteTrialComponentResponse *response, NSError *error))completionHandler {
    [[self deleteTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDeleteTrialComponentResponse *> * _Nonnull task) {
        AWSSageMakerServiceDeleteTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUserProfile:(AWSSageMakerServiceDeleteUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteUserProfile"
                   outputClass:nil];
}

- (void)deleteUserProfile:(AWSSageMakerServiceDeleteUserProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUserProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDeleteWorkteamResponse *> *)deleteWorkteam:(AWSSageMakerServiceDeleteWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteWorkteam"
                   outputClass:[AWSSageMakerServiceDeleteWorkteamResponse class]];
}

- (void)deleteWorkteam:(AWSSageMakerServiceDeleteWorkteamRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDeleteWorkteamResponse *response, NSError *error))completionHandler {
    [[self deleteWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDeleteWorkteamResponse *> * _Nonnull task) {
        AWSSageMakerServiceDeleteWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeAlgorithmOutput *> *)describeAlgorithm:(AWSSageMakerServiceDescribeAlgorithmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeAlgorithm"
                   outputClass:[AWSSageMakerServiceDescribeAlgorithmOutput class]];
}

- (void)describeAlgorithm:(AWSSageMakerServiceDescribeAlgorithmInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeAlgorithmOutput *response, NSError *error))completionHandler {
    [[self describeAlgorithm:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeAlgorithmOutput *> * _Nonnull task) {
        AWSSageMakerServiceDescribeAlgorithmOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeAppResponse *> *)describeApp:(AWSSageMakerServiceDescribeAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeApp"
                   outputClass:[AWSSageMakerServiceDescribeAppResponse class]];
}

- (void)describeApp:(AWSSageMakerServiceDescribeAppRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeAppResponse *response, NSError *error))completionHandler {
    [[self describeApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeAppResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeAutoMLJobResponse *> *)describeAutoMLJob:(AWSSageMakerServiceDescribeAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeAutoMLJob"
                   outputClass:[AWSSageMakerServiceDescribeAutoMLJobResponse class]];
}

- (void)describeAutoMLJob:(AWSSageMakerServiceDescribeAutoMLJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeAutoMLJobResponse *response, NSError *error))completionHandler {
    [[self describeAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeAutoMLJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeAutoMLJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeCodeRepositoryOutput *> *)describeCodeRepository:(AWSSageMakerServiceDescribeCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeCodeRepository"
                   outputClass:[AWSSageMakerServiceDescribeCodeRepositoryOutput class]];
}

- (void)describeCodeRepository:(AWSSageMakerServiceDescribeCodeRepositoryInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeCodeRepositoryOutput *response, NSError *error))completionHandler {
    [[self describeCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeCodeRepositoryOutput *> * _Nonnull task) {
        AWSSageMakerServiceDescribeCodeRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeCompilationJobResponse *> *)describeCompilationJob:(AWSSageMakerServiceDescribeCompilationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeCompilationJob"
                   outputClass:[AWSSageMakerServiceDescribeCompilationJobResponse class]];
}

- (void)describeCompilationJob:(AWSSageMakerServiceDescribeCompilationJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeCompilationJobResponse *response, NSError *error))completionHandler {
    [[self describeCompilationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeCompilationJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeCompilationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeDomainResponse *> *)describeDomain:(AWSSageMakerServiceDescribeDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeDomain"
                   outputClass:[AWSSageMakerServiceDescribeDomainResponse class]];
}

- (void)describeDomain:(AWSSageMakerServiceDescribeDomainRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeDomainResponse *response, NSError *error))completionHandler {
    [[self describeDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeDomainResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeEndpointOutput *> *)describeEndpoint:(AWSSageMakerServiceDescribeEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeEndpoint"
                   outputClass:[AWSSageMakerServiceDescribeEndpointOutput class]];
}

- (void)describeEndpoint:(AWSSageMakerServiceDescribeEndpointInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeEndpointOutput *response, NSError *error))completionHandler {
    [[self describeEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeEndpointOutput *> * _Nonnull task) {
        AWSSageMakerServiceDescribeEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeEndpointConfigOutput *> *)describeEndpointConfig:(AWSSageMakerServiceDescribeEndpointConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeEndpointConfig"
                   outputClass:[AWSSageMakerServiceDescribeEndpointConfigOutput class]];
}

- (void)describeEndpointConfig:(AWSSageMakerServiceDescribeEndpointConfigInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeEndpointConfigOutput *response, NSError *error))completionHandler {
    [[self describeEndpointConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeEndpointConfigOutput *> * _Nonnull task) {
        AWSSageMakerServiceDescribeEndpointConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeExperimentResponse *> *)describeExperiment:(AWSSageMakerServiceDescribeExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeExperiment"
                   outputClass:[AWSSageMakerServiceDescribeExperimentResponse class]];
}

- (void)describeExperiment:(AWSSageMakerServiceDescribeExperimentRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeExperimentResponse *response, NSError *error))completionHandler {
    [[self describeExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeExperimentResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeFlowDefinitionResponse *> *)describeFlowDefinition:(AWSSageMakerServiceDescribeFlowDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeFlowDefinition"
                   outputClass:[AWSSageMakerServiceDescribeFlowDefinitionResponse class]];
}

- (void)describeFlowDefinition:(AWSSageMakerServiceDescribeFlowDefinitionRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeFlowDefinitionResponse *response, NSError *error))completionHandler {
    [[self describeFlowDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeFlowDefinitionResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeFlowDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeHumanTaskUiResponse *> *)describeHumanTaskUi:(AWSSageMakerServiceDescribeHumanTaskUiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeHumanTaskUi"
                   outputClass:[AWSSageMakerServiceDescribeHumanTaskUiResponse class]];
}

- (void)describeHumanTaskUi:(AWSSageMakerServiceDescribeHumanTaskUiRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeHumanTaskUiResponse *response, NSError *error))completionHandler {
    [[self describeHumanTaskUi:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeHumanTaskUiResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeHumanTaskUiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeHyperParameterTuningJobResponse *> *)describeHyperParameterTuningJob:(AWSSageMakerServiceDescribeHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeHyperParameterTuningJob"
                   outputClass:[AWSSageMakerServiceDescribeHyperParameterTuningJobResponse class]];
}

- (void)describeHyperParameterTuningJob:(AWSSageMakerServiceDescribeHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeHyperParameterTuningJobResponse *response, NSError *error))completionHandler {
    [[self describeHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeHyperParameterTuningJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeHyperParameterTuningJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeLabelingJobResponse *> *)describeLabelingJob:(AWSSageMakerServiceDescribeLabelingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeLabelingJob"
                   outputClass:[AWSSageMakerServiceDescribeLabelingJobResponse class]];
}

- (void)describeLabelingJob:(AWSSageMakerServiceDescribeLabelingJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeLabelingJobResponse *response, NSError *error))completionHandler {
    [[self describeLabelingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeLabelingJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeLabelingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeModelOutput *> *)describeModel:(AWSSageMakerServiceDescribeModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeModel"
                   outputClass:[AWSSageMakerServiceDescribeModelOutput class]];
}

- (void)describeModel:(AWSSageMakerServiceDescribeModelInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeModelOutput *response, NSError *error))completionHandler {
    [[self describeModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeModelOutput *> * _Nonnull task) {
        AWSSageMakerServiceDescribeModelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeModelPackageOutput *> *)describeModelPackage:(AWSSageMakerServiceDescribeModelPackageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeModelPackage"
                   outputClass:[AWSSageMakerServiceDescribeModelPackageOutput class]];
}

- (void)describeModelPackage:(AWSSageMakerServiceDescribeModelPackageInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeModelPackageOutput *response, NSError *error))completionHandler {
    [[self describeModelPackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeModelPackageOutput *> * _Nonnull task) {
        AWSSageMakerServiceDescribeModelPackageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeMonitoringScheduleResponse *> *)describeMonitoringSchedule:(AWSSageMakerServiceDescribeMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeMonitoringSchedule"
                   outputClass:[AWSSageMakerServiceDescribeMonitoringScheduleResponse class]];
}

- (void)describeMonitoringSchedule:(AWSSageMakerServiceDescribeMonitoringScheduleRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeMonitoringScheduleResponse *response, NSError *error))completionHandler {
    [[self describeMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeMonitoringScheduleResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeMonitoringScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeNotebookInstanceOutput *> *)describeNotebookInstance:(AWSSageMakerServiceDescribeNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeNotebookInstance"
                   outputClass:[AWSSageMakerServiceDescribeNotebookInstanceOutput class]];
}

- (void)describeNotebookInstance:(AWSSageMakerServiceDescribeNotebookInstanceInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeNotebookInstanceOutput *response, NSError *error))completionHandler {
    [[self describeNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeNotebookInstanceOutput *> * _Nonnull task) {
        AWSSageMakerServiceDescribeNotebookInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput *> *)describeNotebookInstanceLifecycleConfig:(AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeNotebookInstanceLifecycleConfig"
                   outputClass:[AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput class]];
}

- (void)describeNotebookInstanceLifecycleConfig:(AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput *response, NSError *error))completionHandler {
    [[self describeNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput *> * _Nonnull task) {
        AWSSageMakerServiceDescribeNotebookInstanceLifecycleConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeProcessingJobResponse *> *)describeProcessingJob:(AWSSageMakerServiceDescribeProcessingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeProcessingJob"
                   outputClass:[AWSSageMakerServiceDescribeProcessingJobResponse class]];
}

- (void)describeProcessingJob:(AWSSageMakerServiceDescribeProcessingJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeProcessingJobResponse *response, NSError *error))completionHandler {
    [[self describeProcessingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeProcessingJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeProcessingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeSubscribedWorkteamResponse *> *)describeSubscribedWorkteam:(AWSSageMakerServiceDescribeSubscribedWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeSubscribedWorkteam"
                   outputClass:[AWSSageMakerServiceDescribeSubscribedWorkteamResponse class]];
}

- (void)describeSubscribedWorkteam:(AWSSageMakerServiceDescribeSubscribedWorkteamRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeSubscribedWorkteamResponse *response, NSError *error))completionHandler {
    [[self describeSubscribedWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeSubscribedWorkteamResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeSubscribedWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeTrainingJobResponse *> *)describeTrainingJob:(AWSSageMakerServiceDescribeTrainingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTrainingJob"
                   outputClass:[AWSSageMakerServiceDescribeTrainingJobResponse class]];
}

- (void)describeTrainingJob:(AWSSageMakerServiceDescribeTrainingJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeTrainingJobResponse *response, NSError *error))completionHandler {
    [[self describeTrainingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeTrainingJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeTrainingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeTransformJobResponse *> *)describeTransformJob:(AWSSageMakerServiceDescribeTransformJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTransformJob"
                   outputClass:[AWSSageMakerServiceDescribeTransformJobResponse class]];
}

- (void)describeTransformJob:(AWSSageMakerServiceDescribeTransformJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeTransformJobResponse *response, NSError *error))completionHandler {
    [[self describeTransformJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeTransformJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeTransformJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeTrialResponse *> *)describeTrial:(AWSSageMakerServiceDescribeTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTrial"
                   outputClass:[AWSSageMakerServiceDescribeTrialResponse class]];
}

- (void)describeTrial:(AWSSageMakerServiceDescribeTrialRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeTrialResponse *response, NSError *error))completionHandler {
    [[self describeTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeTrialResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeTrialComponentResponse *> *)describeTrialComponent:(AWSSageMakerServiceDescribeTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTrialComponent"
                   outputClass:[AWSSageMakerServiceDescribeTrialComponentResponse class]];
}

- (void)describeTrialComponent:(AWSSageMakerServiceDescribeTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeTrialComponentResponse *response, NSError *error))completionHandler {
    [[self describeTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeTrialComponentResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeUserProfileResponse *> *)describeUserProfile:(AWSSageMakerServiceDescribeUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeUserProfile"
                   outputClass:[AWSSageMakerServiceDescribeUserProfileResponse class]];
}

- (void)describeUserProfile:(AWSSageMakerServiceDescribeUserProfileRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeUserProfileResponse *response, NSError *error))completionHandler {
    [[self describeUserProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeUserProfileResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeUserProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeWorkforceResponse *> *)describeWorkforce:(AWSSageMakerServiceDescribeWorkforceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeWorkforce"
                   outputClass:[AWSSageMakerServiceDescribeWorkforceResponse class]];
}

- (void)describeWorkforce:(AWSSageMakerServiceDescribeWorkforceRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeWorkforceResponse *response, NSError *error))completionHandler {
    [[self describeWorkforce:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeWorkforceResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeWorkforceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDescribeWorkteamResponse *> *)describeWorkteam:(AWSSageMakerServiceDescribeWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeWorkteam"
                   outputClass:[AWSSageMakerServiceDescribeWorkteamResponse class]];
}

- (void)describeWorkteam:(AWSSageMakerServiceDescribeWorkteamRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDescribeWorkteamResponse *response, NSError *error))completionHandler {
    [[self describeWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDescribeWorkteamResponse *> * _Nonnull task) {
        AWSSageMakerServiceDescribeWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceDisassociateTrialComponentResponse *> *)disassociateTrialComponent:(AWSSageMakerServiceDisassociateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DisassociateTrialComponent"
                   outputClass:[AWSSageMakerServiceDisassociateTrialComponentResponse class]];
}

- (void)disassociateTrialComponent:(AWSSageMakerServiceDisassociateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceDisassociateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self disassociateTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceDisassociateTrialComponentResponse *> * _Nonnull task) {
        AWSSageMakerServiceDisassociateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceGetSearchSuggestionsResponse *> *)getSearchSuggestions:(AWSSageMakerServiceGetSearchSuggestionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"GetSearchSuggestions"
                   outputClass:[AWSSageMakerServiceGetSearchSuggestionsResponse class]];
}

- (void)getSearchSuggestions:(AWSSageMakerServiceGetSearchSuggestionsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceGetSearchSuggestionsResponse *response, NSError *error))completionHandler {
    [[self getSearchSuggestions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceGetSearchSuggestionsResponse *> * _Nonnull task) {
        AWSSageMakerServiceGetSearchSuggestionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListAlgorithmsOutput *> *)listAlgorithms:(AWSSageMakerServiceListAlgorithmsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListAlgorithms"
                   outputClass:[AWSSageMakerServiceListAlgorithmsOutput class]];
}

- (void)listAlgorithms:(AWSSageMakerServiceListAlgorithmsInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceListAlgorithmsOutput *response, NSError *error))completionHandler {
    [[self listAlgorithms:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListAlgorithmsOutput *> * _Nonnull task) {
        AWSSageMakerServiceListAlgorithmsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListAppsResponse *> *)listApps:(AWSSageMakerServiceListAppsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListApps"
                   outputClass:[AWSSageMakerServiceListAppsResponse class]];
}

- (void)listApps:(AWSSageMakerServiceListAppsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListAppsResponse *response, NSError *error))completionHandler {
    [[self listApps:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListAppsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListAppsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListAutoMLJobsResponse *> *)listAutoMLJobs:(AWSSageMakerServiceListAutoMLJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListAutoMLJobs"
                   outputClass:[AWSSageMakerServiceListAutoMLJobsResponse class]];
}

- (void)listAutoMLJobs:(AWSSageMakerServiceListAutoMLJobsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListAutoMLJobsResponse *response, NSError *error))completionHandler {
    [[self listAutoMLJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListAutoMLJobsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListAutoMLJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListCandidatesForAutoMLJobResponse *> *)listCandidatesForAutoMLJob:(AWSSageMakerServiceListCandidatesForAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListCandidatesForAutoMLJob"
                   outputClass:[AWSSageMakerServiceListCandidatesForAutoMLJobResponse class]];
}

- (void)listCandidatesForAutoMLJob:(AWSSageMakerServiceListCandidatesForAutoMLJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListCandidatesForAutoMLJobResponse *response, NSError *error))completionHandler {
    [[self listCandidatesForAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListCandidatesForAutoMLJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceListCandidatesForAutoMLJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListCodeRepositoriesOutput *> *)listCodeRepositories:(AWSSageMakerServiceListCodeRepositoriesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListCodeRepositories"
                   outputClass:[AWSSageMakerServiceListCodeRepositoriesOutput class]];
}

- (void)listCodeRepositories:(AWSSageMakerServiceListCodeRepositoriesInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceListCodeRepositoriesOutput *response, NSError *error))completionHandler {
    [[self listCodeRepositories:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListCodeRepositoriesOutput *> * _Nonnull task) {
        AWSSageMakerServiceListCodeRepositoriesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListCompilationJobsResponse *> *)listCompilationJobs:(AWSSageMakerServiceListCompilationJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListCompilationJobs"
                   outputClass:[AWSSageMakerServiceListCompilationJobsResponse class]];
}

- (void)listCompilationJobs:(AWSSageMakerServiceListCompilationJobsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListCompilationJobsResponse *response, NSError *error))completionHandler {
    [[self listCompilationJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListCompilationJobsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListCompilationJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListDomainsResponse *> *)listDomains:(AWSSageMakerServiceListDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListDomains"
                   outputClass:[AWSSageMakerServiceListDomainsResponse class]];
}

- (void)listDomains:(AWSSageMakerServiceListDomainsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListDomainsResponse *response, NSError *error))completionHandler {
    [[self listDomains:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListDomainsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListDomainsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListEndpointConfigsOutput *> *)listEndpointConfigs:(AWSSageMakerServiceListEndpointConfigsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListEndpointConfigs"
                   outputClass:[AWSSageMakerServiceListEndpointConfigsOutput class]];
}

- (void)listEndpointConfigs:(AWSSageMakerServiceListEndpointConfigsInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceListEndpointConfigsOutput *response, NSError *error))completionHandler {
    [[self listEndpointConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListEndpointConfigsOutput *> * _Nonnull task) {
        AWSSageMakerServiceListEndpointConfigsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListEndpointsOutput *> *)listEndpoints:(AWSSageMakerServiceListEndpointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListEndpoints"
                   outputClass:[AWSSageMakerServiceListEndpointsOutput class]];
}

- (void)listEndpoints:(AWSSageMakerServiceListEndpointsInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceListEndpointsOutput *response, NSError *error))completionHandler {
    [[self listEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListEndpointsOutput *> * _Nonnull task) {
        AWSSageMakerServiceListEndpointsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListExperimentsResponse *> *)listExperiments:(AWSSageMakerServiceListExperimentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListExperiments"
                   outputClass:[AWSSageMakerServiceListExperimentsResponse class]];
}

- (void)listExperiments:(AWSSageMakerServiceListExperimentsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListExperimentsResponse *response, NSError *error))completionHandler {
    [[self listExperiments:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListExperimentsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListExperimentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListFlowDefinitionsResponse *> *)listFlowDefinitions:(AWSSageMakerServiceListFlowDefinitionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListFlowDefinitions"
                   outputClass:[AWSSageMakerServiceListFlowDefinitionsResponse class]];
}

- (void)listFlowDefinitions:(AWSSageMakerServiceListFlowDefinitionsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListFlowDefinitionsResponse *response, NSError *error))completionHandler {
    [[self listFlowDefinitions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListFlowDefinitionsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListFlowDefinitionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListHumanTaskUisResponse *> *)listHumanTaskUis:(AWSSageMakerServiceListHumanTaskUisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListHumanTaskUis"
                   outputClass:[AWSSageMakerServiceListHumanTaskUisResponse class]];
}

- (void)listHumanTaskUis:(AWSSageMakerServiceListHumanTaskUisRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListHumanTaskUisResponse *response, NSError *error))completionHandler {
    [[self listHumanTaskUis:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListHumanTaskUisResponse *> * _Nonnull task) {
        AWSSageMakerServiceListHumanTaskUisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListHyperParameterTuningJobsResponse *> *)listHyperParameterTuningJobs:(AWSSageMakerServiceListHyperParameterTuningJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListHyperParameterTuningJobs"
                   outputClass:[AWSSageMakerServiceListHyperParameterTuningJobsResponse class]];
}

- (void)listHyperParameterTuningJobs:(AWSSageMakerServiceListHyperParameterTuningJobsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListHyperParameterTuningJobsResponse *response, NSError *error))completionHandler {
    [[self listHyperParameterTuningJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListHyperParameterTuningJobsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListHyperParameterTuningJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListLabelingJobsResponse *> *)listLabelingJobs:(AWSSageMakerServiceListLabelingJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListLabelingJobs"
                   outputClass:[AWSSageMakerServiceListLabelingJobsResponse class]];
}

- (void)listLabelingJobs:(AWSSageMakerServiceListLabelingJobsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListLabelingJobsResponse *response, NSError *error))completionHandler {
    [[self listLabelingJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListLabelingJobsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListLabelingJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListLabelingJobsForWorkteamResponse *> *)listLabelingJobsForWorkteam:(AWSSageMakerServiceListLabelingJobsForWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListLabelingJobsForWorkteam"
                   outputClass:[AWSSageMakerServiceListLabelingJobsForWorkteamResponse class]];
}

- (void)listLabelingJobsForWorkteam:(AWSSageMakerServiceListLabelingJobsForWorkteamRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListLabelingJobsForWorkteamResponse *response, NSError *error))completionHandler {
    [[self listLabelingJobsForWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListLabelingJobsForWorkteamResponse *> * _Nonnull task) {
        AWSSageMakerServiceListLabelingJobsForWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListModelPackagesOutput *> *)listModelPackages:(AWSSageMakerServiceListModelPackagesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListModelPackages"
                   outputClass:[AWSSageMakerServiceListModelPackagesOutput class]];
}

- (void)listModelPackages:(AWSSageMakerServiceListModelPackagesInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceListModelPackagesOutput *response, NSError *error))completionHandler {
    [[self listModelPackages:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListModelPackagesOutput *> * _Nonnull task) {
        AWSSageMakerServiceListModelPackagesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListModelsOutput *> *)listModels:(AWSSageMakerServiceListModelsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListModels"
                   outputClass:[AWSSageMakerServiceListModelsOutput class]];
}

- (void)listModels:(AWSSageMakerServiceListModelsInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceListModelsOutput *response, NSError *error))completionHandler {
    [[self listModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListModelsOutput *> * _Nonnull task) {
        AWSSageMakerServiceListModelsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListMonitoringExecutionsResponse *> *)listMonitoringExecutions:(AWSSageMakerServiceListMonitoringExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListMonitoringExecutions"
                   outputClass:[AWSSageMakerServiceListMonitoringExecutionsResponse class]];
}

- (void)listMonitoringExecutions:(AWSSageMakerServiceListMonitoringExecutionsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListMonitoringExecutionsResponse *response, NSError *error))completionHandler {
    [[self listMonitoringExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListMonitoringExecutionsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListMonitoringExecutionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListMonitoringSchedulesResponse *> *)listMonitoringSchedules:(AWSSageMakerServiceListMonitoringSchedulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListMonitoringSchedules"
                   outputClass:[AWSSageMakerServiceListMonitoringSchedulesResponse class]];
}

- (void)listMonitoringSchedules:(AWSSageMakerServiceListMonitoringSchedulesRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListMonitoringSchedulesResponse *response, NSError *error))completionHandler {
    [[self listMonitoringSchedules:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListMonitoringSchedulesResponse *> * _Nonnull task) {
        AWSSageMakerServiceListMonitoringSchedulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput *> *)listNotebookInstanceLifecycleConfigs:(AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListNotebookInstanceLifecycleConfigs"
                   outputClass:[AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput class]];
}

- (void)listNotebookInstanceLifecycleConfigs:(AWSSageMakerServiceListNotebookInstanceLifecycleConfigsInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput *response, NSError *error))completionHandler {
    [[self listNotebookInstanceLifecycleConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput *> * _Nonnull task) {
        AWSSageMakerServiceListNotebookInstanceLifecycleConfigsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListNotebookInstancesOutput *> *)listNotebookInstances:(AWSSageMakerServiceListNotebookInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListNotebookInstances"
                   outputClass:[AWSSageMakerServiceListNotebookInstancesOutput class]];
}

- (void)listNotebookInstances:(AWSSageMakerServiceListNotebookInstancesInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceListNotebookInstancesOutput *response, NSError *error))completionHandler {
    [[self listNotebookInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListNotebookInstancesOutput *> * _Nonnull task) {
        AWSSageMakerServiceListNotebookInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListProcessingJobsResponse *> *)listProcessingJobs:(AWSSageMakerServiceListProcessingJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListProcessingJobs"
                   outputClass:[AWSSageMakerServiceListProcessingJobsResponse class]];
}

- (void)listProcessingJobs:(AWSSageMakerServiceListProcessingJobsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListProcessingJobsResponse *response, NSError *error))completionHandler {
    [[self listProcessingJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListProcessingJobsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListProcessingJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListSubscribedWorkteamsResponse *> *)listSubscribedWorkteams:(AWSSageMakerServiceListSubscribedWorkteamsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListSubscribedWorkteams"
                   outputClass:[AWSSageMakerServiceListSubscribedWorkteamsResponse class]];
}

- (void)listSubscribedWorkteams:(AWSSageMakerServiceListSubscribedWorkteamsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListSubscribedWorkteamsResponse *response, NSError *error))completionHandler {
    [[self listSubscribedWorkteams:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListSubscribedWorkteamsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListSubscribedWorkteamsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListTagsOutput *> *)listTags:(AWSSageMakerServiceListTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTags"
                   outputClass:[AWSSageMakerServiceListTagsOutput class]];
}

- (void)listTags:(AWSSageMakerServiceListTagsInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceListTagsOutput *response, NSError *error))completionHandler {
    [[self listTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListTagsOutput *> * _Nonnull task) {
        AWSSageMakerServiceListTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListTrainingJobsResponse *> *)listTrainingJobs:(AWSSageMakerServiceListTrainingJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrainingJobs"
                   outputClass:[AWSSageMakerServiceListTrainingJobsResponse class]];
}

- (void)listTrainingJobs:(AWSSageMakerServiceListTrainingJobsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListTrainingJobsResponse *response, NSError *error))completionHandler {
    [[self listTrainingJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListTrainingJobsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListTrainingJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse *> *)listTrainingJobsForHyperParameterTuningJob:(AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrainingJobsForHyperParameterTuningJob"
                   outputClass:[AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse class]];
}

- (void)listTrainingJobsForHyperParameterTuningJob:(AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse *response, NSError *error))completionHandler {
    [[self listTrainingJobsForHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse *> * _Nonnull task) {
        AWSSageMakerServiceListTrainingJobsForHyperParameterTuningJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListTransformJobsResponse *> *)listTransformJobs:(AWSSageMakerServiceListTransformJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTransformJobs"
                   outputClass:[AWSSageMakerServiceListTransformJobsResponse class]];
}

- (void)listTransformJobs:(AWSSageMakerServiceListTransformJobsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListTransformJobsResponse *response, NSError *error))completionHandler {
    [[self listTransformJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListTransformJobsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListTransformJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListTrialComponentsResponse *> *)listTrialComponents:(AWSSageMakerServiceListTrialComponentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrialComponents"
                   outputClass:[AWSSageMakerServiceListTrialComponentsResponse class]];
}

- (void)listTrialComponents:(AWSSageMakerServiceListTrialComponentsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListTrialComponentsResponse *response, NSError *error))completionHandler {
    [[self listTrialComponents:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListTrialComponentsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListTrialComponentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListTrialsResponse *> *)listTrials:(AWSSageMakerServiceListTrialsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrials"
                   outputClass:[AWSSageMakerServiceListTrialsResponse class]];
}

- (void)listTrials:(AWSSageMakerServiceListTrialsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListTrialsResponse *response, NSError *error))completionHandler {
    [[self listTrials:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListTrialsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListTrialsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListUserProfilesResponse *> *)listUserProfiles:(AWSSageMakerServiceListUserProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListUserProfiles"
                   outputClass:[AWSSageMakerServiceListUserProfilesResponse class]];
}

- (void)listUserProfiles:(AWSSageMakerServiceListUserProfilesRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListUserProfilesResponse *response, NSError *error))completionHandler {
    [[self listUserProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListUserProfilesResponse *> * _Nonnull task) {
        AWSSageMakerServiceListUserProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceListWorkteamsResponse *> *)listWorkteams:(AWSSageMakerServiceListWorkteamsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListWorkteams"
                   outputClass:[AWSSageMakerServiceListWorkteamsResponse class]];
}

- (void)listWorkteams:(AWSSageMakerServiceListWorkteamsRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceListWorkteamsResponse *response, NSError *error))completionHandler {
    [[self listWorkteams:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceListWorkteamsResponse *> * _Nonnull task) {
        AWSSageMakerServiceListWorkteamsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceRenderUiTemplateResponse *> *)renderUiTemplate:(AWSSageMakerServiceRenderUiTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"RenderUiTemplate"
                   outputClass:[AWSSageMakerServiceRenderUiTemplateResponse class]];
}

- (void)renderUiTemplate:(AWSSageMakerServiceRenderUiTemplateRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceRenderUiTemplateResponse *response, NSError *error))completionHandler {
    [[self renderUiTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceRenderUiTemplateResponse *> * _Nonnull task) {
        AWSSageMakerServiceRenderUiTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceSearchResponse *> *)search:(AWSSageMakerServiceSearchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"Search"
                   outputClass:[AWSSageMakerServiceSearchResponse class]];
}

- (void)search:(AWSSageMakerServiceSearchRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceSearchResponse *response, NSError *error))completionHandler {
    [[self search:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceSearchResponse *> * _Nonnull task) {
        AWSSageMakerServiceSearchResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)startMonitoringSchedule:(AWSSageMakerServiceStartMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StartMonitoringSchedule"
                   outputClass:nil];
}

- (void)startMonitoringSchedule:(AWSSageMakerServiceStartMonitoringScheduleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self startMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)startNotebookInstance:(AWSSageMakerServiceStartNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StartNotebookInstance"
                   outputClass:nil];
}

- (void)startNotebookInstance:(AWSSageMakerServiceStartNotebookInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self startNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopAutoMLJob:(AWSSageMakerServiceStopAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopAutoMLJob"
                   outputClass:nil];
}

- (void)stopAutoMLJob:(AWSSageMakerServiceStopAutoMLJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopCompilationJob:(AWSSageMakerServiceStopCompilationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopCompilationJob"
                   outputClass:nil];
}

- (void)stopCompilationJob:(AWSSageMakerServiceStopCompilationJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopCompilationJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopHyperParameterTuningJob:(AWSSageMakerServiceStopHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopHyperParameterTuningJob"
                   outputClass:nil];
}

- (void)stopHyperParameterTuningJob:(AWSSageMakerServiceStopHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopLabelingJob:(AWSSageMakerServiceStopLabelingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopLabelingJob"
                   outputClass:nil];
}

- (void)stopLabelingJob:(AWSSageMakerServiceStopLabelingJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopLabelingJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopMonitoringSchedule:(AWSSageMakerServiceStopMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopMonitoringSchedule"
                   outputClass:nil];
}

- (void)stopMonitoringSchedule:(AWSSageMakerServiceStopMonitoringScheduleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopNotebookInstance:(AWSSageMakerServiceStopNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopNotebookInstance"
                   outputClass:nil];
}

- (void)stopNotebookInstance:(AWSSageMakerServiceStopNotebookInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopProcessingJob:(AWSSageMakerServiceStopProcessingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopProcessingJob"
                   outputClass:nil];
}

- (void)stopProcessingJob:(AWSSageMakerServiceStopProcessingJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopProcessingJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopTrainingJob:(AWSSageMakerServiceStopTrainingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopTrainingJob"
                   outputClass:nil];
}

- (void)stopTrainingJob:(AWSSageMakerServiceStopTrainingJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopTrainingJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopTransformJob:(AWSSageMakerServiceStopTransformJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopTransformJob"
                   outputClass:nil];
}

- (void)stopTransformJob:(AWSSageMakerServiceStopTransformJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopTransformJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateCodeRepositoryOutput *> *)updateCodeRepository:(AWSSageMakerServiceUpdateCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateCodeRepository"
                   outputClass:[AWSSageMakerServiceUpdateCodeRepositoryOutput class]];
}

- (void)updateCodeRepository:(AWSSageMakerServiceUpdateCodeRepositoryInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateCodeRepositoryOutput *response, NSError *error))completionHandler {
    [[self updateCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateCodeRepositoryOutput *> * _Nonnull task) {
        AWSSageMakerServiceUpdateCodeRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateDomainResponse *> *)updateDomain:(AWSSageMakerServiceUpdateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateDomain"
                   outputClass:[AWSSageMakerServiceUpdateDomainResponse class]];
}

- (void)updateDomain:(AWSSageMakerServiceUpdateDomainRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateDomainResponse *response, NSError *error))completionHandler {
    [[self updateDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateDomainResponse *> * _Nonnull task) {
        AWSSageMakerServiceUpdateDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateEndpointOutput *> *)updateEndpoint:(AWSSageMakerServiceUpdateEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateEndpoint"
                   outputClass:[AWSSageMakerServiceUpdateEndpointOutput class]];
}

- (void)updateEndpoint:(AWSSageMakerServiceUpdateEndpointInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateEndpointOutput *response, NSError *error))completionHandler {
    [[self updateEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateEndpointOutput *> * _Nonnull task) {
        AWSSageMakerServiceUpdateEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput *> *)updateEndpointWeightsAndCapacities:(AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateEndpointWeightsAndCapacities"
                   outputClass:[AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput class]];
}

- (void)updateEndpointWeightsAndCapacities:(AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput *response, NSError *error))completionHandler {
    [[self updateEndpointWeightsAndCapacities:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput *> * _Nonnull task) {
        AWSSageMakerServiceUpdateEndpointWeightsAndCapacitiesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateExperimentResponse *> *)updateExperiment:(AWSSageMakerServiceUpdateExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateExperiment"
                   outputClass:[AWSSageMakerServiceUpdateExperimentResponse class]];
}

- (void)updateExperiment:(AWSSageMakerServiceUpdateExperimentRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateExperimentResponse *response, NSError *error))completionHandler {
    [[self updateExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateExperimentResponse *> * _Nonnull task) {
        AWSSageMakerServiceUpdateExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateMonitoringScheduleResponse *> *)updateMonitoringSchedule:(AWSSageMakerServiceUpdateMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateMonitoringSchedule"
                   outputClass:[AWSSageMakerServiceUpdateMonitoringScheduleResponse class]];
}

- (void)updateMonitoringSchedule:(AWSSageMakerServiceUpdateMonitoringScheduleRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateMonitoringScheduleResponse *response, NSError *error))completionHandler {
    [[self updateMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateMonitoringScheduleResponse *> * _Nonnull task) {
        AWSSageMakerServiceUpdateMonitoringScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateNotebookInstanceOutput *> *)updateNotebookInstance:(AWSSageMakerServiceUpdateNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateNotebookInstance"
                   outputClass:[AWSSageMakerServiceUpdateNotebookInstanceOutput class]];
}

- (void)updateNotebookInstance:(AWSSageMakerServiceUpdateNotebookInstanceInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateNotebookInstanceOutput *response, NSError *error))completionHandler {
    [[self updateNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateNotebookInstanceOutput *> * _Nonnull task) {
        AWSSageMakerServiceUpdateNotebookInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput *> *)updateNotebookInstanceLifecycleConfig:(AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateNotebookInstanceLifecycleConfig"
                   outputClass:[AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput class]];
}

- (void)updateNotebookInstanceLifecycleConfig:(AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput *response, NSError *error))completionHandler {
    [[self updateNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput *> * _Nonnull task) {
        AWSSageMakerServiceUpdateNotebookInstanceLifecycleConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateTrialResponse *> *)updateTrial:(AWSSageMakerServiceUpdateTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateTrial"
                   outputClass:[AWSSageMakerServiceUpdateTrialResponse class]];
}

- (void)updateTrial:(AWSSageMakerServiceUpdateTrialRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateTrialResponse *response, NSError *error))completionHandler {
    [[self updateTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateTrialResponse *> * _Nonnull task) {
        AWSSageMakerServiceUpdateTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateTrialComponentResponse *> *)updateTrialComponent:(AWSSageMakerServiceUpdateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateTrialComponent"
                   outputClass:[AWSSageMakerServiceUpdateTrialComponentResponse class]];
}

- (void)updateTrialComponent:(AWSSageMakerServiceUpdateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self updateTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateTrialComponentResponse *> * _Nonnull task) {
        AWSSageMakerServiceUpdateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateUserProfileResponse *> *)updateUserProfile:(AWSSageMakerServiceUpdateUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateUserProfile"
                   outputClass:[AWSSageMakerServiceUpdateUserProfileResponse class]];
}

- (void)updateUserProfile:(AWSSageMakerServiceUpdateUserProfileRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateUserProfileResponse *response, NSError *error))completionHandler {
    [[self updateUserProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateUserProfileResponse *> * _Nonnull task) {
        AWSSageMakerServiceUpdateUserProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateWorkforceResponse *> *)updateWorkforce:(AWSSageMakerServiceUpdateWorkforceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateWorkforce"
                   outputClass:[AWSSageMakerServiceUpdateWorkforceResponse class]];
}

- (void)updateWorkforce:(AWSSageMakerServiceUpdateWorkforceRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateWorkforceResponse *response, NSError *error))completionHandler {
    [[self updateWorkforce:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateWorkforceResponse *> * _Nonnull task) {
        AWSSageMakerServiceUpdateWorkforceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSageMakerServiceUpdateWorkteamResponse *> *)updateWorkteam:(AWSSageMakerServiceUpdateWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateWorkteam"
                   outputClass:[AWSSageMakerServiceUpdateWorkteamResponse class]];
}

- (void)updateWorkteam:(AWSSageMakerServiceUpdateWorkteamRequest *)request
     completionHandler:(void (^)(AWSSageMakerServiceUpdateWorkteamResponse *response, NSError *error))completionHandler {
    [[self updateWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSageMakerServiceUpdateWorkteamResponse *> * _Nonnull task) {
        AWSSageMakerServiceUpdateWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
