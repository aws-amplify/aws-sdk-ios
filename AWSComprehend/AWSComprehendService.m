//
// Copyright 2010-2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSComprehendService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSComprehendResources.h"

static NSString *const AWSInfoComprehend = @"Comprehend";
static NSString *const AWSComprehendSDKVersion = @"2.6.25";


@interface AWSComprehendResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSComprehendResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BatchSizeLimitExceededException" : @(AWSComprehendErrorBatchSizeLimitExceeded),
                            @"InternalServerException" : @(AWSComprehendErrorInternalServer),
                            @"InvalidFilterException" : @(AWSComprehendErrorInvalidFilter),
                            @"InvalidRequestException" : @(AWSComprehendErrorInvalidRequest),
                            @"JobNotFoundException" : @(AWSComprehendErrorJobNotFound),
                            @"TextSizeLimitExceededException" : @(AWSComprehendErrorTextSizeLimitExceeded),
                            @"TooManyRequestsException" : @(AWSComprehendErrorTooManyRequests),
                            @"UnsupportedLanguageException" : @(AWSComprehendErrorUnsupportedLanguage),
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
	                *error = [NSError errorWithDomain:AWSComprehendErrorDomain
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
        *error = [NSError errorWithDomain:AWSComprehendErrorDomain
                                     code:AWSComprehendErrorUnknown
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

@interface AWSComprehendRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSComprehendRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSComprehend()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSComprehend

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSComprehendSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSComprehend versions need to match. Check your SDK installation. AWSCore: %@ AWSComprehend: %@", AWSiOSSDKVersion, AWSComprehendSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultComprehend {
    static AWSComprehend *_defaultComprehend = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoComprehend];
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
        _defaultComprehend = [[AWSComprehend alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultComprehend;
}

+ (void)registerComprehendWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSComprehend alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ComprehendForKey:(NSString *)key {
    @synchronized(self) {
        AWSComprehend *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoComprehend
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSComprehend registerComprehendWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeComprehendForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultComprehend` or `+ ComprehendForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceComprehend
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceComprehend];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSComprehendRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSComprehendResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSComprehendResponseSerializer alloc] initWithJSONDefinition:[[AWSComprehendResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSComprehendBatchDetectDominantLanguageResponse *> *)batchDetectDominantLanguage:(AWSComprehendBatchDetectDominantLanguageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"BatchDetectDominantLanguage"
                   outputClass:[AWSComprehendBatchDetectDominantLanguageResponse class]];
}

- (void)batchDetectDominantLanguage:(AWSComprehendBatchDetectDominantLanguageRequest *)request
     completionHandler:(void (^)(AWSComprehendBatchDetectDominantLanguageResponse *response, NSError *error))completionHandler {
    [[self batchDetectDominantLanguage:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendBatchDetectDominantLanguageResponse *> * _Nonnull task) {
        AWSComprehendBatchDetectDominantLanguageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendBatchDetectEntitiesResponse *> *)batchDetectEntities:(AWSComprehendBatchDetectEntitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"BatchDetectEntities"
                   outputClass:[AWSComprehendBatchDetectEntitiesResponse class]];
}

- (void)batchDetectEntities:(AWSComprehendBatchDetectEntitiesRequest *)request
     completionHandler:(void (^)(AWSComprehendBatchDetectEntitiesResponse *response, NSError *error))completionHandler {
    [[self batchDetectEntities:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendBatchDetectEntitiesResponse *> * _Nonnull task) {
        AWSComprehendBatchDetectEntitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendBatchDetectKeyPhrasesResponse *> *)batchDetectKeyPhrases:(AWSComprehendBatchDetectKeyPhrasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"BatchDetectKeyPhrases"
                   outputClass:[AWSComprehendBatchDetectKeyPhrasesResponse class]];
}

- (void)batchDetectKeyPhrases:(AWSComprehendBatchDetectKeyPhrasesRequest *)request
     completionHandler:(void (^)(AWSComprehendBatchDetectKeyPhrasesResponse *response, NSError *error))completionHandler {
    [[self batchDetectKeyPhrases:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendBatchDetectKeyPhrasesResponse *> * _Nonnull task) {
        AWSComprehendBatchDetectKeyPhrasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendBatchDetectSentimentResponse *> *)batchDetectSentiment:(AWSComprehendBatchDetectSentimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"BatchDetectSentiment"
                   outputClass:[AWSComprehendBatchDetectSentimentResponse class]];
}

- (void)batchDetectSentiment:(AWSComprehendBatchDetectSentimentRequest *)request
     completionHandler:(void (^)(AWSComprehendBatchDetectSentimentResponse *response, NSError *error))completionHandler {
    [[self batchDetectSentiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendBatchDetectSentimentResponse *> * _Nonnull task) {
        AWSComprehendBatchDetectSentimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDescribeTopicsDetectionJobResponse *> *)describeTopicsDetectionJob:(AWSComprehendDescribeTopicsDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DescribeTopicsDetectionJob"
                   outputClass:[AWSComprehendDescribeTopicsDetectionJobResponse class]];
}

- (void)describeTopicsDetectionJob:(AWSComprehendDescribeTopicsDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendDescribeTopicsDetectionJobResponse *response, NSError *error))completionHandler {
    [[self describeTopicsDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDescribeTopicsDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendDescribeTopicsDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDetectDominantLanguageResponse *> *)detectDominantLanguage:(AWSComprehendDetectDominantLanguageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DetectDominantLanguage"
                   outputClass:[AWSComprehendDetectDominantLanguageResponse class]];
}

- (void)detectDominantLanguage:(AWSComprehendDetectDominantLanguageRequest *)request
     completionHandler:(void (^)(AWSComprehendDetectDominantLanguageResponse *response, NSError *error))completionHandler {
    [[self detectDominantLanguage:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDetectDominantLanguageResponse *> * _Nonnull task) {
        AWSComprehendDetectDominantLanguageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDetectEntitiesResponse *> *)detectEntities:(AWSComprehendDetectEntitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DetectEntities"
                   outputClass:[AWSComprehendDetectEntitiesResponse class]];
}

- (void)detectEntities:(AWSComprehendDetectEntitiesRequest *)request
     completionHandler:(void (^)(AWSComprehendDetectEntitiesResponse *response, NSError *error))completionHandler {
    [[self detectEntities:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDetectEntitiesResponse *> * _Nonnull task) {
        AWSComprehendDetectEntitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDetectKeyPhrasesResponse *> *)detectKeyPhrases:(AWSComprehendDetectKeyPhrasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DetectKeyPhrases"
                   outputClass:[AWSComprehendDetectKeyPhrasesResponse class]];
}

- (void)detectKeyPhrases:(AWSComprehendDetectKeyPhrasesRequest *)request
     completionHandler:(void (^)(AWSComprehendDetectKeyPhrasesResponse *response, NSError *error))completionHandler {
    [[self detectKeyPhrases:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDetectKeyPhrasesResponse *> * _Nonnull task) {
        AWSComprehendDetectKeyPhrasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDetectSentimentResponse *> *)detectSentiment:(AWSComprehendDetectSentimentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DetectSentiment"
                   outputClass:[AWSComprehendDetectSentimentResponse class]];
}

- (void)detectSentiment:(AWSComprehendDetectSentimentRequest *)request
     completionHandler:(void (^)(AWSComprehendDetectSentimentResponse *response, NSError *error))completionHandler {
    [[self detectSentiment:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDetectSentimentResponse *> * _Nonnull task) {
        AWSComprehendDetectSentimentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendListTopicsDetectionJobsResponse *> *)listTopicsDetectionJobs:(AWSComprehendListTopicsDetectionJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ListTopicsDetectionJobs"
                   outputClass:[AWSComprehendListTopicsDetectionJobsResponse class]];
}

- (void)listTopicsDetectionJobs:(AWSComprehendListTopicsDetectionJobsRequest *)request
     completionHandler:(void (^)(AWSComprehendListTopicsDetectionJobsResponse *response, NSError *error))completionHandler {
    [[self listTopicsDetectionJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendListTopicsDetectionJobsResponse *> * _Nonnull task) {
        AWSComprehendListTopicsDetectionJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendStartTopicsDetectionJobResponse *> *)startTopicsDetectionJob:(AWSComprehendStartTopicsDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StartTopicsDetectionJob"
                   outputClass:[AWSComprehendStartTopicsDetectionJobResponse class]];
}

- (void)startTopicsDetectionJob:(AWSComprehendStartTopicsDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendStartTopicsDetectionJobResponse *response, NSError *error))completionHandler {
    [[self startTopicsDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStartTopicsDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendStartTopicsDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
