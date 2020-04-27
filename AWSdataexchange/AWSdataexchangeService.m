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

#import "AWSdataexchangeService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSdataexchangeResources.h"

static NSString *const AWSInfodataexchange = @"dataexchange";
NSString *const AWSdataexchangeSDKVersion = @"2.13.2";


@interface AWSdataexchangeResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSdataexchangeResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSdataexchangeErrorAccessDenied),
                            @"ConflictException" : @(AWSdataexchangeErrorConflict),
                            @"InternalServerException" : @(AWSdataexchangeErrorInternalServer),
                            @"ResourceNotFoundException" : @(AWSdataexchangeErrorResourceNotFound),
                            @"ServiceLimitExceededException" : @(AWSdataexchangeErrorServiceLimitExceeded),
                            @"ThrottlingException" : @(AWSdataexchangeErrorThrottling),
                            @"ValidationException" : @(AWSdataexchangeErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSdataexchangeErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSdataexchangeErrorDomain
                                                 code:AWSdataexchangeErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSdataexchangeErrorDomain
                                     code:AWSdataexchangeErrorUnknown
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

@interface AWSdataexchangeRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSdataexchangeRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSdataexchange()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSdataexchange

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSdataexchangeSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSdataexchange versions need to match. Check your SDK installation. AWSCore: %@ AWSdataexchange: %@", AWSiOSSDKVersion, AWSdataexchangeSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultdataexchange {
    static AWSdataexchange *_defaultdataexchange = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfodataexchange];
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
        _defaultdataexchange = [[AWSdataexchange alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultdataexchange;
}

+ (void)registerdataexchangeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSdataexchange alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)dataexchangeForKey:(NSString *)key {
    @synchronized(self) {
        AWSdataexchange *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfodataexchange
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSdataexchange registerdataexchangeWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removedataexchangeForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultdataexchange` or `+ dataexchangeForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicedataexchange
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicedataexchange];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSdataexchangeRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSdataexchangeResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSdataexchangeResponseSerializer alloc] initWithJSONDefinition:[[AWSdataexchangeResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)cancelJob:(AWSdataexchangeCancelJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/jobs/{JobId}"
                  targetPrefix:@""
                 operationName:@"CancelJob"
                   outputClass:nil];
}

- (void)cancelJob:(AWSdataexchangeCancelJobRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self cancelJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeCreateDataSetResponse *> *)createDataSet:(AWSdataexchangeCreateDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/data-sets"
                  targetPrefix:@""
                 operationName:@"CreateDataSet"
                   outputClass:[AWSdataexchangeCreateDataSetResponse class]];
}

- (void)createDataSet:(AWSdataexchangeCreateDataSetRequest *)request
     completionHandler:(void (^)(AWSdataexchangeCreateDataSetResponse *response, NSError *error))completionHandler {
    [[self createDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeCreateDataSetResponse *> * _Nonnull task) {
        AWSdataexchangeCreateDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeCreateJobResponse *> *)createJob:(AWSdataexchangeCreateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/jobs"
                  targetPrefix:@""
                 operationName:@"CreateJob"
                   outputClass:[AWSdataexchangeCreateJobResponse class]];
}

- (void)createJob:(AWSdataexchangeCreateJobRequest *)request
     completionHandler:(void (^)(AWSdataexchangeCreateJobResponse *response, NSError *error))completionHandler {
    [[self createJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeCreateJobResponse *> * _Nonnull task) {
        AWSdataexchangeCreateJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeCreateRevisionResponse *> *)createRevision:(AWSdataexchangeCreateRevisionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/data-sets/{DataSetId}/revisions"
                  targetPrefix:@""
                 operationName:@"CreateRevision"
                   outputClass:[AWSdataexchangeCreateRevisionResponse class]];
}

- (void)createRevision:(AWSdataexchangeCreateRevisionRequest *)request
     completionHandler:(void (^)(AWSdataexchangeCreateRevisionResponse *response, NSError *error))completionHandler {
    [[self createRevision:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeCreateRevisionResponse *> * _Nonnull task) {
        AWSdataexchangeCreateRevisionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAsset:(AWSdataexchangeDeleteAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}"
                  targetPrefix:@""
                 operationName:@"DeleteAsset"
                   outputClass:nil];
}

- (void)deleteAsset:(AWSdataexchangeDeleteAssetRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAsset:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDataSet:(AWSdataexchangeDeleteDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/data-sets/{DataSetId}"
                  targetPrefix:@""
                 operationName:@"DeleteDataSet"
                   outputClass:nil];
}

- (void)deleteDataSet:(AWSdataexchangeDeleteDataSetRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDataSet:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRevision:(AWSdataexchangeDeleteRevisionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}"
                  targetPrefix:@""
                 operationName:@"DeleteRevision"
                   outputClass:nil];
}

- (void)deleteRevision:(AWSdataexchangeDeleteRevisionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRevision:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeGetAssetResponse *> *)getAsset:(AWSdataexchangeGetAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}"
                  targetPrefix:@""
                 operationName:@"GetAsset"
                   outputClass:[AWSdataexchangeGetAssetResponse class]];
}

