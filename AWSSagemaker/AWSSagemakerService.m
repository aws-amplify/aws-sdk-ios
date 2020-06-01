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

#import "AWSSagemakerService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSagemakerResources.h"

static NSString *const AWSInfoSagemaker = @"Sagemaker";
NSString *const AWSSagemakerSDKVersion = @"2.13.4";


@interface AWSSagemakerResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSagemakerResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConflictException" : @(AWSSagemakerErrorConflict),
                            @"ResourceInUse" : @(AWSSagemakerErrorResourceInUse),
                            @"ResourceLimitExceeded" : @(AWSSagemakerErrorResourceLimitExceeded),
                            @"ResourceNotFound" : @(AWSSagemakerErrorResourceNotFound),
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
	                *error = [NSError errorWithDomain:AWSSagemakerErrorDomain
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
        *error = [NSError errorWithDomain:AWSSagemakerErrorDomain
                                     code:AWSSagemakerErrorUnknown
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

@interface AWSSagemakerRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSagemakerRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSagemaker()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSagemaker

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSagemakerSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSagemaker versions need to match. Check your SDK installation. AWSCore: %@ AWSSagemaker: %@", AWSiOSSDKVersion, AWSSagemakerSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSagemaker {
    static AWSSagemaker *_defaultSagemaker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSagemaker];
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
        _defaultSagemaker = [[AWSSagemaker alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSagemaker;
}

+ (void)registerSagemakerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSagemaker alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SagemakerForKey:(NSString *)key {
    @synchronized(self) {
        AWSSagemaker *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSagemaker
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSagemaker registerSagemakerWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSagemakerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSagemaker` or `+ SagemakerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSagemaker
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSagemaker];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSagemakerRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSagemakerResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSagemakerResponseSerializer alloc] initWithJSONDefinition:[[AWSSagemakerResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSagemakerAddTagsOutput *> *)addTags:(AWSSagemakerAddTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"AddTags"
                   outputClass:[AWSSagemakerAddTagsOutput class]];
}

- (void)addTags:(AWSSagemakerAddTagsInput *)request
     completionHandler:(void (^)(AWSSagemakerAddTagsOutput *response, NSError *error))completionHandler {
    [[self addTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerAddTagsOutput *> * _Nonnull task) {
        AWSSagemakerAddTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerAssociateTrialComponentResponse *> *)associateTrialComponent:(AWSSagemakerAssociateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"AssociateTrialComponent"
                   outputClass:[AWSSagemakerAssociateTrialComponentResponse class]];
}

- (void)associateTrialComponent:(AWSSagemakerAssociateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSagemakerAssociateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self associateTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerAssociateTrialComponentResponse *> * _Nonnull task) {
        AWSSagemakerAssociateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateAlgorithmOutput *> *)createAlgorithm:(AWSSagemakerCreateAlgorithmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateAlgorithm"
                   outputClass:[AWSSagemakerCreateAlgorithmOutput class]];
}

- (void)createAlgorithm:(AWSSagemakerCreateAlgorithmInput *)request
     completionHandler:(void (^)(AWSSagemakerCreateAlgorithmOutput *response, NSError *error))completionHandler {
    [[self createAlgorithm:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateAlgorithmOutput *> * _Nonnull task) {
        AWSSagemakerCreateAlgorithmOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateAppResponse *> *)createApp:(AWSSagemakerCreateAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateApp"
                   outputClass:[AWSSagemakerCreateAppResponse class]];
}

- (void)createApp:(AWSSagemakerCreateAppRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateAppResponse *response, NSError *error))completionHandler {
    [[self createApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateAppResponse *> * _Nonnull task) {
        AWSSagemakerCreateAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateAutoMLJobResponse *> *)createAutoMLJob:(AWSSagemakerCreateAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateAutoMLJob"
                   outputClass:[AWSSagemakerCreateAutoMLJobResponse class]];
}

- (void)createAutoMLJob:(AWSSagemakerCreateAutoMLJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateAutoMLJobResponse *response, NSError *error))completionHandler {
    [[self createAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateAutoMLJobResponse *> * _Nonnull task) {
        AWSSagemakerCreateAutoMLJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateCodeRepositoryOutput *> *)createCodeRepository:(AWSSagemakerCreateCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateCodeRepository"
                   outputClass:[AWSSagemakerCreateCodeRepositoryOutput class]];
}

- (void)createCodeRepository:(AWSSagemakerCreateCodeRepositoryInput *)request
     completionHandler:(void (^)(AWSSagemakerCreateCodeRepositoryOutput *response, NSError *error))completionHandler {
    [[self createCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateCodeRepositoryOutput *> * _Nonnull task) {
        AWSSagemakerCreateCodeRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateCompilationJobResponse *> *)createCompilationJob:(AWSSagemakerCreateCompilationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateCompilationJob"
                   outputClass:[AWSSagemakerCreateCompilationJobResponse class]];
}

- (void)createCompilationJob:(AWSSagemakerCreateCompilationJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateCompilationJobResponse *response, NSError *error))completionHandler {
    [[self createCompilationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateCompilationJobResponse *> * _Nonnull task) {
        AWSSagemakerCreateCompilationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateDomainResponse *> *)createDomain:(AWSSagemakerCreateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateDomain"
                   outputClass:[AWSSagemakerCreateDomainResponse class]];
}

- (void)createDomain:(AWSSagemakerCreateDomainRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateDomainResponse *response, NSError *error))completionHandler {
    [[self createDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateDomainResponse *> * _Nonnull task) {
        AWSSagemakerCreateDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateEndpointOutput *> *)createEndpoint:(AWSSagemakerCreateEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateEndpoint"
                   outputClass:[AWSSagemakerCreateEndpointOutput class]];
}

- (void)createEndpoint:(AWSSagemakerCreateEndpointInput *)request
     completionHandler:(void (^)(AWSSagemakerCreateEndpointOutput *response, NSError *error))completionHandler {
    [[self createEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateEndpointOutput *> * _Nonnull task) {
        AWSSagemakerCreateEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateEndpointConfigOutput *> *)createEndpointConfig:(AWSSagemakerCreateEndpointConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateEndpointConfig"
                   outputClass:[AWSSagemakerCreateEndpointConfigOutput class]];
}

- (void)createEndpointConfig:(AWSSagemakerCreateEndpointConfigInput *)request
     completionHandler:(void (^)(AWSSagemakerCreateEndpointConfigOutput *response, NSError *error))completionHandler {
    [[self createEndpointConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateEndpointConfigOutput *> * _Nonnull task) {
        AWSSagemakerCreateEndpointConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateExperimentResponse *> *)createExperiment:(AWSSagemakerCreateExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateExperiment"
                   outputClass:[AWSSagemakerCreateExperimentResponse class]];
}

- (void)createExperiment:(AWSSagemakerCreateExperimentRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateExperimentResponse *response, NSError *error))completionHandler {
    [[self createExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateExperimentResponse *> * _Nonnull task) {
        AWSSagemakerCreateExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateFlowDefinitionResponse *> *)createFlowDefinition:(AWSSagemakerCreateFlowDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateFlowDefinition"
                   outputClass:[AWSSagemakerCreateFlowDefinitionResponse class]];
}

- (void)createFlowDefinition:(AWSSagemakerCreateFlowDefinitionRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateFlowDefinitionResponse *response, NSError *error))completionHandler {
    [[self createFlowDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateFlowDefinitionResponse *> * _Nonnull task) {
        AWSSagemakerCreateFlowDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateHumanTaskUiResponse *> *)createHumanTaskUi:(AWSSagemakerCreateHumanTaskUiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateHumanTaskUi"
                   outputClass:[AWSSagemakerCreateHumanTaskUiResponse class]];
}

- (void)createHumanTaskUi:(AWSSagemakerCreateHumanTaskUiRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateHumanTaskUiResponse *response, NSError *error))completionHandler {
    [[self createHumanTaskUi:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateHumanTaskUiResponse *> * _Nonnull task) {
        AWSSagemakerCreateHumanTaskUiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateHyperParameterTuningJobResponse *> *)createHyperParameterTuningJob:(AWSSagemakerCreateHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateHyperParameterTuningJob"
                   outputClass:[AWSSagemakerCreateHyperParameterTuningJobResponse class]];
}

- (void)createHyperParameterTuningJob:(AWSSagemakerCreateHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateHyperParameterTuningJobResponse *response, NSError *error))completionHandler {
    [[self createHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateHyperParameterTuningJobResponse *> * _Nonnull task) {
        AWSSagemakerCreateHyperParameterTuningJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateLabelingJobResponse *> *)createLabelingJob:(AWSSagemakerCreateLabelingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateLabelingJob"
                   outputClass:[AWSSagemakerCreateLabelingJobResponse class]];
}

- (void)createLabelingJob:(AWSSagemakerCreateLabelingJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateLabelingJobResponse *response, NSError *error))completionHandler {
    [[self createLabelingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateLabelingJobResponse *> * _Nonnull task) {
        AWSSagemakerCreateLabelingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateModelOutput *> *)createModel:(AWSSagemakerCreateModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateModel"
                   outputClass:[AWSSagemakerCreateModelOutput class]];
}

- (void)createModel:(AWSSagemakerCreateModelInput *)request
     completionHandler:(void (^)(AWSSagemakerCreateModelOutput *response, NSError *error))completionHandler {
    [[self createModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateModelOutput *> * _Nonnull task) {
        AWSSagemakerCreateModelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateModelPackageOutput *> *)createModelPackage:(AWSSagemakerCreateModelPackageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateModelPackage"
                   outputClass:[AWSSagemakerCreateModelPackageOutput class]];
}

- (void)createModelPackage:(AWSSagemakerCreateModelPackageInput *)request
     completionHandler:(void (^)(AWSSagemakerCreateModelPackageOutput *response, NSError *error))completionHandler {
    [[self createModelPackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateModelPackageOutput *> * _Nonnull task) {
        AWSSagemakerCreateModelPackageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateMonitoringScheduleResponse *> *)createMonitoringSchedule:(AWSSagemakerCreateMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateMonitoringSchedule"
                   outputClass:[AWSSagemakerCreateMonitoringScheduleResponse class]];
}

- (void)createMonitoringSchedule:(AWSSagemakerCreateMonitoringScheduleRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateMonitoringScheduleResponse *response, NSError *error))completionHandler {
    [[self createMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateMonitoringScheduleResponse *> * _Nonnull task) {
        AWSSagemakerCreateMonitoringScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateNotebookInstanceOutput *> *)createNotebookInstance:(AWSSagemakerCreateNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateNotebookInstance"
                   outputClass:[AWSSagemakerCreateNotebookInstanceOutput class]];
}

- (void)createNotebookInstance:(AWSSagemakerCreateNotebookInstanceInput *)request
     completionHandler:(void (^)(AWSSagemakerCreateNotebookInstanceOutput *response, NSError *error))completionHandler {
    [[self createNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateNotebookInstanceOutput *> * _Nonnull task) {
        AWSSagemakerCreateNotebookInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput *> *)createNotebookInstanceLifecycleConfig:(AWSSagemakerCreateNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateNotebookInstanceLifecycleConfig"
                   outputClass:[AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput class]];
}

- (void)createNotebookInstanceLifecycleConfig:(AWSSagemakerCreateNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput *response, NSError *error))completionHandler {
    [[self createNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput *> * _Nonnull task) {
        AWSSagemakerCreateNotebookInstanceLifecycleConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreatePresignedDomainUrlResponse *> *)createPresignedDomainUrl:(AWSSagemakerCreatePresignedDomainUrlRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreatePresignedDomainUrl"
                   outputClass:[AWSSagemakerCreatePresignedDomainUrlResponse class]];
}

- (void)createPresignedDomainUrl:(AWSSagemakerCreatePresignedDomainUrlRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreatePresignedDomainUrlResponse *response, NSError *error))completionHandler {
    [[self createPresignedDomainUrl:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreatePresignedDomainUrlResponse *> * _Nonnull task) {
        AWSSagemakerCreatePresignedDomainUrlResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreatePresignedNotebookInstanceUrlOutput *> *)createPresignedNotebookInstanceUrl:(AWSSagemakerCreatePresignedNotebookInstanceUrlInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreatePresignedNotebookInstanceUrl"
                   outputClass:[AWSSagemakerCreatePresignedNotebookInstanceUrlOutput class]];
}

- (void)createPresignedNotebookInstanceUrl:(AWSSagemakerCreatePresignedNotebookInstanceUrlInput *)request
     completionHandler:(void (^)(AWSSagemakerCreatePresignedNotebookInstanceUrlOutput *response, NSError *error))completionHandler {
    [[self createPresignedNotebookInstanceUrl:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreatePresignedNotebookInstanceUrlOutput *> * _Nonnull task) {
        AWSSagemakerCreatePresignedNotebookInstanceUrlOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateProcessingJobResponse *> *)createProcessingJob:(AWSSagemakerCreateProcessingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateProcessingJob"
                   outputClass:[AWSSagemakerCreateProcessingJobResponse class]];
}

- (void)createProcessingJob:(AWSSagemakerCreateProcessingJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateProcessingJobResponse *response, NSError *error))completionHandler {
    [[self createProcessingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateProcessingJobResponse *> * _Nonnull task) {
        AWSSagemakerCreateProcessingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateTrainingJobResponse *> *)createTrainingJob:(AWSSagemakerCreateTrainingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTrainingJob"
                   outputClass:[AWSSagemakerCreateTrainingJobResponse class]];
}

- (void)createTrainingJob:(AWSSagemakerCreateTrainingJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateTrainingJobResponse *response, NSError *error))completionHandler {
    [[self createTrainingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateTrainingJobResponse *> * _Nonnull task) {
        AWSSagemakerCreateTrainingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateTransformJobResponse *> *)createTransformJob:(AWSSagemakerCreateTransformJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTransformJob"
                   outputClass:[AWSSagemakerCreateTransformJobResponse class]];
}

- (void)createTransformJob:(AWSSagemakerCreateTransformJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateTransformJobResponse *response, NSError *error))completionHandler {
    [[self createTransformJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateTransformJobResponse *> * _Nonnull task) {
        AWSSagemakerCreateTransformJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateTrialResponse *> *)createTrial:(AWSSagemakerCreateTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTrial"
                   outputClass:[AWSSagemakerCreateTrialResponse class]];
}

- (void)createTrial:(AWSSagemakerCreateTrialRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateTrialResponse *response, NSError *error))completionHandler {
    [[self createTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateTrialResponse *> * _Nonnull task) {
        AWSSagemakerCreateTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateTrialComponentResponse *> *)createTrialComponent:(AWSSagemakerCreateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateTrialComponent"
                   outputClass:[AWSSagemakerCreateTrialComponentResponse class]];
}

- (void)createTrialComponent:(AWSSagemakerCreateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self createTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateTrialComponentResponse *> * _Nonnull task) {
        AWSSagemakerCreateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateUserProfileResponse *> *)createUserProfile:(AWSSagemakerCreateUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateUserProfile"
                   outputClass:[AWSSagemakerCreateUserProfileResponse class]];
}

- (void)createUserProfile:(AWSSagemakerCreateUserProfileRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateUserProfileResponse *response, NSError *error))completionHandler {
    [[self createUserProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateUserProfileResponse *> * _Nonnull task) {
        AWSSagemakerCreateUserProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerCreateWorkteamResponse *> *)createWorkteam:(AWSSagemakerCreateWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"CreateWorkteam"
                   outputClass:[AWSSagemakerCreateWorkteamResponse class]];
}

- (void)createWorkteam:(AWSSagemakerCreateWorkteamRequest *)request
     completionHandler:(void (^)(AWSSagemakerCreateWorkteamResponse *response, NSError *error))completionHandler {
    [[self createWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerCreateWorkteamResponse *> * _Nonnull task) {
        AWSSagemakerCreateWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAlgorithm:(AWSSagemakerDeleteAlgorithmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteAlgorithm"
                   outputClass:nil];
}

- (void)deleteAlgorithm:(AWSSagemakerDeleteAlgorithmInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAlgorithm:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteApp:(AWSSagemakerDeleteAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteApp"
                   outputClass:nil];
}

- (void)deleteApp:(AWSSagemakerDeleteAppRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteApp:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCodeRepository:(AWSSagemakerDeleteCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteCodeRepository"
                   outputClass:nil];
}

- (void)deleteCodeRepository:(AWSSagemakerDeleteCodeRepositoryInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDomain:(AWSSagemakerDeleteDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteDomain"
                   outputClass:nil];
}

- (void)deleteDomain:(AWSSagemakerDeleteDomainRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDomain:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEndpoint:(AWSSagemakerDeleteEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteEndpoint"
                   outputClass:nil];
}

- (void)deleteEndpoint:(AWSSagemakerDeleteEndpointInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEndpoint:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEndpointConfig:(AWSSagemakerDeleteEndpointConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteEndpointConfig"
                   outputClass:nil];
}

- (void)deleteEndpointConfig:(AWSSagemakerDeleteEndpointConfigInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEndpointConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDeleteExperimentResponse *> *)deleteExperiment:(AWSSagemakerDeleteExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteExperiment"
                   outputClass:[AWSSagemakerDeleteExperimentResponse class]];
}

- (void)deleteExperiment:(AWSSagemakerDeleteExperimentRequest *)request
     completionHandler:(void (^)(AWSSagemakerDeleteExperimentResponse *response, NSError *error))completionHandler {
    [[self deleteExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDeleteExperimentResponse *> * _Nonnull task) {
        AWSSagemakerDeleteExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDeleteFlowDefinitionResponse *> *)deleteFlowDefinition:(AWSSagemakerDeleteFlowDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteFlowDefinition"
                   outputClass:[AWSSagemakerDeleteFlowDefinitionResponse class]];
}

- (void)deleteFlowDefinition:(AWSSagemakerDeleteFlowDefinitionRequest *)request
     completionHandler:(void (^)(AWSSagemakerDeleteFlowDefinitionResponse *response, NSError *error))completionHandler {
    [[self deleteFlowDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDeleteFlowDefinitionResponse *> * _Nonnull task) {
        AWSSagemakerDeleteFlowDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteModel:(AWSSagemakerDeleteModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteModel"
                   outputClass:nil];
}

- (void)deleteModel:(AWSSagemakerDeleteModelInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteModel:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteModelPackage:(AWSSagemakerDeleteModelPackageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteModelPackage"
                   outputClass:nil];
}

- (void)deleteModelPackage:(AWSSagemakerDeleteModelPackageInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteModelPackage:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteMonitoringSchedule:(AWSSagemakerDeleteMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteMonitoringSchedule"
                   outputClass:nil];
}

- (void)deleteMonitoringSchedule:(AWSSagemakerDeleteMonitoringScheduleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNotebookInstance:(AWSSagemakerDeleteNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteNotebookInstance"
                   outputClass:nil];
}

- (void)deleteNotebookInstance:(AWSSagemakerDeleteNotebookInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNotebookInstanceLifecycleConfig:(AWSSagemakerDeleteNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteNotebookInstanceLifecycleConfig"
                   outputClass:nil];
}

- (void)deleteNotebookInstanceLifecycleConfig:(AWSSagemakerDeleteNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDeleteTagsOutput *> *)deleteTags:(AWSSagemakerDeleteTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteTags"
                   outputClass:[AWSSagemakerDeleteTagsOutput class]];
}

- (void)deleteTags:(AWSSagemakerDeleteTagsInput *)request
     completionHandler:(void (^)(AWSSagemakerDeleteTagsOutput *response, NSError *error))completionHandler {
    [[self deleteTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDeleteTagsOutput *> * _Nonnull task) {
        AWSSagemakerDeleteTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDeleteTrialResponse *> *)deleteTrial:(AWSSagemakerDeleteTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteTrial"
                   outputClass:[AWSSagemakerDeleteTrialResponse class]];
}

- (void)deleteTrial:(AWSSagemakerDeleteTrialRequest *)request
     completionHandler:(void (^)(AWSSagemakerDeleteTrialResponse *response, NSError *error))completionHandler {
    [[self deleteTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDeleteTrialResponse *> * _Nonnull task) {
        AWSSagemakerDeleteTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDeleteTrialComponentResponse *> *)deleteTrialComponent:(AWSSagemakerDeleteTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteTrialComponent"
                   outputClass:[AWSSagemakerDeleteTrialComponentResponse class]];
}

- (void)deleteTrialComponent:(AWSSagemakerDeleteTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSagemakerDeleteTrialComponentResponse *response, NSError *error))completionHandler {
    [[self deleteTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDeleteTrialComponentResponse *> * _Nonnull task) {
        AWSSagemakerDeleteTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUserProfile:(AWSSagemakerDeleteUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteUserProfile"
                   outputClass:nil];
}

- (void)deleteUserProfile:(AWSSagemakerDeleteUserProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUserProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDeleteWorkteamResponse *> *)deleteWorkteam:(AWSSagemakerDeleteWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DeleteWorkteam"
                   outputClass:[AWSSagemakerDeleteWorkteamResponse class]];
}

- (void)deleteWorkteam:(AWSSagemakerDeleteWorkteamRequest *)request
     completionHandler:(void (^)(AWSSagemakerDeleteWorkteamResponse *response, NSError *error))completionHandler {
    [[self deleteWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDeleteWorkteamResponse *> * _Nonnull task) {
        AWSSagemakerDeleteWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeAlgorithmOutput *> *)describeAlgorithm:(AWSSagemakerDescribeAlgorithmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeAlgorithm"
                   outputClass:[AWSSagemakerDescribeAlgorithmOutput class]];
}

- (void)describeAlgorithm:(AWSSagemakerDescribeAlgorithmInput *)request
     completionHandler:(void (^)(AWSSagemakerDescribeAlgorithmOutput *response, NSError *error))completionHandler {
    [[self describeAlgorithm:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeAlgorithmOutput *> * _Nonnull task) {
        AWSSagemakerDescribeAlgorithmOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeAppResponse *> *)describeApp:(AWSSagemakerDescribeAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeApp"
                   outputClass:[AWSSagemakerDescribeAppResponse class]];
}

- (void)describeApp:(AWSSagemakerDescribeAppRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeAppResponse *response, NSError *error))completionHandler {
    [[self describeApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeAppResponse *> * _Nonnull task) {
        AWSSagemakerDescribeAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeAutoMLJobResponse *> *)describeAutoMLJob:(AWSSagemakerDescribeAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeAutoMLJob"
                   outputClass:[AWSSagemakerDescribeAutoMLJobResponse class]];
}

- (void)describeAutoMLJob:(AWSSagemakerDescribeAutoMLJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeAutoMLJobResponse *response, NSError *error))completionHandler {
    [[self describeAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeAutoMLJobResponse *> * _Nonnull task) {
        AWSSagemakerDescribeAutoMLJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeCodeRepositoryOutput *> *)describeCodeRepository:(AWSSagemakerDescribeCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeCodeRepository"
                   outputClass:[AWSSagemakerDescribeCodeRepositoryOutput class]];
}

- (void)describeCodeRepository:(AWSSagemakerDescribeCodeRepositoryInput *)request
     completionHandler:(void (^)(AWSSagemakerDescribeCodeRepositoryOutput *response, NSError *error))completionHandler {
    [[self describeCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeCodeRepositoryOutput *> * _Nonnull task) {
        AWSSagemakerDescribeCodeRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeCompilationJobResponse *> *)describeCompilationJob:(AWSSagemakerDescribeCompilationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeCompilationJob"
                   outputClass:[AWSSagemakerDescribeCompilationJobResponse class]];
}

- (void)describeCompilationJob:(AWSSagemakerDescribeCompilationJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeCompilationJobResponse *response, NSError *error))completionHandler {
    [[self describeCompilationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeCompilationJobResponse *> * _Nonnull task) {
        AWSSagemakerDescribeCompilationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeDomainResponse *> *)describeDomain:(AWSSagemakerDescribeDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeDomain"
                   outputClass:[AWSSagemakerDescribeDomainResponse class]];
}

- (void)describeDomain:(AWSSagemakerDescribeDomainRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeDomainResponse *response, NSError *error))completionHandler {
    [[self describeDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeDomainResponse *> * _Nonnull task) {
        AWSSagemakerDescribeDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeEndpointOutput *> *)describeEndpoint:(AWSSagemakerDescribeEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeEndpoint"
                   outputClass:[AWSSagemakerDescribeEndpointOutput class]];
}

- (void)describeEndpoint:(AWSSagemakerDescribeEndpointInput *)request
     completionHandler:(void (^)(AWSSagemakerDescribeEndpointOutput *response, NSError *error))completionHandler {
    [[self describeEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeEndpointOutput *> * _Nonnull task) {
        AWSSagemakerDescribeEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeEndpointConfigOutput *> *)describeEndpointConfig:(AWSSagemakerDescribeEndpointConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeEndpointConfig"
                   outputClass:[AWSSagemakerDescribeEndpointConfigOutput class]];
}

- (void)describeEndpointConfig:(AWSSagemakerDescribeEndpointConfigInput *)request
     completionHandler:(void (^)(AWSSagemakerDescribeEndpointConfigOutput *response, NSError *error))completionHandler {
    [[self describeEndpointConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeEndpointConfigOutput *> * _Nonnull task) {
        AWSSagemakerDescribeEndpointConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeExperimentResponse *> *)describeExperiment:(AWSSagemakerDescribeExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeExperiment"
                   outputClass:[AWSSagemakerDescribeExperimentResponse class]];
}

- (void)describeExperiment:(AWSSagemakerDescribeExperimentRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeExperimentResponse *response, NSError *error))completionHandler {
    [[self describeExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeExperimentResponse *> * _Nonnull task) {
        AWSSagemakerDescribeExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeFlowDefinitionResponse *> *)describeFlowDefinition:(AWSSagemakerDescribeFlowDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeFlowDefinition"
                   outputClass:[AWSSagemakerDescribeFlowDefinitionResponse class]];
}

- (void)describeFlowDefinition:(AWSSagemakerDescribeFlowDefinitionRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeFlowDefinitionResponse *response, NSError *error))completionHandler {
    [[self describeFlowDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeFlowDefinitionResponse *> * _Nonnull task) {
        AWSSagemakerDescribeFlowDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeHumanTaskUiResponse *> *)describeHumanTaskUi:(AWSSagemakerDescribeHumanTaskUiRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeHumanTaskUi"
                   outputClass:[AWSSagemakerDescribeHumanTaskUiResponse class]];
}

- (void)describeHumanTaskUi:(AWSSagemakerDescribeHumanTaskUiRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeHumanTaskUiResponse *response, NSError *error))completionHandler {
    [[self describeHumanTaskUi:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeHumanTaskUiResponse *> * _Nonnull task) {
        AWSSagemakerDescribeHumanTaskUiResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeHyperParameterTuningJobResponse *> *)describeHyperParameterTuningJob:(AWSSagemakerDescribeHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeHyperParameterTuningJob"
                   outputClass:[AWSSagemakerDescribeHyperParameterTuningJobResponse class]];
}

- (void)describeHyperParameterTuningJob:(AWSSagemakerDescribeHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeHyperParameterTuningJobResponse *response, NSError *error))completionHandler {
    [[self describeHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeHyperParameterTuningJobResponse *> * _Nonnull task) {
        AWSSagemakerDescribeHyperParameterTuningJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeLabelingJobResponse *> *)describeLabelingJob:(AWSSagemakerDescribeLabelingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeLabelingJob"
                   outputClass:[AWSSagemakerDescribeLabelingJobResponse class]];
}

- (void)describeLabelingJob:(AWSSagemakerDescribeLabelingJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeLabelingJobResponse *response, NSError *error))completionHandler {
    [[self describeLabelingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeLabelingJobResponse *> * _Nonnull task) {
        AWSSagemakerDescribeLabelingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeModelOutput *> *)describeModel:(AWSSagemakerDescribeModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeModel"
                   outputClass:[AWSSagemakerDescribeModelOutput class]];
}

- (void)describeModel:(AWSSagemakerDescribeModelInput *)request
     completionHandler:(void (^)(AWSSagemakerDescribeModelOutput *response, NSError *error))completionHandler {
    [[self describeModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeModelOutput *> * _Nonnull task) {
        AWSSagemakerDescribeModelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeModelPackageOutput *> *)describeModelPackage:(AWSSagemakerDescribeModelPackageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeModelPackage"
                   outputClass:[AWSSagemakerDescribeModelPackageOutput class]];
}

- (void)describeModelPackage:(AWSSagemakerDescribeModelPackageInput *)request
     completionHandler:(void (^)(AWSSagemakerDescribeModelPackageOutput *response, NSError *error))completionHandler {
    [[self describeModelPackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeModelPackageOutput *> * _Nonnull task) {
        AWSSagemakerDescribeModelPackageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeMonitoringScheduleResponse *> *)describeMonitoringSchedule:(AWSSagemakerDescribeMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeMonitoringSchedule"
                   outputClass:[AWSSagemakerDescribeMonitoringScheduleResponse class]];
}

- (void)describeMonitoringSchedule:(AWSSagemakerDescribeMonitoringScheduleRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeMonitoringScheduleResponse *response, NSError *error))completionHandler {
    [[self describeMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeMonitoringScheduleResponse *> * _Nonnull task) {
        AWSSagemakerDescribeMonitoringScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeNotebookInstanceOutput *> *)describeNotebookInstance:(AWSSagemakerDescribeNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeNotebookInstance"
                   outputClass:[AWSSagemakerDescribeNotebookInstanceOutput class]];
}

- (void)describeNotebookInstance:(AWSSagemakerDescribeNotebookInstanceInput *)request
     completionHandler:(void (^)(AWSSagemakerDescribeNotebookInstanceOutput *response, NSError *error))completionHandler {
    [[self describeNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeNotebookInstanceOutput *> * _Nonnull task) {
        AWSSagemakerDescribeNotebookInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput *> *)describeNotebookInstanceLifecycleConfig:(AWSSagemakerDescribeNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeNotebookInstanceLifecycleConfig"
                   outputClass:[AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput class]];
}

- (void)describeNotebookInstanceLifecycleConfig:(AWSSagemakerDescribeNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput *response, NSError *error))completionHandler {
    [[self describeNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput *> * _Nonnull task) {
        AWSSagemakerDescribeNotebookInstanceLifecycleConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeProcessingJobResponse *> *)describeProcessingJob:(AWSSagemakerDescribeProcessingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeProcessingJob"
                   outputClass:[AWSSagemakerDescribeProcessingJobResponse class]];
}

- (void)describeProcessingJob:(AWSSagemakerDescribeProcessingJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeProcessingJobResponse *response, NSError *error))completionHandler {
    [[self describeProcessingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeProcessingJobResponse *> * _Nonnull task) {
        AWSSagemakerDescribeProcessingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeSubscribedWorkteamResponse *> *)describeSubscribedWorkteam:(AWSSagemakerDescribeSubscribedWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeSubscribedWorkteam"
                   outputClass:[AWSSagemakerDescribeSubscribedWorkteamResponse class]];
}

- (void)describeSubscribedWorkteam:(AWSSagemakerDescribeSubscribedWorkteamRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeSubscribedWorkteamResponse *response, NSError *error))completionHandler {
    [[self describeSubscribedWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeSubscribedWorkteamResponse *> * _Nonnull task) {
        AWSSagemakerDescribeSubscribedWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeTrainingJobResponse *> *)describeTrainingJob:(AWSSagemakerDescribeTrainingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTrainingJob"
                   outputClass:[AWSSagemakerDescribeTrainingJobResponse class]];
}

- (void)describeTrainingJob:(AWSSagemakerDescribeTrainingJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeTrainingJobResponse *response, NSError *error))completionHandler {
    [[self describeTrainingJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeTrainingJobResponse *> * _Nonnull task) {
        AWSSagemakerDescribeTrainingJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeTransformJobResponse *> *)describeTransformJob:(AWSSagemakerDescribeTransformJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTransformJob"
                   outputClass:[AWSSagemakerDescribeTransformJobResponse class]];
}

- (void)describeTransformJob:(AWSSagemakerDescribeTransformJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeTransformJobResponse *response, NSError *error))completionHandler {
    [[self describeTransformJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeTransformJobResponse *> * _Nonnull task) {
        AWSSagemakerDescribeTransformJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeTrialResponse *> *)describeTrial:(AWSSagemakerDescribeTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTrial"
                   outputClass:[AWSSagemakerDescribeTrialResponse class]];
}

- (void)describeTrial:(AWSSagemakerDescribeTrialRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeTrialResponse *response, NSError *error))completionHandler {
    [[self describeTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeTrialResponse *> * _Nonnull task) {
        AWSSagemakerDescribeTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeTrialComponentResponse *> *)describeTrialComponent:(AWSSagemakerDescribeTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeTrialComponent"
                   outputClass:[AWSSagemakerDescribeTrialComponentResponse class]];
}

- (void)describeTrialComponent:(AWSSagemakerDescribeTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeTrialComponentResponse *response, NSError *error))completionHandler {
    [[self describeTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeTrialComponentResponse *> * _Nonnull task) {
        AWSSagemakerDescribeTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeUserProfileResponse *> *)describeUserProfile:(AWSSagemakerDescribeUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeUserProfile"
                   outputClass:[AWSSagemakerDescribeUserProfileResponse class]];
}

- (void)describeUserProfile:(AWSSagemakerDescribeUserProfileRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeUserProfileResponse *response, NSError *error))completionHandler {
    [[self describeUserProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeUserProfileResponse *> * _Nonnull task) {
        AWSSagemakerDescribeUserProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeWorkforceResponse *> *)describeWorkforce:(AWSSagemakerDescribeWorkforceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeWorkforce"
                   outputClass:[AWSSagemakerDescribeWorkforceResponse class]];
}

- (void)describeWorkforce:(AWSSagemakerDescribeWorkforceRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeWorkforceResponse *response, NSError *error))completionHandler {
    [[self describeWorkforce:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeWorkforceResponse *> * _Nonnull task) {
        AWSSagemakerDescribeWorkforceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDescribeWorkteamResponse *> *)describeWorkteam:(AWSSagemakerDescribeWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DescribeWorkteam"
                   outputClass:[AWSSagemakerDescribeWorkteamResponse class]];
}

- (void)describeWorkteam:(AWSSagemakerDescribeWorkteamRequest *)request
     completionHandler:(void (^)(AWSSagemakerDescribeWorkteamResponse *response, NSError *error))completionHandler {
    [[self describeWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDescribeWorkteamResponse *> * _Nonnull task) {
        AWSSagemakerDescribeWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerDisassociateTrialComponentResponse *> *)disassociateTrialComponent:(AWSSagemakerDisassociateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"DisassociateTrialComponent"
                   outputClass:[AWSSagemakerDisassociateTrialComponentResponse class]];
}

- (void)disassociateTrialComponent:(AWSSagemakerDisassociateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSagemakerDisassociateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self disassociateTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerDisassociateTrialComponentResponse *> * _Nonnull task) {
        AWSSagemakerDisassociateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerGetSearchSuggestionsResponse *> *)getSearchSuggestions:(AWSSagemakerGetSearchSuggestionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"GetSearchSuggestions"
                   outputClass:[AWSSagemakerGetSearchSuggestionsResponse class]];
}

- (void)getSearchSuggestions:(AWSSagemakerGetSearchSuggestionsRequest *)request
     completionHandler:(void (^)(AWSSagemakerGetSearchSuggestionsResponse *response, NSError *error))completionHandler {
    [[self getSearchSuggestions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerGetSearchSuggestionsResponse *> * _Nonnull task) {
        AWSSagemakerGetSearchSuggestionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListAlgorithmsOutput *> *)listAlgorithms:(AWSSagemakerListAlgorithmsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListAlgorithms"
                   outputClass:[AWSSagemakerListAlgorithmsOutput class]];
}

- (void)listAlgorithms:(AWSSagemakerListAlgorithmsInput *)request
     completionHandler:(void (^)(AWSSagemakerListAlgorithmsOutput *response, NSError *error))completionHandler {
    [[self listAlgorithms:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListAlgorithmsOutput *> * _Nonnull task) {
        AWSSagemakerListAlgorithmsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListAppsResponse *> *)listApps:(AWSSagemakerListAppsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListApps"
                   outputClass:[AWSSagemakerListAppsResponse class]];
}

- (void)listApps:(AWSSagemakerListAppsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListAppsResponse *response, NSError *error))completionHandler {
    [[self listApps:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListAppsResponse *> * _Nonnull task) {
        AWSSagemakerListAppsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListAutoMLJobsResponse *> *)listAutoMLJobs:(AWSSagemakerListAutoMLJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListAutoMLJobs"
                   outputClass:[AWSSagemakerListAutoMLJobsResponse class]];
}

- (void)listAutoMLJobs:(AWSSagemakerListAutoMLJobsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListAutoMLJobsResponse *response, NSError *error))completionHandler {
    [[self listAutoMLJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListAutoMLJobsResponse *> * _Nonnull task) {
        AWSSagemakerListAutoMLJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListCandidatesForAutoMLJobResponse *> *)listCandidatesForAutoMLJob:(AWSSagemakerListCandidatesForAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListCandidatesForAutoMLJob"
                   outputClass:[AWSSagemakerListCandidatesForAutoMLJobResponse class]];
}

- (void)listCandidatesForAutoMLJob:(AWSSagemakerListCandidatesForAutoMLJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerListCandidatesForAutoMLJobResponse *response, NSError *error))completionHandler {
    [[self listCandidatesForAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListCandidatesForAutoMLJobResponse *> * _Nonnull task) {
        AWSSagemakerListCandidatesForAutoMLJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListCodeRepositoriesOutput *> *)listCodeRepositories:(AWSSagemakerListCodeRepositoriesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListCodeRepositories"
                   outputClass:[AWSSagemakerListCodeRepositoriesOutput class]];
}

- (void)listCodeRepositories:(AWSSagemakerListCodeRepositoriesInput *)request
     completionHandler:(void (^)(AWSSagemakerListCodeRepositoriesOutput *response, NSError *error))completionHandler {
    [[self listCodeRepositories:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListCodeRepositoriesOutput *> * _Nonnull task) {
        AWSSagemakerListCodeRepositoriesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListCompilationJobsResponse *> *)listCompilationJobs:(AWSSagemakerListCompilationJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListCompilationJobs"
                   outputClass:[AWSSagemakerListCompilationJobsResponse class]];
}

- (void)listCompilationJobs:(AWSSagemakerListCompilationJobsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListCompilationJobsResponse *response, NSError *error))completionHandler {
    [[self listCompilationJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListCompilationJobsResponse *> * _Nonnull task) {
        AWSSagemakerListCompilationJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListDomainsResponse *> *)listDomains:(AWSSagemakerListDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListDomains"
                   outputClass:[AWSSagemakerListDomainsResponse class]];
}

- (void)listDomains:(AWSSagemakerListDomainsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListDomainsResponse *response, NSError *error))completionHandler {
    [[self listDomains:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListDomainsResponse *> * _Nonnull task) {
        AWSSagemakerListDomainsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListEndpointConfigsOutput *> *)listEndpointConfigs:(AWSSagemakerListEndpointConfigsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListEndpointConfigs"
                   outputClass:[AWSSagemakerListEndpointConfigsOutput class]];
}

- (void)listEndpointConfigs:(AWSSagemakerListEndpointConfigsInput *)request
     completionHandler:(void (^)(AWSSagemakerListEndpointConfigsOutput *response, NSError *error))completionHandler {
    [[self listEndpointConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListEndpointConfigsOutput *> * _Nonnull task) {
        AWSSagemakerListEndpointConfigsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListEndpointsOutput *> *)listEndpoints:(AWSSagemakerListEndpointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListEndpoints"
                   outputClass:[AWSSagemakerListEndpointsOutput class]];
}

- (void)listEndpoints:(AWSSagemakerListEndpointsInput *)request
     completionHandler:(void (^)(AWSSagemakerListEndpointsOutput *response, NSError *error))completionHandler {
    [[self listEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListEndpointsOutput *> * _Nonnull task) {
        AWSSagemakerListEndpointsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListExperimentsResponse *> *)listExperiments:(AWSSagemakerListExperimentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListExperiments"
                   outputClass:[AWSSagemakerListExperimentsResponse class]];
}

- (void)listExperiments:(AWSSagemakerListExperimentsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListExperimentsResponse *response, NSError *error))completionHandler {
    [[self listExperiments:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListExperimentsResponse *> * _Nonnull task) {
        AWSSagemakerListExperimentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListFlowDefinitionsResponse *> *)listFlowDefinitions:(AWSSagemakerListFlowDefinitionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListFlowDefinitions"
                   outputClass:[AWSSagemakerListFlowDefinitionsResponse class]];
}

- (void)listFlowDefinitions:(AWSSagemakerListFlowDefinitionsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListFlowDefinitionsResponse *response, NSError *error))completionHandler {
    [[self listFlowDefinitions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListFlowDefinitionsResponse *> * _Nonnull task) {
        AWSSagemakerListFlowDefinitionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListHumanTaskUisResponse *> *)listHumanTaskUis:(AWSSagemakerListHumanTaskUisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListHumanTaskUis"
                   outputClass:[AWSSagemakerListHumanTaskUisResponse class]];
}

- (void)listHumanTaskUis:(AWSSagemakerListHumanTaskUisRequest *)request
     completionHandler:(void (^)(AWSSagemakerListHumanTaskUisResponse *response, NSError *error))completionHandler {
    [[self listHumanTaskUis:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListHumanTaskUisResponse *> * _Nonnull task) {
        AWSSagemakerListHumanTaskUisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListHyperParameterTuningJobsResponse *> *)listHyperParameterTuningJobs:(AWSSagemakerListHyperParameterTuningJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListHyperParameterTuningJobs"
                   outputClass:[AWSSagemakerListHyperParameterTuningJobsResponse class]];
}

- (void)listHyperParameterTuningJobs:(AWSSagemakerListHyperParameterTuningJobsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListHyperParameterTuningJobsResponse *response, NSError *error))completionHandler {
    [[self listHyperParameterTuningJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListHyperParameterTuningJobsResponse *> * _Nonnull task) {
        AWSSagemakerListHyperParameterTuningJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListLabelingJobsResponse *> *)listLabelingJobs:(AWSSagemakerListLabelingJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListLabelingJobs"
                   outputClass:[AWSSagemakerListLabelingJobsResponse class]];
}

- (void)listLabelingJobs:(AWSSagemakerListLabelingJobsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListLabelingJobsResponse *response, NSError *error))completionHandler {
    [[self listLabelingJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListLabelingJobsResponse *> * _Nonnull task) {
        AWSSagemakerListLabelingJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListLabelingJobsForWorkteamResponse *> *)listLabelingJobsForWorkteam:(AWSSagemakerListLabelingJobsForWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListLabelingJobsForWorkteam"
                   outputClass:[AWSSagemakerListLabelingJobsForWorkteamResponse class]];
}

- (void)listLabelingJobsForWorkteam:(AWSSagemakerListLabelingJobsForWorkteamRequest *)request
     completionHandler:(void (^)(AWSSagemakerListLabelingJobsForWorkteamResponse *response, NSError *error))completionHandler {
    [[self listLabelingJobsForWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListLabelingJobsForWorkteamResponse *> * _Nonnull task) {
        AWSSagemakerListLabelingJobsForWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListModelPackagesOutput *> *)listModelPackages:(AWSSagemakerListModelPackagesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListModelPackages"
                   outputClass:[AWSSagemakerListModelPackagesOutput class]];
}

- (void)listModelPackages:(AWSSagemakerListModelPackagesInput *)request
     completionHandler:(void (^)(AWSSagemakerListModelPackagesOutput *response, NSError *error))completionHandler {
    [[self listModelPackages:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListModelPackagesOutput *> * _Nonnull task) {
        AWSSagemakerListModelPackagesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListModelsOutput *> *)listModels:(AWSSagemakerListModelsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListModels"
                   outputClass:[AWSSagemakerListModelsOutput class]];
}

- (void)listModels:(AWSSagemakerListModelsInput *)request
     completionHandler:(void (^)(AWSSagemakerListModelsOutput *response, NSError *error))completionHandler {
    [[self listModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListModelsOutput *> * _Nonnull task) {
        AWSSagemakerListModelsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListMonitoringExecutionsResponse *> *)listMonitoringExecutions:(AWSSagemakerListMonitoringExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListMonitoringExecutions"
                   outputClass:[AWSSagemakerListMonitoringExecutionsResponse class]];
}

- (void)listMonitoringExecutions:(AWSSagemakerListMonitoringExecutionsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListMonitoringExecutionsResponse *response, NSError *error))completionHandler {
    [[self listMonitoringExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListMonitoringExecutionsResponse *> * _Nonnull task) {
        AWSSagemakerListMonitoringExecutionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListMonitoringSchedulesResponse *> *)listMonitoringSchedules:(AWSSagemakerListMonitoringSchedulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListMonitoringSchedules"
                   outputClass:[AWSSagemakerListMonitoringSchedulesResponse class]];
}

- (void)listMonitoringSchedules:(AWSSagemakerListMonitoringSchedulesRequest *)request
     completionHandler:(void (^)(AWSSagemakerListMonitoringSchedulesResponse *response, NSError *error))completionHandler {
    [[self listMonitoringSchedules:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListMonitoringSchedulesResponse *> * _Nonnull task) {
        AWSSagemakerListMonitoringSchedulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListNotebookInstanceLifecycleConfigsOutput *> *)listNotebookInstanceLifecycleConfigs:(AWSSagemakerListNotebookInstanceLifecycleConfigsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListNotebookInstanceLifecycleConfigs"
                   outputClass:[AWSSagemakerListNotebookInstanceLifecycleConfigsOutput class]];
}

- (void)listNotebookInstanceLifecycleConfigs:(AWSSagemakerListNotebookInstanceLifecycleConfigsInput *)request
     completionHandler:(void (^)(AWSSagemakerListNotebookInstanceLifecycleConfigsOutput *response, NSError *error))completionHandler {
    [[self listNotebookInstanceLifecycleConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListNotebookInstanceLifecycleConfigsOutput *> * _Nonnull task) {
        AWSSagemakerListNotebookInstanceLifecycleConfigsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListNotebookInstancesOutput *> *)listNotebookInstances:(AWSSagemakerListNotebookInstancesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListNotebookInstances"
                   outputClass:[AWSSagemakerListNotebookInstancesOutput class]];
}

- (void)listNotebookInstances:(AWSSagemakerListNotebookInstancesInput *)request
     completionHandler:(void (^)(AWSSagemakerListNotebookInstancesOutput *response, NSError *error))completionHandler {
    [[self listNotebookInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListNotebookInstancesOutput *> * _Nonnull task) {
        AWSSagemakerListNotebookInstancesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListProcessingJobsResponse *> *)listProcessingJobs:(AWSSagemakerListProcessingJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListProcessingJobs"
                   outputClass:[AWSSagemakerListProcessingJobsResponse class]];
}

- (void)listProcessingJobs:(AWSSagemakerListProcessingJobsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListProcessingJobsResponse *response, NSError *error))completionHandler {
    [[self listProcessingJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListProcessingJobsResponse *> * _Nonnull task) {
        AWSSagemakerListProcessingJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListSubscribedWorkteamsResponse *> *)listSubscribedWorkteams:(AWSSagemakerListSubscribedWorkteamsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListSubscribedWorkteams"
                   outputClass:[AWSSagemakerListSubscribedWorkteamsResponse class]];
}

- (void)listSubscribedWorkteams:(AWSSagemakerListSubscribedWorkteamsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListSubscribedWorkteamsResponse *response, NSError *error))completionHandler {
    [[self listSubscribedWorkteams:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListSubscribedWorkteamsResponse *> * _Nonnull task) {
        AWSSagemakerListSubscribedWorkteamsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListTagsOutput *> *)listTags:(AWSSagemakerListTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTags"
                   outputClass:[AWSSagemakerListTagsOutput class]];
}

- (void)listTags:(AWSSagemakerListTagsInput *)request
     completionHandler:(void (^)(AWSSagemakerListTagsOutput *response, NSError *error))completionHandler {
    [[self listTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListTagsOutput *> * _Nonnull task) {
        AWSSagemakerListTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListTrainingJobsResponse *> *)listTrainingJobs:(AWSSagemakerListTrainingJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrainingJobs"
                   outputClass:[AWSSagemakerListTrainingJobsResponse class]];
}

- (void)listTrainingJobs:(AWSSagemakerListTrainingJobsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListTrainingJobsResponse *response, NSError *error))completionHandler {
    [[self listTrainingJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListTrainingJobsResponse *> * _Nonnull task) {
        AWSSagemakerListTrainingJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse *> *)listTrainingJobsForHyperParameterTuningJob:(AWSSagemakerListTrainingJobsForHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrainingJobsForHyperParameterTuningJob"
                   outputClass:[AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse class]];
}

- (void)listTrainingJobsForHyperParameterTuningJob:(AWSSagemakerListTrainingJobsForHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse *response, NSError *error))completionHandler {
    [[self listTrainingJobsForHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse *> * _Nonnull task) {
        AWSSagemakerListTrainingJobsForHyperParameterTuningJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListTransformJobsResponse *> *)listTransformJobs:(AWSSagemakerListTransformJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTransformJobs"
                   outputClass:[AWSSagemakerListTransformJobsResponse class]];
}

- (void)listTransformJobs:(AWSSagemakerListTransformJobsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListTransformJobsResponse *response, NSError *error))completionHandler {
    [[self listTransformJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListTransformJobsResponse *> * _Nonnull task) {
        AWSSagemakerListTransformJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListTrialComponentsResponse *> *)listTrialComponents:(AWSSagemakerListTrialComponentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrialComponents"
                   outputClass:[AWSSagemakerListTrialComponentsResponse class]];
}

- (void)listTrialComponents:(AWSSagemakerListTrialComponentsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListTrialComponentsResponse *response, NSError *error))completionHandler {
    [[self listTrialComponents:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListTrialComponentsResponse *> * _Nonnull task) {
        AWSSagemakerListTrialComponentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListTrialsResponse *> *)listTrials:(AWSSagemakerListTrialsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListTrials"
                   outputClass:[AWSSagemakerListTrialsResponse class]];
}

- (void)listTrials:(AWSSagemakerListTrialsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListTrialsResponse *response, NSError *error))completionHandler {
    [[self listTrials:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListTrialsResponse *> * _Nonnull task) {
        AWSSagemakerListTrialsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListUserProfilesResponse *> *)listUserProfiles:(AWSSagemakerListUserProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListUserProfiles"
                   outputClass:[AWSSagemakerListUserProfilesResponse class]];
}

- (void)listUserProfiles:(AWSSagemakerListUserProfilesRequest *)request
     completionHandler:(void (^)(AWSSagemakerListUserProfilesResponse *response, NSError *error))completionHandler {
    [[self listUserProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListUserProfilesResponse *> * _Nonnull task) {
        AWSSagemakerListUserProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerListWorkteamsResponse *> *)listWorkteams:(AWSSagemakerListWorkteamsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"ListWorkteams"
                   outputClass:[AWSSagemakerListWorkteamsResponse class]];
}

- (void)listWorkteams:(AWSSagemakerListWorkteamsRequest *)request
     completionHandler:(void (^)(AWSSagemakerListWorkteamsResponse *response, NSError *error))completionHandler {
    [[self listWorkteams:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerListWorkteamsResponse *> * _Nonnull task) {
        AWSSagemakerListWorkteamsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerRenderUiTemplateResponse *> *)renderUiTemplate:(AWSSagemakerRenderUiTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"RenderUiTemplate"
                   outputClass:[AWSSagemakerRenderUiTemplateResponse class]];
}

- (void)renderUiTemplate:(AWSSagemakerRenderUiTemplateRequest *)request
     completionHandler:(void (^)(AWSSagemakerRenderUiTemplateResponse *response, NSError *error))completionHandler {
    [[self renderUiTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerRenderUiTemplateResponse *> * _Nonnull task) {
        AWSSagemakerRenderUiTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerSearchResponse *> *)search:(AWSSagemakerSearchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"Search"
                   outputClass:[AWSSagemakerSearchResponse class]];
}

- (void)search:(AWSSagemakerSearchRequest *)request
     completionHandler:(void (^)(AWSSagemakerSearchResponse *response, NSError *error))completionHandler {
    [[self search:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerSearchResponse *> * _Nonnull task) {
        AWSSagemakerSearchResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)startMonitoringSchedule:(AWSSagemakerStartMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StartMonitoringSchedule"
                   outputClass:nil];
}

- (void)startMonitoringSchedule:(AWSSagemakerStartMonitoringScheduleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self startMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)startNotebookInstance:(AWSSagemakerStartNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StartNotebookInstance"
                   outputClass:nil];
}

- (void)startNotebookInstance:(AWSSagemakerStartNotebookInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self startNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopAutoMLJob:(AWSSagemakerStopAutoMLJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopAutoMLJob"
                   outputClass:nil];
}

- (void)stopAutoMLJob:(AWSSagemakerStopAutoMLJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopAutoMLJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopCompilationJob:(AWSSagemakerStopCompilationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopCompilationJob"
                   outputClass:nil];
}

- (void)stopCompilationJob:(AWSSagemakerStopCompilationJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopCompilationJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopHyperParameterTuningJob:(AWSSagemakerStopHyperParameterTuningJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopHyperParameterTuningJob"
                   outputClass:nil];
}

- (void)stopHyperParameterTuningJob:(AWSSagemakerStopHyperParameterTuningJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopHyperParameterTuningJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopLabelingJob:(AWSSagemakerStopLabelingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopLabelingJob"
                   outputClass:nil];
}

- (void)stopLabelingJob:(AWSSagemakerStopLabelingJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopLabelingJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopMonitoringSchedule:(AWSSagemakerStopMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopMonitoringSchedule"
                   outputClass:nil];
}

- (void)stopMonitoringSchedule:(AWSSagemakerStopMonitoringScheduleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopNotebookInstance:(AWSSagemakerStopNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopNotebookInstance"
                   outputClass:nil];
}

- (void)stopNotebookInstance:(AWSSagemakerStopNotebookInstanceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopProcessingJob:(AWSSagemakerStopProcessingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopProcessingJob"
                   outputClass:nil];
}

- (void)stopProcessingJob:(AWSSagemakerStopProcessingJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopProcessingJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopTrainingJob:(AWSSagemakerStopTrainingJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopTrainingJob"
                   outputClass:nil];
}

- (void)stopTrainingJob:(AWSSagemakerStopTrainingJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopTrainingJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopTransformJob:(AWSSagemakerStopTransformJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"StopTransformJob"
                   outputClass:nil];
}

- (void)stopTransformJob:(AWSSagemakerStopTransformJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopTransformJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateCodeRepositoryOutput *> *)updateCodeRepository:(AWSSagemakerUpdateCodeRepositoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateCodeRepository"
                   outputClass:[AWSSagemakerUpdateCodeRepositoryOutput class]];
}

- (void)updateCodeRepository:(AWSSagemakerUpdateCodeRepositoryInput *)request
     completionHandler:(void (^)(AWSSagemakerUpdateCodeRepositoryOutput *response, NSError *error))completionHandler {
    [[self updateCodeRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateCodeRepositoryOutput *> * _Nonnull task) {
        AWSSagemakerUpdateCodeRepositoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateDomainResponse *> *)updateDomain:(AWSSagemakerUpdateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateDomain"
                   outputClass:[AWSSagemakerUpdateDomainResponse class]];
}

- (void)updateDomain:(AWSSagemakerUpdateDomainRequest *)request
     completionHandler:(void (^)(AWSSagemakerUpdateDomainResponse *response, NSError *error))completionHandler {
    [[self updateDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateDomainResponse *> * _Nonnull task) {
        AWSSagemakerUpdateDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateEndpointOutput *> *)updateEndpoint:(AWSSagemakerUpdateEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateEndpoint"
                   outputClass:[AWSSagemakerUpdateEndpointOutput class]];
}

- (void)updateEndpoint:(AWSSagemakerUpdateEndpointInput *)request
     completionHandler:(void (^)(AWSSagemakerUpdateEndpointOutput *response, NSError *error))completionHandler {
    [[self updateEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateEndpointOutput *> * _Nonnull task) {
        AWSSagemakerUpdateEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput *> *)updateEndpointWeightsAndCapacities:(AWSSagemakerUpdateEndpointWeightsAndCapacitiesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateEndpointWeightsAndCapacities"
                   outputClass:[AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput class]];
}

- (void)updateEndpointWeightsAndCapacities:(AWSSagemakerUpdateEndpointWeightsAndCapacitiesInput *)request
     completionHandler:(void (^)(AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput *response, NSError *error))completionHandler {
    [[self updateEndpointWeightsAndCapacities:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput *> * _Nonnull task) {
        AWSSagemakerUpdateEndpointWeightsAndCapacitiesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateExperimentResponse *> *)updateExperiment:(AWSSagemakerUpdateExperimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateExperiment"
                   outputClass:[AWSSagemakerUpdateExperimentResponse class]];
}

- (void)updateExperiment:(AWSSagemakerUpdateExperimentRequest *)request
     completionHandler:(void (^)(AWSSagemakerUpdateExperimentResponse *response, NSError *error))completionHandler {
    [[self updateExperiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateExperimentResponse *> * _Nonnull task) {
        AWSSagemakerUpdateExperimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateMonitoringScheduleResponse *> *)updateMonitoringSchedule:(AWSSagemakerUpdateMonitoringScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateMonitoringSchedule"
                   outputClass:[AWSSagemakerUpdateMonitoringScheduleResponse class]];
}

- (void)updateMonitoringSchedule:(AWSSagemakerUpdateMonitoringScheduleRequest *)request
     completionHandler:(void (^)(AWSSagemakerUpdateMonitoringScheduleResponse *response, NSError *error))completionHandler {
    [[self updateMonitoringSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateMonitoringScheduleResponse *> * _Nonnull task) {
        AWSSagemakerUpdateMonitoringScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateNotebookInstanceOutput *> *)updateNotebookInstance:(AWSSagemakerUpdateNotebookInstanceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateNotebookInstance"
                   outputClass:[AWSSagemakerUpdateNotebookInstanceOutput class]];
}

- (void)updateNotebookInstance:(AWSSagemakerUpdateNotebookInstanceInput *)request
     completionHandler:(void (^)(AWSSagemakerUpdateNotebookInstanceOutput *response, NSError *error))completionHandler {
    [[self updateNotebookInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateNotebookInstanceOutput *> * _Nonnull task) {
        AWSSagemakerUpdateNotebookInstanceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput *> *)updateNotebookInstanceLifecycleConfig:(AWSSagemakerUpdateNotebookInstanceLifecycleConfigInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateNotebookInstanceLifecycleConfig"
                   outputClass:[AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput class]];
}

- (void)updateNotebookInstanceLifecycleConfig:(AWSSagemakerUpdateNotebookInstanceLifecycleConfigInput *)request
     completionHandler:(void (^)(AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput *response, NSError *error))completionHandler {
    [[self updateNotebookInstanceLifecycleConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput *> * _Nonnull task) {
        AWSSagemakerUpdateNotebookInstanceLifecycleConfigOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateTrialResponse *> *)updateTrial:(AWSSagemakerUpdateTrialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateTrial"
                   outputClass:[AWSSagemakerUpdateTrialResponse class]];
}

- (void)updateTrial:(AWSSagemakerUpdateTrialRequest *)request
     completionHandler:(void (^)(AWSSagemakerUpdateTrialResponse *response, NSError *error))completionHandler {
    [[self updateTrial:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateTrialResponse *> * _Nonnull task) {
        AWSSagemakerUpdateTrialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateTrialComponentResponse *> *)updateTrialComponent:(AWSSagemakerUpdateTrialComponentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateTrialComponent"
                   outputClass:[AWSSagemakerUpdateTrialComponentResponse class]];
}

- (void)updateTrialComponent:(AWSSagemakerUpdateTrialComponentRequest *)request
     completionHandler:(void (^)(AWSSagemakerUpdateTrialComponentResponse *response, NSError *error))completionHandler {
    [[self updateTrialComponent:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateTrialComponentResponse *> * _Nonnull task) {
        AWSSagemakerUpdateTrialComponentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateUserProfileResponse *> *)updateUserProfile:(AWSSagemakerUpdateUserProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateUserProfile"
                   outputClass:[AWSSagemakerUpdateUserProfileResponse class]];
}

- (void)updateUserProfile:(AWSSagemakerUpdateUserProfileRequest *)request
     completionHandler:(void (^)(AWSSagemakerUpdateUserProfileResponse *response, NSError *error))completionHandler {
    [[self updateUserProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateUserProfileResponse *> * _Nonnull task) {
        AWSSagemakerUpdateUserProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateWorkforceResponse *> *)updateWorkforce:(AWSSagemakerUpdateWorkforceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateWorkforce"
                   outputClass:[AWSSagemakerUpdateWorkforceResponse class]];
}

- (void)updateWorkforce:(AWSSagemakerUpdateWorkforceRequest *)request
     completionHandler:(void (^)(AWSSagemakerUpdateWorkforceResponse *response, NSError *error))completionHandler {
    [[self updateWorkforce:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateWorkforceResponse *> * _Nonnull task) {
        AWSSagemakerUpdateWorkforceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSagemakerUpdateWorkteamResponse *> *)updateWorkteam:(AWSSagemakerUpdateWorkteamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"SageMaker"
                 operationName:@"UpdateWorkteam"
                   outputClass:[AWSSagemakerUpdateWorkteamResponse class]];
}

- (void)updateWorkteam:(AWSSagemakerUpdateWorkteamRequest *)request
     completionHandler:(void (^)(AWSSagemakerUpdateWorkteamResponse *response, NSError *error))completionHandler {
    [[self updateWorkteam:request] continueWithBlock:^id _Nullable(AWSTask<AWSSagemakerUpdateWorkteamResponse *> * _Nonnull task) {
        AWSSagemakerUpdateWorkteamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
