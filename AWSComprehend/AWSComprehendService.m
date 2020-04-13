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

#import "AWSComprehendService.h"
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
NSString *const AWSComprehendSDKVersion = @"2.13.2";


@interface AWSComprehendResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSComprehendResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BatchSizeLimitExceededException" : @(AWSComprehendErrorBatchSizeLimitExceeded),
                            @"ConcurrentModificationException" : @(AWSComprehendErrorConcurrentModification),
                            @"InternalServerException" : @(AWSComprehendErrorInternalServer),
                            @"InvalidFilterException" : @(AWSComprehendErrorInvalidFilter),
                            @"InvalidRequestException" : @(AWSComprehendErrorInvalidRequest),
                            @"JobNotFoundException" : @(AWSComprehendErrorJobNotFound),
                            @"KmsKeyValidationException" : @(AWSComprehendErrorKmsKeyValidation),
                            @"ResourceInUseException" : @(AWSComprehendErrorResourceInUse),
                            @"ResourceLimitExceededException" : @(AWSComprehendErrorResourceLimitExceeded),
                            @"ResourceNotFoundException" : @(AWSComprehendErrorResourceNotFound),
                            @"ResourceUnavailableException" : @(AWSComprehendErrorResourceUnavailable),
                            @"TextSizeLimitExceededException" : @(AWSComprehendErrorTextSizeLimitExceeded),
                            @"TooManyRequestsException" : @(AWSComprehendErrorTooManyRequests),
                            @"TooManyTagKeysException" : @(AWSComprehendErrorTooManyTagKeys),
                            @"TooManyTagsException" : @(AWSComprehendErrorTooManyTags),
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

- (AWSTask<AWSComprehendBatchDetectSyntaxResponse *> *)batchDetectSyntax:(AWSComprehendBatchDetectSyntaxRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"BatchDetectSyntax"
                   outputClass:[AWSComprehendBatchDetectSyntaxResponse class]];
}

