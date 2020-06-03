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

#import "AWSDirectconnectService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSDirectconnectResources.h"

static NSString *const AWSInfoDirectconnect = @"Directconnect";
NSString *const AWSDirectconnectSDKVersion = @"2.13.4";


@interface AWSDirectconnectResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSDirectconnectResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"DirectConnectClientException" : @(AWSDirectconnectErrorDirectConnectClient),
                            @"DirectConnectServerException" : @(AWSDirectconnectErrorDirectConnectServer),
                            @"DuplicateTagKeysException" : @(AWSDirectconnectErrorDuplicateTagKeys),
                            @"TooManyTagsException" : @(AWSDirectconnectErrorTooManyTags),
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
	                *error = [NSError errorWithDomain:AWSDirectconnectErrorDomain
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
        *error = [NSError errorWithDomain:AWSDirectconnectErrorDomain
                                     code:AWSDirectconnectErrorUnknown
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

@interface AWSDirectconnectRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSDirectconnectRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSDirectconnect()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSDirectconnect

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSDirectconnectSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSDirectconnect versions need to match. Check your SDK installation. AWSCore: %@ AWSDirectconnect: %@", AWSiOSSDKVersion, AWSDirectconnectSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultDirectconnect {
    static AWSDirectconnect *_defaultDirectconnect = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoDirectconnect];
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
        _defaultDirectconnect = [[AWSDirectconnect alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultDirectconnect;
}

+ (void)registerDirectconnectWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSDirectconnect alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)DirectconnectForKey:(NSString *)key {
    @synchronized(self) {
        AWSDirectconnect *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoDirectconnect
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSDirectconnect registerDirectconnectWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeDirectconnectForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultDirectconnect` or `+ DirectconnectForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceDirectconnect
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceDirectconnect];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSDirectconnectRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSDirectconnectResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSDirectconnectResponseSerializer alloc] initWithJSONDefinition:[[AWSDirectconnectResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult *> *)acceptDirectConnectGatewayAssociationProposal:(AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"AcceptDirectConnectGatewayAssociationProposal"
                   outputClass:[AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult class]];
}

- (void)acceptDirectConnectGatewayAssociationProposal:(AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalRequest *)request
     completionHandler:(void (^)(AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult *response, NSError *error))completionHandler {
    [[self acceptDirectConnectGatewayAssociationProposal:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult *> * _Nonnull task) {
        AWSDirectconnectAcceptDirectConnectGatewayAssociationProposalResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConnection *> *)allocateConnectionOnInterconnect:(AWSDirectconnectAllocateConnectionOnInterconnectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"AllocateConnectionOnInterconnect"
                   outputClass:[AWSDirectconnectConnection class]];
}

- (void)allocateConnectionOnInterconnect:(AWSDirectconnectAllocateConnectionOnInterconnectRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConnection *response, NSError *error))completionHandler {
    [[self allocateConnectionOnInterconnect:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConnection *> * _Nonnull task) {
        AWSDirectconnectConnection *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConnection *> *)allocateHostedConnection:(AWSDirectconnectAllocateHostedConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"AllocateHostedConnection"
                   outputClass:[AWSDirectconnectConnection class]];
}

- (void)allocateHostedConnection:(AWSDirectconnectAllocateHostedConnectionRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConnection *response, NSError *error))completionHandler {
    [[self allocateHostedConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConnection *> * _Nonnull task) {
        AWSDirectconnectConnection *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectVirtualInterface *> *)allocatePrivateVirtualInterface:(AWSDirectconnectAllocatePrivateVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"AllocatePrivateVirtualInterface"
                   outputClass:[AWSDirectconnectVirtualInterface class]];
}

- (void)allocatePrivateVirtualInterface:(AWSDirectconnectAllocatePrivateVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectVirtualInterface *response, NSError *error))completionHandler {
    [[self allocatePrivateVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectVirtualInterface *> * _Nonnull task) {
        AWSDirectconnectVirtualInterface *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectVirtualInterface *> *)allocatePublicVirtualInterface:(AWSDirectconnectAllocatePublicVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"AllocatePublicVirtualInterface"
                   outputClass:[AWSDirectconnectVirtualInterface class]];
}

- (void)allocatePublicVirtualInterface:(AWSDirectconnectAllocatePublicVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectVirtualInterface *response, NSError *error))completionHandler {
    [[self allocatePublicVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectVirtualInterface *> * _Nonnull task) {
        AWSDirectconnectVirtualInterface *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectAllocateTransitVirtualInterfaceResult *> *)allocateTransitVirtualInterface:(AWSDirectconnectAllocateTransitVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"AllocateTransitVirtualInterface"
                   outputClass:[AWSDirectconnectAllocateTransitVirtualInterfaceResult class]];
}

- (void)allocateTransitVirtualInterface:(AWSDirectconnectAllocateTransitVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectAllocateTransitVirtualInterfaceResult *response, NSError *error))completionHandler {
    [[self allocateTransitVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectAllocateTransitVirtualInterfaceResult *> * _Nonnull task) {
        AWSDirectconnectAllocateTransitVirtualInterfaceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConnection *> *)associateConnectionWithLag:(AWSDirectconnectAssociateConnectionWithLagRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"AssociateConnectionWithLag"
                   outputClass:[AWSDirectconnectConnection class]];
}

- (void)associateConnectionWithLag:(AWSDirectconnectAssociateConnectionWithLagRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConnection *response, NSError *error))completionHandler {
    [[self associateConnectionWithLag:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConnection *> * _Nonnull task) {
        AWSDirectconnectConnection *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConnection *> *)associateHostedConnection:(AWSDirectconnectAssociateHostedConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"AssociateHostedConnection"
                   outputClass:[AWSDirectconnectConnection class]];
}

- (void)associateHostedConnection:(AWSDirectconnectAssociateHostedConnectionRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConnection *response, NSError *error))completionHandler {
    [[self associateHostedConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConnection *> * _Nonnull task) {
        AWSDirectconnectConnection *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectVirtualInterface *> *)associateVirtualInterface:(AWSDirectconnectAssociateVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"AssociateVirtualInterface"
                   outputClass:[AWSDirectconnectVirtualInterface class]];
}

- (void)associateVirtualInterface:(AWSDirectconnectAssociateVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectVirtualInterface *response, NSError *error))completionHandler {
    [[self associateVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectVirtualInterface *> * _Nonnull task) {
        AWSDirectconnectVirtualInterface *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConfirmConnectionResponse *> *)confirmConnection:(AWSDirectconnectConfirmConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"ConfirmConnection"
                   outputClass:[AWSDirectconnectConfirmConnectionResponse class]];
}

- (void)confirmConnection:(AWSDirectconnectConfirmConnectionRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConfirmConnectionResponse *response, NSError *error))completionHandler {
    [[self confirmConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConfirmConnectionResponse *> * _Nonnull task) {
        AWSDirectconnectConfirmConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConfirmPrivateVirtualInterfaceResponse *> *)confirmPrivateVirtualInterface:(AWSDirectconnectConfirmPrivateVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"ConfirmPrivateVirtualInterface"
                   outputClass:[AWSDirectconnectConfirmPrivateVirtualInterfaceResponse class]];
}

- (void)confirmPrivateVirtualInterface:(AWSDirectconnectConfirmPrivateVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConfirmPrivateVirtualInterfaceResponse *response, NSError *error))completionHandler {
    [[self confirmPrivateVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConfirmPrivateVirtualInterfaceResponse *> * _Nonnull task) {
        AWSDirectconnectConfirmPrivateVirtualInterfaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConfirmPublicVirtualInterfaceResponse *> *)confirmPublicVirtualInterface:(AWSDirectconnectConfirmPublicVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"ConfirmPublicVirtualInterface"
                   outputClass:[AWSDirectconnectConfirmPublicVirtualInterfaceResponse class]];
}

- (void)confirmPublicVirtualInterface:(AWSDirectconnectConfirmPublicVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConfirmPublicVirtualInterfaceResponse *response, NSError *error))completionHandler {
    [[self confirmPublicVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConfirmPublicVirtualInterfaceResponse *> * _Nonnull task) {
        AWSDirectconnectConfirmPublicVirtualInterfaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConfirmTransitVirtualInterfaceResponse *> *)confirmTransitVirtualInterface:(AWSDirectconnectConfirmTransitVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"ConfirmTransitVirtualInterface"
                   outputClass:[AWSDirectconnectConfirmTransitVirtualInterfaceResponse class]];
}

- (void)confirmTransitVirtualInterface:(AWSDirectconnectConfirmTransitVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConfirmTransitVirtualInterfaceResponse *response, NSError *error))completionHandler {
    [[self confirmTransitVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConfirmTransitVirtualInterfaceResponse *> * _Nonnull task) {
        AWSDirectconnectConfirmTransitVirtualInterfaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectCreateBGPPeerResponse *> *)createBGPPeer:(AWSDirectconnectCreateBGPPeerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"CreateBGPPeer"
                   outputClass:[AWSDirectconnectCreateBGPPeerResponse class]];
}

- (void)createBGPPeer:(AWSDirectconnectCreateBGPPeerRequest *)request
     completionHandler:(void (^)(AWSDirectconnectCreateBGPPeerResponse *response, NSError *error))completionHandler {
    [[self createBGPPeer:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectCreateBGPPeerResponse *> * _Nonnull task) {
        AWSDirectconnectCreateBGPPeerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConnection *> *)createConnection:(AWSDirectconnectCreateConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"CreateConnection"
                   outputClass:[AWSDirectconnectConnection class]];
}

- (void)createConnection:(AWSDirectconnectCreateConnectionRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConnection *response, NSError *error))completionHandler {
    [[self createConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConnection *> * _Nonnull task) {
        AWSDirectconnectConnection *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectCreateDirectConnectGatewayResult *> *)createDirectConnectGateway:(AWSDirectconnectCreateDirectConnectGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"CreateDirectConnectGateway"
                   outputClass:[AWSDirectconnectCreateDirectConnectGatewayResult class]];
}

- (void)createDirectConnectGateway:(AWSDirectconnectCreateDirectConnectGatewayRequest *)request
     completionHandler:(void (^)(AWSDirectconnectCreateDirectConnectGatewayResult *response, NSError *error))completionHandler {
    [[self createDirectConnectGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectCreateDirectConnectGatewayResult *> * _Nonnull task) {
        AWSDirectconnectCreateDirectConnectGatewayResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectCreateDirectConnectGatewayAssociationResult *> *)createDirectConnectGatewayAssociation:(AWSDirectconnectCreateDirectConnectGatewayAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"CreateDirectConnectGatewayAssociation"
                   outputClass:[AWSDirectconnectCreateDirectConnectGatewayAssociationResult class]];
}

- (void)createDirectConnectGatewayAssociation:(AWSDirectconnectCreateDirectConnectGatewayAssociationRequest *)request
     completionHandler:(void (^)(AWSDirectconnectCreateDirectConnectGatewayAssociationResult *response, NSError *error))completionHandler {
    [[self createDirectConnectGatewayAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectCreateDirectConnectGatewayAssociationResult *> * _Nonnull task) {
        AWSDirectconnectCreateDirectConnectGatewayAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult *> *)createDirectConnectGatewayAssociationProposal:(AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"CreateDirectConnectGatewayAssociationProposal"
                   outputClass:[AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult class]];
}

- (void)createDirectConnectGatewayAssociationProposal:(AWSDirectconnectCreateDirectConnectGatewayAssociationProposalRequest *)request
     completionHandler:(void (^)(AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult *response, NSError *error))completionHandler {
    [[self createDirectConnectGatewayAssociationProposal:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult *> * _Nonnull task) {
        AWSDirectconnectCreateDirectConnectGatewayAssociationProposalResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectInterconnect *> *)createInterconnect:(AWSDirectconnectCreateInterconnectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"CreateInterconnect"
                   outputClass:[AWSDirectconnectInterconnect class]];
}

- (void)createInterconnect:(AWSDirectconnectCreateInterconnectRequest *)request
     completionHandler:(void (^)(AWSDirectconnectInterconnect *response, NSError *error))completionHandler {
    [[self createInterconnect:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectInterconnect *> * _Nonnull task) {
        AWSDirectconnectInterconnect *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectLag *> *)createLag:(AWSDirectconnectCreateLagRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"CreateLag"
                   outputClass:[AWSDirectconnectLag class]];
}

- (void)createLag:(AWSDirectconnectCreateLagRequest *)request
     completionHandler:(void (^)(AWSDirectconnectLag *response, NSError *error))completionHandler {
    [[self createLag:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectLag *> * _Nonnull task) {
        AWSDirectconnectLag *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectVirtualInterface *> *)createPrivateVirtualInterface:(AWSDirectconnectCreatePrivateVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"CreatePrivateVirtualInterface"
                   outputClass:[AWSDirectconnectVirtualInterface class]];
}

- (void)createPrivateVirtualInterface:(AWSDirectconnectCreatePrivateVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectVirtualInterface *response, NSError *error))completionHandler {
    [[self createPrivateVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectVirtualInterface *> * _Nonnull task) {
        AWSDirectconnectVirtualInterface *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectVirtualInterface *> *)createPublicVirtualInterface:(AWSDirectconnectCreatePublicVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"CreatePublicVirtualInterface"
                   outputClass:[AWSDirectconnectVirtualInterface class]];
}

- (void)createPublicVirtualInterface:(AWSDirectconnectCreatePublicVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectVirtualInterface *response, NSError *error))completionHandler {
    [[self createPublicVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectVirtualInterface *> * _Nonnull task) {
        AWSDirectconnectVirtualInterface *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectCreateTransitVirtualInterfaceResult *> *)createTransitVirtualInterface:(AWSDirectconnectCreateTransitVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"CreateTransitVirtualInterface"
                   outputClass:[AWSDirectconnectCreateTransitVirtualInterfaceResult class]];
}

- (void)createTransitVirtualInterface:(AWSDirectconnectCreateTransitVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectCreateTransitVirtualInterfaceResult *response, NSError *error))completionHandler {
    [[self createTransitVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectCreateTransitVirtualInterfaceResult *> * _Nonnull task) {
        AWSDirectconnectCreateTransitVirtualInterfaceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDeleteBGPPeerResponse *> *)deleteBGPPeer:(AWSDirectconnectDeleteBGPPeerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DeleteBGPPeer"
                   outputClass:[AWSDirectconnectDeleteBGPPeerResponse class]];
}

- (void)deleteBGPPeer:(AWSDirectconnectDeleteBGPPeerRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDeleteBGPPeerResponse *response, NSError *error))completionHandler {
    [[self deleteBGPPeer:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDeleteBGPPeerResponse *> * _Nonnull task) {
        AWSDirectconnectDeleteBGPPeerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConnection *> *)deleteConnection:(AWSDirectconnectDeleteConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DeleteConnection"
                   outputClass:[AWSDirectconnectConnection class]];
}

- (void)deleteConnection:(AWSDirectconnectDeleteConnectionRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConnection *response, NSError *error))completionHandler {
    [[self deleteConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConnection *> * _Nonnull task) {
        AWSDirectconnectConnection *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDeleteDirectConnectGatewayResult *> *)deleteDirectConnectGateway:(AWSDirectconnectDeleteDirectConnectGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DeleteDirectConnectGateway"
                   outputClass:[AWSDirectconnectDeleteDirectConnectGatewayResult class]];
}

- (void)deleteDirectConnectGateway:(AWSDirectconnectDeleteDirectConnectGatewayRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDeleteDirectConnectGatewayResult *response, NSError *error))completionHandler {
    [[self deleteDirectConnectGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDeleteDirectConnectGatewayResult *> * _Nonnull task) {
        AWSDirectconnectDeleteDirectConnectGatewayResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDeleteDirectConnectGatewayAssociationResult *> *)deleteDirectConnectGatewayAssociation:(AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DeleteDirectConnectGatewayAssociation"
                   outputClass:[AWSDirectconnectDeleteDirectConnectGatewayAssociationResult class]];
}

- (void)deleteDirectConnectGatewayAssociation:(AWSDirectconnectDeleteDirectConnectGatewayAssociationRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDeleteDirectConnectGatewayAssociationResult *response, NSError *error))completionHandler {
    [[self deleteDirectConnectGatewayAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDeleteDirectConnectGatewayAssociationResult *> * _Nonnull task) {
        AWSDirectconnectDeleteDirectConnectGatewayAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult *> *)deleteDirectConnectGatewayAssociationProposal:(AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DeleteDirectConnectGatewayAssociationProposal"
                   outputClass:[AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult class]];
}

- (void)deleteDirectConnectGatewayAssociationProposal:(AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult *response, NSError *error))completionHandler {
    [[self deleteDirectConnectGatewayAssociationProposal:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult *> * _Nonnull task) {
        AWSDirectconnectDeleteDirectConnectGatewayAssociationProposalResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDeleteInterconnectResponse *> *)deleteInterconnect:(AWSDirectconnectDeleteInterconnectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DeleteInterconnect"
                   outputClass:[AWSDirectconnectDeleteInterconnectResponse class]];
}

- (void)deleteInterconnect:(AWSDirectconnectDeleteInterconnectRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDeleteInterconnectResponse *response, NSError *error))completionHandler {
    [[self deleteInterconnect:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDeleteInterconnectResponse *> * _Nonnull task) {
        AWSDirectconnectDeleteInterconnectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectLag *> *)deleteLag:(AWSDirectconnectDeleteLagRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DeleteLag"
                   outputClass:[AWSDirectconnectLag class]];
}

- (void)deleteLag:(AWSDirectconnectDeleteLagRequest *)request
     completionHandler:(void (^)(AWSDirectconnectLag *response, NSError *error))completionHandler {
    [[self deleteLag:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectLag *> * _Nonnull task) {
        AWSDirectconnectLag *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDeleteVirtualInterfaceResponse *> *)deleteVirtualInterface:(AWSDirectconnectDeleteVirtualInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DeleteVirtualInterface"
                   outputClass:[AWSDirectconnectDeleteVirtualInterfaceResponse class]];
}

- (void)deleteVirtualInterface:(AWSDirectconnectDeleteVirtualInterfaceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDeleteVirtualInterfaceResponse *response, NSError *error))completionHandler {
    [[self deleteVirtualInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDeleteVirtualInterfaceResponse *> * _Nonnull task) {
        AWSDirectconnectDeleteVirtualInterfaceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDescribeConnectionLoaResponse *> *)describeConnectionLoa:(AWSDirectconnectDescribeConnectionLoaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeConnectionLoa"
                   outputClass:[AWSDirectconnectDescribeConnectionLoaResponse class]];
}

- (void)describeConnectionLoa:(AWSDirectconnectDescribeConnectionLoaRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDescribeConnectionLoaResponse *response, NSError *error))completionHandler {
    [[self describeConnectionLoa:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDescribeConnectionLoaResponse *> * _Nonnull task) {
        AWSDirectconnectDescribeConnectionLoaResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConnections *> *)describeConnections:(AWSDirectconnectDescribeConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeConnections"
                   outputClass:[AWSDirectconnectConnections class]];
}

- (void)describeConnections:(AWSDirectconnectDescribeConnectionsRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConnections *response, NSError *error))completionHandler {
    [[self describeConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConnections *> * _Nonnull task) {
        AWSDirectconnectConnections *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConnections *> *)describeConnectionsOnInterconnect:(AWSDirectconnectDescribeConnectionsOnInterconnectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeConnectionsOnInterconnect"
                   outputClass:[AWSDirectconnectConnections class]];
}

- (void)describeConnectionsOnInterconnect:(AWSDirectconnectDescribeConnectionsOnInterconnectRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConnections *response, NSError *error))completionHandler {
    [[self describeConnectionsOnInterconnect:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConnections *> * _Nonnull task) {
        AWSDirectconnectConnections *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult *> *)describeDirectConnectGatewayAssociationProposals:(AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeDirectConnectGatewayAssociationProposals"
                   outputClass:[AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult class]];
}

- (void)describeDirectConnectGatewayAssociationProposals:(AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult *response, NSError *error))completionHandler {
    [[self describeDirectConnectGatewayAssociationProposals:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult *> * _Nonnull task) {
        AWSDirectconnectDescribeDirectConnectGatewayAssociationProposalsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult *> *)describeDirectConnectGatewayAssociations:(AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeDirectConnectGatewayAssociations"
                   outputClass:[AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult class]];
}

- (void)describeDirectConnectGatewayAssociations:(AWSDirectconnectDescribeDirectConnectGatewayAssociationsRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult *response, NSError *error))completionHandler {
    [[self describeDirectConnectGatewayAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult *> * _Nonnull task) {
        AWSDirectconnectDescribeDirectConnectGatewayAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult *> *)describeDirectConnectGatewayAttachments:(AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeDirectConnectGatewayAttachments"
                   outputClass:[AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult class]];
}

- (void)describeDirectConnectGatewayAttachments:(AWSDirectconnectDescribeDirectConnectGatewayAttachmentsRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult *response, NSError *error))completionHandler {
    [[self describeDirectConnectGatewayAttachments:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult *> * _Nonnull task) {
        AWSDirectconnectDescribeDirectConnectGatewayAttachmentsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDescribeDirectConnectGatewaysResult *> *)describeDirectConnectGateways:(AWSDirectconnectDescribeDirectConnectGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeDirectConnectGateways"
                   outputClass:[AWSDirectconnectDescribeDirectConnectGatewaysResult class]];
}

- (void)describeDirectConnectGateways:(AWSDirectconnectDescribeDirectConnectGatewaysRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDescribeDirectConnectGatewaysResult *response, NSError *error))completionHandler {
    [[self describeDirectConnectGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDescribeDirectConnectGatewaysResult *> * _Nonnull task) {
        AWSDirectconnectDescribeDirectConnectGatewaysResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConnections *> *)describeHostedConnections:(AWSDirectconnectDescribeHostedConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeHostedConnections"
                   outputClass:[AWSDirectconnectConnections class]];
}

- (void)describeHostedConnections:(AWSDirectconnectDescribeHostedConnectionsRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConnections *response, NSError *error))completionHandler {
    [[self describeHostedConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConnections *> * _Nonnull task) {
        AWSDirectconnectConnections *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDescribeInterconnectLoaResponse *> *)describeInterconnectLoa:(AWSDirectconnectDescribeInterconnectLoaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeInterconnectLoa"
                   outputClass:[AWSDirectconnectDescribeInterconnectLoaResponse class]];
}

- (void)describeInterconnectLoa:(AWSDirectconnectDescribeInterconnectLoaRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDescribeInterconnectLoaResponse *response, NSError *error))completionHandler {
    [[self describeInterconnectLoa:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDescribeInterconnectLoaResponse *> * _Nonnull task) {
        AWSDirectconnectDescribeInterconnectLoaResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectInterconnects *> *)describeInterconnects:(AWSDirectconnectDescribeInterconnectsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeInterconnects"
                   outputClass:[AWSDirectconnectInterconnects class]];
}

- (void)describeInterconnects:(AWSDirectconnectDescribeInterconnectsRequest *)request
     completionHandler:(void (^)(AWSDirectconnectInterconnects *response, NSError *error))completionHandler {
    [[self describeInterconnects:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectInterconnects *> * _Nonnull task) {
        AWSDirectconnectInterconnects *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectLags *> *)describeLags:(AWSDirectconnectDescribeLagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeLags"
                   outputClass:[AWSDirectconnectLags class]];
}

- (void)describeLags:(AWSDirectconnectDescribeLagsRequest *)request
     completionHandler:(void (^)(AWSDirectconnectLags *response, NSError *error))completionHandler {
    [[self describeLags:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectLags *> * _Nonnull task) {
        AWSDirectconnectLags *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectLoa *> *)describeLoa:(AWSDirectconnectDescribeLoaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeLoa"
                   outputClass:[AWSDirectconnectLoa class]];
}

- (void)describeLoa:(AWSDirectconnectDescribeLoaRequest *)request
     completionHandler:(void (^)(AWSDirectconnectLoa *response, NSError *error))completionHandler {
    [[self describeLoa:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectLoa *> * _Nonnull task) {
        AWSDirectconnectLoa *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectLocations *> *)describeLocations:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeLocations"
                   outputClass:[AWSDirectconnectLocations class]];
}

- (void)describeLocations:(AWSRequest *)request
     completionHandler:(void (^)(AWSDirectconnectLocations *response, NSError *error))completionHandler {
    [[self describeLocations:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectLocations *> * _Nonnull task) {
        AWSDirectconnectLocations *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectDescribeTagsResponse *> *)describeTags:(AWSDirectconnectDescribeTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeTags"
                   outputClass:[AWSDirectconnectDescribeTagsResponse class]];
}

- (void)describeTags:(AWSDirectconnectDescribeTagsRequest *)request
     completionHandler:(void (^)(AWSDirectconnectDescribeTagsResponse *response, NSError *error))completionHandler {
    [[self describeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectDescribeTagsResponse *> * _Nonnull task) {
        AWSDirectconnectDescribeTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectVirtualGateways *> *)describeVirtualGateways:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeVirtualGateways"
                   outputClass:[AWSDirectconnectVirtualGateways class]];
}

- (void)describeVirtualGateways:(AWSRequest *)request
     completionHandler:(void (^)(AWSDirectconnectVirtualGateways *response, NSError *error))completionHandler {
    [[self describeVirtualGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectVirtualGateways *> * _Nonnull task) {
        AWSDirectconnectVirtualGateways *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectVirtualInterfaces *> *)describeVirtualInterfaces:(AWSDirectconnectDescribeVirtualInterfacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DescribeVirtualInterfaces"
                   outputClass:[AWSDirectconnectVirtualInterfaces class]];
}

- (void)describeVirtualInterfaces:(AWSDirectconnectDescribeVirtualInterfacesRequest *)request
     completionHandler:(void (^)(AWSDirectconnectVirtualInterfaces *response, NSError *error))completionHandler {
    [[self describeVirtualInterfaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectVirtualInterfaces *> * _Nonnull task) {
        AWSDirectconnectVirtualInterfaces *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectConnection *> *)disassociateConnectionFromLag:(AWSDirectconnectDisassociateConnectionFromLagRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"DisassociateConnectionFromLag"
                   outputClass:[AWSDirectconnectConnection class]];
}

- (void)disassociateConnectionFromLag:(AWSDirectconnectDisassociateConnectionFromLagRequest *)request
     completionHandler:(void (^)(AWSDirectconnectConnection *response, NSError *error))completionHandler {
    [[self disassociateConnectionFromLag:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectConnection *> * _Nonnull task) {
        AWSDirectconnectConnection *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectListVirtualInterfaceTestHistoryResponse *> *)listVirtualInterfaceTestHistory:(AWSDirectconnectListVirtualInterfaceTestHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"ListVirtualInterfaceTestHistory"
                   outputClass:[AWSDirectconnectListVirtualInterfaceTestHistoryResponse class]];
}

- (void)listVirtualInterfaceTestHistory:(AWSDirectconnectListVirtualInterfaceTestHistoryRequest *)request
     completionHandler:(void (^)(AWSDirectconnectListVirtualInterfaceTestHistoryResponse *response, NSError *error))completionHandler {
    [[self listVirtualInterfaceTestHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectListVirtualInterfaceTestHistoryResponse *> * _Nonnull task) {
        AWSDirectconnectListVirtualInterfaceTestHistoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectStartBgpFailoverTestResponse *> *)startBgpFailoverTest:(AWSDirectconnectStartBgpFailoverTestRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"StartBgpFailoverTest"
                   outputClass:[AWSDirectconnectStartBgpFailoverTestResponse class]];
}

- (void)startBgpFailoverTest:(AWSDirectconnectStartBgpFailoverTestRequest *)request
     completionHandler:(void (^)(AWSDirectconnectStartBgpFailoverTestResponse *response, NSError *error))completionHandler {
    [[self startBgpFailoverTest:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectStartBgpFailoverTestResponse *> * _Nonnull task) {
        AWSDirectconnectStartBgpFailoverTestResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectStopBgpFailoverTestResponse *> *)stopBgpFailoverTest:(AWSDirectconnectStopBgpFailoverTestRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"StopBgpFailoverTest"
                   outputClass:[AWSDirectconnectStopBgpFailoverTestResponse class]];
}

- (void)stopBgpFailoverTest:(AWSDirectconnectStopBgpFailoverTestRequest *)request
     completionHandler:(void (^)(AWSDirectconnectStopBgpFailoverTestResponse *response, NSError *error))completionHandler {
    [[self stopBgpFailoverTest:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectStopBgpFailoverTestResponse *> * _Nonnull task) {
        AWSDirectconnectStopBgpFailoverTestResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectTagResourceResponse *> *)tagResource:(AWSDirectconnectTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"TagResource"
                   outputClass:[AWSDirectconnectTagResourceResponse class]];
}

- (void)tagResource:(AWSDirectconnectTagResourceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectTagResourceResponse *> * _Nonnull task) {
        AWSDirectconnectTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectUntagResourceResponse *> *)untagResource:(AWSDirectconnectUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"UntagResource"
                   outputClass:[AWSDirectconnectUntagResourceResponse class]];
}

- (void)untagResource:(AWSDirectconnectUntagResourceRequest *)request
     completionHandler:(void (^)(AWSDirectconnectUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectUntagResourceResponse *> * _Nonnull task) {
        AWSDirectconnectUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectUpdateDirectConnectGatewayAssociationResult *> *)updateDirectConnectGatewayAssociation:(AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"UpdateDirectConnectGatewayAssociation"
                   outputClass:[AWSDirectconnectUpdateDirectConnectGatewayAssociationResult class]];
}

- (void)updateDirectConnectGatewayAssociation:(AWSDirectconnectUpdateDirectConnectGatewayAssociationRequest *)request
     completionHandler:(void (^)(AWSDirectconnectUpdateDirectConnectGatewayAssociationResult *response, NSError *error))completionHandler {
    [[self updateDirectConnectGatewayAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectUpdateDirectConnectGatewayAssociationResult *> * _Nonnull task) {
        AWSDirectconnectUpdateDirectConnectGatewayAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectLag *> *)updateLag:(AWSDirectconnectUpdateLagRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"UpdateLag"
                   outputClass:[AWSDirectconnectLag class]];
}

- (void)updateLag:(AWSDirectconnectUpdateLagRequest *)request
     completionHandler:(void (^)(AWSDirectconnectLag *response, NSError *error))completionHandler {
    [[self updateLag:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectLag *> * _Nonnull task) {
        AWSDirectconnectLag *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDirectconnectVirtualInterface *> *)updateVirtualInterfaceAttributes:(AWSDirectconnectUpdateVirtualInterfaceAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OvertureService"
                 operationName:@"UpdateVirtualInterfaceAttributes"
                   outputClass:[AWSDirectconnectVirtualInterface class]];
}

- (void)updateVirtualInterfaceAttributes:(AWSDirectconnectUpdateVirtualInterfaceAttributesRequest *)request
     completionHandler:(void (^)(AWSDirectconnectVirtualInterface *response, NSError *error))completionHandler {
    [[self updateVirtualInterfaceAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSDirectconnectVirtualInterface *> * _Nonnull task) {
        AWSDirectconnectVirtualInterface *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
