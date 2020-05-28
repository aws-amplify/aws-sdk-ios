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

#import "AWSKafkaService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSKafkaResources.h"

static NSString *const AWSInfoKafka = @"Kafka";
NSString *const AWSKafkaSDKVersion = @"2.13.4";


@interface AWSKafkaResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSKafkaResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSKafkaErrorBadRequest),
                            @"ConflictException" : @(AWSKafkaErrorConflict),
                            @"ForbiddenException" : @(AWSKafkaErrorForbidden),
                            @"InternalServerErrorException" : @(AWSKafkaErrorInternalServerError),
                            @"NotFoundException" : @(AWSKafkaErrorNotFound),
                            @"ServiceUnavailableException" : @(AWSKafkaErrorServiceUnavailable),
                            @"TooManyRequestsException" : @(AWSKafkaErrorTooManyRequests),
                            @"UnauthorizedException" : @(AWSKafkaErrorUnauthorized),
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
                    *error = [NSError errorWithDomain:AWSKafkaErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSKafkaErrorDomain
                                                 code:AWSKafkaErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSKafkaErrorDomain
                                     code:AWSKafkaErrorUnknown
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

@interface AWSKafkaRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSKafkaRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSKafka()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSKafka

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSKafkaSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSKafka versions need to match. Check your SDK installation. AWSCore: %@ AWSKafka: %@", AWSiOSSDKVersion, AWSKafkaSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultKafka {
    static AWSKafka *_defaultKafka = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoKafka];
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
        _defaultKafka = [[AWSKafka alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultKafka;
}

+ (void)registerKafkaWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSKafka alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)KafkaForKey:(NSString *)key {
    @synchronized(self) {
        AWSKafka *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoKafka
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSKafka registerKafkaWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeKafkaForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultKafka` or `+ KafkaForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceKafka
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceKafka];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSKafkaRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSKafkaResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSKafkaResponseSerializer alloc] initWithJSONDefinition:[[AWSKafkaResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSKafkaCreateClusterResponse *> *)createCluster:(AWSKafkaCreateClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/clusters"
                  targetPrefix:@""
                 operationName:@"CreateCluster"
                   outputClass:[AWSKafkaCreateClusterResponse class]];
}

