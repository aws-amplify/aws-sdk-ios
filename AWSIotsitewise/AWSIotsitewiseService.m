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

#import "AWSIotsitewiseService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSIotsitewiseResources.h"

static NSString *const AWSInfoIotsitewise = @"Iotsitewise";
NSString *const AWSIotsitewiseSDKVersion = @"2.13.3";


@interface AWSIotsitewiseResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSIotsitewiseResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConflictingOperationException" : @(AWSIotsitewiseErrorConflictingOperation),
                            @"InternalFailureException" : @(AWSIotsitewiseErrorInternalFailure),
                            @"InvalidRequestException" : @(AWSIotsitewiseErrorInvalidRequest),
                            @"LimitExceededException" : @(AWSIotsitewiseErrorLimitExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSIotsitewiseErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSIotsitewiseErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSIotsitewiseErrorServiceUnavailable),
                            @"ThrottlingException" : @(AWSIotsitewiseErrorThrottling),
                            @"TooManyTagsException" : @(AWSIotsitewiseErrorTooManyTags),
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
                    *error = [NSError errorWithDomain:AWSIotsitewiseErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSIotsitewiseErrorDomain
                                                 code:AWSIotsitewiseErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSIotsitewiseErrorDomain
                                     code:AWSIotsitewiseErrorUnknown
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

@interface AWSIotsitewiseRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSIotsitewiseRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSIotsitewise()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSIotsitewise

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSIotsitewiseSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSIotsitewise versions need to match. Check your SDK installation. AWSCore: %@ AWSIotsitewise: %@", AWSiOSSDKVersion, AWSIotsitewiseSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultIotsitewise {
    static AWSIotsitewise *_defaultIotsitewise = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoIotsitewise];
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
        _defaultIotsitewise = [[AWSIotsitewise alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultIotsitewise;
}

+ (void)registerIotsitewiseWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSIotsitewise alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)IotsitewiseForKey:(NSString *)key {
    @synchronized(self) {
        AWSIotsitewise *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoIotsitewise
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSIotsitewise registerIotsitewiseWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeIotsitewiseForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultIotsitewise` or `+ IotsitewiseForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceIotsitewise
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceIotsitewise];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSIotsitewiseRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSIotsitewiseResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSIotsitewiseResponseSerializer alloc] initWithJSONDefinition:[[AWSIotsitewiseResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)associateAssets:(AWSIotsitewiseAssociateAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/assets/{assetId}/associate"
                  targetPrefix:@""
                 operationName:@"AssociateAssets"
                   outputClass:nil];
}

- (void)associateAssets:(AWSIotsitewiseAssociateAssetsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateAssets:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseBatchAssociateProjectAssetsResponse *> *)batchAssociateProjectAssets:(AWSIotsitewiseBatchAssociateProjectAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/projects/{projectId}/assets/associate"
                  targetPrefix:@""
                 operationName:@"BatchAssociateProjectAssets"
                   outputClass:[AWSIotsitewiseBatchAssociateProjectAssetsResponse class]];
}

