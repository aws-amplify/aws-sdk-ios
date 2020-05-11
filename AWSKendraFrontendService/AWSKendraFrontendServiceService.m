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

#import "AWSKendraFrontendServiceService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSKendraFrontendServiceResources.h"

static NSString *const AWSInfoKendraFrontendService = @"KendraFrontendService";
NSString *const AWSKendraFrontendServiceSDKVersion = @"2.13.3";


@interface AWSKendraFrontendServiceResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSKendraFrontendServiceResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSKendraFrontendServiceErrorAccessDenied),
                            @"ConflictException" : @(AWSKendraFrontendServiceErrorConflict),
                            @"InternalServerException" : @(AWSKendraFrontendServiceErrorInternalServer),
                            @"ResourceAlreadyExistException" : @(AWSKendraFrontendServiceErrorResourceAlreadyExist),
                            @"ResourceInUseException" : @(AWSKendraFrontendServiceErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSKendraFrontendServiceErrorResourceNotFound),
                            @"ResourceUnavailableException" : @(AWSKendraFrontendServiceErrorResourceUnavailable),
                            @"ServiceQuotaExceededException" : @(AWSKendraFrontendServiceErrorServiceQuotaExceeded),
                            @"ThrottlingException" : @(AWSKendraFrontendServiceErrorThrottling),
                            @"ValidationException" : @(AWSKendraFrontendServiceErrorValidation),
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
	                *error = [NSError errorWithDomain:AWSKendraFrontendServiceErrorDomain
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
        *error = [NSError errorWithDomain:AWSKendraFrontendServiceErrorDomain
                                     code:AWSKendraFrontendServiceErrorUnknown
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

@interface AWSKendraFrontendServiceRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSKendraFrontendServiceRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSKendraFrontendService()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSKendraFrontendService

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSKendraFrontendServiceSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSKendraFrontendService versions need to match. Check your SDK installation. AWSCore: %@ AWSKendraFrontendService: %@", AWSiOSSDKVersion, AWSKendraFrontendServiceSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultKendraFrontendService {
    static AWSKendraFrontendService *_defaultKendraFrontendService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoKendraFrontendService];
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
        _defaultKendraFrontendService = [[AWSKendraFrontendService alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultKendraFrontendService;
}

+ (void)registerKendraFrontendServiceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSKendraFrontendService alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)KendraFrontendServiceForKey:(NSString *)key {
    @synchronized(self) {
        AWSKendraFrontendService *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoKendraFrontendService
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSKendraFrontendService registerKendraFrontendServiceWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeKendraFrontendServiceForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultKendraFrontendService` or `+ KendraFrontendServiceForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceKendraFrontendService
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceKendraFrontendService];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSKendraFrontendServiceRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSKendraFrontendServiceResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSKendraFrontendServiceResponseSerializer alloc] initWithJSONDefinition:[[AWSKendraFrontendServiceResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSKendraFrontendServiceBatchDeleteDocumentResponse *> *)batchDeleteDocument:(AWSKendraFrontendServiceBatchDeleteDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"BatchDeleteDocument"
                   outputClass:[AWSKendraFrontendServiceBatchDeleteDocumentResponse class]];
}

- (void)batchDeleteDocument:(AWSKendraFrontendServiceBatchDeleteDocumentRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceBatchDeleteDocumentResponse *response, NSError *error))completionHandler {
    [[self batchDeleteDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceBatchDeleteDocumentResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceBatchDeleteDocumentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceBatchPutDocumentResponse *> *)batchPutDocument:(AWSKendraFrontendServiceBatchPutDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"BatchPutDocument"
                   outputClass:[AWSKendraFrontendServiceBatchPutDocumentResponse class]];
}

- (void)batchPutDocument:(AWSKendraFrontendServiceBatchPutDocumentRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceBatchPutDocumentResponse *response, NSError *error))completionHandler {
    [[self batchPutDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceBatchPutDocumentResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceBatchPutDocumentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceCreateDataSourceResponse *> *)createDataSource:(AWSKendraFrontendServiceCreateDataSourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"CreateDataSource"
                   outputClass:[AWSKendraFrontendServiceCreateDataSourceResponse class]];
}

- (void)createDataSource:(AWSKendraFrontendServiceCreateDataSourceRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceCreateDataSourceResponse *response, NSError *error))completionHandler {
    [[self createDataSource:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceCreateDataSourceResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceCreateDataSourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceCreateFaqResponse *> *)createFaq:(AWSKendraFrontendServiceCreateFaqRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"CreateFaq"
                   outputClass:[AWSKendraFrontendServiceCreateFaqResponse class]];
}

- (void)createFaq:(AWSKendraFrontendServiceCreateFaqRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceCreateFaqResponse *response, NSError *error))completionHandler {
    [[self createFaq:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceCreateFaqResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceCreateFaqResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceCreateIndexResponse *> *)createIndex:(AWSKendraFrontendServiceCreateIndexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"CreateIndex"
                   outputClass:[AWSKendraFrontendServiceCreateIndexResponse class]];
}

- (void)createIndex:(AWSKendraFrontendServiceCreateIndexRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceCreateIndexResponse *response, NSError *error))completionHandler {
    [[self createIndex:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceCreateIndexResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceCreateIndexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDataSource:(AWSKendraFrontendServiceDeleteDataSourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"DeleteDataSource"
                   outputClass:nil];
}

- (void)deleteDataSource:(AWSKendraFrontendServiceDeleteDataSourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDataSource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteFaq:(AWSKendraFrontendServiceDeleteFaqRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"DeleteFaq"
                   outputClass:nil];
}

- (void)deleteFaq:(AWSKendraFrontendServiceDeleteFaqRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteFaq:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteIndex:(AWSKendraFrontendServiceDeleteIndexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"DeleteIndex"
                   outputClass:nil];
}

- (void)deleteIndex:(AWSKendraFrontendServiceDeleteIndexRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteIndex:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceDescribeDataSourceResponse *> *)describeDataSource:(AWSKendraFrontendServiceDescribeDataSourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"DescribeDataSource"
                   outputClass:[AWSKendraFrontendServiceDescribeDataSourceResponse class]];
}

- (void)describeDataSource:(AWSKendraFrontendServiceDescribeDataSourceRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceDescribeDataSourceResponse *response, NSError *error))completionHandler {
    [[self describeDataSource:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceDescribeDataSourceResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceDescribeDataSourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceDescribeFaqResponse *> *)describeFaq:(AWSKendraFrontendServiceDescribeFaqRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"DescribeFaq"
                   outputClass:[AWSKendraFrontendServiceDescribeFaqResponse class]];
}

- (void)describeFaq:(AWSKendraFrontendServiceDescribeFaqRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceDescribeFaqResponse *response, NSError *error))completionHandler {
    [[self describeFaq:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceDescribeFaqResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceDescribeFaqResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceDescribeIndexResponse *> *)describeIndex:(AWSKendraFrontendServiceDescribeIndexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"DescribeIndex"
                   outputClass:[AWSKendraFrontendServiceDescribeIndexResponse class]];
}

- (void)describeIndex:(AWSKendraFrontendServiceDescribeIndexRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceDescribeIndexResponse *response, NSError *error))completionHandler {
    [[self describeIndex:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceDescribeIndexResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceDescribeIndexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceListDataSourceSyncJobsResponse *> *)listDataSourceSyncJobs:(AWSKendraFrontendServiceListDataSourceSyncJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"ListDataSourceSyncJobs"
                   outputClass:[AWSKendraFrontendServiceListDataSourceSyncJobsResponse class]];
}

- (void)listDataSourceSyncJobs:(AWSKendraFrontendServiceListDataSourceSyncJobsRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceListDataSourceSyncJobsResponse *response, NSError *error))completionHandler {
    [[self listDataSourceSyncJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceListDataSourceSyncJobsResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceListDataSourceSyncJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceListDataSourcesResponse *> *)listDataSources:(AWSKendraFrontendServiceListDataSourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"ListDataSources"
                   outputClass:[AWSKendraFrontendServiceListDataSourcesResponse class]];
}

- (void)listDataSources:(AWSKendraFrontendServiceListDataSourcesRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceListDataSourcesResponse *response, NSError *error))completionHandler {
    [[self listDataSources:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceListDataSourcesResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceListDataSourcesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceListFaqsResponse *> *)listFaqs:(AWSKendraFrontendServiceListFaqsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"ListFaqs"
                   outputClass:[AWSKendraFrontendServiceListFaqsResponse class]];
}

- (void)listFaqs:(AWSKendraFrontendServiceListFaqsRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceListFaqsResponse *response, NSError *error))completionHandler {
    [[self listFaqs:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceListFaqsResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceListFaqsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceListIndicesResponse *> *)listIndices:(AWSKendraFrontendServiceListIndicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"ListIndices"
                   outputClass:[AWSKendraFrontendServiceListIndicesResponse class]];
}

- (void)listIndices:(AWSKendraFrontendServiceListIndicesRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceListIndicesResponse *response, NSError *error))completionHandler {
    [[self listIndices:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceListIndicesResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceListIndicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceListTagsForResourceResponse *> *)listTagsForResource:(AWSKendraFrontendServiceListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSKendraFrontendServiceListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSKendraFrontendServiceListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceListTagsForResourceResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceQueryResult *> *)query:(AWSKendraFrontendServiceQueryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"Query"
                   outputClass:[AWSKendraFrontendServiceQueryResult class]];
}

- (void)query:(AWSKendraFrontendServiceQueryRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceQueryResult *response, NSError *error))completionHandler {
    [[self query:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceQueryResult *> * _Nonnull task) {
        AWSKendraFrontendServiceQueryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceStartDataSourceSyncJobResponse *> *)startDataSourceSyncJob:(AWSKendraFrontendServiceStartDataSourceSyncJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"StartDataSourceSyncJob"
                   outputClass:[AWSKendraFrontendServiceStartDataSourceSyncJobResponse class]];
}

- (void)startDataSourceSyncJob:(AWSKendraFrontendServiceStartDataSourceSyncJobRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceStartDataSourceSyncJobResponse *response, NSError *error))completionHandler {
    [[self startDataSourceSyncJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceStartDataSourceSyncJobResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceStartDataSourceSyncJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)stopDataSourceSyncJob:(AWSKendraFrontendServiceStopDataSourceSyncJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"StopDataSourceSyncJob"
                   outputClass:nil];
}

- (void)stopDataSourceSyncJob:(AWSKendraFrontendServiceStopDataSourceSyncJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopDataSourceSyncJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)submitFeedback:(AWSKendraFrontendServiceSubmitFeedbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"SubmitFeedback"
                   outputClass:nil];
}

