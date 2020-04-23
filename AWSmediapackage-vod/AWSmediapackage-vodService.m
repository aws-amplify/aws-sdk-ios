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

#import "AWSmediapackage-vodService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSmediapackage-vodResources.h"

static NSString *const AWSInfomediapackage-vod = @"mediapackage-vod";
NSString *const AWSmediapackage-vodSDKVersion = @"2.13.2";


@interface AWSmediapackage-vodResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSmediapackage-vodResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ForbiddenException" : @(AWSmediapackage-vodErrorForbidden),
                            @"InternalServerErrorException" : @(AWSmediapackage-vodErrorInternalServerError),
                            @"NotFoundException" : @(AWSmediapackage-vodErrorNotFound),
                            @"ServiceUnavailableException" : @(AWSmediapackage-vodErrorServiceUnavailable),
                            @"TooManyRequestsException" : @(AWSmediapackage-vodErrorTooManyRequests),
                            @"UnprocessableEntityException" : @(AWSmediapackage-vodErrorUnprocessableEntity),
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
                    *error = [NSError errorWithDomain:AWSmediapackage-vodErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSmediapackage-vodErrorDomain
                                                 code:AWSmediapackage-vodErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSmediapackage-vodErrorDomain
                                     code:AWSmediapackage-vodErrorUnknown
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

@interface AWSmediapackage-vodRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSmediapackage-vodRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSmediapackage-vod()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSmediapackage-vod

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSmediapackage-vodSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSmediapackage-vod versions need to match. Check your SDK installation. AWSCore: %@ AWSmediapackage-vod: %@", AWSiOSSDKVersion, AWSmediapackage-vodSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultmediapackage-vod {
    static AWSmediapackage-vod *_defaultmediapackage-vod = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfomediapackage-vod];
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
        _defaultmediapackage-vod = [[AWSmediapackage-vod alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultmediapackage-vod;
}

+ (void)registermediapackage-vodWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSmediapackage-vod alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)mediapackage-vodForKey:(NSString *)key {
    @synchronized(self) {
        AWSmediapackage-vod *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfomediapackage-vod
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSmediapackage-vod registermediapackage-vodWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removemediapackage-vodForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultmediapackage-vod` or `+ mediapackage-vodForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicemediapackage-vod
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicemediapackage-vod];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSmediapackage-vodRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSmediapackage-vodResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSmediapackage-vodResponseSerializer alloc] initWithJSONDefinition:[[AWSmediapackage-vodResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSmediapackage-vodCreateAssetResponse *> *)createAsset:(AWSmediapackage-vodCreateAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/assets"
                  targetPrefix:@""
                 operationName:@"CreateAsset"
                   outputClass:[AWSmediapackage-vodCreateAssetResponse class]];
}