- (void)batchAssociateProjectAssets:(AWSIotsitewiseBatchAssociateProjectAssetsRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseBatchAssociateProjectAssetsResponse *response, NSError *error))completionHandler {
    [[self batchAssociateProjectAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseBatchAssociateProjectAssetsResponse *> * _Nonnull task) {
        AWSIotsitewiseBatchAssociateProjectAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseBatchDisassociateProjectAssetsResponse *> *)batchDisassociateProjectAssets:(AWSIotsitewiseBatchDisassociateProjectAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/projects/{projectId}/assets/disassociate"
                  targetPrefix:@""
                 operationName:@"BatchDisassociateProjectAssets"
                   outputClass:[AWSIotsitewiseBatchDisassociateProjectAssetsResponse class]];
}

- (void)batchDisassociateProjectAssets:(AWSIotsitewiseBatchDisassociateProjectAssetsRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseBatchDisassociateProjectAssetsResponse *response, NSError *error))completionHandler {
    [[self batchDisassociateProjectAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseBatchDisassociateProjectAssetsResponse *> * _Nonnull task) {
        AWSIotsitewiseBatchDisassociateProjectAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseBatchPutAssetPropertyValueResponse *> *)batchPutAssetPropertyValue:(AWSIotsitewiseBatchPutAssetPropertyValueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/properties"
                  targetPrefix:@""
                 operationName:@"BatchPutAssetPropertyValue"
                   outputClass:[AWSIotsitewiseBatchPutAssetPropertyValueResponse class]];
}

- (void)batchPutAssetPropertyValue:(AWSIotsitewiseBatchPutAssetPropertyValueRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseBatchPutAssetPropertyValueResponse *response, NSError *error))completionHandler {
    [[self batchPutAssetPropertyValue:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseBatchPutAssetPropertyValueResponse *> * _Nonnull task) {
        AWSIotsitewiseBatchPutAssetPropertyValueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseCreateAccessPolicyResponse *> *)createAccessPolicy:(AWSIotsitewiseCreateAccessPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/access-policies"
                  targetPrefix:@""
                 operationName:@"CreateAccessPolicy"
                   outputClass:[AWSIotsitewiseCreateAccessPolicyResponse class]];
}

- (void)createAccessPolicy:(AWSIotsitewiseCreateAccessPolicyRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseCreateAccessPolicyResponse *response, NSError *error))completionHandler {
    [[self createAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseCreateAccessPolicyResponse *> * _Nonnull task) {
        AWSIotsitewiseCreateAccessPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseCreateAssetResponse *> *)createAsset:(AWSIotsitewiseCreateAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/assets"
                  targetPrefix:@""
                 operationName:@"CreateAsset"
                   outputClass:[AWSIotsitewiseCreateAssetResponse class]];
}

- (void)createAsset:(AWSIotsitewiseCreateAssetRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseCreateAssetResponse *response, NSError *error))completionHandler {
    [[self createAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseCreateAssetResponse *> * _Nonnull task) {
        AWSIotsitewiseCreateAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseCreateAssetModelResponse *> *)createAssetModel:(AWSIotsitewiseCreateAssetModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/asset-models"
                  targetPrefix:@""
                 operationName:@"CreateAssetModel"
                   outputClass:[AWSIotsitewiseCreateAssetModelResponse class]];
}

- (void)createAssetModel:(AWSIotsitewiseCreateAssetModelRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseCreateAssetModelResponse *response, NSError *error))completionHandler {
    [[self createAssetModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseCreateAssetModelResponse *> * _Nonnull task) {
        AWSIotsitewiseCreateAssetModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseCreateDashboardResponse *> *)createDashboard:(AWSIotsitewiseCreateDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/dashboards"
                  targetPrefix:@""
                 operationName:@"CreateDashboard"
                   outputClass:[AWSIotsitewiseCreateDashboardResponse class]];
}

- (void)createDashboard:(AWSIotsitewiseCreateDashboardRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseCreateDashboardResponse *response, NSError *error))completionHandler {
    [[self createDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseCreateDashboardResponse *> * _Nonnull task) {
        AWSIotsitewiseCreateDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseCreateGatewayResponse *> *)createGateway:(AWSIotsitewiseCreateGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/20200301/gateways"
                  targetPrefix:@""
                 operationName:@"CreateGateway"
                   outputClass:[AWSIotsitewiseCreateGatewayResponse class]];
}

- (void)createGateway:(AWSIotsitewiseCreateGatewayRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseCreateGatewayResponse *response, NSError *error))completionHandler {
    [[self createGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseCreateGatewayResponse *> * _Nonnull task) {
        AWSIotsitewiseCreateGatewayResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseCreatePortalResponse *> *)createPortal:(AWSIotsitewiseCreatePortalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/portals"
                  targetPrefix:@""
                 operationName:@"CreatePortal"
                   outputClass:[AWSIotsitewiseCreatePortalResponse class]];
}

- (void)createPortal:(AWSIotsitewiseCreatePortalRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseCreatePortalResponse *response, NSError *error))completionHandler {
    [[self createPortal:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseCreatePortalResponse *> * _Nonnull task) {
        AWSIotsitewiseCreatePortalResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseCreateProjectResponse *> *)createProject:(AWSIotsitewiseCreateProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/projects"
                  targetPrefix:@""
                 operationName:@"CreateProject"
                   outputClass:[AWSIotsitewiseCreateProjectResponse class]];
}

- (void)createProject:(AWSIotsitewiseCreateProjectRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseCreateProjectResponse *response, NSError *error))completionHandler {
    [[self createProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseCreateProjectResponse *> * _Nonnull task) {
        AWSIotsitewiseCreateProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDeleteAccessPolicyResponse *> *)deleteAccessPolicy:(AWSIotsitewiseDeleteAccessPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/access-policies/{accessPolicyId}"
                  targetPrefix:@""
                 operationName:@"DeleteAccessPolicy"
                   outputClass:[AWSIotsitewiseDeleteAccessPolicyResponse class]];
}

- (void)deleteAccessPolicy:(AWSIotsitewiseDeleteAccessPolicyRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDeleteAccessPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDeleteAccessPolicyResponse *> * _Nonnull task) {
        AWSIotsitewiseDeleteAccessPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDeleteAssetResponse *> *)deleteAsset:(AWSIotsitewiseDeleteAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/assets/{assetId}"
                  targetPrefix:@""
                 operationName:@"DeleteAsset"
                   outputClass:[AWSIotsitewiseDeleteAssetResponse class]];
}

