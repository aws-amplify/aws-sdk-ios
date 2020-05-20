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

#import "AWSAppmeshService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAppmeshResources.h"

static NSString *const AWSInfoAppmesh = @"Appmesh";
NSString *const AWSAppmeshSDKVersion = @"2.13.3";


@interface AWSAppmeshResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSAppmeshResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSAppmeshErrorBadRequest),
                            @"ConflictException" : @(AWSAppmeshErrorConflict),
                            @"ForbiddenException" : @(AWSAppmeshErrorForbidden),
                            @"InternalServerErrorException" : @(AWSAppmeshErrorInternalServerError),
                            @"LimitExceededException" : @(AWSAppmeshErrorLimitExceeded),
                            @"NotFoundException" : @(AWSAppmeshErrorNotFound),
                            @"ResourceInUseException" : @(AWSAppmeshErrorResourceInUse),
                            @"ServiceUnavailableException" : @(AWSAppmeshErrorServiceUnavailable),
                            @"TooManyRequestsException" : @(AWSAppmeshErrorTooManyRequests),
                            @"TooManyTagsException" : @(AWSAppmeshErrorTooManyTags),
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
                    *error = [NSError errorWithDomain:AWSAppmeshErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSAppmeshErrorDomain
                                                 code:AWSAppmeshErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSAppmeshErrorDomain
                                     code:AWSAppmeshErrorUnknown
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

@interface AWSAppmeshRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAppmeshRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAppmesh()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAppmesh

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAppmeshSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAppmesh versions need to match. Check your SDK installation. AWSCore: %@ AWSAppmesh: %@", AWSiOSSDKVersion, AWSAppmeshSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAppmesh {
    static AWSAppmesh *_defaultAppmesh = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAppmesh];
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
        _defaultAppmesh = [[AWSAppmesh alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAppmesh;
}

+ (void)registerAppmeshWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAppmesh alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AppmeshForKey:(NSString *)key {
    @synchronized(self) {
        AWSAppmesh *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAppmesh
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAppmesh registerAppmeshWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAppmeshForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAppmesh` or `+ AppmeshForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAppmesh
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAppmesh];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAppmeshRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSAppmeshResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAppmeshResponseSerializer alloc] initWithJSONDefinition:[[AWSAppmeshResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSAppmeshCreateMeshOutput *> *)createMesh:(AWSAppmeshCreateMeshInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/meshes"
                  targetPrefix:@""
                 operationName:@"CreateMesh"
                   outputClass:[AWSAppmeshCreateMeshOutput class]];
}

- (void)createMesh:(AWSAppmeshCreateMeshInput *)request
     completionHandler:(void (^)(AWSAppmeshCreateMeshOutput *response, NSError *error))completionHandler {
    [[self createMesh:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshCreateMeshOutput *> * _Nonnull task) {
        AWSAppmeshCreateMeshOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshCreateRouteOutput *> *)createRoute:(AWSAppmeshCreateRouteInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes"
                  targetPrefix:@""
                 operationName:@"CreateRoute"
                   outputClass:[AWSAppmeshCreateRouteOutput class]];
}

- (void)createRoute:(AWSAppmeshCreateRouteInput *)request
     completionHandler:(void (^)(AWSAppmeshCreateRouteOutput *response, NSError *error))completionHandler {
    [[self createRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshCreateRouteOutput *> * _Nonnull task) {
        AWSAppmeshCreateRouteOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshCreateVirtualNodeOutput *> *)createVirtualNode:(AWSAppmeshCreateVirtualNodeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/meshes/{meshName}/virtualNodes"
                  targetPrefix:@""
                 operationName:@"CreateVirtualNode"
                   outputClass:[AWSAppmeshCreateVirtualNodeOutput class]];
}

- (void)createVirtualNode:(AWSAppmeshCreateVirtualNodeInput *)request
     completionHandler:(void (^)(AWSAppmeshCreateVirtualNodeOutput *response, NSError *error))completionHandler {
    [[self createVirtualNode:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshCreateVirtualNodeOutput *> * _Nonnull task) {
        AWSAppmeshCreateVirtualNodeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshCreateVirtualRouterOutput *> *)createVirtualRouter:(AWSAppmeshCreateVirtualRouterInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/meshes/{meshName}/virtualRouters"
                  targetPrefix:@""
                 operationName:@"CreateVirtualRouter"
                   outputClass:[AWSAppmeshCreateVirtualRouterOutput class]];
}

- (void)createVirtualRouter:(AWSAppmeshCreateVirtualRouterInput *)request
     completionHandler:(void (^)(AWSAppmeshCreateVirtualRouterOutput *response, NSError *error))completionHandler {
    [[self createVirtualRouter:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshCreateVirtualRouterOutput *> * _Nonnull task) {
        AWSAppmeshCreateVirtualRouterOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshCreateVirtualServiceOutput *> *)createVirtualService:(AWSAppmeshCreateVirtualServiceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/meshes/{meshName}/virtualServices"
                  targetPrefix:@""
                 operationName:@"CreateVirtualService"
                   outputClass:[AWSAppmeshCreateVirtualServiceOutput class]];
}

- (void)createVirtualService:(AWSAppmeshCreateVirtualServiceInput *)request
     completionHandler:(void (^)(AWSAppmeshCreateVirtualServiceOutput *response, NSError *error))completionHandler {
    [[self createVirtualService:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshCreateVirtualServiceOutput *> * _Nonnull task) {
        AWSAppmeshCreateVirtualServiceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshDeleteMeshOutput *> *)deleteMesh:(AWSAppmeshDeleteMeshInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v20190125/meshes/{meshName}"
                  targetPrefix:@""
                 operationName:@"DeleteMesh"
                   outputClass:[AWSAppmeshDeleteMeshOutput class]];
}

- (void)deleteMesh:(AWSAppmeshDeleteMeshInput *)request
     completionHandler:(void (^)(AWSAppmeshDeleteMeshOutput *response, NSError *error))completionHandler {
    [[self deleteMesh:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshDeleteMeshOutput *> * _Nonnull task) {
        AWSAppmeshDeleteMeshOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshDeleteRouteOutput *> *)deleteRoute:(AWSAppmeshDeleteRouteInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}"
                  targetPrefix:@""
                 operationName:@"DeleteRoute"
                   outputClass:[AWSAppmeshDeleteRouteOutput class]];
}

- (void)deleteRoute:(AWSAppmeshDeleteRouteInput *)request
     completionHandler:(void (^)(AWSAppmeshDeleteRouteOutput *response, NSError *error))completionHandler {
    [[self deleteRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshDeleteRouteOutput *> * _Nonnull task) {
        AWSAppmeshDeleteRouteOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshDeleteVirtualNodeOutput *> *)deleteVirtualNode:(AWSAppmeshDeleteVirtualNodeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}"
                  targetPrefix:@""
                 operationName:@"DeleteVirtualNode"
                   outputClass:[AWSAppmeshDeleteVirtualNodeOutput class]];
}

- (void)deleteVirtualNode:(AWSAppmeshDeleteVirtualNodeInput *)request
     completionHandler:(void (^)(AWSAppmeshDeleteVirtualNodeOutput *response, NSError *error))completionHandler {
    [[self deleteVirtualNode:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshDeleteVirtualNodeOutput *> * _Nonnull task) {
        AWSAppmeshDeleteVirtualNodeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshDeleteVirtualRouterOutput *> *)deleteVirtualRouter:(AWSAppmeshDeleteVirtualRouterInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}"
                  targetPrefix:@""
                 operationName:@"DeleteVirtualRouter"
                   outputClass:[AWSAppmeshDeleteVirtualRouterOutput class]];
}

- (void)deleteVirtualRouter:(AWSAppmeshDeleteVirtualRouterInput *)request
     completionHandler:(void (^)(AWSAppmeshDeleteVirtualRouterOutput *response, NSError *error))completionHandler {
    [[self deleteVirtualRouter:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshDeleteVirtualRouterOutput *> * _Nonnull task) {
        AWSAppmeshDeleteVirtualRouterOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshDeleteVirtualServiceOutput *> *)deleteVirtualService:(AWSAppmeshDeleteVirtualServiceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}"
                  targetPrefix:@""
                 operationName:@"DeleteVirtualService"
                   outputClass:[AWSAppmeshDeleteVirtualServiceOutput class]];
}

- (void)deleteVirtualService:(AWSAppmeshDeleteVirtualServiceInput *)request
     completionHandler:(void (^)(AWSAppmeshDeleteVirtualServiceOutput *response, NSError *error))completionHandler {
    [[self deleteVirtualService:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshDeleteVirtualServiceOutput *> * _Nonnull task) {
        AWSAppmeshDeleteVirtualServiceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshDescribeMeshOutput *> *)describeMesh:(AWSAppmeshDescribeMeshInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/meshes/{meshName}"
                  targetPrefix:@""
                 operationName:@"DescribeMesh"
                   outputClass:[AWSAppmeshDescribeMeshOutput class]];
}

- (void)describeMesh:(AWSAppmeshDescribeMeshInput *)request
     completionHandler:(void (^)(AWSAppmeshDescribeMeshOutput *response, NSError *error))completionHandler {
    [[self describeMesh:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshDescribeMeshOutput *> * _Nonnull task) {
        AWSAppmeshDescribeMeshOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshDescribeRouteOutput *> *)describeRoute:(AWSAppmeshDescribeRouteInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}"
                  targetPrefix:@""
                 operationName:@"DescribeRoute"
                   outputClass:[AWSAppmeshDescribeRouteOutput class]];
}

- (void)describeRoute:(AWSAppmeshDescribeRouteInput *)request
     completionHandler:(void (^)(AWSAppmeshDescribeRouteOutput *response, NSError *error))completionHandler {
    [[self describeRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshDescribeRouteOutput *> * _Nonnull task) {
        AWSAppmeshDescribeRouteOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshDescribeVirtualNodeOutput *> *)describeVirtualNode:(AWSAppmeshDescribeVirtualNodeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}"
                  targetPrefix:@""
                 operationName:@"DescribeVirtualNode"
                   outputClass:[AWSAppmeshDescribeVirtualNodeOutput class]];
}

- (void)describeVirtualNode:(AWSAppmeshDescribeVirtualNodeInput *)request
     completionHandler:(void (^)(AWSAppmeshDescribeVirtualNodeOutput *response, NSError *error))completionHandler {
    [[self describeVirtualNode:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshDescribeVirtualNodeOutput *> * _Nonnull task) {
        AWSAppmeshDescribeVirtualNodeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshDescribeVirtualRouterOutput *> *)describeVirtualRouter:(AWSAppmeshDescribeVirtualRouterInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}"
                  targetPrefix:@""
                 operationName:@"DescribeVirtualRouter"
                   outputClass:[AWSAppmeshDescribeVirtualRouterOutput class]];
}

- (void)describeVirtualRouter:(AWSAppmeshDescribeVirtualRouterInput *)request
     completionHandler:(void (^)(AWSAppmeshDescribeVirtualRouterOutput *response, NSError *error))completionHandler {
    [[self describeVirtualRouter:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshDescribeVirtualRouterOutput *> * _Nonnull task) {
        AWSAppmeshDescribeVirtualRouterOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshDescribeVirtualServiceOutput *> *)describeVirtualService:(AWSAppmeshDescribeVirtualServiceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}"
                  targetPrefix:@""
                 operationName:@"DescribeVirtualService"
                   outputClass:[AWSAppmeshDescribeVirtualServiceOutput class]];
}

- (void)describeVirtualService:(AWSAppmeshDescribeVirtualServiceInput *)request
     completionHandler:(void (^)(AWSAppmeshDescribeVirtualServiceOutput *response, NSError *error))completionHandler {
    [[self describeVirtualService:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshDescribeVirtualServiceOutput *> * _Nonnull task) {
        AWSAppmeshDescribeVirtualServiceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshListMeshesOutput *> *)listMeshes:(AWSAppmeshListMeshesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/meshes"
                  targetPrefix:@""
                 operationName:@"ListMeshes"
                   outputClass:[AWSAppmeshListMeshesOutput class]];
}

- (void)listMeshes:(AWSAppmeshListMeshesInput *)request
     completionHandler:(void (^)(AWSAppmeshListMeshesOutput *response, NSError *error))completionHandler {
    [[self listMeshes:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshListMeshesOutput *> * _Nonnull task) {
        AWSAppmeshListMeshesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshListRoutesOutput *> *)listRoutes:(AWSAppmeshListRoutesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes"
                  targetPrefix:@""
                 operationName:@"ListRoutes"
                   outputClass:[AWSAppmeshListRoutesOutput class]];
}

- (void)listRoutes:(AWSAppmeshListRoutesInput *)request
     completionHandler:(void (^)(AWSAppmeshListRoutesOutput *response, NSError *error))completionHandler {
    [[self listRoutes:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshListRoutesOutput *> * _Nonnull task) {
        AWSAppmeshListRoutesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshListTagsForResourceOutput *> *)listTagsForResource:(AWSAppmeshListTagsForResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/tags"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSAppmeshListTagsForResourceOutput class]];
}

- (void)listTagsForResource:(AWSAppmeshListTagsForResourceInput *)request
     completionHandler:(void (^)(AWSAppmeshListTagsForResourceOutput *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshListTagsForResourceOutput *> * _Nonnull task) {
        AWSAppmeshListTagsForResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshListVirtualNodesOutput *> *)listVirtualNodes:(AWSAppmeshListVirtualNodesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/meshes/{meshName}/virtualNodes"
                  targetPrefix:@""
                 operationName:@"ListVirtualNodes"
                   outputClass:[AWSAppmeshListVirtualNodesOutput class]];
}

- (void)listVirtualNodes:(AWSAppmeshListVirtualNodesInput *)request
     completionHandler:(void (^)(AWSAppmeshListVirtualNodesOutput *response, NSError *error))completionHandler {
    [[self listVirtualNodes:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshListVirtualNodesOutput *> * _Nonnull task) {
        AWSAppmeshListVirtualNodesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshListVirtualRoutersOutput *> *)listVirtualRouters:(AWSAppmeshListVirtualRoutersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/meshes/{meshName}/virtualRouters"
                  targetPrefix:@""
                 operationName:@"ListVirtualRouters"
                   outputClass:[AWSAppmeshListVirtualRoutersOutput class]];
}

- (void)listVirtualRouters:(AWSAppmeshListVirtualRoutersInput *)request
     completionHandler:(void (^)(AWSAppmeshListVirtualRoutersOutput *response, NSError *error))completionHandler {
    [[self listVirtualRouters:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshListVirtualRoutersOutput *> * _Nonnull task) {
        AWSAppmeshListVirtualRoutersOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshListVirtualServicesOutput *> *)listVirtualServices:(AWSAppmeshListVirtualServicesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v20190125/meshes/{meshName}/virtualServices"
                  targetPrefix:@""
                 operationName:@"ListVirtualServices"
                   outputClass:[AWSAppmeshListVirtualServicesOutput class]];
}

- (void)listVirtualServices:(AWSAppmeshListVirtualServicesInput *)request
     completionHandler:(void (^)(AWSAppmeshListVirtualServicesOutput *response, NSError *error))completionHandler {
    [[self listVirtualServices:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshListVirtualServicesOutput *> * _Nonnull task) {
        AWSAppmeshListVirtualServicesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshTagResourceOutput *> *)tagResource:(AWSAppmeshTagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/tag"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSAppmeshTagResourceOutput class]];
}

- (void)tagResource:(AWSAppmeshTagResourceInput *)request
     completionHandler:(void (^)(AWSAppmeshTagResourceOutput *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshTagResourceOutput *> * _Nonnull task) {
        AWSAppmeshTagResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshUntagResourceOutput *> *)untagResource:(AWSAppmeshUntagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/untag"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSAppmeshUntagResourceOutput class]];
}

- (void)untagResource:(AWSAppmeshUntagResourceInput *)request
     completionHandler:(void (^)(AWSAppmeshUntagResourceOutput *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshUntagResourceOutput *> * _Nonnull task) {
        AWSAppmeshUntagResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshUpdateMeshOutput *> *)updateMesh:(AWSAppmeshUpdateMeshInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/meshes/{meshName}"
                  targetPrefix:@""
                 operationName:@"UpdateMesh"
                   outputClass:[AWSAppmeshUpdateMeshOutput class]];
}

- (void)updateMesh:(AWSAppmeshUpdateMeshInput *)request
     completionHandler:(void (^)(AWSAppmeshUpdateMeshOutput *response, NSError *error))completionHandler {
    [[self updateMesh:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshUpdateMeshOutput *> * _Nonnull task) {
        AWSAppmeshUpdateMeshOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshUpdateRouteOutput *> *)updateRoute:(AWSAppmeshUpdateRouteInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/meshes/{meshName}/virtualRouter/{virtualRouterName}/routes/{routeName}"
                  targetPrefix:@""
                 operationName:@"UpdateRoute"
                   outputClass:[AWSAppmeshUpdateRouteOutput class]];
}

- (void)updateRoute:(AWSAppmeshUpdateRouteInput *)request
     completionHandler:(void (^)(AWSAppmeshUpdateRouteOutput *response, NSError *error))completionHandler {
    [[self updateRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshUpdateRouteOutput *> * _Nonnull task) {
        AWSAppmeshUpdateRouteOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshUpdateVirtualNodeOutput *> *)updateVirtualNode:(AWSAppmeshUpdateVirtualNodeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/meshes/{meshName}/virtualNodes/{virtualNodeName}"
                  targetPrefix:@""
                 operationName:@"UpdateVirtualNode"
                   outputClass:[AWSAppmeshUpdateVirtualNodeOutput class]];
}

- (void)updateVirtualNode:(AWSAppmeshUpdateVirtualNodeInput *)request
     completionHandler:(void (^)(AWSAppmeshUpdateVirtualNodeOutput *response, NSError *error))completionHandler {
    [[self updateVirtualNode:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshUpdateVirtualNodeOutput *> * _Nonnull task) {
        AWSAppmeshUpdateVirtualNodeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshUpdateVirtualRouterOutput *> *)updateVirtualRouter:(AWSAppmeshUpdateVirtualRouterInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/meshes/{meshName}/virtualRouters/{virtualRouterName}"
                  targetPrefix:@""
                 operationName:@"UpdateVirtualRouter"
                   outputClass:[AWSAppmeshUpdateVirtualRouterOutput class]];
}

- (void)updateVirtualRouter:(AWSAppmeshUpdateVirtualRouterInput *)request
     completionHandler:(void (^)(AWSAppmeshUpdateVirtualRouterOutput *response, NSError *error))completionHandler {
    [[self updateVirtualRouter:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshUpdateVirtualRouterOutput *> * _Nonnull task) {
        AWSAppmeshUpdateVirtualRouterOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAppmeshUpdateVirtualServiceOutput *> *)updateVirtualService:(AWSAppmeshUpdateVirtualServiceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v20190125/meshes/{meshName}/virtualServices/{virtualServiceName}"
                  targetPrefix:@""
                 operationName:@"UpdateVirtualService"
                   outputClass:[AWSAppmeshUpdateVirtualServiceOutput class]];
}

- (void)updateVirtualService:(AWSAppmeshUpdateVirtualServiceInput *)request
     completionHandler:(void (^)(AWSAppmeshUpdateVirtualServiceOutput *response, NSError *error))completionHandler {
    [[self updateVirtualService:request] continueWithBlock:^id _Nullable(AWSTask<AWSAppmeshUpdateVirtualServiceOutput *> * _Nonnull task) {
        AWSAppmeshUpdateVirtualServiceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
