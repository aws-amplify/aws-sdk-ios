//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSEC2Service.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSEC2Resources.h"
#import "AWSEC2Serializer.h"

static NSString *const AWSInfoEC2 = @"EC2";
static NSString *const AWSEC2SDKVersion = @"2.4.10";


@interface AWSEC2ResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSEC2ResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
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
	                *error = [NSError errorWithDomain:AWSEC2ErrorDomain
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
        *error = [NSError errorWithDomain:AWSEC2ErrorDomain
                                     code:AWSEC2ErrorUnknown
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

@interface AWSEC2RequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSEC2RequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSEC2()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSEC2

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSEC2SDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSEC2 versions need to match. Check your SDK installation. AWSCore: %@ AWSEC2: %@", AWSiOSSDKVersion, AWSEC2SDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultEC2 {
    static AWSEC2 *_defaultEC2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoEC2];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultEC2 = [[AWSEC2 alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultEC2;
}

+ (void)registerEC2WithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSEC2 alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)EC2ForKey:(NSString *)key {
    @synchronized(self) {
        AWSEC2 *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoEC2
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSEC2 registerEC2WithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeEC2ForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultEC2` or `+ EC2ForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceEC2
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceEC2];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSEC2RequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
		networkingRequest.requestSerializer = [[AWSEC2RequestSerializer alloc] initWithJSONDefinition:[[AWSEC2Resources sharedInstance] JSONObject]
		 															     actionName:operationName];
        networkingRequest.responseSerializer = [[AWSEC2ResponseSerializer alloc] initWithJSONDefinition:[[AWSEC2Resources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSEC2AcceptVpcPeeringConnectionResult *> *)acceptVpcPeeringConnection:(AWSEC2AcceptVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AcceptVpcPeeringConnection"
                   outputClass:[AWSEC2AcceptVpcPeeringConnectionResult class]];
}

- (void)acceptVpcPeeringConnection:(AWSEC2AcceptVpcPeeringConnectionRequest *)request
     completionHandler:(void (^)(AWSEC2AcceptVpcPeeringConnectionResult *response, NSError *error))completionHandler {
    [[self acceptVpcPeeringConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AcceptVpcPeeringConnectionResult *> * _Nonnull task) {
        AWSEC2AcceptVpcPeeringConnectionResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AllocateAddressResult *> *)allocateAddress:(AWSEC2AllocateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AllocateAddress"
                   outputClass:[AWSEC2AllocateAddressResult class]];
}

- (void)allocateAddress:(AWSEC2AllocateAddressRequest *)request
     completionHandler:(void (^)(AWSEC2AllocateAddressResult *response, NSError *error))completionHandler {
    [[self allocateAddress:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AllocateAddressResult *> * _Nonnull task) {
        AWSEC2AllocateAddressResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AllocateHostsResult *> *)allocateHosts:(AWSEC2AllocateHostsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AllocateHosts"
                   outputClass:[AWSEC2AllocateHostsResult class]];
}

- (void)allocateHosts:(AWSEC2AllocateHostsRequest *)request
     completionHandler:(void (^)(AWSEC2AllocateHostsResult *response, NSError *error))completionHandler {
    [[self allocateHosts:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AllocateHostsResult *> * _Nonnull task) {
        AWSEC2AllocateHostsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssignPrivateIpAddresses"
                   outputClass:nil];
}

- (void)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self assignPrivateIpAddresses:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AssociateAddressResult *> *)associateAddress:(AWSEC2AssociateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateAddress"
                   outputClass:[AWSEC2AssociateAddressResult class]];
}

- (void)associateAddress:(AWSEC2AssociateAddressRequest *)request
     completionHandler:(void (^)(AWSEC2AssociateAddressResult *response, NSError *error))completionHandler {
    [[self associateAddress:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AssociateAddressResult *> * _Nonnull task) {
        AWSEC2AssociateAddressResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)associateDhcpOptions:(AWSEC2AssociateDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateDhcpOptions"
                   outputClass:nil];
}

- (void)associateDhcpOptions:(AWSEC2AssociateDhcpOptionsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateDhcpOptions:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AssociateRouteTableResult *> *)associateRouteTable:(AWSEC2AssociateRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateRouteTable"
                   outputClass:[AWSEC2AssociateRouteTableResult class]];
}

- (void)associateRouteTable:(AWSEC2AssociateRouteTableRequest *)request
     completionHandler:(void (^)(AWSEC2AssociateRouteTableResult *response, NSError *error))completionHandler {
    [[self associateRouteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AssociateRouteTableResult *> * _Nonnull task) {
        AWSEC2AssociateRouteTableResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AttachClassicLinkVpcResult *> *)attachClassicLinkVpc:(AWSEC2AttachClassicLinkVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachClassicLinkVpc"
                   outputClass:[AWSEC2AttachClassicLinkVpcResult class]];
}

- (void)attachClassicLinkVpc:(AWSEC2AttachClassicLinkVpcRequest *)request
     completionHandler:(void (^)(AWSEC2AttachClassicLinkVpcResult *response, NSError *error))completionHandler {
    [[self attachClassicLinkVpc:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AttachClassicLinkVpcResult *> * _Nonnull task) {
        AWSEC2AttachClassicLinkVpcResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)attachInternetGateway:(AWSEC2AttachInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachInternetGateway"
                   outputClass:nil];
}

- (void)attachInternetGateway:(AWSEC2AttachInternetGatewayRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self attachInternetGateway:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AttachNetworkInterfaceResult *> *)attachNetworkInterface:(AWSEC2AttachNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachNetworkInterface"
                   outputClass:[AWSEC2AttachNetworkInterfaceResult class]];
}

- (void)attachNetworkInterface:(AWSEC2AttachNetworkInterfaceRequest *)request
     completionHandler:(void (^)(AWSEC2AttachNetworkInterfaceResult *response, NSError *error))completionHandler {
    [[self attachNetworkInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AttachNetworkInterfaceResult *> * _Nonnull task) {
        AWSEC2AttachNetworkInterfaceResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2VolumeAttachment *> *)attachVolume:(AWSEC2AttachVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachVolume"
                   outputClass:[AWSEC2VolumeAttachment class]];
}

- (void)attachVolume:(AWSEC2AttachVolumeRequest *)request
     completionHandler:(void (^)(AWSEC2VolumeAttachment *response, NSError *error))completionHandler {
    [[self attachVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2VolumeAttachment *> * _Nonnull task) {
        AWSEC2VolumeAttachment *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AttachVpnGatewayResult *> *)attachVpnGateway:(AWSEC2AttachVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachVpnGateway"
                   outputClass:[AWSEC2AttachVpnGatewayResult class]];
}

- (void)attachVpnGateway:(AWSEC2AttachVpnGatewayRequest *)request
     completionHandler:(void (^)(AWSEC2AttachVpnGatewayResult *response, NSError *error))completionHandler {
    [[self attachVpnGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AttachVpnGatewayResult *> * _Nonnull task) {
        AWSEC2AttachVpnGatewayResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)authorizeSecurityGroupEgress:(AWSEC2AuthorizeSecurityGroupEgressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeSecurityGroupEgress"
                   outputClass:nil];
}

- (void)authorizeSecurityGroupEgress:(AWSEC2AuthorizeSecurityGroupEgressRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self authorizeSecurityGroupEgress:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)authorizeSecurityGroupIngress:(AWSEC2AuthorizeSecurityGroupIngressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeSecurityGroupIngress"
                   outputClass:nil];
}

- (void)authorizeSecurityGroupIngress:(AWSEC2AuthorizeSecurityGroupIngressRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self authorizeSecurityGroupIngress:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2BundleInstanceResult *> *)bundleInstance:(AWSEC2BundleInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BundleInstance"
                   outputClass:[AWSEC2BundleInstanceResult class]];
}

- (void)bundleInstance:(AWSEC2BundleInstanceRequest *)request
     completionHandler:(void (^)(AWSEC2BundleInstanceResult *response, NSError *error))completionHandler {
    [[self bundleInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2BundleInstanceResult *> * _Nonnull task) {
        AWSEC2BundleInstanceResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CancelBundleTaskResult *> *)cancelBundleTask:(AWSEC2CancelBundleTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelBundleTask"
                   outputClass:[AWSEC2CancelBundleTaskResult class]];
}

- (void)cancelBundleTask:(AWSEC2CancelBundleTaskRequest *)request
     completionHandler:(void (^)(AWSEC2CancelBundleTaskResult *response, NSError *error))completionHandler {
    [[self cancelBundleTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CancelBundleTaskResult *> * _Nonnull task) {
        AWSEC2CancelBundleTaskResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)cancelConversionTask:(AWSEC2CancelConversionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelConversionTask"
                   outputClass:nil];
}

- (void)cancelConversionTask:(AWSEC2CancelConversionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self cancelConversionTask:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)cancelExportTask:(AWSEC2CancelExportTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelExportTask"
                   outputClass:nil];
}

- (void)cancelExportTask:(AWSEC2CancelExportTaskRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self cancelExportTask:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CancelImportTaskResult *> *)cancelImportTask:(AWSEC2CancelImportTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelImportTask"
                   outputClass:[AWSEC2CancelImportTaskResult class]];
}

- (void)cancelImportTask:(AWSEC2CancelImportTaskRequest *)request
     completionHandler:(void (^)(AWSEC2CancelImportTaskResult *response, NSError *error))completionHandler {
    [[self cancelImportTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CancelImportTaskResult *> * _Nonnull task) {
        AWSEC2CancelImportTaskResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CancelReservedInstancesListingResult *> *)cancelReservedInstancesListing:(AWSEC2CancelReservedInstancesListingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelReservedInstancesListing"
                   outputClass:[AWSEC2CancelReservedInstancesListingResult class]];
}

- (void)cancelReservedInstancesListing:(AWSEC2CancelReservedInstancesListingRequest *)request
     completionHandler:(void (^)(AWSEC2CancelReservedInstancesListingResult *response, NSError *error))completionHandler {
    [[self cancelReservedInstancesListing:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CancelReservedInstancesListingResult *> * _Nonnull task) {
        AWSEC2CancelReservedInstancesListingResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CancelSpotFleetRequestsResponse *> *)cancelSpotFleetRequests:(AWSEC2CancelSpotFleetRequestsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelSpotFleetRequests"
                   outputClass:[AWSEC2CancelSpotFleetRequestsResponse class]];
}

- (void)cancelSpotFleetRequests:(AWSEC2CancelSpotFleetRequestsRequest *)request
     completionHandler:(void (^)(AWSEC2CancelSpotFleetRequestsResponse *response, NSError *error))completionHandler {
    [[self cancelSpotFleetRequests:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CancelSpotFleetRequestsResponse *> * _Nonnull task) {
        AWSEC2CancelSpotFleetRequestsResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CancelSpotInstanceRequestsResult *> *)cancelSpotInstanceRequests:(AWSEC2CancelSpotInstanceRequestsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelSpotInstanceRequests"
                   outputClass:[AWSEC2CancelSpotInstanceRequestsResult class]];
}

- (void)cancelSpotInstanceRequests:(AWSEC2CancelSpotInstanceRequestsRequest *)request
     completionHandler:(void (^)(AWSEC2CancelSpotInstanceRequestsResult *response, NSError *error))completionHandler {
    [[self cancelSpotInstanceRequests:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CancelSpotInstanceRequestsResult *> * _Nonnull task) {
        AWSEC2CancelSpotInstanceRequestsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ConfirmProductInstanceResult *> *)confirmProductInstance:(AWSEC2ConfirmProductInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ConfirmProductInstance"
                   outputClass:[AWSEC2ConfirmProductInstanceResult class]];
}

- (void)confirmProductInstance:(AWSEC2ConfirmProductInstanceRequest *)request
     completionHandler:(void (^)(AWSEC2ConfirmProductInstanceResult *response, NSError *error))completionHandler {
    [[self confirmProductInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ConfirmProductInstanceResult *> * _Nonnull task) {
        AWSEC2ConfirmProductInstanceResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ReplicateImageResult *> *)replicateImage:(AWSEC2ReplicateImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyImage"
                   outputClass:[AWSEC2ReplicateImageResult class]];
}

- (void)replicateImage:(AWSEC2ReplicateImageRequest *)request
     completionHandler:(void (^)(AWSEC2ReplicateImageResult *response, NSError *error))completionHandler {
    [[self replicateImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ReplicateImageResult *> * _Nonnull task) {
        AWSEC2ReplicateImageResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ReplicateSnapshotResult *> *)replicateSnapshot:(AWSEC2ReplicateSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopySnapshot"
                   outputClass:[AWSEC2ReplicateSnapshotResult class]];
}

- (void)replicateSnapshot:(AWSEC2ReplicateSnapshotRequest *)request
     completionHandler:(void (^)(AWSEC2ReplicateSnapshotResult *response, NSError *error))completionHandler {
    [[self replicateSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ReplicateSnapshotResult *> * _Nonnull task) {
        AWSEC2ReplicateSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateCustomerGatewayResult *> *)createCustomerGateway:(AWSEC2CreateCustomerGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCustomerGateway"
                   outputClass:[AWSEC2CreateCustomerGatewayResult class]];
}

- (void)createCustomerGateway:(AWSEC2CreateCustomerGatewayRequest *)request
     completionHandler:(void (^)(AWSEC2CreateCustomerGatewayResult *response, NSError *error))completionHandler {
    [[self createCustomerGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateCustomerGatewayResult *> * _Nonnull task) {
        AWSEC2CreateCustomerGatewayResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateDhcpOptionsResult *> *)createDhcpOptions:(AWSEC2CreateDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDhcpOptions"
                   outputClass:[AWSEC2CreateDhcpOptionsResult class]];
}

- (void)createDhcpOptions:(AWSEC2CreateDhcpOptionsRequest *)request
     completionHandler:(void (^)(AWSEC2CreateDhcpOptionsResult *response, NSError *error))completionHandler {
    [[self createDhcpOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateDhcpOptionsResult *> * _Nonnull task) {
        AWSEC2CreateDhcpOptionsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateFlowLogsResult *> *)createFlowLogs:(AWSEC2CreateFlowLogsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateFlowLogs"
                   outputClass:[AWSEC2CreateFlowLogsResult class]];
}

- (void)createFlowLogs:(AWSEC2CreateFlowLogsRequest *)request
     completionHandler:(void (^)(AWSEC2CreateFlowLogsResult *response, NSError *error))completionHandler {
    [[self createFlowLogs:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateFlowLogsResult *> * _Nonnull task) {
        AWSEC2CreateFlowLogsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateImageResult *> *)createImage:(AWSEC2CreateImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateImage"
                   outputClass:[AWSEC2CreateImageResult class]];
}

- (void)createImage:(AWSEC2CreateImageRequest *)request
     completionHandler:(void (^)(AWSEC2CreateImageResult *response, NSError *error))completionHandler {
    [[self createImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateImageResult *> * _Nonnull task) {
        AWSEC2CreateImageResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateInstanceExportTaskResult *> *)createInstanceExportTask:(AWSEC2CreateInstanceExportTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateInstanceExportTask"
                   outputClass:[AWSEC2CreateInstanceExportTaskResult class]];
}

- (void)createInstanceExportTask:(AWSEC2CreateInstanceExportTaskRequest *)request
     completionHandler:(void (^)(AWSEC2CreateInstanceExportTaskResult *response, NSError *error))completionHandler {
    [[self createInstanceExportTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateInstanceExportTaskResult *> * _Nonnull task) {
        AWSEC2CreateInstanceExportTaskResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateInternetGatewayResult *> *)createInternetGateway:(AWSEC2CreateInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateInternetGateway"
                   outputClass:[AWSEC2CreateInternetGatewayResult class]];
}

- (void)createInternetGateway:(AWSEC2CreateInternetGatewayRequest *)request
     completionHandler:(void (^)(AWSEC2CreateInternetGatewayResult *response, NSError *error))completionHandler {
    [[self createInternetGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateInternetGatewayResult *> * _Nonnull task) {
        AWSEC2CreateInternetGatewayResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2KeyPair *> *)createKeyPair:(AWSEC2CreateKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateKeyPair"
                   outputClass:[AWSEC2KeyPair class]];
}

- (void)createKeyPair:(AWSEC2CreateKeyPairRequest *)request
     completionHandler:(void (^)(AWSEC2KeyPair *response, NSError *error))completionHandler {
    [[self createKeyPair:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2KeyPair *> * _Nonnull task) {
        AWSEC2KeyPair *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateNatGatewayResult *> *)createNatGateway:(AWSEC2CreateNatGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNatGateway"
                   outputClass:[AWSEC2CreateNatGatewayResult class]];
}

- (void)createNatGateway:(AWSEC2CreateNatGatewayRequest *)request
     completionHandler:(void (^)(AWSEC2CreateNatGatewayResult *response, NSError *error))completionHandler {
    [[self createNatGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateNatGatewayResult *> * _Nonnull task) {
        AWSEC2CreateNatGatewayResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateNetworkAclResult *> *)createNetworkAcl:(AWSEC2CreateNetworkAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNetworkAcl"
                   outputClass:[AWSEC2CreateNetworkAclResult class]];
}

- (void)createNetworkAcl:(AWSEC2CreateNetworkAclRequest *)request
     completionHandler:(void (^)(AWSEC2CreateNetworkAclResult *response, NSError *error))completionHandler {
    [[self createNetworkAcl:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateNetworkAclResult *> * _Nonnull task) {
        AWSEC2CreateNetworkAclResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createNetworkAclEntry:(AWSEC2CreateNetworkAclEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNetworkAclEntry"
                   outputClass:nil];
}

- (void)createNetworkAclEntry:(AWSEC2CreateNetworkAclEntryRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createNetworkAclEntry:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateNetworkInterfaceResult *> *)createNetworkInterface:(AWSEC2CreateNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNetworkInterface"
                   outputClass:[AWSEC2CreateNetworkInterfaceResult class]];
}

- (void)createNetworkInterface:(AWSEC2CreateNetworkInterfaceRequest *)request
     completionHandler:(void (^)(AWSEC2CreateNetworkInterfaceResult *response, NSError *error))completionHandler {
    [[self createNetworkInterface:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateNetworkInterfaceResult *> * _Nonnull task) {
        AWSEC2CreateNetworkInterfaceResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createPlacementGroup:(AWSEC2CreatePlacementGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePlacementGroup"
                   outputClass:nil];
}

- (void)createPlacementGroup:(AWSEC2CreatePlacementGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createPlacementGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateReservedInstancesListingResult *> *)createReservedInstancesListing:(AWSEC2CreateReservedInstancesListingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateReservedInstancesListing"
                   outputClass:[AWSEC2CreateReservedInstancesListingResult class]];
}

- (void)createReservedInstancesListing:(AWSEC2CreateReservedInstancesListingRequest *)request
     completionHandler:(void (^)(AWSEC2CreateReservedInstancesListingResult *response, NSError *error))completionHandler {
    [[self createReservedInstancesListing:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateReservedInstancesListingResult *> * _Nonnull task) {
        AWSEC2CreateReservedInstancesListingResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateRouteResult *> *)createRoute:(AWSEC2CreateRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateRoute"
                   outputClass:[AWSEC2CreateRouteResult class]];
}

- (void)createRoute:(AWSEC2CreateRouteRequest *)request
     completionHandler:(void (^)(AWSEC2CreateRouteResult *response, NSError *error))completionHandler {
    [[self createRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateRouteResult *> * _Nonnull task) {
        AWSEC2CreateRouteResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateRouteTableResult *> *)createRouteTable:(AWSEC2CreateRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateRouteTable"
                   outputClass:[AWSEC2CreateRouteTableResult class]];
}

- (void)createRouteTable:(AWSEC2CreateRouteTableRequest *)request
     completionHandler:(void (^)(AWSEC2CreateRouteTableResult *response, NSError *error))completionHandler {
    [[self createRouteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateRouteTableResult *> * _Nonnull task) {
        AWSEC2CreateRouteTableResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateSecurityGroupResult *> *)createSecurityGroup:(AWSEC2CreateSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSecurityGroup"
                   outputClass:[AWSEC2CreateSecurityGroupResult class]];
}

- (void)createSecurityGroup:(AWSEC2CreateSecurityGroupRequest *)request
     completionHandler:(void (^)(AWSEC2CreateSecurityGroupResult *response, NSError *error))completionHandler {
    [[self createSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateSecurityGroupResult *> * _Nonnull task) {
        AWSEC2CreateSecurityGroupResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2Snapshot *> *)createSnapshot:(AWSEC2CreateSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSnapshot"
                   outputClass:[AWSEC2Snapshot class]];
}

- (void)createSnapshot:(AWSEC2CreateSnapshotRequest *)request
     completionHandler:(void (^)(AWSEC2Snapshot *response, NSError *error))completionHandler {
    [[self createSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2Snapshot *> * _Nonnull task) {
        AWSEC2Snapshot *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateSpotDatafeedSubscriptionResult *> *)createSpotDatafeedSubscription:(AWSEC2CreateSpotDatafeedSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSpotDatafeedSubscription"
                   outputClass:[AWSEC2CreateSpotDatafeedSubscriptionResult class]];
}

- (void)createSpotDatafeedSubscription:(AWSEC2CreateSpotDatafeedSubscriptionRequest *)request
     completionHandler:(void (^)(AWSEC2CreateSpotDatafeedSubscriptionResult *response, NSError *error))completionHandler {
    [[self createSpotDatafeedSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateSpotDatafeedSubscriptionResult *> * _Nonnull task) {
        AWSEC2CreateSpotDatafeedSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateSubnetResult *> *)createSubnet:(AWSEC2CreateSubnetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSubnet"
                   outputClass:[AWSEC2CreateSubnetResult class]];
}

- (void)createSubnet:(AWSEC2CreateSubnetRequest *)request
     completionHandler:(void (^)(AWSEC2CreateSubnetResult *response, NSError *error))completionHandler {
    [[self createSubnet:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateSubnetResult *> * _Nonnull task) {
        AWSEC2CreateSubnetResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createTags:(AWSEC2CreateTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTags"
                   outputClass:nil];
}

- (void)createTags:(AWSEC2CreateTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2Volume *> *)createVolume:(AWSEC2CreateVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVolume"
                   outputClass:[AWSEC2Volume class]];
}

- (void)createVolume:(AWSEC2CreateVolumeRequest *)request
     completionHandler:(void (^)(AWSEC2Volume *response, NSError *error))completionHandler {
    [[self createVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2Volume *> * _Nonnull task) {
        AWSEC2Volume *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateVpcResult *> *)createVpc:(AWSEC2CreateVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpc"
                   outputClass:[AWSEC2CreateVpcResult class]];
}

- (void)createVpc:(AWSEC2CreateVpcRequest *)request
     completionHandler:(void (^)(AWSEC2CreateVpcResult *response, NSError *error))completionHandler {
    [[self createVpc:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateVpcResult *> * _Nonnull task) {
        AWSEC2CreateVpcResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateVpcEndpointResult *> *)createVpcEndpoint:(AWSEC2CreateVpcEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpcEndpoint"
                   outputClass:[AWSEC2CreateVpcEndpointResult class]];
}

- (void)createVpcEndpoint:(AWSEC2CreateVpcEndpointRequest *)request
     completionHandler:(void (^)(AWSEC2CreateVpcEndpointResult *response, NSError *error))completionHandler {
    [[self createVpcEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateVpcEndpointResult *> * _Nonnull task) {
        AWSEC2CreateVpcEndpointResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateVpcPeeringConnectionResult *> *)createVpcPeeringConnection:(AWSEC2CreateVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpcPeeringConnection"
                   outputClass:[AWSEC2CreateVpcPeeringConnectionResult class]];
}

- (void)createVpcPeeringConnection:(AWSEC2CreateVpcPeeringConnectionRequest *)request
     completionHandler:(void (^)(AWSEC2CreateVpcPeeringConnectionResult *response, NSError *error))completionHandler {
    [[self createVpcPeeringConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateVpcPeeringConnectionResult *> * _Nonnull task) {
        AWSEC2CreateVpcPeeringConnectionResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateVpnConnectionResult *> *)createVpnConnection:(AWSEC2CreateVpnConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpnConnection"
                   outputClass:[AWSEC2CreateVpnConnectionResult class]];
}

- (void)createVpnConnection:(AWSEC2CreateVpnConnectionRequest *)request
     completionHandler:(void (^)(AWSEC2CreateVpnConnectionResult *response, NSError *error))completionHandler {
    [[self createVpnConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateVpnConnectionResult *> * _Nonnull task) {
        AWSEC2CreateVpnConnectionResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createVpnConnectionRoute:(AWSEC2CreateVpnConnectionRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpnConnectionRoute"
                   outputClass:nil];
}

- (void)createVpnConnectionRoute:(AWSEC2CreateVpnConnectionRouteRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createVpnConnectionRoute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateVpnGatewayResult *> *)createVpnGateway:(AWSEC2CreateVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpnGateway"
                   outputClass:[AWSEC2CreateVpnGatewayResult class]];
}

- (void)createVpnGateway:(AWSEC2CreateVpnGatewayRequest *)request
     completionHandler:(void (^)(AWSEC2CreateVpnGatewayResult *response, NSError *error))completionHandler {
    [[self createVpnGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateVpnGatewayResult *> * _Nonnull task) {
        AWSEC2CreateVpnGatewayResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCustomerGateway:(AWSEC2DeleteCustomerGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCustomerGateway"
                   outputClass:nil];
}

- (void)deleteCustomerGateway:(AWSEC2DeleteCustomerGatewayRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCustomerGateway:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDhcpOptions:(AWSEC2DeleteDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDhcpOptions"
                   outputClass:nil];
}

- (void)deleteDhcpOptions:(AWSEC2DeleteDhcpOptionsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDhcpOptions:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteFlowLogsResult *> *)deleteFlowLogs:(AWSEC2DeleteFlowLogsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteFlowLogs"
                   outputClass:[AWSEC2DeleteFlowLogsResult class]];
}

- (void)deleteFlowLogs:(AWSEC2DeleteFlowLogsRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteFlowLogsResult *response, NSError *error))completionHandler {
    [[self deleteFlowLogs:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteFlowLogsResult *> * _Nonnull task) {
        AWSEC2DeleteFlowLogsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteInternetGateway:(AWSEC2DeleteInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteInternetGateway"
                   outputClass:nil];
}

- (void)deleteInternetGateway:(AWSEC2DeleteInternetGatewayRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteInternetGateway:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteKeyPair:(AWSEC2DeleteKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteKeyPair"
                   outputClass:nil];
}

- (void)deleteKeyPair:(AWSEC2DeleteKeyPairRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteKeyPair:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteNatGatewayResult *> *)deleteNatGateway:(AWSEC2DeleteNatGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNatGateway"
                   outputClass:[AWSEC2DeleteNatGatewayResult class]];
}

- (void)deleteNatGateway:(AWSEC2DeleteNatGatewayRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteNatGatewayResult *response, NSError *error))completionHandler {
    [[self deleteNatGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteNatGatewayResult *> * _Nonnull task) {
        AWSEC2DeleteNatGatewayResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNetworkAcl:(AWSEC2DeleteNetworkAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNetworkAcl"
                   outputClass:nil];
}

- (void)deleteNetworkAcl:(AWSEC2DeleteNetworkAclRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNetworkAcl:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNetworkAclEntry:(AWSEC2DeleteNetworkAclEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNetworkAclEntry"
                   outputClass:nil];
}

- (void)deleteNetworkAclEntry:(AWSEC2DeleteNetworkAclEntryRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNetworkAclEntry:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNetworkInterface:(AWSEC2DeleteNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNetworkInterface"
                   outputClass:nil];
}

- (void)deleteNetworkInterface:(AWSEC2DeleteNetworkInterfaceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNetworkInterface:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePlacementGroup:(AWSEC2DeletePlacementGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePlacementGroup"
                   outputClass:nil];
}

- (void)deletePlacementGroup:(AWSEC2DeletePlacementGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePlacementGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRoute:(AWSEC2DeleteRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteRoute"
                   outputClass:nil];
}

- (void)deleteRoute:(AWSEC2DeleteRouteRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRoute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRouteTable:(AWSEC2DeleteRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteRouteTable"
                   outputClass:nil];
}

- (void)deleteRouteTable:(AWSEC2DeleteRouteTableRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRouteTable:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSecurityGroup:(AWSEC2DeleteSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSecurityGroup"
                   outputClass:nil];
}

- (void)deleteSecurityGroup:(AWSEC2DeleteSecurityGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSnapshot:(AWSEC2DeleteSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSnapshot"
                   outputClass:nil];
}

- (void)deleteSnapshot:(AWSEC2DeleteSnapshotRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSnapshot:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSpotDatafeedSubscription:(AWSEC2DeleteSpotDatafeedSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSpotDatafeedSubscription"
                   outputClass:nil];
}

- (void)deleteSpotDatafeedSubscription:(AWSEC2DeleteSpotDatafeedSubscriptionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSpotDatafeedSubscription:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSubnet:(AWSEC2DeleteSubnetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSubnet"
                   outputClass:nil];
}

- (void)deleteSubnet:(AWSEC2DeleteSubnetRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSubnet:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteTags:(AWSEC2DeleteTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTags"
                   outputClass:nil];
}

- (void)deleteTags:(AWSEC2DeleteTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVolume:(AWSEC2DeleteVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVolume"
                   outputClass:nil];
}

- (void)deleteVolume:(AWSEC2DeleteVolumeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVolume:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVpc:(AWSEC2DeleteVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpc"
                   outputClass:nil];
}

- (void)deleteVpc:(AWSEC2DeleteVpcRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVpc:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteVpcEndpointsResult *> *)deleteVpcEndpoints:(AWSEC2DeleteVpcEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpcEndpoints"
                   outputClass:[AWSEC2DeleteVpcEndpointsResult class]];
}

- (void)deleteVpcEndpoints:(AWSEC2DeleteVpcEndpointsRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteVpcEndpointsResult *response, NSError *error))completionHandler {
    [[self deleteVpcEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteVpcEndpointsResult *> * _Nonnull task) {
        AWSEC2DeleteVpcEndpointsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteVpcPeeringConnectionResult *> *)deleteVpcPeeringConnection:(AWSEC2DeleteVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpcPeeringConnection"
                   outputClass:[AWSEC2DeleteVpcPeeringConnectionResult class]];
}

- (void)deleteVpcPeeringConnection:(AWSEC2DeleteVpcPeeringConnectionRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteVpcPeeringConnectionResult *response, NSError *error))completionHandler {
    [[self deleteVpcPeeringConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteVpcPeeringConnectionResult *> * _Nonnull task) {
        AWSEC2DeleteVpcPeeringConnectionResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVpnConnection:(AWSEC2DeleteVpnConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpnConnection"
                   outputClass:nil];
}

- (void)deleteVpnConnection:(AWSEC2DeleteVpnConnectionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVpnConnection:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVpnConnectionRoute:(AWSEC2DeleteVpnConnectionRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpnConnectionRoute"
                   outputClass:nil];
}

- (void)deleteVpnConnectionRoute:(AWSEC2DeleteVpnConnectionRouteRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVpnConnectionRoute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVpnGateway:(AWSEC2DeleteVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpnGateway"
                   outputClass:nil];
}

- (void)deleteVpnGateway:(AWSEC2DeleteVpnGatewayRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVpnGateway:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deregisterImage:(AWSEC2DeregisterImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterImage"
                   outputClass:nil];
}

- (void)deregisterImage:(AWSEC2DeregisterImageRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deregisterImage:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeAccountAttributesResult *> *)describeAccountAttributes:(AWSEC2DescribeAccountAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSEC2DescribeAccountAttributesResult class]];
}

- (void)describeAccountAttributes:(AWSEC2DescribeAccountAttributesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeAccountAttributesResult *response, NSError *error))completionHandler {
    [[self describeAccountAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeAccountAttributesResult *> * _Nonnull task) {
        AWSEC2DescribeAccountAttributesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeAddressesResult *> *)describeAddresses:(AWSEC2DescribeAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAddresses"
                   outputClass:[AWSEC2DescribeAddressesResult class]];
}

- (void)describeAddresses:(AWSEC2DescribeAddressesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeAddressesResult *response, NSError *error))completionHandler {
    [[self describeAddresses:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeAddressesResult *> * _Nonnull task) {
        AWSEC2DescribeAddressesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeAvailabilityZonesResult *> *)describeAvailabilityZones:(AWSEC2DescribeAvailabilityZonesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAvailabilityZones"
                   outputClass:[AWSEC2DescribeAvailabilityZonesResult class]];
}

- (void)describeAvailabilityZones:(AWSEC2DescribeAvailabilityZonesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeAvailabilityZonesResult *response, NSError *error))completionHandler {
    [[self describeAvailabilityZones:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeAvailabilityZonesResult *> * _Nonnull task) {
        AWSEC2DescribeAvailabilityZonesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeBundleTasksResult *> *)describeBundleTasks:(AWSEC2DescribeBundleTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeBundleTasks"
                   outputClass:[AWSEC2DescribeBundleTasksResult class]];
}

- (void)describeBundleTasks:(AWSEC2DescribeBundleTasksRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeBundleTasksResult *response, NSError *error))completionHandler {
    [[self describeBundleTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeBundleTasksResult *> * _Nonnull task) {
        AWSEC2DescribeBundleTasksResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeClassicLinkInstancesResult *> *)describeClassicLinkInstances:(AWSEC2DescribeClassicLinkInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClassicLinkInstances"
                   outputClass:[AWSEC2DescribeClassicLinkInstancesResult class]];
}

- (void)describeClassicLinkInstances:(AWSEC2DescribeClassicLinkInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeClassicLinkInstancesResult *response, NSError *error))completionHandler {
    [[self describeClassicLinkInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeClassicLinkInstancesResult *> * _Nonnull task) {
        AWSEC2DescribeClassicLinkInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeConversionTasksResult *> *)describeConversionTasks:(AWSEC2DescribeConversionTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeConversionTasks"
                   outputClass:[AWSEC2DescribeConversionTasksResult class]];
}

- (void)describeConversionTasks:(AWSEC2DescribeConversionTasksRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeConversionTasksResult *response, NSError *error))completionHandler {
    [[self describeConversionTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeConversionTasksResult *> * _Nonnull task) {
        AWSEC2DescribeConversionTasksResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeCustomerGatewaysResult *> *)describeCustomerGateways:(AWSEC2DescribeCustomerGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCustomerGateways"
                   outputClass:[AWSEC2DescribeCustomerGatewaysResult class]];
}

- (void)describeCustomerGateways:(AWSEC2DescribeCustomerGatewaysRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeCustomerGatewaysResult *response, NSError *error))completionHandler {
    [[self describeCustomerGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeCustomerGatewaysResult *> * _Nonnull task) {
        AWSEC2DescribeCustomerGatewaysResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeDhcpOptionsResult *> *)describeDhcpOptions:(AWSEC2DescribeDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDhcpOptions"
                   outputClass:[AWSEC2DescribeDhcpOptionsResult class]];
}

- (void)describeDhcpOptions:(AWSEC2DescribeDhcpOptionsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeDhcpOptionsResult *response, NSError *error))completionHandler {
    [[self describeDhcpOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeDhcpOptionsResult *> * _Nonnull task) {
        AWSEC2DescribeDhcpOptionsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeExportTasksResult *> *)describeExportTasks:(AWSEC2DescribeExportTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeExportTasks"
                   outputClass:[AWSEC2DescribeExportTasksResult class]];
}

- (void)describeExportTasks:(AWSEC2DescribeExportTasksRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeExportTasksResult *response, NSError *error))completionHandler {
    [[self describeExportTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeExportTasksResult *> * _Nonnull task) {
        AWSEC2DescribeExportTasksResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeFlowLogsResult *> *)describeFlowLogs:(AWSEC2DescribeFlowLogsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeFlowLogs"
                   outputClass:[AWSEC2DescribeFlowLogsResult class]];
}

- (void)describeFlowLogs:(AWSEC2DescribeFlowLogsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeFlowLogsResult *response, NSError *error))completionHandler {
    [[self describeFlowLogs:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeFlowLogsResult *> * _Nonnull task) {
        AWSEC2DescribeFlowLogsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeHostsResult *> *)describeHosts:(AWSEC2DescribeHostsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeHosts"
                   outputClass:[AWSEC2DescribeHostsResult class]];
}

- (void)describeHosts:(AWSEC2DescribeHostsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeHostsResult *response, NSError *error))completionHandler {
    [[self describeHosts:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeHostsResult *> * _Nonnull task) {
        AWSEC2DescribeHostsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeIdFormatResult *> *)describeIdFormat:(AWSEC2DescribeIdFormatRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeIdFormat"
                   outputClass:[AWSEC2DescribeIdFormatResult class]];
}

- (void)describeIdFormat:(AWSEC2DescribeIdFormatRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeIdFormatResult *response, NSError *error))completionHandler {
    [[self describeIdFormat:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeIdFormatResult *> * _Nonnull task) {
        AWSEC2DescribeIdFormatResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ImageAttribute *> *)describeImageAttribute:(AWSEC2DescribeImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeImageAttribute"
                   outputClass:[AWSEC2ImageAttribute class]];
}

- (void)describeImageAttribute:(AWSEC2DescribeImageAttributeRequest *)request
     completionHandler:(void (^)(AWSEC2ImageAttribute *response, NSError *error))completionHandler {
    [[self describeImageAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ImageAttribute *> * _Nonnull task) {
        AWSEC2ImageAttribute *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeImagesResult *> *)describeImages:(AWSEC2DescribeImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeImages"
                   outputClass:[AWSEC2DescribeImagesResult class]];
}

- (void)describeImages:(AWSEC2DescribeImagesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeImagesResult *response, NSError *error))completionHandler {
    [[self describeImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeImagesResult *> * _Nonnull task) {
        AWSEC2DescribeImagesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeImportImageTasksResult *> *)describeImportImageTasks:(AWSEC2DescribeImportImageTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeImportImageTasks"
                   outputClass:[AWSEC2DescribeImportImageTasksResult class]];
}

- (void)describeImportImageTasks:(AWSEC2DescribeImportImageTasksRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeImportImageTasksResult *response, NSError *error))completionHandler {
    [[self describeImportImageTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeImportImageTasksResult *> * _Nonnull task) {
        AWSEC2DescribeImportImageTasksResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeImportSnapshotTasksResult *> *)describeImportSnapshotTasks:(AWSEC2DescribeImportSnapshotTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeImportSnapshotTasks"
                   outputClass:[AWSEC2DescribeImportSnapshotTasksResult class]];
}

- (void)describeImportSnapshotTasks:(AWSEC2DescribeImportSnapshotTasksRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeImportSnapshotTasksResult *response, NSError *error))completionHandler {
    [[self describeImportSnapshotTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeImportSnapshotTasksResult *> * _Nonnull task) {
        AWSEC2DescribeImportSnapshotTasksResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2InstanceAttribute *> *)describeInstanceAttribute:(AWSEC2DescribeInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceAttribute"
                   outputClass:[AWSEC2InstanceAttribute class]];
}

- (void)describeInstanceAttribute:(AWSEC2DescribeInstanceAttributeRequest *)request
     completionHandler:(void (^)(AWSEC2InstanceAttribute *response, NSError *error))completionHandler {
    [[self describeInstanceAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2InstanceAttribute *> * _Nonnull task) {
        AWSEC2InstanceAttribute *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeInstanceStatusResult *> *)describeInstanceStatus:(AWSEC2DescribeInstanceStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceStatus"
                   outputClass:[AWSEC2DescribeInstanceStatusResult class]];
}

- (void)describeInstanceStatus:(AWSEC2DescribeInstanceStatusRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeInstanceStatusResult *response, NSError *error))completionHandler {
    [[self describeInstanceStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeInstanceStatusResult *> * _Nonnull task) {
        AWSEC2DescribeInstanceStatusResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeInstancesResult *> *)describeInstances:(AWSEC2DescribeInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstances"
                   outputClass:[AWSEC2DescribeInstancesResult class]];
}

- (void)describeInstances:(AWSEC2DescribeInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeInstancesResult *response, NSError *error))completionHandler {
    [[self describeInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeInstancesResult *> * _Nonnull task) {
        AWSEC2DescribeInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeInternetGatewaysResult *> *)describeInternetGateways:(AWSEC2DescribeInternetGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInternetGateways"
                   outputClass:[AWSEC2DescribeInternetGatewaysResult class]];
}

- (void)describeInternetGateways:(AWSEC2DescribeInternetGatewaysRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeInternetGatewaysResult *response, NSError *error))completionHandler {
    [[self describeInternetGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeInternetGatewaysResult *> * _Nonnull task) {
        AWSEC2DescribeInternetGatewaysResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeKeyPairsResult *> *)describeKeyPairs:(AWSEC2DescribeKeyPairsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeKeyPairs"
                   outputClass:[AWSEC2DescribeKeyPairsResult class]];
}

- (void)describeKeyPairs:(AWSEC2DescribeKeyPairsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeKeyPairsResult *response, NSError *error))completionHandler {
    [[self describeKeyPairs:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeKeyPairsResult *> * _Nonnull task) {
        AWSEC2DescribeKeyPairsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeMovingAddressesResult *> *)describeMovingAddresses:(AWSEC2DescribeMovingAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeMovingAddresses"
                   outputClass:[AWSEC2DescribeMovingAddressesResult class]];
}

- (void)describeMovingAddresses:(AWSEC2DescribeMovingAddressesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeMovingAddressesResult *response, NSError *error))completionHandler {
    [[self describeMovingAddresses:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeMovingAddressesResult *> * _Nonnull task) {
        AWSEC2DescribeMovingAddressesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeNatGatewaysResult *> *)describeNatGateways:(AWSEC2DescribeNatGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNatGateways"
                   outputClass:[AWSEC2DescribeNatGatewaysResult class]];
}

- (void)describeNatGateways:(AWSEC2DescribeNatGatewaysRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeNatGatewaysResult *response, NSError *error))completionHandler {
    [[self describeNatGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeNatGatewaysResult *> * _Nonnull task) {
        AWSEC2DescribeNatGatewaysResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeNetworkAclsResult *> *)describeNetworkAcls:(AWSEC2DescribeNetworkAclsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNetworkAcls"
                   outputClass:[AWSEC2DescribeNetworkAclsResult class]];
}

- (void)describeNetworkAcls:(AWSEC2DescribeNetworkAclsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeNetworkAclsResult *response, NSError *error))completionHandler {
    [[self describeNetworkAcls:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeNetworkAclsResult *> * _Nonnull task) {
        AWSEC2DescribeNetworkAclsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeNetworkInterfaceAttributeResult *> *)describeNetworkInterfaceAttribute:(AWSEC2DescribeNetworkInterfaceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNetworkInterfaceAttribute"
                   outputClass:[AWSEC2DescribeNetworkInterfaceAttributeResult class]];
}

- (void)describeNetworkInterfaceAttribute:(AWSEC2DescribeNetworkInterfaceAttributeRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeNetworkInterfaceAttributeResult *response, NSError *error))completionHandler {
    [[self describeNetworkInterfaceAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeNetworkInterfaceAttributeResult *> * _Nonnull task) {
        AWSEC2DescribeNetworkInterfaceAttributeResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeNetworkInterfacesResult *> *)describeNetworkInterfaces:(AWSEC2DescribeNetworkInterfacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNetworkInterfaces"
                   outputClass:[AWSEC2DescribeNetworkInterfacesResult class]];
}

- (void)describeNetworkInterfaces:(AWSEC2DescribeNetworkInterfacesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeNetworkInterfacesResult *response, NSError *error))completionHandler {
    [[self describeNetworkInterfaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeNetworkInterfacesResult *> * _Nonnull task) {
        AWSEC2DescribeNetworkInterfacesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribePlacementGroupsResult *> *)describePlacementGroups:(AWSEC2DescribePlacementGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePlacementGroups"
                   outputClass:[AWSEC2DescribePlacementGroupsResult class]];
}

- (void)describePlacementGroups:(AWSEC2DescribePlacementGroupsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribePlacementGroupsResult *response, NSError *error))completionHandler {
    [[self describePlacementGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribePlacementGroupsResult *> * _Nonnull task) {
        AWSEC2DescribePlacementGroupsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribePrefixListsResult *> *)describePrefixLists:(AWSEC2DescribePrefixListsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePrefixLists"
                   outputClass:[AWSEC2DescribePrefixListsResult class]];
}

- (void)describePrefixLists:(AWSEC2DescribePrefixListsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribePrefixListsResult *response, NSError *error))completionHandler {
    [[self describePrefixLists:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribePrefixListsResult *> * _Nonnull task) {
        AWSEC2DescribePrefixListsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeRegionsResult *> *)describeRegions:(AWSEC2DescribeRegionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeRegions"
                   outputClass:[AWSEC2DescribeRegionsResult class]];
}

- (void)describeRegions:(AWSEC2DescribeRegionsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeRegionsResult *response, NSError *error))completionHandler {
    [[self describeRegions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeRegionsResult *> * _Nonnull task) {
        AWSEC2DescribeRegionsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeReservedInstancesResult *> *)describeReservedInstances:(AWSEC2DescribeReservedInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstances"
                   outputClass:[AWSEC2DescribeReservedInstancesResult class]];
}

- (void)describeReservedInstances:(AWSEC2DescribeReservedInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeReservedInstancesResult *response, NSError *error))completionHandler {
    [[self describeReservedInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeReservedInstancesResult *> * _Nonnull task) {
        AWSEC2DescribeReservedInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeReservedInstancesListingsResult *> *)describeReservedInstancesListings:(AWSEC2DescribeReservedInstancesListingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstancesListings"
                   outputClass:[AWSEC2DescribeReservedInstancesListingsResult class]];
}

- (void)describeReservedInstancesListings:(AWSEC2DescribeReservedInstancesListingsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeReservedInstancesListingsResult *response, NSError *error))completionHandler {
    [[self describeReservedInstancesListings:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeReservedInstancesListingsResult *> * _Nonnull task) {
        AWSEC2DescribeReservedInstancesListingsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeReservedInstancesModificationsResult *> *)describeReservedInstancesModifications:(AWSEC2DescribeReservedInstancesModificationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstancesModifications"
                   outputClass:[AWSEC2DescribeReservedInstancesModificationsResult class]];
}

- (void)describeReservedInstancesModifications:(AWSEC2DescribeReservedInstancesModificationsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeReservedInstancesModificationsResult *response, NSError *error))completionHandler {
    [[self describeReservedInstancesModifications:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeReservedInstancesModificationsResult *> * _Nonnull task) {
        AWSEC2DescribeReservedInstancesModificationsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeReservedInstancesOfferingsResult *> *)describeReservedInstancesOfferings:(AWSEC2DescribeReservedInstancesOfferingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstancesOfferings"
                   outputClass:[AWSEC2DescribeReservedInstancesOfferingsResult class]];
}

- (void)describeReservedInstancesOfferings:(AWSEC2DescribeReservedInstancesOfferingsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeReservedInstancesOfferingsResult *response, NSError *error))completionHandler {
    [[self describeReservedInstancesOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeReservedInstancesOfferingsResult *> * _Nonnull task) {
        AWSEC2DescribeReservedInstancesOfferingsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeRouteTablesResult *> *)describeRouteTables:(AWSEC2DescribeRouteTablesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeRouteTables"
                   outputClass:[AWSEC2DescribeRouteTablesResult class]];
}

- (void)describeRouteTables:(AWSEC2DescribeRouteTablesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeRouteTablesResult *response, NSError *error))completionHandler {
    [[self describeRouteTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeRouteTablesResult *> * _Nonnull task) {
        AWSEC2DescribeRouteTablesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeScheduledInstanceAvailabilityResult *> *)describeScheduledInstanceAvailability:(AWSEC2DescribeScheduledInstanceAvailabilityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScheduledInstanceAvailability"
                   outputClass:[AWSEC2DescribeScheduledInstanceAvailabilityResult class]];
}

- (void)describeScheduledInstanceAvailability:(AWSEC2DescribeScheduledInstanceAvailabilityRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeScheduledInstanceAvailabilityResult *response, NSError *error))completionHandler {
    [[self describeScheduledInstanceAvailability:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeScheduledInstanceAvailabilityResult *> * _Nonnull task) {
        AWSEC2DescribeScheduledInstanceAvailabilityResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeScheduledInstancesResult *> *)describeScheduledInstances:(AWSEC2DescribeScheduledInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScheduledInstances"
                   outputClass:[AWSEC2DescribeScheduledInstancesResult class]];
}

- (void)describeScheduledInstances:(AWSEC2DescribeScheduledInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeScheduledInstancesResult *response, NSError *error))completionHandler {
    [[self describeScheduledInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeScheduledInstancesResult *> * _Nonnull task) {
        AWSEC2DescribeScheduledInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSecurityGroupReferencesResult *> *)describeSecurityGroupReferences:(AWSEC2DescribeSecurityGroupReferencesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSecurityGroupReferences"
                   outputClass:[AWSEC2DescribeSecurityGroupReferencesResult class]];
}

- (void)describeSecurityGroupReferences:(AWSEC2DescribeSecurityGroupReferencesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSecurityGroupReferencesResult *response, NSError *error))completionHandler {
    [[self describeSecurityGroupReferences:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSecurityGroupReferencesResult *> * _Nonnull task) {
        AWSEC2DescribeSecurityGroupReferencesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSecurityGroupsResult *> *)describeSecurityGroups:(AWSEC2DescribeSecurityGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSecurityGroups"
                   outputClass:[AWSEC2DescribeSecurityGroupsResult class]];
}

- (void)describeSecurityGroups:(AWSEC2DescribeSecurityGroupsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSecurityGroupsResult *response, NSError *error))completionHandler {
    [[self describeSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSecurityGroupsResult *> * _Nonnull task) {
        AWSEC2DescribeSecurityGroupsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSnapshotAttributeResult *> *)describeSnapshotAttribute:(AWSEC2DescribeSnapshotAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSnapshotAttribute"
                   outputClass:[AWSEC2DescribeSnapshotAttributeResult class]];
}

- (void)describeSnapshotAttribute:(AWSEC2DescribeSnapshotAttributeRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSnapshotAttributeResult *response, NSError *error))completionHandler {
    [[self describeSnapshotAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSnapshotAttributeResult *> * _Nonnull task) {
        AWSEC2DescribeSnapshotAttributeResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSnapshotsResult *> *)describeSnapshots:(AWSEC2DescribeSnapshotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSnapshots"
                   outputClass:[AWSEC2DescribeSnapshotsResult class]];
}

- (void)describeSnapshots:(AWSEC2DescribeSnapshotsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSnapshotsResult *response, NSError *error))completionHandler {
    [[self describeSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSnapshotsResult *> * _Nonnull task) {
        AWSEC2DescribeSnapshotsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSpotDatafeedSubscriptionResult *> *)describeSpotDatafeedSubscription:(AWSEC2DescribeSpotDatafeedSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotDatafeedSubscription"
                   outputClass:[AWSEC2DescribeSpotDatafeedSubscriptionResult class]];
}

- (void)describeSpotDatafeedSubscription:(AWSEC2DescribeSpotDatafeedSubscriptionRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSpotDatafeedSubscriptionResult *response, NSError *error))completionHandler {
    [[self describeSpotDatafeedSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSpotDatafeedSubscriptionResult *> * _Nonnull task) {
        AWSEC2DescribeSpotDatafeedSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSpotFleetInstancesResponse *> *)describeSpotFleetInstances:(AWSEC2DescribeSpotFleetInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotFleetInstances"
                   outputClass:[AWSEC2DescribeSpotFleetInstancesResponse class]];
}

- (void)describeSpotFleetInstances:(AWSEC2DescribeSpotFleetInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSpotFleetInstancesResponse *response, NSError *error))completionHandler {
    [[self describeSpotFleetInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSpotFleetInstancesResponse *> * _Nonnull task) {
        AWSEC2DescribeSpotFleetInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSpotFleetRequestHistoryResponse *> *)describeSpotFleetRequestHistory:(AWSEC2DescribeSpotFleetRequestHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotFleetRequestHistory"
                   outputClass:[AWSEC2DescribeSpotFleetRequestHistoryResponse class]];
}

- (void)describeSpotFleetRequestHistory:(AWSEC2DescribeSpotFleetRequestHistoryRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSpotFleetRequestHistoryResponse *response, NSError *error))completionHandler {
    [[self describeSpotFleetRequestHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSpotFleetRequestHistoryResponse *> * _Nonnull task) {
        AWSEC2DescribeSpotFleetRequestHistoryResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSpotFleetRequestsResponse *> *)describeSpotFleetRequests:(AWSEC2DescribeSpotFleetRequestsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotFleetRequests"
                   outputClass:[AWSEC2DescribeSpotFleetRequestsResponse class]];
}

- (void)describeSpotFleetRequests:(AWSEC2DescribeSpotFleetRequestsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSpotFleetRequestsResponse *response, NSError *error))completionHandler {
    [[self describeSpotFleetRequests:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSpotFleetRequestsResponse *> * _Nonnull task) {
        AWSEC2DescribeSpotFleetRequestsResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSpotInstanceRequestsResult *> *)describeSpotInstanceRequests:(AWSEC2DescribeSpotInstanceRequestsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotInstanceRequests"
                   outputClass:[AWSEC2DescribeSpotInstanceRequestsResult class]];
}

- (void)describeSpotInstanceRequests:(AWSEC2DescribeSpotInstanceRequestsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSpotInstanceRequestsResult *response, NSError *error))completionHandler {
    [[self describeSpotInstanceRequests:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSpotInstanceRequestsResult *> * _Nonnull task) {
        AWSEC2DescribeSpotInstanceRequestsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSpotPriceHistoryResult *> *)describeSpotPriceHistory:(AWSEC2DescribeSpotPriceHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotPriceHistory"
                   outputClass:[AWSEC2DescribeSpotPriceHistoryResult class]];
}

- (void)describeSpotPriceHistory:(AWSEC2DescribeSpotPriceHistoryRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSpotPriceHistoryResult *response, NSError *error))completionHandler {
    [[self describeSpotPriceHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSpotPriceHistoryResult *> * _Nonnull task) {
        AWSEC2DescribeSpotPriceHistoryResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeStaleSecurityGroupsResult *> *)describeStaleSecurityGroups:(AWSEC2DescribeStaleSecurityGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStaleSecurityGroups"
                   outputClass:[AWSEC2DescribeStaleSecurityGroupsResult class]];
}

- (void)describeStaleSecurityGroups:(AWSEC2DescribeStaleSecurityGroupsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeStaleSecurityGroupsResult *response, NSError *error))completionHandler {
    [[self describeStaleSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeStaleSecurityGroupsResult *> * _Nonnull task) {
        AWSEC2DescribeStaleSecurityGroupsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeSubnetsResult *> *)describeSubnets:(AWSEC2DescribeSubnetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSubnets"
                   outputClass:[AWSEC2DescribeSubnetsResult class]];
}

- (void)describeSubnets:(AWSEC2DescribeSubnetsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeSubnetsResult *response, NSError *error))completionHandler {
    [[self describeSubnets:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeSubnetsResult *> * _Nonnull task) {
        AWSEC2DescribeSubnetsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeTagsResult *> *)describeTags:(AWSEC2DescribeTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSEC2DescribeTagsResult class]];
}

- (void)describeTags:(AWSEC2DescribeTagsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeTagsResult *response, NSError *error))completionHandler {
    [[self describeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeTagsResult *> * _Nonnull task) {
        AWSEC2DescribeTagsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVolumeAttributeResult *> *)describeVolumeAttribute:(AWSEC2DescribeVolumeAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVolumeAttribute"
                   outputClass:[AWSEC2DescribeVolumeAttributeResult class]];
}

- (void)describeVolumeAttribute:(AWSEC2DescribeVolumeAttributeRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVolumeAttributeResult *response, NSError *error))completionHandler {
    [[self describeVolumeAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVolumeAttributeResult *> * _Nonnull task) {
        AWSEC2DescribeVolumeAttributeResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVolumeStatusResult *> *)describeVolumeStatus:(AWSEC2DescribeVolumeStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVolumeStatus"
                   outputClass:[AWSEC2DescribeVolumeStatusResult class]];
}

- (void)describeVolumeStatus:(AWSEC2DescribeVolumeStatusRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVolumeStatusResult *response, NSError *error))completionHandler {
    [[self describeVolumeStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVolumeStatusResult *> * _Nonnull task) {
        AWSEC2DescribeVolumeStatusResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVolumesResult *> *)describeVolumes:(AWSEC2DescribeVolumesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVolumes"
                   outputClass:[AWSEC2DescribeVolumesResult class]];
}

- (void)describeVolumes:(AWSEC2DescribeVolumesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVolumesResult *response, NSError *error))completionHandler {
    [[self describeVolumes:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVolumesResult *> * _Nonnull task) {
        AWSEC2DescribeVolumesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcAttributeResult *> *)describeVpcAttribute:(AWSEC2DescribeVpcAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcAttribute"
                   outputClass:[AWSEC2DescribeVpcAttributeResult class]];
}

- (void)describeVpcAttribute:(AWSEC2DescribeVpcAttributeRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcAttributeResult *response, NSError *error))completionHandler {
    [[self describeVpcAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcAttributeResult *> * _Nonnull task) {
        AWSEC2DescribeVpcAttributeResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcClassicLinkResult *> *)describeVpcClassicLink:(AWSEC2DescribeVpcClassicLinkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcClassicLink"
                   outputClass:[AWSEC2DescribeVpcClassicLinkResult class]];
}

- (void)describeVpcClassicLink:(AWSEC2DescribeVpcClassicLinkRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcClassicLinkResult *response, NSError *error))completionHandler {
    [[self describeVpcClassicLink:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcClassicLinkResult *> * _Nonnull task) {
        AWSEC2DescribeVpcClassicLinkResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcClassicLinkDnsSupportResult *> *)describeVpcClassicLinkDnsSupport:(AWSEC2DescribeVpcClassicLinkDnsSupportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcClassicLinkDnsSupport"
                   outputClass:[AWSEC2DescribeVpcClassicLinkDnsSupportResult class]];
}

- (void)describeVpcClassicLinkDnsSupport:(AWSEC2DescribeVpcClassicLinkDnsSupportRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcClassicLinkDnsSupportResult *response, NSError *error))completionHandler {
    [[self describeVpcClassicLinkDnsSupport:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcClassicLinkDnsSupportResult *> * _Nonnull task) {
        AWSEC2DescribeVpcClassicLinkDnsSupportResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcEndpointServicesResult *> *)describeVpcEndpointServices:(AWSEC2DescribeVpcEndpointServicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcEndpointServices"
                   outputClass:[AWSEC2DescribeVpcEndpointServicesResult class]];
}

- (void)describeVpcEndpointServices:(AWSEC2DescribeVpcEndpointServicesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcEndpointServicesResult *response, NSError *error))completionHandler {
    [[self describeVpcEndpointServices:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcEndpointServicesResult *> * _Nonnull task) {
        AWSEC2DescribeVpcEndpointServicesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcEndpointsResult *> *)describeVpcEndpoints:(AWSEC2DescribeVpcEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcEndpoints"
                   outputClass:[AWSEC2DescribeVpcEndpointsResult class]];
}

- (void)describeVpcEndpoints:(AWSEC2DescribeVpcEndpointsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcEndpointsResult *response, NSError *error))completionHandler {
    [[self describeVpcEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcEndpointsResult *> * _Nonnull task) {
        AWSEC2DescribeVpcEndpointsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcPeeringConnectionsResult *> *)describeVpcPeeringConnections:(AWSEC2DescribeVpcPeeringConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcPeeringConnections"
                   outputClass:[AWSEC2DescribeVpcPeeringConnectionsResult class]];
}

- (void)describeVpcPeeringConnections:(AWSEC2DescribeVpcPeeringConnectionsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcPeeringConnectionsResult *response, NSError *error))completionHandler {
    [[self describeVpcPeeringConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcPeeringConnectionsResult *> * _Nonnull task) {
        AWSEC2DescribeVpcPeeringConnectionsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcsResult *> *)describeVpcs:(AWSEC2DescribeVpcsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcs"
                   outputClass:[AWSEC2DescribeVpcsResult class]];
}

- (void)describeVpcs:(AWSEC2DescribeVpcsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcsResult *response, NSError *error))completionHandler {
    [[self describeVpcs:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcsResult *> * _Nonnull task) {
        AWSEC2DescribeVpcsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpnConnectionsResult *> *)describeVpnConnections:(AWSEC2DescribeVpnConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpnConnections"
                   outputClass:[AWSEC2DescribeVpnConnectionsResult class]];
}

- (void)describeVpnConnections:(AWSEC2DescribeVpnConnectionsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpnConnectionsResult *response, NSError *error))completionHandler {
    [[self describeVpnConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpnConnectionsResult *> * _Nonnull task) {
        AWSEC2DescribeVpnConnectionsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpnGatewaysResult *> *)describeVpnGateways:(AWSEC2DescribeVpnGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpnGateways"
                   outputClass:[AWSEC2DescribeVpnGatewaysResult class]];
}

- (void)describeVpnGateways:(AWSEC2DescribeVpnGatewaysRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpnGatewaysResult *response, NSError *error))completionHandler {
    [[self describeVpnGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpnGatewaysResult *> * _Nonnull task) {
        AWSEC2DescribeVpnGatewaysResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DetachClassicLinkVpcResult *> *)detachClassicLinkVpc:(AWSEC2DetachClassicLinkVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachClassicLinkVpc"
                   outputClass:[AWSEC2DetachClassicLinkVpcResult class]];
}

- (void)detachClassicLinkVpc:(AWSEC2DetachClassicLinkVpcRequest *)request
     completionHandler:(void (^)(AWSEC2DetachClassicLinkVpcResult *response, NSError *error))completionHandler {
    [[self detachClassicLinkVpc:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DetachClassicLinkVpcResult *> * _Nonnull task) {
        AWSEC2DetachClassicLinkVpcResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)detachInternetGateway:(AWSEC2DetachInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachInternetGateway"
                   outputClass:nil];
}

- (void)detachInternetGateway:(AWSEC2DetachInternetGatewayRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self detachInternetGateway:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)detachNetworkInterface:(AWSEC2DetachNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachNetworkInterface"
                   outputClass:nil];
}

- (void)detachNetworkInterface:(AWSEC2DetachNetworkInterfaceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self detachNetworkInterface:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2VolumeAttachment *> *)detachVolume:(AWSEC2DetachVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachVolume"
                   outputClass:[AWSEC2VolumeAttachment class]];
}

- (void)detachVolume:(AWSEC2DetachVolumeRequest *)request
     completionHandler:(void (^)(AWSEC2VolumeAttachment *response, NSError *error))completionHandler {
    [[self detachVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2VolumeAttachment *> * _Nonnull task) {
        AWSEC2VolumeAttachment *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)detachVpnGateway:(AWSEC2DetachVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachVpnGateway"
                   outputClass:nil];
}

- (void)detachVpnGateway:(AWSEC2DetachVpnGatewayRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self detachVpnGateway:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disableVgwRoutePropagation:(AWSEC2DisableVgwRoutePropagationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableVgwRoutePropagation"
                   outputClass:nil];
}

- (void)disableVgwRoutePropagation:(AWSEC2DisableVgwRoutePropagationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disableVgwRoutePropagation:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisableVpcClassicLinkResult *> *)disableVpcClassicLink:(AWSEC2DisableVpcClassicLinkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableVpcClassicLink"
                   outputClass:[AWSEC2DisableVpcClassicLinkResult class]];
}

- (void)disableVpcClassicLink:(AWSEC2DisableVpcClassicLinkRequest *)request
     completionHandler:(void (^)(AWSEC2DisableVpcClassicLinkResult *response, NSError *error))completionHandler {
    [[self disableVpcClassicLink:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisableVpcClassicLinkResult *> * _Nonnull task) {
        AWSEC2DisableVpcClassicLinkResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisableVpcClassicLinkDnsSupportResult *> *)disableVpcClassicLinkDnsSupport:(AWSEC2DisableVpcClassicLinkDnsSupportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableVpcClassicLinkDnsSupport"
                   outputClass:[AWSEC2DisableVpcClassicLinkDnsSupportResult class]];
}

- (void)disableVpcClassicLinkDnsSupport:(AWSEC2DisableVpcClassicLinkDnsSupportRequest *)request
     completionHandler:(void (^)(AWSEC2DisableVpcClassicLinkDnsSupportResult *response, NSError *error))completionHandler {
    [[self disableVpcClassicLinkDnsSupport:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisableVpcClassicLinkDnsSupportResult *> * _Nonnull task) {
        AWSEC2DisableVpcClassicLinkDnsSupportResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateAddress:(AWSEC2DisassociateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateAddress"
                   outputClass:nil];
}

- (void)disassociateAddress:(AWSEC2DisassociateAddressRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateAddress:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateRouteTable:(AWSEC2DisassociateRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateRouteTable"
                   outputClass:nil];
}

- (void)disassociateRouteTable:(AWSEC2DisassociateRouteTableRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateRouteTable:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)enableVgwRoutePropagation:(AWSEC2EnableVgwRoutePropagationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableVgwRoutePropagation"
                   outputClass:nil];
}

- (void)enableVgwRoutePropagation:(AWSEC2EnableVgwRoutePropagationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self enableVgwRoutePropagation:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)enableVolumeIO:(AWSEC2EnableVolumeIORequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableVolumeIO"
                   outputClass:nil];
}

- (void)enableVolumeIO:(AWSEC2EnableVolumeIORequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self enableVolumeIO:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2EnableVpcClassicLinkResult *> *)enableVpcClassicLink:(AWSEC2EnableVpcClassicLinkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableVpcClassicLink"
                   outputClass:[AWSEC2EnableVpcClassicLinkResult class]];
}

- (void)enableVpcClassicLink:(AWSEC2EnableVpcClassicLinkRequest *)request
     completionHandler:(void (^)(AWSEC2EnableVpcClassicLinkResult *response, NSError *error))completionHandler {
    [[self enableVpcClassicLink:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2EnableVpcClassicLinkResult *> * _Nonnull task) {
        AWSEC2EnableVpcClassicLinkResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2EnableVpcClassicLinkDnsSupportResult *> *)enableVpcClassicLinkDnsSupport:(AWSEC2EnableVpcClassicLinkDnsSupportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableVpcClassicLinkDnsSupport"
                   outputClass:[AWSEC2EnableVpcClassicLinkDnsSupportResult class]];
}

- (void)enableVpcClassicLinkDnsSupport:(AWSEC2EnableVpcClassicLinkDnsSupportRequest *)request
     completionHandler:(void (^)(AWSEC2EnableVpcClassicLinkDnsSupportResult *response, NSError *error))completionHandler {
    [[self enableVpcClassicLinkDnsSupport:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2EnableVpcClassicLinkDnsSupportResult *> * _Nonnull task) {
        AWSEC2EnableVpcClassicLinkDnsSupportResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetConsoleOutputResult *> *)getConsoleOutput:(AWSEC2GetConsoleOutputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetConsoleOutput"
                   outputClass:[AWSEC2GetConsoleOutputResult class]];
}

- (void)getConsoleOutput:(AWSEC2GetConsoleOutputRequest *)request
     completionHandler:(void (^)(AWSEC2GetConsoleOutputResult *response, NSError *error))completionHandler {
    [[self getConsoleOutput:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetConsoleOutputResult *> * _Nonnull task) {
        AWSEC2GetConsoleOutputResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetPasswordDataResult *> *)getPasswordData:(AWSEC2GetPasswordDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetPasswordData"
                   outputClass:[AWSEC2GetPasswordDataResult class]];
}

- (void)getPasswordData:(AWSEC2GetPasswordDataRequest *)request
     completionHandler:(void (^)(AWSEC2GetPasswordDataResult *response, NSError *error))completionHandler {
    [[self getPasswordData:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetPasswordDataResult *> * _Nonnull task) {
        AWSEC2GetPasswordDataResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ImportImageResult *> *)importImage:(AWSEC2ImportImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportImage"
                   outputClass:[AWSEC2ImportImageResult class]];
}

- (void)importImage:(AWSEC2ImportImageRequest *)request
     completionHandler:(void (^)(AWSEC2ImportImageResult *response, NSError *error))completionHandler {
    [[self importImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ImportImageResult *> * _Nonnull task) {
        AWSEC2ImportImageResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ImportInstanceResult *> *)importInstance:(AWSEC2ImportInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportInstance"
                   outputClass:[AWSEC2ImportInstanceResult class]];
}

- (void)importInstance:(AWSEC2ImportInstanceRequest *)request
     completionHandler:(void (^)(AWSEC2ImportInstanceResult *response, NSError *error))completionHandler {
    [[self importInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ImportInstanceResult *> * _Nonnull task) {
        AWSEC2ImportInstanceResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ImportKeyPairResult *> *)importKeyPair:(AWSEC2ImportKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportKeyPair"
                   outputClass:[AWSEC2ImportKeyPairResult class]];
}

- (void)importKeyPair:(AWSEC2ImportKeyPairRequest *)request
     completionHandler:(void (^)(AWSEC2ImportKeyPairResult *response, NSError *error))completionHandler {
    [[self importKeyPair:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ImportKeyPairResult *> * _Nonnull task) {
        AWSEC2ImportKeyPairResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ImportSnapshotResult *> *)importSnapshot:(AWSEC2ImportSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportSnapshot"
                   outputClass:[AWSEC2ImportSnapshotResult class]];
}

- (void)importSnapshot:(AWSEC2ImportSnapshotRequest *)request
     completionHandler:(void (^)(AWSEC2ImportSnapshotResult *response, NSError *error))completionHandler {
    [[self importSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ImportSnapshotResult *> * _Nonnull task) {
        AWSEC2ImportSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ImportVolumeResult *> *)importVolume:(AWSEC2ImportVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportVolume"
                   outputClass:[AWSEC2ImportVolumeResult class]];
}

- (void)importVolume:(AWSEC2ImportVolumeRequest *)request
     completionHandler:(void (^)(AWSEC2ImportVolumeResult *response, NSError *error))completionHandler {
    [[self importVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ImportVolumeResult *> * _Nonnull task) {
        AWSEC2ImportVolumeResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyHostsResult *> *)modifyHosts:(AWSEC2ModifyHostsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyHosts"
                   outputClass:[AWSEC2ModifyHostsResult class]];
}

- (void)modifyHosts:(AWSEC2ModifyHostsRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyHostsResult *response, NSError *error))completionHandler {
    [[self modifyHosts:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyHostsResult *> * _Nonnull task) {
        AWSEC2ModifyHostsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyIdFormat:(AWSEC2ModifyIdFormatRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyIdFormat"
                   outputClass:nil];
}

- (void)modifyIdFormat:(AWSEC2ModifyIdFormatRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyIdFormat:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyImageAttribute:(AWSEC2ModifyImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyImageAttribute"
                   outputClass:nil];
}

- (void)modifyImageAttribute:(AWSEC2ModifyImageAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyImageAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyInstanceAttribute:(AWSEC2ModifyInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyInstanceAttribute"
                   outputClass:nil];
}

- (void)modifyInstanceAttribute:(AWSEC2ModifyInstanceAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyInstanceAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyInstancePlacementResult *> *)modifyInstancePlacement:(AWSEC2ModifyInstancePlacementRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyInstancePlacement"
                   outputClass:[AWSEC2ModifyInstancePlacementResult class]];
}

- (void)modifyInstancePlacement:(AWSEC2ModifyInstancePlacementRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyInstancePlacementResult *response, NSError *error))completionHandler {
    [[self modifyInstancePlacement:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyInstancePlacementResult *> * _Nonnull task) {
        AWSEC2ModifyInstancePlacementResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyNetworkInterfaceAttribute:(AWSEC2ModifyNetworkInterfaceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyNetworkInterfaceAttribute"
                   outputClass:nil];
}

- (void)modifyNetworkInterfaceAttribute:(AWSEC2ModifyNetworkInterfaceAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyNetworkInterfaceAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyReservedInstancesResult *> *)modifyReservedInstances:(AWSEC2ModifyReservedInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyReservedInstances"
                   outputClass:[AWSEC2ModifyReservedInstancesResult class]];
}

- (void)modifyReservedInstances:(AWSEC2ModifyReservedInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyReservedInstancesResult *response, NSError *error))completionHandler {
    [[self modifyReservedInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyReservedInstancesResult *> * _Nonnull task) {
        AWSEC2ModifyReservedInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)modifySnapshotAttribute:(AWSEC2ModifySnapshotAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifySnapshotAttribute"
                   outputClass:nil];
}

- (void)modifySnapshotAttribute:(AWSEC2ModifySnapshotAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifySnapshotAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifySpotFleetRequestResponse *> *)modifySpotFleetRequest:(AWSEC2ModifySpotFleetRequestRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifySpotFleetRequest"
                   outputClass:[AWSEC2ModifySpotFleetRequestResponse class]];
}

- (void)modifySpotFleetRequest:(AWSEC2ModifySpotFleetRequestRequest *)request
     completionHandler:(void (^)(AWSEC2ModifySpotFleetRequestResponse *response, NSError *error))completionHandler {
    [[self modifySpotFleetRequest:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifySpotFleetRequestResponse *> * _Nonnull task) {
        AWSEC2ModifySpotFleetRequestResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)modifySubnetAttribute:(AWSEC2ModifySubnetAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifySubnetAttribute"
                   outputClass:nil];
}

- (void)modifySubnetAttribute:(AWSEC2ModifySubnetAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifySubnetAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyVolumeAttribute:(AWSEC2ModifyVolumeAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVolumeAttribute"
                   outputClass:nil];
}

- (void)modifyVolumeAttribute:(AWSEC2ModifyVolumeAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyVolumeAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyVpcAttribute:(AWSEC2ModifyVpcAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpcAttribute"
                   outputClass:nil];
}

- (void)modifyVpcAttribute:(AWSEC2ModifyVpcAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyVpcAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyVpcEndpointResult *> *)modifyVpcEndpoint:(AWSEC2ModifyVpcEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpcEndpoint"
                   outputClass:[AWSEC2ModifyVpcEndpointResult class]];
}

- (void)modifyVpcEndpoint:(AWSEC2ModifyVpcEndpointRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyVpcEndpointResult *response, NSError *error))completionHandler {
    [[self modifyVpcEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyVpcEndpointResult *> * _Nonnull task) {
        AWSEC2ModifyVpcEndpointResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyVpcPeeringConnectionOptionsResult *> *)modifyVpcPeeringConnectionOptions:(AWSEC2ModifyVpcPeeringConnectionOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpcPeeringConnectionOptions"
                   outputClass:[AWSEC2ModifyVpcPeeringConnectionOptionsResult class]];
}

- (void)modifyVpcPeeringConnectionOptions:(AWSEC2ModifyVpcPeeringConnectionOptionsRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyVpcPeeringConnectionOptionsResult *response, NSError *error))completionHandler {
    [[self modifyVpcPeeringConnectionOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyVpcPeeringConnectionOptionsResult *> * _Nonnull task) {
        AWSEC2ModifyVpcPeeringConnectionOptionsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2MonitorInstancesResult *> *)monitorInstances:(AWSEC2MonitorInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"MonitorInstances"
                   outputClass:[AWSEC2MonitorInstancesResult class]];
}

- (void)monitorInstances:(AWSEC2MonitorInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2MonitorInstancesResult *response, NSError *error))completionHandler {
    [[self monitorInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2MonitorInstancesResult *> * _Nonnull task) {
        AWSEC2MonitorInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2MoveAddressToVpcResult *> *)moveAddressToVpc:(AWSEC2MoveAddressToVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"MoveAddressToVpc"
                   outputClass:[AWSEC2MoveAddressToVpcResult class]];
}

- (void)moveAddressToVpc:(AWSEC2MoveAddressToVpcRequest *)request
     completionHandler:(void (^)(AWSEC2MoveAddressToVpcResult *response, NSError *error))completionHandler {
    [[self moveAddressToVpc:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2MoveAddressToVpcResult *> * _Nonnull task) {
        AWSEC2MoveAddressToVpcResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2PurchaseReservedInstancesOfferingResult *> *)purchaseReservedInstancesOffering:(AWSEC2PurchaseReservedInstancesOfferingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PurchaseReservedInstancesOffering"
                   outputClass:[AWSEC2PurchaseReservedInstancesOfferingResult class]];
}

- (void)purchaseReservedInstancesOffering:(AWSEC2PurchaseReservedInstancesOfferingRequest *)request
     completionHandler:(void (^)(AWSEC2PurchaseReservedInstancesOfferingResult *response, NSError *error))completionHandler {
    [[self purchaseReservedInstancesOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2PurchaseReservedInstancesOfferingResult *> * _Nonnull task) {
        AWSEC2PurchaseReservedInstancesOfferingResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2PurchaseScheduledInstancesResult *> *)purchaseScheduledInstances:(AWSEC2PurchaseScheduledInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PurchaseScheduledInstances"
                   outputClass:[AWSEC2PurchaseScheduledInstancesResult class]];
}

- (void)purchaseScheduledInstances:(AWSEC2PurchaseScheduledInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2PurchaseScheduledInstancesResult *response, NSError *error))completionHandler {
    [[self purchaseScheduledInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2PurchaseScheduledInstancesResult *> * _Nonnull task) {
        AWSEC2PurchaseScheduledInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)rebootInstances:(AWSEC2RebootInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RebootInstances"
                   outputClass:nil];
}

- (void)rebootInstances:(AWSEC2RebootInstancesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self rebootInstances:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RegisterImageResult *> *)registerImage:(AWSEC2RegisterImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterImage"
                   outputClass:[AWSEC2RegisterImageResult class]];
}

- (void)registerImage:(AWSEC2RegisterImageRequest *)request
     completionHandler:(void (^)(AWSEC2RegisterImageResult *response, NSError *error))completionHandler {
    [[self registerImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RegisterImageResult *> * _Nonnull task) {
        AWSEC2RegisterImageResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RejectVpcPeeringConnectionResult *> *)rejectVpcPeeringConnection:(AWSEC2RejectVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RejectVpcPeeringConnection"
                   outputClass:[AWSEC2RejectVpcPeeringConnectionResult class]];
}

- (void)rejectVpcPeeringConnection:(AWSEC2RejectVpcPeeringConnectionRequest *)request
     completionHandler:(void (^)(AWSEC2RejectVpcPeeringConnectionResult *response, NSError *error))completionHandler {
    [[self rejectVpcPeeringConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RejectVpcPeeringConnectionResult *> * _Nonnull task) {
        AWSEC2RejectVpcPeeringConnectionResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)releaseAddress:(AWSEC2ReleaseAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReleaseAddress"
                   outputClass:nil];
}

- (void)releaseAddress:(AWSEC2ReleaseAddressRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self releaseAddress:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ReleaseHostsResult *> *)releaseHosts:(AWSEC2ReleaseHostsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReleaseHosts"
                   outputClass:[AWSEC2ReleaseHostsResult class]];
}

- (void)releaseHosts:(AWSEC2ReleaseHostsRequest *)request
     completionHandler:(void (^)(AWSEC2ReleaseHostsResult *response, NSError *error))completionHandler {
    [[self releaseHosts:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ReleaseHostsResult *> * _Nonnull task) {
        AWSEC2ReleaseHostsResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ReplaceNetworkAclAssociationResult *> *)replaceNetworkAclAssociation:(AWSEC2ReplaceNetworkAclAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceNetworkAclAssociation"
                   outputClass:[AWSEC2ReplaceNetworkAclAssociationResult class]];
}

- (void)replaceNetworkAclAssociation:(AWSEC2ReplaceNetworkAclAssociationRequest *)request
     completionHandler:(void (^)(AWSEC2ReplaceNetworkAclAssociationResult *response, NSError *error))completionHandler {
    [[self replaceNetworkAclAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ReplaceNetworkAclAssociationResult *> * _Nonnull task) {
        AWSEC2ReplaceNetworkAclAssociationResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)replaceNetworkAclEntry:(AWSEC2ReplaceNetworkAclEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceNetworkAclEntry"
                   outputClass:nil];
}

- (void)replaceNetworkAclEntry:(AWSEC2ReplaceNetworkAclEntryRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self replaceNetworkAclEntry:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)replaceRoute:(AWSEC2ReplaceRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceRoute"
                   outputClass:nil];
}

- (void)replaceRoute:(AWSEC2ReplaceRouteRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self replaceRoute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ReplaceRouteTableAssociationResult *> *)replaceRouteTableAssociation:(AWSEC2ReplaceRouteTableAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceRouteTableAssociation"
                   outputClass:[AWSEC2ReplaceRouteTableAssociationResult class]];
}

- (void)replaceRouteTableAssociation:(AWSEC2ReplaceRouteTableAssociationRequest *)request
     completionHandler:(void (^)(AWSEC2ReplaceRouteTableAssociationResult *response, NSError *error))completionHandler {
    [[self replaceRouteTableAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ReplaceRouteTableAssociationResult *> * _Nonnull task) {
        AWSEC2ReplaceRouteTableAssociationResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)reportInstanceStatus:(AWSEC2ReportInstanceStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReportInstanceStatus"
                   outputClass:nil];
}

- (void)reportInstanceStatus:(AWSEC2ReportInstanceStatusRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self reportInstanceStatus:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RequestSpotFleetResponse *> *)requestSpotFleet:(AWSEC2RequestSpotFleetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RequestSpotFleet"
                   outputClass:[AWSEC2RequestSpotFleetResponse class]];
}

- (void)requestSpotFleet:(AWSEC2RequestSpotFleetRequest *)request
     completionHandler:(void (^)(AWSEC2RequestSpotFleetResponse *response, NSError *error))completionHandler {
    [[self requestSpotFleet:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RequestSpotFleetResponse *> * _Nonnull task) {
        AWSEC2RequestSpotFleetResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RequestSpotInstancesResult *> *)requestSpotInstances:(AWSEC2RequestSpotInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RequestSpotInstances"
                   outputClass:[AWSEC2RequestSpotInstancesResult class]];
}

- (void)requestSpotInstances:(AWSEC2RequestSpotInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2RequestSpotInstancesResult *response, NSError *error))completionHandler {
    [[self requestSpotInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RequestSpotInstancesResult *> * _Nonnull task) {
        AWSEC2RequestSpotInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)resetImageAttribute:(AWSEC2ResetImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetImageAttribute"
                   outputClass:nil];
}

- (void)resetImageAttribute:(AWSEC2ResetImageAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self resetImageAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)resetInstanceAttribute:(AWSEC2ResetInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetInstanceAttribute"
                   outputClass:nil];
}

- (void)resetInstanceAttribute:(AWSEC2ResetInstanceAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self resetInstanceAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)resetNetworkInterfaceAttribute:(AWSEC2ResetNetworkInterfaceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetNetworkInterfaceAttribute"
                   outputClass:nil];
}

- (void)resetNetworkInterfaceAttribute:(AWSEC2ResetNetworkInterfaceAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self resetNetworkInterfaceAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)resetSnapshotAttribute:(AWSEC2ResetSnapshotAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetSnapshotAttribute"
                   outputClass:nil];
}

- (void)resetSnapshotAttribute:(AWSEC2ResetSnapshotAttributeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self resetSnapshotAttribute:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RestoreAddressToClassicResult *> *)restoreAddressToClassic:(AWSEC2RestoreAddressToClassicRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreAddressToClassic"
                   outputClass:[AWSEC2RestoreAddressToClassicResult class]];
}

- (void)restoreAddressToClassic:(AWSEC2RestoreAddressToClassicRequest *)request
     completionHandler:(void (^)(AWSEC2RestoreAddressToClassicResult *response, NSError *error))completionHandler {
    [[self restoreAddressToClassic:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RestoreAddressToClassicResult *> * _Nonnull task) {
        AWSEC2RestoreAddressToClassicResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)revokeSecurityGroupEgress:(AWSEC2RevokeSecurityGroupEgressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeSecurityGroupEgress"
                   outputClass:nil];
}

- (void)revokeSecurityGroupEgress:(AWSEC2RevokeSecurityGroupEgressRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self revokeSecurityGroupEgress:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)revokeSecurityGroupIngress:(AWSEC2RevokeSecurityGroupIngressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeSecurityGroupIngress"
                   outputClass:nil];
}

- (void)revokeSecurityGroupIngress:(AWSEC2RevokeSecurityGroupIngressRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self revokeSecurityGroupIngress:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2Reservation *> *)runInstances:(AWSEC2RunInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RunInstances"
                   outputClass:[AWSEC2Reservation class]];
}

- (void)runInstances:(AWSEC2RunInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2Reservation *response, NSError *error))completionHandler {
    [[self runInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2Reservation *> * _Nonnull task) {
        AWSEC2Reservation *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RunScheduledInstancesResult *> *)runScheduledInstances:(AWSEC2RunScheduledInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RunScheduledInstances"
                   outputClass:[AWSEC2RunScheduledInstancesResult class]];
}

- (void)runScheduledInstances:(AWSEC2RunScheduledInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2RunScheduledInstancesResult *response, NSError *error))completionHandler {
    [[self runScheduledInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RunScheduledInstancesResult *> * _Nonnull task) {
        AWSEC2RunScheduledInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2StartInstancesResult *> *)startInstances:(AWSEC2StartInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartInstances"
                   outputClass:[AWSEC2StartInstancesResult class]];
}

- (void)startInstances:(AWSEC2StartInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2StartInstancesResult *response, NSError *error))completionHandler {
    [[self startInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2StartInstancesResult *> * _Nonnull task) {
        AWSEC2StartInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2StopInstancesResult *> *)stopInstances:(AWSEC2StopInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StopInstances"
                   outputClass:[AWSEC2StopInstancesResult class]];
}

- (void)stopInstances:(AWSEC2StopInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2StopInstancesResult *response, NSError *error))completionHandler {
    [[self stopInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2StopInstancesResult *> * _Nonnull task) {
        AWSEC2StopInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2TerminateInstancesResult *> *)terminateInstances:(AWSEC2TerminateInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TerminateInstances"
                   outputClass:[AWSEC2TerminateInstancesResult class]];
}

- (void)terminateInstances:(AWSEC2TerminateInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2TerminateInstancesResult *response, NSError *error))completionHandler {
    [[self terminateInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2TerminateInstancesResult *> * _Nonnull task) {
        AWSEC2TerminateInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)unassignPrivateIpAddresses:(AWSEC2UnassignPrivateIpAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UnassignPrivateIpAddresses"
                   outputClass:nil];
}

- (void)unassignPrivateIpAddresses:(AWSEC2UnassignPrivateIpAddressesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self unassignPrivateIpAddresses:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2UnmonitorInstancesResult *> *)unmonitorInstances:(AWSEC2UnmonitorInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UnmonitorInstances"
                   outputClass:[AWSEC2UnmonitorInstancesResult class]];
}

- (void)unmonitorInstances:(AWSEC2UnmonitorInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2UnmonitorInstancesResult *response, NSError *error))completionHandler {
    [[self unmonitorInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2UnmonitorInstancesResult *> * _Nonnull task) {
        AWSEC2UnmonitorInstancesResult *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
