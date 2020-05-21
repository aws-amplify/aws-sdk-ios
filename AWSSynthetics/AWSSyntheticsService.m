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

#import "AWSSyntheticsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSyntheticsResources.h"

static NSString *const AWSInfoSynthetics = @"Synthetics";
NSString *const AWSSyntheticsSDKVersion = @"2.13.4";


@interface AWSSyntheticsResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSyntheticsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConflictException" : @(AWSSyntheticsErrorConflict),
                            @"InternalServerException" : @(AWSSyntheticsErrorInternalServer),
                            @"ResourceNotFoundException" : @(AWSSyntheticsErrorResourceNotFound),
                            @"ValidationException" : @(AWSSyntheticsErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSSyntheticsErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSSyntheticsErrorDomain
                                                 code:AWSSyntheticsErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSSyntheticsErrorDomain
                                     code:AWSSyntheticsErrorUnknown
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

@interface AWSSyntheticsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSyntheticsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSynthetics()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSynthetics

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSyntheticsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSynthetics versions need to match. Check your SDK installation. AWSCore: %@ AWSSynthetics: %@", AWSiOSSDKVersion, AWSSyntheticsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSynthetics {
    static AWSSynthetics *_defaultSynthetics = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSynthetics];
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
        _defaultSynthetics = [[AWSSynthetics alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSynthetics;
}

+ (void)registerSyntheticsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSynthetics alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SyntheticsForKey:(NSString *)key {
    @synchronized(self) {
        AWSSynthetics *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSynthetics
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSynthetics registerSyntheticsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSyntheticsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSynthetics` or `+ SyntheticsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSynthetics
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSynthetics];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSyntheticsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSyntheticsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSyntheticsResponseSerializer alloc] initWithJSONDefinition:[[AWSSyntheticsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSyntheticsCreateCanaryResponse *> *)createCanary:(AWSSyntheticsCreateCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canary"
                  targetPrefix:@""
                 operationName:@"CreateCanary"
                   outputClass:[AWSSyntheticsCreateCanaryResponse class]];
}

- (void)createCanary:(AWSSyntheticsCreateCanaryRequest *)request
     completionHandler:(void (^)(AWSSyntheticsCreateCanaryResponse *response, NSError *error))completionHandler {
    [[self createCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsCreateCanaryResponse *> * _Nonnull task) {
        AWSSyntheticsCreateCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsDeleteCanaryResponse *> *)deleteCanary:(AWSSyntheticsDeleteCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/canary/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteCanary"
                   outputClass:[AWSSyntheticsDeleteCanaryResponse class]];
}

- (void)deleteCanary:(AWSSyntheticsDeleteCanaryRequest *)request
     completionHandler:(void (^)(AWSSyntheticsDeleteCanaryResponse *response, NSError *error))completionHandler {
    [[self deleteCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsDeleteCanaryResponse *> * _Nonnull task) {
        AWSSyntheticsDeleteCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsDescribeCanariesResponse *> *)describeCanaries:(AWSSyntheticsDescribeCanariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canaries"
                  targetPrefix:@""
                 operationName:@"DescribeCanaries"
                   outputClass:[AWSSyntheticsDescribeCanariesResponse class]];
}

- (void)describeCanaries:(AWSSyntheticsDescribeCanariesRequest *)request
     completionHandler:(void (^)(AWSSyntheticsDescribeCanariesResponse *response, NSError *error))completionHandler {
    [[self describeCanaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsDescribeCanariesResponse *> * _Nonnull task) {
        AWSSyntheticsDescribeCanariesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsDescribeCanariesLastRunResponse *> *)describeCanariesLastRun:(AWSSyntheticsDescribeCanariesLastRunRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canaries/last-run"
                  targetPrefix:@""
                 operationName:@"DescribeCanariesLastRun"
                   outputClass:[AWSSyntheticsDescribeCanariesLastRunResponse class]];
}

- (void)describeCanariesLastRun:(AWSSyntheticsDescribeCanariesLastRunRequest *)request
     completionHandler:(void (^)(AWSSyntheticsDescribeCanariesLastRunResponse *response, NSError *error))completionHandler {
    [[self describeCanariesLastRun:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsDescribeCanariesLastRunResponse *> * _Nonnull task) {
        AWSSyntheticsDescribeCanariesLastRunResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsDescribeRuntimeVersionsResponse *> *)describeRuntimeVersions:(AWSSyntheticsDescribeRuntimeVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/runtime-versions"
                  targetPrefix:@""
                 operationName:@"DescribeRuntimeVersions"
                   outputClass:[AWSSyntheticsDescribeRuntimeVersionsResponse class]];
}

- (void)describeRuntimeVersions:(AWSSyntheticsDescribeRuntimeVersionsRequest *)request
     completionHandler:(void (^)(AWSSyntheticsDescribeRuntimeVersionsResponse *response, NSError *error))completionHandler {
    [[self describeRuntimeVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsDescribeRuntimeVersionsResponse *> * _Nonnull task) {
        AWSSyntheticsDescribeRuntimeVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsGetCanaryResponse *> *)getCanary:(AWSSyntheticsGetCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/canary/{name}"
                  targetPrefix:@""
                 operationName:@"GetCanary"
                   outputClass:[AWSSyntheticsGetCanaryResponse class]];
}

- (void)getCanary:(AWSSyntheticsGetCanaryRequest *)request
     completionHandler:(void (^)(AWSSyntheticsGetCanaryResponse *response, NSError *error))completionHandler {
    [[self getCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsGetCanaryResponse *> * _Nonnull task) {
        AWSSyntheticsGetCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsGetCanaryRunsResponse *> *)getCanaryRuns:(AWSSyntheticsGetCanaryRunsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canary/{name}/runs"
                  targetPrefix:@""
                 operationName:@"GetCanaryRuns"
                   outputClass:[AWSSyntheticsGetCanaryRunsResponse class]];
}

- (void)getCanaryRuns:(AWSSyntheticsGetCanaryRunsRequest *)request
     completionHandler:(void (^)(AWSSyntheticsGetCanaryRunsResponse *response, NSError *error))completionHandler {
    [[self getCanaryRuns:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsGetCanaryRunsResponse *> * _Nonnull task) {
        AWSSyntheticsGetCanaryRunsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsListTagsForResourceResponse *> *)listTagsForResource:(AWSSyntheticsListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSSyntheticsListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSSyntheticsListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSSyntheticsListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsListTagsForResourceResponse *> * _Nonnull task) {
        AWSSyntheticsListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsStartCanaryResponse *> *)startCanary:(AWSSyntheticsStartCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canary/{name}/start"
                  targetPrefix:@""
                 operationName:@"StartCanary"
                   outputClass:[AWSSyntheticsStartCanaryResponse class]];
}

- (void)startCanary:(AWSSyntheticsStartCanaryRequest *)request
     completionHandler:(void (^)(AWSSyntheticsStartCanaryResponse *response, NSError *error))completionHandler {
    [[self startCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsStartCanaryResponse *> * _Nonnull task) {
        AWSSyntheticsStartCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsStopCanaryResponse *> *)stopCanary:(AWSSyntheticsStopCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/canary/{name}/stop"
                  targetPrefix:@""
                 operationName:@"StopCanary"
                   outputClass:[AWSSyntheticsStopCanaryResponse class]];
}

- (void)stopCanary:(AWSSyntheticsStopCanaryRequest *)request
     completionHandler:(void (^)(AWSSyntheticsStopCanaryResponse *response, NSError *error))completionHandler {
    [[self stopCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsStopCanaryResponse *> * _Nonnull task) {
        AWSSyntheticsStopCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsTagResourceResponse *> *)tagResource:(AWSSyntheticsTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSSyntheticsTagResourceResponse class]];
}

- (void)tagResource:(AWSSyntheticsTagResourceRequest *)request
     completionHandler:(void (^)(AWSSyntheticsTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsTagResourceResponse *> * _Nonnull task) {
        AWSSyntheticsTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsUntagResourceResponse *> *)untagResource:(AWSSyntheticsUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSSyntheticsUntagResourceResponse class]];
}

- (void)untagResource:(AWSSyntheticsUntagResourceRequest *)request
     completionHandler:(void (^)(AWSSyntheticsUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsUntagResourceResponse *> * _Nonnull task) {
        AWSSyntheticsUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSyntheticsUpdateCanaryResponse *> *)updateCanary:(AWSSyntheticsUpdateCanaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/canary/{name}"
                  targetPrefix:@""
                 operationName:@"UpdateCanary"
                   outputClass:[AWSSyntheticsUpdateCanaryResponse class]];
}

- (void)updateCanary:(AWSSyntheticsUpdateCanaryRequest *)request
     completionHandler:(void (^)(AWSSyntheticsUpdateCanaryResponse *response, NSError *error))completionHandler {
    [[self updateCanary:request] continueWithBlock:^id _Nullable(AWSTask<AWSSyntheticsUpdateCanaryResponse *> * _Nonnull task) {
        AWSSyntheticsUpdateCanaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
