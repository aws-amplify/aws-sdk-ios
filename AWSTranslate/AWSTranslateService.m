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

#import "AWSTranslateService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSTranslateResources.h"

static NSString *const AWSInfoTranslate = @"Translate";
NSString *const AWSTranslateSDKVersion = @"2.13.2";


@interface AWSTranslateResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSTranslateResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"DetectedLanguageLowConfidenceException" : @(AWSTranslateErrorDetectedLanguageLowConfidence),
                            @"InternalServerException" : @(AWSTranslateErrorInternalServer),
                            @"InvalidFilterException" : @(AWSTranslateErrorInvalidFilter),
                            @"InvalidParameterValueException" : @(AWSTranslateErrorInvalidParameterValue),
                            @"InvalidRequestException" : @(AWSTranslateErrorInvalidRequest),
                            @"LimitExceededException" : @(AWSTranslateErrorLimitExceeded),
                            @"ResourceNotFoundException" : @(AWSTranslateErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSTranslateErrorServiceUnavailable),
                            @"TextSizeLimitExceededException" : @(AWSTranslateErrorTextSizeLimitExceeded),
                            @"TooManyRequestsException" : @(AWSTranslateErrorTooManyRequests),
                            @"UnsupportedLanguagePairException" : @(AWSTranslateErrorUnsupportedLanguagePair),
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
	                *error = [NSError errorWithDomain:AWSTranslateErrorDomain
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
        *error = [NSError errorWithDomain:AWSTranslateErrorDomain
                                     code:AWSTranslateErrorUnknown
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

@interface AWSTranslateRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSTranslateRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSTranslate()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSTranslate

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSTranslateSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSTranslate versions need to match. Check your SDK installation. AWSCore: %@ AWSTranslate: %@", AWSiOSSDKVersion, AWSTranslateSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultTranslate {
    static AWSTranslate *_defaultTranslate = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoTranslate];
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
        _defaultTranslate = [[AWSTranslate alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultTranslate;
}

+ (void)registerTranslateWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSTranslate alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)TranslateForKey:(NSString *)key {
    @synchronized(self) {
        AWSTranslate *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoTranslate
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSTranslate registerTranslateWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeTranslateForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultTranslate` or `+ TranslateForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceTranslate
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceTranslate];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSTranslateRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSTranslateResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSTranslateResponseSerializer alloc] initWithJSONDefinition:[[AWSTranslateResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)deleteTerminology:(AWSTranslateDeleteTerminologyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShineFrontendService_20170701"
                 operationName:@"DeleteTerminology"
                   outputClass:nil];
}

- (void)deleteTerminology:(AWSTranslateDeleteTerminologyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteTerminology:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranslateDescribeTextTranslationJobResponse *> *)describeTextTranslationJob:(AWSTranslateDescribeTextTranslationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShineFrontendService_20170701"
                 operationName:@"DescribeTextTranslationJob"
                   outputClass:[AWSTranslateDescribeTextTranslationJobResponse class]];
}

- (void)describeTextTranslationJob:(AWSTranslateDescribeTextTranslationJobRequest *)request
     completionHandler:(void (^)(AWSTranslateDescribeTextTranslationJobResponse *response, NSError *error))completionHandler {
    [[self describeTextTranslationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranslateDescribeTextTranslationJobResponse *> * _Nonnull task) {
        AWSTranslateDescribeTextTranslationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranslateGetTerminologyResponse *> *)getTerminology:(AWSTranslateGetTerminologyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShineFrontendService_20170701"
                 operationName:@"GetTerminology"
                   outputClass:[AWSTranslateGetTerminologyResponse class]];
}

- (void)getTerminology:(AWSTranslateGetTerminologyRequest *)request
     completionHandler:(void (^)(AWSTranslateGetTerminologyResponse *response, NSError *error))completionHandler {
    [[self getTerminology:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranslateGetTerminologyResponse *> * _Nonnull task) {
        AWSTranslateGetTerminologyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranslateImportTerminologyResponse *> *)importTerminology:(AWSTranslateImportTerminologyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShineFrontendService_20170701"
                 operationName:@"ImportTerminology"
                   outputClass:[AWSTranslateImportTerminologyResponse class]];
}

- (void)importTerminology:(AWSTranslateImportTerminologyRequest *)request
     completionHandler:(void (^)(AWSTranslateImportTerminologyResponse *response, NSError *error))completionHandler {
    [[self importTerminology:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranslateImportTerminologyResponse *> * _Nonnull task) {
        AWSTranslateImportTerminologyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranslateListTerminologiesResponse *> *)listTerminologies:(AWSTranslateListTerminologiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShineFrontendService_20170701"
                 operationName:@"ListTerminologies"
                   outputClass:[AWSTranslateListTerminologiesResponse class]];
}

- (void)listTerminologies:(AWSTranslateListTerminologiesRequest *)request
     completionHandler:(void (^)(AWSTranslateListTerminologiesResponse *response, NSError *error))completionHandler {
    [[self listTerminologies:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranslateListTerminologiesResponse *> * _Nonnull task) {
        AWSTranslateListTerminologiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranslateListTextTranslationJobsResponse *> *)listTextTranslationJobs:(AWSTranslateListTextTranslationJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShineFrontendService_20170701"
                 operationName:@"ListTextTranslationJobs"
                   outputClass:[AWSTranslateListTextTranslationJobsResponse class]];
}

- (void)listTextTranslationJobs:(AWSTranslateListTextTranslationJobsRequest *)request
     completionHandler:(void (^)(AWSTranslateListTextTranslationJobsResponse *response, NSError *error))completionHandler {
    [[self listTextTranslationJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranslateListTextTranslationJobsResponse *> * _Nonnull task) {
        AWSTranslateListTextTranslationJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranslateStartTextTranslationJobResponse *> *)startTextTranslationJob:(AWSTranslateStartTextTranslationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShineFrontendService_20170701"
                 operationName:@"StartTextTranslationJob"
                   outputClass:[AWSTranslateStartTextTranslationJobResponse class]];
}

- (void)startTextTranslationJob:(AWSTranslateStartTextTranslationJobRequest *)request
     completionHandler:(void (^)(AWSTranslateStartTextTranslationJobResponse *response, NSError *error))completionHandler {
    [[self startTextTranslationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranslateStartTextTranslationJobResponse *> * _Nonnull task) {
        AWSTranslateStartTextTranslationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranslateStopTextTranslationJobResponse *> *)stopTextTranslationJob:(AWSTranslateStopTextTranslationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShineFrontendService_20170701"
                 operationName:@"StopTextTranslationJob"
                   outputClass:[AWSTranslateStopTextTranslationJobResponse class]];
}

- (void)stopTextTranslationJob:(AWSTranslateStopTextTranslationJobRequest *)request
     completionHandler:(void (^)(AWSTranslateStopTextTranslationJobResponse *response, NSError *error))completionHandler {
    [[self stopTextTranslationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranslateStopTextTranslationJobResponse *> * _Nonnull task) {
        AWSTranslateStopTextTranslationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTranslateTranslateTextResponse *> *)translateText:(AWSTranslateTranslateTextRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShineFrontendService_20170701"
                 operationName:@"TranslateText"
                   outputClass:[AWSTranslateTranslateTextResponse class]];
}

- (void)translateText:(AWSTranslateTranslateTextRequest *)request
     completionHandler:(void (^)(AWSTranslateTranslateTextResponse *response, NSError *error))completionHandler {
    [[self translateText:request] continueWithBlock:^id _Nullable(AWSTask<AWSTranslateTranslateTextResponse *> * _Nonnull task) {
        AWSTranslateTranslateTextResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
