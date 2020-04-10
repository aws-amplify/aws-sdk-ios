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

#import "AWSTranscribeService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSTranscribeResources.h"

static NSString *const AWSInfoTranscribe = @"Transcribe";
NSString *const AWSTranscribeSDKVersion = @"2.13.2";


@interface AWSTranscribeResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSTranscribeResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSTranscribeErrorBadRequest),
                            @"ConflictException" : @(AWSTranscribeErrorConflict),
                            @"InternalFailureException" : @(AWSTranscribeErrorInternalFailure),
                            @"LimitExceededException" : @(AWSTranscribeErrorLimitExceeded),
                            @"NotFoundException" : @(AWSTranscribeErrorNotFound),
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
    	if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
	        if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSTranscribeErrorDomain
	                                             code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        } else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSCognitoIdentityErrorDomain
	                                             code:AWSCognitoIdentityErrorUnknown
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        }
    	}
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSTranscribeErrorDomain
                                     code:AWSTranscribeErrorUnknown
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

@interface AWSTranscribeRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSTranscribeRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSTranscribe()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSTranscribe

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSTranscribeSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSTranscribe versions need to match. Check your SDK installation. AWSCore: %@ AWSTranscribe: %@", AWSiOSSDKVersion, AWSTranscribeSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultTranscribe {
    static AWSTranscribe *_defaultTranscribe = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoTranscribe];
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
        _defaultTranscribe = [[AWSTranscribe alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultTranscribe;
}

+ (void)registerTranscribeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSTranscribe alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)TranscribeForKey:(NSString *)key {
    @synchronized(self) {
        AWSTranscribe *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoTranscribe
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSTranscribe registerTranscribeWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeTranscribeForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultTranscribe` or `+ TranscribeForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceTranscribe
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceTranscribe];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSTranscribeRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

		NSMutableDictionary *headers = [NSMutableDictionary new];
        headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
        networkingRequest.headers = headers;
        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSTranscribeResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSTranscribeResponseSerializer alloc] initWithJSONDefinition:[[AWSTranscribeResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSTranscribeCreateVocabularyResponse *> *)createVocabulary:(AWSTranscribeCreateVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"CreateVocabulary"
                   outputClass:[AWSTranscribeCreateVocabularyResponse class]];
}