- (void)deleteAsset:(AWSIotsitewiseDeleteAssetRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDeleteAssetResponse *response, NSError *error))completionHandler {
    [[self deleteAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDeleteAssetResponse *> * _Nonnull task) {
        AWSIotsitewiseDeleteAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDeleteAssetModelResponse *> *)deleteAssetModel:(AWSIotsitewiseDeleteAssetModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/asset-models/{assetModelId}"
                  targetPrefix:@""
                 operationName:@"DeleteAssetModel"
                   outputClass:[AWSIotsitewiseDeleteAssetModelResponse class]];
}

- (void)deleteAssetModel:(AWSIotsitewiseDeleteAssetModelRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDeleteAssetModelResponse *response, NSError *error))completionHandler {
    [[self deleteAssetModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDeleteAssetModelResponse *> * _Nonnull task) {
        AWSIotsitewiseDeleteAssetModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDeleteDashboardResponse *> *)deleteDashboard:(AWSIotsitewiseDeleteDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/dashboards/{dashboardId}"
                  targetPrefix:@""
                 operationName:@"DeleteDashboard"
                   outputClass:[AWSIotsitewiseDeleteDashboardResponse class]];
}

- (void)deleteDashboard:(AWSIotsitewiseDeleteDashboardRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDeleteDashboardResponse *response, NSError *error))completionHandler {
    [[self deleteDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDeleteDashboardResponse *> * _Nonnull task) {
        AWSIotsitewiseDeleteDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteGateway:(AWSIotsitewiseDeleteGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/20200301/gateways/{gatewayId}"
                  targetPrefix:@""
                 operationName:@"DeleteGateway"
                   outputClass:nil];
}

- (void)deleteGateway:(AWSIotsitewiseDeleteGatewayRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteGateway:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDeletePortalResponse *> *)deletePortal:(AWSIotsitewiseDeletePortalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/portals/{portalId}"
                  targetPrefix:@""
                 operationName:@"DeletePortal"
                   outputClass:[AWSIotsitewiseDeletePortalResponse class]];
}

- (void)deletePortal:(AWSIotsitewiseDeletePortalRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDeletePortalResponse *response, NSError *error))completionHandler {
    [[self deletePortal:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDeletePortalResponse *> * _Nonnull task) {
        AWSIotsitewiseDeletePortalResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDeleteProjectResponse *> *)deleteProject:(AWSIotsitewiseDeleteProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/projects/{projectId}"
                  targetPrefix:@""
                 operationName:@"DeleteProject"
                   outputClass:[AWSIotsitewiseDeleteProjectResponse class]];
}

- (void)deleteProject:(AWSIotsitewiseDeleteProjectRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDeleteProjectResponse *response, NSError *error))completionHandler {
    [[self deleteProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDeleteProjectResponse *> * _Nonnull task) {
        AWSIotsitewiseDeleteProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDescribeAccessPolicyResponse *> *)describeAccessPolicy:(AWSIotsitewiseDescribeAccessPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/access-policies/{accessPolicyId}"
                  targetPrefix:@""
                 operationName:@"DescribeAccessPolicy"
                   outputClass:[AWSIotsitewiseDescribeAccessPolicyResponse class]];
}

- (void)describeAccessPolicy:(AWSIotsitewiseDescribeAccessPolicyRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDescribeAccessPolicyResponse *response, NSError *error))completionHandler {
    [[self describeAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDescribeAccessPolicyResponse *> * _Nonnull task) {
        AWSIotsitewiseDescribeAccessPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDescribeAssetResponse *> *)describeAsset:(AWSIotsitewiseDescribeAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets/{assetId}"
                  targetPrefix:@""
                 operationName:@"DescribeAsset"
                   outputClass:[AWSIotsitewiseDescribeAssetResponse class]];
}

- (void)describeAsset:(AWSIotsitewiseDescribeAssetRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDescribeAssetResponse *response, NSError *error))completionHandler {
    [[self describeAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDescribeAssetResponse *> * _Nonnull task) {
        AWSIotsitewiseDescribeAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDescribeAssetModelResponse *> *)describeAssetModel:(AWSIotsitewiseDescribeAssetModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/asset-models/{assetModelId}"
                  targetPrefix:@""
                 operationName:@"DescribeAssetModel"
                   outputClass:[AWSIotsitewiseDescribeAssetModelResponse class]];
}

- (void)describeAssetModel:(AWSIotsitewiseDescribeAssetModelRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDescribeAssetModelResponse *response, NSError *error))completionHandler {
    [[self describeAssetModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDescribeAssetModelResponse *> * _Nonnull task) {
        AWSIotsitewiseDescribeAssetModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDescribeAssetPropertyResponse *> *)describeAssetProperty:(AWSIotsitewiseDescribeAssetPropertyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets/{assetId}/properties/{propertyId}"
                  targetPrefix:@""
                 operationName:@"DescribeAssetProperty"
                   outputClass:[AWSIotsitewiseDescribeAssetPropertyResponse class]];
}

- (void)describeAssetProperty:(AWSIotsitewiseDescribeAssetPropertyRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDescribeAssetPropertyResponse *response, NSError *error))completionHandler {
    [[self describeAssetProperty:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDescribeAssetPropertyResponse *> * _Nonnull task) {
        AWSIotsitewiseDescribeAssetPropertyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDescribeDashboardResponse *> *)describeDashboard:(AWSIotsitewiseDescribeDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/dashboards/{dashboardId}"
                  targetPrefix:@""
                 operationName:@"DescribeDashboard"
                   outputClass:[AWSIotsitewiseDescribeDashboardResponse class]];
}

- (void)describeDashboard:(AWSIotsitewiseDescribeDashboardRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDescribeDashboardResponse *response, NSError *error))completionHandler {
    [[self describeDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDescribeDashboardResponse *> * _Nonnull task) {
        AWSIotsitewiseDescribeDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDescribeGatewayResponse *> *)describeGateway:(AWSIotsitewiseDescribeGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/20200301/gateways/{gatewayId}"
                  targetPrefix:@""
                 operationName:@"DescribeGateway"
                   outputClass:[AWSIotsitewiseDescribeGatewayResponse class]];
}

- (void)describeGateway:(AWSIotsitewiseDescribeGatewayRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDescribeGatewayResponse *response, NSError *error))completionHandler {
    [[self describeGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDescribeGatewayResponse *> * _Nonnull task) {
        AWSIotsitewiseDescribeGatewayResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse *> *)describeGatewayCapabilityConfiguration:(AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/20200301/gateways/{gatewayId}/capability/{capabilityNamespace}"
                  targetPrefix:@""
                 operationName:@"DescribeGatewayCapabilityConfiguration"
                   outputClass:[AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse class]];
}

- (void)describeGatewayCapabilityConfiguration:(AWSIotsitewiseDescribeGatewayCapabilityConfigurationRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeGatewayCapabilityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse *> * _Nonnull task) {
        AWSIotsitewiseDescribeGatewayCapabilityConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDescribeLoggingOptionsResponse *> *)describeLoggingOptions:(AWSIotsitewiseDescribeLoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/logging"
                  targetPrefix:@""
                 operationName:@"DescribeLoggingOptions"
                   outputClass:[AWSIotsitewiseDescribeLoggingOptionsResponse class]];
}