- (void)submitFeedback:(AWSKendraFrontendServiceSubmitFeedbackRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self submitFeedback:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceTagResourceResponse *> *)tagResource:(AWSKendraFrontendServiceTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"TagResource"
                   outputClass:[AWSKendraFrontendServiceTagResourceResponse class]];
}

- (void)tagResource:(AWSKendraFrontendServiceTagResourceRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceTagResourceResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKendraFrontendServiceUntagResourceResponse *> *)untagResource:(AWSKendraFrontendServiceUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"UntagResource"
                   outputClass:[AWSKendraFrontendServiceUntagResourceResponse class]];
}

- (void)untagResource:(AWSKendraFrontendServiceUntagResourceRequest *)request
     completionHandler:(void (^)(AWSKendraFrontendServiceUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSKendraFrontendServiceUntagResourceResponse *> * _Nonnull task) {
        AWSKendraFrontendServiceUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateDataSource:(AWSKendraFrontendServiceUpdateDataSourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"UpdateDataSource"
                   outputClass:nil];
}

- (void)updateDataSource:(AWSKendraFrontendServiceUpdateDataSourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateDataSource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateIndex:(AWSKendraFrontendServiceUpdateIndexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSKendraFrontendService"
                 operationName:@"UpdateIndex"
                   outputClass:nil];
}

- (void)updateIndex:(AWSKendraFrontendServiceUpdateIndexRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateIndex:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
