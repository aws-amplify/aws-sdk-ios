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

#import "AWSiotsitewiseService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSiotsitewiseResources.h"

static NSString *const AWSInfoiotsitewise = @"iotsitewise";
NSString *const AWSiotsitewiseSDKVersion = @"2.13.2";


@interface AWSiotsitewiseResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSiotsitewiseResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConflictingOperationException" : @(AWSiotsitewiseErrorConflictingOperation),
                            @"InternalFailureException" : @(AWSiotsitewiseErrorInternalFailure),
                            @"InvalidRequestException" : @(AWSiotsitewiseErrorInvalidRequest),
                            @"LimitExceededException" : @(AWSiotsitewiseErrorLimitExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSiotsitewiseErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSiotsitewiseErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSiotsitewiseErrorServiceUnavailable),
                            @"ThrottlingException" : @(AWSiotsitewiseErrorThrottling),
                            @"TooManyTagsException" : @(AWSiotsitewiseErrorTooManyTags),
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
                    *error = [NSError errorWithDomain:AWSiotsitewiseErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSiotsitewiseErrorDomain
                                                 code:AWSiotsitewiseErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSiotsitewiseErrorDomain
                                     code:AWSiotsitewiseErrorUnknown
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

@interface AWSiotsitewiseRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSiotsitewiseRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSiotsitewise()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSiotsitewise

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSiotsitewiseSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSiotsitewise versions need to match. Check your SDK installation. AWSCore: %@ AWSiotsitewise: %@", AWSiOSSDKVersion, AWSiotsitewiseSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultiotsitewise {
    static AWSiotsitewise *_defaultiotsitewise = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoiotsitewise];
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
        _defaultiotsitewise = [[AWSiotsitewise alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultiotsitewise;
}

+ (void)registeriotsitewiseWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSiotsitewise alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)iotsitewiseForKey:(NSString *)key {
    @synchronized(self) {
        AWSiotsitewise *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoiotsitewise
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSiotsitewise registeriotsitewiseWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeiotsitewiseForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultiotsitewise` or `+ iotsitewiseForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceiotsitewise
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceiotsitewise];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSiotsitewiseRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSiotsitewiseResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSiotsitewiseResponseSerializer alloc] initWithJSONDefinition:[[AWSiotsitewiseResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)associateAssets:(AWSiotsitewiseAssociateAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/assets/{assetId}/associate"
                  targetPrefix:@""
                 operationName:@"AssociateAssets"
                   outputClass:nil];
}

- (void)associateAssets:(AWSiotsitewiseAssociateAssetsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateAssets:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseBatchAssociateProjectAssetsResponse *> *)batchAssociateProjectAssets:(AWSiotsitewiseBatchAssociateProjectAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/projects/{projectId}/assets/associate"
                  targetPrefix:@""
                 operationName:@"BatchAssociateProjectAssets"
                   outputClass:[AWSiotsitewiseBatchAssociateProjectAssetsResponse class]];
}