- (void)describeLoggingOptions:(AWSIotsitewiseDescribeLoggingOptionsRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDescribeLoggingOptionsResponse *response, NSError *error))completionHandler {
    [[self describeLoggingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDescribeLoggingOptionsResponse *> * _Nonnull task) {
        AWSIotsitewiseDescribeLoggingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDescribePortalResponse *> *)describePortal:(AWSIotsitewiseDescribePortalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/portals/{portalId}"
                  targetPrefix:@""
                 operationName:@"DescribePortal"
                   outputClass:[AWSIotsitewiseDescribePortalResponse class]];
}

- (void)describePortal:(AWSIotsitewiseDescribePortalRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDescribePortalResponse *response, NSError *error))completionHandler {
    [[self describePortal:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDescribePortalResponse *> * _Nonnull task) {
        AWSIotsitewiseDescribePortalResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseDescribeProjectResponse *> *)describeProject:(AWSIotsitewiseDescribeProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/projects/{projectId}"
                  targetPrefix:@""
                 operationName:@"DescribeProject"
                   outputClass:[AWSIotsitewiseDescribeProjectResponse class]];
}

- (void)describeProject:(AWSIotsitewiseDescribeProjectRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseDescribeProjectResponse *response, NSError *error))completionHandler {
    [[self describeProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseDescribeProjectResponse *> * _Nonnull task) {
        AWSIotsitewiseDescribeProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateAssets:(AWSIotsitewiseDisassociateAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/assets/{assetId}/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateAssets"
                   outputClass:nil];
}

- (void)disassociateAssets:(AWSIotsitewiseDisassociateAssetsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateAssets:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseGetAssetPropertyAggregatesResponse *> *)getAssetPropertyAggregates:(AWSIotsitewiseGetAssetPropertyAggregatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/properties/aggregates"
                  targetPrefix:@""
                 operationName:@"GetAssetPropertyAggregates"
                   outputClass:[AWSIotsitewiseGetAssetPropertyAggregatesResponse class]];
}

- (void)getAssetPropertyAggregates:(AWSIotsitewiseGetAssetPropertyAggregatesRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseGetAssetPropertyAggregatesResponse *response, NSError *error))completionHandler {
    [[self getAssetPropertyAggregates:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseGetAssetPropertyAggregatesResponse *> * _Nonnull task) {
        AWSIotsitewiseGetAssetPropertyAggregatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseGetAssetPropertyValueResponse *> *)getAssetPropertyValue:(AWSIotsitewiseGetAssetPropertyValueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/properties/latest"
                  targetPrefix:@""
                 operationName:@"GetAssetPropertyValue"
                   outputClass:[AWSIotsitewiseGetAssetPropertyValueResponse class]];
}

- (void)getAssetPropertyValue:(AWSIotsitewiseGetAssetPropertyValueRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseGetAssetPropertyValueResponse *response, NSError *error))completionHandler {
    [[self getAssetPropertyValue:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseGetAssetPropertyValueResponse *> * _Nonnull task) {
        AWSIotsitewiseGetAssetPropertyValueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseGetAssetPropertyValueHistoryResponse *> *)getAssetPropertyValueHistory:(AWSIotsitewiseGetAssetPropertyValueHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/properties/history"
                  targetPrefix:@""
                 operationName:@"GetAssetPropertyValueHistory"
                   outputClass:[AWSIotsitewiseGetAssetPropertyValueHistoryResponse class]];
}

- (void)getAssetPropertyValueHistory:(AWSIotsitewiseGetAssetPropertyValueHistoryRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseGetAssetPropertyValueHistoryResponse *response, NSError *error))completionHandler {
    [[self getAssetPropertyValueHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseGetAssetPropertyValueHistoryResponse *> * _Nonnull task) {
        AWSIotsitewiseGetAssetPropertyValueHistoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseListAccessPoliciesResponse *> *)listAccessPolicies:(AWSIotsitewiseListAccessPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/access-policies"
                  targetPrefix:@""
                 operationName:@"ListAccessPolicies"
                   outputClass:[AWSIotsitewiseListAccessPoliciesResponse class]];
}

- (void)listAccessPolicies:(AWSIotsitewiseListAccessPoliciesRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseListAccessPoliciesResponse *response, NSError *error))completionHandler {
    [[self listAccessPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseListAccessPoliciesResponse *> * _Nonnull task) {
        AWSIotsitewiseListAccessPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseListAssetModelsResponse *> *)listAssetModels:(AWSIotsitewiseListAssetModelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/asset-models"
                  targetPrefix:@""
                 operationName:@"ListAssetModels"
                   outputClass:[AWSIotsitewiseListAssetModelsResponse class]];
}

- (void)listAssetModels:(AWSIotsitewiseListAssetModelsRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseListAssetModelsResponse *response, NSError *error))completionHandler {
    [[self listAssetModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseListAssetModelsResponse *> * _Nonnull task) {
        AWSIotsitewiseListAssetModelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseListAssetsResponse *> *)listAssets:(AWSIotsitewiseListAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets"
                  targetPrefix:@""
                 operationName:@"ListAssets"
                   outputClass:[AWSIotsitewiseListAssetsResponse class]];
}

- (void)listAssets:(AWSIotsitewiseListAssetsRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseListAssetsResponse *response, NSError *error))completionHandler {
    [[self listAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseListAssetsResponse *> * _Nonnull task) {
        AWSIotsitewiseListAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseListAssociatedAssetsResponse *> *)listAssociatedAssets:(AWSIotsitewiseListAssociatedAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets/{assetId}/hierarchies"
                  targetPrefix:@""
                 operationName:@"ListAssociatedAssets"
                   outputClass:[AWSIotsitewiseListAssociatedAssetsResponse class]];
}

- (void)listAssociatedAssets:(AWSIotsitewiseListAssociatedAssetsRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseListAssociatedAssetsResponse *response, NSError *error))completionHandler {
    [[self listAssociatedAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseListAssociatedAssetsResponse *> * _Nonnull task) {
        AWSIotsitewiseListAssociatedAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseListDashboardsResponse *> *)listDashboards:(AWSIotsitewiseListDashboardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/dashboards"
                  targetPrefix:@""
                 operationName:@"ListDashboards"
                   outputClass:[AWSIotsitewiseListDashboardsResponse class]];
}

- (void)listDashboards:(AWSIotsitewiseListDashboardsRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseListDashboardsResponse *response, NSError *error))completionHandler {
    [[self listDashboards:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseListDashboardsResponse *> * _Nonnull task) {
        AWSIotsitewiseListDashboardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseListGatewaysResponse *> *)listGateways:(AWSIotsitewiseListGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/20200301/gateways"
                  targetPrefix:@""
                 operationName:@"ListGateways"
                   outputClass:[AWSIotsitewiseListGatewaysResponse class]];
}

- (void)listGateways:(AWSIotsitewiseListGatewaysRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseListGatewaysResponse *response, NSError *error))completionHandler {
    [[self listGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseListGatewaysResponse *> * _Nonnull task) {
        AWSIotsitewiseListGatewaysResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseListPortalsResponse *> *)listPortals:(AWSIotsitewiseListPortalsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/portals"
                  targetPrefix:@""
                 operationName:@"ListPortals"
                   outputClass:[AWSIotsitewiseListPortalsResponse class]];
}

- (void)listPortals:(AWSIotsitewiseListPortalsRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseListPortalsResponse *response, NSError *error))completionHandler {
    [[self listPortals:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseListPortalsResponse *> * _Nonnull task) {
        AWSIotsitewiseListPortalsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseListProjectAssetsResponse *> *)listProjectAssets:(AWSIotsitewiseListProjectAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/projects/{projectId}/assets"
                  targetPrefix:@""
                 operationName:@"ListProjectAssets"
                   outputClass:[AWSIotsitewiseListProjectAssetsResponse class]];
}

- (void)listProjectAssets:(AWSIotsitewiseListProjectAssetsRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseListProjectAssetsResponse *response, NSError *error))completionHandler {
    [[self listProjectAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseListProjectAssetsResponse *> * _Nonnull task) {
        AWSIotsitewiseListProjectAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseListProjectsResponse *> *)listProjects:(AWSIotsitewiseListProjectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/projects"
                  targetPrefix:@""
                 operationName:@"ListProjects"
                   outputClass:[AWSIotsitewiseListProjectsResponse class]];
}

- (void)listProjects:(AWSIotsitewiseListProjectsRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseListProjectsResponse *response, NSError *error))completionHandler {
    [[self listProjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseListProjectsResponse *> * _Nonnull task) {
        AWSIotsitewiseListProjectsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseListTagsForResourceResponse *> *)listTagsForResource:(AWSIotsitewiseListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSIotsitewiseListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSIotsitewiseListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseListTagsForResourceResponse *> * _Nonnull task) {
        AWSIotsitewiseListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewisePutLoggingOptionsResponse *> *)putLoggingOptions:(AWSIotsitewisePutLoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/logging"
                  targetPrefix:@""
                 operationName:@"PutLoggingOptions"
                   outputClass:[AWSIotsitewisePutLoggingOptionsResponse class]];
}

- (void)putLoggingOptions:(AWSIotsitewisePutLoggingOptionsRequest *)request
     completionHandler:(void (^)(AWSIotsitewisePutLoggingOptionsResponse *response, NSError *error))completionHandler {
    [[self putLoggingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewisePutLoggingOptionsResponse *> * _Nonnull task) {
        AWSIotsitewisePutLoggingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseTagResourceResponse *> *)tagResource:(AWSIotsitewiseTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSIotsitewiseTagResourceResponse class]];
}

- (void)tagResource:(AWSIotsitewiseTagResourceRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseTagResourceResponse *> * _Nonnull task) {
        AWSIotsitewiseTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseUntagResourceResponse *> *)untagResource:(AWSIotsitewiseUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSIotsitewiseUntagResourceResponse class]];
}

