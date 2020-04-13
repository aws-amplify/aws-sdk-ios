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

#import "AWSRekognitionService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSRekognitionResources.h"

static NSString *const AWSInfoRekognition = @"Rekognition";
NSString *const AWSRekognitionSDKVersion = @"2.13.2";


@interface AWSRekognitionResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSRekognitionResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSRekognitionErrorAccessDenied),
                            @"HumanLoopQuotaExceededException" : @(AWSRekognitionErrorHumanLoopQuotaExceeded),
                            @"IdempotentParameterMismatchException" : @(AWSRekognitionErrorIdempotentParameterMismatch),
                            @"ImageTooLargeException" : @(AWSRekognitionErrorImageTooLarge),
                            @"InternalServerError" : @(AWSRekognitionErrorInternalServer),
                            @"InvalidImageFormatException" : @(AWSRekognitionErrorInvalidImageFormat),
                            @"InvalidPaginationTokenException" : @(AWSRekognitionErrorInvalidPaginationToken),
                            @"InvalidParameterException" : @(AWSRekognitionErrorInvalidParameter),
                            @"InvalidS3ObjectException" : @(AWSRekognitionErrorInvalidS3Object),
                            @"LimitExceededException" : @(AWSRekognitionErrorLimitExceeded),
                            @"ProvisionedThroughputExceededException" : @(AWSRekognitionErrorProvisionedThroughputExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSRekognitionErrorResourceAlreadyExists),
                            @"ResourceInUseException" : @(AWSRekognitionErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSRekognitionErrorResourceNotFound),
                            @"ResourceNotReadyException" : @(AWSRekognitionErrorResourceNotReady),
                            @"ThrottlingException" : @(AWSRekognitionErrorThrottling),
                            @"VideoTooLargeException" : @(AWSRekognitionErrorVideoTooLarge),
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
	                *error = [NSError errorWithDomain:AWSRekognitionErrorDomain
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
        *error = [NSError errorWithDomain:AWSRekognitionErrorDomain
                                     code:AWSRekognitionErrorUnknown
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

@interface AWSRekognitionRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSRekognitionRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSRekognition()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSRekognition

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSRekognitionSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSRekognition versions need to match. Check your SDK installation. AWSCore: %@ AWSRekognition: %@", AWSiOSSDKVersion, AWSRekognitionSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultRekognition {
    static AWSRekognition *_defaultRekognition = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoRekognition];
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
        _defaultRekognition = [[AWSRekognition alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultRekognition;
}

+ (void)registerRekognitionWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSRekognition alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)RekognitionForKey:(NSString *)key {
    @synchronized(self) {
        AWSRekognition *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoRekognition
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSRekognition registerRekognitionWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeRekognitionForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultRekognition` or `+ RekognitionForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceRekognition
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceRekognition];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSRekognitionRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSRekognitionResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSRekognitionResponseSerializer alloc] initWithJSONDefinition:[[AWSRekognitionResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSRekognitionCompareFacesResponse *> *)compareFaces:(AWSRekognitionCompareFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CompareFaces"
                   outputClass:[AWSRekognitionCompareFacesResponse class]];
}

- (void)compareFaces:(AWSRekognitionCompareFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionCompareFacesResponse *response, NSError *error))completionHandler {
    [[self compareFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCompareFacesResponse *> * _Nonnull task) {
        AWSRekognitionCompareFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateCollectionResponse *> *)createCollection:(AWSRekognitionCreateCollectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateCollection"
                   outputClass:[AWSRekognitionCreateCollectionResponse class]];
}

- (void)createCollection:(AWSRekognitionCreateCollectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateCollectionResponse *response, NSError *error))completionHandler {
    [[self createCollection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateCollectionResponse *> * _Nonnull task) {
        AWSRekognitionCreateCollectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateProjectResponse *> *)createProject:(AWSRekognitionCreateProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateProject"
                   outputClass:[AWSRekognitionCreateProjectResponse class]];
}

- (void)createProject:(AWSRekognitionCreateProjectRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateProjectResponse *response, NSError *error))completionHandler {
    [[self createProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateProjectResponse *> * _Nonnull task) {
        AWSRekognitionCreateProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateProjectVersionResponse *> *)createProjectVersion:(AWSRekognitionCreateProjectVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateProjectVersion"
                   outputClass:[AWSRekognitionCreateProjectVersionResponse class]];
}

- (void)createProjectVersion:(AWSRekognitionCreateProjectVersionRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateProjectVersionResponse *response, NSError *error))completionHandler {
    [[self createProjectVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateProjectVersionResponse *> * _Nonnull task) {
        AWSRekognitionCreateProjectVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionCreateStreamProcessorResponse *> *)createStreamProcessor:(AWSRekognitionCreateStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"CreateStreamProcessor"
                   outputClass:[AWSRekognitionCreateStreamProcessorResponse class]];
}

- (void)createStreamProcessor:(AWSRekognitionCreateStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionCreateStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self createStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionCreateStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionCreateStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteCollectionResponse *> *)deleteCollection:(AWSRekognitionDeleteCollectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteCollection"
                   outputClass:[AWSRekognitionDeleteCollectionResponse class]];
}

