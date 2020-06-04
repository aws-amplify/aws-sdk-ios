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

#import "AWSMediapackagevodService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSMediapackagevodResources.h"

static NSString *const AWSInfoMediapackagevod = @"Mediapackagevod";
NSString *const AWSMediapackagevodSDKVersion = @"2.13.4";


@interface AWSMediapackagevodResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSMediapackagevodResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ForbiddenException" : @(AWSMediapackagevodErrorForbidden),
                            @"InternalServerErrorException" : @(AWSMediapackagevodErrorInternalServerError),
                            @"NotFoundException" : @(AWSMediapackagevodErrorNotFound),
                            @"ServiceUnavailableException" : @(AWSMediapackagevodErrorServiceUnavailable),
                            @"TooManyRequestsException" : @(AWSMediapackagevodErrorTooManyRequests),
                            @"UnprocessableEntityException" : @(AWSMediapackagevodErrorUnprocessableEntity),
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
                    *error = [NSError errorWithDomain:AWSMediapackagevodErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSMediapackagevodErrorDomain
                                                 code:AWSMediapackagevodErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSMediapackagevodErrorDomain
                                     code:AWSMediapackagevodErrorUnknown
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

@interface AWSMediapackagevodRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSMediapackagevodRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSMediapackagevod()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSMediapackagevod

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSMediapackagevodSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSMediapackagevod versions need to match. Check your SDK installation. AWSCore: %@ AWSMediapackagevod: %@", AWSiOSSDKVersion, AWSMediapackagevodSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultMediapackagevod {
    static AWSMediapackagevod *_defaultMediapackagevod = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoMediapackagevod];
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
        _defaultMediapackagevod = [[AWSMediapackagevod alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultMediapackagevod;
}

+ (void)registerMediapackagevodWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSMediapackagevod alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)MediapackagevodForKey:(NSString *)key {
    @synchronized(self) {
        AWSMediapackagevod *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoMediapackagevod
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSMediapackagevod registerMediapackagevodWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeMediapackagevodForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultMediapackagevod` or `+ MediapackagevodForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceMediapackagevod
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceMediapackagevod];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSMediapackagevodRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSMediapackagevodResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSMediapackagevodResponseSerializer alloc] initWithJSONDefinition:[[AWSMediapackagevodResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSMediapackagevodCreateAssetResponse *> *)createAsset:(AWSMediapackagevodCreateAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/assets"
                  targetPrefix:@""
                 operationName:@"CreateAsset"
                   outputClass:[AWSMediapackagevodCreateAssetResponse class]];
}