- (void)batchAssociateProjectAssets:(AWSiotsitewiseBatchAssociateProjectAssetsRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseBatchAssociateProjectAssetsResponse *response, NSError *error))completionHandler {
    [[self batchAssociateProjectAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseBatchAssociateProjectAssetsResponse *> * _Nonnull task) {
        AWSiotsitewiseBatchAssociateProjectAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseBatchDisassociateProjectAssetsResponse *> *)batchDisassociateProjectAssets:(AWSiotsitewiseBatchDisassociateProjectAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/projects/{projectId}/assets/disassociate"
                  targetPrefix:@""
                 operationName:@"BatchDisassociateProjectAssets"
                   outputClass:[AWSiotsitewiseBatchDisassociateProjectAssetsResponse class]];
}

- (void)batchDisassociateProjectAssets:(AWSiotsitewiseBatchDisassociateProjectAssetsRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseBatchDisassociateProjectAssetsResponse *response, NSError *error))completionHandler {
    [[self batchDisassociateProjectAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseBatchDisassociateProjectAssetsResponse *> * _Nonnull task) {
        AWSiotsitewiseBatchDisassociateProjectAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseBatchPutAssetPropertyValueResponse *> *)batchPutAssetPropertyValue:(AWSiotsitewiseBatchPutAssetPropertyValueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/properties"
                  targetPrefix:@""
                 operationName:@"BatchPutAssetPropertyValue"
                   outputClass:[AWSiotsitewiseBatchPutAssetPropertyValueResponse class]];
}

- (void)batchPutAssetPropertyValue:(AWSiotsitewiseBatchPutAssetPropertyValueRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseBatchPutAssetPropertyValueResponse *response, NSError *error))completionHandler {
    [[self batchPutAssetPropertyValue:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseBatchPutAssetPropertyValueResponse *> * _Nonnull task) {
        AWSiotsitewiseBatchPutAssetPropertyValueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseCreateAccessPolicyResponse *> *)createAccessPolicy:(AWSiotsitewiseCreateAccessPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/access-policies"
                  targetPrefix:@""
                 operationName:@"CreateAccessPolicy"
                   outputClass:[AWSiotsitewiseCreateAccessPolicyResponse class]];
}

- (void)createAccessPolicy:(AWSiotsitewiseCreateAccessPolicyRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseCreateAccessPolicyResponse *response, NSError *error))completionHandler {
    [[self createAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseCreateAccessPolicyResponse *> * _Nonnull task) {
        AWSiotsitewiseCreateAccessPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseCreateAssetResponse *> *)createAsset:(AWSiotsitewiseCreateAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/assets"
                  targetPrefix:@""
                 operationName:@"CreateAsset"
                   outputClass:[AWSiotsitewiseCreateAssetResponse class]];
}

- (void)createAsset:(AWSiotsitewiseCreateAssetRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseCreateAssetResponse *response, NSError *error))completionHandler {
    [[self createAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseCreateAssetResponse *> * _Nonnull task) {
        AWSiotsitewiseCreateAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseCreateAssetModelResponse *> *)createAssetModel:(AWSiotsitewiseCreateAssetModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/asset-models"
                  targetPrefix:@""
                 operationName:@"CreateAssetModel"
                   outputClass:[AWSiotsitewiseCreateAssetModelResponse class]];
}

- (void)createAssetModel:(AWSiotsitewiseCreateAssetModelRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseCreateAssetModelResponse *response, NSError *error))completionHandler {
    [[self createAssetModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseCreateAssetModelResponse *> * _Nonnull task) {
        AWSiotsitewiseCreateAssetModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseCreateDashboardResponse *> *)createDashboard:(AWSiotsitewiseCreateDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/dashboards"
                  targetPrefix:@""
                 operationName:@"CreateDashboard"
                   outputClass:[AWSiotsitewiseCreateDashboardResponse class]];
}

- (void)createDashboard:(AWSiotsitewiseCreateDashboardRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseCreateDashboardResponse *response, NSError *error))completionHandler {
    [[self createDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseCreateDashboardResponse *> * _Nonnull task) {
        AWSiotsitewiseCreateDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseCreateGatewayResponse *> *)createGateway:(AWSiotsitewiseCreateGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/20200301/gateways"
                  targetPrefix:@""
                 operationName:@"CreateGateway"
                   outputClass:[AWSiotsitewiseCreateGatewayResponse class]];
}

- (void)createGateway:(AWSiotsitewiseCreateGatewayRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseCreateGatewayResponse *response, NSError *error))completionHandler {
    [[self createGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseCreateGatewayResponse *> * _Nonnull task) {
        AWSiotsitewiseCreateGatewayResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseCreatePortalResponse *> *)createPortal:(AWSiotsitewiseCreatePortalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/portals"
                  targetPrefix:@""
                 operationName:@"CreatePortal"
                   outputClass:[AWSiotsitewiseCreatePortalResponse class]];
}

- (void)createPortal:(AWSiotsitewiseCreatePortalRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseCreatePortalResponse *response, NSError *error))completionHandler {
    [[self createPortal:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseCreatePortalResponse *> * _Nonnull task) {
        AWSiotsitewiseCreatePortalResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseCreateProjectResponse *> *)createProject:(AWSiotsitewiseCreateProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/projects"
                  targetPrefix:@""
                 operationName:@"CreateProject"
                   outputClass:[AWSiotsitewiseCreateProjectResponse class]];
}

- (void)createProject:(AWSiotsitewiseCreateProjectRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseCreateProjectResponse *response, NSError *error))completionHandler {
    [[self createProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseCreateProjectResponse *> * _Nonnull task) {
        AWSiotsitewiseCreateProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDeleteAccessPolicyResponse *> *)deleteAccessPolicy:(AWSiotsitewiseDeleteAccessPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/access-policies/{accessPolicyId}"
                  targetPrefix:@""
                 operationName:@"DeleteAccessPolicy"
                   outputClass:[AWSiotsitewiseDeleteAccessPolicyResponse class]];
}

- (void)deleteAccessPolicy:(AWSiotsitewiseDeleteAccessPolicyRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDeleteAccessPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDeleteAccessPolicyResponse *> * _Nonnull task) {
        AWSiotsitewiseDeleteAccessPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDeleteAssetResponse *> *)deleteAsset:(AWSiotsitewiseDeleteAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/assets/{assetId}"
                  targetPrefix:@""
                 operationName:@"DeleteAsset"
                   outputClass:[AWSiotsitewiseDeleteAssetResponse class]];
}