- (void)createAsset:(AWSmediapackage-vodCreateAssetRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodCreateAssetResponse *response, NSError *error))completionHandler {
    [[self createAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodCreateAssetResponse *> * _Nonnull task) {
        AWSmediapackage-vodCreateAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodCreatePackagingConfigurationResponse *> *)createPackagingConfiguration:(AWSmediapackage-vodCreatePackagingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/packaging_configurations"
                  targetPrefix:@""
                 operationName:@"CreatePackagingConfiguration"
                   outputClass:[AWSmediapackage-vodCreatePackagingConfigurationResponse class]];
}

- (void)createPackagingConfiguration:(AWSmediapackage-vodCreatePackagingConfigurationRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodCreatePackagingConfigurationResponse *response, NSError *error))completionHandler {
    [[self createPackagingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodCreatePackagingConfigurationResponse *> * _Nonnull task) {
        AWSmediapackage-vodCreatePackagingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodCreatePackagingGroupResponse *> *)createPackagingGroup:(AWSmediapackage-vodCreatePackagingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/packaging_groups"
                  targetPrefix:@""
                 operationName:@"CreatePackagingGroup"
                   outputClass:[AWSmediapackage-vodCreatePackagingGroupResponse class]];
}

- (void)createPackagingGroup:(AWSmediapackage-vodCreatePackagingGroupRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodCreatePackagingGroupResponse *response, NSError *error))completionHandler {
    [[self createPackagingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodCreatePackagingGroupResponse *> * _Nonnull task) {
        AWSmediapackage-vodCreatePackagingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodDeleteAssetResponse *> *)deleteAsset:(AWSmediapackage-vodDeleteAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/assets/{id}"
                  targetPrefix:@""
                 operationName:@"DeleteAsset"
                   outputClass:[AWSmediapackage-vodDeleteAssetResponse class]];
}

- (void)deleteAsset:(AWSmediapackage-vodDeleteAssetRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodDeleteAssetResponse *response, NSError *error))completionHandler {
    [[self deleteAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodDeleteAssetResponse *> * _Nonnull task) {
        AWSmediapackage-vodDeleteAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodDeletePackagingConfigurationResponse *> *)deletePackagingConfiguration:(AWSmediapackage-vodDeletePackagingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/packaging_configurations/{id}"
                  targetPrefix:@""
                 operationName:@"DeletePackagingConfiguration"
                   outputClass:[AWSmediapackage-vodDeletePackagingConfigurationResponse class]];
}

- (void)deletePackagingConfiguration:(AWSmediapackage-vodDeletePackagingConfigurationRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodDeletePackagingConfigurationResponse *response, NSError *error))completionHandler {
    [[self deletePackagingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodDeletePackagingConfigurationResponse *> * _Nonnull task) {
        AWSmediapackage-vodDeletePackagingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodDeletePackagingGroupResponse *> *)deletePackagingGroup:(AWSmediapackage-vodDeletePackagingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/packaging_groups/{id}"
                  targetPrefix:@""
                 operationName:@"DeletePackagingGroup"
                   outputClass:[AWSmediapackage-vodDeletePackagingGroupResponse class]];
}

- (void)deletePackagingGroup:(AWSmediapackage-vodDeletePackagingGroupRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodDeletePackagingGroupResponse *response, NSError *error))completionHandler {
    [[self deletePackagingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodDeletePackagingGroupResponse *> * _Nonnull task) {
        AWSmediapackage-vodDeletePackagingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodDescribeAssetResponse *> *)describeAsset:(AWSmediapackage-vodDescribeAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets/{id}"
                  targetPrefix:@""
                 operationName:@"DescribeAsset"
                   outputClass:[AWSmediapackage-vodDescribeAssetResponse class]];
}

- (void)describeAsset:(AWSmediapackage-vodDescribeAssetRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodDescribeAssetResponse *response, NSError *error))completionHandler {
    [[self describeAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodDescribeAssetResponse *> * _Nonnull task) {
        AWSmediapackage-vodDescribeAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodDescribePackagingConfigurationResponse *> *)describePackagingConfiguration:(AWSmediapackage-vodDescribePackagingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/packaging_configurations/{id}"
                  targetPrefix:@""
                 operationName:@"DescribePackagingConfiguration"
                   outputClass:[AWSmediapackage-vodDescribePackagingConfigurationResponse class]];
}

- (void)describePackagingConfiguration:(AWSmediapackage-vodDescribePackagingConfigurationRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodDescribePackagingConfigurationResponse *response, NSError *error))completionHandler {
    [[self describePackagingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodDescribePackagingConfigurationResponse *> * _Nonnull task) {
        AWSmediapackage-vodDescribePackagingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodDescribePackagingGroupResponse *> *)describePackagingGroup:(AWSmediapackage-vodDescribePackagingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/packaging_groups/{id}"
                  targetPrefix:@""
                 operationName:@"DescribePackagingGroup"
                   outputClass:[AWSmediapackage-vodDescribePackagingGroupResponse class]];
}

- (void)describePackagingGroup:(AWSmediapackage-vodDescribePackagingGroupRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodDescribePackagingGroupResponse *response, NSError *error))completionHandler {
    [[self describePackagingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodDescribePackagingGroupResponse *> * _Nonnull task) {
        AWSmediapackage-vodDescribePackagingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodListAssetsResponse *> *)listAssets:(AWSmediapackage-vodListAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets"
                  targetPrefix:@""
                 operationName:@"ListAssets"
                   outputClass:[AWSmediapackage-vodListAssetsResponse class]];
}

- (void)listAssets:(AWSmediapackage-vodListAssetsRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodListAssetsResponse *response, NSError *error))completionHandler {
    [[self listAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodListAssetsResponse *> * _Nonnull task) {
        AWSmediapackage-vodListAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodListPackagingConfigurationsResponse *> *)listPackagingConfigurations:(AWSmediapackage-vodListPackagingConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/packaging_configurations"
                  targetPrefix:@""
                 operationName:@"ListPackagingConfigurations"
                   outputClass:[AWSmediapackage-vodListPackagingConfigurationsResponse class]];
}

- (void)listPackagingConfigurations:(AWSmediapackage-vodListPackagingConfigurationsRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodListPackagingConfigurationsResponse *response, NSError *error))completionHandler {
    [[self listPackagingConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodListPackagingConfigurationsResponse *> * _Nonnull task) {
        AWSmediapackage-vodListPackagingConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodListPackagingGroupsResponse *> *)listPackagingGroups:(AWSmediapackage-vodListPackagingGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/packaging_groups"
                  targetPrefix:@""
                 operationName:@"ListPackagingGroups"
                   outputClass:[AWSmediapackage-vodListPackagingGroupsResponse class]];
}

- (void)listPackagingGroups:(AWSmediapackage-vodListPackagingGroupsRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodListPackagingGroupsResponse *response, NSError *error))completionHandler {
    [[self listPackagingGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodListPackagingGroupsResponse *> * _Nonnull task) {
        AWSmediapackage-vodListPackagingGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediapackage-vodListTagsForResourceResponse *> *)listTagsForResource:(AWSmediapackage-vodListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSmediapackage-vodListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSmediapackage-vodListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSmediapackage-vodListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediapackage-vodListTagsForResourceResponse *> * _Nonnull task) {
        AWSmediapackage-vodListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSmediapackage-vodTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSmediapackage-vodTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSmediapackage-vodUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSmediapackage-vodUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
