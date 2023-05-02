//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
NSString *const AWSTranscribeSDKVersion = @"2.31.1";


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

- (AWSTask<AWSTranscribeCreateCallAnalyticsCategoryResponse *> *)createCallAnalyticsCategory:(AWSTranscribeCreateCallAnalyticsCategoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"CreateCallAnalyticsCategory"
                   outputClass:[AWSTranscribeCreateCallAnalyticsCategoryResponse class]];
}

- (void)createCallAnalyticsCategory:(AWSTranscribeCreateCallAnalyticsCategoryRequest *)request
     completionHandler:(void (^)(AWSTranscribeCreateCallAnalyticsCategoryResponse *response, NSError *error))completionHandler {
    [[self createCallAnalyticsCategory:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeCreateCallAnalyticsCategoryResponse *> * _Nonnull task) {
        AWSTranscribeCreateCallAnalyticsCategoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeCreateLanguageModelResponse *> *)createLanguageModel:(AWSTranscribeCreateLanguageModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"CreateLanguageModel"
                   outputClass:[AWSTranscribeCreateLanguageModelResponse class]];
}

- (void)createLanguageModel:(AWSTranscribeCreateLanguageModelRequest *)request
     completionHandler:(void (^)(AWSTranscribeCreateLanguageModelResponse *response, NSError *error))completionHandler {
    [[self createLanguageModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeCreateLanguageModelResponse *> * _Nonnull task) {
        AWSTranscribeCreateLanguageModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeCreateMedicalVocabularyResponse *> *)createMedicalVocabulary:(AWSTranscribeCreateMedicalVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"CreateMedicalVocabulary"
                   outputClass:[AWSTranscribeCreateMedicalVocabularyResponse class]];
}

- (void)createMedicalVocabulary:(AWSTranscribeCreateMedicalVocabularyRequest *)request
     completionHandler:(void (^)(AWSTranscribeCreateMedicalVocabularyResponse *response, NSError *error))completionHandler {
    [[self createMedicalVocabulary:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeCreateMedicalVocabularyResponse *> * _Nonnull task) {
        AWSTranscribeCreateMedicalVocabularyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

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

- (AWSTask<AWSTranscribeDeleteCallAnalyticsCategoryResponse *> *)deleteCallAnalyticsCategory:(AWSTranscribeDeleteCallAnalyticsCategoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"DeleteCallAnalyticsCategory"
                   outputClass:[AWSTranscribeDeleteCallAnalyticsCategoryResponse class]];
}

- (void)deleteCallAnalyticsCategory:(AWSTranscribeDeleteCallAnalyticsCategoryRequest *)request
     completionHandler:(void (^)(AWSTranscribeDeleteCallAnalyticsCategoryResponse *response, NSError *error))completionHandler {
    [[self deleteCallAnalyticsCategory:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeDeleteCallAnalyticsCategoryResponse *> * _Nonnull task) {
        AWSTranscribeDeleteCallAnalyticsCategoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeDeleteCallAnalyticsJobResponse *> *)deleteCallAnalyticsJob:(AWSTranscribeDeleteCallAnalyticsJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"DeleteCallAnalyticsJob"
                   outputClass:[AWSTranscribeDeleteCallAnalyticsJobResponse class]];
}

- (void)deleteCallAnalyticsJob:(AWSTranscribeDeleteCallAnalyticsJobRequest *)request
     completionHandler:(void (^)(AWSTranscribeDeleteCallAnalyticsJobResponse *response, NSError *error))completionHandler {
    [[self deleteCallAnalyticsJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeDeleteCallAnalyticsJobResponse *> * _Nonnull task) {
        AWSTranscribeDeleteCallAnalyticsJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteLanguageModel:(AWSTranscribeDeleteLanguageModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"DeleteLanguageModel"
                   outputClass:nil];
}

- (void)deleteLanguageModel:(AWSTranscribeDeleteLanguageModelRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteLanguageModel:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteMedicalTranscriptionJob:(AWSTranscribeDeleteMedicalTranscriptionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"DeleteMedicalTranscriptionJob"
                   outputClass:nil];
}

- (void)deleteMedicalTranscriptionJob:(AWSTranscribeDeleteMedicalTranscriptionJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteMedicalTranscriptionJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteMedicalVocabulary:(AWSTranscribeDeleteMedicalVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"DeleteMedicalVocabulary"
                   outputClass:nil];
}

- (void)deleteMedicalVocabulary:(AWSTranscribeDeleteMedicalVocabularyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteMedicalVocabulary:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
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

- (AWSTask<AWSTranscribeDescribeLanguageModelResponse *> *)describeLanguageModel:(AWSTranscribeDescribeLanguageModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"DescribeLanguageModel"
                   outputClass:[AWSTranscribeDescribeLanguageModelResponse class]];
}

- (void)describeLanguageModel:(AWSTranscribeDescribeLanguageModelRequest *)request
     completionHandler:(void (^)(AWSTranscribeDescribeLanguageModelResponse *response, NSError *error))completionHandler {
    [[self describeLanguageModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeDescribeLanguageModelResponse *> * _Nonnull task) {
        AWSTranscribeDescribeLanguageModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeGetCallAnalyticsCategoryResponse *> *)getCallAnalyticsCategory:(AWSTranscribeGetCallAnalyticsCategoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"GetCallAnalyticsCategory"
                   outputClass:[AWSTranscribeGetCallAnalyticsCategoryResponse class]];
}

- (void)getCallAnalyticsCategory:(AWSTranscribeGetCallAnalyticsCategoryRequest *)request
     completionHandler:(void (^)(AWSTranscribeGetCallAnalyticsCategoryResponse *response, NSError *error))completionHandler {
    [[self getCallAnalyticsCategory:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeGetCallAnalyticsCategoryResponse *> * _Nonnull task) {
        AWSTranscribeGetCallAnalyticsCategoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeGetCallAnalyticsJobResponse *> *)getCallAnalyticsJob:(AWSTranscribeGetCallAnalyticsJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"GetCallAnalyticsJob"
                   outputClass:[AWSTranscribeGetCallAnalyticsJobResponse class]];
}

- (void)getCallAnalyticsJob:(AWSTranscribeGetCallAnalyticsJobRequest *)request
     completionHandler:(void (^)(AWSTranscribeGetCallAnalyticsJobResponse *response, NSError *error))completionHandler {
    [[self getCallAnalyticsJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeGetCallAnalyticsJobResponse *> * _Nonnull task) {
        AWSTranscribeGetCallAnalyticsJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeGetMedicalTranscriptionJobResponse *> *)getMedicalTranscriptionJob:(AWSTranscribeGetMedicalTranscriptionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"GetMedicalTranscriptionJob"
                   outputClass:[AWSTranscribeGetMedicalTranscriptionJobResponse class]];
}

- (void)getMedicalTranscriptionJob:(AWSTranscribeGetMedicalTranscriptionJobRequest *)request
     completionHandler:(void (^)(AWSTranscribeGetMedicalTranscriptionJobResponse *response, NSError *error))completionHandler {
    [[self getMedicalTranscriptionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeGetMedicalTranscriptionJobResponse *> * _Nonnull task) {
        AWSTranscribeGetMedicalTranscriptionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeGetMedicalVocabularyResponse *> *)getMedicalVocabulary:(AWSTranscribeGetMedicalVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"GetMedicalVocabulary"
                   outputClass:[AWSTranscribeGetMedicalVocabularyResponse class]];
}

- (void)getMedicalVocabulary:(AWSTranscribeGetMedicalVocabularyRequest *)request
     completionHandler:(void (^)(AWSTranscribeGetMedicalVocabularyResponse *response, NSError *error))completionHandler {
    [[self getMedicalVocabulary:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeGetMedicalVocabularyResponse *> * _Nonnull task) {
        AWSTranscribeGetMedicalVocabularyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

- (AWSTask<AWSTranscribeListCallAnalyticsCategoriesResponse *> *)listCallAnalyticsCategories:(AWSTranscribeListCallAnalyticsCategoriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"ListCallAnalyticsCategories"
                   outputClass:[AWSTranscribeListCallAnalyticsCategoriesResponse class]];
}

- (void)listCallAnalyticsCategories:(AWSTranscribeListCallAnalyticsCategoriesRequest *)request
     completionHandler:(void (^)(AWSTranscribeListCallAnalyticsCategoriesResponse *response, NSError *error))completionHandler {
    [[self listCallAnalyticsCategories:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeListCallAnalyticsCategoriesResponse *> * _Nonnull task) {
        AWSTranscribeListCallAnalyticsCategoriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeListCallAnalyticsJobsResponse *> *)listCallAnalyticsJobs:(AWSTranscribeListCallAnalyticsJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"ListCallAnalyticsJobs"
                   outputClass:[AWSTranscribeListCallAnalyticsJobsResponse class]];
}

- (void)listCallAnalyticsJobs:(AWSTranscribeListCallAnalyticsJobsRequest *)request
     completionHandler:(void (^)(AWSTranscribeListCallAnalyticsJobsResponse *response, NSError *error))completionHandler {
    [[self listCallAnalyticsJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeListCallAnalyticsJobsResponse *> * _Nonnull task) {
        AWSTranscribeListCallAnalyticsJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeListLanguageModelsResponse *> *)listLanguageModels:(AWSTranscribeListLanguageModelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"ListLanguageModels"
                   outputClass:[AWSTranscribeListLanguageModelsResponse class]];
}

- (void)listLanguageModels:(AWSTranscribeListLanguageModelsRequest *)request
     completionHandler:(void (^)(AWSTranscribeListLanguageModelsResponse *response, NSError *error))completionHandler {
    [[self listLanguageModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeListLanguageModelsResponse *> * _Nonnull task) {
        AWSTranscribeListLanguageModelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeListMedicalTranscriptionJobsResponse *> *)listMedicalTranscriptionJobs:(AWSTranscribeListMedicalTranscriptionJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"ListMedicalTranscriptionJobs"
                   outputClass:[AWSTranscribeListMedicalTranscriptionJobsResponse class]];
}

- (void)listMedicalTranscriptionJobs:(AWSTranscribeListMedicalTranscriptionJobsRequest *)request
     completionHandler:(void (^)(AWSTranscribeListMedicalTranscriptionJobsResponse *response, NSError *error))completionHandler {
    [[self listMedicalTranscriptionJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeListMedicalTranscriptionJobsResponse *> * _Nonnull task) {
        AWSTranscribeListMedicalTranscriptionJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeListMedicalVocabulariesResponse *> *)listMedicalVocabularies:(AWSTranscribeListMedicalVocabulariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"ListMedicalVocabularies"
                   outputClass:[AWSTranscribeListMedicalVocabulariesResponse class]];
}

- (void)listMedicalVocabularies:(AWSTranscribeListMedicalVocabulariesRequest *)request
     completionHandler:(void (^)(AWSTranscribeListMedicalVocabulariesResponse *response, NSError *error))completionHandler {
    [[self listMedicalVocabularies:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeListMedicalVocabulariesResponse *> * _Nonnull task) {
        AWSTranscribeListMedicalVocabulariesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeListTagsForResourceResponse *> *)listTagsForResource:(AWSTranscribeListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSTranscribeListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSTranscribeListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSTranscribeListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeListTagsForResourceResponse *> * _Nonnull task) {
        AWSTranscribeListTagsForResourceResponse *result = task.result;
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

- (AWSTask<AWSTranscribeStartCallAnalyticsJobResponse *> *)startCallAnalyticsJob:(AWSTranscribeStartCallAnalyticsJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"StartCallAnalyticsJob"
                   outputClass:[AWSTranscribeStartCallAnalyticsJobResponse class]];
}

- (void)startCallAnalyticsJob:(AWSTranscribeStartCallAnalyticsJobRequest *)request
     completionHandler:(void (^)(AWSTranscribeStartCallAnalyticsJobResponse *response, NSError *error))completionHandler {
    [[self startCallAnalyticsJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeStartCallAnalyticsJobResponse *> * _Nonnull task) {
        AWSTranscribeStartCallAnalyticsJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeStartMedicalTranscriptionJobResponse *> *)startMedicalTranscriptionJob:(AWSTranscribeStartMedicalTranscriptionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"StartMedicalTranscriptionJob"
                   outputClass:[AWSTranscribeStartMedicalTranscriptionJobResponse class]];
}

- (void)startMedicalTranscriptionJob:(AWSTranscribeStartMedicalTranscriptionJobRequest *)request
     completionHandler:(void (^)(AWSTranscribeStartMedicalTranscriptionJobResponse *response, NSError *error))completionHandler {
    [[self startMedicalTranscriptionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeStartMedicalTranscriptionJobResponse *> * _Nonnull task) {
        AWSTranscribeStartMedicalTranscriptionJobResponse *result = task.result;
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

- (AWSTask<AWSTranscribeTagResourceResponse *> *)tagResource:(AWSTranscribeTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"TagResource"
                   outputClass:[AWSTranscribeTagResourceResponse class]];
}

- (void)tagResource:(AWSTranscribeTagResourceRequest *)request
     completionHandler:(void (^)(AWSTranscribeTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeTagResourceResponse *> * _Nonnull task) {
        AWSTranscribeTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeUntagResourceResponse *> *)untagResource:(AWSTranscribeUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"UntagResource"
                   outputClass:[AWSTranscribeUntagResourceResponse class]];
}

- (void)untagResource:(AWSTranscribeUntagResourceRequest *)request
     completionHandler:(void (^)(AWSTranscribeUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeUntagResourceResponse *> * _Nonnull task) {
        AWSTranscribeUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeUpdateCallAnalyticsCategoryResponse *> *)updateCallAnalyticsCategory:(AWSTranscribeUpdateCallAnalyticsCategoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"UpdateCallAnalyticsCategory"
                   outputClass:[AWSTranscribeUpdateCallAnalyticsCategoryResponse class]];
}

- (void)updateCallAnalyticsCategory:(AWSTranscribeUpdateCallAnalyticsCategoryRequest *)request
     completionHandler:(void (^)(AWSTranscribeUpdateCallAnalyticsCategoryResponse *response, NSError *error))completionHandler {
    [[self updateCallAnalyticsCategory:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeUpdateCallAnalyticsCategoryResponse *> * _Nonnull task) {
        AWSTranscribeUpdateCallAnalyticsCategoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranscribeUpdateMedicalVocabularyResponse *> *)updateMedicalVocabulary:(AWSTranscribeUpdateMedicalVocabularyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Transcribe"
                 operationName:@"UpdateMedicalVocabulary"
                   outputClass:[AWSTranscribeUpdateMedicalVocabularyResponse class]];
}

- (void)updateMedicalVocabulary:(AWSTranscribeUpdateMedicalVocabularyRequest *)request
     completionHandler:(void (^)(AWSTranscribeUpdateMedicalVocabularyResponse *response, NSError *error))completionHandler {
    [[self updateMedicalVocabulary:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranscribeUpdateMedicalVocabularyResponse *> * _Nonnull task) {
        AWSTranscribeUpdateMedicalVocabularyResponse *result = task.result;
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
