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

#import "AWSsyntheticsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSsyntheticsResources.h"

static NSString *const AWSInfosynthetics = @"synthetics";
NSString *const AWSsyntheticsSDKVersion = @"2.13.2";


@interface AWSsyntheticsResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSsyntheticsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConflictException" : @(AWSsyntheticsErrorConflict),
                            @"InternalServerException" : @(AWSsyntheticsErrorInternalServer),
                            @"ResourceNotFoundException" : @(AWSsyntheticsErrorResourceNotFound),
                            @"ValidationException" : @(AWSsyntheticsErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSsyntheticsErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSsyntheticsErrorDomain
                                                 code:AWSsyntheticsErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSsyntheticsErrorDomain
                                     code:AWSsyntheticsErrorUnknown
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

@interface AWSsyntheticsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSsyntheticsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSsynthetics()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSsynthetics

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSsyntheticsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSsynthetics versions need to match. Check your SDK installation. AWSCore: %@ AWSsynthetics: %@", AWSiOSSDKVersion, AWSsyntheticsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultsynthetics {
    static AWSsynthetics *_defaultsynthetics = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfosynthetics];
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
        _defaultsynthetics = [[AWSsynthetics alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultsynthetics;
}

+ (void)registersyntheticsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSsynthetics alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)syntheticsForKey:(NSString *)key {
    @synchronized(self) {
        AWSsynthetics *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfosynthetics
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSsynthetics registersyntheticsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removesyntheticsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultsynthetics` or `+ syntheticsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicesynthetics
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicesynthetics];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSsyntheticsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSsyntheticsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSsyntheticsResponseSerializer alloc] initWithJSONDefinition:[[AWSsyntheticsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSsyntheticsCreateCanaryResponse *> *)createCanary:(AWSsyntheticsCreateCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canary"
                  targetPrefix:@""
                 operationName:@"CreateCanary"
                   outputClass:[AWSsyntheticsCreateCanaryResponse class]];
}

