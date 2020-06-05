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

#import "AWSPersonalizeService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSPersonalizeResources.h"

static NSString *const AWSInfoPersonalize = @"Personalize";
NSString *const AWSPersonalizeSDKVersion = @"2.13.4";


@interface AWSPersonalizeResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSPersonalizeResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InvalidInputException" : @(AWSPersonalizeErrorInvalidInput),
                            @"InvalidNextTokenException" : @(AWSPersonalizeErrorInvalidNextToken),
                            @"LimitExceededException" : @(AWSPersonalizeErrorLimitExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSPersonalizeErrorResourceAlreadyExists),
                            @"ResourceInUseException" : @(AWSPersonalizeErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSPersonalizeErrorResourceNotFound),
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
	                *error = [NSError errorWithDomain:AWSPersonalizeErrorDomain
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
        *error = [NSError errorWithDomain:AWSPersonalizeErrorDomain
                                     code:AWSPersonalizeErrorUnknown
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

@interface AWSPersonalizeRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSPersonalizeRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSPersonalize()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSPersonalize

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSPersonalizeSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSPersonalize versions need to match. Check your SDK installation. AWSCore: %@ AWSPersonalize: %@", AWSiOSSDKVersion, AWSPersonalizeSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultPersonalize {
    static AWSPersonalize *_defaultPersonalize = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoPersonalize];
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
        _defaultPersonalize = [[AWSPersonalize alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultPersonalize;
}

+ (void)registerPersonalizeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSPersonalize alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)PersonalizeForKey:(NSString *)key {
    @synchronized(self) {
        AWSPersonalize *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoPersonalize
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSPersonalize registerPersonalizeWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removePersonalizeForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultPersonalize` or `+ PersonalizeForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicePersonalize
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicePersonalize];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSPersonalizeRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSPersonalizeResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSPersonalizeResponseSerializer alloc] initWithJSONDefinition:[[AWSPersonalizeResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSPersonalizeCreateBatchInferenceJobResponse *> *)createBatchInferenceJob:(AWSPersonalizeCreateBatchInferenceJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"CreateBatchInferenceJob"
                   outputClass:[AWSPersonalizeCreateBatchInferenceJobResponse class]];
}

- (void)createBatchInferenceJob:(AWSPersonalizeCreateBatchInferenceJobRequest *)request
     completionHandler:(void (^)(AWSPersonalizeCreateBatchInferenceJobResponse *response, NSError *error))completionHandler {
    [[self createBatchInferenceJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeCreateBatchInferenceJobResponse *> * _Nonnull task) {
        AWSPersonalizeCreateBatchInferenceJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeCreateCampaignResponse *> *)createCampaign:(AWSPersonalizeCreateCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"CreateCampaign"
                   outputClass:[AWSPersonalizeCreateCampaignResponse class]];
}

- (void)createCampaign:(AWSPersonalizeCreateCampaignRequest *)request
     completionHandler:(void (^)(AWSPersonalizeCreateCampaignResponse *response, NSError *error))completionHandler {
    [[self createCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeCreateCampaignResponse *> * _Nonnull task) {
        AWSPersonalizeCreateCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeCreateDatasetResponse *> *)createDataset:(AWSPersonalizeCreateDatasetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"CreateDataset"
                   outputClass:[AWSPersonalizeCreateDatasetResponse class]];
}

- (void)createDataset:(AWSPersonalizeCreateDatasetRequest *)request
     completionHandler:(void (^)(AWSPersonalizeCreateDatasetResponse *response, NSError *error))completionHandler {
    [[self createDataset:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeCreateDatasetResponse *> * _Nonnull task) {
        AWSPersonalizeCreateDatasetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeCreateDatasetGroupResponse *> *)createDatasetGroup:(AWSPersonalizeCreateDatasetGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"CreateDatasetGroup"
                   outputClass:[AWSPersonalizeCreateDatasetGroupResponse class]];
}

- (void)createDatasetGroup:(AWSPersonalizeCreateDatasetGroupRequest *)request
     completionHandler:(void (^)(AWSPersonalizeCreateDatasetGroupResponse *response, NSError *error))completionHandler {
    [[self createDatasetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeCreateDatasetGroupResponse *> * _Nonnull task) {
        AWSPersonalizeCreateDatasetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeCreateDatasetImportJobResponse *> *)createDatasetImportJob:(AWSPersonalizeCreateDatasetImportJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"CreateDatasetImportJob"
                   outputClass:[AWSPersonalizeCreateDatasetImportJobResponse class]];
}

- (void)createDatasetImportJob:(AWSPersonalizeCreateDatasetImportJobRequest *)request
     completionHandler:(void (^)(AWSPersonalizeCreateDatasetImportJobResponse *response, NSError *error))completionHandler {
    [[self createDatasetImportJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeCreateDatasetImportJobResponse *> * _Nonnull task) {
        AWSPersonalizeCreateDatasetImportJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeCreateEventTrackerResponse *> *)createEventTracker:(AWSPersonalizeCreateEventTrackerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"CreateEventTracker"
                   outputClass:[AWSPersonalizeCreateEventTrackerResponse class]];
}

- (void)createEventTracker:(AWSPersonalizeCreateEventTrackerRequest *)request
     completionHandler:(void (^)(AWSPersonalizeCreateEventTrackerResponse *response, NSError *error))completionHandler {
    [[self createEventTracker:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeCreateEventTrackerResponse *> * _Nonnull task) {
        AWSPersonalizeCreateEventTrackerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeCreateFilterResponse *> *)createFilter:(AWSPersonalizeCreateFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"CreateFilter"
                   outputClass:[AWSPersonalizeCreateFilterResponse class]];
}

- (void)createFilter:(AWSPersonalizeCreateFilterRequest *)request
     completionHandler:(void (^)(AWSPersonalizeCreateFilterResponse *response, NSError *error))completionHandler {
    [[self createFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeCreateFilterResponse *> * _Nonnull task) {
        AWSPersonalizeCreateFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeCreateSchemaResponse *> *)createSchema:(AWSPersonalizeCreateSchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"CreateSchema"
                   outputClass:[AWSPersonalizeCreateSchemaResponse class]];
}

- (void)createSchema:(AWSPersonalizeCreateSchemaRequest *)request
     completionHandler:(void (^)(AWSPersonalizeCreateSchemaResponse *response, NSError *error))completionHandler {
    [[self createSchema:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeCreateSchemaResponse *> * _Nonnull task) {
        AWSPersonalizeCreateSchemaResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeCreateSolutionResponse *> *)createSolution:(AWSPersonalizeCreateSolutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"CreateSolution"
                   outputClass:[AWSPersonalizeCreateSolutionResponse class]];
}

- (void)createSolution:(AWSPersonalizeCreateSolutionRequest *)request
     completionHandler:(void (^)(AWSPersonalizeCreateSolutionResponse *response, NSError *error))completionHandler {
    [[self createSolution:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeCreateSolutionResponse *> * _Nonnull task) {
        AWSPersonalizeCreateSolutionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeCreateSolutionVersionResponse *> *)createSolutionVersion:(AWSPersonalizeCreateSolutionVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"CreateSolutionVersion"
                   outputClass:[AWSPersonalizeCreateSolutionVersionResponse class]];
}

- (void)createSolutionVersion:(AWSPersonalizeCreateSolutionVersionRequest *)request
     completionHandler:(void (^)(AWSPersonalizeCreateSolutionVersionResponse *response, NSError *error))completionHandler {
    [[self createSolutionVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeCreateSolutionVersionResponse *> * _Nonnull task) {
        AWSPersonalizeCreateSolutionVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCampaign:(AWSPersonalizeDeleteCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DeleteCampaign"
                   outputClass:nil];
}

- (void)deleteCampaign:(AWSPersonalizeDeleteCampaignRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCampaign:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDataset:(AWSPersonalizeDeleteDatasetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DeleteDataset"
                   outputClass:nil];
}

- (void)deleteDataset:(AWSPersonalizeDeleteDatasetRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDataset:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDatasetGroup:(AWSPersonalizeDeleteDatasetGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DeleteDatasetGroup"
                   outputClass:nil];
}

- (void)deleteDatasetGroup:(AWSPersonalizeDeleteDatasetGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDatasetGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEventTracker:(AWSPersonalizeDeleteEventTrackerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DeleteEventTracker"
                   outputClass:nil];
}

- (void)deleteEventTracker:(AWSPersonalizeDeleteEventTrackerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEventTracker:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteFilter:(AWSPersonalizeDeleteFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DeleteFilter"
                   outputClass:nil];
}

- (void)deleteFilter:(AWSPersonalizeDeleteFilterRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteFilter:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSchema:(AWSPersonalizeDeleteSchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DeleteSchema"
                   outputClass:nil];
}

- (void)deleteSchema:(AWSPersonalizeDeleteSchemaRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSchema:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSolution:(AWSPersonalizeDeleteSolutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DeleteSolution"
                   outputClass:nil];
}

- (void)deleteSolution:(AWSPersonalizeDeleteSolutionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSolution:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeAlgorithmResponse *> *)describeAlgorithm:(AWSPersonalizeDescribeAlgorithmRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeAlgorithm"
                   outputClass:[AWSPersonalizeDescribeAlgorithmResponse class]];
}

- (void)describeAlgorithm:(AWSPersonalizeDescribeAlgorithmRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeAlgorithmResponse *response, NSError *error))completionHandler {
    [[self describeAlgorithm:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeAlgorithmResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeAlgorithmResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeBatchInferenceJobResponse *> *)describeBatchInferenceJob:(AWSPersonalizeDescribeBatchInferenceJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeBatchInferenceJob"
                   outputClass:[AWSPersonalizeDescribeBatchInferenceJobResponse class]];
}

- (void)describeBatchInferenceJob:(AWSPersonalizeDescribeBatchInferenceJobRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeBatchInferenceJobResponse *response, NSError *error))completionHandler {
    [[self describeBatchInferenceJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeBatchInferenceJobResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeBatchInferenceJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeCampaignResponse *> *)describeCampaign:(AWSPersonalizeDescribeCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeCampaign"
                   outputClass:[AWSPersonalizeDescribeCampaignResponse class]];
}

- (void)describeCampaign:(AWSPersonalizeDescribeCampaignRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeCampaignResponse *response, NSError *error))completionHandler {
    [[self describeCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeCampaignResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeDatasetResponse *> *)describeDataset:(AWSPersonalizeDescribeDatasetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeDataset"
                   outputClass:[AWSPersonalizeDescribeDatasetResponse class]];
}

- (void)describeDataset:(AWSPersonalizeDescribeDatasetRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeDatasetResponse *response, NSError *error))completionHandler {
    [[self describeDataset:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeDatasetResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeDatasetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeDatasetGroupResponse *> *)describeDatasetGroup:(AWSPersonalizeDescribeDatasetGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeDatasetGroup"
                   outputClass:[AWSPersonalizeDescribeDatasetGroupResponse class]];
}

- (void)describeDatasetGroup:(AWSPersonalizeDescribeDatasetGroupRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeDatasetGroupResponse *response, NSError *error))completionHandler {
    [[self describeDatasetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeDatasetGroupResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeDatasetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeDatasetImportJobResponse *> *)describeDatasetImportJob:(AWSPersonalizeDescribeDatasetImportJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeDatasetImportJob"
                   outputClass:[AWSPersonalizeDescribeDatasetImportJobResponse class]];
}

- (void)describeDatasetImportJob:(AWSPersonalizeDescribeDatasetImportJobRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeDatasetImportJobResponse *response, NSError *error))completionHandler {
    [[self describeDatasetImportJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeDatasetImportJobResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeDatasetImportJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeEventTrackerResponse *> *)describeEventTracker:(AWSPersonalizeDescribeEventTrackerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeEventTracker"
                   outputClass:[AWSPersonalizeDescribeEventTrackerResponse class]];
}

- (void)describeEventTracker:(AWSPersonalizeDescribeEventTrackerRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeEventTrackerResponse *response, NSError *error))completionHandler {
    [[self describeEventTracker:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeEventTrackerResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeEventTrackerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeFeatureTransformationResponse *> *)describeFeatureTransformation:(AWSPersonalizeDescribeFeatureTransformationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeFeatureTransformation"
                   outputClass:[AWSPersonalizeDescribeFeatureTransformationResponse class]];
}

- (void)describeFeatureTransformation:(AWSPersonalizeDescribeFeatureTransformationRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeFeatureTransformationResponse *response, NSError *error))completionHandler {
    [[self describeFeatureTransformation:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeFeatureTransformationResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeFeatureTransformationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeFilterResponse *> *)describeFilter:(AWSPersonalizeDescribeFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeFilter"
                   outputClass:[AWSPersonalizeDescribeFilterResponse class]];
}

- (void)describeFilter:(AWSPersonalizeDescribeFilterRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeFilterResponse *response, NSError *error))completionHandler {
    [[self describeFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeFilterResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeRecipeResponse *> *)describeRecipe:(AWSPersonalizeDescribeRecipeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeRecipe"
                   outputClass:[AWSPersonalizeDescribeRecipeResponse class]];
}

- (void)describeRecipe:(AWSPersonalizeDescribeRecipeRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeRecipeResponse *response, NSError *error))completionHandler {
    [[self describeRecipe:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeRecipeResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeRecipeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeSchemaResponse *> *)describeSchema:(AWSPersonalizeDescribeSchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeSchema"
                   outputClass:[AWSPersonalizeDescribeSchemaResponse class]];
}

- (void)describeSchema:(AWSPersonalizeDescribeSchemaRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeSchemaResponse *response, NSError *error))completionHandler {
    [[self describeSchema:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeSchemaResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeSchemaResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeSolutionResponse *> *)describeSolution:(AWSPersonalizeDescribeSolutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeSolution"
                   outputClass:[AWSPersonalizeDescribeSolutionResponse class]];
}

- (void)describeSolution:(AWSPersonalizeDescribeSolutionRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeSolutionResponse *response, NSError *error))completionHandler {
    [[self describeSolution:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeSolutionResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeSolutionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeDescribeSolutionVersionResponse *> *)describeSolutionVersion:(AWSPersonalizeDescribeSolutionVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"DescribeSolutionVersion"
                   outputClass:[AWSPersonalizeDescribeSolutionVersionResponse class]];
}

- (void)describeSolutionVersion:(AWSPersonalizeDescribeSolutionVersionRequest *)request
     completionHandler:(void (^)(AWSPersonalizeDescribeSolutionVersionResponse *response, NSError *error))completionHandler {
    [[self describeSolutionVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeDescribeSolutionVersionResponse *> * _Nonnull task) {
        AWSPersonalizeDescribeSolutionVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeGetSolutionMetricsResponse *> *)getSolutionMetrics:(AWSPersonalizeGetSolutionMetricsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"GetSolutionMetrics"
                   outputClass:[AWSPersonalizeGetSolutionMetricsResponse class]];
}

- (void)getSolutionMetrics:(AWSPersonalizeGetSolutionMetricsRequest *)request
     completionHandler:(void (^)(AWSPersonalizeGetSolutionMetricsResponse *response, NSError *error))completionHandler {
    [[self getSolutionMetrics:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeGetSolutionMetricsResponse *> * _Nonnull task) {
        AWSPersonalizeGetSolutionMetricsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListBatchInferenceJobsResponse *> *)listBatchInferenceJobs:(AWSPersonalizeListBatchInferenceJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListBatchInferenceJobs"
                   outputClass:[AWSPersonalizeListBatchInferenceJobsResponse class]];
}

- (void)listBatchInferenceJobs:(AWSPersonalizeListBatchInferenceJobsRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListBatchInferenceJobsResponse *response, NSError *error))completionHandler {
    [[self listBatchInferenceJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListBatchInferenceJobsResponse *> * _Nonnull task) {
        AWSPersonalizeListBatchInferenceJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListCampaignsResponse *> *)listCampaigns:(AWSPersonalizeListCampaignsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListCampaigns"
                   outputClass:[AWSPersonalizeListCampaignsResponse class]];
}

- (void)listCampaigns:(AWSPersonalizeListCampaignsRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListCampaignsResponse *response, NSError *error))completionHandler {
    [[self listCampaigns:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListCampaignsResponse *> * _Nonnull task) {
        AWSPersonalizeListCampaignsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListDatasetGroupsResponse *> *)listDatasetGroups:(AWSPersonalizeListDatasetGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListDatasetGroups"
                   outputClass:[AWSPersonalizeListDatasetGroupsResponse class]];
}

- (void)listDatasetGroups:(AWSPersonalizeListDatasetGroupsRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListDatasetGroupsResponse *response, NSError *error))completionHandler {
    [[self listDatasetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListDatasetGroupsResponse *> * _Nonnull task) {
        AWSPersonalizeListDatasetGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListDatasetImportJobsResponse *> *)listDatasetImportJobs:(AWSPersonalizeListDatasetImportJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListDatasetImportJobs"
                   outputClass:[AWSPersonalizeListDatasetImportJobsResponse class]];
}

- (void)listDatasetImportJobs:(AWSPersonalizeListDatasetImportJobsRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListDatasetImportJobsResponse *response, NSError *error))completionHandler {
    [[self listDatasetImportJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListDatasetImportJobsResponse *> * _Nonnull task) {
        AWSPersonalizeListDatasetImportJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListDatasetsResponse *> *)listDatasets:(AWSPersonalizeListDatasetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListDatasets"
                   outputClass:[AWSPersonalizeListDatasetsResponse class]];
}

- (void)listDatasets:(AWSPersonalizeListDatasetsRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListDatasetsResponse *response, NSError *error))completionHandler {
    [[self listDatasets:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListDatasetsResponse *> * _Nonnull task) {
        AWSPersonalizeListDatasetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListEventTrackersResponse *> *)listEventTrackers:(AWSPersonalizeListEventTrackersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListEventTrackers"
                   outputClass:[AWSPersonalizeListEventTrackersResponse class]];
}

- (void)listEventTrackers:(AWSPersonalizeListEventTrackersRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListEventTrackersResponse *response, NSError *error))completionHandler {
    [[self listEventTrackers:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListEventTrackersResponse *> * _Nonnull task) {
        AWSPersonalizeListEventTrackersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListFiltersResponse *> *)listFilters:(AWSPersonalizeListFiltersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListFilters"
                   outputClass:[AWSPersonalizeListFiltersResponse class]];
}

- (void)listFilters:(AWSPersonalizeListFiltersRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListFiltersResponse *response, NSError *error))completionHandler {
    [[self listFilters:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListFiltersResponse *> * _Nonnull task) {
        AWSPersonalizeListFiltersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListRecipesResponse *> *)listRecipes:(AWSPersonalizeListRecipesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListRecipes"
                   outputClass:[AWSPersonalizeListRecipesResponse class]];
}

- (void)listRecipes:(AWSPersonalizeListRecipesRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListRecipesResponse *response, NSError *error))completionHandler {
    [[self listRecipes:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListRecipesResponse *> * _Nonnull task) {
        AWSPersonalizeListRecipesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListSchemasResponse *> *)listSchemas:(AWSPersonalizeListSchemasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListSchemas"
                   outputClass:[AWSPersonalizeListSchemasResponse class]];
}

- (void)listSchemas:(AWSPersonalizeListSchemasRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListSchemasResponse *response, NSError *error))completionHandler {
    [[self listSchemas:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListSchemasResponse *> * _Nonnull task) {
        AWSPersonalizeListSchemasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListSolutionVersionsResponse *> *)listSolutionVersions:(AWSPersonalizeListSolutionVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListSolutionVersions"
                   outputClass:[AWSPersonalizeListSolutionVersionsResponse class]];
}

- (void)listSolutionVersions:(AWSPersonalizeListSolutionVersionsRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListSolutionVersionsResponse *response, NSError *error))completionHandler {
    [[self listSolutionVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListSolutionVersionsResponse *> * _Nonnull task) {
        AWSPersonalizeListSolutionVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeListSolutionsResponse *> *)listSolutions:(AWSPersonalizeListSolutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"ListSolutions"
                   outputClass:[AWSPersonalizeListSolutionsResponse class]];
}

- (void)listSolutions:(AWSPersonalizeListSolutionsRequest *)request
     completionHandler:(void (^)(AWSPersonalizeListSolutionsResponse *response, NSError *error))completionHandler {
    [[self listSolutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeListSolutionsResponse *> * _Nonnull task) {
        AWSPersonalizeListSolutionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPersonalizeUpdateCampaignResponse *> *)updateCampaign:(AWSPersonalizeUpdateCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonPersonalize"
                 operationName:@"UpdateCampaign"
                   outputClass:[AWSPersonalizeUpdateCampaignResponse class]];
}

- (void)updateCampaign:(AWSPersonalizeUpdateCampaignRequest *)request
     completionHandler:(void (^)(AWSPersonalizeUpdateCampaignResponse *response, NSError *error))completionHandler {
    [[self updateCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPersonalizeUpdateCampaignResponse *> * _Nonnull task) {
        AWSPersonalizeUpdateCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
