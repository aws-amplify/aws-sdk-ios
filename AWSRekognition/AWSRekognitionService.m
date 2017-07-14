//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <AWSCore/AWSNetworking.h>
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
static NSString *const AWSRekognitionSDKVersion = @"2.5.9";


@interface AWSRekognitionResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSRekognitionResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSRekognitionErrorAccessDenied),
                            @"ImageTooLargeException" : @(AWSRekognitionErrorImageTooLarge),
                            @"InternalServerError" : @(AWSRekognitionErrorInternalServer),
                            @"InvalidImageFormatException" : @(AWSRekognitionErrorInvalidImageFormat),
                            @"InvalidPaginationTokenException" : @(AWSRekognitionErrorInvalidPaginationToken),
                            @"InvalidParameterException" : @(AWSRekognitionErrorInvalidParameter),
                            @"InvalidS3ObjectException" : @(AWSRekognitionErrorInvalidS3Object),
                            @"ProvisionedThroughputExceededException" : @(AWSRekognitionErrorProvisionedThroughputExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSRekognitionErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSRekognitionErrorResourceNotFound),
                            @"ThrottlingException" : @(AWSRekognitionErrorThrottling),
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
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
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

#pragma mark -

@end
