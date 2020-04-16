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

#import "AWSglueService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSglueResources.h"

static NSString *const AWSInfoglue = @"glue";
NSString *const AWSglueSDKVersion = @"2.13.2";


@interface AWSglueResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSglueResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSglueErrorAccessDenied),
                            @"AlreadyExistsException" : @(AWSglueErrorAlreadyExists),
                            @"ConcurrentModificationException" : @(AWSglueErrorConcurrentModification),
                            @"ConcurrentRunsExceededException" : @(AWSglueErrorConcurrentRunsExceeded),
                            @"ConditionCheckFailureException" : @(AWSglueErrorConditionCheckFailure),
                            @"CrawlerNotRunningException" : @(AWSglueErrorCrawlerNotRunning),
                            @"CrawlerRunningException" : @(AWSglueErrorCrawlerRunning),
                            @"CrawlerStoppingException" : @(AWSglueErrorCrawlerStopping),
                            @"EntityNotFoundException" : @(AWSglueErrorEntityNotFound),
                            @"GlueEncryptionException" : @(AWSglueErrorGlueEncryption),
                            @"IdempotentParameterMismatchException" : @(AWSglueErrorIdempotentParameterMismatch),
                            @"InternalServiceException" : @(AWSglueErrorInternalService),
                            @"InvalidInputException" : @(AWSglueErrorInvalidInput),
                            @"MLTransformNotReadyException" : @(AWSglueErrorMLTransformNotReady),
                            @"NoScheduleException" : @(AWSglueErrorNoSchedule),
                            @"OperationTimeoutException" : @(AWSglueErrorOperationTimeout),
                            @"ResourceNumberLimitExceededException" : @(AWSglueErrorResourceNumberLimitExceeded),
                            @"SchedulerNotRunningException" : @(AWSglueErrorSchedulerNotRunning),
                            @"SchedulerRunningException" : @(AWSglueErrorSchedulerRunning),
                            @"SchedulerTransitioningException" : @(AWSglueErrorSchedulerTransitioning),
                            @"ValidationException" : @(AWSglueErrorValidation),
                            @"VersionMismatchException" : @(AWSglueErrorVersionMismatch),
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
	                *error = [NSError errorWithDomain:AWSglueErrorDomain
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
        *error = [NSError errorWithDomain:AWSglueErrorDomain
                                     code:AWSglueErrorUnknown
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

@interface AWSglueRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSglueRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSglue()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSglue

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSglueSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSglue versions need to match. Check your SDK installation. AWSCore: %@ AWSglue: %@", AWSiOSSDKVersion, AWSglueSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultglue {
    static AWSglue *_defaultglue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoglue];
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
        _defaultglue = [[AWSglue alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultglue;
}

+ (void)registerglueWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSglue alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)glueForKey:(NSString *)key {
    @synchronized(self) {
        AWSglue *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoglue
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSglue registerglueWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeglueForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultglue` or `+ glueForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceglue
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceglue];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSglueRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSglueResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSglueResponseSerializer alloc] initWithJSONDefinition:[[AWSglueResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSglueBatchCreatePartitionResponse *> *)batchCreatePartition:(AWSglueBatchCreatePartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchCreatePartition"
                   outputClass:[AWSglueBatchCreatePartitionResponse class]];
}

- (void)batchCreatePartition:(AWSglueBatchCreatePartitionRequest *)request
     completionHandler:(void (^)(AWSglueBatchCreatePartitionResponse *response, NSError *error))completionHandler {
    [[self batchCreatePartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchCreatePartitionResponse *> * _Nonnull task) {
        AWSglueBatchCreatePartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchDeleteConnectionResponse *> *)batchDeleteConnection:(AWSglueBatchDeleteConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchDeleteConnection"
                   outputClass:[AWSglueBatchDeleteConnectionResponse class]];
}

- (void)batchDeleteConnection:(AWSglueBatchDeleteConnectionRequest *)request
     completionHandler:(void (^)(AWSglueBatchDeleteConnectionResponse *response, NSError *error))completionHandler {
    [[self batchDeleteConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchDeleteConnectionResponse *> * _Nonnull task) {
        AWSglueBatchDeleteConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchDeletePartitionResponse *> *)batchDeletePartition:(AWSglueBatchDeletePartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchDeletePartition"
                   outputClass:[AWSglueBatchDeletePartitionResponse class]];
}

- (void)batchDeletePartition:(AWSglueBatchDeletePartitionRequest *)request
     completionHandler:(void (^)(AWSglueBatchDeletePartitionResponse *response, NSError *error))completionHandler {
    [[self batchDeletePartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchDeletePartitionResponse *> * _Nonnull task) {
        AWSglueBatchDeletePartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchDeleteTableResponse *> *)batchDeleteTable:(AWSglueBatchDeleteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchDeleteTable"
                   outputClass:[AWSglueBatchDeleteTableResponse class]];
}

- (void)batchDeleteTable:(AWSglueBatchDeleteTableRequest *)request
     completionHandler:(void (^)(AWSglueBatchDeleteTableResponse *response, NSError *error))completionHandler {
    [[self batchDeleteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchDeleteTableResponse *> * _Nonnull task) {
        AWSglueBatchDeleteTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchDeleteTableVersionResponse *> *)batchDeleteTableVersion:(AWSglueBatchDeleteTableVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchDeleteTableVersion"
                   outputClass:[AWSglueBatchDeleteTableVersionResponse class]];
}

- (void)batchDeleteTableVersion:(AWSglueBatchDeleteTableVersionRequest *)request
     completionHandler:(void (^)(AWSglueBatchDeleteTableVersionResponse *response, NSError *error))completionHandler {
    [[self batchDeleteTableVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchDeleteTableVersionResponse *> * _Nonnull task) {
        AWSglueBatchDeleteTableVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchGetCrawlersResponse *> *)batchGetCrawlers:(AWSglueBatchGetCrawlersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetCrawlers"
                   outputClass:[AWSglueBatchGetCrawlersResponse class]];
}

- (void)batchGetCrawlers:(AWSglueBatchGetCrawlersRequest *)request
     completionHandler:(void (^)(AWSglueBatchGetCrawlersResponse *response, NSError *error))completionHandler {
    [[self batchGetCrawlers:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchGetCrawlersResponse *> * _Nonnull task) {
        AWSglueBatchGetCrawlersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchGetDevEndpointsResponse *> *)batchGetDevEndpoints:(AWSglueBatchGetDevEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetDevEndpoints"
                   outputClass:[AWSglueBatchGetDevEndpointsResponse class]];
}

- (void)batchGetDevEndpoints:(AWSglueBatchGetDevEndpointsRequest *)request
     completionHandler:(void (^)(AWSglueBatchGetDevEndpointsResponse *response, NSError *error))completionHandler {
    [[self batchGetDevEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchGetDevEndpointsResponse *> * _Nonnull task) {
        AWSglueBatchGetDevEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchGetJobsResponse *> *)batchGetJobs:(AWSglueBatchGetJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetJobs"
                   outputClass:[AWSglueBatchGetJobsResponse class]];
}

- (void)batchGetJobs:(AWSglueBatchGetJobsRequest *)request
     completionHandler:(void (^)(AWSglueBatchGetJobsResponse *response, NSError *error))completionHandler {
    [[self batchGetJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchGetJobsResponse *> * _Nonnull task) {
        AWSglueBatchGetJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchGetPartitionResponse *> *)batchGetPartition:(AWSglueBatchGetPartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetPartition"
                   outputClass:[AWSglueBatchGetPartitionResponse class]];
}

- (void)batchGetPartition:(AWSglueBatchGetPartitionRequest *)request
     completionHandler:(void (^)(AWSglueBatchGetPartitionResponse *response, NSError *error))completionHandler {
    [[self batchGetPartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchGetPartitionResponse *> * _Nonnull task) {
        AWSglueBatchGetPartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchGetTriggersResponse *> *)batchGetTriggers:(AWSglueBatchGetTriggersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetTriggers"
                   outputClass:[AWSglueBatchGetTriggersResponse class]];
}

- (void)batchGetTriggers:(AWSglueBatchGetTriggersRequest *)request
     completionHandler:(void (^)(AWSglueBatchGetTriggersResponse *response, NSError *error))completionHandler {
    [[self batchGetTriggers:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchGetTriggersResponse *> * _Nonnull task) {
        AWSglueBatchGetTriggersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchGetWorkflowsResponse *> *)batchGetWorkflows:(AWSglueBatchGetWorkflowsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchGetWorkflows"
                   outputClass:[AWSglueBatchGetWorkflowsResponse class]];
}

- (void)batchGetWorkflows:(AWSglueBatchGetWorkflowsRequest *)request
     completionHandler:(void (^)(AWSglueBatchGetWorkflowsResponse *response, NSError *error))completionHandler {
    [[self batchGetWorkflows:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchGetWorkflowsResponse *> * _Nonnull task) {
        AWSglueBatchGetWorkflowsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueBatchStopJobRunResponse *> *)batchStopJobRun:(AWSglueBatchStopJobRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"BatchStopJobRun"
                   outputClass:[AWSglueBatchStopJobRunResponse class]];
}

- (void)batchStopJobRun:(AWSglueBatchStopJobRunRequest *)request
     completionHandler:(void (^)(AWSglueBatchStopJobRunResponse *response, NSError *error))completionHandler {
    [[self batchStopJobRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueBatchStopJobRunResponse *> * _Nonnull task) {
        AWSglueBatchStopJobRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCancelMLTaskRunResponse *> *)cancelMLTaskRun:(AWSglueCancelMLTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CancelMLTaskRun"
                   outputClass:[AWSglueCancelMLTaskRunResponse class]];
}

- (void)cancelMLTaskRun:(AWSglueCancelMLTaskRunRequest *)request
     completionHandler:(void (^)(AWSglueCancelMLTaskRunResponse *response, NSError *error))completionHandler {
    [[self cancelMLTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCancelMLTaskRunResponse *> * _Nonnull task) {
        AWSglueCancelMLTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateClassifierResponse *> *)createClassifier:(AWSglueCreateClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateClassifier"
                   outputClass:[AWSglueCreateClassifierResponse class]];
}

- (void)createClassifier:(AWSglueCreateClassifierRequest *)request
     completionHandler:(void (^)(AWSglueCreateClassifierResponse *response, NSError *error))completionHandler {
    [[self createClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateClassifierResponse *> * _Nonnull task) {
        AWSglueCreateClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateConnectionResponse *> *)createConnection:(AWSglueCreateConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateConnection"
                   outputClass:[AWSglueCreateConnectionResponse class]];
}

- (void)createConnection:(AWSglueCreateConnectionRequest *)request
     completionHandler:(void (^)(AWSglueCreateConnectionResponse *response, NSError *error))completionHandler {
    [[self createConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateConnectionResponse *> * _Nonnull task) {
        AWSglueCreateConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateCrawlerResponse *> *)createCrawler:(AWSglueCreateCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateCrawler"
                   outputClass:[AWSglueCreateCrawlerResponse class]];
}

- (void)createCrawler:(AWSglueCreateCrawlerRequest *)request
     completionHandler:(void (^)(AWSglueCreateCrawlerResponse *response, NSError *error))completionHandler {
    [[self createCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateCrawlerResponse *> * _Nonnull task) {
        AWSglueCreateCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateDatabaseResponse *> *)createDatabase:(AWSglueCreateDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateDatabase"
                   outputClass:[AWSglueCreateDatabaseResponse class]];
}

- (void)createDatabase:(AWSglueCreateDatabaseRequest *)request
     completionHandler:(void (^)(AWSglueCreateDatabaseResponse *response, NSError *error))completionHandler {
    [[self createDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateDatabaseResponse *> * _Nonnull task) {
        AWSglueCreateDatabaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateDevEndpointResponse *> *)createDevEndpoint:(AWSglueCreateDevEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateDevEndpoint"
                   outputClass:[AWSglueCreateDevEndpointResponse class]];
}

- (void)createDevEndpoint:(AWSglueCreateDevEndpointRequest *)request
     completionHandler:(void (^)(AWSglueCreateDevEndpointResponse *response, NSError *error))completionHandler {
    [[self createDevEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateDevEndpointResponse *> * _Nonnull task) {
        AWSglueCreateDevEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateJobResponse *> *)createJob:(AWSglueCreateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateJob"
                   outputClass:[AWSglueCreateJobResponse class]];
}

- (void)createJob:(AWSglueCreateJobRequest *)request
     completionHandler:(void (^)(AWSglueCreateJobResponse *response, NSError *error))completionHandler {
    [[self createJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateJobResponse *> * _Nonnull task) {
        AWSglueCreateJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateMLTransformResponse *> *)createMLTransform:(AWSglueCreateMLTransformRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateMLTransform"
                   outputClass:[AWSglueCreateMLTransformResponse class]];
}

- (void)createMLTransform:(AWSglueCreateMLTransformRequest *)request
     completionHandler:(void (^)(AWSglueCreateMLTransformResponse *response, NSError *error))completionHandler {
    [[self createMLTransform:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateMLTransformResponse *> * _Nonnull task) {
        AWSglueCreateMLTransformResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreatePartitionResponse *> *)createPartition:(AWSglueCreatePartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreatePartition"
                   outputClass:[AWSglueCreatePartitionResponse class]];
}

- (void)createPartition:(AWSglueCreatePartitionRequest *)request
     completionHandler:(void (^)(AWSglueCreatePartitionResponse *response, NSError *error))completionHandler {
    [[self createPartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreatePartitionResponse *> * _Nonnull task) {
        AWSglueCreatePartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateScriptResponse *> *)createScript:(AWSglueCreateScriptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateScript"
                   outputClass:[AWSglueCreateScriptResponse class]];
}

- (void)createScript:(AWSglueCreateScriptRequest *)request
     completionHandler:(void (^)(AWSglueCreateScriptResponse *response, NSError *error))completionHandler {
    [[self createScript:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateScriptResponse *> * _Nonnull task) {
        AWSglueCreateScriptResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateSecurityConfigurationResponse *> *)createSecurityConfiguration:(AWSglueCreateSecurityConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateSecurityConfiguration"
                   outputClass:[AWSglueCreateSecurityConfigurationResponse class]];
}

- (void)createSecurityConfiguration:(AWSglueCreateSecurityConfigurationRequest *)request
     completionHandler:(void (^)(AWSglueCreateSecurityConfigurationResponse *response, NSError *error))completionHandler {
    [[self createSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateSecurityConfigurationResponse *> * _Nonnull task) {
        AWSglueCreateSecurityConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateTableResponse *> *)createTable:(AWSglueCreateTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateTable"
                   outputClass:[AWSglueCreateTableResponse class]];
}

- (void)createTable:(AWSglueCreateTableRequest *)request
     completionHandler:(void (^)(AWSglueCreateTableResponse *response, NSError *error))completionHandler {
    [[self createTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateTableResponse *> * _Nonnull task) {
        AWSglueCreateTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateTriggerResponse *> *)createTrigger:(AWSglueCreateTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateTrigger"
                   outputClass:[AWSglueCreateTriggerResponse class]];
}

- (void)createTrigger:(AWSglueCreateTriggerRequest *)request
     completionHandler:(void (^)(AWSglueCreateTriggerResponse *response, NSError *error))completionHandler {
    [[self createTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateTriggerResponse *> * _Nonnull task) {
        AWSglueCreateTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateUserDefinedFunctionResponse *> *)createUserDefinedFunction:(AWSglueCreateUserDefinedFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateUserDefinedFunction"
                   outputClass:[AWSglueCreateUserDefinedFunctionResponse class]];
}

- (void)createUserDefinedFunction:(AWSglueCreateUserDefinedFunctionRequest *)request
     completionHandler:(void (^)(AWSglueCreateUserDefinedFunctionResponse *response, NSError *error))completionHandler {
    [[self createUserDefinedFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateUserDefinedFunctionResponse *> * _Nonnull task) {
        AWSglueCreateUserDefinedFunctionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueCreateWorkflowResponse *> *)createWorkflow:(AWSglueCreateWorkflowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"CreateWorkflow"
                   outputClass:[AWSglueCreateWorkflowResponse class]];
}

- (void)createWorkflow:(AWSglueCreateWorkflowRequest *)request
     completionHandler:(void (^)(AWSglueCreateWorkflowResponse *response, NSError *error))completionHandler {
    [[self createWorkflow:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueCreateWorkflowResponse *> * _Nonnull task) {
        AWSglueCreateWorkflowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteClassifierResponse *> *)deleteClassifier:(AWSglueDeleteClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteClassifier"
                   outputClass:[AWSglueDeleteClassifierResponse class]];
}

- (void)deleteClassifier:(AWSglueDeleteClassifierRequest *)request
     completionHandler:(void (^)(AWSglueDeleteClassifierResponse *response, NSError *error))completionHandler {
    [[self deleteClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteClassifierResponse *> * _Nonnull task) {
        AWSglueDeleteClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteConnectionResponse *> *)deleteConnection:(AWSglueDeleteConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteConnection"
                   outputClass:[AWSglueDeleteConnectionResponse class]];
}

- (void)deleteConnection:(AWSglueDeleteConnectionRequest *)request
     completionHandler:(void (^)(AWSglueDeleteConnectionResponse *response, NSError *error))completionHandler {
    [[self deleteConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteConnectionResponse *> * _Nonnull task) {
        AWSglueDeleteConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteCrawlerResponse *> *)deleteCrawler:(AWSglueDeleteCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteCrawler"
                   outputClass:[AWSglueDeleteCrawlerResponse class]];
}

- (void)deleteCrawler:(AWSglueDeleteCrawlerRequest *)request
     completionHandler:(void (^)(AWSglueDeleteCrawlerResponse *response, NSError *error))completionHandler {
    [[self deleteCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteCrawlerResponse *> * _Nonnull task) {
        AWSglueDeleteCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteDatabaseResponse *> *)deleteDatabase:(AWSglueDeleteDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteDatabase"
                   outputClass:[AWSglueDeleteDatabaseResponse class]];
}

- (void)deleteDatabase:(AWSglueDeleteDatabaseRequest *)request
     completionHandler:(void (^)(AWSglueDeleteDatabaseResponse *response, NSError *error))completionHandler {
    [[self deleteDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteDatabaseResponse *> * _Nonnull task) {
        AWSglueDeleteDatabaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteDevEndpointResponse *> *)deleteDevEndpoint:(AWSglueDeleteDevEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteDevEndpoint"
                   outputClass:[AWSglueDeleteDevEndpointResponse class]];
}

- (void)deleteDevEndpoint:(AWSglueDeleteDevEndpointRequest *)request
     completionHandler:(void (^)(AWSglueDeleteDevEndpointResponse *response, NSError *error))completionHandler {
    [[self deleteDevEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteDevEndpointResponse *> * _Nonnull task) {
        AWSglueDeleteDevEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteJobResponse *> *)deleteJob:(AWSglueDeleteJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteJob"
                   outputClass:[AWSglueDeleteJobResponse class]];
}

- (void)deleteJob:(AWSglueDeleteJobRequest *)request
     completionHandler:(void (^)(AWSglueDeleteJobResponse *response, NSError *error))completionHandler {
    [[self deleteJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteJobResponse *> * _Nonnull task) {
        AWSglueDeleteJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteMLTransformResponse *> *)deleteMLTransform:(AWSglueDeleteMLTransformRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteMLTransform"
                   outputClass:[AWSglueDeleteMLTransformResponse class]];
}

- (void)deleteMLTransform:(AWSglueDeleteMLTransformRequest *)request
     completionHandler:(void (^)(AWSglueDeleteMLTransformResponse *response, NSError *error))completionHandler {
    [[self deleteMLTransform:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteMLTransformResponse *> * _Nonnull task) {
        AWSglueDeleteMLTransformResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeletePartitionResponse *> *)deletePartition:(AWSglueDeletePartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeletePartition"
                   outputClass:[AWSglueDeletePartitionResponse class]];
}

- (void)deletePartition:(AWSglueDeletePartitionRequest *)request
     completionHandler:(void (^)(AWSglueDeletePartitionResponse *response, NSError *error))completionHandler {
    [[self deletePartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeletePartitionResponse *> * _Nonnull task) {
        AWSglueDeletePartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteResourcePolicyResponse *> *)deleteResourcePolicy:(AWSglueDeleteResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteResourcePolicy"
                   outputClass:[AWSglueDeleteResourcePolicyResponse class]];
}

- (void)deleteResourcePolicy:(AWSglueDeleteResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSglueDeleteResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self deleteResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteResourcePolicyResponse *> * _Nonnull task) {
        AWSglueDeleteResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteSecurityConfigurationResponse *> *)deleteSecurityConfiguration:(AWSglueDeleteSecurityConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteSecurityConfiguration"
                   outputClass:[AWSglueDeleteSecurityConfigurationResponse class]];
}

- (void)deleteSecurityConfiguration:(AWSglueDeleteSecurityConfigurationRequest *)request
     completionHandler:(void (^)(AWSglueDeleteSecurityConfigurationResponse *response, NSError *error))completionHandler {
    [[self deleteSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteSecurityConfigurationResponse *> * _Nonnull task) {
        AWSglueDeleteSecurityConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteTableResponse *> *)deleteTable:(AWSglueDeleteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteTable"
                   outputClass:[AWSglueDeleteTableResponse class]];
}

- (void)deleteTable:(AWSglueDeleteTableRequest *)request
     completionHandler:(void (^)(AWSglueDeleteTableResponse *response, NSError *error))completionHandler {
    [[self deleteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteTableResponse *> * _Nonnull task) {
        AWSglueDeleteTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteTableVersionResponse *> *)deleteTableVersion:(AWSglueDeleteTableVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteTableVersion"
                   outputClass:[AWSglueDeleteTableVersionResponse class]];
}

- (void)deleteTableVersion:(AWSglueDeleteTableVersionRequest *)request
     completionHandler:(void (^)(AWSglueDeleteTableVersionResponse *response, NSError *error))completionHandler {
    [[self deleteTableVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteTableVersionResponse *> * _Nonnull task) {
        AWSglueDeleteTableVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteTriggerResponse *> *)deleteTrigger:(AWSglueDeleteTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteTrigger"
                   outputClass:[AWSglueDeleteTriggerResponse class]];
}

- (void)deleteTrigger:(AWSglueDeleteTriggerRequest *)request
     completionHandler:(void (^)(AWSglueDeleteTriggerResponse *response, NSError *error))completionHandler {
    [[self deleteTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteTriggerResponse *> * _Nonnull task) {
        AWSglueDeleteTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteUserDefinedFunctionResponse *> *)deleteUserDefinedFunction:(AWSglueDeleteUserDefinedFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteUserDefinedFunction"
                   outputClass:[AWSglueDeleteUserDefinedFunctionResponse class]];
}

- (void)deleteUserDefinedFunction:(AWSglueDeleteUserDefinedFunctionRequest *)request
     completionHandler:(void (^)(AWSglueDeleteUserDefinedFunctionResponse *response, NSError *error))completionHandler {
    [[self deleteUserDefinedFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteUserDefinedFunctionResponse *> * _Nonnull task) {
        AWSglueDeleteUserDefinedFunctionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueDeleteWorkflowResponse *> *)deleteWorkflow:(AWSglueDeleteWorkflowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"DeleteWorkflow"
                   outputClass:[AWSglueDeleteWorkflowResponse class]];
}

- (void)deleteWorkflow:(AWSglueDeleteWorkflowRequest *)request
     completionHandler:(void (^)(AWSglueDeleteWorkflowResponse *response, NSError *error))completionHandler {
    [[self deleteWorkflow:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueDeleteWorkflowResponse *> * _Nonnull task) {
        AWSglueDeleteWorkflowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetCatalogImportStatusResponse *> *)getCatalogImportStatus:(AWSglueGetCatalogImportStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetCatalogImportStatus"
                   outputClass:[AWSglueGetCatalogImportStatusResponse class]];
}

- (void)getCatalogImportStatus:(AWSglueGetCatalogImportStatusRequest *)request
     completionHandler:(void (^)(AWSglueGetCatalogImportStatusResponse *response, NSError *error))completionHandler {
    [[self getCatalogImportStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetCatalogImportStatusResponse *> * _Nonnull task) {
        AWSglueGetCatalogImportStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetClassifierResponse *> *)getClassifier:(AWSglueGetClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetClassifier"
                   outputClass:[AWSglueGetClassifierResponse class]];
}

- (void)getClassifier:(AWSglueGetClassifierRequest *)request
     completionHandler:(void (^)(AWSglueGetClassifierResponse *response, NSError *error))completionHandler {
    [[self getClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetClassifierResponse *> * _Nonnull task) {
        AWSglueGetClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetClassifiersResponse *> *)getClassifiers:(AWSglueGetClassifiersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetClassifiers"
                   outputClass:[AWSglueGetClassifiersResponse class]];
}

- (void)getClassifiers:(AWSglueGetClassifiersRequest *)request
     completionHandler:(void (^)(AWSglueGetClassifiersResponse *response, NSError *error))completionHandler {
    [[self getClassifiers:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetClassifiersResponse *> * _Nonnull task) {
        AWSglueGetClassifiersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetConnectionResponse *> *)getConnection:(AWSglueGetConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetConnection"
                   outputClass:[AWSglueGetConnectionResponse class]];
}

- (void)getConnection:(AWSglueGetConnectionRequest *)request
     completionHandler:(void (^)(AWSglueGetConnectionResponse *response, NSError *error))completionHandler {
    [[self getConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetConnectionResponse *> * _Nonnull task) {
        AWSglueGetConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetConnectionsResponse *> *)getConnections:(AWSglueGetConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetConnections"
                   outputClass:[AWSglueGetConnectionsResponse class]];
}

- (void)getConnections:(AWSglueGetConnectionsRequest *)request
     completionHandler:(void (^)(AWSglueGetConnectionsResponse *response, NSError *error))completionHandler {
    [[self getConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetConnectionsResponse *> * _Nonnull task) {
        AWSglueGetConnectionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetCrawlerResponse *> *)getCrawler:(AWSglueGetCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetCrawler"
                   outputClass:[AWSglueGetCrawlerResponse class]];
}

- (void)getCrawler:(AWSglueGetCrawlerRequest *)request
     completionHandler:(void (^)(AWSglueGetCrawlerResponse *response, NSError *error))completionHandler {
    [[self getCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetCrawlerResponse *> * _Nonnull task) {
        AWSglueGetCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetCrawlerMetricsResponse *> *)getCrawlerMetrics:(AWSglueGetCrawlerMetricsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetCrawlerMetrics"
                   outputClass:[AWSglueGetCrawlerMetricsResponse class]];
}

- (void)getCrawlerMetrics:(AWSglueGetCrawlerMetricsRequest *)request
     completionHandler:(void (^)(AWSglueGetCrawlerMetricsResponse *response, NSError *error))completionHandler {
    [[self getCrawlerMetrics:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetCrawlerMetricsResponse *> * _Nonnull task) {
        AWSglueGetCrawlerMetricsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetCrawlersResponse *> *)getCrawlers:(AWSglueGetCrawlersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetCrawlers"
                   outputClass:[AWSglueGetCrawlersResponse class]];
}

- (void)getCrawlers:(AWSglueGetCrawlersRequest *)request
     completionHandler:(void (^)(AWSglueGetCrawlersResponse *response, NSError *error))completionHandler {
    [[self getCrawlers:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetCrawlersResponse *> * _Nonnull task) {
        AWSglueGetCrawlersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetDataCatalogEncryptionSettingsResponse *> *)getDataCatalogEncryptionSettings:(AWSglueGetDataCatalogEncryptionSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDataCatalogEncryptionSettings"
                   outputClass:[AWSglueGetDataCatalogEncryptionSettingsResponse class]];
}

- (void)getDataCatalogEncryptionSettings:(AWSglueGetDataCatalogEncryptionSettingsRequest *)request
     completionHandler:(void (^)(AWSglueGetDataCatalogEncryptionSettingsResponse *response, NSError *error))completionHandler {
    [[self getDataCatalogEncryptionSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetDataCatalogEncryptionSettingsResponse *> * _Nonnull task) {
        AWSglueGetDataCatalogEncryptionSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetDatabaseResponse *> *)getDatabase:(AWSglueGetDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDatabase"
                   outputClass:[AWSglueGetDatabaseResponse class]];
}

- (void)getDatabase:(AWSglueGetDatabaseRequest *)request
     completionHandler:(void (^)(AWSglueGetDatabaseResponse *response, NSError *error))completionHandler {
    [[self getDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetDatabaseResponse *> * _Nonnull task) {
        AWSglueGetDatabaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetDatabasesResponse *> *)getDatabases:(AWSglueGetDatabasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDatabases"
                   outputClass:[AWSglueGetDatabasesResponse class]];
}

- (void)getDatabases:(AWSglueGetDatabasesRequest *)request
     completionHandler:(void (^)(AWSglueGetDatabasesResponse *response, NSError *error))completionHandler {
    [[self getDatabases:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetDatabasesResponse *> * _Nonnull task) {
        AWSglueGetDatabasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetDataflowGraphResponse *> *)getDataflowGraph:(AWSglueGetDataflowGraphRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDataflowGraph"
                   outputClass:[AWSglueGetDataflowGraphResponse class]];
}

- (void)getDataflowGraph:(AWSglueGetDataflowGraphRequest *)request
     completionHandler:(void (^)(AWSglueGetDataflowGraphResponse *response, NSError *error))completionHandler {
    [[self getDataflowGraph:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetDataflowGraphResponse *> * _Nonnull task) {
        AWSglueGetDataflowGraphResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetDevEndpointResponse *> *)getDevEndpoint:(AWSglueGetDevEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDevEndpoint"
                   outputClass:[AWSglueGetDevEndpointResponse class]];
}

- (void)getDevEndpoint:(AWSglueGetDevEndpointRequest *)request
     completionHandler:(void (^)(AWSglueGetDevEndpointResponse *response, NSError *error))completionHandler {
    [[self getDevEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetDevEndpointResponse *> * _Nonnull task) {
        AWSglueGetDevEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetDevEndpointsResponse *> *)getDevEndpoints:(AWSglueGetDevEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetDevEndpoints"
                   outputClass:[AWSglueGetDevEndpointsResponse class]];
}

- (void)getDevEndpoints:(AWSglueGetDevEndpointsRequest *)request
     completionHandler:(void (^)(AWSglueGetDevEndpointsResponse *response, NSError *error))completionHandler {
    [[self getDevEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetDevEndpointsResponse *> * _Nonnull task) {
        AWSglueGetDevEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetJobResponse *> *)getJob:(AWSglueGetJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetJob"
                   outputClass:[AWSglueGetJobResponse class]];
}

- (void)getJob:(AWSglueGetJobRequest *)request
     completionHandler:(void (^)(AWSglueGetJobResponse *response, NSError *error))completionHandler {
    [[self getJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetJobResponse *> * _Nonnull task) {
        AWSglueGetJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetJobBookmarkResponse *> *)getJobBookmark:(AWSglueGetJobBookmarkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetJobBookmark"
                   outputClass:[AWSglueGetJobBookmarkResponse class]];
}

- (void)getJobBookmark:(AWSglueGetJobBookmarkRequest *)request
     completionHandler:(void (^)(AWSglueGetJobBookmarkResponse *response, NSError *error))completionHandler {
    [[self getJobBookmark:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetJobBookmarkResponse *> * _Nonnull task) {
        AWSglueGetJobBookmarkResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetJobRunResponse *> *)getJobRun:(AWSglueGetJobRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetJobRun"
                   outputClass:[AWSglueGetJobRunResponse class]];
}

- (void)getJobRun:(AWSglueGetJobRunRequest *)request
     completionHandler:(void (^)(AWSglueGetJobRunResponse *response, NSError *error))completionHandler {
    [[self getJobRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetJobRunResponse *> * _Nonnull task) {
        AWSglueGetJobRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetJobRunsResponse *> *)getJobRuns:(AWSglueGetJobRunsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetJobRuns"
                   outputClass:[AWSglueGetJobRunsResponse class]];
}

- (void)getJobRuns:(AWSglueGetJobRunsRequest *)request
     completionHandler:(void (^)(AWSglueGetJobRunsResponse *response, NSError *error))completionHandler {
    [[self getJobRuns:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetJobRunsResponse *> * _Nonnull task) {
        AWSglueGetJobRunsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetJobsResponse *> *)getJobs:(AWSglueGetJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetJobs"
                   outputClass:[AWSglueGetJobsResponse class]];
}

- (void)getJobs:(AWSglueGetJobsRequest *)request
     completionHandler:(void (^)(AWSglueGetJobsResponse *response, NSError *error))completionHandler {
    [[self getJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetJobsResponse *> * _Nonnull task) {
        AWSglueGetJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetMLTaskRunResponse *> *)getMLTaskRun:(AWSglueGetMLTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetMLTaskRun"
                   outputClass:[AWSglueGetMLTaskRunResponse class]];
}

- (void)getMLTaskRun:(AWSglueGetMLTaskRunRequest *)request
     completionHandler:(void (^)(AWSglueGetMLTaskRunResponse *response, NSError *error))completionHandler {
    [[self getMLTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetMLTaskRunResponse *> * _Nonnull task) {
        AWSglueGetMLTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetMLTaskRunsResponse *> *)getMLTaskRuns:(AWSglueGetMLTaskRunsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetMLTaskRuns"
                   outputClass:[AWSglueGetMLTaskRunsResponse class]];
}

- (void)getMLTaskRuns:(AWSglueGetMLTaskRunsRequest *)request
     completionHandler:(void (^)(AWSglueGetMLTaskRunsResponse *response, NSError *error))completionHandler {
    [[self getMLTaskRuns:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetMLTaskRunsResponse *> * _Nonnull task) {
        AWSglueGetMLTaskRunsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetMLTransformResponse *> *)getMLTransform:(AWSglueGetMLTransformRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetMLTransform"
                   outputClass:[AWSglueGetMLTransformResponse class]];
}

- (void)getMLTransform:(AWSglueGetMLTransformRequest *)request
     completionHandler:(void (^)(AWSglueGetMLTransformResponse *response, NSError *error))completionHandler {
    [[self getMLTransform:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetMLTransformResponse *> * _Nonnull task) {
        AWSglueGetMLTransformResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetMLTransformsResponse *> *)getMLTransforms:(AWSglueGetMLTransformsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetMLTransforms"
                   outputClass:[AWSglueGetMLTransformsResponse class]];
}

- (void)getMLTransforms:(AWSglueGetMLTransformsRequest *)request
     completionHandler:(void (^)(AWSglueGetMLTransformsResponse *response, NSError *error))completionHandler {
    [[self getMLTransforms:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetMLTransformsResponse *> * _Nonnull task) {
        AWSglueGetMLTransformsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetMappingResponse *> *)getMapping:(AWSglueGetMappingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetMapping"
                   outputClass:[AWSglueGetMappingResponse class]];
}

- (void)getMapping:(AWSglueGetMappingRequest *)request
     completionHandler:(void (^)(AWSglueGetMappingResponse *response, NSError *error))completionHandler {
    [[self getMapping:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetMappingResponse *> * _Nonnull task) {
        AWSglueGetMappingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetPartitionResponse *> *)getPartition:(AWSglueGetPartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetPartition"
                   outputClass:[AWSglueGetPartitionResponse class]];
}

- (void)getPartition:(AWSglueGetPartitionRequest *)request
     completionHandler:(void (^)(AWSglueGetPartitionResponse *response, NSError *error))completionHandler {
    [[self getPartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetPartitionResponse *> * _Nonnull task) {
        AWSglueGetPartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetPartitionsResponse *> *)getPartitions:(AWSglueGetPartitionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetPartitions"
                   outputClass:[AWSglueGetPartitionsResponse class]];
}

- (void)getPartitions:(AWSglueGetPartitionsRequest *)request
     completionHandler:(void (^)(AWSglueGetPartitionsResponse *response, NSError *error))completionHandler {
    [[self getPartitions:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetPartitionsResponse *> * _Nonnull task) {
        AWSglueGetPartitionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetPlanResponse *> *)getPlan:(AWSglueGetPlanRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetPlan"
                   outputClass:[AWSglueGetPlanResponse class]];
}

- (void)getPlan:(AWSglueGetPlanRequest *)request
     completionHandler:(void (^)(AWSglueGetPlanResponse *response, NSError *error))completionHandler {
    [[self getPlan:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetPlanResponse *> * _Nonnull task) {
        AWSglueGetPlanResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetResourcePolicyResponse *> *)getResourcePolicy:(AWSglueGetResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetResourcePolicy"
                   outputClass:[AWSglueGetResourcePolicyResponse class]];
}

- (void)getResourcePolicy:(AWSglueGetResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSglueGetResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self getResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetResourcePolicyResponse *> * _Nonnull task) {
        AWSglueGetResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetSecurityConfigurationResponse *> *)getSecurityConfiguration:(AWSglueGetSecurityConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetSecurityConfiguration"
                   outputClass:[AWSglueGetSecurityConfigurationResponse class]];
}

- (void)getSecurityConfiguration:(AWSglueGetSecurityConfigurationRequest *)request
     completionHandler:(void (^)(AWSglueGetSecurityConfigurationResponse *response, NSError *error))completionHandler {
    [[self getSecurityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetSecurityConfigurationResponse *> * _Nonnull task) {
        AWSglueGetSecurityConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetSecurityConfigurationsResponse *> *)getSecurityConfigurations:(AWSglueGetSecurityConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetSecurityConfigurations"
                   outputClass:[AWSglueGetSecurityConfigurationsResponse class]];
}

- (void)getSecurityConfigurations:(AWSglueGetSecurityConfigurationsRequest *)request
     completionHandler:(void (^)(AWSglueGetSecurityConfigurationsResponse *response, NSError *error))completionHandler {
    [[self getSecurityConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetSecurityConfigurationsResponse *> * _Nonnull task) {
        AWSglueGetSecurityConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetTableResponse *> *)getTable:(AWSglueGetTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTable"
                   outputClass:[AWSglueGetTableResponse class]];
}

- (void)getTable:(AWSglueGetTableRequest *)request
     completionHandler:(void (^)(AWSglueGetTableResponse *response, NSError *error))completionHandler {
    [[self getTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetTableResponse *> * _Nonnull task) {
        AWSglueGetTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetTableVersionResponse *> *)getTableVersion:(AWSglueGetTableVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTableVersion"
                   outputClass:[AWSglueGetTableVersionResponse class]];
}

- (void)getTableVersion:(AWSglueGetTableVersionRequest *)request
     completionHandler:(void (^)(AWSglueGetTableVersionResponse *response, NSError *error))completionHandler {
    [[self getTableVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetTableVersionResponse *> * _Nonnull task) {
        AWSglueGetTableVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetTableVersionsResponse *> *)getTableVersions:(AWSglueGetTableVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTableVersions"
                   outputClass:[AWSglueGetTableVersionsResponse class]];
}

- (void)getTableVersions:(AWSglueGetTableVersionsRequest *)request
     completionHandler:(void (^)(AWSglueGetTableVersionsResponse *response, NSError *error))completionHandler {
    [[self getTableVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetTableVersionsResponse *> * _Nonnull task) {
        AWSglueGetTableVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetTablesResponse *> *)getTables:(AWSglueGetTablesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTables"
                   outputClass:[AWSglueGetTablesResponse class]];
}

- (void)getTables:(AWSglueGetTablesRequest *)request
     completionHandler:(void (^)(AWSglueGetTablesResponse *response, NSError *error))completionHandler {
    [[self getTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetTablesResponse *> * _Nonnull task) {
        AWSglueGetTablesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetTagsResponse *> *)getTags:(AWSglueGetTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTags"
                   outputClass:[AWSglueGetTagsResponse class]];
}

- (void)getTags:(AWSglueGetTagsRequest *)request
     completionHandler:(void (^)(AWSglueGetTagsResponse *response, NSError *error))completionHandler {
    [[self getTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetTagsResponse *> * _Nonnull task) {
        AWSglueGetTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetTriggerResponse *> *)getTrigger:(AWSglueGetTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTrigger"
                   outputClass:[AWSglueGetTriggerResponse class]];
}

- (void)getTrigger:(AWSglueGetTriggerRequest *)request
     completionHandler:(void (^)(AWSglueGetTriggerResponse *response, NSError *error))completionHandler {
    [[self getTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetTriggerResponse *> * _Nonnull task) {
        AWSglueGetTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetTriggersResponse *> *)getTriggers:(AWSglueGetTriggersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetTriggers"
                   outputClass:[AWSglueGetTriggersResponse class]];
}

- (void)getTriggers:(AWSglueGetTriggersRequest *)request
     completionHandler:(void (^)(AWSglueGetTriggersResponse *response, NSError *error))completionHandler {
    [[self getTriggers:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetTriggersResponse *> * _Nonnull task) {
        AWSglueGetTriggersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetUserDefinedFunctionResponse *> *)getUserDefinedFunction:(AWSglueGetUserDefinedFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetUserDefinedFunction"
                   outputClass:[AWSglueGetUserDefinedFunctionResponse class]];
}

- (void)getUserDefinedFunction:(AWSglueGetUserDefinedFunctionRequest *)request
     completionHandler:(void (^)(AWSglueGetUserDefinedFunctionResponse *response, NSError *error))completionHandler {
    [[self getUserDefinedFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetUserDefinedFunctionResponse *> * _Nonnull task) {
        AWSglueGetUserDefinedFunctionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetUserDefinedFunctionsResponse *> *)getUserDefinedFunctions:(AWSglueGetUserDefinedFunctionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetUserDefinedFunctions"
                   outputClass:[AWSglueGetUserDefinedFunctionsResponse class]];
}

- (void)getUserDefinedFunctions:(AWSglueGetUserDefinedFunctionsRequest *)request
     completionHandler:(void (^)(AWSglueGetUserDefinedFunctionsResponse *response, NSError *error))completionHandler {
    [[self getUserDefinedFunctions:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetUserDefinedFunctionsResponse *> * _Nonnull task) {
        AWSglueGetUserDefinedFunctionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetWorkflowResponse *> *)getWorkflow:(AWSglueGetWorkflowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetWorkflow"
                   outputClass:[AWSglueGetWorkflowResponse class]];
}

- (void)getWorkflow:(AWSglueGetWorkflowRequest *)request
     completionHandler:(void (^)(AWSglueGetWorkflowResponse *response, NSError *error))completionHandler {
    [[self getWorkflow:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetWorkflowResponse *> * _Nonnull task) {
        AWSglueGetWorkflowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetWorkflowRunResponse *> *)getWorkflowRun:(AWSglueGetWorkflowRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetWorkflowRun"
                   outputClass:[AWSglueGetWorkflowRunResponse class]];
}

- (void)getWorkflowRun:(AWSglueGetWorkflowRunRequest *)request
     completionHandler:(void (^)(AWSglueGetWorkflowRunResponse *response, NSError *error))completionHandler {
    [[self getWorkflowRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetWorkflowRunResponse *> * _Nonnull task) {
        AWSglueGetWorkflowRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetWorkflowRunPropertiesResponse *> *)getWorkflowRunProperties:(AWSglueGetWorkflowRunPropertiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetWorkflowRunProperties"
                   outputClass:[AWSglueGetWorkflowRunPropertiesResponse class]];
}

- (void)getWorkflowRunProperties:(AWSglueGetWorkflowRunPropertiesRequest *)request
     completionHandler:(void (^)(AWSglueGetWorkflowRunPropertiesResponse *response, NSError *error))completionHandler {
    [[self getWorkflowRunProperties:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetWorkflowRunPropertiesResponse *> * _Nonnull task) {
        AWSglueGetWorkflowRunPropertiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueGetWorkflowRunsResponse *> *)getWorkflowRuns:(AWSglueGetWorkflowRunsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"GetWorkflowRuns"
                   outputClass:[AWSglueGetWorkflowRunsResponse class]];
}

- (void)getWorkflowRuns:(AWSglueGetWorkflowRunsRequest *)request
     completionHandler:(void (^)(AWSglueGetWorkflowRunsResponse *response, NSError *error))completionHandler {
    [[self getWorkflowRuns:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueGetWorkflowRunsResponse *> * _Nonnull task) {
        AWSglueGetWorkflowRunsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueImportCatalogToGlueResponse *> *)importCatalogToGlue:(AWSglueImportCatalogToGlueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ImportCatalogToGlue"
                   outputClass:[AWSglueImportCatalogToGlueResponse class]];
}

- (void)importCatalogToGlue:(AWSglueImportCatalogToGlueRequest *)request
     completionHandler:(void (^)(AWSglueImportCatalogToGlueResponse *response, NSError *error))completionHandler {
    [[self importCatalogToGlue:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueImportCatalogToGlueResponse *> * _Nonnull task) {
        AWSglueImportCatalogToGlueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueListCrawlersResponse *> *)listCrawlers:(AWSglueListCrawlersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListCrawlers"
                   outputClass:[AWSglueListCrawlersResponse class]];
}

- (void)listCrawlers:(AWSglueListCrawlersRequest *)request
     completionHandler:(void (^)(AWSglueListCrawlersResponse *response, NSError *error))completionHandler {
    [[self listCrawlers:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueListCrawlersResponse *> * _Nonnull task) {
        AWSglueListCrawlersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueListDevEndpointsResponse *> *)listDevEndpoints:(AWSglueListDevEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListDevEndpoints"
                   outputClass:[AWSglueListDevEndpointsResponse class]];
}

- (void)listDevEndpoints:(AWSglueListDevEndpointsRequest *)request
     completionHandler:(void (^)(AWSglueListDevEndpointsResponse *response, NSError *error))completionHandler {
    [[self listDevEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueListDevEndpointsResponse *> * _Nonnull task) {
        AWSglueListDevEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueListJobsResponse *> *)listJobs:(AWSglueListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListJobs"
                   outputClass:[AWSglueListJobsResponse class]];
}

- (void)listJobs:(AWSglueListJobsRequest *)request
     completionHandler:(void (^)(AWSglueListJobsResponse *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueListJobsResponse *> * _Nonnull task) {
        AWSglueListJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueListMLTransformsResponse *> *)listMLTransforms:(AWSglueListMLTransformsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListMLTransforms"
                   outputClass:[AWSglueListMLTransformsResponse class]];
}

- (void)listMLTransforms:(AWSglueListMLTransformsRequest *)request
     completionHandler:(void (^)(AWSglueListMLTransformsResponse *response, NSError *error))completionHandler {
    [[self listMLTransforms:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueListMLTransformsResponse *> * _Nonnull task) {
        AWSglueListMLTransformsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueListTriggersResponse *> *)listTriggers:(AWSglueListTriggersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListTriggers"
                   outputClass:[AWSglueListTriggersResponse class]];
}

- (void)listTriggers:(AWSglueListTriggersRequest *)request
     completionHandler:(void (^)(AWSglueListTriggersResponse *response, NSError *error))completionHandler {
    [[self listTriggers:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueListTriggersResponse *> * _Nonnull task) {
        AWSglueListTriggersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueListWorkflowsResponse *> *)listWorkflows:(AWSglueListWorkflowsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ListWorkflows"
                   outputClass:[AWSglueListWorkflowsResponse class]];
}

- (void)listWorkflows:(AWSglueListWorkflowsRequest *)request
     completionHandler:(void (^)(AWSglueListWorkflowsResponse *response, NSError *error))completionHandler {
    [[self listWorkflows:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueListWorkflowsResponse *> * _Nonnull task) {
        AWSglueListWorkflowsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSgluePutDataCatalogEncryptionSettingsResponse *> *)putDataCatalogEncryptionSettings:(AWSgluePutDataCatalogEncryptionSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"PutDataCatalogEncryptionSettings"
                   outputClass:[AWSgluePutDataCatalogEncryptionSettingsResponse class]];
}

- (void)putDataCatalogEncryptionSettings:(AWSgluePutDataCatalogEncryptionSettingsRequest *)request
     completionHandler:(void (^)(AWSgluePutDataCatalogEncryptionSettingsResponse *response, NSError *error))completionHandler {
    [[self putDataCatalogEncryptionSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSgluePutDataCatalogEncryptionSettingsResponse *> * _Nonnull task) {
        AWSgluePutDataCatalogEncryptionSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSgluePutResourcePolicyResponse *> *)putResourcePolicy:(AWSgluePutResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"PutResourcePolicy"
                   outputClass:[AWSgluePutResourcePolicyResponse class]];
}

- (void)putResourcePolicy:(AWSgluePutResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSgluePutResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self putResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSgluePutResourcePolicyResponse *> * _Nonnull task) {
        AWSgluePutResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSgluePutWorkflowRunPropertiesResponse *> *)putWorkflowRunProperties:(AWSgluePutWorkflowRunPropertiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"PutWorkflowRunProperties"
                   outputClass:[AWSgluePutWorkflowRunPropertiesResponse class]];
}

- (void)putWorkflowRunProperties:(AWSgluePutWorkflowRunPropertiesRequest *)request
     completionHandler:(void (^)(AWSgluePutWorkflowRunPropertiesResponse *response, NSError *error))completionHandler {
    [[self putWorkflowRunProperties:request] continueWithBlock:^id _Nullable(AWSTask<AWSgluePutWorkflowRunPropertiesResponse *> * _Nonnull task) {
        AWSgluePutWorkflowRunPropertiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueResetJobBookmarkResponse *> *)resetJobBookmark:(AWSglueResetJobBookmarkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"ResetJobBookmark"
                   outputClass:[AWSglueResetJobBookmarkResponse class]];
}

- (void)resetJobBookmark:(AWSglueResetJobBookmarkRequest *)request
     completionHandler:(void (^)(AWSglueResetJobBookmarkResponse *response, NSError *error))completionHandler {
    [[self resetJobBookmark:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueResetJobBookmarkResponse *> * _Nonnull task) {
        AWSglueResetJobBookmarkResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueSearchTablesResponse *> *)searchTables:(AWSglueSearchTablesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"SearchTables"
                   outputClass:[AWSglueSearchTablesResponse class]];
}

- (void)searchTables:(AWSglueSearchTablesRequest *)request
     completionHandler:(void (^)(AWSglueSearchTablesResponse *response, NSError *error))completionHandler {
    [[self searchTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueSearchTablesResponse *> * _Nonnull task) {
        AWSglueSearchTablesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStartCrawlerResponse *> *)startCrawler:(AWSglueStartCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartCrawler"
                   outputClass:[AWSglueStartCrawlerResponse class]];
}

- (void)startCrawler:(AWSglueStartCrawlerRequest *)request
     completionHandler:(void (^)(AWSglueStartCrawlerResponse *response, NSError *error))completionHandler {
    [[self startCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStartCrawlerResponse *> * _Nonnull task) {
        AWSglueStartCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStartCrawlerScheduleResponse *> *)startCrawlerSchedule:(AWSglueStartCrawlerScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartCrawlerSchedule"
                   outputClass:[AWSglueStartCrawlerScheduleResponse class]];
}

- (void)startCrawlerSchedule:(AWSglueStartCrawlerScheduleRequest *)request
     completionHandler:(void (^)(AWSglueStartCrawlerScheduleResponse *response, NSError *error))completionHandler {
    [[self startCrawlerSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStartCrawlerScheduleResponse *> * _Nonnull task) {
        AWSglueStartCrawlerScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStartExportLabelsTaskRunResponse *> *)startExportLabelsTaskRun:(AWSglueStartExportLabelsTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartExportLabelsTaskRun"
                   outputClass:[AWSglueStartExportLabelsTaskRunResponse class]];
}

- (void)startExportLabelsTaskRun:(AWSglueStartExportLabelsTaskRunRequest *)request
     completionHandler:(void (^)(AWSglueStartExportLabelsTaskRunResponse *response, NSError *error))completionHandler {
    [[self startExportLabelsTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStartExportLabelsTaskRunResponse *> * _Nonnull task) {
        AWSglueStartExportLabelsTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStartImportLabelsTaskRunResponse *> *)startImportLabelsTaskRun:(AWSglueStartImportLabelsTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartImportLabelsTaskRun"
                   outputClass:[AWSglueStartImportLabelsTaskRunResponse class]];
}

- (void)startImportLabelsTaskRun:(AWSglueStartImportLabelsTaskRunRequest *)request
     completionHandler:(void (^)(AWSglueStartImportLabelsTaskRunResponse *response, NSError *error))completionHandler {
    [[self startImportLabelsTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStartImportLabelsTaskRunResponse *> * _Nonnull task) {
        AWSglueStartImportLabelsTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStartJobRunResponse *> *)startJobRun:(AWSglueStartJobRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartJobRun"
                   outputClass:[AWSglueStartJobRunResponse class]];
}

- (void)startJobRun:(AWSglueStartJobRunRequest *)request
     completionHandler:(void (^)(AWSglueStartJobRunResponse *response, NSError *error))completionHandler {
    [[self startJobRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStartJobRunResponse *> * _Nonnull task) {
        AWSglueStartJobRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStartMLEvaluationTaskRunResponse *> *)startMLEvaluationTaskRun:(AWSglueStartMLEvaluationTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartMLEvaluationTaskRun"
                   outputClass:[AWSglueStartMLEvaluationTaskRunResponse class]];
}

- (void)startMLEvaluationTaskRun:(AWSglueStartMLEvaluationTaskRunRequest *)request
     completionHandler:(void (^)(AWSglueStartMLEvaluationTaskRunResponse *response, NSError *error))completionHandler {
    [[self startMLEvaluationTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStartMLEvaluationTaskRunResponse *> * _Nonnull task) {
        AWSglueStartMLEvaluationTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStartMLLabelingSetGenerationTaskRunResponse *> *)startMLLabelingSetGenerationTaskRun:(AWSglueStartMLLabelingSetGenerationTaskRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartMLLabelingSetGenerationTaskRun"
                   outputClass:[AWSglueStartMLLabelingSetGenerationTaskRunResponse class]];
}

- (void)startMLLabelingSetGenerationTaskRun:(AWSglueStartMLLabelingSetGenerationTaskRunRequest *)request
     completionHandler:(void (^)(AWSglueStartMLLabelingSetGenerationTaskRunResponse *response, NSError *error))completionHandler {
    [[self startMLLabelingSetGenerationTaskRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStartMLLabelingSetGenerationTaskRunResponse *> * _Nonnull task) {
        AWSglueStartMLLabelingSetGenerationTaskRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStartTriggerResponse *> *)startTrigger:(AWSglueStartTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartTrigger"
                   outputClass:[AWSglueStartTriggerResponse class]];
}

- (void)startTrigger:(AWSglueStartTriggerRequest *)request
     completionHandler:(void (^)(AWSglueStartTriggerResponse *response, NSError *error))completionHandler {
    [[self startTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStartTriggerResponse *> * _Nonnull task) {
        AWSglueStartTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStartWorkflowRunResponse *> *)startWorkflowRun:(AWSglueStartWorkflowRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StartWorkflowRun"
                   outputClass:[AWSglueStartWorkflowRunResponse class]];
}

- (void)startWorkflowRun:(AWSglueStartWorkflowRunRequest *)request
     completionHandler:(void (^)(AWSglueStartWorkflowRunResponse *response, NSError *error))completionHandler {
    [[self startWorkflowRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStartWorkflowRunResponse *> * _Nonnull task) {
        AWSglueStartWorkflowRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStopCrawlerResponse *> *)stopCrawler:(AWSglueStopCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StopCrawler"
                   outputClass:[AWSglueStopCrawlerResponse class]];
}

- (void)stopCrawler:(AWSglueStopCrawlerRequest *)request
     completionHandler:(void (^)(AWSglueStopCrawlerResponse *response, NSError *error))completionHandler {
    [[self stopCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStopCrawlerResponse *> * _Nonnull task) {
        AWSglueStopCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStopCrawlerScheduleResponse *> *)stopCrawlerSchedule:(AWSglueStopCrawlerScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StopCrawlerSchedule"
                   outputClass:[AWSglueStopCrawlerScheduleResponse class]];
}

- (void)stopCrawlerSchedule:(AWSglueStopCrawlerScheduleRequest *)request
     completionHandler:(void (^)(AWSglueStopCrawlerScheduleResponse *response, NSError *error))completionHandler {
    [[self stopCrawlerSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStopCrawlerScheduleResponse *> * _Nonnull task) {
        AWSglueStopCrawlerScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueStopTriggerResponse *> *)stopTrigger:(AWSglueStopTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"StopTrigger"
                   outputClass:[AWSglueStopTriggerResponse class]];
}

- (void)stopTrigger:(AWSglueStopTriggerRequest *)request
     completionHandler:(void (^)(AWSglueStopTriggerResponse *response, NSError *error))completionHandler {
    [[self stopTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueStopTriggerResponse *> * _Nonnull task) {
        AWSglueStopTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueTagResourceResponse *> *)tagResource:(AWSglueTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"TagResource"
                   outputClass:[AWSglueTagResourceResponse class]];
}

- (void)tagResource:(AWSglueTagResourceRequest *)request
     completionHandler:(void (^)(AWSglueTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueTagResourceResponse *> * _Nonnull task) {
        AWSglueTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUntagResourceResponse *> *)untagResource:(AWSglueUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UntagResource"
                   outputClass:[AWSglueUntagResourceResponse class]];
}

- (void)untagResource:(AWSglueUntagResourceRequest *)request
     completionHandler:(void (^)(AWSglueUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUntagResourceResponse *> * _Nonnull task) {
        AWSglueUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateClassifierResponse *> *)updateClassifier:(AWSglueUpdateClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateClassifier"
                   outputClass:[AWSglueUpdateClassifierResponse class]];
}

- (void)updateClassifier:(AWSglueUpdateClassifierRequest *)request
     completionHandler:(void (^)(AWSglueUpdateClassifierResponse *response, NSError *error))completionHandler {
    [[self updateClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateClassifierResponse *> * _Nonnull task) {
        AWSglueUpdateClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateConnectionResponse *> *)updateConnection:(AWSglueUpdateConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateConnection"
                   outputClass:[AWSglueUpdateConnectionResponse class]];
}

- (void)updateConnection:(AWSglueUpdateConnectionRequest *)request
     completionHandler:(void (^)(AWSglueUpdateConnectionResponse *response, NSError *error))completionHandler {
    [[self updateConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateConnectionResponse *> * _Nonnull task) {
        AWSglueUpdateConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateCrawlerResponse *> *)updateCrawler:(AWSglueUpdateCrawlerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateCrawler"
                   outputClass:[AWSglueUpdateCrawlerResponse class]];
}

- (void)updateCrawler:(AWSglueUpdateCrawlerRequest *)request
     completionHandler:(void (^)(AWSglueUpdateCrawlerResponse *response, NSError *error))completionHandler {
    [[self updateCrawler:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateCrawlerResponse *> * _Nonnull task) {
        AWSglueUpdateCrawlerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateCrawlerScheduleResponse *> *)updateCrawlerSchedule:(AWSglueUpdateCrawlerScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateCrawlerSchedule"
                   outputClass:[AWSglueUpdateCrawlerScheduleResponse class]];
}

- (void)updateCrawlerSchedule:(AWSglueUpdateCrawlerScheduleRequest *)request
     completionHandler:(void (^)(AWSglueUpdateCrawlerScheduleResponse *response, NSError *error))completionHandler {
    [[self updateCrawlerSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateCrawlerScheduleResponse *> * _Nonnull task) {
        AWSglueUpdateCrawlerScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateDatabaseResponse *> *)updateDatabase:(AWSglueUpdateDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateDatabase"
                   outputClass:[AWSglueUpdateDatabaseResponse class]];
}

- (void)updateDatabase:(AWSglueUpdateDatabaseRequest *)request
     completionHandler:(void (^)(AWSglueUpdateDatabaseResponse *response, NSError *error))completionHandler {
    [[self updateDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateDatabaseResponse *> * _Nonnull task) {
        AWSglueUpdateDatabaseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateDevEndpointResponse *> *)updateDevEndpoint:(AWSglueUpdateDevEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateDevEndpoint"
                   outputClass:[AWSglueUpdateDevEndpointResponse class]];
}

- (void)updateDevEndpoint:(AWSglueUpdateDevEndpointRequest *)request
     completionHandler:(void (^)(AWSglueUpdateDevEndpointResponse *response, NSError *error))completionHandler {
    [[self updateDevEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateDevEndpointResponse *> * _Nonnull task) {
        AWSglueUpdateDevEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateJobResponse *> *)updateJob:(AWSglueUpdateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateJob"
                   outputClass:[AWSglueUpdateJobResponse class]];
}

- (void)updateJob:(AWSglueUpdateJobRequest *)request
     completionHandler:(void (^)(AWSglueUpdateJobResponse *response, NSError *error))completionHandler {
    [[self updateJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateJobResponse *> * _Nonnull task) {
        AWSglueUpdateJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateMLTransformResponse *> *)updateMLTransform:(AWSglueUpdateMLTransformRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateMLTransform"
                   outputClass:[AWSglueUpdateMLTransformResponse class]];
}

- (void)updateMLTransform:(AWSglueUpdateMLTransformRequest *)request
     completionHandler:(void (^)(AWSglueUpdateMLTransformResponse *response, NSError *error))completionHandler {
    [[self updateMLTransform:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateMLTransformResponse *> * _Nonnull task) {
        AWSglueUpdateMLTransformResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdatePartitionResponse *> *)updatePartition:(AWSglueUpdatePartitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdatePartition"
                   outputClass:[AWSglueUpdatePartitionResponse class]];
}

- (void)updatePartition:(AWSglueUpdatePartitionRequest *)request
     completionHandler:(void (^)(AWSglueUpdatePartitionResponse *response, NSError *error))completionHandler {
    [[self updatePartition:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdatePartitionResponse *> * _Nonnull task) {
        AWSglueUpdatePartitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateTableResponse *> *)updateTable:(AWSglueUpdateTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateTable"
                   outputClass:[AWSglueUpdateTableResponse class]];
}

- (void)updateTable:(AWSglueUpdateTableRequest *)request
     completionHandler:(void (^)(AWSglueUpdateTableResponse *response, NSError *error))completionHandler {
    [[self updateTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateTableResponse *> * _Nonnull task) {
        AWSglueUpdateTableResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateTriggerResponse *> *)updateTrigger:(AWSglueUpdateTriggerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateTrigger"
                   outputClass:[AWSglueUpdateTriggerResponse class]];
}

- (void)updateTrigger:(AWSglueUpdateTriggerRequest *)request
     completionHandler:(void (^)(AWSglueUpdateTriggerResponse *response, NSError *error))completionHandler {
    [[self updateTrigger:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateTriggerResponse *> * _Nonnull task) {
        AWSglueUpdateTriggerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateUserDefinedFunctionResponse *> *)updateUserDefinedFunction:(AWSglueUpdateUserDefinedFunctionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateUserDefinedFunction"
                   outputClass:[AWSglueUpdateUserDefinedFunctionResponse class]];
}

- (void)updateUserDefinedFunction:(AWSglueUpdateUserDefinedFunctionRequest *)request
     completionHandler:(void (^)(AWSglueUpdateUserDefinedFunctionResponse *response, NSError *error))completionHandler {
    [[self updateUserDefinedFunction:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateUserDefinedFunctionResponse *> * _Nonnull task) {
        AWSglueUpdateUserDefinedFunctionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSglueUpdateWorkflowResponse *> *)updateWorkflow:(AWSglueUpdateWorkflowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSGlue"
                 operationName:@"UpdateWorkflow"
                   outputClass:[AWSglueUpdateWorkflowResponse class]];
}

- (void)updateWorkflow:(AWSglueUpdateWorkflowRequest *)request
     completionHandler:(void (^)(AWSglueUpdateWorkflowResponse *response, NSError *error))completionHandler {
    [[self updateWorkflow:request] continueWithBlock:^id _Nullable(AWSTask<AWSglueUpdateWorkflowResponse *> * _Nonnull task) {
        AWSglueUpdateWorkflowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