- (void)deleteAsset:(AWSiotsitewiseDeleteAssetRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDeleteAssetResponse *response, NSError *error))completionHandler {
    [[self deleteAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDeleteAssetResponse *> * _Nonnull task) {
        AWSiotsitewiseDeleteAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDeleteAssetModelResponse *> *)deleteAssetModel:(AWSiotsitewiseDeleteAssetModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/asset-models/{assetModelId}"
                  targetPrefix:@""
                 operationName:@"DeleteAssetModel"
                   outputClass:[AWSiotsitewiseDeleteAssetModelResponse class]];
}

- (void)deleteAssetModel:(AWSiotsitewiseDeleteAssetModelRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDeleteAssetModelResponse *response, NSError *error))completionHandler {
    [[self deleteAssetModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDeleteAssetModelResponse *> * _Nonnull task) {
        AWSiotsitewiseDeleteAssetModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDeleteDashboardResponse *> *)deleteDashboard:(AWSiotsitewiseDeleteDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/dashboards/{dashboardId}"
                  targetPrefix:@""
                 operationName:@"DeleteDashboard"
                   outputClass:[AWSiotsitewiseDeleteDashboardResponse class]];
}

- (void)deleteDashboard:(AWSiotsitewiseDeleteDashboardRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDeleteDashboardResponse *response, NSError *error))completionHandler {
    [[self deleteDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDeleteDashboardResponse *> * _Nonnull task) {
        AWSiotsitewiseDeleteDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteGateway:(AWSiotsitewiseDeleteGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/20200301/gateways/{gatewayId}"
                  targetPrefix:@""
                 operationName:@"DeleteGateway"
                   outputClass:nil];
}

- (void)deleteGateway:(AWSiotsitewiseDeleteGatewayRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteGateway:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDeletePortalResponse *> *)deletePortal:(AWSiotsitewiseDeletePortalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/portals/{portalId}"
                  targetPrefix:@""
                 operationName:@"DeletePortal"
                   outputClass:[AWSiotsitewiseDeletePortalResponse class]];
}

- (void)deletePortal:(AWSiotsitewiseDeletePortalRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDeletePortalResponse *response, NSError *error))completionHandler {
    [[self deletePortal:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDeletePortalResponse *> * _Nonnull task) {
        AWSiotsitewiseDeletePortalResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDeleteProjectResponse *> *)deleteProject:(AWSiotsitewiseDeleteProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/projects/{projectId}"
                  targetPrefix:@""
                 operationName:@"DeleteProject"
                   outputClass:[AWSiotsitewiseDeleteProjectResponse class]];
}

- (void)deleteProject:(AWSiotsitewiseDeleteProjectRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDeleteProjectResponse *response, NSError *error))completionHandler {
    [[self deleteProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDeleteProjectResponse *> * _Nonnull task) {
        AWSiotsitewiseDeleteProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDescribeAccessPolicyResponse *> *)describeAccessPolicy:(AWSiotsitewiseDescribeAccessPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/access-policies/{accessPolicyId}"
                  targetPrefix:@""
                 operationName:@"DescribeAccessPolicy"
                   outputClass:[AWSiotsitewiseDescribeAccessPolicyResponse class]];
}

- (void)describeAccessPolicy:(AWSiotsitewiseDescribeAccessPolicyRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDescribeAccessPolicyResponse *response, NSError *error))completionHandler {
    [[self describeAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDescribeAccessPolicyResponse *> * _Nonnull task) {
        AWSiotsitewiseDescribeAccessPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDescribeAssetResponse *> *)describeAsset:(AWSiotsitewiseDescribeAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets/{assetId}"
                  targetPrefix:@""
                 operationName:@"DescribeAsset"
                   outputClass:[AWSiotsitewiseDescribeAssetResponse class]];
}

- (void)describeAsset:(AWSiotsitewiseDescribeAssetRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDescribeAssetResponse *response, NSError *error))completionHandler {
    [[self describeAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDescribeAssetResponse *> * _Nonnull task) {
        AWSiotsitewiseDescribeAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDescribeAssetModelResponse *> *)describeAssetModel:(AWSiotsitewiseDescribeAssetModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/asset-models/{assetModelId}"
                  targetPrefix:@""
                 operationName:@"DescribeAssetModel"
                   outputClass:[AWSiotsitewiseDescribeAssetModelResponse class]];
}

- (void)describeAssetModel:(AWSiotsitewiseDescribeAssetModelRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDescribeAssetModelResponse *response, NSError *error))completionHandler {
    [[self describeAssetModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDescribeAssetModelResponse *> * _Nonnull task) {
        AWSiotsitewiseDescribeAssetModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDescribeAssetPropertyResponse *> *)describeAssetProperty:(AWSiotsitewiseDescribeAssetPropertyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets/{assetId}/properties/{propertyId}"
                  targetPrefix:@""
                 operationName:@"DescribeAssetProperty"
                   outputClass:[AWSiotsitewiseDescribeAssetPropertyResponse class]];
}

- (void)describeAssetProperty:(AWSiotsitewiseDescribeAssetPropertyRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDescribeAssetPropertyResponse *response, NSError *error))completionHandler {
    [[self describeAssetProperty:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDescribeAssetPropertyResponse *> * _Nonnull task) {
        AWSiotsitewiseDescribeAssetPropertyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDescribeDashboardResponse *> *)describeDashboard:(AWSiotsitewiseDescribeDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/dashboards/{dashboardId}"
                  targetPrefix:@""
                 operationName:@"DescribeDashboard"
                   outputClass:[AWSiotsitewiseDescribeDashboardResponse class]];
}

- (void)describeDashboard:(AWSiotsitewiseDescribeDashboardRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDescribeDashboardResponse *response, NSError *error))completionHandler {
    [[self describeDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDescribeDashboardResponse *> * _Nonnull task) {
        AWSiotsitewiseDescribeDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDescribeGatewayResponse *> *)describeGateway:(AWSiotsitewiseDescribeGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/20200301/gateways/{gatewayId}"
                  targetPrefix:@""
                 operationName:@"DescribeGateway"
                   outputClass:[AWSiotsitewiseDescribeGatewayResponse class]];
}

- (void)describeGateway:(AWSiotsitewiseDescribeGatewayRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDescribeGatewayResponse *response, NSError *error))completionHandler {
    [[self describeGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDescribeGatewayResponse *> * _Nonnull task) {
        AWSiotsitewiseDescribeGatewayResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse *> *)describeGatewayCapabilityConfiguration:(AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/20200301/gateways/{gatewayId}/capability/{capabilityNamespace}"
                  targetPrefix:@""
                 operationName:@"DescribeGatewayCapabilityConfiguration"
                   outputClass:[AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse class]];
}

- (void)describeGatewayCapabilityConfiguration:(AWSiotsitewiseDescribeGatewayCapabilityConfigurationRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeGatewayCapabilityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse *> * _Nonnull task) {
        AWSiotsitewiseDescribeGatewayCapabilityConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDescribeLoggingOptionsResponse *> *)describeLoggingOptions:(AWSiotsitewiseDescribeLoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/logging"
                  targetPrefix:@""
                 operationName:@"DescribeLoggingOptions"
                   outputClass:[AWSiotsitewiseDescribeLoggingOptionsResponse class]];
}