- (void)batchDetectSyntax:(AWSComprehendBatchDetectSyntaxRequest *)request
     completionHandler:(void (^)(AWSComprehendBatchDetectSyntaxResponse *response, NSError *error))completionHandler {
    [[self batchDetectSyntax:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendBatchDetectSyntaxResponse *> * _Nonnull task) {
        AWSComprehendBatchDetectSyntaxResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendClassifyDocumentResponse *> *)classifyDocument:(AWSComprehendClassifyDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ClassifyDocument"
                   outputClass:[AWSComprehendClassifyDocumentResponse class]];
}

- (void)classifyDocument:(AWSComprehendClassifyDocumentRequest *)request
     completionHandler:(void (^)(AWSComprehendClassifyDocumentResponse *response, NSError *error))completionHandler {
    [[self classifyDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendClassifyDocumentResponse *> * _Nonnull task) {
        AWSComprehendClassifyDocumentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendCreateDocumentClassifierResponse *> *)createDocumentClassifier:(AWSComprehendCreateDocumentClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"CreateDocumentClassifier"
                   outputClass:[AWSComprehendCreateDocumentClassifierResponse class]];
}

- (void)createDocumentClassifier:(AWSComprehendCreateDocumentClassifierRequest *)request
     completionHandler:(void (^)(AWSComprehendCreateDocumentClassifierResponse *response, NSError *error))completionHandler {
    [[self createDocumentClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendCreateDocumentClassifierResponse *> * _Nonnull task) {
        AWSComprehendCreateDocumentClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendCreateEndpointResponse *> *)createEndpoint:(AWSComprehendCreateEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"CreateEndpoint"
                   outputClass:[AWSComprehendCreateEndpointResponse class]];
}

- (void)createEndpoint:(AWSComprehendCreateEndpointRequest *)request
     completionHandler:(void (^)(AWSComprehendCreateEndpointResponse *response, NSError *error))completionHandler {
    [[self createEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendCreateEndpointResponse *> * _Nonnull task) {
        AWSComprehendCreateEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendCreateEntityRecognizerResponse *> *)createEntityRecognizer:(AWSComprehendCreateEntityRecognizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"CreateEntityRecognizer"
                   outputClass:[AWSComprehendCreateEntityRecognizerResponse class]];
}

- (void)createEntityRecognizer:(AWSComprehendCreateEntityRecognizerRequest *)request
     completionHandler:(void (^)(AWSComprehendCreateEntityRecognizerResponse *response, NSError *error))completionHandler {
    [[self createEntityRecognizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendCreateEntityRecognizerResponse *> * _Nonnull task) {
        AWSComprehendCreateEntityRecognizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDeleteDocumentClassifierResponse *> *)deleteDocumentClassifier:(AWSComprehendDeleteDocumentClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DeleteDocumentClassifier"
                   outputClass:[AWSComprehendDeleteDocumentClassifierResponse class]];
}

- (void)deleteDocumentClassifier:(AWSComprehendDeleteDocumentClassifierRequest *)request
     completionHandler:(void (^)(AWSComprehendDeleteDocumentClassifierResponse *response, NSError *error))completionHandler {
    [[self deleteDocumentClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDeleteDocumentClassifierResponse *> * _Nonnull task) {
        AWSComprehendDeleteDocumentClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDeleteEndpointResponse *> *)deleteEndpoint:(AWSComprehendDeleteEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DeleteEndpoint"
                   outputClass:[AWSComprehendDeleteEndpointResponse class]];
}

- (void)deleteEndpoint:(AWSComprehendDeleteEndpointRequest *)request
     completionHandler:(void (^)(AWSComprehendDeleteEndpointResponse *response, NSError *error))completionHandler {
    [[self deleteEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDeleteEndpointResponse *> * _Nonnull task) {
        AWSComprehendDeleteEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDeleteEntityRecognizerResponse *> *)deleteEntityRecognizer:(AWSComprehendDeleteEntityRecognizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DeleteEntityRecognizer"
                   outputClass:[AWSComprehendDeleteEntityRecognizerResponse class]];
}

- (void)deleteEntityRecognizer:(AWSComprehendDeleteEntityRecognizerRequest *)request
     completionHandler:(void (^)(AWSComprehendDeleteEntityRecognizerResponse *response, NSError *error))completionHandler {
    [[self deleteEntityRecognizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDeleteEntityRecognizerResponse *> * _Nonnull task) {
        AWSComprehendDeleteEntityRecognizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDescribeDocumentClassificationJobResponse *> *)describeDocumentClassificationJob:(AWSComprehendDescribeDocumentClassificationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DescribeDocumentClassificationJob"
                   outputClass:[AWSComprehendDescribeDocumentClassificationJobResponse class]];
}

- (void)describeDocumentClassificationJob:(AWSComprehendDescribeDocumentClassificationJobRequest *)request
     completionHandler:(void (^)(AWSComprehendDescribeDocumentClassificationJobResponse *response, NSError *error))completionHandler {
    [[self describeDocumentClassificationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDescribeDocumentClassificationJobResponse *> * _Nonnull task) {
        AWSComprehendDescribeDocumentClassificationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDescribeDocumentClassifierResponse *> *)describeDocumentClassifier:(AWSComprehendDescribeDocumentClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DescribeDocumentClassifier"
                   outputClass:[AWSComprehendDescribeDocumentClassifierResponse class]];
}

- (void)describeDocumentClassifier:(AWSComprehendDescribeDocumentClassifierRequest *)request
     completionHandler:(void (^)(AWSComprehendDescribeDocumentClassifierResponse *response, NSError *error))completionHandler {
    [[self describeDocumentClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDescribeDocumentClassifierResponse *> * _Nonnull task) {
        AWSComprehendDescribeDocumentClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDescribeDominantLanguageDetectionJobResponse *> *)describeDominantLanguageDetectionJob:(AWSComprehendDescribeDominantLanguageDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DescribeDominantLanguageDetectionJob"
                   outputClass:[AWSComprehendDescribeDominantLanguageDetectionJobResponse class]];
}

- (void)describeDominantLanguageDetectionJob:(AWSComprehendDescribeDominantLanguageDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendDescribeDominantLanguageDetectionJobResponse *response, NSError *error))completionHandler {
    [[self describeDominantLanguageDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDescribeDominantLanguageDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendDescribeDominantLanguageDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDescribeEndpointResponse *> *)describeEndpoint:(AWSComprehendDescribeEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DescribeEndpoint"
                   outputClass:[AWSComprehendDescribeEndpointResponse class]];
}

- (void)describeEndpoint:(AWSComprehendDescribeEndpointRequest *)request
     completionHandler:(void (^)(AWSComprehendDescribeEndpointResponse *response, NSError *error))completionHandler {
    [[self describeEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDescribeEndpointResponse *> * _Nonnull task) {
        AWSComprehendDescribeEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDescribeEntitiesDetectionJobResponse *> *)describeEntitiesDetectionJob:(AWSComprehendDescribeEntitiesDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DescribeEntitiesDetectionJob"
                   outputClass:[AWSComprehendDescribeEntitiesDetectionJobResponse class]];
}

- (void)describeEntitiesDetectionJob:(AWSComprehendDescribeEntitiesDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendDescribeEntitiesDetectionJobResponse *response, NSError *error))completionHandler {
    [[self describeEntitiesDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDescribeEntitiesDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendDescribeEntitiesDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDescribeEntityRecognizerResponse *> *)describeEntityRecognizer:(AWSComprehendDescribeEntityRecognizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DescribeEntityRecognizer"
                   outputClass:[AWSComprehendDescribeEntityRecognizerResponse class]];
}

- (void)describeEntityRecognizer:(AWSComprehendDescribeEntityRecognizerRequest *)request
     completionHandler:(void (^)(AWSComprehendDescribeEntityRecognizerResponse *response, NSError *error))completionHandler {
    [[self describeEntityRecognizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDescribeEntityRecognizerResponse *> * _Nonnull task) {
        AWSComprehendDescribeEntityRecognizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDescribeKeyPhrasesDetectionJobResponse *> *)describeKeyPhrasesDetectionJob:(AWSComprehendDescribeKeyPhrasesDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DescribeKeyPhrasesDetectionJob"
                   outputClass:[AWSComprehendDescribeKeyPhrasesDetectionJobResponse class]];
}

- (void)describeKeyPhrasesDetectionJob:(AWSComprehendDescribeKeyPhrasesDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendDescribeKeyPhrasesDetectionJobResponse *response, NSError *error))completionHandler {
    [[self describeKeyPhrasesDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDescribeKeyPhrasesDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendDescribeKeyPhrasesDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendDescribeSentimentDetectionJobResponse *> *)describeSentimentDetectionJob:(AWSComprehendDescribeSentimentDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DescribeSentimentDetectionJob"
                   outputClass:[AWSComprehendDescribeSentimentDetectionJobResponse class]];
}

- (void)describeSentimentDetectionJob:(AWSComprehendDescribeSentimentDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendDescribeSentimentDetectionJobResponse *response, NSError *error))completionHandler {
    [[self describeSentimentDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDescribeSentimentDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendDescribeSentimentDetectionJobResponse *result = task.result;
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

- (AWSTask<AWSComprehendDetectSyntaxResponse *> *)detectSyntax:(AWSComprehendDetectSyntaxRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"DetectSyntax"
                   outputClass:[AWSComprehendDetectSyntaxResponse class]];
}

- (void)detectSyntax:(AWSComprehendDetectSyntaxRequest *)request
     completionHandler:(void (^)(AWSComprehendDetectSyntaxResponse *response, NSError *error))completionHandler {
    [[self detectSyntax:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendDetectSyntaxResponse *> * _Nonnull task) {
        AWSComprehendDetectSyntaxResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendListDocumentClassificationJobsResponse *> *)listDocumentClassificationJobs:(AWSComprehendListDocumentClassificationJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ListDocumentClassificationJobs"
                   outputClass:[AWSComprehendListDocumentClassificationJobsResponse class]];
}

- (void)listDocumentClassificationJobs:(AWSComprehendListDocumentClassificationJobsRequest *)request
     completionHandler:(void (^)(AWSComprehendListDocumentClassificationJobsResponse *response, NSError *error))completionHandler {
    [[self listDocumentClassificationJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendListDocumentClassificationJobsResponse *> * _Nonnull task) {
        AWSComprehendListDocumentClassificationJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendListDocumentClassifiersResponse *> *)listDocumentClassifiers:(AWSComprehendListDocumentClassifiersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ListDocumentClassifiers"
                   outputClass:[AWSComprehendListDocumentClassifiersResponse class]];
}

- (void)listDocumentClassifiers:(AWSComprehendListDocumentClassifiersRequest *)request
     completionHandler:(void (^)(AWSComprehendListDocumentClassifiersResponse *response, NSError *error))completionHandler {
    [[self listDocumentClassifiers:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendListDocumentClassifiersResponse *> * _Nonnull task) {
        AWSComprehendListDocumentClassifiersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendListDominantLanguageDetectionJobsResponse *> *)listDominantLanguageDetectionJobs:(AWSComprehendListDominantLanguageDetectionJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ListDominantLanguageDetectionJobs"
                   outputClass:[AWSComprehendListDominantLanguageDetectionJobsResponse class]];
}

- (void)listDominantLanguageDetectionJobs:(AWSComprehendListDominantLanguageDetectionJobsRequest *)request
     completionHandler:(void (^)(AWSComprehendListDominantLanguageDetectionJobsResponse *response, NSError *error))completionHandler {
    [[self listDominantLanguageDetectionJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendListDominantLanguageDetectionJobsResponse *> * _Nonnull task) {
        AWSComprehendListDominantLanguageDetectionJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendListEndpointsResponse *> *)listEndpoints:(AWSComprehendListEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ListEndpoints"
                   outputClass:[AWSComprehendListEndpointsResponse class]];
}

- (void)listEndpoints:(AWSComprehendListEndpointsRequest *)request
     completionHandler:(void (^)(AWSComprehendListEndpointsResponse *response, NSError *error))completionHandler {
    [[self listEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendListEndpointsResponse *> * _Nonnull task) {
        AWSComprehendListEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendListEntitiesDetectionJobsResponse *> *)listEntitiesDetectionJobs:(AWSComprehendListEntitiesDetectionJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ListEntitiesDetectionJobs"
                   outputClass:[AWSComprehendListEntitiesDetectionJobsResponse class]];
}

- (void)listEntitiesDetectionJobs:(AWSComprehendListEntitiesDetectionJobsRequest *)request
     completionHandler:(void (^)(AWSComprehendListEntitiesDetectionJobsResponse *response, NSError *error))completionHandler {
    [[self listEntitiesDetectionJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendListEntitiesDetectionJobsResponse *> * _Nonnull task) {
        AWSComprehendListEntitiesDetectionJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendListEntityRecognizersResponse *> *)listEntityRecognizers:(AWSComprehendListEntityRecognizersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ListEntityRecognizers"
                   outputClass:[AWSComprehendListEntityRecognizersResponse class]];
}

- (void)listEntityRecognizers:(AWSComprehendListEntityRecognizersRequest *)request
     completionHandler:(void (^)(AWSComprehendListEntityRecognizersResponse *response, NSError *error))completionHandler {
    [[self listEntityRecognizers:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendListEntityRecognizersResponse *> * _Nonnull task) {
        AWSComprehendListEntityRecognizersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendListKeyPhrasesDetectionJobsResponse *> *)listKeyPhrasesDetectionJobs:(AWSComprehendListKeyPhrasesDetectionJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ListKeyPhrasesDetectionJobs"
                   outputClass:[AWSComprehendListKeyPhrasesDetectionJobsResponse class]];
}

- (void)listKeyPhrasesDetectionJobs:(AWSComprehendListKeyPhrasesDetectionJobsRequest *)request
     completionHandler:(void (^)(AWSComprehendListKeyPhrasesDetectionJobsResponse *response, NSError *error))completionHandler {
    [[self listKeyPhrasesDetectionJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendListKeyPhrasesDetectionJobsResponse *> * _Nonnull task) {
        AWSComprehendListKeyPhrasesDetectionJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendListSentimentDetectionJobsResponse *> *)listSentimentDetectionJobs:(AWSComprehendListSentimentDetectionJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ListSentimentDetectionJobs"
                   outputClass:[AWSComprehendListSentimentDetectionJobsResponse class]];
}

- (void)listSentimentDetectionJobs:(AWSComprehendListSentimentDetectionJobsRequest *)request
     completionHandler:(void (^)(AWSComprehendListSentimentDetectionJobsResponse *response, NSError *error))completionHandler {
    [[self listSentimentDetectionJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendListSentimentDetectionJobsResponse *> * _Nonnull task) {
        AWSComprehendListSentimentDetectionJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendListTagsForResourceResponse *> *)listTagsForResource:(AWSComprehendListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSComprehendListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSComprehendListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSComprehendListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendListTagsForResourceResponse *> * _Nonnull task) {
        AWSComprehendListTagsForResourceResponse *result = task.result;
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

- (AWSTask<AWSComprehendStartDocumentClassificationJobResponse *> *)startDocumentClassificationJob:(AWSComprehendStartDocumentClassificationJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StartDocumentClassificationJob"
                   outputClass:[AWSComprehendStartDocumentClassificationJobResponse class]];
}

- (void)startDocumentClassificationJob:(AWSComprehendStartDocumentClassificationJobRequest *)request
     completionHandler:(void (^)(AWSComprehendStartDocumentClassificationJobResponse *response, NSError *error))completionHandler {
    [[self startDocumentClassificationJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStartDocumentClassificationJobResponse *> * _Nonnull task) {
        AWSComprehendStartDocumentClassificationJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendStartDominantLanguageDetectionJobResponse *> *)startDominantLanguageDetectionJob:(AWSComprehendStartDominantLanguageDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StartDominantLanguageDetectionJob"
                   outputClass:[AWSComprehendStartDominantLanguageDetectionJobResponse class]];
}

- (void)startDominantLanguageDetectionJob:(AWSComprehendStartDominantLanguageDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendStartDominantLanguageDetectionJobResponse *response, NSError *error))completionHandler {
    [[self startDominantLanguageDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStartDominantLanguageDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendStartDominantLanguageDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendStartEntitiesDetectionJobResponse *> *)startEntitiesDetectionJob:(AWSComprehendStartEntitiesDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StartEntitiesDetectionJob"
                   outputClass:[AWSComprehendStartEntitiesDetectionJobResponse class]];
}

- (void)startEntitiesDetectionJob:(AWSComprehendStartEntitiesDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendStartEntitiesDetectionJobResponse *response, NSError *error))completionHandler {
    [[self startEntitiesDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStartEntitiesDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendStartEntitiesDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendStartKeyPhrasesDetectionJobResponse *> *)startKeyPhrasesDetectionJob:(AWSComprehendStartKeyPhrasesDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StartKeyPhrasesDetectionJob"
                   outputClass:[AWSComprehendStartKeyPhrasesDetectionJobResponse class]];
}

- (void)startKeyPhrasesDetectionJob:(AWSComprehendStartKeyPhrasesDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendStartKeyPhrasesDetectionJobResponse *response, NSError *error))completionHandler {
    [[self startKeyPhrasesDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStartKeyPhrasesDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendStartKeyPhrasesDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendStartSentimentDetectionJobResponse *> *)startSentimentDetectionJob:(AWSComprehendStartSentimentDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StartSentimentDetectionJob"
                   outputClass:[AWSComprehendStartSentimentDetectionJobResponse class]];
}

- (void)startSentimentDetectionJob:(AWSComprehendStartSentimentDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendStartSentimentDetectionJobResponse *response, NSError *error))completionHandler {
    [[self startSentimentDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStartSentimentDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendStartSentimentDetectionJobResponse *result = task.result;
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

- (AWSTask<AWSComprehendStopDominantLanguageDetectionJobResponse *> *)stopDominantLanguageDetectionJob:(AWSComprehendStopDominantLanguageDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StopDominantLanguageDetectionJob"
                   outputClass:[AWSComprehendStopDominantLanguageDetectionJobResponse class]];
}

- (void)stopDominantLanguageDetectionJob:(AWSComprehendStopDominantLanguageDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendStopDominantLanguageDetectionJobResponse *response, NSError *error))completionHandler {
    [[self stopDominantLanguageDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStopDominantLanguageDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendStopDominantLanguageDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendStopEntitiesDetectionJobResponse *> *)stopEntitiesDetectionJob:(AWSComprehendStopEntitiesDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StopEntitiesDetectionJob"
                   outputClass:[AWSComprehendStopEntitiesDetectionJobResponse class]];
}

- (void)stopEntitiesDetectionJob:(AWSComprehendStopEntitiesDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendStopEntitiesDetectionJobResponse *response, NSError *error))completionHandler {
    [[self stopEntitiesDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStopEntitiesDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendStopEntitiesDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendStopKeyPhrasesDetectionJobResponse *> *)stopKeyPhrasesDetectionJob:(AWSComprehendStopKeyPhrasesDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StopKeyPhrasesDetectionJob"
                   outputClass:[AWSComprehendStopKeyPhrasesDetectionJobResponse class]];
}

- (void)stopKeyPhrasesDetectionJob:(AWSComprehendStopKeyPhrasesDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendStopKeyPhrasesDetectionJobResponse *response, NSError *error))completionHandler {
    [[self stopKeyPhrasesDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStopKeyPhrasesDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendStopKeyPhrasesDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendStopSentimentDetectionJobResponse *> *)stopSentimentDetectionJob:(AWSComprehendStopSentimentDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StopSentimentDetectionJob"
                   outputClass:[AWSComprehendStopSentimentDetectionJobResponse class]];
}

- (void)stopSentimentDetectionJob:(AWSComprehendStopSentimentDetectionJobRequest *)request
     completionHandler:(void (^)(AWSComprehendStopSentimentDetectionJobResponse *response, NSError *error))completionHandler {
    [[self stopSentimentDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStopSentimentDetectionJobResponse *> * _Nonnull task) {
        AWSComprehendStopSentimentDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendStopTrainingDocumentClassifierResponse *> *)stopTrainingDocumentClassifier:(AWSComprehendStopTrainingDocumentClassifierRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StopTrainingDocumentClassifier"
                   outputClass:[AWSComprehendStopTrainingDocumentClassifierResponse class]];
}

- (void)stopTrainingDocumentClassifier:(AWSComprehendStopTrainingDocumentClassifierRequest *)request
     completionHandler:(void (^)(AWSComprehendStopTrainingDocumentClassifierResponse *response, NSError *error))completionHandler {
    [[self stopTrainingDocumentClassifier:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStopTrainingDocumentClassifierResponse *> * _Nonnull task) {
        AWSComprehendStopTrainingDocumentClassifierResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendStopTrainingEntityRecognizerResponse *> *)stopTrainingEntityRecognizer:(AWSComprehendStopTrainingEntityRecognizerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"StopTrainingEntityRecognizer"
                   outputClass:[AWSComprehendStopTrainingEntityRecognizerResponse class]];
}

- (void)stopTrainingEntityRecognizer:(AWSComprehendStopTrainingEntityRecognizerRequest *)request
     completionHandler:(void (^)(AWSComprehendStopTrainingEntityRecognizerResponse *response, NSError *error))completionHandler {
    [[self stopTrainingEntityRecognizer:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendStopTrainingEntityRecognizerResponse *> * _Nonnull task) {
        AWSComprehendStopTrainingEntityRecognizerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendTagResourceResponse *> *)tagResource:(AWSComprehendTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"TagResource"
                   outputClass:[AWSComprehendTagResourceResponse class]];
}

- (void)tagResource:(AWSComprehendTagResourceRequest *)request
     completionHandler:(void (^)(AWSComprehendTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendTagResourceResponse *> * _Nonnull task) {
        AWSComprehendTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendUntagResourceResponse *> *)untagResource:(AWSComprehendUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"UntagResource"
                   outputClass:[AWSComprehendUntagResourceResponse class]];
}

- (void)untagResource:(AWSComprehendUntagResourceRequest *)request
     completionHandler:(void (^)(AWSComprehendUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendUntagResourceResponse *> * _Nonnull task) {
        AWSComprehendUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComprehendUpdateEndpointResponse *> *)updateEndpoint:(AWSComprehendUpdateEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Comprehend_20171127"
                 operationName:@"UpdateEndpoint"
                   outputClass:[AWSComprehendUpdateEndpointResponse class]];
}

- (void)updateEndpoint:(AWSComprehendUpdateEndpointRequest *)request
     completionHandler:(void (^)(AWSComprehendUpdateEndpointResponse *response, NSError *error))completionHandler {
    [[self updateEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSComprehendUpdateEndpointResponse *> * _Nonnull task) {
        AWSComprehendUpdateEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
