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

#import "AWSKinesisVideoService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSKinesisVideoResources.h"

static NSString *const AWSInfoKinesisVideo = @"KinesisVideo";
NSString *const AWSKinesisVideoSDKVersion = @"2.13.2";


@interface AWSKinesisVideoResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSKinesisVideoResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSKinesisVideoErrorAccessDenied),
                            @"AccountChannelLimitExceededException" : @(AWSKinesisVideoErrorAccountChannelLimitExceeded),
                            @"AccountStreamLimitExceededException" : @(AWSKinesisVideoErrorAccountStreamLimitExceeded),
                            @"ClientLimitExceededException" : @(AWSKinesisVideoErrorClientLimitExceeded),
                            @"DeviceStreamLimitExceededException" : @(AWSKinesisVideoErrorDeviceStreamLimitExceeded),
                            @"InvalidArgumentException" : @(AWSKinesisVideoErrorInvalidArgument),
                            @"InvalidDeviceException" : @(AWSKinesisVideoErrorInvalidDevice),
                            @"InvalidResourceFormatException" : @(AWSKinesisVideoErrorInvalidResourceFormat),
                            @"NotAuthorizedException" : @(AWSKinesisVideoErrorNotAuthorized),
                            @"ResourceInUseException" : @(AWSKinesisVideoErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSKinesisVideoErrorResourceNotFound),
                            @"TagsPerResourceExceededLimitException" : @(AWSKinesisVideoErrorTagsPerResourceExceededLimit),
                            @"VersionMismatchException" : @(AWSKinesisVideoErrorVersionMismatch),
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
                    *error = [NSError errorWithDomain:AWSKinesisVideoErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSKinesisVideoErrorDomain
                                                 code:AWSKinesisVideoErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSKinesisVideoErrorDomain
                                     code:AWSKinesisVideoErrorUnknown
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

@interface AWSKinesisVideoRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSKinesisVideoRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSKinesisVideo()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSKinesisVideo

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSKinesisVideoSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSKinesisVideo versions need to match. Check your SDK installation. AWSCore: %@ AWSKinesisVideo: %@", AWSiOSSDKVersion, AWSKinesisVideoSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultKinesisVideo {
    static AWSKinesisVideo *_defaultKinesisVideo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoKinesisVideo];
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
        _defaultKinesisVideo = [[AWSKinesisVideo alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultKinesisVideo;
}

+ (void)registerKinesisVideoWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSKinesisVideo alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)KinesisVideoForKey:(NSString *)key {
    @synchronized(self) {
        AWSKinesisVideo *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoKinesisVideo
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSKinesisVideo registerKinesisVideoWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeKinesisVideoForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultKinesisVideo` or `+ KinesisVideoForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceKinesisVideo
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceKinesisVideo];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSKinesisVideoRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.0"}; 
		
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSKinesisVideoResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSKinesisVideoResponseSerializer alloc] initWithJSONDefinition:[[AWSKinesisVideoResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSKinesisVideoCreateSignalingChannelOutput *> *)createSignalingChannel:(AWSKinesisVideoCreateSignalingChannelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/createSignalingChannel"
                  targetPrefix:@""
                 operationName:@"CreateSignalingChannel"
                   outputClass:[AWSKinesisVideoCreateSignalingChannelOutput class]];
}