- (void)describeLoggingOptions:(AWSiotsitewiseDescribeLoggingOptionsRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDescribeLoggingOptionsResponse *response, NSError *error))completionHandler {
    [[self describeLoggingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDescribeLoggingOptionsResponse *> * _Nonnull task) {
        AWSiotsitewiseDescribeLoggingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDescribePortalResponse *> *)describePortal:(AWSiotsitewiseDescribePortalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/portals/{portalId}"
                  targetPrefix:@""
                 operationName:@"DescribePortal"
                   outputClass:[AWSiotsitewiseDescribePortalResponse class]];
}

- (void)describePortal:(AWSiotsitewiseDescribePortalRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDescribePortalResponse *response, NSError *error))completionHandler {
    [[self describePortal:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDescribePortalResponse *> * _Nonnull task) {
        AWSiotsitewiseDescribePortalResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseDescribeProjectResponse *> *)describeProject:(AWSiotsitewiseDescribeProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/projects/{projectId}"
                  targetPrefix:@""
                 operationName:@"DescribeProject"
                   outputClass:[AWSiotsitewiseDescribeProjectResponse class]];
}

- (void)describeProject:(AWSiotsitewiseDescribeProjectRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseDescribeProjectResponse *response, NSError *error))completionHandler {
    [[self describeProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseDescribeProjectResponse *> * _Nonnull task) {
        AWSiotsitewiseDescribeProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateAssets:(AWSiotsitewiseDisassociateAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/assets/{assetId}/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateAssets"
                   outputClass:nil];
}

- (void)disassociateAssets:(AWSiotsitewiseDisassociateAssetsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateAssets:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseGetAssetPropertyAggregatesResponse *> *)getAssetPropertyAggregates:(AWSiotsitewiseGetAssetPropertyAggregatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/properties/aggregates"
                  targetPrefix:@""
                 operationName:@"GetAssetPropertyAggregates"
                   outputClass:[AWSiotsitewiseGetAssetPropertyAggregatesResponse class]];
}

- (void)getAssetPropertyAggregates:(AWSiotsitewiseGetAssetPropertyAggregatesRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseGetAssetPropertyAggregatesResponse *response, NSError *error))completionHandler {
    [[self getAssetPropertyAggregates:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseGetAssetPropertyAggregatesResponse *> * _Nonnull task) {
        AWSiotsitewiseGetAssetPropertyAggregatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseGetAssetPropertyValueResponse *> *)getAssetPropertyValue:(AWSiotsitewiseGetAssetPropertyValueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/properties/latest"
                  targetPrefix:@""
                 operationName:@"GetAssetPropertyValue"
                   outputClass:[AWSiotsitewiseGetAssetPropertyValueResponse class]];
}

- (void)getAssetPropertyValue:(AWSiotsitewiseGetAssetPropertyValueRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseGetAssetPropertyValueResponse *response, NSError *error))completionHandler {
    [[self getAssetPropertyValue:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseGetAssetPropertyValueResponse *> * _Nonnull task) {
        AWSiotsitewiseGetAssetPropertyValueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseGetAssetPropertyValueHistoryResponse *> *)getAssetPropertyValueHistory:(AWSiotsitewiseGetAssetPropertyValueHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/properties/history"
                  targetPrefix:@""
                 operationName:@"GetAssetPropertyValueHistory"
                   outputClass:[AWSiotsitewiseGetAssetPropertyValueHistoryResponse class]];
}

- (void)getAssetPropertyValueHistory:(AWSiotsitewiseGetAssetPropertyValueHistoryRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseGetAssetPropertyValueHistoryResponse *response, NSError *error))completionHandler {
    [[self getAssetPropertyValueHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseGetAssetPropertyValueHistoryResponse *> * _Nonnull task) {
        AWSiotsitewiseGetAssetPropertyValueHistoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseListAccessPoliciesResponse *> *)listAccessPolicies:(AWSiotsitewiseListAccessPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/access-policies"
                  targetPrefix:@""
                 operationName:@"ListAccessPolicies"
                   outputClass:[AWSiotsitewiseListAccessPoliciesResponse class]];
}

- (void)listAccessPolicies:(AWSiotsitewiseListAccessPoliciesRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseListAccessPoliciesResponse *response, NSError *error))completionHandler {
    [[self listAccessPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseListAccessPoliciesResponse *> * _Nonnull task) {
        AWSiotsitewiseListAccessPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseListAssetModelsResponse *> *)listAssetModels:(AWSiotsitewiseListAssetModelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/asset-models"
                  targetPrefix:@""
                 operationName:@"ListAssetModels"
                   outputClass:[AWSiotsitewiseListAssetModelsResponse class]];
}

- (void)listAssetModels:(AWSiotsitewiseListAssetModelsRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseListAssetModelsResponse *response, NSError *error))completionHandler {
    [[self listAssetModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseListAssetModelsResponse *> * _Nonnull task) {
        AWSiotsitewiseListAssetModelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseListAssetsResponse *> *)listAssets:(AWSiotsitewiseListAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets"
                  targetPrefix:@""
                 operationName:@"ListAssets"
                   outputClass:[AWSiotsitewiseListAssetsResponse class]];
}

- (void)listAssets:(AWSiotsitewiseListAssetsRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseListAssetsResponse *response, NSError *error))completionHandler {
    [[self listAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseListAssetsResponse *> * _Nonnull task) {
        AWSiotsitewiseListAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseListAssociatedAssetsResponse *> *)listAssociatedAssets:(AWSiotsitewiseListAssociatedAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/assets/{assetId}/hierarchies"
                  targetPrefix:@""
                 operationName:@"ListAssociatedAssets"
                   outputClass:[AWSiotsitewiseListAssociatedAssetsResponse class]];
}

- (void)listAssociatedAssets:(AWSiotsitewiseListAssociatedAssetsRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseListAssociatedAssetsResponse *response, NSError *error))completionHandler {
    [[self listAssociatedAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseListAssociatedAssetsResponse *> * _Nonnull task) {
        AWSiotsitewiseListAssociatedAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseListDashboardsResponse *> *)listDashboards:(AWSiotsitewiseListDashboardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/dashboards"
                  targetPrefix:@""
                 operationName:@"ListDashboards"
                   outputClass:[AWSiotsitewiseListDashboardsResponse class]];
}

- (void)listDashboards:(AWSiotsitewiseListDashboardsRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseListDashboardsResponse *response, NSError *error))completionHandler {
    [[self listDashboards:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseListDashboardsResponse *> * _Nonnull task) {
        AWSiotsitewiseListDashboardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseListGatewaysResponse *> *)listGateways:(AWSiotsitewiseListGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/20200301/gateways"
                  targetPrefix:@""
                 operationName:@"ListGateways"
                   outputClass:[AWSiotsitewiseListGatewaysResponse class]];
}

- (void)listGateways:(AWSiotsitewiseListGatewaysRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseListGatewaysResponse *response, NSError *error))completionHandler {
    [[self listGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseListGatewaysResponse *> * _Nonnull task) {
        AWSiotsitewiseListGatewaysResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseListPortalsResponse *> *)listPortals:(AWSiotsitewiseListPortalsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/portals"
                  targetPrefix:@""
                 operationName:@"ListPortals"
                   outputClass:[AWSiotsitewiseListPortalsResponse class]];
}

- (void)listPortals:(AWSiotsitewiseListPortalsRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseListPortalsResponse *response, NSError *error))completionHandler {
    [[self listPortals:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseListPortalsResponse *> * _Nonnull task) {
        AWSiotsitewiseListPortalsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseListProjectAssetsResponse *> *)listProjectAssets:(AWSiotsitewiseListProjectAssetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/projects/{projectId}/assets"
                  targetPrefix:@""
                 operationName:@"ListProjectAssets"
                   outputClass:[AWSiotsitewiseListProjectAssetsResponse class]];
}

- (void)listProjectAssets:(AWSiotsitewiseListProjectAssetsRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseListProjectAssetsResponse *response, NSError *error))completionHandler {
    [[self listProjectAssets:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseListProjectAssetsResponse *> * _Nonnull task) {
        AWSiotsitewiseListProjectAssetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseListProjectsResponse *> *)listProjects:(AWSiotsitewiseListProjectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/projects"
                  targetPrefix:@""
                 operationName:@"ListProjects"
                   outputClass:[AWSiotsitewiseListProjectsResponse class]];
}

- (void)listProjects:(AWSiotsitewiseListProjectsRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseListProjectsResponse *response, NSError *error))completionHandler {
    [[self listProjects:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseListProjectsResponse *> * _Nonnull task) {
        AWSiotsitewiseListProjectsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseListTagsForResourceResponse *> *)listTagsForResource:(AWSiotsitewiseListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSiotsitewiseListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSiotsitewiseListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseListTagsForResourceResponse *> * _Nonnull task) {
        AWSiotsitewiseListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewisePutLoggingOptionsResponse *> *)putLoggingOptions:(AWSiotsitewisePutLoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/logging"
                  targetPrefix:@""
                 operationName:@"PutLoggingOptions"
                   outputClass:[AWSiotsitewisePutLoggingOptionsResponse class]];
}

- (void)putLoggingOptions:(AWSiotsitewisePutLoggingOptionsRequest *)request
     completionHandler:(void (^)(AWSiotsitewisePutLoggingOptionsResponse *response, NSError *error))completionHandler {
    [[self putLoggingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewisePutLoggingOptionsResponse *> * _Nonnull task) {
        AWSiotsitewisePutLoggingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseTagResourceResponse *> *)tagResource:(AWSiotsitewiseTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSiotsitewiseTagResourceResponse class]];
}

- (void)tagResource:(AWSiotsitewiseTagResourceRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseTagResourceResponse *> * _Nonnull task) {
        AWSiotsitewiseTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseUntagResourceResponse *> *)untagResource:(AWSiotsitewiseUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSiotsitewiseUntagResourceResponse class]];
}