- (void)createCluster:(AWSKafkaCreateClusterRequest *)request
     completionHandler:(void (^)(AWSKafkaCreateClusterResponse *response, NSError *error))completionHandler {
    [[self createCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaCreateClusterResponse *> * _Nonnull task) {
        AWSKafkaCreateClusterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaCreateConfigurationResponse *> *)createConfiguration:(AWSKafkaCreateConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/configurations"
                  targetPrefix:@""
                 operationName:@"CreateConfiguration"
                   outputClass:[AWSKafkaCreateConfigurationResponse class]];
}

- (void)createConfiguration:(AWSKafkaCreateConfigurationRequest *)request
     completionHandler:(void (^)(AWSKafkaCreateConfigurationResponse *response, NSError *error))completionHandler {
    [[self createConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaCreateConfigurationResponse *> * _Nonnull task) {
        AWSKafkaCreateConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaDeleteClusterResponse *> *)deleteCluster:(AWSKafkaDeleteClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/clusters/{clusterArn}"
                  targetPrefix:@""
                 operationName:@"DeleteCluster"
                   outputClass:[AWSKafkaDeleteClusterResponse class]];
}

- (void)deleteCluster:(AWSKafkaDeleteClusterRequest *)request
     completionHandler:(void (^)(AWSKafkaDeleteClusterResponse *response, NSError *error))completionHandler {
    [[self deleteCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaDeleteClusterResponse *> * _Nonnull task) {
        AWSKafkaDeleteClusterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaDescribeClusterResponse *> *)describeCluster:(AWSKafkaDescribeClusterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/clusters/{clusterArn}"
                  targetPrefix:@""
                 operationName:@"DescribeCluster"
                   outputClass:[AWSKafkaDescribeClusterResponse class]];
}

- (void)describeCluster:(AWSKafkaDescribeClusterRequest *)request
     completionHandler:(void (^)(AWSKafkaDescribeClusterResponse *response, NSError *error))completionHandler {
    [[self describeCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaDescribeClusterResponse *> * _Nonnull task) {
        AWSKafkaDescribeClusterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaDescribeClusterOperationResponse *> *)describeClusterOperation:(AWSKafkaDescribeClusterOperationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/operations/{clusterOperationArn}"
                  targetPrefix:@""
                 operationName:@"DescribeClusterOperation"
                   outputClass:[AWSKafkaDescribeClusterOperationResponse class]];
}

- (void)describeClusterOperation:(AWSKafkaDescribeClusterOperationRequest *)request
     completionHandler:(void (^)(AWSKafkaDescribeClusterOperationResponse *response, NSError *error))completionHandler {
    [[self describeClusterOperation:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaDescribeClusterOperationResponse *> * _Nonnull task) {
        AWSKafkaDescribeClusterOperationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaDescribeConfigurationResponse *> *)describeConfiguration:(AWSKafkaDescribeConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/configurations/{arn}"
                  targetPrefix:@""
                 operationName:@"DescribeConfiguration"
                   outputClass:[AWSKafkaDescribeConfigurationResponse class]];
}

- (void)describeConfiguration:(AWSKafkaDescribeConfigurationRequest *)request
     completionHandler:(void (^)(AWSKafkaDescribeConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaDescribeConfigurationResponse *> * _Nonnull task) {
        AWSKafkaDescribeConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaDescribeConfigurationRevisionResponse *> *)describeConfigurationRevision:(AWSKafkaDescribeConfigurationRevisionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/configurations/{arn}/revisions/{revision}"
                  targetPrefix:@""
                 operationName:@"DescribeConfigurationRevision"
                   outputClass:[AWSKafkaDescribeConfigurationRevisionResponse class]];
}

- (void)describeConfigurationRevision:(AWSKafkaDescribeConfigurationRevisionRequest *)request
     completionHandler:(void (^)(AWSKafkaDescribeConfigurationRevisionResponse *response, NSError *error))completionHandler {
    [[self describeConfigurationRevision:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaDescribeConfigurationRevisionResponse *> * _Nonnull task) {
        AWSKafkaDescribeConfigurationRevisionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaGetBootstrapBrokersResponse *> *)getBootstrapBrokers:(AWSKafkaGetBootstrapBrokersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/clusters/{clusterArn}/bootstrap-brokers"
                  targetPrefix:@""
                 operationName:@"GetBootstrapBrokers"
                   outputClass:[AWSKafkaGetBootstrapBrokersResponse class]];
}

- (void)getBootstrapBrokers:(AWSKafkaGetBootstrapBrokersRequest *)request
     completionHandler:(void (^)(AWSKafkaGetBootstrapBrokersResponse *response, NSError *error))completionHandler {
    [[self getBootstrapBrokers:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaGetBootstrapBrokersResponse *> * _Nonnull task) {
        AWSKafkaGetBootstrapBrokersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaGetCompatibleKafkaVersionsResponse *> *)getCompatibleKafkaVersions:(AWSKafkaGetCompatibleKafkaVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/compatible-kafka-versions"
                  targetPrefix:@""
                 operationName:@"GetCompatibleKafkaVersions"
                   outputClass:[AWSKafkaGetCompatibleKafkaVersionsResponse class]];
}

- (void)getCompatibleKafkaVersions:(AWSKafkaGetCompatibleKafkaVersionsRequest *)request
     completionHandler:(void (^)(AWSKafkaGetCompatibleKafkaVersionsResponse *response, NSError *error))completionHandler {
    [[self getCompatibleKafkaVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaGetCompatibleKafkaVersionsResponse *> * _Nonnull task) {
        AWSKafkaGetCompatibleKafkaVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaListClusterOperationsResponse *> *)listClusterOperations:(AWSKafkaListClusterOperationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/clusters/{clusterArn}/operations"
                  targetPrefix:@""
                 operationName:@"ListClusterOperations"
                   outputClass:[AWSKafkaListClusterOperationsResponse class]];
}

- (void)listClusterOperations:(AWSKafkaListClusterOperationsRequest *)request
     completionHandler:(void (^)(AWSKafkaListClusterOperationsResponse *response, NSError *error))completionHandler {
    [[self listClusterOperations:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaListClusterOperationsResponse *> * _Nonnull task) {
        AWSKafkaListClusterOperationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaListClustersResponse *> *)listClusters:(AWSKafkaListClustersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/clusters"
                  targetPrefix:@""
                 operationName:@"ListClusters"
                   outputClass:[AWSKafkaListClustersResponse class]];
}

- (void)listClusters:(AWSKafkaListClustersRequest *)request
     completionHandler:(void (^)(AWSKafkaListClustersResponse *response, NSError *error))completionHandler {
    [[self listClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaListClustersResponse *> * _Nonnull task) {
        AWSKafkaListClustersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaListConfigurationRevisionsResponse *> *)listConfigurationRevisions:(AWSKafkaListConfigurationRevisionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/configurations/{arn}/revisions"
                  targetPrefix:@""
                 operationName:@"ListConfigurationRevisions"
                   outputClass:[AWSKafkaListConfigurationRevisionsResponse class]];
}

- (void)listConfigurationRevisions:(AWSKafkaListConfigurationRevisionsRequest *)request
     completionHandler:(void (^)(AWSKafkaListConfigurationRevisionsResponse *response, NSError *error))completionHandler {
    [[self listConfigurationRevisions:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaListConfigurationRevisionsResponse *> * _Nonnull task) {
        AWSKafkaListConfigurationRevisionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaListConfigurationsResponse *> *)listConfigurations:(AWSKafkaListConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/configurations"
                  targetPrefix:@""
                 operationName:@"ListConfigurations"
                   outputClass:[AWSKafkaListConfigurationsResponse class]];
}

- (void)listConfigurations:(AWSKafkaListConfigurationsRequest *)request
     completionHandler:(void (^)(AWSKafkaListConfigurationsResponse *response, NSError *error))completionHandler {
    [[self listConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaListConfigurationsResponse *> * _Nonnull task) {
        AWSKafkaListConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaListKafkaVersionsResponse *> *)listKafkaVersions:(AWSKafkaListKafkaVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/kafka-versions"
                  targetPrefix:@""
                 operationName:@"ListKafkaVersions"
                   outputClass:[AWSKafkaListKafkaVersionsResponse class]];
}

- (void)listKafkaVersions:(AWSKafkaListKafkaVersionsRequest *)request
     completionHandler:(void (^)(AWSKafkaListKafkaVersionsResponse *response, NSError *error))completionHandler {
    [[self listKafkaVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaListKafkaVersionsResponse *> * _Nonnull task) {
        AWSKafkaListKafkaVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaListNodesResponse *> *)listNodes:(AWSKafkaListNodesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/clusters/{clusterArn}/nodes"
                  targetPrefix:@""
                 operationName:@"ListNodes"
                   outputClass:[AWSKafkaListNodesResponse class]];
}

- (void)listNodes:(AWSKafkaListNodesRequest *)request
     completionHandler:(void (^)(AWSKafkaListNodesResponse *response, NSError *error))completionHandler {
    [[self listNodes:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaListNodesResponse *> * _Nonnull task) {
        AWSKafkaListNodesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaListTagsForResourceResponse *> *)listTagsForResource:(AWSKafkaListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSKafkaListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSKafkaListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSKafkaListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaListTagsForResourceResponse *> * _Nonnull task) {
        AWSKafkaListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSKafkaTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSKafkaTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSKafkaUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSKafkaUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaUpdateBrokerCountResponse *> *)updateBrokerCount:(AWSKafkaUpdateBrokerCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/clusters/{clusterArn}/nodes/count"
                  targetPrefix:@""
                 operationName:@"UpdateBrokerCount"
                   outputClass:[AWSKafkaUpdateBrokerCountResponse class]];
}

- (void)updateBrokerCount:(AWSKafkaUpdateBrokerCountRequest *)request
     completionHandler:(void (^)(AWSKafkaUpdateBrokerCountResponse *response, NSError *error))completionHandler {
    [[self updateBrokerCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaUpdateBrokerCountResponse *> * _Nonnull task) {
        AWSKafkaUpdateBrokerCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaUpdateBrokerStorageResponse *> *)updateBrokerStorage:(AWSKafkaUpdateBrokerStorageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/clusters/{clusterArn}/nodes/storage"
                  targetPrefix:@""
                 operationName:@"UpdateBrokerStorage"
                   outputClass:[AWSKafkaUpdateBrokerStorageResponse class]];
}

- (void)updateBrokerStorage:(AWSKafkaUpdateBrokerStorageRequest *)request
     completionHandler:(void (^)(AWSKafkaUpdateBrokerStorageResponse *response, NSError *error))completionHandler {
    [[self updateBrokerStorage:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaUpdateBrokerStorageResponse *> * _Nonnull task) {
        AWSKafkaUpdateBrokerStorageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaUpdateClusterConfigurationResponse *> *)updateClusterConfiguration:(AWSKafkaUpdateClusterConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/clusters/{clusterArn}/configuration"
                  targetPrefix:@""
                 operationName:@"UpdateClusterConfiguration"
                   outputClass:[AWSKafkaUpdateClusterConfigurationResponse class]];
}

- (void)updateClusterConfiguration:(AWSKafkaUpdateClusterConfigurationRequest *)request
     completionHandler:(void (^)(AWSKafkaUpdateClusterConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateClusterConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaUpdateClusterConfigurationResponse *> * _Nonnull task) {
        AWSKafkaUpdateClusterConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaUpdateClusterKafkaVersionResponse *> *)updateClusterKafkaVersion:(AWSKafkaUpdateClusterKafkaVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/clusters/{clusterArn}/version"
                  targetPrefix:@""
                 operationName:@"UpdateClusterKafkaVersion"
                   outputClass:[AWSKafkaUpdateClusterKafkaVersionResponse class]];
}

- (void)updateClusterKafkaVersion:(AWSKafkaUpdateClusterKafkaVersionRequest *)request
     completionHandler:(void (^)(AWSKafkaUpdateClusterKafkaVersionResponse *response, NSError *error))completionHandler {
    [[self updateClusterKafkaVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaUpdateClusterKafkaVersionResponse *> * _Nonnull task) {
        AWSKafkaUpdateClusterKafkaVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKafkaUpdateMonitoringResponse *> *)updateMonitoring:(AWSKafkaUpdateMonitoringRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/clusters/{clusterArn}/monitoring"
                  targetPrefix:@""
                 operationName:@"UpdateMonitoring"
                   outputClass:[AWSKafkaUpdateMonitoringResponse class]];
}

- (void)updateMonitoring:(AWSKafkaUpdateMonitoringRequest *)request
     completionHandler:(void (^)(AWSKafkaUpdateMonitoringResponse *response, NSError *error))completionHandler {
    [[self updateMonitoring:request] continueWithBlock:^id _Nullable(AWSTask<AWSKafkaUpdateMonitoringResponse *> * _Nonnull task) {
        AWSKafkaUpdateMonitoringResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
