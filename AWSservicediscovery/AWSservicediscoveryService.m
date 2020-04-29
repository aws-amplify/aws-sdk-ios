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

#import "AWSservicediscoveryService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSservicediscoveryResources.h"

static NSString *const AWSInfoservicediscovery = @"servicediscovery";
NSString *const AWSservicediscoverySDKVersion = @"2.13.2";


@interface AWSservicediscoveryResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSservicediscoveryResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"CustomHealthNotFound" : @(AWSservicediscoveryErrorCustomHealthNotFound),
                            @"DuplicateRequest" : @(AWSservicediscoveryErrorDuplicateRequest),
                            @"InstanceNotFound" : @(AWSservicediscoveryErrorInstanceNotFound),
                            @"InvalidInput" : @(AWSservicediscoveryErrorInvalidInput),
                            @"NamespaceAlreadyExists" : @(AWSservicediscoveryErrorNamespaceAlreadyExists),
                            @"NamespaceNotFound" : @(AWSservicediscoveryErrorNamespaceNotFound),
                            @"OperationNotFound" : @(AWSservicediscoveryErrorOperationNotFound),
                            @"ResourceInUse" : @(AWSservicediscoveryErrorResourceInUse),
                            @"ResourceLimitExceeded" : @(AWSservicediscoveryErrorResourceLimitExceeded),
                            @"ServiceAlreadyExists" : @(AWSservicediscoveryErrorServiceAlreadyExists),
                            @"ServiceNotFound" : @(AWSservicediscoveryErrorServiceNotFound),
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
	                *error = [NSError errorWithDomain:AWSservicediscoveryErrorDomain
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
        *error = [NSError errorWithDomain:AWSservicediscoveryErrorDomain
                                     code:AWSservicediscoveryErrorUnknown
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

@interface AWSservicediscoveryRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSservicediscoveryRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSservicediscovery()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSservicediscovery

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSservicediscoverySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSservicediscovery versions need to match. Check your SDK installation. AWSCore: %@ AWSservicediscovery: %@", AWSiOSSDKVersion, AWSservicediscoverySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultservicediscovery {
    static AWSservicediscovery *_defaultservicediscovery = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoservicediscovery];
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
        _defaultservicediscovery = [[AWSservicediscovery alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultservicediscovery;
}

+ (void)registerservicediscoveryWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSservicediscovery alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)servicediscoveryForKey:(NSString *)key {
    @synchronized(self) {
        AWSservicediscovery *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoservicediscovery
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSservicediscovery registerservicediscoveryWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeservicediscoveryForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultservicediscovery` or `+ servicediscoveryForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceservicediscovery
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceservicediscovery];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSservicediscoveryRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSservicediscoveryResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSservicediscoveryResponseSerializer alloc] initWithJSONDefinition:[[AWSservicediscoveryResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSservicediscoveryCreateHttpNamespaceResponse *> *)createHttpNamespace:(AWSservicediscoveryCreateHttpNamespaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"CreateHttpNamespace"
                   outputClass:[AWSservicediscoveryCreateHttpNamespaceResponse class]];
}

- (void)createHttpNamespace:(AWSservicediscoveryCreateHttpNamespaceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryCreateHttpNamespaceResponse *response, NSError *error))completionHandler {
    [[self createHttpNamespace:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryCreateHttpNamespaceResponse *> * _Nonnull task) {
        AWSservicediscoveryCreateHttpNamespaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryCreatePrivateDnsNamespaceResponse *> *)createPrivateDnsNamespace:(AWSservicediscoveryCreatePrivateDnsNamespaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"CreatePrivateDnsNamespace"
                   outputClass:[AWSservicediscoveryCreatePrivateDnsNamespaceResponse class]];
}

- (void)createPrivateDnsNamespace:(AWSservicediscoveryCreatePrivateDnsNamespaceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryCreatePrivateDnsNamespaceResponse *response, NSError *error))completionHandler {
    [[self createPrivateDnsNamespace:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryCreatePrivateDnsNamespaceResponse *> * _Nonnull task) {
        AWSservicediscoveryCreatePrivateDnsNamespaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryCreatePublicDnsNamespaceResponse *> *)createPublicDnsNamespace:(AWSservicediscoveryCreatePublicDnsNamespaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"CreatePublicDnsNamespace"
                   outputClass:[AWSservicediscoveryCreatePublicDnsNamespaceResponse class]];
}

- (void)createPublicDnsNamespace:(AWSservicediscoveryCreatePublicDnsNamespaceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryCreatePublicDnsNamespaceResponse *response, NSError *error))completionHandler {
    [[self createPublicDnsNamespace:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryCreatePublicDnsNamespaceResponse *> * _Nonnull task) {
        AWSservicediscoveryCreatePublicDnsNamespaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryCreateServiceResponse *> *)createService:(AWSservicediscoveryCreateServiceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"CreateService"
                   outputClass:[AWSservicediscoveryCreateServiceResponse class]];
}

- (void)createService:(AWSservicediscoveryCreateServiceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryCreateServiceResponse *response, NSError *error))completionHandler {
    [[self createService:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryCreateServiceResponse *> * _Nonnull task) {
        AWSservicediscoveryCreateServiceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryDeleteNamespaceResponse *> *)deleteNamespace:(AWSservicediscoveryDeleteNamespaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"DeleteNamespace"
                   outputClass:[AWSservicediscoveryDeleteNamespaceResponse class]];
}

- (void)deleteNamespace:(AWSservicediscoveryDeleteNamespaceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryDeleteNamespaceResponse *response, NSError *error))completionHandler {
    [[self deleteNamespace:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryDeleteNamespaceResponse *> * _Nonnull task) {
        AWSservicediscoveryDeleteNamespaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryDeleteServiceResponse *> *)deleteService:(AWSservicediscoveryDeleteServiceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"DeleteService"
                   outputClass:[AWSservicediscoveryDeleteServiceResponse class]];
}

- (void)deleteService:(AWSservicediscoveryDeleteServiceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryDeleteServiceResponse *response, NSError *error))completionHandler {
    [[self deleteService:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryDeleteServiceResponse *> * _Nonnull task) {
        AWSservicediscoveryDeleteServiceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryDeregisterInstanceResponse *> *)deregisterInstance:(AWSservicediscoveryDeregisterInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"DeregisterInstance"
                   outputClass:[AWSservicediscoveryDeregisterInstanceResponse class]];
}

- (void)deregisterInstance:(AWSservicediscoveryDeregisterInstanceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryDeregisterInstanceResponse *response, NSError *error))completionHandler {
    [[self deregisterInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryDeregisterInstanceResponse *> * _Nonnull task) {
        AWSservicediscoveryDeregisterInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryDiscoverInstancesResponse *> *)discoverInstances:(AWSservicediscoveryDiscoverInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"DiscoverInstances"
                   outputClass:[AWSservicediscoveryDiscoverInstancesResponse class]];
}

- (void)discoverInstances:(AWSservicediscoveryDiscoverInstancesRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryDiscoverInstancesResponse *response, NSError *error))completionHandler {
    [[self discoverInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryDiscoverInstancesResponse *> * _Nonnull task) {
        AWSservicediscoveryDiscoverInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryGetInstanceResponse *> *)getInstance:(AWSservicediscoveryGetInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"GetInstance"
                   outputClass:[AWSservicediscoveryGetInstanceResponse class]];
}

- (void)getInstance:(AWSservicediscoveryGetInstanceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryGetInstanceResponse *response, NSError *error))completionHandler {
    [[self getInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryGetInstanceResponse *> * _Nonnull task) {
        AWSservicediscoveryGetInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryGetInstancesHealthStatusResponse *> *)getInstancesHealthStatus:(AWSservicediscoveryGetInstancesHealthStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"GetInstancesHealthStatus"
                   outputClass:[AWSservicediscoveryGetInstancesHealthStatusResponse class]];
}

- (void)getInstancesHealthStatus:(AWSservicediscoveryGetInstancesHealthStatusRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryGetInstancesHealthStatusResponse *response, NSError *error))completionHandler {
    [[self getInstancesHealthStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryGetInstancesHealthStatusResponse *> * _Nonnull task) {
        AWSservicediscoveryGetInstancesHealthStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryGetNamespaceResponse *> *)getNamespace:(AWSservicediscoveryGetNamespaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"GetNamespace"
                   outputClass:[AWSservicediscoveryGetNamespaceResponse class]];
}

- (void)getNamespace:(AWSservicediscoveryGetNamespaceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryGetNamespaceResponse *response, NSError *error))completionHandler {
    [[self getNamespace:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryGetNamespaceResponse *> * _Nonnull task) {
        AWSservicediscoveryGetNamespaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryGetOperationResponse *> *)getOperation:(AWSservicediscoveryGetOperationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"GetOperation"
                   outputClass:[AWSservicediscoveryGetOperationResponse class]];
}

- (void)getOperation:(AWSservicediscoveryGetOperationRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryGetOperationResponse *response, NSError *error))completionHandler {
    [[self getOperation:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryGetOperationResponse *> * _Nonnull task) {
        AWSservicediscoveryGetOperationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryGetServiceResponse *> *)getService:(AWSservicediscoveryGetServiceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"GetService"
                   outputClass:[AWSservicediscoveryGetServiceResponse class]];
}

- (void)getService:(AWSservicediscoveryGetServiceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryGetServiceResponse *response, NSError *error))completionHandler {
    [[self getService:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryGetServiceResponse *> * _Nonnull task) {
        AWSservicediscoveryGetServiceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryListInstancesResponse *> *)listInstances:(AWSservicediscoveryListInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"ListInstances"
                   outputClass:[AWSservicediscoveryListInstancesResponse class]];
}

- (void)listInstances:(AWSservicediscoveryListInstancesRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryListInstancesResponse *response, NSError *error))completionHandler {
    [[self listInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryListInstancesResponse *> * _Nonnull task) {
        AWSservicediscoveryListInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryListNamespacesResponse *> *)listNamespaces:(AWSservicediscoveryListNamespacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"ListNamespaces"
                   outputClass:[AWSservicediscoveryListNamespacesResponse class]];
}

- (void)listNamespaces:(AWSservicediscoveryListNamespacesRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryListNamespacesResponse *response, NSError *error))completionHandler {
    [[self listNamespaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryListNamespacesResponse *> * _Nonnull task) {
        AWSservicediscoveryListNamespacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryListOperationsResponse *> *)listOperations:(AWSservicediscoveryListOperationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"ListOperations"
                   outputClass:[AWSservicediscoveryListOperationsResponse class]];
}

- (void)listOperations:(AWSservicediscoveryListOperationsRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryListOperationsResponse *response, NSError *error))completionHandler {
    [[self listOperations:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryListOperationsResponse *> * _Nonnull task) {
        AWSservicediscoveryListOperationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryListServicesResponse *> *)listServices:(AWSservicediscoveryListServicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"ListServices"
                   outputClass:[AWSservicediscoveryListServicesResponse class]];
}

- (void)listServices:(AWSservicediscoveryListServicesRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryListServicesResponse *response, NSError *error))completionHandler {
    [[self listServices:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryListServicesResponse *> * _Nonnull task) {
        AWSservicediscoveryListServicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryRegisterInstanceResponse *> *)registerInstance:(AWSservicediscoveryRegisterInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"RegisterInstance"
                   outputClass:[AWSservicediscoveryRegisterInstanceResponse class]];
}

- (void)registerInstance:(AWSservicediscoveryRegisterInstanceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryRegisterInstanceResponse *response, NSError *error))completionHandler {
    [[self registerInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryRegisterInstanceResponse *> * _Nonnull task) {
        AWSservicediscoveryRegisterInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateInstanceCustomHealthStatus:(AWSservicediscoveryUpdateInstanceCustomHealthStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"UpdateInstanceCustomHealthStatus"
                   outputClass:nil];
}

- (void)updateInstanceCustomHealthStatus:(AWSservicediscoveryUpdateInstanceCustomHealthStatusRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateInstanceCustomHealthStatus:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSservicediscoveryUpdateServiceResponse *> *)updateService:(AWSservicediscoveryUpdateServiceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"UpdateService"
                   outputClass:[AWSservicediscoveryUpdateServiceResponse class]];
}

- (void)updateService:(AWSservicediscoveryUpdateServiceRequest *)request
     completionHandler:(void (^)(AWSservicediscoveryUpdateServiceResponse *response, NSError *error))completionHandler {
    [[self updateService:request] continueWithBlock:^id _Nullable(AWSTask<AWSservicediscoveryUpdateServiceResponse *> * _Nonnull task) {
        AWSservicediscoveryUpdateServiceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
