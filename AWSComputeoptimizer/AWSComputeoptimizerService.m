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

#import "AWSComputeoptimizerService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSComputeoptimizerResources.h"

static NSString *const AWSInfoComputeoptimizer = @"Computeoptimizer";
NSString *const AWSComputeoptimizerSDKVersion = @"2.13.4";


@interface AWSComputeoptimizerResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSComputeoptimizerResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSComputeoptimizerErrorAccessDenied),
                            @"InternalServerException" : @(AWSComputeoptimizerErrorInternalServer),
                            @"InvalidParameterValueException" : @(AWSComputeoptimizerErrorInvalidParameterValue),
                            @"LimitExceededException" : @(AWSComputeoptimizerErrorLimitExceeded),
                            @"MissingAuthenticationToken" : @(AWSComputeoptimizerErrorMissingAuthenticationToken),
                            @"OptInRequiredException" : @(AWSComputeoptimizerErrorOptInRequired),
                            @"ResourceNotFoundException" : @(AWSComputeoptimizerErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSComputeoptimizerErrorServiceUnavailable),
                            @"ThrottlingException" : @(AWSComputeoptimizerErrorThrottling),
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
	                *error = [NSError errorWithDomain:AWSComputeoptimizerErrorDomain
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
        *error = [NSError errorWithDomain:AWSComputeoptimizerErrorDomain
                                     code:AWSComputeoptimizerErrorUnknown
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

@interface AWSComputeoptimizerRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSComputeoptimizerRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSComputeoptimizer()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSComputeoptimizer

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSComputeoptimizerSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSComputeoptimizer versions need to match. Check your SDK installation. AWSCore: %@ AWSComputeoptimizer: %@", AWSiOSSDKVersion, AWSComputeoptimizerSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultComputeoptimizer {
    static AWSComputeoptimizer *_defaultComputeoptimizer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoComputeoptimizer];
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
        _defaultComputeoptimizer = [[AWSComputeoptimizer alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultComputeoptimizer;
}

+ (void)registerComputeoptimizerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSComputeoptimizer alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ComputeoptimizerForKey:(NSString *)key {
    @synchronized(self) {
        AWSComputeoptimizer *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoComputeoptimizer
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSComputeoptimizer registerComputeoptimizerWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeComputeoptimizerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultComputeoptimizer` or `+ ComputeoptimizerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceComputeoptimizer
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceComputeoptimizer];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSComputeoptimizerRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

		NSMutableDictionary *headers = [NSMutableDictionary new];
        headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
        networkingRequest.headers = headers;
        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSComputeoptimizerResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSComputeoptimizerResponseSerializer alloc] initWithJSONDefinition:[[AWSComputeoptimizerResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSComputeoptimizerDescribeRecommendationExportJobsResponse *> *)describeRecommendationExportJobs:(AWSComputeoptimizerDescribeRecommendationExportJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComputeOptimizerService"
                 operationName:@"DescribeRecommendationExportJobs"
                   outputClass:[AWSComputeoptimizerDescribeRecommendationExportJobsResponse class]];
}

- (void)describeRecommendationExportJobs:(AWSComputeoptimizerDescribeRecommendationExportJobsRequest *)request
     completionHandler:(void (^)(AWSComputeoptimizerDescribeRecommendationExportJobsResponse *response, NSError *error))completionHandler {
    [[self describeRecommendationExportJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSComputeoptimizerDescribeRecommendationExportJobsResponse *> * _Nonnull task) {
        AWSComputeoptimizerDescribeRecommendationExportJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse *> *)exportAutoScalingGroupRecommendations:(AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComputeOptimizerService"
                 operationName:@"ExportAutoScalingGroupRecommendations"
                   outputClass:[AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse class]];
}

- (void)exportAutoScalingGroupRecommendations:(AWSComputeoptimizerExportAutoScalingGroupRecommendationsRequest *)request
     completionHandler:(void (^)(AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse *response, NSError *error))completionHandler {
    [[self exportAutoScalingGroupRecommendations:request] continueWithBlock:^id _Nullable(AWSTask<AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse *> * _Nonnull task) {
        AWSComputeoptimizerExportAutoScalingGroupRecommendationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComputeoptimizerExportEC2InstanceRecommendationsResponse *> *)exportEC2InstanceRecommendations:(AWSComputeoptimizerExportEC2InstanceRecommendationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComputeOptimizerService"
                 operationName:@"ExportEC2InstanceRecommendations"
                   outputClass:[AWSComputeoptimizerExportEC2InstanceRecommendationsResponse class]];
}

- (void)exportEC2InstanceRecommendations:(AWSComputeoptimizerExportEC2InstanceRecommendationsRequest *)request
     completionHandler:(void (^)(AWSComputeoptimizerExportEC2InstanceRecommendationsResponse *response, NSError *error))completionHandler {
    [[self exportEC2InstanceRecommendations:request] continueWithBlock:^id _Nullable(AWSTask<AWSComputeoptimizerExportEC2InstanceRecommendationsResponse *> * _Nonnull task) {
        AWSComputeoptimizerExportEC2InstanceRecommendationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse *> *)getAutoScalingGroupRecommendations:(AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComputeOptimizerService"
                 operationName:@"GetAutoScalingGroupRecommendations"
                   outputClass:[AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse class]];
}

- (void)getAutoScalingGroupRecommendations:(AWSComputeoptimizerGetAutoScalingGroupRecommendationsRequest *)request
     completionHandler:(void (^)(AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse *response, NSError *error))completionHandler {
    [[self getAutoScalingGroupRecommendations:request] continueWithBlock:^id _Nullable(AWSTask<AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse *> * _Nonnull task) {
        AWSComputeoptimizerGetAutoScalingGroupRecommendationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComputeoptimizerGetEC2InstanceRecommendationsResponse *> *)getEC2InstanceRecommendations:(AWSComputeoptimizerGetEC2InstanceRecommendationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComputeOptimizerService"
                 operationName:@"GetEC2InstanceRecommendations"
                   outputClass:[AWSComputeoptimizerGetEC2InstanceRecommendationsResponse class]];
}

- (void)getEC2InstanceRecommendations:(AWSComputeoptimizerGetEC2InstanceRecommendationsRequest *)request
     completionHandler:(void (^)(AWSComputeoptimizerGetEC2InstanceRecommendationsResponse *response, NSError *error))completionHandler {
    [[self getEC2InstanceRecommendations:request] continueWithBlock:^id _Nullable(AWSTask<AWSComputeoptimizerGetEC2InstanceRecommendationsResponse *> * _Nonnull task) {
        AWSComputeoptimizerGetEC2InstanceRecommendationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse *> *)getEC2RecommendationProjectedMetrics:(AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComputeOptimizerService"
                 operationName:@"GetEC2RecommendationProjectedMetrics"
                   outputClass:[AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse class]];
}

- (void)getEC2RecommendationProjectedMetrics:(AWSComputeoptimizerGetEC2RecommendationProjectedMetricsRequest *)request
     completionHandler:(void (^)(AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse *response, NSError *error))completionHandler {
    [[self getEC2RecommendationProjectedMetrics:request] continueWithBlock:^id _Nullable(AWSTask<AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse *> * _Nonnull task) {
        AWSComputeoptimizerGetEC2RecommendationProjectedMetricsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComputeoptimizerGetEnrollmentStatusResponse *> *)getEnrollmentStatus:(AWSComputeoptimizerGetEnrollmentStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComputeOptimizerService"
                 operationName:@"GetEnrollmentStatus"
                   outputClass:[AWSComputeoptimizerGetEnrollmentStatusResponse class]];
}

- (void)getEnrollmentStatus:(AWSComputeoptimizerGetEnrollmentStatusRequest *)request
     completionHandler:(void (^)(AWSComputeoptimizerGetEnrollmentStatusResponse *response, NSError *error))completionHandler {
    [[self getEnrollmentStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSComputeoptimizerGetEnrollmentStatusResponse *> * _Nonnull task) {
        AWSComputeoptimizerGetEnrollmentStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComputeoptimizerGetRecommendationSummariesResponse *> *)getRecommendationSummaries:(AWSComputeoptimizerGetRecommendationSummariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComputeOptimizerService"
                 operationName:@"GetRecommendationSummaries"
                   outputClass:[AWSComputeoptimizerGetRecommendationSummariesResponse class]];
}

- (void)getRecommendationSummaries:(AWSComputeoptimizerGetRecommendationSummariesRequest *)request
     completionHandler:(void (^)(AWSComputeoptimizerGetRecommendationSummariesResponse *response, NSError *error))completionHandler {
    [[self getRecommendationSummaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSComputeoptimizerGetRecommendationSummariesResponse *> * _Nonnull task) {
        AWSComputeoptimizerGetRecommendationSummariesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSComputeoptimizerUpdateEnrollmentStatusResponse *> *)updateEnrollmentStatus:(AWSComputeoptimizerUpdateEnrollmentStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ComputeOptimizerService"
                 operationName:@"UpdateEnrollmentStatus"
                   outputClass:[AWSComputeoptimizerUpdateEnrollmentStatusResponse class]];
}

- (void)updateEnrollmentStatus:(AWSComputeoptimizerUpdateEnrollmentStatusRequest *)request
     completionHandler:(void (^)(AWSComputeoptimizerUpdateEnrollmentStatusResponse *response, NSError *error))completionHandler {
    [[self updateEnrollmentStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSComputeoptimizerUpdateEnrollmentStatusResponse *> * _Nonnull task) {
        AWSComputeoptimizerUpdateEnrollmentStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
