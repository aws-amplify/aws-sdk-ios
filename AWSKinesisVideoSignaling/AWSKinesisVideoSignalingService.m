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

#import "AWSKinesisVideoSignalingService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSKinesisVideoSignalingResources.h"

static NSString *const AWSInfoKinesisVideoSignaling = @"KinesisVideoSignaling";
NSString *const AWSKinesisVideoSignalingSDKVersion = @"2.13.2";


@interface AWSKinesisVideoSignalingResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSKinesisVideoSignalingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ClientLimitExceededException" : @(AWSKinesisVideoSignalingErrorClientLimitExceeded),
                            @"InvalidArgumentException" : @(AWSKinesisVideoSignalingErrorInvalidArgument),
                            @"InvalidClientException" : @(AWSKinesisVideoSignalingErrorInvalidClient),
                            @"NotAuthorizedException" : @(AWSKinesisVideoSignalingErrorNotAuthorized),
                            @"ResourceNotFoundException" : @(AWSKinesisVideoSignalingErrorResourceNotFound),
                            @"SessionExpiredException" : @(AWSKinesisVideoSignalingErrorSessionExpired),
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
                    *error = [NSError errorWithDomain:AWSKinesisVideoSignalingErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSKinesisVideoSignalingErrorDomain
                                                 code:AWSKinesisVideoSignalingErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSKinesisVideoSignalingErrorDomain
                                     code:AWSKinesisVideoSignalingErrorUnknown
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

@interface AWSKinesisVideoSignalingRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSKinesisVideoSignalingRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSKinesisVideoSignaling()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSKinesisVideoSignaling

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSKinesisVideoSignalingSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSKinesisVideoSignaling versions need to match. Check your SDK installation. AWSCore: %@ AWSKinesisVideoSignaling: %@", AWSiOSSDKVersion, AWSKinesisVideoSignalingSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultKinesisVideoSignaling {
    static AWSKinesisVideoSignaling *_defaultKinesisVideoSignaling = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoKinesisVideoSignaling];
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
        _defaultKinesisVideoSignaling = [[AWSKinesisVideoSignaling alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultKinesisVideoSignaling;
}

+ (void)registerKinesisVideoSignalingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSKinesisVideoSignaling alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)KinesisVideoSignalingForKey:(NSString *)key {
    @synchronized(self) {
        AWSKinesisVideoSignaling *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoKinesisVideoSignaling
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSKinesisVideoSignaling registerKinesisVideoSignalingWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeKinesisVideoSignalingForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultKinesisVideoSignaling` or `+ KinesisVideoSignalingForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceKinesisVideoSignaling
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceKinesisVideoSignaling];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSKinesisVideoSignalingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSKinesisVideoSignalingResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSKinesisVideoSignalingResponseSerializer alloc] initWithJSONDefinition:[[AWSKinesisVideoSignalingResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSKinesisVideoSignalingGetIceServerConfigResponse *> *)getIceServerConfig:(AWSKinesisVideoSignalingGetIceServerConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/get-ice-server-config"
                  targetPrefix:@""
                 operationName:@"GetIceServerConfig"
                   outputClass:[AWSKinesisVideoSignalingGetIceServerConfigResponse class]];
}

- (void)getIceServerConfig:(AWSKinesisVideoSignalingGetIceServerConfigRequest *)request
     completionHandler:(void (^)(AWSKinesisVideoSignalingGetIceServerConfigResponse *response, NSError *error))completionHandler {
    [[self getIceServerConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoSignalingGetIceServerConfigResponse *> * _Nonnull task) {
        AWSKinesisVideoSignalingGetIceServerConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse *> *)sendAlexaOfferToMaster:(AWSKinesisVideoSignalingSendAlexaOfferToMasterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/send-alexa-offer-to-master"
                  targetPrefix:@""
                 operationName:@"SendAlexaOfferToMaster"
                   outputClass:[AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse class]];
}

- (void)sendAlexaOfferToMaster:(AWSKinesisVideoSignalingSendAlexaOfferToMasterRequest *)request
     completionHandler:(void (^)(AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse *response, NSError *error))completionHandler {
    [[self sendAlexaOfferToMaster:request] continueWithBlock:^id _Nullable(AWSTask<AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse *> * _Nonnull task) {
        AWSKinesisVideoSignalingSendAlexaOfferToMasterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
