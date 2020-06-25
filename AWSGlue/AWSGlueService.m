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

#import "AWSGlueService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSGlueResources.h"

static NSString *const AWSInfoGlue = @"Glue";
NSString *const AWSGlueSDKVersion = @"2.13.5";


@interface AWSGlueResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSGlueResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSGlueErrorAccessDenied),
                            @"AlreadyExistsException" : @(AWSGlueErrorAlreadyExists),
                            @"ConcurrentModificationException" : @(AWSGlueErrorConcurrentModification),
                            @"ConcurrentRunsExceededException" : @(AWSGlueErrorConcurrentRunsExceeded),
                            @"ConditionCheckFailureException" : @(AWSGlueErrorConditionCheckFailure),
                            @"CrawlerNotRunningException" : @(AWSGlueErrorCrawlerNotRunning),
                            @"CrawlerRunningException" : @(AWSGlueErrorCrawlerRunning),
                            @"CrawlerStoppingException" : @(AWSGlueErrorCrawlerStopping),
                            @"EntityNotFoundException" : @(AWSGlueErrorEntityNotFound),
                            @"GlueEncryptionException" : @(AWSGlueErrorGlueEncryption),
                            @"IdempotentParameterMismatchException" : @(AWSGlueErrorIdempotentParameterMismatch),
                            @"IllegalWorkflowStateException" : @(AWSGlueErrorIllegalWorkflowState),
                            @"InternalServiceException" : @(AWSGlueErrorInternalService),
                            @"InvalidInputException" : @(AWSGlueErrorInvalidInput),
                            @"MLTransformNotReadyException" : @(AWSGlueErrorMLTransformNotReady),
                            @"NoScheduleException" : @(AWSGlueErrorNoSchedule),
                            @"OperationTimeoutException" : @(AWSGlueErrorOperationTimeout),
                            @"ResourceNumberLimitExceededException" : @(AWSGlueErrorResourceNumberLimitExceeded),
                            @"SchedulerNotRunningException" : @(AWSGlueErrorSchedulerNotRunning),
                            @"SchedulerRunningException" : @(AWSGlueErrorSchedulerRunning),
                            @"SchedulerTransitioningException" : @(AWSGlueErrorSchedulerTransitioning),
                            @"ValidationException" : @(AWSGlueErrorValidation),
                            @"VersionMismatchException" : @(AWSGlueErrorVersionMismatch),
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
	                *error = [NSError errorWithDomain:AWSGlueErrorDomain
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
        *error = [NSError errorWithDomain:AWSGlueErrorDomain
                                     code:AWSGlueErrorUnknown
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

@interface AWSGlueRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSGlueRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSGlue()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSGlue

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSGlueSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSGlue versions need to match. Check your SDK installation. AWSCore: %@ AWSGlue: %@", AWSiOSSDKVersion, AWSGlueSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultGlue {
    static AWSGlue *_defaultGlue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoGlue];
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
        _defaultGlue = [[AWSGlue alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultGlue;
}

+ (void)registerGlueWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSGlue alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)GlueForKey:(NSString *)key {
    @synchronized(self) {
        AWSGlue *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoGlue
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSGlue registerGlueWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeGlueForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultGlue` or `+ GlueForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceGlue
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceGlue];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSGlueRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSGlueResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSGlueResponseSerializer alloc] initWithJSONDefinition:[[AWSGlueResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSGlueBatchCreatePartitionResponse *> *)batchCreatePartition:(AWSGlueBatchCreatePartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchCreatePartition"
                   outputClass:[AWSGlueBatchCreatePartitionResponse class]];
}

- (void)batchCreatePartition:(AWSGlueBatchCreatePartitionRequest *)request
     completionHandler:(void (^)(AWSGlueBatchCreatePartitionResponse *response, NSError *error))completionHandler {
    [[self batchCreatePartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchCreatePartitionResponse *> * _Nonnull task) {
        AWSGlueBatchCreatePartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchDeleteConnectionResponse *> *)batchDeleteConnection:(AWSGlueBatchDeleteConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchDeleteConnection"
                   outputClass:[AWSGlueBatchDeleteConnectionResponse class]];
}

- (void)batchDeleteConnection:(AWSGlueBatchDeleteConnectionRequest *)request
     completionHandler:(void (^)(AWSGlueBatchDeleteConnectionResponse *response, NSError *error))completionHandler {
    [[self batchDeleteConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchDeleteConnectionResponse *> * _Nonnull task) {
        AWSGlueBatchDeleteConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchDeletePartitionResponse *> *)batchDeletePartition:(AWSGlueBatchDeletePartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchDeletePartition"
                   outputClass:[AWSGlueBatchDeletePartitionResponse class]];
}

- (void)batchDeletePartition:(AWSGlueBatchDeletePartitionRequest *)request
     completionHandler:(void (^)(AWSGlueBatchDeletePartitionResponse *response, NSError *error))completionHandler {
    [[self batchDeletePartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchDeletePartitionResponse *> * _Nonnull task) {
        AWSGlueBatchDeletePartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchDeleteTableResponse *> *)batchDeleteTable:(AWSGlueBatchDeleteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchDeleteTable"
                   outputClass:[AWSGlueBatchDeleteTableResponse class]];
}

- (void)batchDeleteTable:(AWSGlueBatchDeleteTableRequest *)request
     completionHandler:(void (^)(AWSGlueBatchDeleteTableResponse *response, NSError *error))completionHandler {
    [[self batchDeleteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchDeleteTableResponse *> * _Nonnull task) {
        AWSGlueBatchDeleteTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchDeleteTableVersionResponse *> *)batchDeleteTableVersion:(AWSGlueBatchDeleteTableVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchDeleteTableVersion"
                   outputClass:[AWSGlueBatchDeleteTableVersionResponse class]];
}

- (void)batchDeleteTableVersion:(AWSGlueBatchDeleteTableVersionRequest *)request
     completionHandler:(void (^)(AWSGlueBatchDeleteTableVersionResponse *response, NSError *error))completionHandler {
    [[self batchDeleteTableVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchDeleteTableVersionResponse *> * _Nonnull task) {
        AWSGlueBatchDeleteTableVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchGetCrawlersResponse *> *)batchGetCrawlers:(AWSGlueBatchGetCrawlersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetCrawlers"
                   outputClass:[AWSGlueBatchGetCrawlersResponse class]];
}

- (void)batchGetCrawlers:(AWSGlueBatchGetCrawlersRequest *)request
     completionHandler:(void (^)(AWSGlueBatchGetCrawlersResponse *response, NSError *error))completionHandler {
    [[self batchGetCrawlers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchGetCrawlersResponse *> * _Nonnull task) {
        AWSGlueBatchGetCrawlersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchGetDevEndpointsResponse *> *)batchGetDevEndpoints:(AWSGlueBatchGetDevEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetDevEndpoints"
                   outputClass:[AWSGlueBatchGetDevEndpointsResponse class]];
}

- (void)batchGetDevEndpoints:(AWSGlueBatchGetDevEndpointsRequest *)request
     completionHandler:(void (^)(AWSGlueBatchGetDevEndpointsResponse *response, NSError *error))completionHandler {
    [[self batchGetDevEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchGetDevEndpointsResponse *> * _Nonnull task) {
        AWSGlueBatchGetDevEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchGetJobsResponse *> *)batchGetJobs:(AWSGlueBatchGetJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetJobs"
                   outputClass:[AWSGlueBatchGetJobsResponse class]];
}

- (void)batchGetJobs:(AWSGlueBatchGetJobsRequest *)request
     completionHandler:(void (^)(AWSGlueBatchGetJobsResponse *response, NSError *error))completionHandler {
    [[self batchGetJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchGetJobsResponse *> * _Nonnull task) {
        AWSGlueBatchGetJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchGetPartitionResponse *> *)batchGetPartition:(AWSGlueBatchGetPartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetPartition"
                   outputClass:[AWSGlueBatchGetPartitionResponse class]];
}

- (void)batchGetPartition:(AWSGlueBatchGetPartitionRequest *)request
     completionHandler:(void (^)(AWSGlueBatchGetPartitionResponse *response, NSError *error))completionHandler {
    [[self batchGetPartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchGetPartitionResponse *> * _Nonnull task) {
        AWSGlueBatchGetPartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchGetTriggersResponse *> *)batchGetTriggers:(AWSGlueBatchGetTriggersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetTriggers"
                   outputClass:[AWSGlueBatchGetTriggersResponse class]];
}

- (void)batchGetTriggers:(AWSGlueBatchGetTriggersRequest *)request
     completionHandler:(void (^)(AWSGlueBatchGetTriggersResponse *response, NSError *error))completionHandler {
    [[self batchGetTriggers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchGetTriggersResponse *> * _Nonnull task) {
        AWSGlueBatchGetTriggersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchGetWorkflowsResponse *> *)batchGetWorkflows:(AWSGlueBatchGetWorkflowsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetWorkflows"
                   outputClass:[AWSGlueBatchGetWorkflowsResponse class]];
}

- (void)batchGetWorkflows:(AWSGlueBatchGetWorkflowsRequest *)request
     completionHandler:(void (^)(AWSGlueBatchGetWorkflowsResponse *response, NSError *error))completionHandler {
    [[self batchGetWorkflows:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchGetWorkflowsResponse *> * _Nonnull task) {
        AWSGlueBatchGetWorkflowsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueBatchStopJobRunResponse *> *)batchStopJobRun:(AWSGlueBatchStopJobRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchStopJobRun"
                   outputClass:[AWSGlueBatchStopJobRunResponse class]];
}

- (void)batchStopJobRun:(AWSGlueBatchStopJobRunRequest *)request
     completionHandler:(void (^)(AWSGlueBatchStopJobRunResponse *response, NSError *error))completionHandler {
    [[self batchStopJobRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueBatchStopJobRunResponse *> * _Nonnull task) {
        AWSGlueBatchStopJobRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCancelMLTaskRunResponse *> *)cancelMLTaskRun:(AWSGlueCancelMLTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CancelMLTaskRun"
                   outputClass:[AWSGlueCancelMLTaskRunResponse class]];
}

- (void)cancelMLTaskRun:(AWSGlueCancelMLTaskRunRequest *)request
     completionHandler:(void (^)(AWSGlueCancelMLTaskRunResponse *response, NSError *error))completionHandler {
    [[self cancelMLTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCancelMLTaskRunResponse *> * _Nonnull task) {
        AWSGlueCancelMLTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateClassifierResponse *> *)createClassifier:(AWSGlueCreateClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateClassifier"
                   outputClass:[AWSGlueCreateClassifierResponse class]];
}

- (void)createClassifier:(AWSGlueCreateClassifierRequest *)request
     completionHandler:(void (^)(AWSGlueCreateClassifierResponse *response, NSError *error))completionHandler {
    [[self createClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateClassifierResponse *> * _Nonnull task) {
        AWSGlueCreateClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateConnectionResponse *> *)createConnection:(AWSGlueCreateConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateConnection"
                   outputClass:[AWSGlueCreateConnectionResponse class]];
}

- (void)createConnection:(AWSGlueCreateConnectionRequest *)request
     completionHandler:(void (^)(AWSGlueCreateConnectionResponse *response, NSError *error))completionHandler {
    [[self createConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateConnectionResponse *> * _Nonnull task) {
        AWSGlueCreateConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateCrawlerResponse *> *)createCrawler:(AWSGlueCreateCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateCrawler"
                   outputClass:[AWSGlueCreateCrawlerResponse class]];
}

- (void)createCrawler:(AWSGlueCreateCrawlerRequest *)request
     completionHandler:(void (^)(AWSGlueCreateCrawlerResponse *response, NSError *error))completionHandler {
    [[self createCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateCrawlerResponse *> * _Nonnull task) {
        AWSGlueCreateCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateDatabaseResponse *> *)createDatabase:(AWSGlueCreateDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateDatabase"
                   outputClass:[AWSGlueCreateDatabaseResponse class]];
}

- (void)createDatabase:(AWSGlueCreateDatabaseRequest *)request
     completionHandler:(void (^)(AWSGlueCreateDatabaseResponse *response, NSError *error))completionHandler {
    [[self createDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateDatabaseResponse *> * _Nonnull task) {
        AWSGlueCreateDatabaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateDevEndpointResponse *> *)createDevEndpoint:(AWSGlueCreateDevEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateDevEndpoint"
                   outputClass:[AWSGlueCreateDevEndpointResponse class]];
}

- (void)createDevEndpoint:(AWSGlueCreateDevEndpointRequest *)request
     completionHandler:(void (^)(AWSGlueCreateDevEndpointResponse *response, NSError *error))completionHandler {
    [[self createDevEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateDevEndpointResponse *> * _Nonnull task) {
        AWSGlueCreateDevEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateJobResponse *> *)createJob:(AWSGlueCreateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateJob"
                   outputClass:[AWSGlueCreateJobResponse class]];
}

- (void)createJob:(AWSGlueCreateJobRequest *)request
     completionHandler:(void (^)(AWSGlueCreateJobResponse *response, NSError *error))completionHandler {
    [[self createJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateJobResponse *> * _Nonnull task) {
        AWSGlueCreateJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateMLTransformResponse *> *)createMLTransform:(AWSGlueCreateMLTransformRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateMLTransform"
                   outputClass:[AWSGlueCreateMLTransformResponse class]];
}

- (void)createMLTransform:(AWSGlueCreateMLTransformRequest *)request
     completionHandler:(void (^)(AWSGlueCreateMLTransformResponse *response, NSError *error))completionHandler {
    [[self createMLTransform:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateMLTransformResponse *> * _Nonnull task) {
        AWSGlueCreateMLTransformResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreatePartitionResponse *> *)createPartition:(AWSGlueCreatePartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreatePartition"
                   outputClass:[AWSGlueCreatePartitionResponse class]];
}

- (void)createPartition:(AWSGlueCreatePartitionRequest *)request
     completionHandler:(void (^)(AWSGlueCreatePartitionResponse *response, NSError *error))completionHandler {
    [[self createPartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreatePartitionResponse *> * _Nonnull task) {
        AWSGlueCreatePartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateScriptResponse *> *)createScript:(AWSGlueCreateScriptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateScript"
                   outputClass:[AWSGlueCreateScriptResponse class]];
}

- (void)createScript:(AWSGlueCreateScriptRequest *)request
     completionHandler:(void (^)(AWSGlueCreateScriptResponse *response, NSError *error))completionHandler {
    [[self createScript:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateScriptResponse *> * _Nonnull task) {
        AWSGlueCreateScriptResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateSecurityConfigurationResponse *> *)createSecurityConfiguration:(AWSGlueCreateSecurityConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateSecurityConfiguration"
                   outputClass:[AWSGlueCreateSecurityConfigurationResponse class]];
}

- (void)createSecurityConfiguration:(AWSGlueCreateSecurityConfigurationRequest *)request
     completionHandler:(void (^)(AWSGlueCreateSecurityConfigurationResponse *response, NSError *error))completionHandler {
    [[self createSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateSecurityConfigurationResponse *> * _Nonnull task) {
        AWSGlueCreateSecurityConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateTableResponse *> *)createTable:(AWSGlueCreateTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateTable"
                   outputClass:[AWSGlueCreateTableResponse class]];
}

- (void)createTable:(AWSGlueCreateTableRequest *)request
     completionHandler:(void (^)(AWSGlueCreateTableResponse *response, NSError *error))completionHandler {
    [[self createTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateTableResponse *> * _Nonnull task) {
        AWSGlueCreateTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateTriggerResponse *> *)createTrigger:(AWSGlueCreateTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateTrigger"
                   outputClass:[AWSGlueCreateTriggerResponse class]];
}

- (void)createTrigger:(AWSGlueCreateTriggerRequest *)request
     completionHandler:(void (^)(AWSGlueCreateTriggerResponse *response, NSError *error))completionHandler {
    [[self createTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateTriggerResponse *> * _Nonnull task) {
        AWSGlueCreateTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateUserDefinedFunctionResponse *> *)createUserDefinedFunction:(AWSGlueCreateUserDefinedFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateUserDefinedFunction"
                   outputClass:[AWSGlueCreateUserDefinedFunctionResponse class]];
}

- (void)createUserDefinedFunction:(AWSGlueCreateUserDefinedFunctionRequest *)request
     completionHandler:(void (^)(AWSGlueCreateUserDefinedFunctionResponse *response, NSError *error))completionHandler {
    [[self createUserDefinedFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateUserDefinedFunctionResponse *> * _Nonnull task) {
        AWSGlueCreateUserDefinedFunctionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueCreateWorkflowResponse *> *)createWorkflow:(AWSGlueCreateWorkflowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateWorkflow"
                   outputClass:[AWSGlueCreateWorkflowResponse class]];
}

- (void)createWorkflow:(AWSGlueCreateWorkflowRequest *)request
     completionHandler:(void (^)(AWSGlueCreateWorkflowResponse *response, NSError *error))completionHandler {
    [[self createWorkflow:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueCreateWorkflowResponse *> * _Nonnull task) {
        AWSGlueCreateWorkflowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteClassifierResponse *> *)deleteClassifier:(AWSGlueDeleteClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteClassifier"
                   outputClass:[AWSGlueDeleteClassifierResponse class]];
}

- (void)deleteClassifier:(AWSGlueDeleteClassifierRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteClassifierResponse *response, NSError *error))completionHandler {
    [[self deleteClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteClassifierResponse *> * _Nonnull task) {
        AWSGlueDeleteClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteColumnStatisticsForPartitionResponse *> *)deleteColumnStatisticsForPartition:(AWSGlueDeleteColumnStatisticsForPartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteColumnStatisticsForPartition"
                   outputClass:[AWSGlueDeleteColumnStatisticsForPartitionResponse class]];
}

- (void)deleteColumnStatisticsForPartition:(AWSGlueDeleteColumnStatisticsForPartitionRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteColumnStatisticsForPartitionResponse *response, NSError *error))completionHandler {
    [[self deleteColumnStatisticsForPartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteColumnStatisticsForPartitionResponse *> * _Nonnull task) {
        AWSGlueDeleteColumnStatisticsForPartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteColumnStatisticsForTableResponse *> *)deleteColumnStatisticsForTable:(AWSGlueDeleteColumnStatisticsForTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteColumnStatisticsForTable"
                   outputClass:[AWSGlueDeleteColumnStatisticsForTableResponse class]];
}

- (void)deleteColumnStatisticsForTable:(AWSGlueDeleteColumnStatisticsForTableRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteColumnStatisticsForTableResponse *response, NSError *error))completionHandler {
    [[self deleteColumnStatisticsForTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteColumnStatisticsForTableResponse *> * _Nonnull task) {
        AWSGlueDeleteColumnStatisticsForTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteConnectionResponse *> *)deleteConnection:(AWSGlueDeleteConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteConnection"
                   outputClass:[AWSGlueDeleteConnectionResponse class]];
}

- (void)deleteConnection:(AWSGlueDeleteConnectionRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteConnectionResponse *response, NSError *error))completionHandler {
    [[self deleteConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteConnectionResponse *> * _Nonnull task) {
        AWSGlueDeleteConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteCrawlerResponse *> *)deleteCrawler:(AWSGlueDeleteCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteCrawler"
                   outputClass:[AWSGlueDeleteCrawlerResponse class]];
}

- (void)deleteCrawler:(AWSGlueDeleteCrawlerRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteCrawlerResponse *response, NSError *error))completionHandler {
    [[self deleteCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteCrawlerResponse *> * _Nonnull task) {
        AWSGlueDeleteCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteDatabaseResponse *> *)deleteDatabase:(AWSGlueDeleteDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteDatabase"
                   outputClass:[AWSGlueDeleteDatabaseResponse class]];
}

- (void)deleteDatabase:(AWSGlueDeleteDatabaseRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteDatabaseResponse *response, NSError *error))completionHandler {
    [[self deleteDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteDatabaseResponse *> * _Nonnull task) {
        AWSGlueDeleteDatabaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteDevEndpointResponse *> *)deleteDevEndpoint:(AWSGlueDeleteDevEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteDevEndpoint"
                   outputClass:[AWSGlueDeleteDevEndpointResponse class]];
}

- (void)deleteDevEndpoint:(AWSGlueDeleteDevEndpointRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteDevEndpointResponse *response, NSError *error))completionHandler {
    [[self deleteDevEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteDevEndpointResponse *> * _Nonnull task) {
        AWSGlueDeleteDevEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteJobResponse *> *)deleteJob:(AWSGlueDeleteJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteJob"
                   outputClass:[AWSGlueDeleteJobResponse class]];
}

- (void)deleteJob:(AWSGlueDeleteJobRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteJobResponse *response, NSError *error))completionHandler {
    [[self deleteJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteJobResponse *> * _Nonnull task) {
        AWSGlueDeleteJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteMLTransformResponse *> *)deleteMLTransform:(AWSGlueDeleteMLTransformRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteMLTransform"
                   outputClass:[AWSGlueDeleteMLTransformResponse class]];
}

- (void)deleteMLTransform:(AWSGlueDeleteMLTransformRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteMLTransformResponse *response, NSError *error))completionHandler {
    [[self deleteMLTransform:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteMLTransformResponse *> * _Nonnull task) {
        AWSGlueDeleteMLTransformResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeletePartitionResponse *> *)deletePartition:(AWSGlueDeletePartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeletePartition"
                   outputClass:[AWSGlueDeletePartitionResponse class]];
}

- (void)deletePartition:(AWSGlueDeletePartitionRequest *)request
     completionHandler:(void (^)(AWSGlueDeletePartitionResponse *response, NSError *error))completionHandler {
    [[self deletePartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeletePartitionResponse *> * _Nonnull task) {
        AWSGlueDeletePartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteResourcePolicyResponse *> *)deleteResourcePolicy:(AWSGlueDeleteResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteResourcePolicy"
                   outputClass:[AWSGlueDeleteResourcePolicyResponse class]];
}

- (void)deleteResourcePolicy:(AWSGlueDeleteResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self deleteResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteResourcePolicyResponse *> * _Nonnull task) {
        AWSGlueDeleteResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteSecurityConfigurationResponse *> *)deleteSecurityConfiguration:(AWSGlueDeleteSecurityConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteSecurityConfiguration"
                   outputClass:[AWSGlueDeleteSecurityConfigurationResponse class]];
}

- (void)deleteSecurityConfiguration:(AWSGlueDeleteSecurityConfigurationRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteSecurityConfigurationResponse *response, NSError *error))completionHandler {
    [[self deleteSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteSecurityConfigurationResponse *> * _Nonnull task) {
        AWSGlueDeleteSecurityConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteTableResponse *> *)deleteTable:(AWSGlueDeleteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteTable"
                   outputClass:[AWSGlueDeleteTableResponse class]];
}

- (void)deleteTable:(AWSGlueDeleteTableRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteTableResponse *response, NSError *error))completionHandler {
    [[self deleteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteTableResponse *> * _Nonnull task) {
        AWSGlueDeleteTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteTableVersionResponse *> *)deleteTableVersion:(AWSGlueDeleteTableVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteTableVersion"
                   outputClass:[AWSGlueDeleteTableVersionResponse class]];
}

- (void)deleteTableVersion:(AWSGlueDeleteTableVersionRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteTableVersionResponse *response, NSError *error))completionHandler {
    [[self deleteTableVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteTableVersionResponse *> * _Nonnull task) {
        AWSGlueDeleteTableVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteTriggerResponse *> *)deleteTrigger:(AWSGlueDeleteTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteTrigger"
                   outputClass:[AWSGlueDeleteTriggerResponse class]];
}

- (void)deleteTrigger:(AWSGlueDeleteTriggerRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteTriggerResponse *response, NSError *error))completionHandler {
    [[self deleteTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteTriggerResponse *> * _Nonnull task) {
        AWSGlueDeleteTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteUserDefinedFunctionResponse *> *)deleteUserDefinedFunction:(AWSGlueDeleteUserDefinedFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteUserDefinedFunction"
                   outputClass:[AWSGlueDeleteUserDefinedFunctionResponse class]];
}

- (void)deleteUserDefinedFunction:(AWSGlueDeleteUserDefinedFunctionRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteUserDefinedFunctionResponse *response, NSError *error))completionHandler {
    [[self deleteUserDefinedFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteUserDefinedFunctionResponse *> * _Nonnull task) {
        AWSGlueDeleteUserDefinedFunctionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueDeleteWorkflowResponse *> *)deleteWorkflow:(AWSGlueDeleteWorkflowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteWorkflow"
                   outputClass:[AWSGlueDeleteWorkflowResponse class]];
}

- (void)deleteWorkflow:(AWSGlueDeleteWorkflowRequest *)request
     completionHandler:(void (^)(AWSGlueDeleteWorkflowResponse *response, NSError *error))completionHandler {
    [[self deleteWorkflow:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueDeleteWorkflowResponse *> * _Nonnull task) {
        AWSGlueDeleteWorkflowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetCatalogImportStatusResponse *> *)getCatalogImportStatus:(AWSGlueGetCatalogImportStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetCatalogImportStatus"
                   outputClass:[AWSGlueGetCatalogImportStatusResponse class]];
}

- (void)getCatalogImportStatus:(AWSGlueGetCatalogImportStatusRequest *)request
     completionHandler:(void (^)(AWSGlueGetCatalogImportStatusResponse *response, NSError *error))completionHandler {
    [[self getCatalogImportStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetCatalogImportStatusResponse *> * _Nonnull task) {
        AWSGlueGetCatalogImportStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetClassifierResponse *> *)getClassifier:(AWSGlueGetClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetClassifier"
                   outputClass:[AWSGlueGetClassifierResponse class]];
}

- (void)getClassifier:(AWSGlueGetClassifierRequest *)request
     completionHandler:(void (^)(AWSGlueGetClassifierResponse *response, NSError *error))completionHandler {
    [[self getClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetClassifierResponse *> * _Nonnull task) {
        AWSGlueGetClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetClassifiersResponse *> *)getClassifiers:(AWSGlueGetClassifiersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetClassifiers"
                   outputClass:[AWSGlueGetClassifiersResponse class]];
}

- (void)getClassifiers:(AWSGlueGetClassifiersRequest *)request
     completionHandler:(void (^)(AWSGlueGetClassifiersResponse *response, NSError *error))completionHandler {
    [[self getClassifiers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetClassifiersResponse *> * _Nonnull task) {
        AWSGlueGetClassifiersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetColumnStatisticsForPartitionResponse *> *)getColumnStatisticsForPartition:(AWSGlueGetColumnStatisticsForPartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetColumnStatisticsForPartition"
                   outputClass:[AWSGlueGetColumnStatisticsForPartitionResponse class]];
}

- (void)getColumnStatisticsForPartition:(AWSGlueGetColumnStatisticsForPartitionRequest *)request
     completionHandler:(void (^)(AWSGlueGetColumnStatisticsForPartitionResponse *response, NSError *error))completionHandler {
    [[self getColumnStatisticsForPartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetColumnStatisticsForPartitionResponse *> * _Nonnull task) {
        AWSGlueGetColumnStatisticsForPartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetColumnStatisticsForTableResponse *> *)getColumnStatisticsForTable:(AWSGlueGetColumnStatisticsForTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetColumnStatisticsForTable"
                   outputClass:[AWSGlueGetColumnStatisticsForTableResponse class]];
}

- (void)getColumnStatisticsForTable:(AWSGlueGetColumnStatisticsForTableRequest *)request
     completionHandler:(void (^)(AWSGlueGetColumnStatisticsForTableResponse *response, NSError *error))completionHandler {
    [[self getColumnStatisticsForTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetColumnStatisticsForTableResponse *> * _Nonnull task) {
        AWSGlueGetColumnStatisticsForTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetConnectionResponse *> *)getConnection:(AWSGlueGetConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetConnection"
                   outputClass:[AWSGlueGetConnectionResponse class]];
}

- (void)getConnection:(AWSGlueGetConnectionRequest *)request
     completionHandler:(void (^)(AWSGlueGetConnectionResponse *response, NSError *error))completionHandler {
    [[self getConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetConnectionResponse *> * _Nonnull task) {
        AWSGlueGetConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetConnectionsResponse *> *)getConnections:(AWSGlueGetConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetConnections"
                   outputClass:[AWSGlueGetConnectionsResponse class]];
}

- (void)getConnections:(AWSGlueGetConnectionsRequest *)request
     completionHandler:(void (^)(AWSGlueGetConnectionsResponse *response, NSError *error))completionHandler {
    [[self getConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetConnectionsResponse *> * _Nonnull task) {
        AWSGlueGetConnectionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetCrawlerResponse *> *)getCrawler:(AWSGlueGetCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetCrawler"
                   outputClass:[AWSGlueGetCrawlerResponse class]];
}

- (void)getCrawler:(AWSGlueGetCrawlerRequest *)request
     completionHandler:(void (^)(AWSGlueGetCrawlerResponse *response, NSError *error))completionHandler {
    [[self getCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetCrawlerResponse *> * _Nonnull task) {
        AWSGlueGetCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetCrawlerMetricsResponse *> *)getCrawlerMetrics:(AWSGlueGetCrawlerMetricsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetCrawlerMetrics"
                   outputClass:[AWSGlueGetCrawlerMetricsResponse class]];
}

- (void)getCrawlerMetrics:(AWSGlueGetCrawlerMetricsRequest *)request
     completionHandler:(void (^)(AWSGlueGetCrawlerMetricsResponse *response, NSError *error))completionHandler {
    [[self getCrawlerMetrics:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetCrawlerMetricsResponse *> * _Nonnull task) {
        AWSGlueGetCrawlerMetricsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetCrawlersResponse *> *)getCrawlers:(AWSGlueGetCrawlersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetCrawlers"
                   outputClass:[AWSGlueGetCrawlersResponse class]];
}

- (void)getCrawlers:(AWSGlueGetCrawlersRequest *)request
     completionHandler:(void (^)(AWSGlueGetCrawlersResponse *response, NSError *error))completionHandler {
    [[self getCrawlers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetCrawlersResponse *> * _Nonnull task) {
        AWSGlueGetCrawlersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetDataCatalogEncryptionSettingsResponse *> *)getDataCatalogEncryptionSettings:(AWSGlueGetDataCatalogEncryptionSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDataCatalogEncryptionSettings"
                   outputClass:[AWSGlueGetDataCatalogEncryptionSettingsResponse class]];
}

- (void)getDataCatalogEncryptionSettings:(AWSGlueGetDataCatalogEncryptionSettingsRequest *)request
     completionHandler:(void (^)(AWSGlueGetDataCatalogEncryptionSettingsResponse *response, NSError *error))completionHandler {
    [[self getDataCatalogEncryptionSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetDataCatalogEncryptionSettingsResponse *> * _Nonnull task) {
        AWSGlueGetDataCatalogEncryptionSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetDatabaseResponse *> *)getDatabase:(AWSGlueGetDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDatabase"
                   outputClass:[AWSGlueGetDatabaseResponse class]];
}

- (void)getDatabase:(AWSGlueGetDatabaseRequest *)request
     completionHandler:(void (^)(AWSGlueGetDatabaseResponse *response, NSError *error))completionHandler {
    [[self getDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetDatabaseResponse *> * _Nonnull task) {
        AWSGlueGetDatabaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetDatabasesResponse *> *)getDatabases:(AWSGlueGetDatabasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDatabases"
                   outputClass:[AWSGlueGetDatabasesResponse class]];
}

- (void)getDatabases:(AWSGlueGetDatabasesRequest *)request
     completionHandler:(void (^)(AWSGlueGetDatabasesResponse *response, NSError *error))completionHandler {
    [[self getDatabases:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetDatabasesResponse *> * _Nonnull task) {
        AWSGlueGetDatabasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetDataflowGraphResponse *> *)getDataflowGraph:(AWSGlueGetDataflowGraphRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDataflowGraph"
                   outputClass:[AWSGlueGetDataflowGraphResponse class]];
}

- (void)getDataflowGraph:(AWSGlueGetDataflowGraphRequest *)request
     completionHandler:(void (^)(AWSGlueGetDataflowGraphResponse *response, NSError *error))completionHandler {
    [[self getDataflowGraph:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetDataflowGraphResponse *> * _Nonnull task) {
        AWSGlueGetDataflowGraphResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetDevEndpointResponse *> *)getDevEndpoint:(AWSGlueGetDevEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDevEndpoint"
                   outputClass:[AWSGlueGetDevEndpointResponse class]];
}

- (void)getDevEndpoint:(AWSGlueGetDevEndpointRequest *)request
     completionHandler:(void (^)(AWSGlueGetDevEndpointResponse *response, NSError *error))completionHandler {
    [[self getDevEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetDevEndpointResponse *> * _Nonnull task) {
        AWSGlueGetDevEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetDevEndpointsResponse *> *)getDevEndpoints:(AWSGlueGetDevEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDevEndpoints"
                   outputClass:[AWSGlueGetDevEndpointsResponse class]];
}

- (void)getDevEndpoints:(AWSGlueGetDevEndpointsRequest *)request
     completionHandler:(void (^)(AWSGlueGetDevEndpointsResponse *response, NSError *error))completionHandler {
    [[self getDevEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetDevEndpointsResponse *> * _Nonnull task) {
        AWSGlueGetDevEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetJobResponse *> *)getJob:(AWSGlueGetJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetJob"
                   outputClass:[AWSGlueGetJobResponse class]];
}

- (void)getJob:(AWSGlueGetJobRequest *)request
     completionHandler:(void (^)(AWSGlueGetJobResponse *response, NSError *error))completionHandler {
    [[self getJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetJobResponse *> * _Nonnull task) {
        AWSGlueGetJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetJobBookmarkResponse *> *)getJobBookmark:(AWSGlueGetJobBookmarkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetJobBookmark"
                   outputClass:[AWSGlueGetJobBookmarkResponse class]];
}

- (void)getJobBookmark:(AWSGlueGetJobBookmarkRequest *)request
     completionHandler:(void (^)(AWSGlueGetJobBookmarkResponse *response, NSError *error))completionHandler {
    [[self getJobBookmark:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetJobBookmarkResponse *> * _Nonnull task) {
        AWSGlueGetJobBookmarkResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetJobRunResponse *> *)getJobRun:(AWSGlueGetJobRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetJobRun"
                   outputClass:[AWSGlueGetJobRunResponse class]];
}

- (void)getJobRun:(AWSGlueGetJobRunRequest *)request
     completionHandler:(void (^)(AWSGlueGetJobRunResponse *response, NSError *error))completionHandler {
    [[self getJobRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetJobRunResponse *> * _Nonnull task) {
        AWSGlueGetJobRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetJobRunsResponse *> *)getJobRuns:(AWSGlueGetJobRunsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetJobRuns"
                   outputClass:[AWSGlueGetJobRunsResponse class]];
}

- (void)getJobRuns:(AWSGlueGetJobRunsRequest *)request
     completionHandler:(void (^)(AWSGlueGetJobRunsResponse *response, NSError *error))completionHandler {
    [[self getJobRuns:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetJobRunsResponse *> * _Nonnull task) {
        AWSGlueGetJobRunsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetJobsResponse *> *)getJobs:(AWSGlueGetJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetJobs"
                   outputClass:[AWSGlueGetJobsResponse class]];
}

- (void)getJobs:(AWSGlueGetJobsRequest *)request
     completionHandler:(void (^)(AWSGlueGetJobsResponse *response, NSError *error))completionHandler {
    [[self getJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetJobsResponse *> * _Nonnull task) {
        AWSGlueGetJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetMLTaskRunResponse *> *)getMLTaskRun:(AWSGlueGetMLTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetMLTaskRun"
                   outputClass:[AWSGlueGetMLTaskRunResponse class]];
}

- (void)getMLTaskRun:(AWSGlueGetMLTaskRunRequest *)request
     completionHandler:(void (^)(AWSGlueGetMLTaskRunResponse *response, NSError *error))completionHandler {
    [[self getMLTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetMLTaskRunResponse *> * _Nonnull task) {
        AWSGlueGetMLTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetMLTaskRunsResponse *> *)getMLTaskRuns:(AWSGlueGetMLTaskRunsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetMLTaskRuns"
                   outputClass:[AWSGlueGetMLTaskRunsResponse class]];
}

- (void)getMLTaskRuns:(AWSGlueGetMLTaskRunsRequest *)request
     completionHandler:(void (^)(AWSGlueGetMLTaskRunsResponse *response, NSError *error))completionHandler {
    [[self getMLTaskRuns:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetMLTaskRunsResponse *> * _Nonnull task) {
        AWSGlueGetMLTaskRunsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetMLTransformResponse *> *)getMLTransform:(AWSGlueGetMLTransformRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetMLTransform"
                   outputClass:[AWSGlueGetMLTransformResponse class]];
}

- (void)getMLTransform:(AWSGlueGetMLTransformRequest *)request
     completionHandler:(void (^)(AWSGlueGetMLTransformResponse *response, NSError *error))completionHandler {
    [[self getMLTransform:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetMLTransformResponse *> * _Nonnull task) {
        AWSGlueGetMLTransformResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetMLTransformsResponse *> *)getMLTransforms:(AWSGlueGetMLTransformsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetMLTransforms"
                   outputClass:[AWSGlueGetMLTransformsResponse class]];
}

- (void)getMLTransforms:(AWSGlueGetMLTransformsRequest *)request
     completionHandler:(void (^)(AWSGlueGetMLTransformsResponse *response, NSError *error))completionHandler {
    [[self getMLTransforms:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetMLTransformsResponse *> * _Nonnull task) {
        AWSGlueGetMLTransformsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetMappingResponse *> *)getMapping:(AWSGlueGetMappingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetMapping"
                   outputClass:[AWSGlueGetMappingResponse class]];
}

- (void)getMapping:(AWSGlueGetMappingRequest *)request
     completionHandler:(void (^)(AWSGlueGetMappingResponse *response, NSError *error))completionHandler {
    [[self getMapping:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetMappingResponse *> * _Nonnull task) {
        AWSGlueGetMappingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetPartitionResponse *> *)getPartition:(AWSGlueGetPartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetPartition"
                   outputClass:[AWSGlueGetPartitionResponse class]];
}

- (void)getPartition:(AWSGlueGetPartitionRequest *)request
     completionHandler:(void (^)(AWSGlueGetPartitionResponse *response, NSError *error))completionHandler {
    [[self getPartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetPartitionResponse *> * _Nonnull task) {
        AWSGlueGetPartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetPartitionsResponse *> *)getPartitions:(AWSGlueGetPartitionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetPartitions"
                   outputClass:[AWSGlueGetPartitionsResponse class]];
}

- (void)getPartitions:(AWSGlueGetPartitionsRequest *)request
     completionHandler:(void (^)(AWSGlueGetPartitionsResponse *response, NSError *error))completionHandler {
    [[self getPartitions:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetPartitionsResponse *> * _Nonnull task) {
        AWSGlueGetPartitionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetPlanResponse *> *)getPlan:(AWSGlueGetPlanRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetPlan"
                   outputClass:[AWSGlueGetPlanResponse class]];
}

- (void)getPlan:(AWSGlueGetPlanRequest *)request
     completionHandler:(void (^)(AWSGlueGetPlanResponse *response, NSError *error))completionHandler {
    [[self getPlan:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetPlanResponse *> * _Nonnull task) {
        AWSGlueGetPlanResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetResourcePolicyResponse *> *)getResourcePolicy:(AWSGlueGetResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetResourcePolicy"
                   outputClass:[AWSGlueGetResourcePolicyResponse class]];
}

- (void)getResourcePolicy:(AWSGlueGetResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSGlueGetResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self getResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetResourcePolicyResponse *> * _Nonnull task) {
        AWSGlueGetResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetSecurityConfigurationResponse *> *)getSecurityConfiguration:(AWSGlueGetSecurityConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetSecurityConfiguration"
                   outputClass:[AWSGlueGetSecurityConfigurationResponse class]];
}

- (void)getSecurityConfiguration:(AWSGlueGetSecurityConfigurationRequest *)request
     completionHandler:(void (^)(AWSGlueGetSecurityConfigurationResponse *response, NSError *error))completionHandler {
    [[self getSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetSecurityConfigurationResponse *> * _Nonnull task) {
        AWSGlueGetSecurityConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetSecurityConfigurationsResponse *> *)getSecurityConfigurations:(AWSGlueGetSecurityConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetSecurityConfigurations"
                   outputClass:[AWSGlueGetSecurityConfigurationsResponse class]];
}

- (void)getSecurityConfigurations:(AWSGlueGetSecurityConfigurationsRequest *)request
     completionHandler:(void (^)(AWSGlueGetSecurityConfigurationsResponse *response, NSError *error))completionHandler {
    [[self getSecurityConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetSecurityConfigurationsResponse *> * _Nonnull task) {
        AWSGlueGetSecurityConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetTableResponse *> *)getTable:(AWSGlueGetTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTable"
                   outputClass:[AWSGlueGetTableResponse class]];
}

- (void)getTable:(AWSGlueGetTableRequest *)request
     completionHandler:(void (^)(AWSGlueGetTableResponse *response, NSError *error))completionHandler {
    [[self getTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetTableResponse *> * _Nonnull task) {
        AWSGlueGetTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetTableVersionResponse *> *)getTableVersion:(AWSGlueGetTableVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTableVersion"
                   outputClass:[AWSGlueGetTableVersionResponse class]];
}

- (void)getTableVersion:(AWSGlueGetTableVersionRequest *)request
     completionHandler:(void (^)(AWSGlueGetTableVersionResponse *response, NSError *error))completionHandler {
    [[self getTableVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetTableVersionResponse *> * _Nonnull task) {
        AWSGlueGetTableVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetTableVersionsResponse *> *)getTableVersions:(AWSGlueGetTableVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTableVersions"
                   outputClass:[AWSGlueGetTableVersionsResponse class]];
}

- (void)getTableVersions:(AWSGlueGetTableVersionsRequest *)request
     completionHandler:(void (^)(AWSGlueGetTableVersionsResponse *response, NSError *error))completionHandler {
    [[self getTableVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetTableVersionsResponse *> * _Nonnull task) {
        AWSGlueGetTableVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetTablesResponse *> *)getTables:(AWSGlueGetTablesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTables"
                   outputClass:[AWSGlueGetTablesResponse class]];
}

- (void)getTables:(AWSGlueGetTablesRequest *)request
     completionHandler:(void (^)(AWSGlueGetTablesResponse *response, NSError *error))completionHandler {
    [[self getTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetTablesResponse *> * _Nonnull task) {
        AWSGlueGetTablesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetTagsResponse *> *)getTags:(AWSGlueGetTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTags"
                   outputClass:[AWSGlueGetTagsResponse class]];
}

- (void)getTags:(AWSGlueGetTagsRequest *)request
     completionHandler:(void (^)(AWSGlueGetTagsResponse *response, NSError *error))completionHandler {
    [[self getTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetTagsResponse *> * _Nonnull task) {
        AWSGlueGetTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetTriggerResponse *> *)getTrigger:(AWSGlueGetTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTrigger"
                   outputClass:[AWSGlueGetTriggerResponse class]];
}

- (void)getTrigger:(AWSGlueGetTriggerRequest *)request
     completionHandler:(void (^)(AWSGlueGetTriggerResponse *response, NSError *error))completionHandler {
    [[self getTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetTriggerResponse *> * _Nonnull task) {
        AWSGlueGetTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetTriggersResponse *> *)getTriggers:(AWSGlueGetTriggersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTriggers"
                   outputClass:[AWSGlueGetTriggersResponse class]];
}

- (void)getTriggers:(AWSGlueGetTriggersRequest *)request
     completionHandler:(void (^)(AWSGlueGetTriggersResponse *response, NSError *error))completionHandler {
    [[self getTriggers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetTriggersResponse *> * _Nonnull task) {
        AWSGlueGetTriggersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetUserDefinedFunctionResponse *> *)getUserDefinedFunction:(AWSGlueGetUserDefinedFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetUserDefinedFunction"
                   outputClass:[AWSGlueGetUserDefinedFunctionResponse class]];
}

- (void)getUserDefinedFunction:(AWSGlueGetUserDefinedFunctionRequest *)request
     completionHandler:(void (^)(AWSGlueGetUserDefinedFunctionResponse *response, NSError *error))completionHandler {
    [[self getUserDefinedFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetUserDefinedFunctionResponse *> * _Nonnull task) {
        AWSGlueGetUserDefinedFunctionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetUserDefinedFunctionsResponse *> *)getUserDefinedFunctions:(AWSGlueGetUserDefinedFunctionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetUserDefinedFunctions"
                   outputClass:[AWSGlueGetUserDefinedFunctionsResponse class]];
}

- (void)getUserDefinedFunctions:(AWSGlueGetUserDefinedFunctionsRequest *)request
     completionHandler:(void (^)(AWSGlueGetUserDefinedFunctionsResponse *response, NSError *error))completionHandler {
    [[self getUserDefinedFunctions:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetUserDefinedFunctionsResponse *> * _Nonnull task) {
        AWSGlueGetUserDefinedFunctionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetWorkflowResponse *> *)getWorkflow:(AWSGlueGetWorkflowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetWorkflow"
                   outputClass:[AWSGlueGetWorkflowResponse class]];
}

- (void)getWorkflow:(AWSGlueGetWorkflowRequest *)request
     completionHandler:(void (^)(AWSGlueGetWorkflowResponse *response, NSError *error))completionHandler {
    [[self getWorkflow:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetWorkflowResponse *> * _Nonnull task) {
        AWSGlueGetWorkflowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetWorkflowRunResponse *> *)getWorkflowRun:(AWSGlueGetWorkflowRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetWorkflowRun"
                   outputClass:[AWSGlueGetWorkflowRunResponse class]];
}

- (void)getWorkflowRun:(AWSGlueGetWorkflowRunRequest *)request
     completionHandler:(void (^)(AWSGlueGetWorkflowRunResponse *response, NSError *error))completionHandler {
    [[self getWorkflowRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetWorkflowRunResponse *> * _Nonnull task) {
        AWSGlueGetWorkflowRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetWorkflowRunPropertiesResponse *> *)getWorkflowRunProperties:(AWSGlueGetWorkflowRunPropertiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetWorkflowRunProperties"
                   outputClass:[AWSGlueGetWorkflowRunPropertiesResponse class]];
}

- (void)getWorkflowRunProperties:(AWSGlueGetWorkflowRunPropertiesRequest *)request
     completionHandler:(void (^)(AWSGlueGetWorkflowRunPropertiesResponse *response, NSError *error))completionHandler {
    [[self getWorkflowRunProperties:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetWorkflowRunPropertiesResponse *> * _Nonnull task) {
        AWSGlueGetWorkflowRunPropertiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueGetWorkflowRunsResponse *> *)getWorkflowRuns:(AWSGlueGetWorkflowRunsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetWorkflowRuns"
                   outputClass:[AWSGlueGetWorkflowRunsResponse class]];
}

- (void)getWorkflowRuns:(AWSGlueGetWorkflowRunsRequest *)request
     completionHandler:(void (^)(AWSGlueGetWorkflowRunsResponse *response, NSError *error))completionHandler {
    [[self getWorkflowRuns:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueGetWorkflowRunsResponse *> * _Nonnull task) {
        AWSGlueGetWorkflowRunsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueImportCatalogToGlueResponse *> *)importCatalogToGlue:(AWSGlueImportCatalogToGlueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ImportCatalogToGlue"
                   outputClass:[AWSGlueImportCatalogToGlueResponse class]];
}

- (void)importCatalogToGlue:(AWSGlueImportCatalogToGlueRequest *)request
     completionHandler:(void (^)(AWSGlueImportCatalogToGlueResponse *response, NSError *error))completionHandler {
    [[self importCatalogToGlue:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueImportCatalogToGlueResponse *> * _Nonnull task) {
        AWSGlueImportCatalogToGlueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueListCrawlersResponse *> *)listCrawlers:(AWSGlueListCrawlersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListCrawlers"
                   outputClass:[AWSGlueListCrawlersResponse class]];
}

- (void)listCrawlers:(AWSGlueListCrawlersRequest *)request
     completionHandler:(void (^)(AWSGlueListCrawlersResponse *response, NSError *error))completionHandler {
    [[self listCrawlers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueListCrawlersResponse *> * _Nonnull task) {
        AWSGlueListCrawlersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueListDevEndpointsResponse *> *)listDevEndpoints:(AWSGlueListDevEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListDevEndpoints"
                   outputClass:[AWSGlueListDevEndpointsResponse class]];
}

- (void)listDevEndpoints:(AWSGlueListDevEndpointsRequest *)request
     completionHandler:(void (^)(AWSGlueListDevEndpointsResponse *response, NSError *error))completionHandler {
    [[self listDevEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueListDevEndpointsResponse *> * _Nonnull task) {
        AWSGlueListDevEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueListJobsResponse *> *)listJobs:(AWSGlueListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListJobs"
                   outputClass:[AWSGlueListJobsResponse class]];
}

- (void)listJobs:(AWSGlueListJobsRequest *)request
     completionHandler:(void (^)(AWSGlueListJobsResponse *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueListJobsResponse *> * _Nonnull task) {
        AWSGlueListJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueListMLTransformsResponse *> *)listMLTransforms:(AWSGlueListMLTransformsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListMLTransforms"
                   outputClass:[AWSGlueListMLTransformsResponse class]];
}

- (void)listMLTransforms:(AWSGlueListMLTransformsRequest *)request
     completionHandler:(void (^)(AWSGlueListMLTransformsResponse *response, NSError *error))completionHandler {
    [[self listMLTransforms:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueListMLTransformsResponse *> * _Nonnull task) {
        AWSGlueListMLTransformsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueListTriggersResponse *> *)listTriggers:(AWSGlueListTriggersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListTriggers"
                   outputClass:[AWSGlueListTriggersResponse class]];
}

- (void)listTriggers:(AWSGlueListTriggersRequest *)request
     completionHandler:(void (^)(AWSGlueListTriggersResponse *response, NSError *error))completionHandler {
    [[self listTriggers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueListTriggersResponse *> * _Nonnull task) {
        AWSGlueListTriggersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueListWorkflowsResponse *> *)listWorkflows:(AWSGlueListWorkflowsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListWorkflows"
                   outputClass:[AWSGlueListWorkflowsResponse class]];
}

- (void)listWorkflows:(AWSGlueListWorkflowsRequest *)request
     completionHandler:(void (^)(AWSGlueListWorkflowsResponse *response, NSError *error))completionHandler {
    [[self listWorkflows:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueListWorkflowsResponse *> * _Nonnull task) {
        AWSGlueListWorkflowsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGluePutDataCatalogEncryptionSettingsResponse *> *)putDataCatalogEncryptionSettings:(AWSGluePutDataCatalogEncryptionSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"PutDataCatalogEncryptionSettings"
                   outputClass:[AWSGluePutDataCatalogEncryptionSettingsResponse class]];
}

- (void)putDataCatalogEncryptionSettings:(AWSGluePutDataCatalogEncryptionSettingsRequest *)request
     completionHandler:(void (^)(AWSGluePutDataCatalogEncryptionSettingsResponse *response, NSError *error))completionHandler {
    [[self putDataCatalogEncryptionSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGluePutDataCatalogEncryptionSettingsResponse *> * _Nonnull task) {
        AWSGluePutDataCatalogEncryptionSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGluePutResourcePolicyResponse *> *)putResourcePolicy:(AWSGluePutResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"PutResourcePolicy"
                   outputClass:[AWSGluePutResourcePolicyResponse class]];
}

- (void)putResourcePolicy:(AWSGluePutResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSGluePutResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self putResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSGluePutResourcePolicyResponse *> * _Nonnull task) {
        AWSGluePutResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGluePutWorkflowRunPropertiesResponse *> *)putWorkflowRunProperties:(AWSGluePutWorkflowRunPropertiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"PutWorkflowRunProperties"
                   outputClass:[AWSGluePutWorkflowRunPropertiesResponse class]];
}

- (void)putWorkflowRunProperties:(AWSGluePutWorkflowRunPropertiesRequest *)request
     completionHandler:(void (^)(AWSGluePutWorkflowRunPropertiesResponse *response, NSError *error))completionHandler {
    [[self putWorkflowRunProperties:request] continueWithBlock:^id _Nullable(AWSTask<AWSGluePutWorkflowRunPropertiesResponse *> * _Nonnull task) {
        AWSGluePutWorkflowRunPropertiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueResetJobBookmarkResponse *> *)resetJobBookmark:(AWSGlueResetJobBookmarkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ResetJobBookmark"
                   outputClass:[AWSGlueResetJobBookmarkResponse class]];
}

- (void)resetJobBookmark:(AWSGlueResetJobBookmarkRequest *)request
     completionHandler:(void (^)(AWSGlueResetJobBookmarkResponse *response, NSError *error))completionHandler {
    [[self resetJobBookmark:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueResetJobBookmarkResponse *> * _Nonnull task) {
        AWSGlueResetJobBookmarkResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueSearchTablesResponse *> *)searchTables:(AWSGlueSearchTablesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"SearchTables"
                   outputClass:[AWSGlueSearchTablesResponse class]];
}

- (void)searchTables:(AWSGlueSearchTablesRequest *)request
     completionHandler:(void (^)(AWSGlueSearchTablesResponse *response, NSError *error))completionHandler {
    [[self searchTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueSearchTablesResponse *> * _Nonnull task) {
        AWSGlueSearchTablesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStartCrawlerResponse *> *)startCrawler:(AWSGlueStartCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartCrawler"
                   outputClass:[AWSGlueStartCrawlerResponse class]];
}

- (void)startCrawler:(AWSGlueStartCrawlerRequest *)request
     completionHandler:(void (^)(AWSGlueStartCrawlerResponse *response, NSError *error))completionHandler {
    [[self startCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStartCrawlerResponse *> * _Nonnull task) {
        AWSGlueStartCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStartCrawlerScheduleResponse *> *)startCrawlerSchedule:(AWSGlueStartCrawlerScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartCrawlerSchedule"
                   outputClass:[AWSGlueStartCrawlerScheduleResponse class]];
}

- (void)startCrawlerSchedule:(AWSGlueStartCrawlerScheduleRequest *)request
     completionHandler:(void (^)(AWSGlueStartCrawlerScheduleResponse *response, NSError *error))completionHandler {
    [[self startCrawlerSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStartCrawlerScheduleResponse *> * _Nonnull task) {
        AWSGlueStartCrawlerScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStartExportLabelsTaskRunResponse *> *)startExportLabelsTaskRun:(AWSGlueStartExportLabelsTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartExportLabelsTaskRun"
                   outputClass:[AWSGlueStartExportLabelsTaskRunResponse class]];
}

- (void)startExportLabelsTaskRun:(AWSGlueStartExportLabelsTaskRunRequest *)request
     completionHandler:(void (^)(AWSGlueStartExportLabelsTaskRunResponse *response, NSError *error))completionHandler {
    [[self startExportLabelsTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStartExportLabelsTaskRunResponse *> * _Nonnull task) {
        AWSGlueStartExportLabelsTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStartImportLabelsTaskRunResponse *> *)startImportLabelsTaskRun:(AWSGlueStartImportLabelsTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartImportLabelsTaskRun"
                   outputClass:[AWSGlueStartImportLabelsTaskRunResponse class]];
}

- (void)startImportLabelsTaskRun:(AWSGlueStartImportLabelsTaskRunRequest *)request
     completionHandler:(void (^)(AWSGlueStartImportLabelsTaskRunResponse *response, NSError *error))completionHandler {
    [[self startImportLabelsTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStartImportLabelsTaskRunResponse *> * _Nonnull task) {
        AWSGlueStartImportLabelsTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStartJobRunResponse *> *)startJobRun:(AWSGlueStartJobRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartJobRun"
                   outputClass:[AWSGlueStartJobRunResponse class]];
}

- (void)startJobRun:(AWSGlueStartJobRunRequest *)request
     completionHandler:(void (^)(AWSGlueStartJobRunResponse *response, NSError *error))completionHandler {
    [[self startJobRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStartJobRunResponse *> * _Nonnull task) {
        AWSGlueStartJobRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStartMLEvaluationTaskRunResponse *> *)startMLEvaluationTaskRun:(AWSGlueStartMLEvaluationTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartMLEvaluationTaskRun"
                   outputClass:[AWSGlueStartMLEvaluationTaskRunResponse class]];
}

- (void)startMLEvaluationTaskRun:(AWSGlueStartMLEvaluationTaskRunRequest *)request
     completionHandler:(void (^)(AWSGlueStartMLEvaluationTaskRunResponse *response, NSError *error))completionHandler {
    [[self startMLEvaluationTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStartMLEvaluationTaskRunResponse *> * _Nonnull task) {
        AWSGlueStartMLEvaluationTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStartMLLabelingSetGenerationTaskRunResponse *> *)startMLLabelingSetGenerationTaskRun:(AWSGlueStartMLLabelingSetGenerationTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartMLLabelingSetGenerationTaskRun"
                   outputClass:[AWSGlueStartMLLabelingSetGenerationTaskRunResponse class]];
}

- (void)startMLLabelingSetGenerationTaskRun:(AWSGlueStartMLLabelingSetGenerationTaskRunRequest *)request
     completionHandler:(void (^)(AWSGlueStartMLLabelingSetGenerationTaskRunResponse *response, NSError *error))completionHandler {
    [[self startMLLabelingSetGenerationTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStartMLLabelingSetGenerationTaskRunResponse *> * _Nonnull task) {
        AWSGlueStartMLLabelingSetGenerationTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStartTriggerResponse *> *)startTrigger:(AWSGlueStartTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartTrigger"
                   outputClass:[AWSGlueStartTriggerResponse class]];
}

- (void)startTrigger:(AWSGlueStartTriggerRequest *)request
     completionHandler:(void (^)(AWSGlueStartTriggerResponse *response, NSError *error))completionHandler {
    [[self startTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStartTriggerResponse *> * _Nonnull task) {
        AWSGlueStartTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStartWorkflowRunResponse *> *)startWorkflowRun:(AWSGlueStartWorkflowRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartWorkflowRun"
                   outputClass:[AWSGlueStartWorkflowRunResponse class]];
}

- (void)startWorkflowRun:(AWSGlueStartWorkflowRunRequest *)request
     completionHandler:(void (^)(AWSGlueStartWorkflowRunResponse *response, NSError *error))completionHandler {
    [[self startWorkflowRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStartWorkflowRunResponse *> * _Nonnull task) {
        AWSGlueStartWorkflowRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStopCrawlerResponse *> *)stopCrawler:(AWSGlueStopCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StopCrawler"
                   outputClass:[AWSGlueStopCrawlerResponse class]];
}

- (void)stopCrawler:(AWSGlueStopCrawlerRequest *)request
     completionHandler:(void (^)(AWSGlueStopCrawlerResponse *response, NSError *error))completionHandler {
    [[self stopCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStopCrawlerResponse *> * _Nonnull task) {
        AWSGlueStopCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStopCrawlerScheduleResponse *> *)stopCrawlerSchedule:(AWSGlueStopCrawlerScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StopCrawlerSchedule"
                   outputClass:[AWSGlueStopCrawlerScheduleResponse class]];
}

- (void)stopCrawlerSchedule:(AWSGlueStopCrawlerScheduleRequest *)request
     completionHandler:(void (^)(AWSGlueStopCrawlerScheduleResponse *response, NSError *error))completionHandler {
    [[self stopCrawlerSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStopCrawlerScheduleResponse *> * _Nonnull task) {
        AWSGlueStopCrawlerScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStopTriggerResponse *> *)stopTrigger:(AWSGlueStopTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StopTrigger"
                   outputClass:[AWSGlueStopTriggerResponse class]];
}

- (void)stopTrigger:(AWSGlueStopTriggerRequest *)request
     completionHandler:(void (^)(AWSGlueStopTriggerResponse *response, NSError *error))completionHandler {
    [[self stopTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStopTriggerResponse *> * _Nonnull task) {
        AWSGlueStopTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueStopWorkflowRunResponse *> *)stopWorkflowRun:(AWSGlueStopWorkflowRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StopWorkflowRun"
                   outputClass:[AWSGlueStopWorkflowRunResponse class]];
}

- (void)stopWorkflowRun:(AWSGlueStopWorkflowRunRequest *)request
     completionHandler:(void (^)(AWSGlueStopWorkflowRunResponse *response, NSError *error))completionHandler {
    [[self stopWorkflowRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueStopWorkflowRunResponse *> * _Nonnull task) {
        AWSGlueStopWorkflowRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueTagResourceResponse *> *)tagResource:(AWSGlueTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"TagResource"
                   outputClass:[AWSGlueTagResourceResponse class]];
}

- (void)tagResource:(AWSGlueTagResourceRequest *)request
     completionHandler:(void (^)(AWSGlueTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueTagResourceResponse *> * _Nonnull task) {
        AWSGlueTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUntagResourceResponse *> *)untagResource:(AWSGlueUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UntagResource"
                   outputClass:[AWSGlueUntagResourceResponse class]];
}

- (void)untagResource:(AWSGlueUntagResourceRequest *)request
     completionHandler:(void (^)(AWSGlueUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUntagResourceResponse *> * _Nonnull task) {
        AWSGlueUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateClassifierResponse *> *)updateClassifier:(AWSGlueUpdateClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateClassifier"
                   outputClass:[AWSGlueUpdateClassifierResponse class]];
}

- (void)updateClassifier:(AWSGlueUpdateClassifierRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateClassifierResponse *response, NSError *error))completionHandler {
    [[self updateClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateClassifierResponse *> * _Nonnull task) {
        AWSGlueUpdateClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateColumnStatisticsForPartitionResponse *> *)updateColumnStatisticsForPartition:(AWSGlueUpdateColumnStatisticsForPartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateColumnStatisticsForPartition"
                   outputClass:[AWSGlueUpdateColumnStatisticsForPartitionResponse class]];
}

- (void)updateColumnStatisticsForPartition:(AWSGlueUpdateColumnStatisticsForPartitionRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateColumnStatisticsForPartitionResponse *response, NSError *error))completionHandler {
    [[self updateColumnStatisticsForPartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateColumnStatisticsForPartitionResponse *> * _Nonnull task) {
        AWSGlueUpdateColumnStatisticsForPartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateColumnStatisticsForTableResponse *> *)updateColumnStatisticsForTable:(AWSGlueUpdateColumnStatisticsForTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateColumnStatisticsForTable"
                   outputClass:[AWSGlueUpdateColumnStatisticsForTableResponse class]];
}

- (void)updateColumnStatisticsForTable:(AWSGlueUpdateColumnStatisticsForTableRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateColumnStatisticsForTableResponse *response, NSError *error))completionHandler {
    [[self updateColumnStatisticsForTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateColumnStatisticsForTableResponse *> * _Nonnull task) {
        AWSGlueUpdateColumnStatisticsForTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateConnectionResponse *> *)updateConnection:(AWSGlueUpdateConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateConnection"
                   outputClass:[AWSGlueUpdateConnectionResponse class]];
}

- (void)updateConnection:(AWSGlueUpdateConnectionRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateConnectionResponse *response, NSError *error))completionHandler {
    [[self updateConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateConnectionResponse *> * _Nonnull task) {
        AWSGlueUpdateConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateCrawlerResponse *> *)updateCrawler:(AWSGlueUpdateCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateCrawler"
                   outputClass:[AWSGlueUpdateCrawlerResponse class]];
}

- (void)updateCrawler:(AWSGlueUpdateCrawlerRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateCrawlerResponse *response, NSError *error))completionHandler {
    [[self updateCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateCrawlerResponse *> * _Nonnull task) {
        AWSGlueUpdateCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateCrawlerScheduleResponse *> *)updateCrawlerSchedule:(AWSGlueUpdateCrawlerScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateCrawlerSchedule"
                   outputClass:[AWSGlueUpdateCrawlerScheduleResponse class]];
}

- (void)updateCrawlerSchedule:(AWSGlueUpdateCrawlerScheduleRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateCrawlerScheduleResponse *response, NSError *error))completionHandler {
    [[self updateCrawlerSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateCrawlerScheduleResponse *> * _Nonnull task) {
        AWSGlueUpdateCrawlerScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateDatabaseResponse *> *)updateDatabase:(AWSGlueUpdateDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateDatabase"
                   outputClass:[AWSGlueUpdateDatabaseResponse class]];
}

- (void)updateDatabase:(AWSGlueUpdateDatabaseRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateDatabaseResponse *response, NSError *error))completionHandler {
    [[self updateDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateDatabaseResponse *> * _Nonnull task) {
        AWSGlueUpdateDatabaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateDevEndpointResponse *> *)updateDevEndpoint:(AWSGlueUpdateDevEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateDevEndpoint"
                   outputClass:[AWSGlueUpdateDevEndpointResponse class]];
}

- (void)updateDevEndpoint:(AWSGlueUpdateDevEndpointRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateDevEndpointResponse *response, NSError *error))completionHandler {
    [[self updateDevEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateDevEndpointResponse *> * _Nonnull task) {
        AWSGlueUpdateDevEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateJobResponse *> *)updateJob:(AWSGlueUpdateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateJob"
                   outputClass:[AWSGlueUpdateJobResponse class]];
}

- (void)updateJob:(AWSGlueUpdateJobRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateJobResponse *response, NSError *error))completionHandler {
    [[self updateJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateJobResponse *> * _Nonnull task) {
        AWSGlueUpdateJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateMLTransformResponse *> *)updateMLTransform:(AWSGlueUpdateMLTransformRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateMLTransform"
                   outputClass:[AWSGlueUpdateMLTransformResponse class]];
}

- (void)updateMLTransform:(AWSGlueUpdateMLTransformRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateMLTransformResponse *response, NSError *error))completionHandler {
    [[self updateMLTransform:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateMLTransformResponse *> * _Nonnull task) {
        AWSGlueUpdateMLTransformResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdatePartitionResponse *> *)updatePartition:(AWSGlueUpdatePartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdatePartition"
                   outputClass:[AWSGlueUpdatePartitionResponse class]];
}

- (void)updatePartition:(AWSGlueUpdatePartitionRequest *)request
     completionHandler:(void (^)(AWSGlueUpdatePartitionResponse *response, NSError *error))completionHandler {
    [[self updatePartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdatePartitionResponse *> * _Nonnull task) {
        AWSGlueUpdatePartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateTableResponse *> *)updateTable:(AWSGlueUpdateTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateTable"
                   outputClass:[AWSGlueUpdateTableResponse class]];
}

- (void)updateTable:(AWSGlueUpdateTableRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateTableResponse *response, NSError *error))completionHandler {
    [[self updateTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateTableResponse *> * _Nonnull task) {
        AWSGlueUpdateTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateTriggerResponse *> *)updateTrigger:(AWSGlueUpdateTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateTrigger"
                   outputClass:[AWSGlueUpdateTriggerResponse class]];
}

- (void)updateTrigger:(AWSGlueUpdateTriggerRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateTriggerResponse *response, NSError *error))completionHandler {
    [[self updateTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateTriggerResponse *> * _Nonnull task) {
        AWSGlueUpdateTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateUserDefinedFunctionResponse *> *)updateUserDefinedFunction:(AWSGlueUpdateUserDefinedFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateUserDefinedFunction"
                   outputClass:[AWSGlueUpdateUserDefinedFunctionResponse class]];
}

- (void)updateUserDefinedFunction:(AWSGlueUpdateUserDefinedFunctionRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateUserDefinedFunctionResponse *response, NSError *error))completionHandler {
    [[self updateUserDefinedFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateUserDefinedFunctionResponse *> * _Nonnull task) {
        AWSGlueUpdateUserDefinedFunctionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGlueUpdateWorkflowResponse *> *)updateWorkflow:(AWSGlueUpdateWorkflowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateWorkflow"
                   outputClass:[AWSGlueUpdateWorkflowResponse class]];
}

- (void)updateWorkflow:(AWSGlueUpdateWorkflowRequest *)request
     completionHandler:(void (^)(AWSGlueUpdateWorkflowResponse *response, NSError *error))completionHandler {
    [[self updateWorkflow:request] continueWithBlock:^id _Nullable(AWSTask<AWSGlueUpdateWorkflowResponse *> * _Nonnull task) {
        AWSGlueUpdateWorkflowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