- (void)createCanary:(AWSsyntheticsCreateCanaryRequest *)request
     completionHandler:(void (^)(AWSsyntheticsCreateCanaryResponse *response, NSError *error))completionHandler {
    [[self createCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsCreateCanaryResponse *> * _Nonnull task) {
        AWSsyntheticsCreateCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsDeleteCanaryResponse *> *)deleteCanary:(AWSsyntheticsDeleteCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/canary/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteCanary"
                   outputClass:[AWSsyntheticsDeleteCanaryResponse class]];
}

- (void)deleteCanary:(AWSsyntheticsDeleteCanaryRequest *)request
     completionHandler:(void (^)(AWSsyntheticsDeleteCanaryResponse *response, NSError *error))completionHandler {
    [[self deleteCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsDeleteCanaryResponse *> * _Nonnull task) {
        AWSsyntheticsDeleteCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsDescribeCanariesResponse *> *)describeCanaries:(AWSsyntheticsDescribeCanariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canaries"
                  targetPrefix:@""
                 operationName:@"DescribeCanaries"
                   outputClass:[AWSsyntheticsDescribeCanariesResponse class]];
}

- (void)describeCanaries:(AWSsyntheticsDescribeCanariesRequest *)request
     completionHandler:(void (^)(AWSsyntheticsDescribeCanariesResponse *response, NSError *error))completionHandler {
    [[self describeCanaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsDescribeCanariesResponse *> * _Nonnull task) {
        AWSsyntheticsDescribeCanariesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsDescribeCanariesLastRunResponse *> *)describeCanariesLastRun:(AWSsyntheticsDescribeCanariesLastRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canaries/last-run"
                  targetPrefix:@""
                 operationName:@"DescribeCanariesLastRun"
                   outputClass:[AWSsyntheticsDescribeCanariesLastRunResponse class]];
}

- (void)describeCanariesLastRun:(AWSsyntheticsDescribeCanariesLastRunRequest *)request
     completionHandler:(void (^)(AWSsyntheticsDescribeCanariesLastRunResponse *response, NSError *error))completionHandler {
    [[self describeCanariesLastRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsDescribeCanariesLastRunResponse *> * _Nonnull task) {
        AWSsyntheticsDescribeCanariesLastRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsDescribeRuntimeVersionsResponse *> *)describeRuntimeVersions:(AWSsyntheticsDescribeRuntimeVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/runtime-versions"
                  targetPrefix:@""
                 operationName:@"DescribeRuntimeVersions"
                   outputClass:[AWSsyntheticsDescribeRuntimeVersionsResponse class]];
}

- (void)describeRuntimeVersions:(AWSsyntheticsDescribeRuntimeVersionsRequest *)request
     completionHandler:(void (^)(AWSsyntheticsDescribeRuntimeVersionsResponse *response, NSError *error))completionHandler {
    [[self describeRuntimeVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsDescribeRuntimeVersionsResponse *> * _Nonnull task) {
        AWSsyntheticsDescribeRuntimeVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsGetCanaryResponse *> *)getCanary:(AWSsyntheticsGetCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/canary/{name}"
                  targetPrefix:@""
                 operationName:@"GetCanary"
                   outputClass:[AWSsyntheticsGetCanaryResponse class]];
}

- (void)getCanary:(AWSsyntheticsGetCanaryRequest *)request
     completionHandler:(void (^)(AWSsyntheticsGetCanaryResponse *response, NSError *error))completionHandler {
    [[self getCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsGetCanaryResponse *> * _Nonnull task) {
        AWSsyntheticsGetCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsGetCanaryRunsResponse *> *)getCanaryRuns:(AWSsyntheticsGetCanaryRunsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canary/{name}/runs"
                  targetPrefix:@""
                 operationName:@"GetCanaryRuns"
                   outputClass:[AWSsyntheticsGetCanaryRunsResponse class]];
}

- (void)getCanaryRuns:(AWSsyntheticsGetCanaryRunsRequest *)request
     completionHandler:(void (^)(AWSsyntheticsGetCanaryRunsResponse *response, NSError *error))completionHandler {
    [[self getCanaryRuns:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsGetCanaryRunsResponse *> * _Nonnull task) {
        AWSsyntheticsGetCanaryRunsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsListTagsForResourceResponse *> *)listTagsForResource:(AWSsyntheticsListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSsyntheticsListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSsyntheticsListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSsyntheticsListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsListTagsForResourceResponse *> * _Nonnull task) {
        AWSsyntheticsListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsStartCanaryResponse *> *)startCanary:(AWSsyntheticsStartCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canary/{name}/start"
                  targetPrefix:@""
                 operationName:@"StartCanary"
                   outputClass:[AWSsyntheticsStartCanaryResponse class]];
}

- (void)startCanary:(AWSsyntheticsStartCanaryRequest *)request
     completionHandler:(void (^)(AWSsyntheticsStartCanaryResponse *response, NSError *error))completionHandler {
    [[self startCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsStartCanaryResponse *> * _Nonnull task) {
        AWSsyntheticsStartCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsStopCanaryResponse *> *)stopCanary:(AWSsyntheticsStopCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canary/{name}/stop"
                  targetPrefix:@""
                 operationName:@"StopCanary"
                   outputClass:[AWSsyntheticsStopCanaryResponse class]];
}

- (void)stopCanary:(AWSsyntheticsStopCanaryRequest *)request
     completionHandler:(void (^)(AWSsyntheticsStopCanaryResponse *response, NSError *error))completionHandler {
    [[self stopCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsStopCanaryResponse *> * _Nonnull task) {
        AWSsyntheticsStopCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsTagResourceResponse *> *)tagResource:(AWSsyntheticsTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSsyntheticsTagResourceResponse class]];
}

- (void)tagResource:(AWSsyntheticsTagResourceRequest *)request
     completionHandler:(void (^)(AWSsyntheticsTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsTagResourceResponse *> * _Nonnull task) {
        AWSsyntheticsTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsUntagResourceResponse *> *)untagResource:(AWSsyntheticsUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSsyntheticsUntagResourceResponse class]];
}

- (void)untagResource:(AWSsyntheticsUntagResourceRequest *)request
     completionHandler:(void (^)(AWSsyntheticsUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsUntagResourceResponse *> * _Nonnull task) {
        AWSsyntheticsUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsyntheticsUpdateCanaryResponse *> *)updateCanary:(AWSsyntheticsUpdateCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/canary/{name}"
                  targetPrefix:@""
                 operationName:@"UpdateCanary"
                   outputClass:[AWSsyntheticsUpdateCanaryResponse class]];
}

- (void)updateCanary:(AWSsyntheticsUpdateCanaryRequest *)request
     completionHandler:(void (^)(AWSsyntheticsUpdateCanaryResponse *response, NSError *error))completionHandler {
    [[self updateCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSsyntheticsUpdateCanaryResponse *> * _Nonnull task) {
        AWSsyntheticsUpdateCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
