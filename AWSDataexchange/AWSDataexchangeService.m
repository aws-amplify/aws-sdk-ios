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

#import "AWSDataexchangeService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSDataexchangeResources.h"

static NSString *const AWSInfoDataexchange = @"Dataexchange";
NSString *const AWSDataexchangeSDKVersion = @"2.13.4";


@interface AWSDataexchangeResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSDataexchangeResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSDataexchangeErrorAccessDenied),
                            @"ConflictException" : @(AWSDataexchangeErrorConflict),
                            @"InternalServerException" : @(AWSDataexchangeErrorInternalServer),
                            @"ResourceNotFoundException" : @(AWSDataexchangeErrorResourceNotFound),
                            @"ServiceLimitExceededException" : @(AWSDataexchangeErrorServiceLimitExceeded),
                            @"ThrottlingException" : @(AWSDataexchangeErrorThrottling),
                            @"ValidationException" : @(AWSDataexchangeErrorValidation),
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
    	NSString *errorTypeString = [[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"];
        NSString *errorTypeHeader = [[errorTypeString componentsSeparatedByString:@":"] firstObject];

        if ([errorTypeString length] > 0 && errorTypeHeader) {
            if (errorCodeDictionary[errorTypeHeader]) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSDataexchangeErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSDataexchangeErrorDomain
                                                 code:AWSDataexchangeErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSDataexchangeErrorDomain
                                     code:AWSDataexchangeErrorUnknown
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

@interface AWSDataexchangeRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSDataexchangeRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSDataexchange()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSDataexchange

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSDataexchangeSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSDataexchange versions need to match. Check your SDK installation. AWSCore: %@ AWSDataexchange: %@", AWSiOSSDKVersion, AWSDataexchangeSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultDataexchange {
    static AWSDataexchange *_defaultDataexchange = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoDataexchange];
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
        _defaultDataexchange = [[AWSDataexchange alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultDataexchange;
}

+ (void)registerDataexchangeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSDataexchange alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)DataexchangeForKey:(NSString *)key {
    @synchronized(self) {
        AWSDataexchange *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoDataexchange
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSDataexchange registerDataexchangeWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeDataexchangeForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultDataexchange` or `+ DataexchangeForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceDataexchange
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceDataexchange];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSDataexchangeRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSDataexchangeResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSDataexchangeResponseSerializer alloc] initWithJSONDefinition:[[AWSDataexchangeResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)cancelJob:(AWSDataexchangeCancelJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/jobs/{JobId}"
                  targetPrefix:@""
                 operationName:@"CancelJob"
                   outputClass:nil];
}

- (void)cancelJob:(AWSDataexchangeCancelJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self cancelJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeCreateDataSetResponse *> *)createDataSet:(AWSDataexchangeCreateDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/data-sets"
                  targetPrefix:@""
                 operationName:@"CreateDataSet"
                   outputClass:[AWSDataexchangeCreateDataSetResponse class]];
}

- (void)createDataSet:(AWSDataexchangeCreateDataSetRequest *)request
     completionHandler:(void (^)(AWSDataexchangeCreateDataSetResponse *response, NSError *error))completionHandler {
    [[self createDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeCreateDataSetResponse *> * _Nonnull task) {
        AWSDataexchangeCreateDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeCreateJobResponse *> *)createJob:(AWSDataexchangeCreateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/jobs"
                  targetPrefix:@""
                 operationName:@"CreateJob"
                   outputClass:[AWSDataexchangeCreateJobResponse class]];
}

- (void)createJob:(AWSDataexchangeCreateJobRequest *)request
     completionHandler:(void (^)(AWSDataexchangeCreateJobResponse *response, NSError *error))completionHandler {
    [[self createJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeCreateJobResponse *> * _Nonnull task) {
        AWSDataexchangeCreateJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeCreateRevisionResponse *> *)createRevision:(AWSDataexchangeCreateRevisionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/data-sets/{DataSetId}/revisions"
                  targetPrefix:@""
                 operationName:@"CreateRevision"
                   outputClass:[AWSDataexchangeCreateRevisionResponse class]];
}

- (void)createRevision:(AWSDataexchangeCreateRevisionRequest *)request
     completionHandler:(void (^)(AWSDataexchangeCreateRevisionResponse *response, NSError *error))completionHandler {
    [[self createRevision:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeCreateRevisionResponse *> * _Nonnull task) {
        AWSDataexchangeCreateRevisionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAsset:(AWSDataexchangeDeleteAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}"
                  targetPrefix:@""
                 operationName:@"DeleteAsset"
                   outputClass:nil];
}

- (void)deleteAsset:(AWSDataexchangeDeleteAssetRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAsset:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDataSet:(AWSDataexchangeDeleteDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/data-sets/{DataSetId}"
                  targetPrefix:@""
                 operationName:@"DeleteDataSet"
                   outputClass:nil];
}

- (void)deleteDataSet:(AWSDataexchangeDeleteDataSetRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDataSet:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRevision:(AWSDataexchangeDeleteRevisionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}"
                  targetPrefix:@""
                 operationName:@"DeleteRevision"
                   outputClass:nil];
}

- (void)deleteRevision:(AWSDataexchangeDeleteRevisionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRevision:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeGetAssetResponse *> *)getAsset:(AWSDataexchangeGetAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}"
                  targetPrefix:@""
                 operationName:@"GetAsset"
                   outputClass:[AWSDataexchangeGetAssetResponse class]];
}

- (void)getAsset:(AWSDataexchangeGetAssetRequest *)request
     completionHandler:(void (^)(AWSDataexchangeGetAssetResponse *response, NSError *error))completionHandler {
    [[self getAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeGetAssetResponse *> * _Nonnull task) {
        AWSDataexchangeGetAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeGetDataSetResponse *> *)getDataSet:(AWSDataexchangeGetDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets/{DataSetId}"
                  targetPrefix:@""
                 operationName:@"GetDataSet"
                   outputClass:[AWSDataexchangeGetDataSetResponse class]];
}

- (void)getDataSet:(AWSDataexchangeGetDataSetRequest *)request
     completionHandler:(void (^)(AWSDataexchangeGetDataSetResponse *response, NSError *error))completionHandler {
    [[self getDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeGetDataSetResponse *> * _Nonnull task) {
        AWSDataexchangeGetDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeGetJobResponse *> *)getJob:(AWSDataexchangeGetJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/jobs/{JobId}"
                  targetPrefix:@""
                 operationName:@"GetJob"
                   outputClass:[AWSDataexchangeGetJobResponse class]];
}

- (void)getJob:(AWSDataexchangeGetJobRequest *)request
     completionHandler:(void (^)(AWSDataexchangeGetJobResponse *response, NSError *error))completionHandler {
    [[self getJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeGetJobResponse *> * _Nonnull task) {
        AWSDataexchangeGetJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeGetRevisionResponse *> *)getRevision:(AWSDataexchangeGetRevisionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}"
                  targetPrefix:@""
                 operationName:@"GetRevision"
                   outputClass:[AWSDataexchangeGetRevisionResponse class]];
}

- (void)getRevision:(AWSDataexchangeGetRevisionRequest *)request
     completionHandler:(void (^)(AWSDataexchangeGetRevisionResponse *response, NSError *error))completionHandler {
    [[self getRevision:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeGetRevisionResponse *> * _Nonnull task) {
        AWSDataexchangeGetRevisionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeListDataSetRevisionsResponse *> *)listDataSetRevisions:(AWSDataexchangeListDataSetRevisionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets/{DataSetId}/revisions"
                  targetPrefix:@""
                 operationName:@"ListDataSetRevisions"
                   outputClass:[AWSDataexchangeListDataSetRevisionsResponse class]];
}

- (void)listDataSetRevisions:(AWSDataexchangeListDataSetRevisionsRequest *)request
     completionHandler:(void (^)(AWSDataexchangeListDataSetRevisionsResponse *response, NSError *error))completionHandler {
    [[self listDataSetRevisions:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeListDataSetRevisionsResponse *> * _Nonnull task) {
        AWSDataexchangeListDataSetRevisionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeListDataSetsResponse *> *)listDataSets:(AWSDataexchangeListDataSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets"
                  targetPrefix:@""
                 operationName:@"ListDataSets"
                   outputClass:[AWSDataexchangeListDataSetsResponse class]];
}

- (void)listDataSets:(AWSDataexchangeListDataSetsRequest *)request
     completionHandler:(void (^)(AWSDataexchangeListDataSetsResponse *response, NSError *error))completionHandler {
    [[self listDataSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeListDataSetsResponse *> * _Nonnull task) {
        AWSDataexchangeListDataSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeListJobsResponse *> *)listJobs:(AWSDataexchangeListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/jobs"
                  targetPrefix:@""
                 operationName:@"ListJobs"
                   outputClass:[AWSDataexchangeListJobsResponse class]];
}

- (void)listJobs:(AWSDataexchangeListJobsRequest *)request
     completionHandler:(void (^)(AWSDataexchangeListJobsResponse *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeListJobsResponse *> * _Nonnull task) {
        AWSDataexchangeListJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeListRevisionAssetsResponse *> *)listRevisionAssets:(AWSDataexchangeListRevisionAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets"
                  targetPrefix:@""
                 operationName:@"ListRevisionAssets"
                   outputClass:[AWSDataexchangeListRevisionAssetsResponse class]];
}

- (void)listRevisionAssets:(AWSDataexchangeListRevisionAssetsRequest *)request
     completionHandler:(void (^)(AWSDataexchangeListRevisionAssetsResponse *response, NSError *error))completionHandler {
    [[self listRevisionAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeListRevisionAssetsResponse *> * _Nonnull task) {
        AWSDataexchangeListRevisionAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeListTagsForResourceResponse *> *)listTagsForResource:(AWSDataexchangeListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSDataexchangeListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSDataexchangeListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSDataexchangeListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeListTagsForResourceResponse *> * _Nonnull task) {
        AWSDataexchangeListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeStartJobResponse *> *)startJob:(AWSDataexchangeStartJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v1/jobs/{JobId}"
                  targetPrefix:@""
                 operationName:@"StartJob"
                   outputClass:[AWSDataexchangeStartJobResponse class]];
}

- (void)startJob:(AWSDataexchangeStartJobRequest *)request
     completionHandler:(void (^)(AWSDataexchangeStartJobResponse *response, NSError *error))completionHandler {
    [[self startJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeStartJobResponse *> * _Nonnull task) {
        AWSDataexchangeStartJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSDataexchangeTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSDataexchangeTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSDataexchangeUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSDataexchangeUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeUpdateAssetResponse *> *)updateAsset:(AWSDataexchangeUpdateAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}"
                  targetPrefix:@""
                 operationName:@"UpdateAsset"
                   outputClass:[AWSDataexchangeUpdateAssetResponse class]];
}

- (void)updateAsset:(AWSDataexchangeUpdateAssetRequest *)request
     completionHandler:(void (^)(AWSDataexchangeUpdateAssetResponse *response, NSError *error))completionHandler {
    [[self updateAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeUpdateAssetResponse *> * _Nonnull task) {
        AWSDataexchangeUpdateAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeUpdateDataSetResponse *> *)updateDataSet:(AWSDataexchangeUpdateDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v1/data-sets/{DataSetId}"
                  targetPrefix:@""
                 operationName:@"UpdateDataSet"
                   outputClass:[AWSDataexchangeUpdateDataSetResponse class]];
}

- (void)updateDataSet:(AWSDataexchangeUpdateDataSetRequest *)request
     completionHandler:(void (^)(AWSDataexchangeUpdateDataSetResponse *response, NSError *error))completionHandler {
    [[self updateDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeUpdateDataSetResponse *> * _Nonnull task) {
        AWSDataexchangeUpdateDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDataexchangeUpdateRevisionResponse *> *)updateRevision:(AWSDataexchangeUpdateRevisionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}"
                  targetPrefix:@""
                 operationName:@"UpdateRevision"
                   outputClass:[AWSDataexchangeUpdateRevisionResponse class]];
}

- (void)updateRevision:(AWSDataexchangeUpdateRevisionRequest *)request
     completionHandler:(void (^)(AWSDataexchangeUpdateRevisionResponse *response, NSError *error))completionHandler {
    [[self updateRevision:request] continueWithBlock:^id _Nullable(AWSTask<AWSDataexchangeUpdateRevisionResponse *> * _Nonnull task) {
        AWSDataexchangeUpdateRevisionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
