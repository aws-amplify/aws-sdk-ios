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

#import "AWSEcrService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSEcrResources.h"

static NSString *const AWSInfoEcr = @"Ecr";
NSString *const AWSEcrSDKVersion = @"2.13.3";


@interface AWSEcrResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSEcrResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"EmptyUploadException" : @(AWSEcrErrorEmptyUpload),
                            @"ImageAlreadyExistsException" : @(AWSEcrErrorImageAlreadyExists),
                            @"ImageNotFoundException" : @(AWSEcrErrorImageNotFound),
                            @"ImageTagAlreadyExistsException" : @(AWSEcrErrorImageTagAlreadyExists),
                            @"InvalidLayerException" : @(AWSEcrErrorInvalidLayer),
                            @"InvalidLayerPartException" : @(AWSEcrErrorInvalidLayerPart),
                            @"InvalidParameterException" : @(AWSEcrErrorInvalidParameter),
                            @"InvalidTagParameterException" : @(AWSEcrErrorInvalidTagParameter),
                            @"LayerAlreadyExistsException" : @(AWSEcrErrorLayerAlreadyExists),
                            @"LayerInaccessibleException" : @(AWSEcrErrorLayerInaccessible),
                            @"LayerPartTooSmallException" : @(AWSEcrErrorLayerPartTooSmall),
                            @"LayersNotFoundException" : @(AWSEcrErrorLayersNotFound),
                            @"LifecyclePolicyNotFoundException" : @(AWSEcrErrorLifecyclePolicyNotFound),
                            @"LifecyclePolicyPreviewInProgressException" : @(AWSEcrErrorLifecyclePolicyPreviewInProgress),
                            @"LifecyclePolicyPreviewNotFoundException" : @(AWSEcrErrorLifecyclePolicyPreviewNotFound),
                            @"LimitExceededException" : @(AWSEcrErrorLimitExceeded),
                            @"ReferencedImagesNotFoundException" : @(AWSEcrErrorReferencedImagesNotFound),
                            @"RepositoryAlreadyExistsException" : @(AWSEcrErrorRepositoryAlreadyExists),
                            @"RepositoryNotEmptyException" : @(AWSEcrErrorRepositoryNotEmpty),
                            @"RepositoryNotFoundException" : @(AWSEcrErrorRepositoryNotFound),
                            @"RepositoryPolicyNotFoundException" : @(AWSEcrErrorRepositoryPolicyNotFound),
                            @"ScanNotFoundException" : @(AWSEcrErrorScanNotFound),
                            @"ServerException" : @(AWSEcrErrorServer),
                            @"TooManyTagsException" : @(AWSEcrErrorTooManyTags),
                            @"UnsupportedImageTypeException" : @(AWSEcrErrorUnsupportedImageType),
                            @"UploadNotFoundException" : @(AWSEcrErrorUploadNotFound),
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
	                *error = [NSError errorWithDomain:AWSEcrErrorDomain
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
        *error = [NSError errorWithDomain:AWSEcrErrorDomain
                                     code:AWSEcrErrorUnknown
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

@interface AWSEcrRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSEcrRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSEcr()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSEcr

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSEcrSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSEcr versions need to match. Check your SDK installation. AWSCore: %@ AWSEcr: %@", AWSiOSSDKVersion, AWSEcrSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultEcr {
    static AWSEcr *_defaultEcr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoEcr];
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
        _defaultEcr = [[AWSEcr alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultEcr;
}

+ (void)registerEcrWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSEcr alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)EcrForKey:(NSString *)key {
    @synchronized(self) {
        AWSEcr *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoEcr
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSEcr registerEcrWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeEcrForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultEcr` or `+ EcrForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceEcr
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceEcr];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSEcrRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSEcrResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSEcrResponseSerializer alloc] initWithJSONDefinition:[[AWSEcrResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSEcrBatchCheckLayerAvailabilityResponse *> *)batchCheckLayerAvailability:(AWSEcrBatchCheckLayerAvailabilityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"BatchCheckLayerAvailability"
                   outputClass:[AWSEcrBatchCheckLayerAvailabilityResponse class]];
}

- (void)batchCheckLayerAvailability:(AWSEcrBatchCheckLayerAvailabilityRequest *)request
     completionHandler:(void (^)(AWSEcrBatchCheckLayerAvailabilityResponse *response, NSError *error))completionHandler {
    [[self batchCheckLayerAvailability:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrBatchCheckLayerAvailabilityResponse *> * _Nonnull task) {
        AWSEcrBatchCheckLayerAvailabilityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrBatchDeleteImageResponse *> *)batchDeleteImage:(AWSEcrBatchDeleteImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"BatchDeleteImage"
                   outputClass:[AWSEcrBatchDeleteImageResponse class]];
}

- (void)batchDeleteImage:(AWSEcrBatchDeleteImageRequest *)request
     completionHandler:(void (^)(AWSEcrBatchDeleteImageResponse *response, NSError *error))completionHandler {
    [[self batchDeleteImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrBatchDeleteImageResponse *> * _Nonnull task) {
        AWSEcrBatchDeleteImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrBatchGetImageResponse *> *)batchGetImage:(AWSEcrBatchGetImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"BatchGetImage"
                   outputClass:[AWSEcrBatchGetImageResponse class]];
}

- (void)batchGetImage:(AWSEcrBatchGetImageRequest *)request
     completionHandler:(void (^)(AWSEcrBatchGetImageResponse *response, NSError *error))completionHandler {
    [[self batchGetImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrBatchGetImageResponse *> * _Nonnull task) {
        AWSEcrBatchGetImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrCompleteLayerUploadResponse *> *)completeLayerUpload:(AWSEcrCompleteLayerUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"CompleteLayerUpload"
                   outputClass:[AWSEcrCompleteLayerUploadResponse class]];
}

- (void)completeLayerUpload:(AWSEcrCompleteLayerUploadRequest *)request
     completionHandler:(void (^)(AWSEcrCompleteLayerUploadResponse *response, NSError *error))completionHandler {
    [[self completeLayerUpload:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrCompleteLayerUploadResponse *> * _Nonnull task) {
        AWSEcrCompleteLayerUploadResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrCreateRepositoryResponse *> *)createRepository:(AWSEcrCreateRepositoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"CreateRepository"
                   outputClass:[AWSEcrCreateRepositoryResponse class]];
}

- (void)createRepository:(AWSEcrCreateRepositoryRequest *)request
     completionHandler:(void (^)(AWSEcrCreateRepositoryResponse *response, NSError *error))completionHandler {
    [[self createRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrCreateRepositoryResponse *> * _Nonnull task) {
        AWSEcrCreateRepositoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrDeleteLifecyclePolicyResponse *> *)deleteLifecyclePolicy:(AWSEcrDeleteLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DeleteLifecyclePolicy"
                   outputClass:[AWSEcrDeleteLifecyclePolicyResponse class]];
}

- (void)deleteLifecyclePolicy:(AWSEcrDeleteLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSEcrDeleteLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self deleteLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrDeleteLifecyclePolicyResponse *> * _Nonnull task) {
        AWSEcrDeleteLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrDeleteRepositoryResponse *> *)deleteRepository:(AWSEcrDeleteRepositoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DeleteRepository"
                   outputClass:[AWSEcrDeleteRepositoryResponse class]];
}

- (void)deleteRepository:(AWSEcrDeleteRepositoryRequest *)request
     completionHandler:(void (^)(AWSEcrDeleteRepositoryResponse *response, NSError *error))completionHandler {
    [[self deleteRepository:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrDeleteRepositoryResponse *> * _Nonnull task) {
        AWSEcrDeleteRepositoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrDeleteRepositoryPolicyResponse *> *)deleteRepositoryPolicy:(AWSEcrDeleteRepositoryPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DeleteRepositoryPolicy"
                   outputClass:[AWSEcrDeleteRepositoryPolicyResponse class]];
}

- (void)deleteRepositoryPolicy:(AWSEcrDeleteRepositoryPolicyRequest *)request
     completionHandler:(void (^)(AWSEcrDeleteRepositoryPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteRepositoryPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrDeleteRepositoryPolicyResponse *> * _Nonnull task) {
        AWSEcrDeleteRepositoryPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrDescribeImageScanFindingsResponse *> *)describeImageScanFindings:(AWSEcrDescribeImageScanFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DescribeImageScanFindings"
                   outputClass:[AWSEcrDescribeImageScanFindingsResponse class]];
}

- (void)describeImageScanFindings:(AWSEcrDescribeImageScanFindingsRequest *)request
     completionHandler:(void (^)(AWSEcrDescribeImageScanFindingsResponse *response, NSError *error))completionHandler {
    [[self describeImageScanFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrDescribeImageScanFindingsResponse *> * _Nonnull task) {
        AWSEcrDescribeImageScanFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrDescribeImagesResponse *> *)describeImages:(AWSEcrDescribeImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DescribeImages"
                   outputClass:[AWSEcrDescribeImagesResponse class]];
}

- (void)describeImages:(AWSEcrDescribeImagesRequest *)request
     completionHandler:(void (^)(AWSEcrDescribeImagesResponse *response, NSError *error))completionHandler {
    [[self describeImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrDescribeImagesResponse *> * _Nonnull task) {
        AWSEcrDescribeImagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrDescribeRepositoriesResponse *> *)describeRepositories:(AWSEcrDescribeRepositoriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"DescribeRepositories"
                   outputClass:[AWSEcrDescribeRepositoriesResponse class]];
}

- (void)describeRepositories:(AWSEcrDescribeRepositoriesRequest *)request
     completionHandler:(void (^)(AWSEcrDescribeRepositoriesResponse *response, NSError *error))completionHandler {
    [[self describeRepositories:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrDescribeRepositoriesResponse *> * _Nonnull task) {
        AWSEcrDescribeRepositoriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrGetAuthorizationTokenResponse *> *)getAuthorizationToken:(AWSEcrGetAuthorizationTokenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"GetAuthorizationToken"
                   outputClass:[AWSEcrGetAuthorizationTokenResponse class]];
}

- (void)getAuthorizationToken:(AWSEcrGetAuthorizationTokenRequest *)request
     completionHandler:(void (^)(AWSEcrGetAuthorizationTokenResponse *response, NSError *error))completionHandler {
    [[self getAuthorizationToken:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrGetAuthorizationTokenResponse *> * _Nonnull task) {
        AWSEcrGetAuthorizationTokenResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrGetDownloadUrlForLayerResponse *> *)getDownloadUrlForLayer:(AWSEcrGetDownloadUrlForLayerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"GetDownloadUrlForLayer"
                   outputClass:[AWSEcrGetDownloadUrlForLayerResponse class]];
}

- (void)getDownloadUrlForLayer:(AWSEcrGetDownloadUrlForLayerRequest *)request
     completionHandler:(void (^)(AWSEcrGetDownloadUrlForLayerResponse *response, NSError *error))completionHandler {
    [[self getDownloadUrlForLayer:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrGetDownloadUrlForLayerResponse *> * _Nonnull task) {
        AWSEcrGetDownloadUrlForLayerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrGetLifecyclePolicyResponse *> *)getLifecyclePolicy:(AWSEcrGetLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"GetLifecyclePolicy"
                   outputClass:[AWSEcrGetLifecyclePolicyResponse class]];
}

- (void)getLifecyclePolicy:(AWSEcrGetLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSEcrGetLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self getLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrGetLifecyclePolicyResponse *> * _Nonnull task) {
        AWSEcrGetLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrGetLifecyclePolicyPreviewResponse *> *)getLifecyclePolicyPreview:(AWSEcrGetLifecyclePolicyPreviewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"GetLifecyclePolicyPreview"
                   outputClass:[AWSEcrGetLifecyclePolicyPreviewResponse class]];
}

- (void)getLifecyclePolicyPreview:(AWSEcrGetLifecyclePolicyPreviewRequest *)request
     completionHandler:(void (^)(AWSEcrGetLifecyclePolicyPreviewResponse *response, NSError *error))completionHandler {
    [[self getLifecyclePolicyPreview:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrGetLifecyclePolicyPreviewResponse *> * _Nonnull task) {
        AWSEcrGetLifecyclePolicyPreviewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrGetRepositoryPolicyResponse *> *)getRepositoryPolicy:(AWSEcrGetRepositoryPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"GetRepositoryPolicy"
                   outputClass:[AWSEcrGetRepositoryPolicyResponse class]];
}

- (void)getRepositoryPolicy:(AWSEcrGetRepositoryPolicyRequest *)request
     completionHandler:(void (^)(AWSEcrGetRepositoryPolicyResponse *response, NSError *error))completionHandler {
    [[self getRepositoryPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrGetRepositoryPolicyResponse *> * _Nonnull task) {
        AWSEcrGetRepositoryPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrInitiateLayerUploadResponse *> *)initiateLayerUpload:(AWSEcrInitiateLayerUploadRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"InitiateLayerUpload"
                   outputClass:[AWSEcrInitiateLayerUploadResponse class]];
}

- (void)initiateLayerUpload:(AWSEcrInitiateLayerUploadRequest *)request
     completionHandler:(void (^)(AWSEcrInitiateLayerUploadResponse *response, NSError *error))completionHandler {
    [[self initiateLayerUpload:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrInitiateLayerUploadResponse *> * _Nonnull task) {
        AWSEcrInitiateLayerUploadResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrListImagesResponse *> *)listImages:(AWSEcrListImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"ListImages"
                   outputClass:[AWSEcrListImagesResponse class]];
}

- (void)listImages:(AWSEcrListImagesRequest *)request
     completionHandler:(void (^)(AWSEcrListImagesResponse *response, NSError *error))completionHandler {
    [[self listImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrListImagesResponse *> * _Nonnull task) {
        AWSEcrListImagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrListTagsForResourceResponse *> *)listTagsForResource:(AWSEcrListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSEcrListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSEcrListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSEcrListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrListTagsForResourceResponse *> * _Nonnull task) {
        AWSEcrListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrPutImageResponse *> *)putImage:(AWSEcrPutImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"PutImage"
                   outputClass:[AWSEcrPutImageResponse class]];
}

- (void)putImage:(AWSEcrPutImageRequest *)request
     completionHandler:(void (^)(AWSEcrPutImageResponse *response, NSError *error))completionHandler {
    [[self putImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrPutImageResponse *> * _Nonnull task) {
        AWSEcrPutImageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrPutImageScanningConfigurationResponse *> *)putImageScanningConfiguration:(AWSEcrPutImageScanningConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"PutImageScanningConfiguration"
                   outputClass:[AWSEcrPutImageScanningConfigurationResponse class]];
}

- (void)putImageScanningConfiguration:(AWSEcrPutImageScanningConfigurationRequest *)request
     completionHandler:(void (^)(AWSEcrPutImageScanningConfigurationResponse *response, NSError *error))completionHandler {
    [[self putImageScanningConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrPutImageScanningConfigurationResponse *> * _Nonnull task) {
        AWSEcrPutImageScanningConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrPutImageTagMutabilityResponse *> *)putImageTagMutability:(AWSEcrPutImageTagMutabilityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"PutImageTagMutability"
                   outputClass:[AWSEcrPutImageTagMutabilityResponse class]];
}

- (void)putImageTagMutability:(AWSEcrPutImageTagMutabilityRequest *)request
     completionHandler:(void (^)(AWSEcrPutImageTagMutabilityResponse *response, NSError *error))completionHandler {
    [[self putImageTagMutability:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrPutImageTagMutabilityResponse *> * _Nonnull task) {
        AWSEcrPutImageTagMutabilityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrPutLifecyclePolicyResponse *> *)putLifecyclePolicy:(AWSEcrPutLifecyclePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"PutLifecyclePolicy"
                   outputClass:[AWSEcrPutLifecyclePolicyResponse class]];
}

- (void)putLifecyclePolicy:(AWSEcrPutLifecyclePolicyRequest *)request
     completionHandler:(void (^)(AWSEcrPutLifecyclePolicyResponse *response, NSError *error))completionHandler {
    [[self putLifecyclePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrPutLifecyclePolicyResponse *> * _Nonnull task) {
        AWSEcrPutLifecyclePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrSetRepositoryPolicyResponse *> *)setRepositoryPolicy:(AWSEcrSetRepositoryPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"SetRepositoryPolicy"
                   outputClass:[AWSEcrSetRepositoryPolicyResponse class]];
}

- (void)setRepositoryPolicy:(AWSEcrSetRepositoryPolicyRequest *)request
     completionHandler:(void (^)(AWSEcrSetRepositoryPolicyResponse *response, NSError *error))completionHandler {
    [[self setRepositoryPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrSetRepositoryPolicyResponse *> * _Nonnull task) {
        AWSEcrSetRepositoryPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrStartImageScanResponse *> *)startImageScan:(AWSEcrStartImageScanRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"StartImageScan"
                   outputClass:[AWSEcrStartImageScanResponse class]];
}

- (void)startImageScan:(AWSEcrStartImageScanRequest *)request
     completionHandler:(void (^)(AWSEcrStartImageScanResponse *response, NSError *error))completionHandler {
    [[self startImageScan:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrStartImageScanResponse *> * _Nonnull task) {
        AWSEcrStartImageScanResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrStartLifecyclePolicyPreviewResponse *> *)startLifecyclePolicyPreview:(AWSEcrStartLifecyclePolicyPreviewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"StartLifecyclePolicyPreview"
                   outputClass:[AWSEcrStartLifecyclePolicyPreviewResponse class]];
}

- (void)startLifecyclePolicyPreview:(AWSEcrStartLifecyclePolicyPreviewRequest *)request
     completionHandler:(void (^)(AWSEcrStartLifecyclePolicyPreviewResponse *response, NSError *error))completionHandler {
    [[self startLifecyclePolicyPreview:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrStartLifecyclePolicyPreviewResponse *> * _Nonnull task) {
        AWSEcrStartLifecyclePolicyPreviewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrTagResourceResponse *> *)tagResource:(AWSEcrTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"TagResource"
                   outputClass:[AWSEcrTagResourceResponse class]];
}

- (void)tagResource:(AWSEcrTagResourceRequest *)request
     completionHandler:(void (^)(AWSEcrTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrTagResourceResponse *> * _Nonnull task) {
        AWSEcrTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrUntagResourceResponse *> *)untagResource:(AWSEcrUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"UntagResource"
                   outputClass:[AWSEcrUntagResourceResponse class]];
}

- (void)untagResource:(AWSEcrUntagResourceRequest *)request
     completionHandler:(void (^)(AWSEcrUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrUntagResourceResponse *> * _Nonnull task) {
        AWSEcrUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEcrUploadLayerPartResponse *> *)uploadLayerPart:(AWSEcrUploadLayerPartRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonEC2ContainerRegistry_V20150921"
                 operationName:@"UploadLayerPart"
                   outputClass:[AWSEcrUploadLayerPartResponse class]];
}

- (void)uploadLayerPart:(AWSEcrUploadLayerPartRequest *)request
     completionHandler:(void (^)(AWSEcrUploadLayerPartResponse *response, NSError *error))completionHandler {
    [[self uploadLayerPart:request] continueWithBlock:^id _Nullable(AWSTask<AWSEcrUploadLayerPartResponse *> * _Nonnull task) {
        AWSEcrUploadLayerPartResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