- (void)createVocabulary:(AWSTranscribeCreateVocabularyRequest *)request
     completionHandler:(void (^)(AWSTranscribeCreateVocabularyResponse *response, NSError *error))completionHandler {
    [[self createVocabulary:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeCreateVocabularyResponse *> * _Nonnull task) {
        AWSTranscribeCreateVocabularyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeCreateVocabularyFilterResponse *> *)createVocabularyFilter:(AWSTranscribeCreateVocabularyFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"CreateVocabularyFilter"
                   outputClass:[AWSTranscribeCreateVocabularyFilterResponse class]];
}

- (void)createVocabularyFilter:(AWSTranscribeCreateVocabularyFilterRequest *)request
     completionHandler:(void (^)(AWSTranscribeCreateVocabularyFilterResponse *response, NSError *error))completionHandler {
    [[self createVocabularyFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeCreateVocabularyFilterResponse *> * _Nonnull task) {
        AWSTranscribeCreateVocabularyFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteTranscriptionJob:(AWSTranscribeDeleteTranscriptionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"DeleteTranscriptionJob"
                   outputClass:nil];
}

- (void)deleteTranscriptionJob:(AWSTranscribeDeleteTranscriptionJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteTranscriptionJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVocabulary:(AWSTranscribeDeleteVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"DeleteVocabulary"
                   outputClass:nil];
}

- (void)deleteVocabulary:(AWSTranscribeDeleteVocabularyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVocabulary:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVocabularyFilter:(AWSTranscribeDeleteVocabularyFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"DeleteVocabularyFilter"
                   outputClass:nil];
}

- (void)deleteVocabularyFilter:(AWSTranscribeDeleteVocabularyFilterRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVocabularyFilter:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeGetTranscriptionJobResponse *> *)getTranscriptionJob:(AWSTranscribeGetTranscriptionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"GetTranscriptionJob"
                   outputClass:[AWSTranscribeGetTranscriptionJobResponse class]];
}

- (void)getTranscriptionJob:(AWSTranscribeGetTranscriptionJobRequest *)request
     completionHandler:(void (^)(AWSTranscribeGetTranscriptionJobResponse *response, NSError *error))completionHandler {
    [[self getTranscriptionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeGetTranscriptionJobResponse *> * _Nonnull task) {
        AWSTranscribeGetTranscriptionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeGetVocabularyResponse *> *)getVocabulary:(AWSTranscribeGetVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"GetVocabulary"
                   outputClass:[AWSTranscribeGetVocabularyResponse class]];
}

- (void)getVocabulary:(AWSTranscribeGetVocabularyRequest *)request
     completionHandler:(void (^)(AWSTranscribeGetVocabularyResponse *response, NSError *error))completionHandler {
    [[self getVocabulary:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeGetVocabularyResponse *> * _Nonnull task) {
        AWSTranscribeGetVocabularyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeGetVocabularyFilterResponse *> *)getVocabularyFilter:(AWSTranscribeGetVocabularyFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"GetVocabularyFilter"
                   outputClass:[AWSTranscribeGetVocabularyFilterResponse class]];
}

- (void)getVocabularyFilter:(AWSTranscribeGetVocabularyFilterRequest *)request
     completionHandler:(void (^)(AWSTranscribeGetVocabularyFilterResponse *response, NSError *error))completionHandler {
    [[self getVocabularyFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeGetVocabularyFilterResponse *> * _Nonnull task) {
        AWSTranscribeGetVocabularyFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeListTranscriptionJobsResponse *> *)listTranscriptionJobs:(AWSTranscribeListTranscriptionJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"ListTranscriptionJobs"
                   outputClass:[AWSTranscribeListTranscriptionJobsResponse class]];
}

- (void)listTranscriptionJobs:(AWSTranscribeListTranscriptionJobsRequest *)request
     completionHandler:(void (^)(AWSTranscribeListTranscriptionJobsResponse *response, NSError *error))completionHandler {
    [[self listTranscriptionJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeListTranscriptionJobsResponse *> * _Nonnull task) {
        AWSTranscribeListTranscriptionJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeListVocabulariesResponse *> *)listVocabularies:(AWSTranscribeListVocabulariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"ListVocabularies"
                   outputClass:[AWSTranscribeListVocabulariesResponse class]];
}

- (void)listVocabularies:(AWSTranscribeListVocabulariesRequest *)request
     completionHandler:(void (^)(AWSTranscribeListVocabulariesResponse *response, NSError *error))completionHandler {
    [[self listVocabularies:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeListVocabulariesResponse *> * _Nonnull task) {
        AWSTranscribeListVocabulariesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeListVocabularyFiltersResponse *> *)listVocabularyFilters:(AWSTranscribeListVocabularyFiltersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"ListVocabularyFilters"
                   outputClass:[AWSTranscribeListVocabularyFiltersResponse class]];
}

- (void)listVocabularyFilters:(AWSTranscribeListVocabularyFiltersRequest *)request
     completionHandler:(void (^)(AWSTranscribeListVocabularyFiltersResponse *response, NSError *error))completionHandler {
    [[self listVocabularyFilters:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeListVocabularyFiltersResponse *> * _Nonnull task) {
        AWSTranscribeListVocabularyFiltersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeStartTranscriptionJobResponse *> *)startTranscriptionJob:(AWSTranscribeStartTranscriptionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"StartTranscriptionJob"
                   outputClass:[AWSTranscribeStartTranscriptionJobResponse class]];
}

- (void)startTranscriptionJob:(AWSTranscribeStartTranscriptionJobRequest *)request
     completionHandler:(void (^)(AWSTranscribeStartTranscriptionJobResponse *response, NSError *error))completionHandler {
    [[self startTranscriptionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeStartTranscriptionJobResponse *> * _Nonnull task) {
        AWSTranscribeStartTranscriptionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeUpdateVocabularyResponse *> *)updateVocabulary:(AWSTranscribeUpdateVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"UpdateVocabulary"
                   outputClass:[AWSTranscribeUpdateVocabularyResponse class]];
}

- (void)updateVocabulary:(AWSTranscribeUpdateVocabularyRequest *)request
     completionHandler:(void (^)(AWSTranscribeUpdateVocabularyResponse *response, NSError *error))completionHandler {
    [[self updateVocabulary:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeUpdateVocabularyResponse *> * _Nonnull task) {
        AWSTranscribeUpdateVocabularyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeUpdateVocabularyFilterResponse *> *)updateVocabularyFilter:(AWSTranscribeUpdateVocabularyFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"UpdateVocabularyFilter"
                   outputClass:[AWSTranscribeUpdateVocabularyFilterResponse class]];
}

- (void)updateVocabularyFilter:(AWSTranscribeUpdateVocabularyFilterRequest *)request
     completionHandler:(void (^)(AWSTranscribeUpdateVocabularyFilterResponse *response, NSError *error))completionHandler {
    [[self updateVocabularyFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeUpdateVocabularyFilterResponse *> * _Nonnull task) {
        AWSTranscribeUpdateVocabularyFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