- (void)deleteCollection:(AWSRekognitionDeleteCollectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteCollectionResponse *response, NSError *error))completionHandler {
    [[self deleteCollection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteCollectionResponse *> * _Nonnull task) {
        AWSRekognitionDeleteCollectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteFacesResponse *> *)deleteFaces:(AWSRekognitionDeleteFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteFaces"
                   outputClass:[AWSRekognitionDeleteFacesResponse class]];
}

- (void)deleteFaces:(AWSRekognitionDeleteFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteFacesResponse *response, NSError *error))completionHandler {
    [[self deleteFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteFacesResponse *> * _Nonnull task) {
        AWSRekognitionDeleteFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteProjectResponse *> *)deleteProject:(AWSRekognitionDeleteProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteProject"
                   outputClass:[AWSRekognitionDeleteProjectResponse class]];
}

- (void)deleteProject:(AWSRekognitionDeleteProjectRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteProjectResponse *response, NSError *error))completionHandler {
    [[self deleteProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteProjectResponse *> * _Nonnull task) {
        AWSRekognitionDeleteProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteProjectVersionResponse *> *)deleteProjectVersion:(AWSRekognitionDeleteProjectVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteProjectVersion"
                   outputClass:[AWSRekognitionDeleteProjectVersionResponse class]];
}

- (void)deleteProjectVersion:(AWSRekognitionDeleteProjectVersionRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteProjectVersionResponse *response, NSError *error))completionHandler {
    [[self deleteProjectVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteProjectVersionResponse *> * _Nonnull task) {
        AWSRekognitionDeleteProjectVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDeleteStreamProcessorResponse *> *)deleteStreamProcessor:(AWSRekognitionDeleteStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DeleteStreamProcessor"
                   outputClass:[AWSRekognitionDeleteStreamProcessorResponse class]];
}

- (void)deleteStreamProcessor:(AWSRekognitionDeleteStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionDeleteStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self deleteStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDeleteStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionDeleteStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDescribeCollectionResponse *> *)describeCollection:(AWSRekognitionDescribeCollectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DescribeCollection"
                   outputClass:[AWSRekognitionDescribeCollectionResponse class]];
}

