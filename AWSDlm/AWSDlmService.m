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

#import "AWSDlmService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSDlmResources.h"

static NSString *const AWSInfoDlm = @"Dlm";
NSString *const AWSDlmSDKVersion = @"2.13.4";


@interface AWSDlmResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSDlmResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalServerException" : @(AWSDlmErrorInternalServer),
                            @"InvalidRequestException" : @(AWSDlmErrorInvalidRequest),
                            @"LimitExceededException" : @(AWSDlmErrorLimitExceeded),
                            @"ResourceNotFoundException" : @(AWSDlmErrorResourceNotFound),
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
                    *error = [NSError errorWithDomain:AWSDlmErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSDlmErrorDomain
                                                 code:AWSDlmErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSDlmErrorDomain
                                     code:AWSDlmErrorUnknown
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

@interface AWSDlmRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSDlmRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSDlm()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSDlm

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSDlmSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSDlm versions need to match. Check your SDK installation. AWSCore: %@ AWSDlm: %@", AWSiOSSDKVersion, AWSDlmSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultDlm {
    static AWSDlm *_defaultDlm = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoDlm];
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
        _defaultDlm = [[AWSDlm alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultDlm;
}

+ (void)registerDlmWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSDlm alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)DlmForKey:(NSString *)key {
    @synchronized(self) {
        AWSDlm *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoDlm
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSDlm registerDlmWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeDlmForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultDlm` or `+ DlmForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceDlm
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceDlm];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSDlmRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSDlmResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSDlmResponseSerializer alloc] initWithJSONDefinition:[[AWSDlmResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSDlmCreateLifecyclePolicyResponse *> *)createLifecyclePolicy:(AWSDlmCreateLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/policies"
                  targetPrefix:@""
                 operationName:@"CreateLifecyclePolicy"
                   outputClass:[AWSDlmCreateLifecyclePolicyResponse class]];
}

- (void)createLifecyclePolicy:(AWSDlmCreateLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSDlmCreateLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self createLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSDlmCreateLifecyclePolicyResponse *> * _Nonnull task) {
        AWSDlmCreateLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDlmDeleteLifecyclePolicyResponse *> *)deleteLifecyclePolicy:(AWSDlmDeleteLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/policies/{policyId}/"
                  targetPrefix:@""
                 operationName:@"DeleteLifecyclePolicy"
                   outputClass:[AWSDlmDeleteLifecyclePolicyResponse class]];
}

- (void)deleteLifecyclePolicy:(AWSDlmDeleteLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSDlmDeleteLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self deleteLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSDlmDeleteLifecyclePolicyResponse *> * _Nonnull task) {
        AWSDlmDeleteLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDlmGetLifecyclePoliciesResponse *> *)getLifecyclePolicies:(AWSDlmGetLifecyclePoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies"
                  targetPrefix:@""
                 operationName:@"GetLifecyclePolicies"
                   outputClass:[AWSDlmGetLifecyclePoliciesResponse class]];
}

- (void)getLifecyclePolicies:(AWSDlmGetLifecyclePoliciesRequest *)request
     completionHandler:(void (^)(AWSDlmGetLifecyclePoliciesResponse *response, NSError *error))completionHandler {
    [[self getLifecyclePolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSDlmGetLifecyclePoliciesResponse *> * _Nonnull task) {
        AWSDlmGetLifecyclePoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDlmGetLifecyclePolicyResponse *> *)getLifecyclePolicy:(AWSDlmGetLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/policies/{policyId}/"
                  targetPrefix:@""
                 operationName:@"GetLifecyclePolicy"
                   outputClass:[AWSDlmGetLifecyclePolicyResponse class]];
}

- (void)getLifecyclePolicy:(AWSDlmGetLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSDlmGetLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self getLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSDlmGetLifecyclePolicyResponse *> * _Nonnull task) {
        AWSDlmGetLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDlmListTagsForResourceResponse *> *)listTagsForResource:(AWSDlmListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSDlmListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSDlmListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSDlmListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSDlmListTagsForResourceResponse *> * _Nonnull task) {
        AWSDlmListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDlmTagResourceResponse *> *)tagResource:(AWSDlmTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSDlmTagResourceResponse class]];
}

- (void)tagResource:(AWSDlmTagResourceRequest *)request
     completionHandler:(void (^)(AWSDlmTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSDlmTagResourceResponse *> * _Nonnull task) {
        AWSDlmTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDlmUntagResourceResponse *> *)untagResource:(AWSDlmUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSDlmUntagResourceResponse class]];
}

- (void)untagResource:(AWSDlmUntagResourceRequest *)request
     completionHandler:(void (^)(AWSDlmUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSDlmUntagResourceResponse *> * _Nonnull task) {
        AWSDlmUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDlmUpdateLifecyclePolicyResponse *> *)updateLifecyclePolicy:(AWSDlmUpdateLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/policies/{policyId}"
                  targetPrefix:@""
                 operationName:@"UpdateLifecyclePolicy"
                   outputClass:[AWSDlmUpdateLifecyclePolicyResponse class]];
}

- (void)updateLifecyclePolicy:(AWSDlmUpdateLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSDlmUpdateLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self updateLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSDlmUpdateLifecyclePolicyResponse *> * _Nonnull task) {
        AWSDlmUpdateLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
