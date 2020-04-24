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

#import "AWSapi.elastic-inferenceService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSapi.elastic-inferenceResources.h"

static NSString *const AWSInfoapi.elastic-inference = @"api.elastic-inference";
NSString *const AWSapi.elastic-inferenceSDKVersion = @"2.13.2";


@interface AWSapi.elastic-inferenceResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSapi.elastic-inferenceResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSapi.elastic-inferenceErrorBadRequest),
                            @"InternalServerException" : @(AWSapi.elastic-inferenceErrorInternalServer),
                            @"ResourceNotFoundException" : @(AWSapi.elastic-inferenceErrorResourceNotFound),
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
                    *error = [NSError errorWithDomain:AWSapi.elastic-inferenceErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSapi.elastic-inferenceErrorDomain
                                                 code:AWSapi.elastic-inferenceErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSapi.elastic-inferenceErrorDomain
                                     code:AWSapi.elastic-inferenceErrorUnknown
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

@interface AWSapi.elastic-inferenceRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSapi.elastic-inferenceRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSapi.elastic-inference()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSapi.elastic-inference

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSapi.elastic-inferenceSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSapi.elastic-inference versions need to match. Check your SDK installation. AWSCore: %@ AWSapi.elastic-inference: %@", AWSiOSSDKVersion, AWSapi.elastic-inferenceSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultapi.elastic-inference {
    static AWSapi.elastic-inference *_defaultapi.elastic-inference = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoapi.elastic-inference];
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
        _defaultapi.elastic-inference = [[AWSapi.elastic-inference alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultapi.elastic-inference;
}

+ (void)registerapi.elastic-inferenceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSapi.elastic-inference alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)api.elastic-inferenceForKey:(NSString *)key {
    @synchronized(self) {
        AWSapi.elastic-inference *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoapi.elastic-inference
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSapi.elastic-inference registerapi.elastic-inferenceWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeapi.elastic-inferenceForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultapi.elastic-inference` or `+ api.elastic-inferenceForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceapi.elastic-inference
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceapi.elastic-inference];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSapi.elastic-inferenceRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSapi.elastic-inferenceResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSapi.elastic-inferenceResponseSerializer alloc] initWithJSONDefinition:[[AWSapi.elastic-inferenceResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse *> *)describeAcceleratorOfferings:(AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describe-accelerator-offerings"
                  targetPrefix:@""
                 operationName:@"DescribeAcceleratorOfferings"
                   outputClass:[AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse class]];
}

- (void)describeAcceleratorOfferings:(AWSapi.elastic-inferenceDescribeAcceleratorOfferingsRequest *)request
     completionHandler:(void (^)(AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse *response, NSError *error))completionHandler {
    [[self describeAcceleratorOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse *> * _Nonnull task) {
        AWSapi.elastic-inferenceDescribeAcceleratorOfferingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse *> *)describeAcceleratorTypes:(AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/describe-accelerator-types"
                  targetPrefix:@""
                 operationName:@"DescribeAcceleratorTypes"
                   outputClass:[AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse class]];
}

- (void)describeAcceleratorTypes:(AWSapi.elastic-inferenceDescribeAcceleratorTypesRequest *)request
     completionHandler:(void (^)(AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse *response, NSError *error))completionHandler {
    [[self describeAcceleratorTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse *> * _Nonnull task) {
        AWSapi.elastic-inferenceDescribeAcceleratorTypesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.elastic-inferenceDescribeAcceleratorsResponse *> *)describeAccelerators:(AWSapi.elastic-inferenceDescribeAcceleratorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describe-accelerators"
                  targetPrefix:@""
                 operationName:@"DescribeAccelerators"
                   outputClass:[AWSapi.elastic-inferenceDescribeAcceleratorsResponse class]];
}

- (void)describeAccelerators:(AWSapi.elastic-inferenceDescribeAcceleratorsRequest *)request
     completionHandler:(void (^)(AWSapi.elastic-inferenceDescribeAcceleratorsResponse *response, NSError *error))completionHandler {
    [[self describeAccelerators:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.elastic-inferenceDescribeAcceleratorsResponse *> * _Nonnull task) {
        AWSapi.elastic-inferenceDescribeAcceleratorsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.elastic-inferenceListTagsForResourceResult *> *)listTagsForResource:(AWSapi.elastic-inferenceListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSapi.elastic-inferenceListTagsForResourceResult class]];
}

- (void)listTagsForResource:(AWSapi.elastic-inferenceListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSapi.elastic-inferenceListTagsForResourceResult *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.elastic-inferenceListTagsForResourceResult *> * _Nonnull task) {
        AWSapi.elastic-inferenceListTagsForResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.elastic-inferenceTagResourceResult *> *)tagResource:(AWSapi.elastic-inferenceTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSapi.elastic-inferenceTagResourceResult class]];
}

- (void)tagResource:(AWSapi.elastic-inferenceTagResourceRequest *)request
     completionHandler:(void (^)(AWSapi.elastic-inferenceTagResourceResult *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.elastic-inferenceTagResourceResult *> * _Nonnull task) {
        AWSapi.elastic-inferenceTagResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.elastic-inferenceUntagResourceResult *> *)untagResource:(AWSapi.elastic-inferenceUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSapi.elastic-inferenceUntagResourceResult class]];
}

- (void)untagResource:(AWSapi.elastic-inferenceUntagResourceRequest *)request
     completionHandler:(void (^)(AWSapi.elastic-inferenceUntagResourceResult *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.elastic-inferenceUntagResourceResult *> * _Nonnull task) {
        AWSapi.elastic-inferenceUntagResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