- (void)describeCollection:(AWSRekognitionDescribeCollectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionDescribeCollectionResponse *response, NSError *error))completionHandler {
    [[self describeCollection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDescribeCollectionResponse *> * _Nonnull task) {
        AWSRekognitionDescribeCollectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDescribeProjectVersionsResponse *> *)describeProjectVersions:(AWSRekognitionDescribeProjectVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DescribeProjectVersions"
                   outputClass:[AWSRekognitionDescribeProjectVersionsResponse class]];
}

- (void)describeProjectVersions:(AWSRekognitionDescribeProjectVersionsRequest *)request
     completionHandler:(void (^)(AWSRekognitionDescribeProjectVersionsResponse *response, NSError *error))completionHandler {
    [[self describeProjectVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDescribeProjectVersionsResponse *> * _Nonnull task) {
        AWSRekognitionDescribeProjectVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDescribeProjectsResponse *> *)describeProjects:(AWSRekognitionDescribeProjectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DescribeProjects"
                   outputClass:[AWSRekognitionDescribeProjectsResponse class]];
}

- (void)describeProjects:(AWSRekognitionDescribeProjectsRequest *)request
     completionHandler:(void (^)(AWSRekognitionDescribeProjectsResponse *response, NSError *error))completionHandler {
    [[self describeProjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDescribeProjectsResponse *> * _Nonnull task) {
        AWSRekognitionDescribeProjectsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDescribeStreamProcessorResponse *> *)describeStreamProcessor:(AWSRekognitionDescribeStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DescribeStreamProcessor"
                   outputClass:[AWSRekognitionDescribeStreamProcessorResponse class]];
}

- (void)describeStreamProcessor:(AWSRekognitionDescribeStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionDescribeStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self describeStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDescribeStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionDescribeStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectCustomLabelsResponse *> *)detectCustomLabels:(AWSRekognitionDetectCustomLabelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectCustomLabels"
                   outputClass:[AWSRekognitionDetectCustomLabelsResponse class]];
}

- (void)detectCustomLabels:(AWSRekognitionDetectCustomLabelsRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectCustomLabelsResponse *response, NSError *error))completionHandler {
    [[self detectCustomLabels:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectCustomLabelsResponse *> * _Nonnull task) {
        AWSRekognitionDetectCustomLabelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectFacesResponse *> *)detectFaces:(AWSRekognitionDetectFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectFaces"
                   outputClass:[AWSRekognitionDetectFacesResponse class]];
}

- (void)detectFaces:(AWSRekognitionDetectFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectFacesResponse *response, NSError *error))completionHandler {
    [[self detectFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectFacesResponse *> * _Nonnull task) {
        AWSRekognitionDetectFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectLabelsResponse *> *)detectLabels:(AWSRekognitionDetectLabelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectLabels"
                   outputClass:[AWSRekognitionDetectLabelsResponse class]];
}

- (void)detectLabels:(AWSRekognitionDetectLabelsRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectLabelsResponse *response, NSError *error))completionHandler {
    [[self detectLabels:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectLabelsResponse *> * _Nonnull task) {
        AWSRekognitionDetectLabelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectModerationLabelsResponse *> *)detectModerationLabels:(AWSRekognitionDetectModerationLabelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectModerationLabels"
                   outputClass:[AWSRekognitionDetectModerationLabelsResponse class]];
}

- (void)detectModerationLabels:(AWSRekognitionDetectModerationLabelsRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectModerationLabelsResponse *response, NSError *error))completionHandler {
    [[self detectModerationLabels:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectModerationLabelsResponse *> * _Nonnull task) {
        AWSRekognitionDetectModerationLabelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionDetectTextResponse *> *)detectText:(AWSRekognitionDetectTextRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"DetectText"
                   outputClass:[AWSRekognitionDetectTextResponse class]];
}

- (void)detectText:(AWSRekognitionDetectTextRequest *)request
     completionHandler:(void (^)(AWSRekognitionDetectTextResponse *response, NSError *error))completionHandler {
    [[self detectText:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionDetectTextResponse *> * _Nonnull task) {
        AWSRekognitionDetectTextResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetCelebrityInfoResponse *> *)getCelebrityInfo:(AWSRekognitionGetCelebrityInfoRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetCelebrityInfo"
                   outputClass:[AWSRekognitionGetCelebrityInfoResponse class]];
}

- (void)getCelebrityInfo:(AWSRekognitionGetCelebrityInfoRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetCelebrityInfoResponse *response, NSError *error))completionHandler {
    [[self getCelebrityInfo:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetCelebrityInfoResponse *> * _Nonnull task) {
        AWSRekognitionGetCelebrityInfoResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetCelebrityRecognitionResponse *> *)getCelebrityRecognition:(AWSRekognitionGetCelebrityRecognitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetCelebrityRecognition"
                   outputClass:[AWSRekognitionGetCelebrityRecognitionResponse class]];
}

- (void)getCelebrityRecognition:(AWSRekognitionGetCelebrityRecognitionRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetCelebrityRecognitionResponse *response, NSError *error))completionHandler {
    [[self getCelebrityRecognition:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetCelebrityRecognitionResponse *> * _Nonnull task) {
        AWSRekognitionGetCelebrityRecognitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetContentModerationResponse *> *)getContentModeration:(AWSRekognitionGetContentModerationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetContentModeration"
                   outputClass:[AWSRekognitionGetContentModerationResponse class]];
}

- (void)getContentModeration:(AWSRekognitionGetContentModerationRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetContentModerationResponse *response, NSError *error))completionHandler {
    [[self getContentModeration:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetContentModerationResponse *> * _Nonnull task) {
        AWSRekognitionGetContentModerationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetFaceDetectionResponse *> *)getFaceDetection:(AWSRekognitionGetFaceDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetFaceDetection"
                   outputClass:[AWSRekognitionGetFaceDetectionResponse class]];
}

- (void)getFaceDetection:(AWSRekognitionGetFaceDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetFaceDetectionResponse *response, NSError *error))completionHandler {
    [[self getFaceDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetFaceDetectionResponse *> * _Nonnull task) {
        AWSRekognitionGetFaceDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetFaceSearchResponse *> *)getFaceSearch:(AWSRekognitionGetFaceSearchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetFaceSearch"
                   outputClass:[AWSRekognitionGetFaceSearchResponse class]];
}

- (void)getFaceSearch:(AWSRekognitionGetFaceSearchRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetFaceSearchResponse *response, NSError *error))completionHandler {
    [[self getFaceSearch:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetFaceSearchResponse *> * _Nonnull task) {
        AWSRekognitionGetFaceSearchResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetLabelDetectionResponse *> *)getLabelDetection:(AWSRekognitionGetLabelDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetLabelDetection"
                   outputClass:[AWSRekognitionGetLabelDetectionResponse class]];
}

- (void)getLabelDetection:(AWSRekognitionGetLabelDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetLabelDetectionResponse *response, NSError *error))completionHandler {
    [[self getLabelDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetLabelDetectionResponse *> * _Nonnull task) {
        AWSRekognitionGetLabelDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetPersonTrackingResponse *> *)getPersonTracking:(AWSRekognitionGetPersonTrackingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetPersonTracking"
                   outputClass:[AWSRekognitionGetPersonTrackingResponse class]];
}

- (void)getPersonTracking:(AWSRekognitionGetPersonTrackingRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetPersonTrackingResponse *response, NSError *error))completionHandler {
    [[self getPersonTracking:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetPersonTrackingResponse *> * _Nonnull task) {
        AWSRekognitionGetPersonTrackingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionGetTextDetectionResponse *> *)getTextDetection:(AWSRekognitionGetTextDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"GetTextDetection"
                   outputClass:[AWSRekognitionGetTextDetectionResponse class]];
}

- (void)getTextDetection:(AWSRekognitionGetTextDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionGetTextDetectionResponse *response, NSError *error))completionHandler {
    [[self getTextDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionGetTextDetectionResponse *> * _Nonnull task) {
        AWSRekognitionGetTextDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionIndexFacesResponse *> *)indexFaces:(AWSRekognitionIndexFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"IndexFaces"
                   outputClass:[AWSRekognitionIndexFacesResponse class]];
}

- (void)indexFaces:(AWSRekognitionIndexFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionIndexFacesResponse *response, NSError *error))completionHandler {
    [[self indexFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionIndexFacesResponse *> * _Nonnull task) {
        AWSRekognitionIndexFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListCollectionsResponse *> *)listCollections:(AWSRekognitionListCollectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListCollections"
                   outputClass:[AWSRekognitionListCollectionsResponse class]];
}

- (void)listCollections:(AWSRekognitionListCollectionsRequest *)request
     completionHandler:(void (^)(AWSRekognitionListCollectionsResponse *response, NSError *error))completionHandler {
    [[self listCollections:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListCollectionsResponse *> * _Nonnull task) {
        AWSRekognitionListCollectionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListFacesResponse *> *)listFaces:(AWSRekognitionListFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListFaces"
                   outputClass:[AWSRekognitionListFacesResponse class]];
}

- (void)listFaces:(AWSRekognitionListFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionListFacesResponse *response, NSError *error))completionHandler {
    [[self listFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListFacesResponse *> * _Nonnull task) {
        AWSRekognitionListFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionListStreamProcessorsResponse *> *)listStreamProcessors:(AWSRekognitionListStreamProcessorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"ListStreamProcessors"
                   outputClass:[AWSRekognitionListStreamProcessorsResponse class]];
}

- (void)listStreamProcessors:(AWSRekognitionListStreamProcessorsRequest *)request
     completionHandler:(void (^)(AWSRekognitionListStreamProcessorsResponse *response, NSError *error))completionHandler {
    [[self listStreamProcessors:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionListStreamProcessorsResponse *> * _Nonnull task) {
        AWSRekognitionListStreamProcessorsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionRecognizeCelebritiesResponse *> *)recognizeCelebrities:(AWSRekognitionRecognizeCelebritiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"RecognizeCelebrities"
                   outputClass:[AWSRekognitionRecognizeCelebritiesResponse class]];
}

- (void)recognizeCelebrities:(AWSRekognitionRecognizeCelebritiesRequest *)request
     completionHandler:(void (^)(AWSRekognitionRecognizeCelebritiesResponse *response, NSError *error))completionHandler {
    [[self recognizeCelebrities:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionRecognizeCelebritiesResponse *> * _Nonnull task) {
        AWSRekognitionRecognizeCelebritiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionSearchFacesResponse *> *)searchFaces:(AWSRekognitionSearchFacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"SearchFaces"
                   outputClass:[AWSRekognitionSearchFacesResponse class]];
}

- (void)searchFaces:(AWSRekognitionSearchFacesRequest *)request
     completionHandler:(void (^)(AWSRekognitionSearchFacesResponse *response, NSError *error))completionHandler {
    [[self searchFaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionSearchFacesResponse *> * _Nonnull task) {
        AWSRekognitionSearchFacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionSearchFacesByImageResponse *> *)searchFacesByImage:(AWSRekognitionSearchFacesByImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"SearchFacesByImage"
                   outputClass:[AWSRekognitionSearchFacesByImageResponse class]];
}

- (void)searchFacesByImage:(AWSRekognitionSearchFacesByImageRequest *)request
     completionHandler:(void (^)(AWSRekognitionSearchFacesByImageResponse *response, NSError *error))completionHandler {
    [[self searchFacesByImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionSearchFacesByImageResponse *> * _Nonnull task) {
        AWSRekognitionSearchFacesByImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartCelebrityRecognitionResponse *> *)startCelebrityRecognition:(AWSRekognitionStartCelebrityRecognitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartCelebrityRecognition"
                   outputClass:[AWSRekognitionStartCelebrityRecognitionResponse class]];
}

- (void)startCelebrityRecognition:(AWSRekognitionStartCelebrityRecognitionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartCelebrityRecognitionResponse *response, NSError *error))completionHandler {
    [[self startCelebrityRecognition:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartCelebrityRecognitionResponse *> * _Nonnull task) {
        AWSRekognitionStartCelebrityRecognitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartContentModerationResponse *> *)startContentModeration:(AWSRekognitionStartContentModerationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartContentModeration"
                   outputClass:[AWSRekognitionStartContentModerationResponse class]];
}

- (void)startContentModeration:(AWSRekognitionStartContentModerationRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartContentModerationResponse *response, NSError *error))completionHandler {
    [[self startContentModeration:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartContentModerationResponse *> * _Nonnull task) {
        AWSRekognitionStartContentModerationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartFaceDetectionResponse *> *)startFaceDetection:(AWSRekognitionStartFaceDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartFaceDetection"
                   outputClass:[AWSRekognitionStartFaceDetectionResponse class]];
}

- (void)startFaceDetection:(AWSRekognitionStartFaceDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartFaceDetectionResponse *response, NSError *error))completionHandler {
    [[self startFaceDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartFaceDetectionResponse *> * _Nonnull task) {
        AWSRekognitionStartFaceDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartFaceSearchResponse *> *)startFaceSearch:(AWSRekognitionStartFaceSearchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartFaceSearch"
                   outputClass:[AWSRekognitionStartFaceSearchResponse class]];
}

- (void)startFaceSearch:(AWSRekognitionStartFaceSearchRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartFaceSearchResponse *response, NSError *error))completionHandler {
    [[self startFaceSearch:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartFaceSearchResponse *> * _Nonnull task) {
        AWSRekognitionStartFaceSearchResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartLabelDetectionResponse *> *)startLabelDetection:(AWSRekognitionStartLabelDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartLabelDetection"
                   outputClass:[AWSRekognitionStartLabelDetectionResponse class]];
}

- (void)startLabelDetection:(AWSRekognitionStartLabelDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartLabelDetectionResponse *response, NSError *error))completionHandler {
    [[self startLabelDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartLabelDetectionResponse *> * _Nonnull task) {
        AWSRekognitionStartLabelDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartPersonTrackingResponse *> *)startPersonTracking:(AWSRekognitionStartPersonTrackingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartPersonTracking"
                   outputClass:[AWSRekognitionStartPersonTrackingResponse class]];
}

- (void)startPersonTracking:(AWSRekognitionStartPersonTrackingRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartPersonTrackingResponse *response, NSError *error))completionHandler {
    [[self startPersonTracking:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartPersonTrackingResponse *> * _Nonnull task) {
        AWSRekognitionStartPersonTrackingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartProjectVersionResponse *> *)startProjectVersion:(AWSRekognitionStartProjectVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartProjectVersion"
                   outputClass:[AWSRekognitionStartProjectVersionResponse class]];
}

- (void)startProjectVersion:(AWSRekognitionStartProjectVersionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartProjectVersionResponse *response, NSError *error))completionHandler {
    [[self startProjectVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartProjectVersionResponse *> * _Nonnull task) {
        AWSRekognitionStartProjectVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartStreamProcessorResponse *> *)startStreamProcessor:(AWSRekognitionStartStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartStreamProcessor"
                   outputClass:[AWSRekognitionStartStreamProcessorResponse class]];
}

- (void)startStreamProcessor:(AWSRekognitionStartStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self startStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionStartStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStartTextDetectionResponse *> *)startTextDetection:(AWSRekognitionStartTextDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StartTextDetection"
                   outputClass:[AWSRekognitionStartTextDetectionResponse class]];
}

- (void)startTextDetection:(AWSRekognitionStartTextDetectionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStartTextDetectionResponse *response, NSError *error))completionHandler {
    [[self startTextDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStartTextDetectionResponse *> * _Nonnull task) {
        AWSRekognitionStartTextDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStopProjectVersionResponse *> *)stopProjectVersion:(AWSRekognitionStopProjectVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StopProjectVersion"
                   outputClass:[AWSRekognitionStopProjectVersionResponse class]];
}

- (void)stopProjectVersion:(AWSRekognitionStopProjectVersionRequest *)request
     completionHandler:(void (^)(AWSRekognitionStopProjectVersionResponse *response, NSError *error))completionHandler {
    [[self stopProjectVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStopProjectVersionResponse *> * _Nonnull task) {
        AWSRekognitionStopProjectVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRekognitionStopStreamProcessorResponse *> *)stopStreamProcessor:(AWSRekognitionStopStreamProcessorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"RekognitionService"
                 operationName:@"StopStreamProcessor"
                   outputClass:[AWSRekognitionStopStreamProcessorResponse class]];
}

- (void)stopStreamProcessor:(AWSRekognitionStopStreamProcessorRequest *)request
     completionHandler:(void (^)(AWSRekognitionStopStreamProcessorResponse *response, NSError *error))completionHandler {
    [[self stopStreamProcessor:request] continueWithBlock:^id _Nullable(AWSTask<AWSRekognitionStopStreamProcessorResponse *> * _Nonnull task) {
        AWSRekognitionStopStreamProcessorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
