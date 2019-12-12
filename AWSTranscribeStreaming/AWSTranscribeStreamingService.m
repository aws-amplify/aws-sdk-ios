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

#import "AWSTranscribeEventEncoder.h"
#import "AWSTranscribeStreamingResources.h"
#import "AWSSRWebSocketDelegateAdaptor.h"

NSString *const AWSTranscribeStreamingClientErrorDomain = @"com.amazonaws.AWSTranscribeStreamingClientErrorDomain";

static NSString *const AWSInfoTranscribeStreaming = @"TranscribeStreaming";
NSString *const AWSTranscribeStreamingSDKVersion = @"2.12.3";

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

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSTranscribeStreaming()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSSRWebSocket *webSocket;
@property (nonatomic, strong) AWSSRWebSocketDelegateAdaptor *webSocketDelegateAdaptor;

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

        if (!configuration.endpoint) {
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                                  service:AWSServiceTranscribeStreaming
                                                             useUnsafeURL:NO];
        } else {
            [_configuration.endpoint setRegion:_configuration.regionType
                                       service:AWSServiceTranscribeStreaming];
        }

        _configuration.baseURL = _configuration.endpoint.URL;

        _networking = [[AWSNetworking alloc] initWithConfiguration:_configuration];
    }
    
    return self;
}

#pragma mark - TranscribeStreaming WSS support

- (void)setDelegate:(id<AWSTranscribeStreamingClientDelegate>)delegate
      callbackQueue:(dispatch_queue_t)callbackQueue {
    AWSSRWebSocketDelegateAdaptor *adaptor = [[AWSSRWebSocketDelegateAdaptor alloc] initWithClientDelegate:delegate
                                                                                             callbackQueue:callbackQueue];

    self.webSocketDelegateAdaptor = adaptor;
    [self updateWebSocketDelegate];
}

- (void)updateWebSocketDelegate {
    if (self.webSocket && self.webSocketDelegateAdaptor) {
        [self.webSocket setDelegateDispatchQueue:self.webSocketDelegateAdaptor.callbackQueue];
        [self.webSocket setDelegate:self.webSocketDelegateAdaptor];
    }
}

// Note that this method hands off work to the global queue, to prevent potential deadlocks on the main thread while
// the presigned URL routine is attempting to get refreshed credentials. This method eventually internally invokes
// getCredentials, which can stay blocked if we need to fetch user token. Fetching user token would need to show some
// UI in the main thread, which would be a problem if this method was invoked from the main thread (which is a
// completely reasonable use case).
- (void)startTranscriptionWSS:(AWSTranscribeStreamingStartStreamTranscriptionRequest *)request {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSError *error;
        [self invokeRequestForWSS:request
                       HTTPMethod:AWSHTTPMethodPOST
                    operationName:@"StartStreamTranscription"
                      outputClass:[AWSTranscribeStreamingStartStreamTranscriptionResponse class]
                            error:&error];

        if (error) {
            NSError *wrappingError = [NSError errorWithDomain:AWSTranscribeStreamingClientErrorDomain
                                                         code:AWSTranscribeStreamingClientErrorCodeWebSocketCouldNotInitialize
                                                     userInfo:@{NSUnderlyingErrorKey: error}];

            [self.webSocketDelegateAdaptor webSocket:nil didFailWithError:wrappingError];
            return;
        }

        if (!self.webSocket) {
            error = [NSError errorWithDomain:AWSTranscribeStreamingClientErrorDomain
                                        code:AWSTranscribeStreamingClientErrorCodeWebSocketCouldNotInitialize
                                    userInfo:nil];
            [self.webSocketDelegateAdaptor webSocket:nil didFailWithError:error];
            return;
        }
    });
}

- (void)sendData:(NSData *)data headers:(NSDictionary *)headers {
    NSData *encodedChunk = [AWSTranscribeEventEncoder encodeChunk:data headers:headers];
    [self.webSocket send:encodedChunk];
}

- (void)sendEndFrame {
    NSData *endFrame = [AWSTranscribeEventEncoder getEndFrameData];
    [self.webSocket send:endFrame];
}

- (void)endTranscription {
    [self.webSocket close];
}

