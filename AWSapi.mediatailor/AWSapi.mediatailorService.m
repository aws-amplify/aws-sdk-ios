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

#import "AWSapi.mediatailorService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSapi.mediatailorResources.h"

static NSString *const AWSInfoapi.mediatailor = @"api.mediatailor";
NSString *const AWSapi.mediatailorSDKVersion = @"2.13.2";


@interface AWSapi.mediatailorResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSapi.mediatailorResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSapi.mediatailorErrorBadRequest),
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
                    *error = [NSError errorWithDomain:AWSapi.mediatailorErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSapi.mediatailorErrorDomain
                                                 code:AWSapi.mediatailorErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSapi.mediatailorErrorDomain
                                     code:AWSapi.mediatailorErrorUnknown
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

@interface AWSapi.mediatailorRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSapi.mediatailorRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSapi.mediatailor()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSapi.mediatailor

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSapi.mediatailorSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSapi.mediatailor versions need to match. Check your SDK installation. AWSCore: %@ AWSapi.mediatailor: %@", AWSiOSSDKVersion, AWSapi.mediatailorSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultapi.mediatailor {
    static AWSapi.mediatailor *_defaultapi.mediatailor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoapi.mediatailor];
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
        _defaultapi.mediatailor = [[AWSapi.mediatailor alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultapi.mediatailor;
}

+ (void)registerapi.mediatailorWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSapi.mediatailor alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)api.mediatailorForKey:(NSString *)key {
    @synchronized(self) {
        AWSapi.mediatailor *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoapi.mediatailor
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSapi.mediatailor registerapi.mediatailorWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeapi.mediatailorForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultapi.mediatailor` or `+ api.mediatailorForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceapi.mediatailor
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceapi.mediatailor];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSapi.mediatailorRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSapi.mediatailorResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSapi.mediatailorResponseSerializer alloc] initWithJSONDefinition:[[AWSapi.mediatailorResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSapi.mediatailorDeletePlaybackConfigurationResponse *> *)deletePlaybackConfiguration:(AWSapi.mediatailorDeletePlaybackConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/playbackConfiguration/{Name}"
                  targetPrefix:@""
                 operationName:@"DeletePlaybackConfiguration"
                   outputClass:[AWSapi.mediatailorDeletePlaybackConfigurationResponse class]];
}

- (void)deletePlaybackConfiguration:(AWSapi.mediatailorDeletePlaybackConfigurationRequest *)request
     completionHandler:(void (^)(AWSapi.mediatailorDeletePlaybackConfigurationResponse *response, NSError *error))completionHandler {
    [[self deletePlaybackConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.mediatailorDeletePlaybackConfigurationResponse *> * _Nonnull task) {
        AWSapi.mediatailorDeletePlaybackConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.mediatailorGetPlaybackConfigurationResponse *> *)getPlaybackConfiguration:(AWSapi.mediatailorGetPlaybackConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/playbackConfiguration/{Name}"
                  targetPrefix:@""
                 operationName:@"GetPlaybackConfiguration"
                   outputClass:[AWSapi.mediatailorGetPlaybackConfigurationResponse class]];
}

- (void)getPlaybackConfiguration:(AWSapi.mediatailorGetPlaybackConfigurationRequest *)request
     completionHandler:(void (^)(AWSapi.mediatailorGetPlaybackConfigurationResponse *response, NSError *error))completionHandler {
    [[self getPlaybackConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.mediatailorGetPlaybackConfigurationResponse *> * _Nonnull task) {
        AWSapi.mediatailorGetPlaybackConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.mediatailorListPlaybackConfigurationsResponse *> *)listPlaybackConfigurations:(AWSapi.mediatailorListPlaybackConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/playbackConfigurations"
                  targetPrefix:@""
                 operationName:@"ListPlaybackConfigurations"
                   outputClass:[AWSapi.mediatailorListPlaybackConfigurationsResponse class]];
}

- (void)listPlaybackConfigurations:(AWSapi.mediatailorListPlaybackConfigurationsRequest *)request
     completionHandler:(void (^)(AWSapi.mediatailorListPlaybackConfigurationsResponse *response, NSError *error))completionHandler {
    [[self listPlaybackConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.mediatailorListPlaybackConfigurationsResponse *> * _Nonnull task) {
        AWSapi.mediatailorListPlaybackConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.mediatailorListTagsForResourceResponse *> *)listTagsForResource:(AWSapi.mediatailorListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSapi.mediatailorListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSapi.mediatailorListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSapi.mediatailorListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.mediatailorListTagsForResourceResponse *> * _Nonnull task) {
        AWSapi.mediatailorListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.mediatailorPutPlaybackConfigurationResponse *> *)putPlaybackConfiguration:(AWSapi.mediatailorPutPlaybackConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/playbackConfiguration"
                  targetPrefix:@""
                 operationName:@"PutPlaybackConfiguration"
                   outputClass:[AWSapi.mediatailorPutPlaybackConfigurationResponse class]];
}

- (void)putPlaybackConfiguration:(AWSapi.mediatailorPutPlaybackConfigurationRequest *)request
     completionHandler:(void (^)(AWSapi.mediatailorPutPlaybackConfigurationResponse *response, NSError *error))completionHandler {
    [[self putPlaybackConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.mediatailorPutPlaybackConfigurationResponse *> * _Nonnull task) {
        AWSapi.mediatailorPutPlaybackConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSapi.mediatailorTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSapi.mediatailorTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSapi.mediatailorUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSapi.mediatailorUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
