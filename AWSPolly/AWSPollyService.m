//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSPollyService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSPollyResources.h"

static NSString *const AWSInfoPolly = @"Polly";
static NSString *const AWSPollySDKVersion = @"2.5.10";


@interface AWSPollyResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSPollyResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InvalidLexiconException" : @(AWSPollyErrorInvalidLexicon),
                            @"InvalidNextTokenException" : @(AWSPollyErrorInvalidNextToken),
                            @"InvalidSampleRateException" : @(AWSPollyErrorInvalidSampleRate),
                            @"InvalidSsmlException" : @(AWSPollyErrorInvalidSsml),
                            @"LexiconNotFoundException" : @(AWSPollyErrorLexiconNotFound),
                            @"LexiconSizeExceededException" : @(AWSPollyErrorLexiconSizeExceeded),
                            @"MarksNotSupportedForFormatException" : @(AWSPollyErrorMarksNotSupportedForFormat),
                            @"MaxLexemeLengthExceededException" : @(AWSPollyErrorMaxLexemeLengthExceeded),
                            @"MaxLexiconsNumberExceededException" : @(AWSPollyErrorMaxLexiconsNumberExceeded),
                            @"ServiceFailureException" : @(AWSPollyErrorServiceFailure),
                            @"SsmlMarksNotSupportedForTextTypeException" : @(AWSPollyErrorSsmlMarksNotSupportedForTextType),
                            @"TextLengthExceededException" : @(AWSPollyErrorTextLengthExceeded),
                            @"UnsupportedPlsAlphabetException" : @(AWSPollyErrorUnsupportedPlsAlphabet),
                            @"UnsupportedPlsLanguageException" : @(AWSPollyErrorUnsupportedPlsLanguage),
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
                    *error = [NSError errorWithDomain:AWSPollyErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSPollyErrorDomain
                                                 code:AWSPollyErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSPollyErrorDomain
                                     code:AWSPollyErrorUnknown
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

@interface AWSPollyRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSPollyRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSPolly()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSPolly

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSPollySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSPolly versions need to match. Check your SDK installation. AWSCore: %@ AWSPolly: %@", AWSiOSSDKVersion, AWSPollySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultPolly {
    static AWSPolly *_defaultPolly = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoPolly];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultPolly = [[AWSPolly alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultPolly;
}

+ (void)registerPollyWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSPolly alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)PollyForKey:(NSString *)key {
    @synchronized(self) {
        AWSPolly *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoPolly
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSPolly registerPollyWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removePollyForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultPolly` or `+ PollyForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicePolly
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicePolly];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSPollyRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSPollyResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSPollyResponseSerializer alloc] initWithJSONDefinition:[[AWSPollyResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSPollyDeleteLexiconOutput *> *)deleteLexicon:(AWSPollyDeleteLexiconInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/lexicons/{LexiconName}"
                  targetPrefix:@""
                 operationName:@"DeleteLexicon"
                   outputClass:[AWSPollyDeleteLexiconOutput class]];
}

- (void)deleteLexicon:(AWSPollyDeleteLexiconInput *)request
     completionHandler:(void (^)(AWSPollyDeleteLexiconOutput *response, NSError *error))completionHandler {
    [[self deleteLexicon:request] continueWithBlock:^id _Nullable(AWSTask<AWSPollyDeleteLexiconOutput *> * _Nonnull task) {
        AWSPollyDeleteLexiconOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPollyDescribeVoicesOutput *> *)describeVoices:(AWSPollyDescribeVoicesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/voices"
                  targetPrefix:@""
                 operationName:@"DescribeVoices"
                   outputClass:[AWSPollyDescribeVoicesOutput class]];
}

- (void)describeVoices:(AWSPollyDescribeVoicesInput *)request
     completionHandler:(void (^)(AWSPollyDescribeVoicesOutput *response, NSError *error))completionHandler {
    [[self describeVoices:request] continueWithBlock:^id _Nullable(AWSTask<AWSPollyDescribeVoicesOutput *> * _Nonnull task) {
        AWSPollyDescribeVoicesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPollyGetLexiconOutput *> *)getLexicon:(AWSPollyGetLexiconInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/lexicons/{LexiconName}"
                  targetPrefix:@""
                 operationName:@"GetLexicon"
                   outputClass:[AWSPollyGetLexiconOutput class]];
}

- (void)getLexicon:(AWSPollyGetLexiconInput *)request
     completionHandler:(void (^)(AWSPollyGetLexiconOutput *response, NSError *error))completionHandler {
    [[self getLexicon:request] continueWithBlock:^id _Nullable(AWSTask<AWSPollyGetLexiconOutput *> * _Nonnull task) {
        AWSPollyGetLexiconOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPollyListLexiconsOutput *> *)listLexicons:(AWSPollyListLexiconsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/lexicons"
                  targetPrefix:@""
                 operationName:@"ListLexicons"
                   outputClass:[AWSPollyListLexiconsOutput class]];
}

- (void)listLexicons:(AWSPollyListLexiconsInput *)request
     completionHandler:(void (^)(AWSPollyListLexiconsOutput *response, NSError *error))completionHandler {
    [[self listLexicons:request] continueWithBlock:^id _Nullable(AWSTask<AWSPollyListLexiconsOutput *> * _Nonnull task) {
        AWSPollyListLexiconsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPollyPutLexiconOutput *> *)putLexicon:(AWSPollyPutLexiconInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/lexicons/{LexiconName}"
                  targetPrefix:@""
                 operationName:@"PutLexicon"
                   outputClass:[AWSPollyPutLexiconOutput class]];
}

- (void)putLexicon:(AWSPollyPutLexiconInput *)request
     completionHandler:(void (^)(AWSPollyPutLexiconOutput *response, NSError *error))completionHandler {
    [[self putLexicon:request] continueWithBlock:^id _Nullable(AWSTask<AWSPollyPutLexiconOutput *> * _Nonnull task) {
        AWSPollyPutLexiconOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPollySynthesizeSpeechOutput *> *)synthesizeSpeech:(AWSPollySynthesizeSpeechInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/speech"
                  targetPrefix:@""
                 operationName:@"SynthesizeSpeech"
                   outputClass:[AWSPollySynthesizeSpeechOutput class]];
}

- (void)synthesizeSpeech:(AWSPollySynthesizeSpeechInput *)request
     completionHandler:(void (^)(AWSPollySynthesizeSpeechOutput *response, NSError *error))completionHandler {
    [[self synthesizeSpeech:request] continueWithBlock:^id _Nullable(AWSTask<AWSPollySynthesizeSpeechOutput *> * _Nonnull task) {
        AWSPollySynthesizeSpeechOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
