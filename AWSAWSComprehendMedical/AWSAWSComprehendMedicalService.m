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

#import "AWSAWSComprehendMedicalService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAWSComprehendMedicalResources.h"

static NSString *const AWSInfoAWSComprehendMedical = @"AWSComprehendMedical";
NSString *const AWSAWSComprehendMedicalSDKVersion = @"2.13.3";


@interface AWSAWSComprehendMedicalResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSAWSComprehendMedicalResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalServerException" : @(AWSAWSComprehendMedicalErrorInternalServer),
                            @"InvalidEncodingException" : @(AWSAWSComprehendMedicalErrorInvalidEncoding),
                            @"InvalidRequestException" : @(AWSAWSComprehendMedicalErrorInvalidRequest),
                            @"ResourceNotFoundException" : @(AWSAWSComprehendMedicalErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSAWSComprehendMedicalErrorServiceUnavailable),
                            @"TextSizeLimitExceededException" : @(AWSAWSComprehendMedicalErrorTextSizeLimitExceeded),
                            @"TooManyRequestsException" : @(AWSAWSComprehendMedicalErrorTooManyRequests),
                            @"ValidationException" : @(AWSAWSComprehendMedicalErrorValidation),
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
	                *error = [NSError errorWithDomain:AWSAWSComprehendMedicalErrorDomain
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
        *error = [NSError errorWithDomain:AWSAWSComprehendMedicalErrorDomain
                                     code:AWSAWSComprehendMedicalErrorUnknown
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

@interface AWSAWSComprehendMedicalRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAWSComprehendMedicalRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAWSComprehendMedical()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAWSComprehendMedical

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAWSComprehendMedicalSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAWSComprehendMedical versions need to match. Check your SDK installation. AWSCore: %@ AWSAWSComprehendMedical: %@", AWSiOSSDKVersion, AWSAWSComprehendMedicalSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAWSComprehendMedical {
    static AWSAWSComprehendMedical *_defaultAWSComprehendMedical = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAWSComprehendMedical];
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
        _defaultAWSComprehendMedical = [[AWSAWSComprehendMedical alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAWSComprehendMedical;
}

+ (void)registerAWSComprehendMedicalWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAWSComprehendMedical alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AWSComprehendMedicalForKey:(NSString *)key {
    @synchronized(self) {
        AWSAWSComprehendMedical *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAWSComprehendMedical
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAWSComprehendMedical registerAWSComprehendMedicalWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAWSComprehendMedicalForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAWSComprehendMedical` or `+ AWSComprehendMedicalForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAWSComprehendMedical
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAWSComprehendMedical];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAWSComprehendMedicalRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSAWSComprehendMedicalResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAWSComprehendMedicalResponseSerializer alloc] initWithJSONDefinition:[[AWSAWSComprehendMedicalResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse *> *)describeEntitiesDetectionV2Job:(AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"DescribeEntitiesDetectionV2Job"
                   outputClass:[AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse class]];
}

- (void)describeEntitiesDetectionV2Job:(AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse *response, NSError *error))completionHandler {
    [[self describeEntitiesDetectionV2Job:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalDescribeEntitiesDetectionV2JobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse *> *)describeICD10CMInferenceJob:(AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"DescribeICD10CMInferenceJob"
                   outputClass:[AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse class]];
}

- (void)describeICD10CMInferenceJob:(AWSAWSComprehendMedicalDescribeICD10CMInferenceJobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse *response, NSError *error))completionHandler {
    [[self describeICD10CMInferenceJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalDescribeICD10CMInferenceJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalDescribePHIDetectionJobResponse *> *)describePHIDetectionJob:(AWSAWSComprehendMedicalDescribePHIDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"DescribePHIDetectionJob"
                   outputClass:[AWSAWSComprehendMedicalDescribePHIDetectionJobResponse class]];
}

- (void)describePHIDetectionJob:(AWSAWSComprehendMedicalDescribePHIDetectionJobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalDescribePHIDetectionJobResponse *response, NSError *error))completionHandler {
    [[self describePHIDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalDescribePHIDetectionJobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalDescribePHIDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse *> *)describeRxNormInferenceJob:(AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"DescribeRxNormInferenceJob"
                   outputClass:[AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse class]];
}

- (void)describeRxNormInferenceJob:(AWSAWSComprehendMedicalDescribeRxNormInferenceJobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse *response, NSError *error))completionHandler {
    [[self describeRxNormInferenceJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalDescribeRxNormInferenceJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalDetectEntitiesResponse *> *)detectEntities:(AWSAWSComprehendMedicalDetectEntitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"DetectEntities"
                   outputClass:[AWSAWSComprehendMedicalDetectEntitiesResponse class]];
}

- (void)detectEntities:(AWSAWSComprehendMedicalDetectEntitiesRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalDetectEntitiesResponse *response, NSError *error))completionHandler {
    [[self detectEntities:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalDetectEntitiesResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalDetectEntitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalDetectEntitiesV2Response *> *)detectEntitiesV2:(AWSAWSComprehendMedicalDetectEntitiesV2Request *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"DetectEntitiesV2"
                   outputClass:[AWSAWSComprehendMedicalDetectEntitiesV2Response class]];
}

- (void)detectEntitiesV2:(AWSAWSComprehendMedicalDetectEntitiesV2Request *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalDetectEntitiesV2Response *response, NSError *error))completionHandler {
    [[self detectEntitiesV2:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalDetectEntitiesV2Response *> * _Nonnull task) {
        AWSAWSComprehendMedicalDetectEntitiesV2Response *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalDetectPHIResponse *> *)detectPHI:(AWSAWSComprehendMedicalDetectPHIRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"DetectPHI"
                   outputClass:[AWSAWSComprehendMedicalDetectPHIResponse class]];
}

- (void)detectPHI:(AWSAWSComprehendMedicalDetectPHIRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalDetectPHIResponse *response, NSError *error))completionHandler {
    [[self detectPHI:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalDetectPHIResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalDetectPHIResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalInferICD10CMResponse *> *)inferICD10CM:(AWSAWSComprehendMedicalInferICD10CMRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"InferICD10CM"
                   outputClass:[AWSAWSComprehendMedicalInferICD10CMResponse class]];
}

- (void)inferICD10CM:(AWSAWSComprehendMedicalInferICD10CMRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalInferICD10CMResponse *response, NSError *error))completionHandler {
    [[self inferICD10CM:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalInferICD10CMResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalInferICD10CMResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalInferRxNormResponse *> *)inferRxNorm:(AWSAWSComprehendMedicalInferRxNormRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"InferRxNorm"
                   outputClass:[AWSAWSComprehendMedicalInferRxNormResponse class]];
}

- (void)inferRxNorm:(AWSAWSComprehendMedicalInferRxNormRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalInferRxNormResponse *response, NSError *error))completionHandler {
    [[self inferRxNorm:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalInferRxNormResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalInferRxNormResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse *> *)listEntitiesDetectionV2Jobs:(AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"ListEntitiesDetectionV2Jobs"
                   outputClass:[AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse class]];
}

- (void)listEntitiesDetectionV2Jobs:(AWSAWSComprehendMedicalListEntitiesDetectionV2JobsRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse *response, NSError *error))completionHandler {
    [[self listEntitiesDetectionV2Jobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalListEntitiesDetectionV2JobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse *> *)listICD10CMInferenceJobs:(AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"ListICD10CMInferenceJobs"
                   outputClass:[AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse class]];
}

- (void)listICD10CMInferenceJobs:(AWSAWSComprehendMedicalListICD10CMInferenceJobsRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse *response, NSError *error))completionHandler {
    [[self listICD10CMInferenceJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalListICD10CMInferenceJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalListPHIDetectionJobsResponse *> *)listPHIDetectionJobs:(AWSAWSComprehendMedicalListPHIDetectionJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"ListPHIDetectionJobs"
                   outputClass:[AWSAWSComprehendMedicalListPHIDetectionJobsResponse class]];
}

- (void)listPHIDetectionJobs:(AWSAWSComprehendMedicalListPHIDetectionJobsRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalListPHIDetectionJobsResponse *response, NSError *error))completionHandler {
    [[self listPHIDetectionJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalListPHIDetectionJobsResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalListPHIDetectionJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalListRxNormInferenceJobsResponse *> *)listRxNormInferenceJobs:(AWSAWSComprehendMedicalListRxNormInferenceJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"ListRxNormInferenceJobs"
                   outputClass:[AWSAWSComprehendMedicalListRxNormInferenceJobsResponse class]];
}

- (void)listRxNormInferenceJobs:(AWSAWSComprehendMedicalListRxNormInferenceJobsRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalListRxNormInferenceJobsResponse *response, NSError *error))completionHandler {
    [[self listRxNormInferenceJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalListRxNormInferenceJobsResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalListRxNormInferenceJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse *> *)startEntitiesDetectionV2Job:(AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"StartEntitiesDetectionV2Job"
                   outputClass:[AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse class]];
}

- (void)startEntitiesDetectionV2Job:(AWSAWSComprehendMedicalStartEntitiesDetectionV2JobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse *response, NSError *error))completionHandler {
    [[self startEntitiesDetectionV2Job:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalStartEntitiesDetectionV2JobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse *> *)startICD10CMInferenceJob:(AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"StartICD10CMInferenceJob"
                   outputClass:[AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse class]];
}

- (void)startICD10CMInferenceJob:(AWSAWSComprehendMedicalStartICD10CMInferenceJobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse *response, NSError *error))completionHandler {
    [[self startICD10CMInferenceJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalStartICD10CMInferenceJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalStartPHIDetectionJobResponse *> *)startPHIDetectionJob:(AWSAWSComprehendMedicalStartPHIDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"StartPHIDetectionJob"
                   outputClass:[AWSAWSComprehendMedicalStartPHIDetectionJobResponse class]];
}

- (void)startPHIDetectionJob:(AWSAWSComprehendMedicalStartPHIDetectionJobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalStartPHIDetectionJobResponse *response, NSError *error))completionHandler {
    [[self startPHIDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalStartPHIDetectionJobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalStartPHIDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalStartRxNormInferenceJobResponse *> *)startRxNormInferenceJob:(AWSAWSComprehendMedicalStartRxNormInferenceJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"StartRxNormInferenceJob"
                   outputClass:[AWSAWSComprehendMedicalStartRxNormInferenceJobResponse class]];
}

- (void)startRxNormInferenceJob:(AWSAWSComprehendMedicalStartRxNormInferenceJobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalStartRxNormInferenceJobResponse *response, NSError *error))completionHandler {
    [[self startRxNormInferenceJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalStartRxNormInferenceJobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalStartRxNormInferenceJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse *> *)stopEntitiesDetectionV2Job:(AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"StopEntitiesDetectionV2Job"
                   outputClass:[AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse class]];
}

- (void)stopEntitiesDetectionV2Job:(AWSAWSComprehendMedicalStopEntitiesDetectionV2JobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse *response, NSError *error))completionHandler {
    [[self stopEntitiesDetectionV2Job:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalStopEntitiesDetectionV2JobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse *> *)stopICD10CMInferenceJob:(AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"StopICD10CMInferenceJob"
                   outputClass:[AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse class]];
}

- (void)stopICD10CMInferenceJob:(AWSAWSComprehendMedicalStopICD10CMInferenceJobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse *response, NSError *error))completionHandler {
    [[self stopICD10CMInferenceJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalStopICD10CMInferenceJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalStopPHIDetectionJobResponse *> *)stopPHIDetectionJob:(AWSAWSComprehendMedicalStopPHIDetectionJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"StopPHIDetectionJob"
                   outputClass:[AWSAWSComprehendMedicalStopPHIDetectionJobResponse class]];
}

- (void)stopPHIDetectionJob:(AWSAWSComprehendMedicalStopPHIDetectionJobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalStopPHIDetectionJobResponse *response, NSError *error))completionHandler {
    [[self stopPHIDetectionJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalStopPHIDetectionJobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalStopPHIDetectionJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAWSComprehendMedicalStopRxNormInferenceJobResponse *> *)stopRxNormInferenceJob:(AWSAWSComprehendMedicalStopRxNormInferenceJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComprehendMedical_20181030"
                 operationName:@"StopRxNormInferenceJob"
                   outputClass:[AWSAWSComprehendMedicalStopRxNormInferenceJobResponse class]];
}

- (void)stopRxNormInferenceJob:(AWSAWSComprehendMedicalStopRxNormInferenceJobRequest *)request
     completionHandler:(void (^)(AWSAWSComprehendMedicalStopRxNormInferenceJobResponse *response, NSError *error))completionHandler {
    [[self stopRxNormInferenceJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSAWSComprehendMedicalStopRxNormInferenceJobResponse *> * _Nonnull task) {
        AWSAWSComprehendMedicalStopRxNormInferenceJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