- (void)createSignalingChannel:(AWSKinesisVideoCreateSignalingChannelInput *)request
     completionHandler:(void (^)(AWSKinesisVideoCreateSignalingChannelOutput *response, NSError *error))completionHandler {
    [[self createSignalingChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoCreateSignalingChannelOutput *> * _Nonnull task) {
        AWSKinesisVideoCreateSignalingChannelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoCreateStreamOutput *> *)createStream:(AWSKinesisVideoCreateStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/createStream"
                  targetPrefix:@""
                 operationName:@"CreateStream"
                   outputClass:[AWSKinesisVideoCreateStreamOutput class]];
}

- (void)createStream:(AWSKinesisVideoCreateStreamInput *)request
     completionHandler:(void (^)(AWSKinesisVideoCreateStreamOutput *response, NSError *error))completionHandler {
    [[self createStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoCreateStreamOutput *> * _Nonnull task) {
        AWSKinesisVideoCreateStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoDeleteSignalingChannelOutput *> *)deleteSignalingChannel:(AWSKinesisVideoDeleteSignalingChannelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/deleteSignalingChannel"
                  targetPrefix:@""
                 operationName:@"DeleteSignalingChannel"
                   outputClass:[AWSKinesisVideoDeleteSignalingChannelOutput class]];
}

- (void)deleteSignalingChannel:(AWSKinesisVideoDeleteSignalingChannelInput *)request
     completionHandler:(void (^)(AWSKinesisVideoDeleteSignalingChannelOutput *response, NSError *error))completionHandler {
    [[self deleteSignalingChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoDeleteSignalingChannelOutput *> * _Nonnull task) {
        AWSKinesisVideoDeleteSignalingChannelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoDeleteStreamOutput *> *)deleteStream:(AWSKinesisVideoDeleteStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/deleteStream"
                  targetPrefix:@""
                 operationName:@"DeleteStream"
                   outputClass:[AWSKinesisVideoDeleteStreamOutput class]];
}

- (void)deleteStream:(AWSKinesisVideoDeleteStreamInput *)request
     completionHandler:(void (^)(AWSKinesisVideoDeleteStreamOutput *response, NSError *error))completionHandler {
    [[self deleteStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoDeleteStreamOutput *> * _Nonnull task) {
        AWSKinesisVideoDeleteStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoDescribeSignalingChannelOutput *> *)describeSignalingChannel:(AWSKinesisVideoDescribeSignalingChannelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describeSignalingChannel"
                  targetPrefix:@""
                 operationName:@"DescribeSignalingChannel"
                   outputClass:[AWSKinesisVideoDescribeSignalingChannelOutput class]];
}

- (void)describeSignalingChannel:(AWSKinesisVideoDescribeSignalingChannelInput *)request
     completionHandler:(void (^)(AWSKinesisVideoDescribeSignalingChannelOutput *response, NSError *error))completionHandler {
    [[self describeSignalingChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoDescribeSignalingChannelOutput *> * _Nonnull task) {
        AWSKinesisVideoDescribeSignalingChannelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoDescribeStreamOutput *> *)describeStream:(AWSKinesisVideoDescribeStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describeStream"
                  targetPrefix:@""
                 operationName:@"DescribeStream"
                   outputClass:[AWSKinesisVideoDescribeStreamOutput class]];
}

- (void)describeStream:(AWSKinesisVideoDescribeStreamInput *)request
     completionHandler:(void (^)(AWSKinesisVideoDescribeStreamOutput *response, NSError *error))completionHandler {
    [[self describeStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoDescribeStreamOutput *> * _Nonnull task) {
        AWSKinesisVideoDescribeStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoGetDataEndpointOutput *> *)getDataEndpoint:(AWSKinesisVideoGetDataEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getDataEndpoint"
                  targetPrefix:@""
                 operationName:@"GetDataEndpoint"
                   outputClass:[AWSKinesisVideoGetDataEndpointOutput class]];
}

- (void)getDataEndpoint:(AWSKinesisVideoGetDataEndpointInput *)request
     completionHandler:(void (^)(AWSKinesisVideoGetDataEndpointOutput *response, NSError *error))completionHandler {
    [[self getDataEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoGetDataEndpointOutput *> * _Nonnull task) {
        AWSKinesisVideoGetDataEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoGetSignalingChannelEndpointOutput *> *)getSignalingChannelEndpoint:(AWSKinesisVideoGetSignalingChannelEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getSignalingChannelEndpoint"
                  targetPrefix:@""
                 operationName:@"GetSignalingChannelEndpoint"
                   outputClass:[AWSKinesisVideoGetSignalingChannelEndpointOutput class]];
}

- (void)getSignalingChannelEndpoint:(AWSKinesisVideoGetSignalingChannelEndpointInput *)request
     completionHandler:(void (^)(AWSKinesisVideoGetSignalingChannelEndpointOutput *response, NSError *error))completionHandler {
    [[self getSignalingChannelEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoGetSignalingChannelEndpointOutput *> * _Nonnull task) {
        AWSKinesisVideoGetSignalingChannelEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoListSignalingChannelsOutput *> *)listSignalingChannels:(AWSKinesisVideoListSignalingChannelsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listSignalingChannels"
                  targetPrefix:@""
                 operationName:@"ListSignalingChannels"
                   outputClass:[AWSKinesisVideoListSignalingChannelsOutput class]];
}

- (void)listSignalingChannels:(AWSKinesisVideoListSignalingChannelsInput *)request
     completionHandler:(void (^)(AWSKinesisVideoListSignalingChannelsOutput *response, NSError *error))completionHandler {
    [[self listSignalingChannels:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoListSignalingChannelsOutput *> * _Nonnull task) {
        AWSKinesisVideoListSignalingChannelsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoListStreamsOutput *> *)listStreams:(AWSKinesisVideoListStreamsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listStreams"
                  targetPrefix:@""
                 operationName:@"ListStreams"
                   outputClass:[AWSKinesisVideoListStreamsOutput class]];
}

- (void)listStreams:(AWSKinesisVideoListStreamsInput *)request
     completionHandler:(void (^)(AWSKinesisVideoListStreamsOutput *response, NSError *error))completionHandler {
    [[self listStreams:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoListStreamsOutput *> * _Nonnull task) {
        AWSKinesisVideoListStreamsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoListTagsForResourceOutput *> *)listTagsForResource:(AWSKinesisVideoListTagsForResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/ListTagsForResource"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSKinesisVideoListTagsForResourceOutput class]];
}

- (void)listTagsForResource:(AWSKinesisVideoListTagsForResourceInput *)request
     completionHandler:(void (^)(AWSKinesisVideoListTagsForResourceOutput *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoListTagsForResourceOutput *> * _Nonnull task) {
        AWSKinesisVideoListTagsForResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoListTagsForStreamOutput *> *)listTagsForStream:(AWSKinesisVideoListTagsForStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listTagsForStream"
                  targetPrefix:@""
                 operationName:@"ListTagsForStream"
                   outputClass:[AWSKinesisVideoListTagsForStreamOutput class]];
}

- (void)listTagsForStream:(AWSKinesisVideoListTagsForStreamInput *)request
     completionHandler:(void (^)(AWSKinesisVideoListTagsForStreamOutput *response, NSError *error))completionHandler {
    [[self listTagsForStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoListTagsForStreamOutput *> * _Nonnull task) {
        AWSKinesisVideoListTagsForStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoTagResourceOutput *> *)tagResource:(AWSKinesisVideoTagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/TagResource"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSKinesisVideoTagResourceOutput class]];
}

- (void)tagResource:(AWSKinesisVideoTagResourceInput *)request
     completionHandler:(void (^)(AWSKinesisVideoTagResourceOutput *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoTagResourceOutput *> * _Nonnull task) {
        AWSKinesisVideoTagResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoTagStreamOutput *> *)tagStream:(AWSKinesisVideoTagStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tagStream"
                  targetPrefix:@""
                 operationName:@"TagStream"
                   outputClass:[AWSKinesisVideoTagStreamOutput class]];
}

- (void)tagStream:(AWSKinesisVideoTagStreamInput *)request
     completionHandler:(void (^)(AWSKinesisVideoTagStreamOutput *response, NSError *error))completionHandler {
    [[self tagStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoTagStreamOutput *> * _Nonnull task) {
        AWSKinesisVideoTagStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoUntagResourceOutput *> *)untagResource:(AWSKinesisVideoUntagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/UntagResource"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSKinesisVideoUntagResourceOutput class]];
}

- (void)untagResource:(AWSKinesisVideoUntagResourceInput *)request
     completionHandler:(void (^)(AWSKinesisVideoUntagResourceOutput *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoUntagResourceOutput *> * _Nonnull task) {
        AWSKinesisVideoUntagResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoUntagStreamOutput *> *)untagStream:(AWSKinesisVideoUntagStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/untagStream"
                  targetPrefix:@""
                 operationName:@"UntagStream"
                   outputClass:[AWSKinesisVideoUntagStreamOutput class]];
}

- (void)untagStream:(AWSKinesisVideoUntagStreamInput *)request
     completionHandler:(void (^)(AWSKinesisVideoUntagStreamOutput *response, NSError *error))completionHandler {
    [[self untagStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoUntagStreamOutput *> * _Nonnull task) {
        AWSKinesisVideoUntagStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoUpdateDataRetentionOutput *> *)updateDataRetention:(AWSKinesisVideoUpdateDataRetentionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/updateDataRetention"
                  targetPrefix:@""
                 operationName:@"UpdateDataRetention"
                   outputClass:[AWSKinesisVideoUpdateDataRetentionOutput class]];
}

- (void)updateDataRetention:(AWSKinesisVideoUpdateDataRetentionInput *)request
     completionHandler:(void (^)(AWSKinesisVideoUpdateDataRetentionOutput *response, NSError *error))completionHandler {
    [[self updateDataRetention:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoUpdateDataRetentionOutput *> * _Nonnull task) {
        AWSKinesisVideoUpdateDataRetentionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoUpdateSignalingChannelOutput *> *)updateSignalingChannel:(AWSKinesisVideoUpdateSignalingChannelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/updateSignalingChannel"
                  targetPrefix:@""
                 operationName:@"UpdateSignalingChannel"
                   outputClass:[AWSKinesisVideoUpdateSignalingChannelOutput class]];
}

- (void)updateSignalingChannel:(AWSKinesisVideoUpdateSignalingChannelInput *)request
     completionHandler:(void (^)(AWSKinesisVideoUpdateSignalingChannelOutput *response, NSError *error))completionHandler {
    [[self updateSignalingChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoUpdateSignalingChannelOutput *> * _Nonnull task) {
        AWSKinesisVideoUpdateSignalingChannelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoUpdateStreamOutput *> *)updateStream:(AWSKinesisVideoUpdateStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/updateStream"
                  targetPrefix:@""
                 operationName:@"UpdateStream"
                   outputClass:[AWSKinesisVideoUpdateStreamOutput class]];
}

- (void)updateStream:(AWSKinesisVideoUpdateStreamInput *)request
     completionHandler:(void (^)(AWSKinesisVideoUpdateStreamOutput *response, NSError *error))completionHandler {
    [[self updateStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoUpdateStreamOutput *> * _Nonnull task) {
        AWSKinesisVideoUpdateStreamOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