- (void)invokeRequestForWSS:(AWSRequest *)request
                 HTTPMethod:(AWSHTTPMethod)HTTPMethod
              operationName:(NSString *)operationName
                outputClass:(Class)outputClass
                      error:(NSError **)errorPointer {

    if (!request) {
        request = [AWSRequest new];
    }

    AWSNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[AWSMTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }

    AWSTranscribeStreamingResources *resources = [AWSTranscribeStreamingResources sharedInstance];
    NSDictionary *json = [resources JSONObject];

    networkingRequest.HTTPMethod = HTTPMethod;
    networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:json
                                                                                        actionName:operationName];
    networkingRequest.responseSerializer = [[AWSTranscribeStreamingResponseSerializer alloc] initWithJSONDefinition:json
                                                                                                         actionName:operationName
                                                                                                        outputClass:outputClass];

    __block NSError *initError;
    [[[self setUpWebsocketForRequest:networkingRequest.parameters] continueWithBlock:^id _Nullable(AWSTask * _Nonnull t) {
        if (t.error) {
            AWSDDLogError(@"Error getting web socket for request: %@", t.error);
            initError = t.error;
        }
        return nil;
    }] waitUntilFinished];

    *errorPointer = initError;
}

- (AWSTask *)setUpWebsocketForRequest:(NSDictionary *)requestParams {

    return [[self getPreSignedURL:requestParams] continueWithBlock:^id _Nullable(AWSTask<NSURL *> * _Nonnull task) {
        if (task.error != nil) {
            return [AWSTask taskWithError:task.error];
        }

        if (task.result == nil) {
            NSDictionary<NSString *, id> *userInfo = @{
                                                       NSLocalizedFailureReasonErrorKey: @"Unable to get presigned URL"
                                                       };
            NSError *error = [NSError errorWithDomain:AWSTranscribeStreamingClientErrorDomain
                                                 code:AWSTranscribeStreamingClientErrorCodeWebSocketCouldNotInitialize
                                             userInfo:userInfo];
            return [AWSTask taskWithError:error];
        }

        NSURL *websocketURL = task.result;
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:websocketURL];

        self.webSocket = [[AWSSRWebSocket alloc] initWithURLRequest:urlRequest];

        [self updateWebSocketDelegate];

        //Open the web socket
        [self.webSocket open];

        AWSDDLogDebug(@"webSocket %@ is created and opened", self.webSocket);

        return nil;
    }];
}

- (AWSTask<NSURL *> *)getPreSignedURL:(NSDictionary *)requestParams {
    return [[AWSTask taskWithResult:nil] continueWithSuccessBlock:^id _Nullable(AWSTask *task) {

        NSURLComponents *components = [[NSURLComponents alloc] init];

        components.scheme = @"wss";

        components.host = [NSString stringWithFormat:@"transcribestreaming.%@.amazonaws.com",
                           self.configuration.endpoint.regionName];

        components.port = @(8443);

        components.path = @"/stream-transcription-websocket";

        // Signer expects values of parameters dictionary to be strings or arrays of strings
        NSString *sampleRate = [NSString stringWithFormat:@"%@", [requestParams valueForKey:@"MediaSampleRateHertz"]];
        NSDictionary *parameters = @{
                                     @"media-encoding": [requestParams objectForKey:@"MediaEncoding"],
                                     @"language-code": [requestParams valueForKey:@"LanguageCode"],
                                     @"sample-rate": sampleRate
                                     };

        components.queryItems = [AWSNetworkingHelpers queryItemsFromDictionary:parameters];

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:components.URL];
        NSString *hostAndPort = [NSString stringWithFormat:@"%@:%@", components.host, components.port];
        [request setValue:hostAndPort forHTTPHeaderField:@"host"];

        id<AWSCredentialsProvider> credentialProvider = self.configuration.credentialsProvider;

        return [AWSSignatureV4Signer sigV4SignedURLWithRequest:request
                                            credentialProvider:credentialProvider
                                                    regionName:self.configuration.endpoint.regionName
                                                   serviceName:self.configuration.endpoint.serviceName
                                                          date:[NSDate aws_clockSkewFixedDate]
                                                expireDuration:300
                                                      signBody:YES
                                              signSessionToken:YES];
    }];
}

@end