- (void)untagResource:(AWSIotsitewiseUntagResourceRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseUntagResourceResponse *> * _Nonnull task) {
        AWSIotsitewiseUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseUpdateAccessPolicyResponse *> *)updateAccessPolicy:(AWSIotsitewiseUpdateAccessPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/access-policies/{accessPolicyId}"
                  targetPrefix:@""
                 operationName:@"UpdateAccessPolicy"
                   outputClass:[AWSIotsitewiseUpdateAccessPolicyResponse class]];
}

- (void)updateAccessPolicy:(AWSIotsitewiseUpdateAccessPolicyRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseUpdateAccessPolicyResponse *response, NSError *error))completionHandler {
    [[self updateAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseUpdateAccessPolicyResponse *> * _Nonnull task) {
        AWSIotsitewiseUpdateAccessPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseUpdateAssetResponse *> *)updateAsset:(AWSIotsitewiseUpdateAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/assets/{assetId}"
                  targetPrefix:@""
                 operationName:@"UpdateAsset"
                   outputClass:[AWSIotsitewiseUpdateAssetResponse class]];
}

- (void)updateAsset:(AWSIotsitewiseUpdateAssetRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseUpdateAssetResponse *response, NSError *error))completionHandler {
    [[self updateAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseUpdateAssetResponse *> * _Nonnull task) {
        AWSIotsitewiseUpdateAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseUpdateAssetModelResponse *> *)updateAssetModel:(AWSIotsitewiseUpdateAssetModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/asset-models/{assetModelId}"
                  targetPrefix:@""
                 operationName:@"UpdateAssetModel"
                   outputClass:[AWSIotsitewiseUpdateAssetModelResponse class]];
}

- (void)updateAssetModel:(AWSIotsitewiseUpdateAssetModelRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseUpdateAssetModelResponse *response, NSError *error))completionHandler {
    [[self updateAssetModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseUpdateAssetModelResponse *> * _Nonnull task) {
        AWSIotsitewiseUpdateAssetModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateAssetProperty:(AWSIotsitewiseUpdateAssetPropertyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/assets/{assetId}/properties/{propertyId}"
                  targetPrefix:@""
                 operationName:@"UpdateAssetProperty"
                   outputClass:nil];
}

- (void)updateAssetProperty:(AWSIotsitewiseUpdateAssetPropertyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateAssetProperty:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseUpdateDashboardResponse *> *)updateDashboard:(AWSIotsitewiseUpdateDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/dashboards/{dashboardId}"
                  targetPrefix:@""
                 operationName:@"UpdateDashboard"
                   outputClass:[AWSIotsitewiseUpdateDashboardResponse class]];
}

- (void)updateDashboard:(AWSIotsitewiseUpdateDashboardRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseUpdateDashboardResponse *response, NSError *error))completionHandler {
    [[self updateDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseUpdateDashboardResponse *> * _Nonnull task) {
        AWSIotsitewiseUpdateDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateGateway:(AWSIotsitewiseUpdateGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/20200301/gateways/{gatewayId}"
                  targetPrefix:@""
                 operationName:@"UpdateGateway"
                   outputClass:nil];
}

- (void)updateGateway:(AWSIotsitewiseUpdateGatewayRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateGateway:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse *> *)updateGatewayCapabilityConfiguration:(AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/20200301/gateways/{gatewayId}/capability"
                  targetPrefix:@""
                 operationName:@"UpdateGatewayCapabilityConfiguration"
                   outputClass:[AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse class]];
}

- (void)updateGatewayCapabilityConfiguration:(AWSIotsitewiseUpdateGatewayCapabilityConfigurationRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateGatewayCapabilityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse *> * _Nonnull task) {
        AWSIotsitewiseUpdateGatewayCapabilityConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseUpdatePortalResponse *> *)updatePortal:(AWSIotsitewiseUpdatePortalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/portals/{portalId}"
                  targetPrefix:@""
                 operationName:@"UpdatePortal"
                   outputClass:[AWSIotsitewiseUpdatePortalResponse class]];
}

- (void)updatePortal:(AWSIotsitewiseUpdatePortalRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseUpdatePortalResponse *response, NSError *error))completionHandler {
    [[self updatePortal:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseUpdatePortalResponse *> * _Nonnull task) {
        AWSIotsitewiseUpdatePortalResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIotsitewiseUpdateProjectResponse *> *)updateProject:(AWSIotsitewiseUpdateProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/projects/{projectId}"
                  targetPrefix:@""
                 operationName:@"UpdateProject"
                   outputClass:[AWSIotsitewiseUpdateProjectResponse class]];
}

- (void)updateProject:(AWSIotsitewiseUpdateProjectRequest *)request
     completionHandler:(void (^)(AWSIotsitewiseUpdateProjectResponse *response, NSError *error))completionHandler {
    [[self updateProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSIotsitewiseUpdateProjectResponse *> * _Nonnull task) {
        AWSIotsitewiseUpdateProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