- (void)getAsset:(AWSdataexchangeGetAssetRequest *)request
     completionHandler:(void (^)(AWSdataexchangeGetAssetResponse *response, NSError *error))completionHandler {
    [[self getAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeGetAssetResponse *> * _Nonnull task) {
        AWSdataexchangeGetAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeGetDataSetResponse *> *)getDataSet:(AWSdataexchangeGetDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets/{DataSetId}"
                  targetPrefix:@""
                 operationName:@"GetDataSet"
                   outputClass:[AWSdataexchangeGetDataSetResponse class]];
}

- (void)getDataSet:(AWSdataexchangeGetDataSetRequest *)request
     completionHandler:(void (^)(AWSdataexchangeGetDataSetResponse *response, NSError *error))completionHandler {
    [[self getDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeGetDataSetResponse *> * _Nonnull task) {
        AWSdataexchangeGetDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeGetJobResponse *> *)getJob:(AWSdataexchangeGetJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/jobs/{JobId}"
                  targetPrefix:@""
                 operationName:@"GetJob"
                   outputClass:[AWSdataexchangeGetJobResponse class]];
}

- (void)getJob:(AWSdataexchangeGetJobRequest *)request
     completionHandler:(void (^)(AWSdataexchangeGetJobResponse *response, NSError *error))completionHandler {
    [[self getJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeGetJobResponse *> * _Nonnull task) {
        AWSdataexchangeGetJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeGetRevisionResponse *> *)getRevision:(AWSdataexchangeGetRevisionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}"
                  targetPrefix:@""
                 operationName:@"GetRevision"
                   outputClass:[AWSdataexchangeGetRevisionResponse class]];
}

- (void)getRevision:(AWSdataexchangeGetRevisionRequest *)request
     completionHandler:(void (^)(AWSdataexchangeGetRevisionResponse *response, NSError *error))completionHandler {
    [[self getRevision:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeGetRevisionResponse *> * _Nonnull task) {
        AWSdataexchangeGetRevisionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeListDataSetRevisionsResponse *> *)listDataSetRevisions:(AWSdataexchangeListDataSetRevisionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets/{DataSetId}/revisions"
                  targetPrefix:@""
                 operationName:@"ListDataSetRevisions"
                   outputClass:[AWSdataexchangeListDataSetRevisionsResponse class]];
}

- (void)listDataSetRevisions:(AWSdataexchangeListDataSetRevisionsRequest *)request
     completionHandler:(void (^)(AWSdataexchangeListDataSetRevisionsResponse *response, NSError *error))completionHandler {
    [[self listDataSetRevisions:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeListDataSetRevisionsResponse *> * _Nonnull task) {
        AWSdataexchangeListDataSetRevisionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeListDataSetsResponse *> *)listDataSets:(AWSdataexchangeListDataSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets"
                  targetPrefix:@""
                 operationName:@"ListDataSets"
                   outputClass:[AWSdataexchangeListDataSetsResponse class]];
}

- (void)listDataSets:(AWSdataexchangeListDataSetsRequest *)request
     completionHandler:(void (^)(AWSdataexchangeListDataSetsResponse *response, NSError *error))completionHandler {
    [[self listDataSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeListDataSetsResponse *> * _Nonnull task) {
        AWSdataexchangeListDataSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeListJobsResponse *> *)listJobs:(AWSdataexchangeListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/jobs"
                  targetPrefix:@""
                 operationName:@"ListJobs"
                   outputClass:[AWSdataexchangeListJobsResponse class]];
}

- (void)listJobs:(AWSdataexchangeListJobsRequest *)request
     completionHandler:(void (^)(AWSdataexchangeListJobsResponse *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeListJobsResponse *> * _Nonnull task) {
        AWSdataexchangeListJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeListRevisionAssetsResponse *> *)listRevisionAssets:(AWSdataexchangeListRevisionAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets"
                  targetPrefix:@""
                 operationName:@"ListRevisionAssets"
                   outputClass:[AWSdataexchangeListRevisionAssetsResponse class]];
}

- (void)listRevisionAssets:(AWSdataexchangeListRevisionAssetsRequest *)request
     completionHandler:(void (^)(AWSdataexchangeListRevisionAssetsResponse *response, NSError *error))completionHandler {
    [[self listRevisionAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeListRevisionAssetsResponse *> * _Nonnull task) {
        AWSdataexchangeListRevisionAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeListTagsForResourceResponse *> *)listTagsForResource:(AWSdataexchangeListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSdataexchangeListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSdataexchangeListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSdataexchangeListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeListTagsForResourceResponse *> * _Nonnull task) {
        AWSdataexchangeListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeStartJobResponse *> *)startJob:(AWSdataexchangeStartJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v1/jobs/{JobId}"
                  targetPrefix:@""
                 operationName:@"StartJob"
                   outputClass:[AWSdataexchangeStartJobResponse class]];
}

- (void)startJob:(AWSdataexchangeStartJobRequest *)request
     completionHandler:(void (^)(AWSdataexchangeStartJobResponse *response, NSError *error))completionHandler {
    [[self startJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeStartJobResponse *> * _Nonnull task) {
        AWSdataexchangeStartJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSdataexchangeTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSdataexchangeTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSdataexchangeUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSdataexchangeUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeUpdateAssetResponse *> *)updateAsset:(AWSdataexchangeUpdateAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}/assets/{AssetId}"
                  targetPrefix:@""
                 operationName:@"UpdateAsset"
                   outputClass:[AWSdataexchangeUpdateAssetResponse class]];
}

- (void)updateAsset:(AWSdataexchangeUpdateAssetRequest *)request
     completionHandler:(void (^)(AWSdataexchangeUpdateAssetResponse *response, NSError *error))completionHandler {
    [[self updateAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeUpdateAssetResponse *> * _Nonnull task) {
        AWSdataexchangeUpdateAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeUpdateDataSetResponse *> *)updateDataSet:(AWSdataexchangeUpdateDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v1/data-sets/{DataSetId}"
                  targetPrefix:@""
                 operationName:@"UpdateDataSet"
                   outputClass:[AWSdataexchangeUpdateDataSetResponse class]];
}

- (void)updateDataSet:(AWSdataexchangeUpdateDataSetRequest *)request
     completionHandler:(void (^)(AWSdataexchangeUpdateDataSetResponse *response, NSError *error))completionHandler {
    [[self updateDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeUpdateDataSetResponse *> * _Nonnull task) {
        AWSdataexchangeUpdateDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdataexchangeUpdateRevisionResponse *> *)updateRevision:(AWSdataexchangeUpdateRevisionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/v1/data-sets/{DataSetId}/revisions/{RevisionId}"
                  targetPrefix:@""
                 operationName:@"UpdateRevision"
                   outputClass:[AWSdataexchangeUpdateRevisionResponse class]];
}

- (void)updateRevision:(AWSdataexchangeUpdateRevisionRequest *)request
     completionHandler:(void (^)(AWSdataexchangeUpdateRevisionResponse *response, NSError *error))completionHandler {
    [[self updateRevision:request] continueWithBlock:^id _Nullable(AWSTask<AWSdataexchangeUpdateRevisionResponse *> * _Nonnull task) {
        AWSdataexchangeUpdateRevisionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