- (void)untagResource:(AWSiotsitewiseUntagResourceRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseUntagResourceResponse *> * _Nonnull task) {
        AWSiotsitewiseUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseUpdateAccessPolicyResponse *> *)updateAccessPolicy:(AWSiotsitewiseUpdateAccessPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/access-policies/{accessPolicyId}"
                  targetPrefix:@""
                 operationName:@"UpdateAccessPolicy"
                   outputClass:[AWSiotsitewiseUpdateAccessPolicyResponse class]];
}

- (void)updateAccessPolicy:(AWSiotsitewiseUpdateAccessPolicyRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseUpdateAccessPolicyResponse *response, NSError *error))completionHandler {
    [[self updateAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseUpdateAccessPolicyResponse *> * _Nonnull task) {
        AWSiotsitewiseUpdateAccessPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseUpdateAssetResponse *> *)updateAsset:(AWSiotsitewiseUpdateAssetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/assets/{assetId}"
                  targetPrefix:@""
                 operationName:@"UpdateAsset"
                   outputClass:[AWSiotsitewiseUpdateAssetResponse class]];
}

- (void)updateAsset:(AWSiotsitewiseUpdateAssetRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseUpdateAssetResponse *response, NSError *error))completionHandler {
    [[self updateAsset:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseUpdateAssetResponse *> * _Nonnull task) {
        AWSiotsitewiseUpdateAssetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseUpdateAssetModelResponse *> *)updateAssetModel:(AWSiotsitewiseUpdateAssetModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/asset-models/{assetModelId}"
                  targetPrefix:@""
                 operationName:@"UpdateAssetModel"
                   outputClass:[AWSiotsitewiseUpdateAssetModelResponse class]];
}

- (void)updateAssetModel:(AWSiotsitewiseUpdateAssetModelRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseUpdateAssetModelResponse *response, NSError *error))completionHandler {
    [[self updateAssetModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseUpdateAssetModelResponse *> * _Nonnull task) {
        AWSiotsitewiseUpdateAssetModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateAssetProperty:(AWSiotsitewiseUpdateAssetPropertyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/assets/{assetId}/properties/{propertyId}"
                  targetPrefix:@""
                 operationName:@"UpdateAssetProperty"
                   outputClass:nil];
}

- (void)updateAssetProperty:(AWSiotsitewiseUpdateAssetPropertyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateAssetProperty:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseUpdateDashboardResponse *> *)updateDashboard:(AWSiotsitewiseUpdateDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/dashboards/{dashboardId}"
                  targetPrefix:@""
                 operationName:@"UpdateDashboard"
                   outputClass:[AWSiotsitewiseUpdateDashboardResponse class]];
}

- (void)updateDashboard:(AWSiotsitewiseUpdateDashboardRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseUpdateDashboardResponse *response, NSError *error))completionHandler {
    [[self updateDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseUpdateDashboardResponse *> * _Nonnull task) {
        AWSiotsitewiseUpdateDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateGateway:(AWSiotsitewiseUpdateGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/20200301/gateways/{gatewayId}"
                  targetPrefix:@""
                 operationName:@"UpdateGateway"
                   outputClass:nil];
}

- (void)updateGateway:(AWSiotsitewiseUpdateGatewayRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateGateway:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse *> *)updateGatewayCapabilityConfiguration:(AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/20200301/gateways/{gatewayId}/capability"
                  targetPrefix:@""
                 operationName:@"UpdateGatewayCapabilityConfiguration"
                   outputClass:[AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse class]];
}

- (void)updateGatewayCapabilityConfiguration:(AWSiotsitewiseUpdateGatewayCapabilityConfigurationRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateGatewayCapabilityConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse *> * _Nonnull task) {
        AWSiotsitewiseUpdateGatewayCapabilityConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseUpdatePortalResponse *> *)updatePortal:(AWSiotsitewiseUpdatePortalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/portals/{portalId}"
                  targetPrefix:@""
                 operationName:@"UpdatePortal"
                   outputClass:[AWSiotsitewiseUpdatePortalResponse class]];
}

- (void)updatePortal:(AWSiotsitewiseUpdatePortalRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseUpdatePortalResponse *response, NSError *error))completionHandler {
    [[self updatePortal:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseUpdatePortalResponse *> * _Nonnull task) {
        AWSiotsitewiseUpdatePortalResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSiotsitewiseUpdateProjectResponse *> *)updateProject:(AWSiotsitewiseUpdateProjectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/projects/{projectId}"
                  targetPrefix:@""
                 operationName:@"UpdateProject"
                   outputClass:[AWSiotsitewiseUpdateProjectResponse class]];
}

- (void)updateProject:(AWSiotsitewiseUpdateProjectRequest *)request
     completionHandler:(void (^)(AWSiotsitewiseUpdateProjectResponse *response, NSError *error))completionHandler {
    [[self updateProject:request] continueWithBlock:^id _Nullable(AWSTask<AWSiotsitewiseUpdateProjectResponse *> * _Nonnull task) {
        AWSiotsitewiseUpdateProjectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
