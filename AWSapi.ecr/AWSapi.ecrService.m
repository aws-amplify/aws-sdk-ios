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

#import "AWSapi.ecrService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSapi.ecrResources.h"

static NSString *const AWSInfoapi.ecr = @"api.ecr";
NSString *const AWSapi.ecrSDKVersion = @"2.13.2";


@interface AWSapi.ecrResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSapi.ecrResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"EmptyUploadException" : @(AWSapi.ecrErrorEmptyUpload),
                            @"ImageAlreadyExistsException" : @(AWSapi.ecrErrorImageAlreadyExists),
                            @"ImageNotFoundException" : @(AWSapi.ecrErrorImageNotFound),
                            @"ImageTagAlreadyExistsException" : @(AWSapi.ecrErrorImageTagAlreadyExists),
                            @"InvalidLayerException" : @(AWSapi.ecrErrorInvalidLayer),
                            @"InvalidLayerPartException" : @(AWSapi.ecrErrorInvalidLayerPart),
                            @"InvalidParameterException" : @(AWSapi.ecrErrorInvalidParameter),
                            @"InvalidTagParameterException" : @(AWSapi.ecrErrorInvalidTagParameter),
                            @"LayerAlreadyExistsException" : @(AWSapi.ecrErrorLayerAlreadyExists),
                            @"LayerInaccessibleException" : @(AWSapi.ecrErrorLayerInaccessible),
                            @"LayerPartTooSmallException" : @(AWSapi.ecrErrorLayerPartTooSmall),
                            @"LayersNotFoundException" : @(AWSapi.ecrErrorLayersNotFound),
                            @"LifecyclePolicyNotFoundException" : @(AWSapi.ecrErrorLifecyclePolicyNotFound),
                            @"LifecyclePolicyPreviewInProgressException" : @(AWSapi.ecrErrorLifecyclePolicyPreviewInProgress),
                            @"LifecyclePolicyPreviewNotFoundException" : @(AWSapi.ecrErrorLifecyclePolicyPreviewNotFound),
                            @"LimitExceededException" : @(AWSapi.ecrErrorLimitExceeded),
                            @"ReferencedImagesNotFoundException" : @(AWSapi.ecrErrorReferencedImagesNotFound),
                            @"RepositoryAlreadyExistsException" : @(AWSapi.ecrErrorRepositoryAlreadyExists),
                            @"RepositoryNotEmptyException" : @(AWSapi.ecrErrorRepositoryNotEmpty),
                            @"RepositoryNotFoundException" : @(AWSapi.ecrErrorRepositoryNotFound),
                            @"RepositoryPolicyNotFoundException" : @(AWSapi.ecrErrorRepositoryPolicyNotFound),
                            @"ScanNotFoundException" : @(AWSapi.ecrErrorScanNotFound),
                            @"ServerException" : @(AWSapi.ecrErrorServer),
                            @"TooManyTagsException" : @(AWSapi.ecrErrorTooManyTags),
                            @"UnsupportedImageTypeException" : @(AWSapi.ecrErrorUnsupportedImageType),
                            @"UploadNotFoundException" : @(AWSapi.ecrErrorUploadNotFound),
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
	                *error = [NSError errorWithDomain:AWSapi.ecrErrorDomain
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
        *error = [NSError errorWithDomain:AWSapi.ecrErrorDomain
                                     code:AWSapi.ecrErrorUnknown
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

@interface AWSapi.ecrRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSapi.ecrRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSapi.ecr()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSapi.ecr

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSapi.ecrSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSapi.ecr versions need to match. Check your SDK installation. AWSCore: %@ AWSapi.ecr: %@", AWSiOSSDKVersion, AWSapi.ecrSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultapi.ecr {
    static AWSapi.ecr *_defaultapi.ecr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoapi.ecr];
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
        _defaultapi.ecr = [[AWSapi.ecr alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultapi.ecr;
}

+ (void)registerapi.ecrWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSapi.ecr alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)api.ecrForKey:(NSString *)key {
    @synchronized(self) {
        AWSapi.ecr *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoapi.ecr
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSapi.ecr registerapi.ecrWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeapi.ecrForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultapi.ecr` or `+ api.ecrForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceapi.ecr
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceapi.ecr];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSapi.ecrRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSapi.ecrResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSapi.ecrResponseSerializer alloc] initWithJSONDefinition:[[AWSapi.ecrResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSapi.ecrBatchCheckLayerAvailabilityResponse *> *)batchCheckLayerAvailability:(AWSapi.ecrBatchCheckLayerAvailabilityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"BatchCheckLayerAvailability"
                   outputClass:[AWSapi.ecrBatchCheckLayerAvailabilityResponse class]];
}

- (void)batchCheckLayerAvailability:(AWSapi.ecrBatchCheckLayerAvailabilityRequest *)request
     completionHandler:(void (^)(AWSapi.ecrBatchCheckLayerAvailabilityResponse *response, NSError *error))completionHandler {
    [[self batchCheckLayerAvailability:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrBatchCheckLayerAvailabilityResponse *> * _Nonnull task) {
        AWSapi.ecrBatchCheckLayerAvailabilityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrBatchDeleteImageResponse *> *)batchDeleteImage:(AWSapi.ecrBatchDeleteImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"BatchDeleteImage"
                   outputClass:[AWSapi.ecrBatchDeleteImageResponse class]];
}

- (void)batchDeleteImage:(AWSapi.ecrBatchDeleteImageRequest *)request
     completionHandler:(void (^)(AWSapi.ecrBatchDeleteImageResponse *response, NSError *error))completionHandler {
    [[self batchDeleteImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrBatchDeleteImageResponse *> * _Nonnull task) {
        AWSapi.ecrBatchDeleteImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrBatchGetImageResponse *> *)batchGetImage:(AWSapi.ecrBatchGetImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"BatchGetImage"
                   outputClass:[AWSapi.ecrBatchGetImageResponse class]];
}

- (void)batchGetImage:(AWSapi.ecrBatchGetImageRequest *)request
     completionHandler:(void (^)(AWSapi.ecrBatchGetImageResponse *response, NSError *error))completionHandler {
    [[self batchGetImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrBatchGetImageResponse *> * _Nonnull task) {
        AWSapi.ecrBatchGetImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrCompleteLayerUploadResponse *> *)completeLayerUpload:(AWSapi.ecrCompleteLayerUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"CompleteLayerUpload"
                   outputClass:[AWSapi.ecrCompleteLayerUploadResponse class]];
}

- (void)completeLayerUpload:(AWSapi.ecrCompleteLayerUploadRequest *)request
     completionHandler:(void (^)(AWSapi.ecrCompleteLayerUploadResponse *response, NSError *error))completionHandler {
    [[self completeLayerUpload:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrCompleteLayerUploadResponse *> * _Nonnull task) {
        AWSapi.ecrCompleteLayerUploadResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrCreateRepositoryResponse *> *)createRepository:(AWSapi.ecrCreateRepositoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"CreateRepository"
                   outputClass:[AWSapi.ecrCreateRepositoryResponse class]];
}

- (void)createRepository:(AWSapi.ecrCreateRepositoryRequest *)request
     completionHandler:(void (^)(AWSapi.ecrCreateRepositoryResponse *response, NSError *error))completionHandler {
    [[self createRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrCreateRepositoryResponse *> * _Nonnull task) {
        AWSapi.ecrCreateRepositoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrDeleteLifecyclePolicyResponse *> *)deleteLifecyclePolicy:(AWSapi.ecrDeleteLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DeleteLifecyclePolicy"
                   outputClass:[AWSapi.ecrDeleteLifecyclePolicyResponse class]];
}

- (void)deleteLifecyclePolicy:(AWSapi.ecrDeleteLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSapi.ecrDeleteLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self deleteLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrDeleteLifecyclePolicyResponse *> * _Nonnull task) {
        AWSapi.ecrDeleteLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrDeleteRepositoryResponse *> *)deleteRepository:(AWSapi.ecrDeleteRepositoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DeleteRepository"
                   outputClass:[AWSapi.ecrDeleteRepositoryResponse class]];
}

- (void)deleteRepository:(AWSapi.ecrDeleteRepositoryRequest *)request
     completionHandler:(void (^)(AWSapi.ecrDeleteRepositoryResponse *response, NSError *error))completionHandler {
    [[self deleteRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrDeleteRepositoryResponse *> * _Nonnull task) {
        AWSapi.ecrDeleteRepositoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrDeleteRepositoryPolicyResponse *> *)deleteRepositoryPolicy:(AWSapi.ecrDeleteRepositoryPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DeleteRepositoryPolicy"
                   outputClass:[AWSapi.ecrDeleteRepositoryPolicyResponse class]];
}

- (void)deleteRepositoryPolicy:(AWSapi.ecrDeleteRepositoryPolicyRequest *)request
     completionHandler:(void (^)(AWSapi.ecrDeleteRepositoryPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteRepositoryPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrDeleteRepositoryPolicyResponse *> * _Nonnull task) {
        AWSapi.ecrDeleteRepositoryPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrDescribeImageScanFindingsResponse *> *)describeImageScanFindings:(AWSapi.ecrDescribeImageScanFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DescribeImageScanFindings"
                   outputClass:[AWSapi.ecrDescribeImageScanFindingsResponse class]];
}

- (void)describeImageScanFindings:(AWSapi.ecrDescribeImageScanFindingsRequest *)request
     completionHandler:(void (^)(AWSapi.ecrDescribeImageScanFindingsResponse *response, NSError *error))completionHandler {
    [[self describeImageScanFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrDescribeImageScanFindingsResponse *> * _Nonnull task) {
        AWSapi.ecrDescribeImageScanFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrDescribeImagesResponse *> *)describeImages:(AWSapi.ecrDescribeImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DescribeImages"
                   outputClass:[AWSapi.ecrDescribeImagesResponse class]];
}

- (void)describeImages:(AWSapi.ecrDescribeImagesRequest *)request
     completionHandler:(void (^)(AWSapi.ecrDescribeImagesResponse *response, NSError *error))completionHandler {
    [[self describeImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrDescribeImagesResponse *> * _Nonnull task) {
        AWSapi.ecrDescribeImagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrDescribeRepositoriesResponse *> *)describeRepositories:(AWSapi.ecrDescribeRepositoriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DescribeRepositories"
                   outputClass:[AWSapi.ecrDescribeRepositoriesResponse class]];
}

- (void)describeRepositories:(AWSapi.ecrDescribeRepositoriesRequest *)request
     completionHandler:(void (^)(AWSapi.ecrDescribeRepositoriesResponse *response, NSError *error))completionHandler {
    [[self describeRepositories:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrDescribeRepositoriesResponse *> * _Nonnull task) {
        AWSapi.ecrDescribeRepositoriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrGetAuthorizationTokenResponse *> *)getAuthorizationToken:(AWSapi.ecrGetAuthorizationTokenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"GetAuthorizationToken"
                   outputClass:[AWSapi.ecrGetAuthorizationTokenResponse class]];
}

- (void)getAuthorizationToken:(AWSapi.ecrGetAuthorizationTokenRequest *)request
     completionHandler:(void (^)(AWSapi.ecrGetAuthorizationTokenResponse *response, NSError *error))completionHandler {
    [[self getAuthorizationToken:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrGetAuthorizationTokenResponse *> * _Nonnull task) {
        AWSapi.ecrGetAuthorizationTokenResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrGetDownloadUrlForLayerResponse *> *)getDownloadUrlForLayer:(AWSapi.ecrGetDownloadUrlForLayerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"GetDownloadUrlForLayer"
                   outputClass:[AWSapi.ecrGetDownloadUrlForLayerResponse class]];
}

- (void)getDownloadUrlForLayer:(AWSapi.ecrGetDownloadUrlForLayerRequest *)request
     completionHandler:(void (^)(AWSapi.ecrGetDownloadUrlForLayerResponse *response, NSError *error))completionHandler {
    [[self getDownloadUrlForLayer:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrGetDownloadUrlForLayerResponse *> * _Nonnull task) {
        AWSapi.ecrGetDownloadUrlForLayerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrGetLifecyclePolicyResponse *> *)getLifecyclePolicy:(AWSapi.ecrGetLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"GetLifecyclePolicy"
                   outputClass:[AWSapi.ecrGetLifecyclePolicyResponse class]];
}

- (void)getLifecyclePolicy:(AWSapi.ecrGetLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSapi.ecrGetLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self getLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrGetLifecyclePolicyResponse *> * _Nonnull task) {
        AWSapi.ecrGetLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrGetLifecyclePolicyPreviewResponse *> *)getLifecyclePolicyPreview:(AWSapi.ecrGetLifecyclePolicyPreviewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"GetLifecyclePolicyPreview"
                   outputClass:[AWSapi.ecrGetLifecyclePolicyPreviewResponse class]];
}

- (void)getLifecyclePolicyPreview:(AWSapi.ecrGetLifecyclePolicyPreviewRequest *)request
     completionHandler:(void (^)(AWSapi.ecrGetLifecyclePolicyPreviewResponse *response, NSError *error))completionHandler {
    [[self getLifecyclePolicyPreview:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrGetLifecyclePolicyPreviewResponse *> * _Nonnull task) {
        AWSapi.ecrGetLifecyclePolicyPreviewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrGetRepositoryPolicyResponse *> *)getRepositoryPolicy:(AWSapi.ecrGetRepositoryPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"GetRepositoryPolicy"
                   outputClass:[AWSapi.ecrGetRepositoryPolicyResponse class]];
}

- (void)getRepositoryPolicy:(AWSapi.ecrGetRepositoryPolicyRequest *)request
     completionHandler:(void (^)(AWSapi.ecrGetRepositoryPolicyResponse *response, NSError *error))completionHandler {
    [[self getRepositoryPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrGetRepositoryPolicyResponse *> * _Nonnull task) {
        AWSapi.ecrGetRepositoryPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrInitiateLayerUploadResponse *> *)initiateLayerUpload:(AWSapi.ecrInitiateLayerUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"InitiateLayerUpload"
                   outputClass:[AWSapi.ecrInitiateLayerUploadResponse class]];
}

- (void)initiateLayerUpload:(AWSapi.ecrInitiateLayerUploadRequest *)request
     completionHandler:(void (^)(AWSapi.ecrInitiateLayerUploadResponse *response, NSError *error))completionHandler {
    [[self initiateLayerUpload:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrInitiateLayerUploadResponse *> * _Nonnull task) {
        AWSapi.ecrInitiateLayerUploadResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrListImagesResponse *> *)listImages:(AWSapi.ecrListImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"ListImages"
                   outputClass:[AWSapi.ecrListImagesResponse class]];
}

- (void)listImages:(AWSapi.ecrListImagesRequest *)request
     completionHandler:(void (^)(AWSapi.ecrListImagesResponse *response, NSError *error))completionHandler {
    [[self listImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrListImagesResponse *> * _Nonnull task) {
        AWSapi.ecrListImagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrListTagsForResourceResponse *> *)listTagsForResource:(AWSapi.ecrListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSapi.ecrListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSapi.ecrListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSapi.ecrListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrListTagsForResourceResponse *> * _Nonnull task) {
        AWSapi.ecrListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrPutImageResponse *> *)putImage:(AWSapi.ecrPutImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"PutImage"
                   outputClass:[AWSapi.ecrPutImageResponse class]];
}

- (void)putImage:(AWSapi.ecrPutImageRequest *)request
     completionHandler:(void (^)(AWSapi.ecrPutImageResponse *response, NSError *error))completionHandler {
    [[self putImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrPutImageResponse *> * _Nonnull task) {
        AWSapi.ecrPutImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrPutImageScanningConfigurationResponse *> *)putImageScanningConfiguration:(AWSapi.ecrPutImageScanningConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"PutImageScanningConfiguration"
                   outputClass:[AWSapi.ecrPutImageScanningConfigurationResponse class]];
}

- (void)putImageScanningConfiguration:(AWSapi.ecrPutImageScanningConfigurationRequest *)request
     completionHandler:(void (^)(AWSapi.ecrPutImageScanningConfigurationResponse *response, NSError *error))completionHandler {
    [[self putImageScanningConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrPutImageScanningConfigurationResponse *> * _Nonnull task) {
        AWSapi.ecrPutImageScanningConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrPutImageTagMutabilityResponse *> *)putImageTagMutability:(AWSapi.ecrPutImageTagMutabilityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"PutImageTagMutability"
                   outputClass:[AWSapi.ecrPutImageTagMutabilityResponse class]];
}

- (void)putImageTagMutability:(AWSapi.ecrPutImageTagMutabilityRequest *)request
     completionHandler:(void (^)(AWSapi.ecrPutImageTagMutabilityResponse *response, NSError *error))completionHandler {
    [[self putImageTagMutability:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrPutImageTagMutabilityResponse *> * _Nonnull task) {
        AWSapi.ecrPutImageTagMutabilityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrPutLifecyclePolicyResponse *> *)putLifecyclePolicy:(AWSapi.ecrPutLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"PutLifecyclePolicy"
                   outputClass:[AWSapi.ecrPutLifecyclePolicyResponse class]];
}

- (void)putLifecyclePolicy:(AWSapi.ecrPutLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSapi.ecrPutLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self putLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrPutLifecyclePolicyResponse *> * _Nonnull task) {
        AWSapi.ecrPutLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrSetRepositoryPolicyResponse *> *)setRepositoryPolicy:(AWSapi.ecrSetRepositoryPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"SetRepositoryPolicy"
                   outputClass:[AWSapi.ecrSetRepositoryPolicyResponse class]];
}

- (void)setRepositoryPolicy:(AWSapi.ecrSetRepositoryPolicyRequest *)request
     completionHandler:(void (^)(AWSapi.ecrSetRepositoryPolicyResponse *response, NSError *error))completionHandler {
    [[self setRepositoryPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrSetRepositoryPolicyResponse *> * _Nonnull task) {
        AWSapi.ecrSetRepositoryPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrStartImageScanResponse *> *)startImageScan:(AWSapi.ecrStartImageScanRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"StartImageScan"
                   outputClass:[AWSapi.ecrStartImageScanResponse class]];
}

- (void)startImageScan:(AWSapi.ecrStartImageScanRequest *)request
     completionHandler:(void (^)(AWSapi.ecrStartImageScanResponse *response, NSError *error))completionHandler {
    [[self startImageScan:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrStartImageScanResponse *> * _Nonnull task) {
        AWSapi.ecrStartImageScanResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrStartLifecyclePolicyPreviewResponse *> *)startLifecyclePolicyPreview:(AWSapi.ecrStartLifecyclePolicyPreviewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"StartLifecyclePolicyPreview"
                   outputClass:[AWSapi.ecrStartLifecyclePolicyPreviewResponse class]];
}

- (void)startLifecyclePolicyPreview:(AWSapi.ecrStartLifecyclePolicyPreviewRequest *)request
     completionHandler:(void (^)(AWSapi.ecrStartLifecyclePolicyPreviewResponse *response, NSError *error))completionHandler {
    [[self startLifecyclePolicyPreview:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrStartLifecyclePolicyPreviewResponse *> * _Nonnull task) {
        AWSapi.ecrStartLifecyclePolicyPreviewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrTagResourceResponse *> *)tagResource:(AWSapi.ecrTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"TagResource"
                   outputClass:[AWSapi.ecrTagResourceResponse class]];
}

- (void)tagResource:(AWSapi.ecrTagResourceRequest *)request
     completionHandler:(void (^)(AWSapi.ecrTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrTagResourceResponse *> * _Nonnull task) {
        AWSapi.ecrTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrUntagResourceResponse *> *)untagResource:(AWSapi.ecrUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"UntagResource"
                   outputClass:[AWSapi.ecrUntagResourceResponse class]];
}

- (void)untagResource:(AWSapi.ecrUntagResourceRequest *)request
     completionHandler:(void (^)(AWSapi.ecrUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrUntagResourceResponse *> * _Nonnull task) {
        AWSapi.ecrUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapi.ecrUploadLayerPartResponse *> *)uploadLayerPart:(AWSapi.ecrUploadLayerPartRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"UploadLayerPart"
                   outputClass:[AWSapi.ecrUploadLayerPartResponse class]];
}

- (void)uploadLayerPart:(AWSapi.ecrUploadLayerPartRequest *)request
     completionHandler:(void (^)(AWSapi.ecrUploadLayerPartResponse *response, NSError *error))completionHandler {
    [[self uploadLayerPart:request] continueWithBlock:^id _Nullable(AWSTask<AWSapi.ecrUploadLayerPartResponse *> * _Nonnull task) {
        AWSapi.ecrUploadLayerPartResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
