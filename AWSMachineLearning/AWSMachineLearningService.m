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

#import "AWSMachineLearningService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSMachineLearningResources.h"

static NSString *const AWSInfoMachineLearning = @"MachineLearning";
NSString *const AWSMachineLearningSDKVersion = @"2.13.2";


@interface AWSMachineLearningResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSMachineLearningResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IdempotentParameterMismatchException" : @(AWSMachineLearningErrorIdempotentParameterMismatch),
                            @"InternalServerException" : @(AWSMachineLearningErrorInternalServer),
                            @"InvalidInputException" : @(AWSMachineLearningErrorInvalidInput),
                            @"InvalidTagException" : @(AWSMachineLearningErrorInvalidTag),
                            @"LimitExceededException" : @(AWSMachineLearningErrorLimitExceeded),
                            @"PredictorNotMountedException" : @(AWSMachineLearningErrorPredictorNotMounted),
                            @"ResourceNotFoundException" : @(AWSMachineLearningErrorResourceNotFound),
                            @"TagLimitExceededException" : @(AWSMachineLearningErrorTagLimitExceeded),
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
	                *error = [NSError errorWithDomain:AWSMachineLearningErrorDomain
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
        *error = [NSError errorWithDomain:AWSMachineLearningErrorDomain
                                     code:AWSMachineLearningErrorUnknown
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

@interface AWSMachineLearningRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSMachineLearningRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSMachineLearning()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSMachineLearning

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSMachineLearningSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSMachineLearning versions need to match. Check your SDK installation. AWSCore: %@ AWSMachineLearning: %@", AWSiOSSDKVersion, AWSMachineLearningSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultMachineLearning {
    static AWSMachineLearning *_defaultMachineLearning = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoMachineLearning];
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
        _defaultMachineLearning = [[AWSMachineLearning alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultMachineLearning;
}

+ (void)registerMachineLearningWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSMachineLearning alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)MachineLearningForKey:(NSString *)key {
    @synchronized(self) {
        AWSMachineLearning *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoMachineLearning
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSMachineLearning registerMachineLearningWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeMachineLearningForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultMachineLearning` or `+ MachineLearningForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceMachineLearning
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceMachineLearning];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSMachineLearningRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.URLString = URLString;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSMachineLearningResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSMachineLearningResponseSerializer alloc] initWithJSONDefinition:[[AWSMachineLearningResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSMachineLearningAddTagsOutput *> *)addTags:(AWSMachineLearningAddTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"AddTags"
                   outputClass:[AWSMachineLearningAddTagsOutput class]];
}

- (void)addTags:(AWSMachineLearningAddTagsInput *)request
     completionHandler:(void (^)(AWSMachineLearningAddTagsOutput *response, NSError *error))completionHandler {
    [[self addTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningAddTagsOutput *> * _Nonnull task) {
        AWSMachineLearningAddTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningCreateBatchPredictionOutput *> *)createBatchPrediction:(AWSMachineLearningCreateBatchPredictionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"CreateBatchPrediction"
                   outputClass:[AWSMachineLearningCreateBatchPredictionOutput class]];
}

- (void)createBatchPrediction:(AWSMachineLearningCreateBatchPredictionInput *)request
     completionHandler:(void (^)(AWSMachineLearningCreateBatchPredictionOutput *response, NSError *error))completionHandler {
    [[self createBatchPrediction:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningCreateBatchPredictionOutput *> * _Nonnull task) {
        AWSMachineLearningCreateBatchPredictionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningCreateDataSourceFromRDSOutput *> *)createDataSourceFromRDS:(AWSMachineLearningCreateDataSourceFromRDSInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"CreateDataSourceFromRDS"
                   outputClass:[AWSMachineLearningCreateDataSourceFromRDSOutput class]];
}

- (void)createDataSourceFromRDS:(AWSMachineLearningCreateDataSourceFromRDSInput *)request
     completionHandler:(void (^)(AWSMachineLearningCreateDataSourceFromRDSOutput *response, NSError *error))completionHandler {
    [[self createDataSourceFromRDS:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningCreateDataSourceFromRDSOutput *> * _Nonnull task) {
        AWSMachineLearningCreateDataSourceFromRDSOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningCreateDataSourceFromRedshiftOutput *> *)createDataSourceFromRedshift:(AWSMachineLearningCreateDataSourceFromRedshiftInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"CreateDataSourceFromRedshift"
                   outputClass:[AWSMachineLearningCreateDataSourceFromRedshiftOutput class]];
}

- (void)createDataSourceFromRedshift:(AWSMachineLearningCreateDataSourceFromRedshiftInput *)request
     completionHandler:(void (^)(AWSMachineLearningCreateDataSourceFromRedshiftOutput *response, NSError *error))completionHandler {
    [[self createDataSourceFromRedshift:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningCreateDataSourceFromRedshiftOutput *> * _Nonnull task) {
        AWSMachineLearningCreateDataSourceFromRedshiftOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningCreateDataSourceFromS3Output *> *)createDataSourceFromS3:(AWSMachineLearningCreateDataSourceFromS3Input *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"CreateDataSourceFromS3"
                   outputClass:[AWSMachineLearningCreateDataSourceFromS3Output class]];
}

- (void)createDataSourceFromS3:(AWSMachineLearningCreateDataSourceFromS3Input *)request
     completionHandler:(void (^)(AWSMachineLearningCreateDataSourceFromS3Output *response, NSError *error))completionHandler {
    [[self createDataSourceFromS3:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningCreateDataSourceFromS3Output *> * _Nonnull task) {
        AWSMachineLearningCreateDataSourceFromS3Output *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningCreateEvaluationOutput *> *)createEvaluation:(AWSMachineLearningCreateEvaluationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"CreateEvaluation"
                   outputClass:[AWSMachineLearningCreateEvaluationOutput class]];
}

- (void)createEvaluation:(AWSMachineLearningCreateEvaluationInput *)request
     completionHandler:(void (^)(AWSMachineLearningCreateEvaluationOutput *response, NSError *error))completionHandler {
    [[self createEvaluation:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningCreateEvaluationOutput *> * _Nonnull task) {
        AWSMachineLearningCreateEvaluationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningCreateMLModelOutput *> *)createMLModel:(AWSMachineLearningCreateMLModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"CreateMLModel"
                   outputClass:[AWSMachineLearningCreateMLModelOutput class]];
}

- (void)createMLModel:(AWSMachineLearningCreateMLModelInput *)request
     completionHandler:(void (^)(AWSMachineLearningCreateMLModelOutput *response, NSError *error))completionHandler {
    [[self createMLModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningCreateMLModelOutput *> * _Nonnull task) {
        AWSMachineLearningCreateMLModelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningCreateRealtimeEndpointOutput *> *)createRealtimeEndpoint:(AWSMachineLearningCreateRealtimeEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"CreateRealtimeEndpoint"
                   outputClass:[AWSMachineLearningCreateRealtimeEndpointOutput class]];
}

- (void)createRealtimeEndpoint:(AWSMachineLearningCreateRealtimeEndpointInput *)request
     completionHandler:(void (^)(AWSMachineLearningCreateRealtimeEndpointOutput *response, NSError *error))completionHandler {
    [[self createRealtimeEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningCreateRealtimeEndpointOutput *> * _Nonnull task) {
        AWSMachineLearningCreateRealtimeEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDeleteBatchPredictionOutput *> *)deleteBatchPrediction:(AWSMachineLearningDeleteBatchPredictionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DeleteBatchPrediction"
                   outputClass:[AWSMachineLearningDeleteBatchPredictionOutput class]];
}

- (void)deleteBatchPrediction:(AWSMachineLearningDeleteBatchPredictionInput *)request
     completionHandler:(void (^)(AWSMachineLearningDeleteBatchPredictionOutput *response, NSError *error))completionHandler {
    [[self deleteBatchPrediction:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDeleteBatchPredictionOutput *> * _Nonnull task) {
        AWSMachineLearningDeleteBatchPredictionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDeleteDataSourceOutput *> *)deleteDataSource:(AWSMachineLearningDeleteDataSourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DeleteDataSource"
                   outputClass:[AWSMachineLearningDeleteDataSourceOutput class]];
}

- (void)deleteDataSource:(AWSMachineLearningDeleteDataSourceInput *)request
     completionHandler:(void (^)(AWSMachineLearningDeleteDataSourceOutput *response, NSError *error))completionHandler {
    [[self deleteDataSource:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDeleteDataSourceOutput *> * _Nonnull task) {
        AWSMachineLearningDeleteDataSourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDeleteEvaluationOutput *> *)deleteEvaluation:(AWSMachineLearningDeleteEvaluationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DeleteEvaluation"
                   outputClass:[AWSMachineLearningDeleteEvaluationOutput class]];
}

- (void)deleteEvaluation:(AWSMachineLearningDeleteEvaluationInput *)request
     completionHandler:(void (^)(AWSMachineLearningDeleteEvaluationOutput *response, NSError *error))completionHandler {
    [[self deleteEvaluation:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDeleteEvaluationOutput *> * _Nonnull task) {
        AWSMachineLearningDeleteEvaluationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDeleteMLModelOutput *> *)deleteMLModel:(AWSMachineLearningDeleteMLModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DeleteMLModel"
                   outputClass:[AWSMachineLearningDeleteMLModelOutput class]];
}

- (void)deleteMLModel:(AWSMachineLearningDeleteMLModelInput *)request
     completionHandler:(void (^)(AWSMachineLearningDeleteMLModelOutput *response, NSError *error))completionHandler {
    [[self deleteMLModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDeleteMLModelOutput *> * _Nonnull task) {
        AWSMachineLearningDeleteMLModelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDeleteRealtimeEndpointOutput *> *)deleteRealtimeEndpoint:(AWSMachineLearningDeleteRealtimeEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DeleteRealtimeEndpoint"
                   outputClass:[AWSMachineLearningDeleteRealtimeEndpointOutput class]];
}

- (void)deleteRealtimeEndpoint:(AWSMachineLearningDeleteRealtimeEndpointInput *)request
     completionHandler:(void (^)(AWSMachineLearningDeleteRealtimeEndpointOutput *response, NSError *error))completionHandler {
    [[self deleteRealtimeEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDeleteRealtimeEndpointOutput *> * _Nonnull task) {
        AWSMachineLearningDeleteRealtimeEndpointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDeleteTagsOutput *> *)deleteTags:(AWSMachineLearningDeleteTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DeleteTags"
                   outputClass:[AWSMachineLearningDeleteTagsOutput class]];
}

- (void)deleteTags:(AWSMachineLearningDeleteTagsInput *)request
     completionHandler:(void (^)(AWSMachineLearningDeleteTagsOutput *response, NSError *error))completionHandler {
    [[self deleteTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDeleteTagsOutput *> * _Nonnull task) {
        AWSMachineLearningDeleteTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDescribeBatchPredictionsOutput *> *)describeBatchPredictions:(AWSMachineLearningDescribeBatchPredictionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DescribeBatchPredictions"
                   outputClass:[AWSMachineLearningDescribeBatchPredictionsOutput class]];
}

- (void)describeBatchPredictions:(AWSMachineLearningDescribeBatchPredictionsInput *)request
     completionHandler:(void (^)(AWSMachineLearningDescribeBatchPredictionsOutput *response, NSError *error))completionHandler {
    [[self describeBatchPredictions:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDescribeBatchPredictionsOutput *> * _Nonnull task) {
        AWSMachineLearningDescribeBatchPredictionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDescribeDataSourcesOutput *> *)describeDataSources:(AWSMachineLearningDescribeDataSourcesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DescribeDataSources"
                   outputClass:[AWSMachineLearningDescribeDataSourcesOutput class]];
}

- (void)describeDataSources:(AWSMachineLearningDescribeDataSourcesInput *)request
     completionHandler:(void (^)(AWSMachineLearningDescribeDataSourcesOutput *response, NSError *error))completionHandler {
    [[self describeDataSources:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDescribeDataSourcesOutput *> * _Nonnull task) {
        AWSMachineLearningDescribeDataSourcesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDescribeEvaluationsOutput *> *)describeEvaluations:(AWSMachineLearningDescribeEvaluationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DescribeEvaluations"
                   outputClass:[AWSMachineLearningDescribeEvaluationsOutput class]];
}

- (void)describeEvaluations:(AWSMachineLearningDescribeEvaluationsInput *)request
     completionHandler:(void (^)(AWSMachineLearningDescribeEvaluationsOutput *response, NSError *error))completionHandler {
    [[self describeEvaluations:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDescribeEvaluationsOutput *> * _Nonnull task) {
        AWSMachineLearningDescribeEvaluationsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDescribeMLModelsOutput *> *)describeMLModels:(AWSMachineLearningDescribeMLModelsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DescribeMLModels"
                   outputClass:[AWSMachineLearningDescribeMLModelsOutput class]];
}

- (void)describeMLModels:(AWSMachineLearningDescribeMLModelsInput *)request
     completionHandler:(void (^)(AWSMachineLearningDescribeMLModelsOutput *response, NSError *error))completionHandler {
    [[self describeMLModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDescribeMLModelsOutput *> * _Nonnull task) {
        AWSMachineLearningDescribeMLModelsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningDescribeTagsOutput *> *)describeTags:(AWSMachineLearningDescribeTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"DescribeTags"
                   outputClass:[AWSMachineLearningDescribeTagsOutput class]];
}

- (void)describeTags:(AWSMachineLearningDescribeTagsInput *)request
     completionHandler:(void (^)(AWSMachineLearningDescribeTagsOutput *response, NSError *error))completionHandler {
    [[self describeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningDescribeTagsOutput *> * _Nonnull task) {
        AWSMachineLearningDescribeTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningGetBatchPredictionOutput *> *)getBatchPrediction:(AWSMachineLearningGetBatchPredictionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"GetBatchPrediction"
                   outputClass:[AWSMachineLearningGetBatchPredictionOutput class]];
}

- (void)getBatchPrediction:(AWSMachineLearningGetBatchPredictionInput *)request
     completionHandler:(void (^)(AWSMachineLearningGetBatchPredictionOutput *response, NSError *error))completionHandler {
    [[self getBatchPrediction:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningGetBatchPredictionOutput *> * _Nonnull task) {
        AWSMachineLearningGetBatchPredictionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningGetDataSourceOutput *> *)getDataSource:(AWSMachineLearningGetDataSourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"GetDataSource"
                   outputClass:[AWSMachineLearningGetDataSourceOutput class]];
}

- (void)getDataSource:(AWSMachineLearningGetDataSourceInput *)request
     completionHandler:(void (^)(AWSMachineLearningGetDataSourceOutput *response, NSError *error))completionHandler {
    [[self getDataSource:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningGetDataSourceOutput *> * _Nonnull task) {
        AWSMachineLearningGetDataSourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningGetEvaluationOutput *> *)getEvaluation:(AWSMachineLearningGetEvaluationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"GetEvaluation"
                   outputClass:[AWSMachineLearningGetEvaluationOutput class]];
}

- (void)getEvaluation:(AWSMachineLearningGetEvaluationInput *)request
     completionHandler:(void (^)(AWSMachineLearningGetEvaluationOutput *response, NSError *error))completionHandler {
    [[self getEvaluation:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningGetEvaluationOutput *> * _Nonnull task) {
        AWSMachineLearningGetEvaluationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningGetMLModelOutput *> *)getMLModel:(AWSMachineLearningGetMLModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"GetMLModel"
                   outputClass:[AWSMachineLearningGetMLModelOutput class]];
}

- (void)getMLModel:(AWSMachineLearningGetMLModelInput *)request
     completionHandler:(void (^)(AWSMachineLearningGetMLModelOutput *response, NSError *error))completionHandler {
    [[self getMLModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningGetMLModelOutput *> * _Nonnull task) {
        AWSMachineLearningGetMLModelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningPredictOutput *> *)predict:(AWSMachineLearningPredictInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:request.predictEndpoint
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"Predict"
                   outputClass:[AWSMachineLearningPredictOutput class]];
}

- (void)predict:(AWSMachineLearningPredictInput *)request
     completionHandler:(void (^)(AWSMachineLearningPredictOutput *response, NSError *error))completionHandler {
    [[self predict:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningPredictOutput *> * _Nonnull task) {
        AWSMachineLearningPredictOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningUpdateBatchPredictionOutput *> *)updateBatchPrediction:(AWSMachineLearningUpdateBatchPredictionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"UpdateBatchPrediction"
                   outputClass:[AWSMachineLearningUpdateBatchPredictionOutput class]];
}

- (void)updateBatchPrediction:(AWSMachineLearningUpdateBatchPredictionInput *)request
     completionHandler:(void (^)(AWSMachineLearningUpdateBatchPredictionOutput *response, NSError *error))completionHandler {
    [[self updateBatchPrediction:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningUpdateBatchPredictionOutput *> * _Nonnull task) {
        AWSMachineLearningUpdateBatchPredictionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningUpdateDataSourceOutput *> *)updateDataSource:(AWSMachineLearningUpdateDataSourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"UpdateDataSource"
                   outputClass:[AWSMachineLearningUpdateDataSourceOutput class]];
}

- (void)updateDataSource:(AWSMachineLearningUpdateDataSourceInput *)request
     completionHandler:(void (^)(AWSMachineLearningUpdateDataSourceOutput *response, NSError *error))completionHandler {
    [[self updateDataSource:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningUpdateDataSourceOutput *> * _Nonnull task) {
        AWSMachineLearningUpdateDataSourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningUpdateEvaluationOutput *> *)updateEvaluation:(AWSMachineLearningUpdateEvaluationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"UpdateEvaluation"
                   outputClass:[AWSMachineLearningUpdateEvaluationOutput class]];
}

- (void)updateEvaluation:(AWSMachineLearningUpdateEvaluationInput *)request
     completionHandler:(void (^)(AWSMachineLearningUpdateEvaluationOutput *response, NSError *error))completionHandler {
    [[self updateEvaluation:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningUpdateEvaluationOutput *> * _Nonnull task) {
        AWSMachineLearningUpdateEvaluationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMachineLearningUpdateMLModelOutput *> *)updateMLModel:(AWSMachineLearningUpdateMLModelInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonML_20141212"
                 operationName:@"UpdateMLModel"
                   outputClass:[AWSMachineLearningUpdateMLModelOutput class]];
}

- (void)updateMLModel:(AWSMachineLearningUpdateMLModelInput *)request
     completionHandler:(void (^)(AWSMachineLearningUpdateMLModelOutput *response, NSError *error))completionHandler {
    [[self updateMLModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSMachineLearningUpdateMLModelOutput *> * _Nonnull task) {
        AWSMachineLearningUpdateMLModelOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
