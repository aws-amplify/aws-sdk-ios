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

#import "AWSdlmService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSdlmResources.h"

static NSString *const AWSInfodlm = @"dlm";
NSString *const AWSdlmSDKVersion = @"2.13.2";


@interface AWSdlmResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSdlmResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalServerException" : @(AWSdlmErrorInternalServer),
                            @"InvalidRequestException" : @(AWSdlmErrorInvalidRequest),
                            @"LimitExceededException" : @(AWSdlmErrorLimitExceeded),
                            @"ResourceNotFoundException" : @(AWSdlmErrorResourceNotFound),
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
                    *error = [NSError errorWithDomain:AWSdlmErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSdlmErrorDomain
                                                 code:AWSdlmErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSdlmErrorDomain
                                     code:AWSdlmErrorUnknown
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

@interface AWSdlmRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSdlmRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSdlm()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSdlm

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSdlmSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSdlm versions need to match. Check your SDK installation. AWSCore: %@ AWSdlm: %@", AWSiOSSDKVersion, AWSdlmSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultdlm {
    static AWSdlm *_defaultdlm = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfodlm];
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
        _defaultdlm = [[AWSdlm alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultdlm;
}

+ (void)registerdlmWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSdlm alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)dlmForKey:(NSString *)key {
    @synchronized(self) {
        AWSdlm *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfodlm
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSdlm registerdlmWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removedlmForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultdlm` or `+ dlmForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicedlm
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicedlm];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSdlmRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSdlmResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSdlmResponseSerializer alloc] initWithJSONDefinition:[[AWSdlmResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSdlmCreateLifecyclePolicyResponse *> *)createLifecyclePolicy:(AWSdlmCreateLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/policies"
                  targetPrefix:@""
                 operationName:@"CreateLifecyclePolicy"
                   outputClass:[AWSdlmCreateLifecyclePolicyResponse class]];
}

- (void)createLifecyclePolicy:(AWSdlmCreateLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSdlmCreateLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self createLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSdlmCreateLifecyclePolicyResponse *> * _Nonnull task) {
        AWSdlmCreateLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdlmDeleteLifecyclePolicyResponse *> *)deleteLifecyclePolicy:(AWSdlmDeleteLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/policies/{policyId}/"
                  targetPrefix:@""
                 operationName:@"DeleteLifecyclePolicy"
                   outputClass:[AWSdlmDeleteLifecyclePolicyResponse class]];
}

- (void)deleteLifecyclePolicy:(AWSdlmDeleteLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSdlmDeleteLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self deleteLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSdlmDeleteLifecyclePolicyResponse *> * _Nonnull task) {
        AWSdlmDeleteLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdlmGetLifecyclePoliciesResponse *> *)getLifecyclePolicies:(AWSdlmGetLifecyclePoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies"
                  targetPrefix:@""
                 operationName:@"GetLifecyclePolicies"
                   outputClass:[AWSdlmGetLifecyclePoliciesResponse class]];
}

- (void)getLifecyclePolicies:(AWSdlmGetLifecyclePoliciesRequest *)request
     completionHandler:(void (^)(AWSdlmGetLifecyclePoliciesResponse *response, NSError *error))completionHandler {
    [[self getLifecyclePolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSdlmGetLifecyclePoliciesResponse *> * _Nonnull task) {
        AWSdlmGetLifecyclePoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdlmGetLifecyclePolicyResponse *> *)getLifecyclePolicy:(AWSdlmGetLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies/{policyId}/"
                  targetPrefix:@""
                 operationName:@"GetLifecyclePolicy"
                   outputClass:[AWSdlmGetLifecyclePolicyResponse class]];
}

- (void)getLifecyclePolicy:(AWSdlmGetLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSdlmGetLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self getLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSdlmGetLifecyclePolicyResponse *> * _Nonnull task) {
        AWSdlmGetLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdlmListTagsForResourceResponse *> *)listTagsForResource:(AWSdlmListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSdlmListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSdlmListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSdlmListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSdlmListTagsForResourceResponse *> * _Nonnull task) {
        AWSdlmListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdlmTagResourceResponse *> *)tagResource:(AWSdlmTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSdlmTagResourceResponse class]];
}

- (void)tagResource:(AWSdlmTagResourceRequest *)request
     completionHandler:(void (^)(AWSdlmTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSdlmTagResourceResponse *> * _Nonnull task) {
        AWSdlmTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdlmUntagResourceResponse *> *)untagResource:(AWSdlmUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSdlmUntagResourceResponse class]];
}

- (void)untagResource:(AWSdlmUntagResourceRequest *)request
     completionHandler:(void (^)(AWSdlmUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSdlmUntagResourceResponse *> * _Nonnull task) {
        AWSdlmUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdlmUpdateLifecyclePolicyResponse *> *)updateLifecyclePolicy:(AWSdlmUpdateLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/policies/{policyId}"
                  targetPrefix:@""
                 operationName:@"UpdateLifecyclePolicy"
                   outputClass:[AWSdlmUpdateLifecyclePolicyResponse class]];
}

- (void)updateLifecyclePolicy:(AWSdlmUpdateLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSdlmUpdateLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self updateLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSdlmUpdateLifecyclePolicyResponse *> * _Nonnull task) {
        AWSdlmUpdateLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
