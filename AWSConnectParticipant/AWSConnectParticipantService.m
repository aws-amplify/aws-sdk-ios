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

#import "AWSConnectParticipantService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSConnectParticipantResources.h"

static NSString *const AWSInfoConnectParticipant = @"ConnectParticipant";
NSString *const AWSConnectParticipantSDKVersion = @"2.13.2";


@interface AWSConnectParticipantResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSConnectParticipantResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSConnectParticipantErrorAccessDenied),
                            @"InternalServerException" : @(AWSConnectParticipantErrorInternalServer),
                            @"ThrottlingException" : @(AWSConnectParticipantErrorThrottling),
                            @"ValidationException" : @(AWSConnectParticipantErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSConnectParticipantErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSConnectParticipantErrorDomain
                                                 code:AWSConnectParticipantErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSConnectParticipantErrorDomain
                                     code:AWSConnectParticipantErrorUnknown
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

@interface AWSConnectParticipantRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSConnectParticipantRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSConnectParticipant()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSConnectParticipant

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSConnectParticipantSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSConnectParticipant versions need to match. Check your SDK installation. AWSCore: %@ AWSConnectParticipant: %@", AWSiOSSDKVersion, AWSConnectParticipantSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultConnectParticipant {
    static AWSConnectParticipant *_defaultConnectParticipant = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoConnectParticipant];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:nil];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `awsconfiguration.json`, `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultConnectParticipant = [[AWSConnectParticipant alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultConnectParticipant;
}

+ (void)registerConnectParticipantWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSConnectParticipant alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ConnectParticipantForKey:(NSString *)key {
    @synchronized(self) {
        AWSConnectParticipant *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoConnectParticipant
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:nil];
            [AWSConnectParticipant registerConnectParticipantWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeConnectParticipantForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultConnectParticipant` or `+ ConnectParticipantForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceConnectParticipant
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceConnectParticipant];
        }
       	
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSConnectParticipantRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSConnectParticipantResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSConnectParticipantResponseSerializer alloc] initWithJSONDefinition:[[AWSConnectParticipantResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSConnectParticipantCreateParticipantConnectionResponse *> *)createParticipantConnection:(AWSConnectParticipantCreateParticipantConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/participant/connection"
                  targetPrefix:@""
                 operationName:@"CreateParticipantConnection"
                   outputClass:[AWSConnectParticipantCreateParticipantConnectionResponse class]];
}

- (void)createParticipantConnection:(AWSConnectParticipantCreateParticipantConnectionRequest *)request
     completionHandler:(void (^)(AWSConnectParticipantCreateParticipantConnectionResponse *response, NSError *error))completionHandler {
    [[self createParticipantConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectParticipantCreateParticipantConnectionResponse *> * _Nonnull task) {
        AWSConnectParticipantCreateParticipantConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectParticipantDisconnectParticipantResponse *> *)disconnectParticipant:(AWSConnectParticipantDisconnectParticipantRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/participant/disconnect"
                  targetPrefix:@""
                 operationName:@"DisconnectParticipant"
                   outputClass:[AWSConnectParticipantDisconnectParticipantResponse class]];
}

- (void)disconnectParticipant:(AWSConnectParticipantDisconnectParticipantRequest *)request
     completionHandler:(void (^)(AWSConnectParticipantDisconnectParticipantResponse *response, NSError *error))completionHandler {
    [[self disconnectParticipant:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectParticipantDisconnectParticipantResponse *> * _Nonnull task) {
        AWSConnectParticipantDisconnectParticipantResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectParticipantGetTranscriptResponse *> *)getTranscript:(AWSConnectParticipantGetTranscriptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/participant/transcript"
                  targetPrefix:@""
                 operationName:@"GetTranscript"
                   outputClass:[AWSConnectParticipantGetTranscriptResponse class]];
}

- (void)getTranscript:(AWSConnectParticipantGetTranscriptRequest *)request
     completionHandler:(void (^)(AWSConnectParticipantGetTranscriptResponse *response, NSError *error))completionHandler {
    [[self getTranscript:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectParticipantGetTranscriptResponse *> * _Nonnull task) {
        AWSConnectParticipantGetTranscriptResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectParticipantSendEventResponse *> *)sendEvent:(AWSConnectParticipantSendEventRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/participant/event"
                  targetPrefix:@""
                 operationName:@"SendEvent"
                   outputClass:[AWSConnectParticipantSendEventResponse class]];
}

- (void)sendEvent:(AWSConnectParticipantSendEventRequest *)request
     completionHandler:(void (^)(AWSConnectParticipantSendEventResponse *response, NSError *error))completionHandler {
    [[self sendEvent:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectParticipantSendEventResponse *> * _Nonnull task) {
        AWSConnectParticipantSendEventResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSConnectParticipantSendMessageResponse *> *)sendMessage:(AWSConnectParticipantSendMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/participant/message"
                  targetPrefix:@""
                 operationName:@"SendMessage"
                   outputClass:[AWSConnectParticipantSendMessageResponse class]];
}

- (void)sendMessage:(AWSConnectParticipantSendMessageRequest *)request
     completionHandler:(void (^)(AWSConnectParticipantSendMessageResponse *response, NSError *error))completionHandler {
    [[self sendMessage:request] continueWithBlock:^id _Nullable(AWSTask<AWSConnectParticipantSendMessageResponse *> * _Nonnull task) {
        AWSConnectParticipantSendMessageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
