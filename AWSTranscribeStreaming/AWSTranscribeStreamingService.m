//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSTranscribeStreamingService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSTranscribeStreamingResources.h"
#import "AWSTranscribeStreamingSignature.h"
#import "AWSTSNetworking.h"

static NSString *const AWSInfoTranscribeStreaming = @"TranscribeStreaming";
NSString *const AWSTranscribeStreamingSDKVersion = @"2.9.9";


@interface AWSTranscribeStreamingResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSTranscribeStreamingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSTranscribeStreamingErrorBadRequest),
                            @"ConflictException" : @(AWSTranscribeStreamingErrorConflict),
                            @"InternalFailureException" : @(AWSTranscribeStreamingErrorInternalFailure),
                            @"LimitExceededException" : @(AWSTranscribeStreamingErrorLimitExceeded),
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
                    *error = [NSError errorWithDomain:AWSTranscribeStreamingErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSTranscribeStreamingErrorDomain
                                                 code:AWSTranscribeStreamingErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSTranscribeStreamingErrorDomain
                                     code:AWSTranscribeStreamingErrorUnknown
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

@interface AWSTranscribeStreamingRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSTranscribeStreamingRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSTranscribeStreaming()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSTranscribeStreamingSignature *signer;
@property (nonatomic, strong) AWSSRWebSocket *webSocket;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSTranscribeStreaming

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSTranscribeStreamingSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSTranscribeStreaming versions need to match. Check your SDK installation. AWSCore: %@ AWSTranscribeStreaming: %@", AWSiOSSDKVersion, AWSTranscribeStreamingSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultTranscribeStreaming {
    static AWSTranscribeStreaming *_defaultTranscribeStreaming = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoTranscribeStreaming];
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
        _defaultTranscribeStreaming = [[AWSTranscribeStreaming alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultTranscribeStreaming;
}

+ (void)registerTranscribeStreamingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSTranscribeStreaming alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)TranscribeStreamingForKey:(NSString *)key {
    @synchronized(self) {
        AWSTranscribeStreaming *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoTranscribeStreaming
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSTranscribeStreaming registerTranscribeStreamingWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeTranscribeStreamingForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultTranscribeStreaming` or `+ TranscribeStreamingForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceTranscribeStreaming
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceTranscribeStreaming];
        }

        self.signer = [[AWSTranscribeStreamingSignature alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                                              endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSTranscribeStreamingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/vnd.amazon.eventstream",
                                   @"Transfer-Encoding" : @"",
                                   @"x-amz-content-sha256": @"STREAMING-AWS4-HMAC-SHA256-EVENTS",
                                   @"x-amz-target": @"com.amazonaws.transcribe.Transcribe.StartStreamTranscription"
                                   };
		
        AWSTSNetworking *networkInterceptor = [[AWSTSNetworking alloc] initWithConfiguration:_configuration];
        _configuration.requestInterceptors = @[baseInterceptor, self.signer, networkInterceptor];
        
        
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSTranscribeStreamingResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSTranscribeStreamingResponseSerializer alloc] initWithJSONDefinition:[[AWSTranscribeStreamingResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        
        
        
        return [self.networking sendRequest:networkingRequest];
    }
}

- (AWSSRWebSocket *)invokeRequestForWSS:(AWSRequest *)request
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSTranscribeStreamingResources sharedInstance] JSONObject]
                                                                                            actionName:operationName];
        networkingRequest.responseSerializer = [[AWSTranscribeStreamingResponseSerializer alloc] initWithJSONDefinition:[[AWSTranscribeStreamingResources sharedInstance] JSONObject]
                                                                                                             actionName:operationName
                                                                                                            outputClass:outputClass];
        
        
        
        [[[self getWebsocketForRequest:networkingRequest.parameters] continueWithBlock:^id _Nullable(AWSTask * _Nonnull t) {
            // handler error case here
            return nil;
        }] waitUntilFinished];
        
        return self.webSocket;
        
        // Use the below for HTTP2 based flow
        // return [self.networking sendRequest:networkingRequest];
        
    }
}

- (AWSTask *)getWebsocketForRequest:(NSDictionary *)requestParams {
    NSString *encoding = [requestParams valueForKey:@"MediaEncoding"];
    NSString *languageCode = [requestParams valueForKey:@"LanguageCode"];
    NSString *sampleRate = [requestParams valueForKey:@"MediaSampleRateHertz"];
    
    return [self.signer.credentialsProvider.credentials continueWithBlock:^id _Nullable(AWSTask<AWSCredentials *> * _Nonnull task) {
        
        if (task.result != nil) {
        AWSCredentials *credentials = task.result;
        NSString *websocketURL = [self.signer prepareWebSocketUrlWithHostName:[NSString stringWithFormat: @"transcribestreaming.%@.amazonaws.com:8443", self.configuration.endpoint.regionName]
                                                                   regionName:self.configuration.endpoint.regionName
                                                                    accessKey:credentials.accessKey
                                                                    secretKey:credentials.secretKey
                                                                   sessionKey:credentials.sessionKey
                                                                     encoding:encoding
                                                                 languageCode:languageCode
                                                                   sampleRate:sampleRate];
        NSLog(@"%@", websocketURL);
        
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:websocketURL]];
        
        //Create the webSocket and setup the MQTTClient object as the delegate
        self.webSocket = [[AWSSRWebSocket alloc] initWithURLRequest:urlRequest];
        self.webSocket.delegate = self.signer;
        
        //Open the web socket
        [self.webSocket open];
        
        // Now that the WebSocket is created and opened, it will send its delegate, i.e., this MQTTclient object the messages.
        AWSDDLogVerbose(@"Websocket is created and opened.");
        } else {
            // return task error if we any issue getting wss connection and object
            return [AWSTask taskWithError:[[NSError alloc]init]];
        }
        
        return [AWSTask taskWithResult:self.webSocket];
    }];
    
    
}

#pragma mark - Service method

- (AWSSRWebSocket *)startTranscriptionWSS:(AWSTranscribeStreamingStartStreamTranscriptionRequest *)request {
    return [self invokeRequestForWSS:request
                          HTTPMethod:AWSHTTPMethodPOST
                           URLString:@"/stream-transcription"
                        targetPrefix:@""
                       operationName:@"StartStreamTranscription"
                         outputClass:[AWSTranscribeStreamingStartStreamTranscriptionResponse class]];
}


@end
