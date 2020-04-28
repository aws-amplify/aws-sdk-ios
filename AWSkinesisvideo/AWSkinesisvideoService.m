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

#import "AWSkinesisvideoService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSkinesisvideoResources.h"

static NSString *const AWSInfokinesisvideo = @"kinesisvideo";
NSString *const AWSkinesisvideoSDKVersion = @"2.13.2";


@interface AWSkinesisvideoResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSkinesisvideoResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ClientLimitExceededException" : @(AWSkinesisvideoErrorClientLimitExceeded),
                            @"InvalidArgumentException" : @(AWSkinesisvideoErrorInvalidArgument),
                            @"InvalidCodecPrivateDataException" : @(AWSkinesisvideoErrorInvalidCodecPrivateData),
                            @"InvalidMediaFrameException" : @(AWSkinesisvideoErrorInvalidMediaFrame),
                            @"MissingCodecPrivateDataException" : @(AWSkinesisvideoErrorMissingCodecPrivateData),
                            @"NoDataRetentionException" : @(AWSkinesisvideoErrorNoDataRetention),
                            @"NotAuthorizedException" : @(AWSkinesisvideoErrorNotAuthorized),
                            @"ResourceNotFoundException" : @(AWSkinesisvideoErrorResourceNotFound),
                            @"UnsupportedStreamMediaTypeException" : @(AWSkinesisvideoErrorUnsupportedStreamMediaType),
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
                    *error = [NSError errorWithDomain:AWSkinesisvideoErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSkinesisvideoErrorDomain
                                                 code:AWSkinesisvideoErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSkinesisvideoErrorDomain
                                     code:AWSkinesisvideoErrorUnknown
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

@interface AWSkinesisvideoRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSkinesisvideoRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSkinesisvideo()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSkinesisvideo

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSkinesisvideoSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSkinesisvideo versions need to match. Check your SDK installation. AWSCore: %@ AWSkinesisvideo: %@", AWSiOSSDKVersion, AWSkinesisvideoSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultkinesisvideo {
    static AWSkinesisvideo *_defaultkinesisvideo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfokinesisvideo];
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
        _defaultkinesisvideo = [[AWSkinesisvideo alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultkinesisvideo;
}

+ (void)registerkinesisvideoWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSkinesisvideo alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)kinesisvideoForKey:(NSString *)key {
    @synchronized(self) {
        AWSkinesisvideo *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfokinesisvideo
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSkinesisvideo registerkinesisvideoWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removekinesisvideoForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultkinesisvideo` or `+ kinesisvideoForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicekinesisvideo
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicekinesisvideo];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSkinesisvideoRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSkinesisvideoResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSkinesisvideoResponseSerializer alloc] initWithJSONDefinition:[[AWSkinesisvideoResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSkinesisvideoGetClipOutput *> *)getClip:(AWSkinesisvideoGetClipInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getClip"
                  targetPrefix:@""
                 operationName:@"GetClip"
                   outputClass:[AWSkinesisvideoGetClipOutput class]];
}

- (void)getClip:(AWSkinesisvideoGetClipInput *)request
     completionHandler:(void (^)(AWSkinesisvideoGetClipOutput *response, NSError *error))completionHandler {
    [[self getClip:request] continueWithBlock:^id _Nullable(AWSTask<AWSkinesisvideoGetClipOutput *> * _Nonnull task) {
        AWSkinesisvideoGetClipOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSkinesisvideoGetDASHStreamingSessionURLOutput *> *)getDASHStreamingSessionURL:(AWSkinesisvideoGetDASHStreamingSessionURLInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getDASHStreamingSessionURL"
                  targetPrefix:@""
                 operationName:@"GetDASHStreamingSessionURL"
                   outputClass:[AWSkinesisvideoGetDASHStreamingSessionURLOutput class]];
}

- (void)getDASHStreamingSessionURL:(AWSkinesisvideoGetDASHStreamingSessionURLInput *)request
     completionHandler:(void (^)(AWSkinesisvideoGetDASHStreamingSessionURLOutput *response, NSError *error))completionHandler {
    [[self getDASHStreamingSessionURL:request] continueWithBlock:^id _Nullable(AWSTask<AWSkinesisvideoGetDASHStreamingSessionURLOutput *> * _Nonnull task) {
        AWSkinesisvideoGetDASHStreamingSessionURLOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSkinesisvideoGetHLSStreamingSessionURLOutput *> *)getHLSStreamingSessionURL:(AWSkinesisvideoGetHLSStreamingSessionURLInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getHLSStreamingSessionURL"
                  targetPrefix:@""
                 operationName:@"GetHLSStreamingSessionURL"
                   outputClass:[AWSkinesisvideoGetHLSStreamingSessionURLOutput class]];
}

- (void)getHLSStreamingSessionURL:(AWSkinesisvideoGetHLSStreamingSessionURLInput *)request
     completionHandler:(void (^)(AWSkinesisvideoGetHLSStreamingSessionURLOutput *response, NSError *error))completionHandler {
    [[self getHLSStreamingSessionURL:request] continueWithBlock:^id _Nullable(AWSTask<AWSkinesisvideoGetHLSStreamingSessionURLOutput *> * _Nonnull task) {
        AWSkinesisvideoGetHLSStreamingSessionURLOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSkinesisvideoGetMediaForFragmentListOutput *> *)getMediaForFragmentList:(AWSkinesisvideoGetMediaForFragmentListInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getMediaForFragmentList"
                  targetPrefix:@""
                 operationName:@"GetMediaForFragmentList"
                   outputClass:[AWSkinesisvideoGetMediaForFragmentListOutput class]];
}

- (void)getMediaForFragmentList:(AWSkinesisvideoGetMediaForFragmentListInput *)request
     completionHandler:(void (^)(AWSkinesisvideoGetMediaForFragmentListOutput *response, NSError *error))completionHandler {
    [[self getMediaForFragmentList:request] continueWithBlock:^id _Nullable(AWSTask<AWSkinesisvideoGetMediaForFragmentListOutput *> * _Nonnull task) {
        AWSkinesisvideoGetMediaForFragmentListOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSkinesisvideoListFragmentsOutput *> *)listFragments:(AWSkinesisvideoListFragmentsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listFragments"
                  targetPrefix:@""
                 operationName:@"ListFragments"
                   outputClass:[AWSkinesisvideoListFragmentsOutput class]];
}

- (void)listFragments:(AWSkinesisvideoListFragmentsInput *)request
     completionHandler:(void (^)(AWSkinesisvideoListFragmentsOutput *response, NSError *error))completionHandler {
    [[self listFragments:request] continueWithBlock:^id _Nullable(AWSTask<AWSkinesisvideoListFragmentsOutput *> * _Nonnull task) {
        AWSkinesisvideoListFragmentsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