- (void)createAsset:(AWSMediapackagevodCreateAssetRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodCreateAssetResponse *response, NSError *error))completionHandler {
    [[self createAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodCreateAssetResponse *> * _Nonnull task) {
        AWSMediapackagevodCreateAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodCreatePackagingConfigurationResponse *> *)createPackagingConfiguration:(AWSMediapackagevodCreatePackagingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/packaging_configurations"
                  targetPrefix:@""
                 operationName:@"CreatePackagingConfiguration"
                   outputClass:[AWSMediapackagevodCreatePackagingConfigurationResponse class]];
}

- (void)createPackagingConfiguration:(AWSMediapackagevodCreatePackagingConfigurationRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodCreatePackagingConfigurationResponse *response, NSError *error))completionHandler {
    [[self createPackagingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodCreatePackagingConfigurationResponse *> * _Nonnull task) {
        AWSMediapackagevodCreatePackagingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodCreatePackagingGroupResponse *> *)createPackagingGroup:(AWSMediapackagevodCreatePackagingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/packaging_groups"
                  targetPrefix:@""
                 operationName:@"CreatePackagingGroup"
                   outputClass:[AWSMediapackagevodCreatePackagingGroupResponse class]];
}

- (void)createPackagingGroup:(AWSMediapackagevodCreatePackagingGroupRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodCreatePackagingGroupResponse *response, NSError *error))completionHandler {
    [[self createPackagingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodCreatePackagingGroupResponse *> * _Nonnull task) {
        AWSMediapackagevodCreatePackagingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodDeleteAssetResponse *> *)deleteAsset:(AWSMediapackagevodDeleteAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/assets/{id}"
                  targetPrefix:@""
                 operationName:@"DeleteAsset"
                   outputClass:[AWSMediapackagevodDeleteAssetResponse class]];
}

- (void)deleteAsset:(AWSMediapackagevodDeleteAssetRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodDeleteAssetResponse *response, NSError *error))completionHandler {
    [[self deleteAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodDeleteAssetResponse *> * _Nonnull task) {
        AWSMediapackagevodDeleteAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodDeletePackagingConfigurationResponse *> *)deletePackagingConfiguration:(AWSMediapackagevodDeletePackagingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/packaging_configurations/{id}"
                  targetPrefix:@""
                 operationName:@"DeletePackagingConfiguration"
                   outputClass:[AWSMediapackagevodDeletePackagingConfigurationResponse class]];
}

- (void)deletePackagingConfiguration:(AWSMediapackagevodDeletePackagingConfigurationRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodDeletePackagingConfigurationResponse *response, NSError *error))completionHandler {
    [[self deletePackagingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodDeletePackagingConfigurationResponse *> * _Nonnull task) {
        AWSMediapackagevodDeletePackagingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodDeletePackagingGroupResponse *> *)deletePackagingGroup:(AWSMediapackagevodDeletePackagingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/packaging_groups/{id}"
                  targetPrefix:@""
                 operationName:@"DeletePackagingGroup"
                   outputClass:[AWSMediapackagevodDeletePackagingGroupResponse class]];
}

- (void)deletePackagingGroup:(AWSMediapackagevodDeletePackagingGroupRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodDeletePackagingGroupResponse *response, NSError *error))completionHandler {
    [[self deletePackagingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodDeletePackagingGroupResponse *> * _Nonnull task) {
        AWSMediapackagevodDeletePackagingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodDescribeAssetResponse *> *)describeAsset:(AWSMediapackagevodDescribeAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets/{id}"
                  targetPrefix:@""
                 operationName:@"DescribeAsset"
                   outputClass:[AWSMediapackagevodDescribeAssetResponse class]];
}

- (void)describeAsset:(AWSMediapackagevodDescribeAssetRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodDescribeAssetResponse *response, NSError *error))completionHandler {
    [[self describeAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodDescribeAssetResponse *> * _Nonnull task) {
        AWSMediapackagevodDescribeAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodDescribePackagingConfigurationResponse *> *)describePackagingConfiguration:(AWSMediapackagevodDescribePackagingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/packaging_configurations/{id}"
                  targetPrefix:@""
                 operationName:@"DescribePackagingConfiguration"
                   outputClass:[AWSMediapackagevodDescribePackagingConfigurationResponse class]];
}

- (void)describePackagingConfiguration:(AWSMediapackagevodDescribePackagingConfigurationRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodDescribePackagingConfigurationResponse *response, NSError *error))completionHandler {
    [[self describePackagingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodDescribePackagingConfigurationResponse *> * _Nonnull task) {
        AWSMediapackagevodDescribePackagingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodDescribePackagingGroupResponse *> *)describePackagingGroup:(AWSMediapackagevodDescribePackagingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/packaging_groups/{id}"
                  targetPrefix:@""
                 operationName:@"DescribePackagingGroup"
                   outputClass:[AWSMediapackagevodDescribePackagingGroupResponse class]];
}

- (void)describePackagingGroup:(AWSMediapackagevodDescribePackagingGroupRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodDescribePackagingGroupResponse *response, NSError *error))completionHandler {
    [[self describePackagingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodDescribePackagingGroupResponse *> * _Nonnull task) {
        AWSMediapackagevodDescribePackagingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodListAssetsResponse *> *)listAssets:(AWSMediapackagevodListAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets"
                  targetPrefix:@""
                 operationName:@"ListAssets"
                   outputClass:[AWSMediapackagevodListAssetsResponse class]];
}

- (void)listAssets:(AWSMediapackagevodListAssetsRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodListAssetsResponse *response, NSError *error))completionHandler {
    [[self listAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodListAssetsResponse *> * _Nonnull task) {
        AWSMediapackagevodListAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodListPackagingConfigurationsResponse *> *)listPackagingConfigurations:(AWSMediapackagevodListPackagingConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/packaging_configurations"
                  targetPrefix:@""
                 operationName:@"ListPackagingConfigurations"
                   outputClass:[AWSMediapackagevodListPackagingConfigurationsResponse class]];
}

- (void)listPackagingConfigurations:(AWSMediapackagevodListPackagingConfigurationsRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodListPackagingConfigurationsResponse *response, NSError *error))completionHandler {
    [[self listPackagingConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodListPackagingConfigurationsResponse *> * _Nonnull task) {
        AWSMediapackagevodListPackagingConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodListPackagingGroupsResponse *> *)listPackagingGroups:(AWSMediapackagevodListPackagingGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/packaging_groups"
                  targetPrefix:@""
                 operationName:@"ListPackagingGroups"
                   outputClass:[AWSMediapackagevodListPackagingGroupsResponse class]];
}

- (void)listPackagingGroups:(AWSMediapackagevodListPackagingGroupsRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodListPackagingGroupsResponse *response, NSError *error))completionHandler {
    [[self listPackagingGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodListPackagingGroupsResponse *> * _Nonnull task) {
        AWSMediapackagevodListPackagingGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodListTagsForResourceResponse *> *)listTagsForResource:(AWSMediapackagevodListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSMediapackagevodListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSMediapackagevodListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodListTagsForResourceResponse *> * _Nonnull task) {
        AWSMediapackagevodListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSMediapackagevodTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSMediapackagevodTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSMediapackagevodUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSMediapackagevodUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediapackagevodUpdatePackagingGroupResponse *> *)updatePackagingGroup:(AWSMediapackagevodUpdatePackagingGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/packaging_groups/{id}"
                  targetPrefix:@""
                 operationName:@"UpdatePackagingGroup"
                   outputClass:[AWSMediapackagevodUpdatePackagingGroupResponse class]];
}

- (void)updatePackagingGroup:(AWSMediapackagevodUpdatePackagingGroupRequest *)request
     completionHandler:(void (^)(AWSMediapackagevodUpdatePackagingGroupResponse *response, NSError *error))completionHandler {
    [[self updatePackagingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediapackagevodUpdatePackagingGroupResponse *> * _Nonnull task) {
        AWSMediapackagevodUpdatePackagingGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
