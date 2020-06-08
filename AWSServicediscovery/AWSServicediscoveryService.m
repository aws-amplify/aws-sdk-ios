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

#import "AWSServicediscoveryService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSServicediscoveryResources.h"

static NSString *const AWSInfoServicediscovery = @"Servicediscovery";
NSString *const AWSServicediscoverySDKVersion = @"2.13.4";


@interface AWSServicediscoveryResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSServicediscoveryResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"CustomHealthNotFound" : @(AWSServicediscoveryErrorCustomHealthNotFound),
                            @"DuplicateRequest" : @(AWSServicediscoveryErrorDuplicateRequest),
                            @"InstanceNotFound" : @(AWSServicediscoveryErrorInstanceNotFound),
                            @"InvalidInput" : @(AWSServicediscoveryErrorInvalidInput),
                            @"NamespaceAlreadyExists" : @(AWSServicediscoveryErrorNamespaceAlreadyExists),
                            @"NamespaceNotFound" : @(AWSServicediscoveryErrorNamespaceNotFound),
                            @"OperationNotFound" : @(AWSServicediscoveryErrorOperationNotFound),
                            @"RequestLimitExceeded" : @(AWSServicediscoveryErrorRequestLimitExceeded),
                            @"ResourceInUse" : @(AWSServicediscoveryErrorResourceInUse),
                            @"ResourceLimitExceeded" : @(AWSServicediscoveryErrorResourceLimitExceeded),
                            @"ResourceNotFoundException" : @(AWSServicediscoveryErrorResourceNotFound),
                            @"ServiceAlreadyExists" : @(AWSServicediscoveryErrorServiceAlreadyExists),
                            @"ServiceNotFound" : @(AWSServicediscoveryErrorServiceNotFound),
                            @"TooManyTagsException" : @(AWSServicediscoveryErrorTooManyTags),
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
	                *error = [NSError errorWithDomain:AWSServicediscoveryErrorDomain
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
        *error = [NSError errorWithDomain:AWSServicediscoveryErrorDomain
                                     code:AWSServicediscoveryErrorUnknown
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

@interface AWSServicediscoveryRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSServicediscoveryRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSServicediscovery()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSServicediscovery

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSServicediscoverySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSServicediscovery versions need to match. Check your SDK installation. AWSCore: %@ AWSServicediscovery: %@", AWSiOSSDKVersion, AWSServicediscoverySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultServicediscovery {
    static AWSServicediscovery *_defaultServicediscovery = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoServicediscovery];
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
        _defaultServicediscovery = [[AWSServicediscovery alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultServicediscovery;
}

+ (void)registerServicediscoveryWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSServicediscovery alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ServicediscoveryForKey:(NSString *)key {
    @synchronized(self) {
        AWSServicediscovery *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoServicediscovery
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSServicediscovery registerServicediscoveryWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeServicediscoveryForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultServicediscovery` or `+ ServicediscoveryForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceServicediscovery
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceServicediscovery];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSServicediscoveryRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSServicediscoveryResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSServicediscoveryResponseSerializer alloc] initWithJSONDefinition:[[AWSServicediscoveryResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSServicediscoveryCreateHttpNamespaceResponse *> *)createHttpNamespace:(AWSServicediscoveryCreateHttpNamespaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"CreateHttpNamespace"
                   outputClass:[AWSServicediscoveryCreateHttpNamespaceResponse class]];
}

- (void)createHttpNamespace:(AWSServicediscoveryCreateHttpNamespaceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryCreateHttpNamespaceResponse *response, NSError *error))completionHandler {
    [[self createHttpNamespace:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryCreateHttpNamespaceResponse *> * _Nonnull task) {
        AWSServicediscoveryCreateHttpNamespaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryCreatePrivateDnsNamespaceResponse *> *)createPrivateDnsNamespace:(AWSServicediscoveryCreatePrivateDnsNamespaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"CreatePrivateDnsNamespace"
                   outputClass:[AWSServicediscoveryCreatePrivateDnsNamespaceResponse class]];
}

- (void)createPrivateDnsNamespace:(AWSServicediscoveryCreatePrivateDnsNamespaceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryCreatePrivateDnsNamespaceResponse *response, NSError *error))completionHandler {
    [[self createPrivateDnsNamespace:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryCreatePrivateDnsNamespaceResponse *> * _Nonnull task) {
        AWSServicediscoveryCreatePrivateDnsNamespaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryCreatePublicDnsNamespaceResponse *> *)createPublicDnsNamespace:(AWSServicediscoveryCreatePublicDnsNamespaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"CreatePublicDnsNamespace"
                   outputClass:[AWSServicediscoveryCreatePublicDnsNamespaceResponse class]];
}

- (void)createPublicDnsNamespace:(AWSServicediscoveryCreatePublicDnsNamespaceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryCreatePublicDnsNamespaceResponse *response, NSError *error))completionHandler {
    [[self createPublicDnsNamespace:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryCreatePublicDnsNamespaceResponse *> * _Nonnull task) {
        AWSServicediscoveryCreatePublicDnsNamespaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryCreateServiceResponse *> *)createService:(AWSServicediscoveryCreateServiceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"CreateService"
                   outputClass:[AWSServicediscoveryCreateServiceResponse class]];
}

- (void)createService:(AWSServicediscoveryCreateServiceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryCreateServiceResponse *response, NSError *error))completionHandler {
    [[self createService:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryCreateServiceResponse *> * _Nonnull task) {
        AWSServicediscoveryCreateServiceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryDeleteNamespaceResponse *> *)deleteNamespace:(AWSServicediscoveryDeleteNamespaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"DeleteNamespace"
                   outputClass:[AWSServicediscoveryDeleteNamespaceResponse class]];
}

- (void)deleteNamespace:(AWSServicediscoveryDeleteNamespaceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryDeleteNamespaceResponse *response, NSError *error))completionHandler {
    [[self deleteNamespace:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryDeleteNamespaceResponse *> * _Nonnull task) {
        AWSServicediscoveryDeleteNamespaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryDeleteServiceResponse *> *)deleteService:(AWSServicediscoveryDeleteServiceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"DeleteService"
                   outputClass:[AWSServicediscoveryDeleteServiceResponse class]];
}

- (void)deleteService:(AWSServicediscoveryDeleteServiceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryDeleteServiceResponse *response, NSError *error))completionHandler {
    [[self deleteService:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryDeleteServiceResponse *> * _Nonnull task) {
        AWSServicediscoveryDeleteServiceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryDeregisterInstanceResponse *> *)deregisterInstance:(AWSServicediscoveryDeregisterInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"DeregisterInstance"
                   outputClass:[AWSServicediscoveryDeregisterInstanceResponse class]];
}

- (void)deregisterInstance:(AWSServicediscoveryDeregisterInstanceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryDeregisterInstanceResponse *response, NSError *error))completionHandler {
    [[self deregisterInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryDeregisterInstanceResponse *> * _Nonnull task) {
        AWSServicediscoveryDeregisterInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryDiscoverInstancesResponse *> *)discoverInstances:(AWSServicediscoveryDiscoverInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"DiscoverInstances"
                   outputClass:[AWSServicediscoveryDiscoverInstancesResponse class]];
}

- (void)discoverInstances:(AWSServicediscoveryDiscoverInstancesRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryDiscoverInstancesResponse *response, NSError *error))completionHandler {
    [[self discoverInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryDiscoverInstancesResponse *> * _Nonnull task) {
        AWSServicediscoveryDiscoverInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryGetInstanceResponse *> *)getInstance:(AWSServicediscoveryGetInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"GetInstance"
                   outputClass:[AWSServicediscoveryGetInstanceResponse class]];
}

- (void)getInstance:(AWSServicediscoveryGetInstanceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryGetInstanceResponse *response, NSError *error))completionHandler {
    [[self getInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryGetInstanceResponse *> * _Nonnull task) {
        AWSServicediscoveryGetInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryGetInstancesHealthStatusResponse *> *)getInstancesHealthStatus:(AWSServicediscoveryGetInstancesHealthStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"GetInstancesHealthStatus"
                   outputClass:[AWSServicediscoveryGetInstancesHealthStatusResponse class]];
}

- (void)getInstancesHealthStatus:(AWSServicediscoveryGetInstancesHealthStatusRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryGetInstancesHealthStatusResponse *response, NSError *error))completionHandler {
    [[self getInstancesHealthStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryGetInstancesHealthStatusResponse *> * _Nonnull task) {
        AWSServicediscoveryGetInstancesHealthStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryGetNamespaceResponse *> *)getNamespace:(AWSServicediscoveryGetNamespaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"GetNamespace"
                   outputClass:[AWSServicediscoveryGetNamespaceResponse class]];
}

- (void)getNamespace:(AWSServicediscoveryGetNamespaceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryGetNamespaceResponse *response, NSError *error))completionHandler {
    [[self getNamespace:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryGetNamespaceResponse *> * _Nonnull task) {
        AWSServicediscoveryGetNamespaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryGetOperationResponse *> *)getOperation:(AWSServicediscoveryGetOperationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"GetOperation"
                   outputClass:[AWSServicediscoveryGetOperationResponse class]];
}

- (void)getOperation:(AWSServicediscoveryGetOperationRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryGetOperationResponse *response, NSError *error))completionHandler {
    [[self getOperation:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryGetOperationResponse *> * _Nonnull task) {
        AWSServicediscoveryGetOperationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryGetServiceResponse *> *)getService:(AWSServicediscoveryGetServiceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"GetService"
                   outputClass:[AWSServicediscoveryGetServiceResponse class]];
}

- (void)getService:(AWSServicediscoveryGetServiceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryGetServiceResponse *response, NSError *error))completionHandler {
    [[self getService:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryGetServiceResponse *> * _Nonnull task) {
        AWSServicediscoveryGetServiceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryListInstancesResponse *> *)listInstances:(AWSServicediscoveryListInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"ListInstances"
                   outputClass:[AWSServicediscoveryListInstancesResponse class]];
}

- (void)listInstances:(AWSServicediscoveryListInstancesRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryListInstancesResponse *response, NSError *error))completionHandler {
    [[self listInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryListInstancesResponse *> * _Nonnull task) {
        AWSServicediscoveryListInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryListNamespacesResponse *> *)listNamespaces:(AWSServicediscoveryListNamespacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"ListNamespaces"
                   outputClass:[AWSServicediscoveryListNamespacesResponse class]];
}

- (void)listNamespaces:(AWSServicediscoveryListNamespacesRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryListNamespacesResponse *response, NSError *error))completionHandler {
    [[self listNamespaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryListNamespacesResponse *> * _Nonnull task) {
        AWSServicediscoveryListNamespacesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryListOperationsResponse *> *)listOperations:(AWSServicediscoveryListOperationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"ListOperations"
                   outputClass:[AWSServicediscoveryListOperationsResponse class]];
}

- (void)listOperations:(AWSServicediscoveryListOperationsRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryListOperationsResponse *response, NSError *error))completionHandler {
    [[self listOperations:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryListOperationsResponse *> * _Nonnull task) {
        AWSServicediscoveryListOperationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryListServicesResponse *> *)listServices:(AWSServicediscoveryListServicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"ListServices"
                   outputClass:[AWSServicediscoveryListServicesResponse class]];
}

- (void)listServices:(AWSServicediscoveryListServicesRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryListServicesResponse *response, NSError *error))completionHandler {
    [[self listServices:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryListServicesResponse *> * _Nonnull task) {
        AWSServicediscoveryListServicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryListTagsForResourceResponse *> *)listTagsForResource:(AWSServicediscoveryListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSServicediscoveryListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSServicediscoveryListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryListTagsForResourceResponse *> * _Nonnull task) {
        AWSServicediscoveryListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryRegisterInstanceResponse *> *)registerInstance:(AWSServicediscoveryRegisterInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"RegisterInstance"
                   outputClass:[AWSServicediscoveryRegisterInstanceResponse class]];
}

- (void)registerInstance:(AWSServicediscoveryRegisterInstanceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryRegisterInstanceResponse *response, NSError *error))completionHandler {
    [[self registerInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryRegisterInstanceResponse *> * _Nonnull task) {
        AWSServicediscoveryRegisterInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryTagResourceResponse *> *)tagResource:(AWSServicediscoveryTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"TagResource"
                   outputClass:[AWSServicediscoveryTagResourceResponse class]];
}

- (void)tagResource:(AWSServicediscoveryTagResourceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryTagResourceResponse *> * _Nonnull task) {
        AWSServicediscoveryTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryUntagResourceResponse *> *)untagResource:(AWSServicediscoveryUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"UntagResource"
                   outputClass:[AWSServicediscoveryUntagResourceResponse class]];
}

- (void)untagResource:(AWSServicediscoveryUntagResourceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryUntagResourceResponse *> * _Nonnull task) {
        AWSServicediscoveryUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateInstanceCustomHealthStatus:(AWSServicediscoveryUpdateInstanceCustomHealthStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"UpdateInstanceCustomHealthStatus"
                   outputClass:nil];
}

- (void)updateInstanceCustomHealthStatus:(AWSServicediscoveryUpdateInstanceCustomHealthStatusRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateInstanceCustomHealthStatus:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicediscoveryUpdateServiceResponse *> *)updateService:(AWSServicediscoveryUpdateServiceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53AutoNaming_v20170314"
                 operationName:@"UpdateService"
                   outputClass:[AWSServicediscoveryUpdateServiceResponse class]];
}

- (void)updateService:(AWSServicediscoveryUpdateServiceRequest *)request
     completionHandler:(void (^)(AWSServicediscoveryUpdateServiceResponse *response, NSError *error))completionHandler {
    [[self updateService:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicediscoveryUpdateServiceResponse *> * _Nonnull task) {
        AWSServicediscoveryUpdateServiceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
