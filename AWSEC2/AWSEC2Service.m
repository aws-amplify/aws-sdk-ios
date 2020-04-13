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

#import "AWSEC2Service.h"
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
NSString *const AWSEC2SDKVersion = @"2.13.2";


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
                                           reason:@"The service configuration is `nil`. You need to configure `awsconfiguration.json`, `Info.plist` or set `defaultServiceConfiguration` before using this method."
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

- (AWSTask<AWSEC2AcceptReservedInstancesExchangeQuoteResult *> *)acceptReservedInstancesExchangeQuote:(AWSEC2AcceptReservedInstancesExchangeQuoteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AcceptReservedInstancesExchangeQuote"
                   outputClass:[AWSEC2AcceptReservedInstancesExchangeQuoteResult class]];
}

- (void)acceptReservedInstancesExchangeQuote:(AWSEC2AcceptReservedInstancesExchangeQuoteRequest *)request
     completionHandler:(void (^)(AWSEC2AcceptReservedInstancesExchangeQuoteResult *response, NSError *error))completionHandler {
    [[self acceptReservedInstancesExchangeQuote:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AcceptReservedInstancesExchangeQuoteResult *> * _Nonnull task) {
        AWSEC2AcceptReservedInstancesExchangeQuoteResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AcceptTransitGatewayPeeringAttachmentResult *> *)acceptTransitGatewayPeeringAttachment:(AWSEC2AcceptTransitGatewayPeeringAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AcceptTransitGatewayPeeringAttachment"
                   outputClass:[AWSEC2AcceptTransitGatewayPeeringAttachmentResult class]];
}

- (void)acceptTransitGatewayPeeringAttachment:(AWSEC2AcceptTransitGatewayPeeringAttachmentRequest *)request
     completionHandler:(void (^)(AWSEC2AcceptTransitGatewayPeeringAttachmentResult *response, NSError *error))completionHandler {
    [[self acceptTransitGatewayPeeringAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AcceptTransitGatewayPeeringAttachmentResult *> * _Nonnull task) {
        AWSEC2AcceptTransitGatewayPeeringAttachmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AcceptTransitGatewayVpcAttachmentResult *> *)acceptTransitGatewayVpcAttachment:(AWSEC2AcceptTransitGatewayVpcAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AcceptTransitGatewayVpcAttachment"
                   outputClass:[AWSEC2AcceptTransitGatewayVpcAttachmentResult class]];
}

- (void)acceptTransitGatewayVpcAttachment:(AWSEC2AcceptTransitGatewayVpcAttachmentRequest *)request
     completionHandler:(void (^)(AWSEC2AcceptTransitGatewayVpcAttachmentResult *response, NSError *error))completionHandler {
    [[self acceptTransitGatewayVpcAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AcceptTransitGatewayVpcAttachmentResult *> * _Nonnull task) {
        AWSEC2AcceptTransitGatewayVpcAttachmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AcceptVpcEndpointConnectionsResult *> *)acceptVpcEndpointConnections:(AWSEC2AcceptVpcEndpointConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AcceptVpcEndpointConnections"
                   outputClass:[AWSEC2AcceptVpcEndpointConnectionsResult class]];
}

- (void)acceptVpcEndpointConnections:(AWSEC2AcceptVpcEndpointConnectionsRequest *)request
     completionHandler:(void (^)(AWSEC2AcceptVpcEndpointConnectionsResult *response, NSError *error))completionHandler {
    [[self acceptVpcEndpointConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AcceptVpcEndpointConnectionsResult *> * _Nonnull task) {
        AWSEC2AcceptVpcEndpointConnectionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AdvertiseByoipCidrResult *> *)advertiseByoipCidr:(AWSEC2AdvertiseByoipCidrRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AdvertiseByoipCidr"
                   outputClass:[AWSEC2AdvertiseByoipCidrResult class]];
}

- (void)advertiseByoipCidr:(AWSEC2AdvertiseByoipCidrRequest *)request
     completionHandler:(void (^)(AWSEC2AdvertiseByoipCidrResult *response, NSError *error))completionHandler {
    [[self advertiseByoipCidr:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AdvertiseByoipCidrResult *> * _Nonnull task) {
        AWSEC2AdvertiseByoipCidrResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult *> *)applySecurityGroupsToClientVpnTargetNetwork:(AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ApplySecurityGroupsToClientVpnTargetNetwork"
                   outputClass:[AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult class]];
}

- (void)applySecurityGroupsToClientVpnTargetNetwork:(AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkRequest *)request
     completionHandler:(void (^)(AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult *response, NSError *error))completionHandler {
    [[self applySecurityGroupsToClientVpnTargetNetwork:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult *> * _Nonnull task) {
        AWSEC2ApplySecurityGroupsToClientVpnTargetNetworkResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AssignIpv6AddressesResult *> *)assignIpv6Addresses:(AWSEC2AssignIpv6AddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssignIpv6Addresses"
                   outputClass:[AWSEC2AssignIpv6AddressesResult class]];
}

- (void)assignIpv6Addresses:(AWSEC2AssignIpv6AddressesRequest *)request
     completionHandler:(void (^)(AWSEC2AssignIpv6AddressesResult *response, NSError *error))completionHandler {
    [[self assignIpv6Addresses:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AssignIpv6AddressesResult *> * _Nonnull task) {
        AWSEC2AssignIpv6AddressesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AssignPrivateIpAddressesResult *> *)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssignPrivateIpAddresses"
                   outputClass:[AWSEC2AssignPrivateIpAddressesResult class]];
}

- (void)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request
     completionHandler:(void (^)(AWSEC2AssignPrivateIpAddressesResult *response, NSError *error))completionHandler {
    [[self assignPrivateIpAddresses:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AssignPrivateIpAddressesResult *> * _Nonnull task) {
        AWSEC2AssignPrivateIpAddressesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AssociateClientVpnTargetNetworkResult *> *)associateClientVpnTargetNetwork:(AWSEC2AssociateClientVpnTargetNetworkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateClientVpnTargetNetwork"
                   outputClass:[AWSEC2AssociateClientVpnTargetNetworkResult class]];
}

- (void)associateClientVpnTargetNetwork:(AWSEC2AssociateClientVpnTargetNetworkRequest *)request
     completionHandler:(void (^)(AWSEC2AssociateClientVpnTargetNetworkResult *response, NSError *error))completionHandler {
    [[self associateClientVpnTargetNetwork:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AssociateClientVpnTargetNetworkResult *> * _Nonnull task) {
        AWSEC2AssociateClientVpnTargetNetworkResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AssociateIamInstanceProfileResult *> *)associateIamInstanceProfile:(AWSEC2AssociateIamInstanceProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateIamInstanceProfile"
                   outputClass:[AWSEC2AssociateIamInstanceProfileResult class]];
}

- (void)associateIamInstanceProfile:(AWSEC2AssociateIamInstanceProfileRequest *)request
     completionHandler:(void (^)(AWSEC2AssociateIamInstanceProfileResult *response, NSError *error))completionHandler {
    [[self associateIamInstanceProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AssociateIamInstanceProfileResult *> * _Nonnull task) {
        AWSEC2AssociateIamInstanceProfileResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AssociateSubnetCidrBlockResult *> *)associateSubnetCidrBlock:(AWSEC2AssociateSubnetCidrBlockRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateSubnetCidrBlock"
                   outputClass:[AWSEC2AssociateSubnetCidrBlockResult class]];
}

- (void)associateSubnetCidrBlock:(AWSEC2AssociateSubnetCidrBlockRequest *)request
     completionHandler:(void (^)(AWSEC2AssociateSubnetCidrBlockResult *response, NSError *error))completionHandler {
    [[self associateSubnetCidrBlock:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AssociateSubnetCidrBlockResult *> * _Nonnull task) {
        AWSEC2AssociateSubnetCidrBlockResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AssociateTransitGatewayMulticastDomainResult *> *)associateTransitGatewayMulticastDomain:(AWSEC2AssociateTransitGatewayMulticastDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateTransitGatewayMulticastDomain"
                   outputClass:[AWSEC2AssociateTransitGatewayMulticastDomainResult class]];
}

- (void)associateTransitGatewayMulticastDomain:(AWSEC2AssociateTransitGatewayMulticastDomainRequest *)request
     completionHandler:(void (^)(AWSEC2AssociateTransitGatewayMulticastDomainResult *response, NSError *error))completionHandler {
    [[self associateTransitGatewayMulticastDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AssociateTransitGatewayMulticastDomainResult *> * _Nonnull task) {
        AWSEC2AssociateTransitGatewayMulticastDomainResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AssociateTransitGatewayRouteTableResult *> *)associateTransitGatewayRouteTable:(AWSEC2AssociateTransitGatewayRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateTransitGatewayRouteTable"
                   outputClass:[AWSEC2AssociateTransitGatewayRouteTableResult class]];
}

- (void)associateTransitGatewayRouteTable:(AWSEC2AssociateTransitGatewayRouteTableRequest *)request
     completionHandler:(void (^)(AWSEC2AssociateTransitGatewayRouteTableResult *response, NSError *error))completionHandler {
    [[self associateTransitGatewayRouteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AssociateTransitGatewayRouteTableResult *> * _Nonnull task) {
        AWSEC2AssociateTransitGatewayRouteTableResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AssociateVpcCidrBlockResult *> *)associateVpcCidrBlock:(AWSEC2AssociateVpcCidrBlockRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateVpcCidrBlock"
                   outputClass:[AWSEC2AssociateVpcCidrBlockResult class]];
}

- (void)associateVpcCidrBlock:(AWSEC2AssociateVpcCidrBlockRequest *)request
     completionHandler:(void (^)(AWSEC2AssociateVpcCidrBlockResult *response, NSError *error))completionHandler {
    [[self associateVpcCidrBlock:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AssociateVpcCidrBlockResult *> * _Nonnull task) {
        AWSEC2AssociateVpcCidrBlockResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2AuthorizeClientVpnIngressResult *> *)authorizeClientVpnIngress:(AWSEC2AuthorizeClientVpnIngressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeClientVpnIngress"
                   outputClass:[AWSEC2AuthorizeClientVpnIngressResult class]];
}

- (void)authorizeClientVpnIngress:(AWSEC2AuthorizeClientVpnIngressRequest *)request
     completionHandler:(void (^)(AWSEC2AuthorizeClientVpnIngressResult *response, NSError *error))completionHandler {
    [[self authorizeClientVpnIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2AuthorizeClientVpnIngressResult *> * _Nonnull task) {
        AWSEC2AuthorizeClientVpnIngressResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CancelCapacityReservationResult *> *)cancelCapacityReservation:(AWSEC2CancelCapacityReservationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelCapacityReservation"
                   outputClass:[AWSEC2CancelCapacityReservationResult class]];
}

- (void)cancelCapacityReservation:(AWSEC2CancelCapacityReservationRequest *)request
     completionHandler:(void (^)(AWSEC2CancelCapacityReservationResult *response, NSError *error))completionHandler {
    [[self cancelCapacityReservation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CancelCapacityReservationResult *> * _Nonnull task) {
        AWSEC2CancelCapacityReservationResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ReplicateFpgaImageResult *> *)replicateFpgaImage:(AWSEC2ReplicateFpgaImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyFpgaImage"
                   outputClass:[AWSEC2ReplicateFpgaImageResult class]];
}

- (void)replicateFpgaImage:(AWSEC2ReplicateFpgaImageRequest *)request
     completionHandler:(void (^)(AWSEC2ReplicateFpgaImageResult *response, NSError *error))completionHandler {
    [[self replicateFpgaImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ReplicateFpgaImageResult *> * _Nonnull task) {
        AWSEC2ReplicateFpgaImageResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateCapacityReservationResult *> *)createCapacityReservation:(AWSEC2CreateCapacityReservationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCapacityReservation"
                   outputClass:[AWSEC2CreateCapacityReservationResult class]];
}

- (void)createCapacityReservation:(AWSEC2CreateCapacityReservationRequest *)request
     completionHandler:(void (^)(AWSEC2CreateCapacityReservationResult *response, NSError *error))completionHandler {
    [[self createCapacityReservation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateCapacityReservationResult *> * _Nonnull task) {
        AWSEC2CreateCapacityReservationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateClientVpnEndpointResult *> *)createClientVpnEndpoint:(AWSEC2CreateClientVpnEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateClientVpnEndpoint"
                   outputClass:[AWSEC2CreateClientVpnEndpointResult class]];
}

- (void)createClientVpnEndpoint:(AWSEC2CreateClientVpnEndpointRequest *)request
     completionHandler:(void (^)(AWSEC2CreateClientVpnEndpointResult *response, NSError *error))completionHandler {
    [[self createClientVpnEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateClientVpnEndpointResult *> * _Nonnull task) {
        AWSEC2CreateClientVpnEndpointResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateClientVpnRouteResult *> *)createClientVpnRoute:(AWSEC2CreateClientVpnRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateClientVpnRoute"
                   outputClass:[AWSEC2CreateClientVpnRouteResult class]];
}

- (void)createClientVpnRoute:(AWSEC2CreateClientVpnRouteRequest *)request
     completionHandler:(void (^)(AWSEC2CreateClientVpnRouteResult *response, NSError *error))completionHandler {
    [[self createClientVpnRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateClientVpnRouteResult *> * _Nonnull task) {
        AWSEC2CreateClientVpnRouteResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateDefaultSubnetResult *> *)createDefaultSubnet:(AWSEC2CreateDefaultSubnetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDefaultSubnet"
                   outputClass:[AWSEC2CreateDefaultSubnetResult class]];
}

- (void)createDefaultSubnet:(AWSEC2CreateDefaultSubnetRequest *)request
     completionHandler:(void (^)(AWSEC2CreateDefaultSubnetResult *response, NSError *error))completionHandler {
    [[self createDefaultSubnet:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateDefaultSubnetResult *> * _Nonnull task) {
        AWSEC2CreateDefaultSubnetResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateDefaultVpcResult *> *)createDefaultVpc:(AWSEC2CreateDefaultVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDefaultVpc"
                   outputClass:[AWSEC2CreateDefaultVpcResult class]];
}

- (void)createDefaultVpc:(AWSEC2CreateDefaultVpcRequest *)request
     completionHandler:(void (^)(AWSEC2CreateDefaultVpcResult *response, NSError *error))completionHandler {
    [[self createDefaultVpc:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateDefaultVpcResult *> * _Nonnull task) {
        AWSEC2CreateDefaultVpcResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateEgressOnlyInternetGatewayResult *> *)createEgressOnlyInternetGateway:(AWSEC2CreateEgressOnlyInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateEgressOnlyInternetGateway"
                   outputClass:[AWSEC2CreateEgressOnlyInternetGatewayResult class]];
}

- (void)createEgressOnlyInternetGateway:(AWSEC2CreateEgressOnlyInternetGatewayRequest *)request
     completionHandler:(void (^)(AWSEC2CreateEgressOnlyInternetGatewayResult *response, NSError *error))completionHandler {
    [[self createEgressOnlyInternetGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateEgressOnlyInternetGatewayResult *> * _Nonnull task) {
        AWSEC2CreateEgressOnlyInternetGatewayResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateFleetResult *> *)createFleet:(AWSEC2CreateFleetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateFleet"
                   outputClass:[AWSEC2CreateFleetResult class]];
}

- (void)createFleet:(AWSEC2CreateFleetRequest *)request
     completionHandler:(void (^)(AWSEC2CreateFleetResult *response, NSError *error))completionHandler {
    [[self createFleet:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateFleetResult *> * _Nonnull task) {
        AWSEC2CreateFleetResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateFpgaImageResult *> *)createFpgaImage:(AWSEC2CreateFpgaImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateFpgaImage"
                   outputClass:[AWSEC2CreateFpgaImageResult class]];
}

- (void)createFpgaImage:(AWSEC2CreateFpgaImageRequest *)request
     completionHandler:(void (^)(AWSEC2CreateFpgaImageResult *response, NSError *error))completionHandler {
    [[self createFpgaImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateFpgaImageResult *> * _Nonnull task) {
        AWSEC2CreateFpgaImageResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateLaunchTemplateResult *> *)createLaunchTemplate:(AWSEC2CreateLaunchTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLaunchTemplate"
                   outputClass:[AWSEC2CreateLaunchTemplateResult class]];
}

- (void)createLaunchTemplate:(AWSEC2CreateLaunchTemplateRequest *)request
     completionHandler:(void (^)(AWSEC2CreateLaunchTemplateResult *response, NSError *error))completionHandler {
    [[self createLaunchTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateLaunchTemplateResult *> * _Nonnull task) {
        AWSEC2CreateLaunchTemplateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateLaunchTemplateVersionResult *> *)createLaunchTemplateVersion:(AWSEC2CreateLaunchTemplateVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLaunchTemplateVersion"
                   outputClass:[AWSEC2CreateLaunchTemplateVersionResult class]];
}

- (void)createLaunchTemplateVersion:(AWSEC2CreateLaunchTemplateVersionRequest *)request
     completionHandler:(void (^)(AWSEC2CreateLaunchTemplateVersionResult *response, NSError *error))completionHandler {
    [[self createLaunchTemplateVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateLaunchTemplateVersionResult *> * _Nonnull task) {
        AWSEC2CreateLaunchTemplateVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateLocalGatewayRouteResult *> *)createLocalGatewayRoute:(AWSEC2CreateLocalGatewayRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLocalGatewayRoute"
                   outputClass:[AWSEC2CreateLocalGatewayRouteResult class]];
}

- (void)createLocalGatewayRoute:(AWSEC2CreateLocalGatewayRouteRequest *)request
     completionHandler:(void (^)(AWSEC2CreateLocalGatewayRouteResult *response, NSError *error))completionHandler {
    [[self createLocalGatewayRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateLocalGatewayRouteResult *> * _Nonnull task) {
        AWSEC2CreateLocalGatewayRouteResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult *> *)createLocalGatewayRouteTableVpcAssociation:(AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLocalGatewayRouteTableVpcAssociation"
                   outputClass:[AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult class]];
}

- (void)createLocalGatewayRouteTableVpcAssociation:(AWSEC2CreateLocalGatewayRouteTableVpcAssociationRequest *)request
     completionHandler:(void (^)(AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult *response, NSError *error))completionHandler {
    [[self createLocalGatewayRouteTableVpcAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult *> * _Nonnull task) {
        AWSEC2CreateLocalGatewayRouteTableVpcAssociationResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateNetworkInterfacePermissionResult *> *)createNetworkInterfacePermission:(AWSEC2CreateNetworkInterfacePermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNetworkInterfacePermission"
                   outputClass:[AWSEC2CreateNetworkInterfacePermissionResult class]];
}

- (void)createNetworkInterfacePermission:(AWSEC2CreateNetworkInterfacePermissionRequest *)request
     completionHandler:(void (^)(AWSEC2CreateNetworkInterfacePermissionResult *response, NSError *error))completionHandler {
    [[self createNetworkInterfacePermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateNetworkInterfacePermissionResult *> * _Nonnull task) {
        AWSEC2CreateNetworkInterfacePermissionResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateSnapshotsResult *> *)createSnapshots:(AWSEC2CreateSnapshotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSnapshots"
                   outputClass:[AWSEC2CreateSnapshotsResult class]];
}

- (void)createSnapshots:(AWSEC2CreateSnapshotsRequest *)request
     completionHandler:(void (^)(AWSEC2CreateSnapshotsResult *response, NSError *error))completionHandler {
    [[self createSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateSnapshotsResult *> * _Nonnull task) {
        AWSEC2CreateSnapshotsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateTrafficMirrorFilterResult *> *)createTrafficMirrorFilter:(AWSEC2CreateTrafficMirrorFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTrafficMirrorFilter"
                   outputClass:[AWSEC2CreateTrafficMirrorFilterResult class]];
}

- (void)createTrafficMirrorFilter:(AWSEC2CreateTrafficMirrorFilterRequest *)request
     completionHandler:(void (^)(AWSEC2CreateTrafficMirrorFilterResult *response, NSError *error))completionHandler {
    [[self createTrafficMirrorFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateTrafficMirrorFilterResult *> * _Nonnull task) {
        AWSEC2CreateTrafficMirrorFilterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateTrafficMirrorFilterRuleResult *> *)createTrafficMirrorFilterRule:(AWSEC2CreateTrafficMirrorFilterRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTrafficMirrorFilterRule"
                   outputClass:[AWSEC2CreateTrafficMirrorFilterRuleResult class]];
}

- (void)createTrafficMirrorFilterRule:(AWSEC2CreateTrafficMirrorFilterRuleRequest *)request
     completionHandler:(void (^)(AWSEC2CreateTrafficMirrorFilterRuleResult *response, NSError *error))completionHandler {
    [[self createTrafficMirrorFilterRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateTrafficMirrorFilterRuleResult *> * _Nonnull task) {
        AWSEC2CreateTrafficMirrorFilterRuleResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateTrafficMirrorSessionResult *> *)createTrafficMirrorSession:(AWSEC2CreateTrafficMirrorSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTrafficMirrorSession"
                   outputClass:[AWSEC2CreateTrafficMirrorSessionResult class]];
}

- (void)createTrafficMirrorSession:(AWSEC2CreateTrafficMirrorSessionRequest *)request
     completionHandler:(void (^)(AWSEC2CreateTrafficMirrorSessionResult *response, NSError *error))completionHandler {
    [[self createTrafficMirrorSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateTrafficMirrorSessionResult *> * _Nonnull task) {
        AWSEC2CreateTrafficMirrorSessionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateTrafficMirrorTargetResult *> *)createTrafficMirrorTarget:(AWSEC2CreateTrafficMirrorTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTrafficMirrorTarget"
                   outputClass:[AWSEC2CreateTrafficMirrorTargetResult class]];
}

- (void)createTrafficMirrorTarget:(AWSEC2CreateTrafficMirrorTargetRequest *)request
     completionHandler:(void (^)(AWSEC2CreateTrafficMirrorTargetResult *response, NSError *error))completionHandler {
    [[self createTrafficMirrorTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateTrafficMirrorTargetResult *> * _Nonnull task) {
        AWSEC2CreateTrafficMirrorTargetResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateTransitGatewayResult *> *)createTransitGateway:(AWSEC2CreateTransitGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTransitGateway"
                   outputClass:[AWSEC2CreateTransitGatewayResult class]];
}

- (void)createTransitGateway:(AWSEC2CreateTransitGatewayRequest *)request
     completionHandler:(void (^)(AWSEC2CreateTransitGatewayResult *response, NSError *error))completionHandler {
    [[self createTransitGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateTransitGatewayResult *> * _Nonnull task) {
        AWSEC2CreateTransitGatewayResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateTransitGatewayMulticastDomainResult *> *)createTransitGatewayMulticastDomain:(AWSEC2CreateTransitGatewayMulticastDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTransitGatewayMulticastDomain"
                   outputClass:[AWSEC2CreateTransitGatewayMulticastDomainResult class]];
}

- (void)createTransitGatewayMulticastDomain:(AWSEC2CreateTransitGatewayMulticastDomainRequest *)request
     completionHandler:(void (^)(AWSEC2CreateTransitGatewayMulticastDomainResult *response, NSError *error))completionHandler {
    [[self createTransitGatewayMulticastDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateTransitGatewayMulticastDomainResult *> * _Nonnull task) {
        AWSEC2CreateTransitGatewayMulticastDomainResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateTransitGatewayPeeringAttachmentResult *> *)createTransitGatewayPeeringAttachment:(AWSEC2CreateTransitGatewayPeeringAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTransitGatewayPeeringAttachment"
                   outputClass:[AWSEC2CreateTransitGatewayPeeringAttachmentResult class]];
}

- (void)createTransitGatewayPeeringAttachment:(AWSEC2CreateTransitGatewayPeeringAttachmentRequest *)request
     completionHandler:(void (^)(AWSEC2CreateTransitGatewayPeeringAttachmentResult *response, NSError *error))completionHandler {
    [[self createTransitGatewayPeeringAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateTransitGatewayPeeringAttachmentResult *> * _Nonnull task) {
        AWSEC2CreateTransitGatewayPeeringAttachmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateTransitGatewayRouteResult *> *)createTransitGatewayRoute:(AWSEC2CreateTransitGatewayRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTransitGatewayRoute"
                   outputClass:[AWSEC2CreateTransitGatewayRouteResult class]];
}

- (void)createTransitGatewayRoute:(AWSEC2CreateTransitGatewayRouteRequest *)request
     completionHandler:(void (^)(AWSEC2CreateTransitGatewayRouteResult *response, NSError *error))completionHandler {
    [[self createTransitGatewayRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateTransitGatewayRouteResult *> * _Nonnull task) {
        AWSEC2CreateTransitGatewayRouteResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateTransitGatewayRouteTableResult *> *)createTransitGatewayRouteTable:(AWSEC2CreateTransitGatewayRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTransitGatewayRouteTable"
                   outputClass:[AWSEC2CreateTransitGatewayRouteTableResult class]];
}

- (void)createTransitGatewayRouteTable:(AWSEC2CreateTransitGatewayRouteTableRequest *)request
     completionHandler:(void (^)(AWSEC2CreateTransitGatewayRouteTableResult *response, NSError *error))completionHandler {
    [[self createTransitGatewayRouteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateTransitGatewayRouteTableResult *> * _Nonnull task) {
        AWSEC2CreateTransitGatewayRouteTableResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateTransitGatewayVpcAttachmentResult *> *)createTransitGatewayVpcAttachment:(AWSEC2CreateTransitGatewayVpcAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTransitGatewayVpcAttachment"
                   outputClass:[AWSEC2CreateTransitGatewayVpcAttachmentResult class]];
}

- (void)createTransitGatewayVpcAttachment:(AWSEC2CreateTransitGatewayVpcAttachmentRequest *)request
     completionHandler:(void (^)(AWSEC2CreateTransitGatewayVpcAttachmentResult *response, NSError *error))completionHandler {
    [[self createTransitGatewayVpcAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateTransitGatewayVpcAttachmentResult *> * _Nonnull task) {
        AWSEC2CreateTransitGatewayVpcAttachmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateVpcEndpointConnectionNotificationResult *> *)createVpcEndpointConnectionNotification:(AWSEC2CreateVpcEndpointConnectionNotificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpcEndpointConnectionNotification"
                   outputClass:[AWSEC2CreateVpcEndpointConnectionNotificationResult class]];
}

- (void)createVpcEndpointConnectionNotification:(AWSEC2CreateVpcEndpointConnectionNotificationRequest *)request
     completionHandler:(void (^)(AWSEC2CreateVpcEndpointConnectionNotificationResult *response, NSError *error))completionHandler {
    [[self createVpcEndpointConnectionNotification:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateVpcEndpointConnectionNotificationResult *> * _Nonnull task) {
        AWSEC2CreateVpcEndpointConnectionNotificationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2CreateVpcEndpointServiceConfigurationResult *> *)createVpcEndpointServiceConfiguration:(AWSEC2CreateVpcEndpointServiceConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpcEndpointServiceConfiguration"
                   outputClass:[AWSEC2CreateVpcEndpointServiceConfigurationResult class]];
}

- (void)createVpcEndpointServiceConfiguration:(AWSEC2CreateVpcEndpointServiceConfigurationRequest *)request
     completionHandler:(void (^)(AWSEC2CreateVpcEndpointServiceConfigurationResult *response, NSError *error))completionHandler {
    [[self createVpcEndpointServiceConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2CreateVpcEndpointServiceConfigurationResult *> * _Nonnull task) {
        AWSEC2CreateVpcEndpointServiceConfigurationResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteClientVpnEndpointResult *> *)deleteClientVpnEndpoint:(AWSEC2DeleteClientVpnEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteClientVpnEndpoint"
                   outputClass:[AWSEC2DeleteClientVpnEndpointResult class]];
}

- (void)deleteClientVpnEndpoint:(AWSEC2DeleteClientVpnEndpointRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteClientVpnEndpointResult *response, NSError *error))completionHandler {
    [[self deleteClientVpnEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteClientVpnEndpointResult *> * _Nonnull task) {
        AWSEC2DeleteClientVpnEndpointResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteClientVpnRouteResult *> *)deleteClientVpnRoute:(AWSEC2DeleteClientVpnRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteClientVpnRoute"
                   outputClass:[AWSEC2DeleteClientVpnRouteResult class]];
}

- (void)deleteClientVpnRoute:(AWSEC2DeleteClientVpnRouteRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteClientVpnRouteResult *response, NSError *error))completionHandler {
    [[self deleteClientVpnRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteClientVpnRouteResult *> * _Nonnull task) {
        AWSEC2DeleteClientVpnRouteResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteEgressOnlyInternetGatewayResult *> *)deleteEgressOnlyInternetGateway:(AWSEC2DeleteEgressOnlyInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteEgressOnlyInternetGateway"
                   outputClass:[AWSEC2DeleteEgressOnlyInternetGatewayResult class]];
}

- (void)deleteEgressOnlyInternetGateway:(AWSEC2DeleteEgressOnlyInternetGatewayRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteEgressOnlyInternetGatewayResult *response, NSError *error))completionHandler {
    [[self deleteEgressOnlyInternetGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteEgressOnlyInternetGatewayResult *> * _Nonnull task) {
        AWSEC2DeleteEgressOnlyInternetGatewayResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteFleetsResult *> *)deleteFleets:(AWSEC2DeleteFleetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteFleets"
                   outputClass:[AWSEC2DeleteFleetsResult class]];
}

- (void)deleteFleets:(AWSEC2DeleteFleetsRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteFleetsResult *response, NSError *error))completionHandler {
    [[self deleteFleets:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteFleetsResult *> * _Nonnull task) {
        AWSEC2DeleteFleetsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteFpgaImageResult *> *)deleteFpgaImage:(AWSEC2DeleteFpgaImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteFpgaImage"
                   outputClass:[AWSEC2DeleteFpgaImageResult class]];
}

- (void)deleteFpgaImage:(AWSEC2DeleteFpgaImageRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteFpgaImageResult *response, NSError *error))completionHandler {
    [[self deleteFpgaImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteFpgaImageResult *> * _Nonnull task) {
        AWSEC2DeleteFpgaImageResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteLaunchTemplateResult *> *)deleteLaunchTemplate:(AWSEC2DeleteLaunchTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLaunchTemplate"
                   outputClass:[AWSEC2DeleteLaunchTemplateResult class]];
}

- (void)deleteLaunchTemplate:(AWSEC2DeleteLaunchTemplateRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteLaunchTemplateResult *response, NSError *error))completionHandler {
    [[self deleteLaunchTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteLaunchTemplateResult *> * _Nonnull task) {
        AWSEC2DeleteLaunchTemplateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteLaunchTemplateVersionsResult *> *)deleteLaunchTemplateVersions:(AWSEC2DeleteLaunchTemplateVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLaunchTemplateVersions"
                   outputClass:[AWSEC2DeleteLaunchTemplateVersionsResult class]];
}

- (void)deleteLaunchTemplateVersions:(AWSEC2DeleteLaunchTemplateVersionsRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteLaunchTemplateVersionsResult *response, NSError *error))completionHandler {
    [[self deleteLaunchTemplateVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteLaunchTemplateVersionsResult *> * _Nonnull task) {
        AWSEC2DeleteLaunchTemplateVersionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteLocalGatewayRouteResult *> *)deleteLocalGatewayRoute:(AWSEC2DeleteLocalGatewayRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLocalGatewayRoute"
                   outputClass:[AWSEC2DeleteLocalGatewayRouteResult class]];
}

- (void)deleteLocalGatewayRoute:(AWSEC2DeleteLocalGatewayRouteRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteLocalGatewayRouteResult *response, NSError *error))completionHandler {
    [[self deleteLocalGatewayRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteLocalGatewayRouteResult *> * _Nonnull task) {
        AWSEC2DeleteLocalGatewayRouteResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult *> *)deleteLocalGatewayRouteTableVpcAssociation:(AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLocalGatewayRouteTableVpcAssociation"
                   outputClass:[AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult class]];
}

- (void)deleteLocalGatewayRouteTableVpcAssociation:(AWSEC2DeleteLocalGatewayRouteTableVpcAssociationRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult *response, NSError *error))completionHandler {
    [[self deleteLocalGatewayRouteTableVpcAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult *> * _Nonnull task) {
        AWSEC2DeleteLocalGatewayRouteTableVpcAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteNetworkInterfacePermissionResult *> *)deleteNetworkInterfacePermission:(AWSEC2DeleteNetworkInterfacePermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNetworkInterfacePermission"
                   outputClass:[AWSEC2DeleteNetworkInterfacePermissionResult class]];
}

- (void)deleteNetworkInterfacePermission:(AWSEC2DeleteNetworkInterfacePermissionRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteNetworkInterfacePermissionResult *response, NSError *error))completionHandler {
    [[self deleteNetworkInterfacePermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteNetworkInterfacePermissionResult *> * _Nonnull task) {
        AWSEC2DeleteNetworkInterfacePermissionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteQueuedReservedInstancesResult *> *)deleteQueuedReservedInstances:(AWSEC2DeleteQueuedReservedInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteQueuedReservedInstances"
                   outputClass:[AWSEC2DeleteQueuedReservedInstancesResult class]];
}

- (void)deleteQueuedReservedInstances:(AWSEC2DeleteQueuedReservedInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteQueuedReservedInstancesResult *response, NSError *error))completionHandler {
    [[self deleteQueuedReservedInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteQueuedReservedInstancesResult *> * _Nonnull task) {
        AWSEC2DeleteQueuedReservedInstancesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteTrafficMirrorFilterResult *> *)deleteTrafficMirrorFilter:(AWSEC2DeleteTrafficMirrorFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTrafficMirrorFilter"
                   outputClass:[AWSEC2DeleteTrafficMirrorFilterResult class]];
}

- (void)deleteTrafficMirrorFilter:(AWSEC2DeleteTrafficMirrorFilterRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteTrafficMirrorFilterResult *response, NSError *error))completionHandler {
    [[self deleteTrafficMirrorFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteTrafficMirrorFilterResult *> * _Nonnull task) {
        AWSEC2DeleteTrafficMirrorFilterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteTrafficMirrorFilterRuleResult *> *)deleteTrafficMirrorFilterRule:(AWSEC2DeleteTrafficMirrorFilterRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTrafficMirrorFilterRule"
                   outputClass:[AWSEC2DeleteTrafficMirrorFilterRuleResult class]];
}

- (void)deleteTrafficMirrorFilterRule:(AWSEC2DeleteTrafficMirrorFilterRuleRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteTrafficMirrorFilterRuleResult *response, NSError *error))completionHandler {
    [[self deleteTrafficMirrorFilterRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteTrafficMirrorFilterRuleResult *> * _Nonnull task) {
        AWSEC2DeleteTrafficMirrorFilterRuleResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteTrafficMirrorSessionResult *> *)deleteTrafficMirrorSession:(AWSEC2DeleteTrafficMirrorSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTrafficMirrorSession"
                   outputClass:[AWSEC2DeleteTrafficMirrorSessionResult class]];
}

- (void)deleteTrafficMirrorSession:(AWSEC2DeleteTrafficMirrorSessionRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteTrafficMirrorSessionResult *response, NSError *error))completionHandler {
    [[self deleteTrafficMirrorSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteTrafficMirrorSessionResult *> * _Nonnull task) {
        AWSEC2DeleteTrafficMirrorSessionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteTrafficMirrorTargetResult *> *)deleteTrafficMirrorTarget:(AWSEC2DeleteTrafficMirrorTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTrafficMirrorTarget"
                   outputClass:[AWSEC2DeleteTrafficMirrorTargetResult class]];
}

- (void)deleteTrafficMirrorTarget:(AWSEC2DeleteTrafficMirrorTargetRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteTrafficMirrorTargetResult *response, NSError *error))completionHandler {
    [[self deleteTrafficMirrorTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteTrafficMirrorTargetResult *> * _Nonnull task) {
        AWSEC2DeleteTrafficMirrorTargetResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteTransitGatewayResult *> *)deleteTransitGateway:(AWSEC2DeleteTransitGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTransitGateway"
                   outputClass:[AWSEC2DeleteTransitGatewayResult class]];
}

- (void)deleteTransitGateway:(AWSEC2DeleteTransitGatewayRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteTransitGatewayResult *response, NSError *error))completionHandler {
    [[self deleteTransitGateway:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteTransitGatewayResult *> * _Nonnull task) {
        AWSEC2DeleteTransitGatewayResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteTransitGatewayMulticastDomainResult *> *)deleteTransitGatewayMulticastDomain:(AWSEC2DeleteTransitGatewayMulticastDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTransitGatewayMulticastDomain"
                   outputClass:[AWSEC2DeleteTransitGatewayMulticastDomainResult class]];
}

- (void)deleteTransitGatewayMulticastDomain:(AWSEC2DeleteTransitGatewayMulticastDomainRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteTransitGatewayMulticastDomainResult *response, NSError *error))completionHandler {
    [[self deleteTransitGatewayMulticastDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteTransitGatewayMulticastDomainResult *> * _Nonnull task) {
        AWSEC2DeleteTransitGatewayMulticastDomainResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteTransitGatewayPeeringAttachmentResult *> *)deleteTransitGatewayPeeringAttachment:(AWSEC2DeleteTransitGatewayPeeringAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTransitGatewayPeeringAttachment"
                   outputClass:[AWSEC2DeleteTransitGatewayPeeringAttachmentResult class]];
}

- (void)deleteTransitGatewayPeeringAttachment:(AWSEC2DeleteTransitGatewayPeeringAttachmentRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteTransitGatewayPeeringAttachmentResult *response, NSError *error))completionHandler {
    [[self deleteTransitGatewayPeeringAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteTransitGatewayPeeringAttachmentResult *> * _Nonnull task) {
        AWSEC2DeleteTransitGatewayPeeringAttachmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteTransitGatewayRouteResult *> *)deleteTransitGatewayRoute:(AWSEC2DeleteTransitGatewayRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTransitGatewayRoute"
                   outputClass:[AWSEC2DeleteTransitGatewayRouteResult class]];
}

- (void)deleteTransitGatewayRoute:(AWSEC2DeleteTransitGatewayRouteRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteTransitGatewayRouteResult *response, NSError *error))completionHandler {
    [[self deleteTransitGatewayRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteTransitGatewayRouteResult *> * _Nonnull task) {
        AWSEC2DeleteTransitGatewayRouteResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteTransitGatewayRouteTableResult *> *)deleteTransitGatewayRouteTable:(AWSEC2DeleteTransitGatewayRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTransitGatewayRouteTable"
                   outputClass:[AWSEC2DeleteTransitGatewayRouteTableResult class]];
}

- (void)deleteTransitGatewayRouteTable:(AWSEC2DeleteTransitGatewayRouteTableRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteTransitGatewayRouteTableResult *response, NSError *error))completionHandler {
    [[self deleteTransitGatewayRouteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteTransitGatewayRouteTableResult *> * _Nonnull task) {
        AWSEC2DeleteTransitGatewayRouteTableResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteTransitGatewayVpcAttachmentResult *> *)deleteTransitGatewayVpcAttachment:(AWSEC2DeleteTransitGatewayVpcAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTransitGatewayVpcAttachment"
                   outputClass:[AWSEC2DeleteTransitGatewayVpcAttachmentResult class]];
}

- (void)deleteTransitGatewayVpcAttachment:(AWSEC2DeleteTransitGatewayVpcAttachmentRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteTransitGatewayVpcAttachmentResult *response, NSError *error))completionHandler {
    [[self deleteTransitGatewayVpcAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteTransitGatewayVpcAttachmentResult *> * _Nonnull task) {
        AWSEC2DeleteTransitGatewayVpcAttachmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteVpcEndpointConnectionNotificationsResult *> *)deleteVpcEndpointConnectionNotifications:(AWSEC2DeleteVpcEndpointConnectionNotificationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpcEndpointConnectionNotifications"
                   outputClass:[AWSEC2DeleteVpcEndpointConnectionNotificationsResult class]];
}

- (void)deleteVpcEndpointConnectionNotifications:(AWSEC2DeleteVpcEndpointConnectionNotificationsRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteVpcEndpointConnectionNotificationsResult *response, NSError *error))completionHandler {
    [[self deleteVpcEndpointConnectionNotifications:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteVpcEndpointConnectionNotificationsResult *> * _Nonnull task) {
        AWSEC2DeleteVpcEndpointConnectionNotificationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeleteVpcEndpointServiceConfigurationsResult *> *)deleteVpcEndpointServiceConfigurations:(AWSEC2DeleteVpcEndpointServiceConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpcEndpointServiceConfigurations"
                   outputClass:[AWSEC2DeleteVpcEndpointServiceConfigurationsResult class]];
}

- (void)deleteVpcEndpointServiceConfigurations:(AWSEC2DeleteVpcEndpointServiceConfigurationsRequest *)request
     completionHandler:(void (^)(AWSEC2DeleteVpcEndpointServiceConfigurationsResult *response, NSError *error))completionHandler {
    [[self deleteVpcEndpointServiceConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeleteVpcEndpointServiceConfigurationsResult *> * _Nonnull task) {
        AWSEC2DeleteVpcEndpointServiceConfigurationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeprovisionByoipCidrResult *> *)deprovisionByoipCidr:(AWSEC2DeprovisionByoipCidrRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeprovisionByoipCidr"
                   outputClass:[AWSEC2DeprovisionByoipCidrResult class]];
}

- (void)deprovisionByoipCidr:(AWSEC2DeprovisionByoipCidrRequest *)request
     completionHandler:(void (^)(AWSEC2DeprovisionByoipCidrResult *response, NSError *error))completionHandler {
    [[self deprovisionByoipCidr:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeprovisionByoipCidrResult *> * _Nonnull task) {
        AWSEC2DeprovisionByoipCidrResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult *> *)deregisterTransitGatewayMulticastGroupMembers:(AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterTransitGatewayMulticastGroupMembers"
                   outputClass:[AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult class]];
}

- (void)deregisterTransitGatewayMulticastGroupMembers:(AWSEC2DeregisterTransitGatewayMulticastGroupMembersRequest *)request
     completionHandler:(void (^)(AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult *response, NSError *error))completionHandler {
    [[self deregisterTransitGatewayMulticastGroupMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult *> * _Nonnull task) {
        AWSEC2DeregisterTransitGatewayMulticastGroupMembersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult *> *)deregisterTransitGatewayMulticastGroupSources:(AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterTransitGatewayMulticastGroupSources"
                   outputClass:[AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult class]];
}

- (void)deregisterTransitGatewayMulticastGroupSources:(AWSEC2DeregisterTransitGatewayMulticastGroupSourcesRequest *)request
     completionHandler:(void (^)(AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult *response, NSError *error))completionHandler {
    [[self deregisterTransitGatewayMulticastGroupSources:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult *> * _Nonnull task) {
        AWSEC2DeregisterTransitGatewayMulticastGroupSourcesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeAggregateIdFormatResult *> *)describeAggregateIdFormat:(AWSEC2DescribeAggregateIdFormatRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAggregateIdFormat"
                   outputClass:[AWSEC2DescribeAggregateIdFormatResult class]];
}

- (void)describeAggregateIdFormat:(AWSEC2DescribeAggregateIdFormatRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeAggregateIdFormatResult *response, NSError *error))completionHandler {
    [[self describeAggregateIdFormat:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeAggregateIdFormatResult *> * _Nonnull task) {
        AWSEC2DescribeAggregateIdFormatResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeByoipCidrsResult *> *)describeByoipCidrs:(AWSEC2DescribeByoipCidrsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeByoipCidrs"
                   outputClass:[AWSEC2DescribeByoipCidrsResult class]];
}

- (void)describeByoipCidrs:(AWSEC2DescribeByoipCidrsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeByoipCidrsResult *response, NSError *error))completionHandler {
    [[self describeByoipCidrs:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeByoipCidrsResult *> * _Nonnull task) {
        AWSEC2DescribeByoipCidrsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeCapacityReservationsResult *> *)describeCapacityReservations:(AWSEC2DescribeCapacityReservationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCapacityReservations"
                   outputClass:[AWSEC2DescribeCapacityReservationsResult class]];
}

- (void)describeCapacityReservations:(AWSEC2DescribeCapacityReservationsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeCapacityReservationsResult *response, NSError *error))completionHandler {
    [[self describeCapacityReservations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeCapacityReservationsResult *> * _Nonnull task) {
        AWSEC2DescribeCapacityReservationsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeClientVpnAuthorizationRulesResult *> *)describeClientVpnAuthorizationRules:(AWSEC2DescribeClientVpnAuthorizationRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClientVpnAuthorizationRules"
                   outputClass:[AWSEC2DescribeClientVpnAuthorizationRulesResult class]];
}

- (void)describeClientVpnAuthorizationRules:(AWSEC2DescribeClientVpnAuthorizationRulesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeClientVpnAuthorizationRulesResult *response, NSError *error))completionHandler {
    [[self describeClientVpnAuthorizationRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeClientVpnAuthorizationRulesResult *> * _Nonnull task) {
        AWSEC2DescribeClientVpnAuthorizationRulesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeClientVpnConnectionsResult *> *)describeClientVpnConnections:(AWSEC2DescribeClientVpnConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClientVpnConnections"
                   outputClass:[AWSEC2DescribeClientVpnConnectionsResult class]];
}

- (void)describeClientVpnConnections:(AWSEC2DescribeClientVpnConnectionsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeClientVpnConnectionsResult *response, NSError *error))completionHandler {
    [[self describeClientVpnConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeClientVpnConnectionsResult *> * _Nonnull task) {
        AWSEC2DescribeClientVpnConnectionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeClientVpnEndpointsResult *> *)describeClientVpnEndpoints:(AWSEC2DescribeClientVpnEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClientVpnEndpoints"
                   outputClass:[AWSEC2DescribeClientVpnEndpointsResult class]];
}

- (void)describeClientVpnEndpoints:(AWSEC2DescribeClientVpnEndpointsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeClientVpnEndpointsResult *response, NSError *error))completionHandler {
    [[self describeClientVpnEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeClientVpnEndpointsResult *> * _Nonnull task) {
        AWSEC2DescribeClientVpnEndpointsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeClientVpnRoutesResult *> *)describeClientVpnRoutes:(AWSEC2DescribeClientVpnRoutesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClientVpnRoutes"
                   outputClass:[AWSEC2DescribeClientVpnRoutesResult class]];
}

- (void)describeClientVpnRoutes:(AWSEC2DescribeClientVpnRoutesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeClientVpnRoutesResult *response, NSError *error))completionHandler {
    [[self describeClientVpnRoutes:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeClientVpnRoutesResult *> * _Nonnull task) {
        AWSEC2DescribeClientVpnRoutesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeClientVpnTargetNetworksResult *> *)describeClientVpnTargetNetworks:(AWSEC2DescribeClientVpnTargetNetworksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClientVpnTargetNetworks"
                   outputClass:[AWSEC2DescribeClientVpnTargetNetworksResult class]];
}

- (void)describeClientVpnTargetNetworks:(AWSEC2DescribeClientVpnTargetNetworksRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeClientVpnTargetNetworksResult *response, NSError *error))completionHandler {
    [[self describeClientVpnTargetNetworks:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeClientVpnTargetNetworksResult *> * _Nonnull task) {
        AWSEC2DescribeClientVpnTargetNetworksResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeCoipPoolsResult *> *)describeCoipPools:(AWSEC2DescribeCoipPoolsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCoipPools"
                   outputClass:[AWSEC2DescribeCoipPoolsResult class]];
}

- (void)describeCoipPools:(AWSEC2DescribeCoipPoolsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeCoipPoolsResult *response, NSError *error))completionHandler {
    [[self describeCoipPools:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeCoipPoolsResult *> * _Nonnull task) {
        AWSEC2DescribeCoipPoolsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeEgressOnlyInternetGatewaysResult *> *)describeEgressOnlyInternetGateways:(AWSEC2DescribeEgressOnlyInternetGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEgressOnlyInternetGateways"
                   outputClass:[AWSEC2DescribeEgressOnlyInternetGatewaysResult class]];
}

- (void)describeEgressOnlyInternetGateways:(AWSEC2DescribeEgressOnlyInternetGatewaysRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeEgressOnlyInternetGatewaysResult *response, NSError *error))completionHandler {
    [[self describeEgressOnlyInternetGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeEgressOnlyInternetGatewaysResult *> * _Nonnull task) {
        AWSEC2DescribeEgressOnlyInternetGatewaysResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeElasticGpusResult *> *)describeElasticGpus:(AWSEC2DescribeElasticGpusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeElasticGpus"
                   outputClass:[AWSEC2DescribeElasticGpusResult class]];
}

- (void)describeElasticGpus:(AWSEC2DescribeElasticGpusRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeElasticGpusResult *response, NSError *error))completionHandler {
    [[self describeElasticGpus:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeElasticGpusResult *> * _Nonnull task) {
        AWSEC2DescribeElasticGpusResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeExportImageTasksResult *> *)describeExportImageTasks:(AWSEC2DescribeExportImageTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeExportImageTasks"
                   outputClass:[AWSEC2DescribeExportImageTasksResult class]];
}

- (void)describeExportImageTasks:(AWSEC2DescribeExportImageTasksRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeExportImageTasksResult *response, NSError *error))completionHandler {
    [[self describeExportImageTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeExportImageTasksResult *> * _Nonnull task) {
        AWSEC2DescribeExportImageTasksResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeFastSnapshotRestoresResult *> *)describeFastSnapshotRestores:(AWSEC2DescribeFastSnapshotRestoresRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeFastSnapshotRestores"
                   outputClass:[AWSEC2DescribeFastSnapshotRestoresResult class]];
}

- (void)describeFastSnapshotRestores:(AWSEC2DescribeFastSnapshotRestoresRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeFastSnapshotRestoresResult *response, NSError *error))completionHandler {
    [[self describeFastSnapshotRestores:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeFastSnapshotRestoresResult *> * _Nonnull task) {
        AWSEC2DescribeFastSnapshotRestoresResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeFleetHistoryResult *> *)describeFleetHistory:(AWSEC2DescribeFleetHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeFleetHistory"
                   outputClass:[AWSEC2DescribeFleetHistoryResult class]];
}

- (void)describeFleetHistory:(AWSEC2DescribeFleetHistoryRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeFleetHistoryResult *response, NSError *error))completionHandler {
    [[self describeFleetHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeFleetHistoryResult *> * _Nonnull task) {
        AWSEC2DescribeFleetHistoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeFleetInstancesResult *> *)describeFleetInstances:(AWSEC2DescribeFleetInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeFleetInstances"
                   outputClass:[AWSEC2DescribeFleetInstancesResult class]];
}

- (void)describeFleetInstances:(AWSEC2DescribeFleetInstancesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeFleetInstancesResult *response, NSError *error))completionHandler {
    [[self describeFleetInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeFleetInstancesResult *> * _Nonnull task) {
        AWSEC2DescribeFleetInstancesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeFleetsResult *> *)describeFleets:(AWSEC2DescribeFleetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeFleets"
                   outputClass:[AWSEC2DescribeFleetsResult class]];
}

- (void)describeFleets:(AWSEC2DescribeFleetsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeFleetsResult *response, NSError *error))completionHandler {
    [[self describeFleets:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeFleetsResult *> * _Nonnull task) {
        AWSEC2DescribeFleetsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeFpgaImageAttributeResult *> *)describeFpgaImageAttribute:(AWSEC2DescribeFpgaImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeFpgaImageAttribute"
                   outputClass:[AWSEC2DescribeFpgaImageAttributeResult class]];
}

- (void)describeFpgaImageAttribute:(AWSEC2DescribeFpgaImageAttributeRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeFpgaImageAttributeResult *response, NSError *error))completionHandler {
    [[self describeFpgaImageAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeFpgaImageAttributeResult *> * _Nonnull task) {
        AWSEC2DescribeFpgaImageAttributeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeFpgaImagesResult *> *)describeFpgaImages:(AWSEC2DescribeFpgaImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeFpgaImages"
                   outputClass:[AWSEC2DescribeFpgaImagesResult class]];
}

- (void)describeFpgaImages:(AWSEC2DescribeFpgaImagesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeFpgaImagesResult *response, NSError *error))completionHandler {
    [[self describeFpgaImages:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeFpgaImagesResult *> * _Nonnull task) {
        AWSEC2DescribeFpgaImagesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeHostReservationOfferingsResult *> *)describeHostReservationOfferings:(AWSEC2DescribeHostReservationOfferingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeHostReservationOfferings"
                   outputClass:[AWSEC2DescribeHostReservationOfferingsResult class]];
}

- (void)describeHostReservationOfferings:(AWSEC2DescribeHostReservationOfferingsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeHostReservationOfferingsResult *response, NSError *error))completionHandler {
    [[self describeHostReservationOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeHostReservationOfferingsResult *> * _Nonnull task) {
        AWSEC2DescribeHostReservationOfferingsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeHostReservationsResult *> *)describeHostReservations:(AWSEC2DescribeHostReservationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeHostReservations"
                   outputClass:[AWSEC2DescribeHostReservationsResult class]];
}

- (void)describeHostReservations:(AWSEC2DescribeHostReservationsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeHostReservationsResult *response, NSError *error))completionHandler {
    [[self describeHostReservations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeHostReservationsResult *> * _Nonnull task) {
        AWSEC2DescribeHostReservationsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeIamInstanceProfileAssociationsResult *> *)describeIamInstanceProfileAssociations:(AWSEC2DescribeIamInstanceProfileAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeIamInstanceProfileAssociations"
                   outputClass:[AWSEC2DescribeIamInstanceProfileAssociationsResult class]];
}

- (void)describeIamInstanceProfileAssociations:(AWSEC2DescribeIamInstanceProfileAssociationsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeIamInstanceProfileAssociationsResult *response, NSError *error))completionHandler {
    [[self describeIamInstanceProfileAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeIamInstanceProfileAssociationsResult *> * _Nonnull task) {
        AWSEC2DescribeIamInstanceProfileAssociationsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeIdentityIdFormatResult *> *)describeIdentityIdFormat:(AWSEC2DescribeIdentityIdFormatRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeIdentityIdFormat"
                   outputClass:[AWSEC2DescribeIdentityIdFormatResult class]];
}

- (void)describeIdentityIdFormat:(AWSEC2DescribeIdentityIdFormatRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeIdentityIdFormatResult *response, NSError *error))completionHandler {
    [[self describeIdentityIdFormat:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeIdentityIdFormatResult *> * _Nonnull task) {
        AWSEC2DescribeIdentityIdFormatResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeInstanceCreditSpecificationsResult *> *)describeInstanceCreditSpecifications:(AWSEC2DescribeInstanceCreditSpecificationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceCreditSpecifications"
                   outputClass:[AWSEC2DescribeInstanceCreditSpecificationsResult class]];
}

- (void)describeInstanceCreditSpecifications:(AWSEC2DescribeInstanceCreditSpecificationsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeInstanceCreditSpecificationsResult *response, NSError *error))completionHandler {
    [[self describeInstanceCreditSpecifications:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeInstanceCreditSpecificationsResult *> * _Nonnull task) {
        AWSEC2DescribeInstanceCreditSpecificationsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeInstanceTypeOfferingsResult *> *)describeInstanceTypeOfferings:(AWSEC2DescribeInstanceTypeOfferingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceTypeOfferings"
                   outputClass:[AWSEC2DescribeInstanceTypeOfferingsResult class]];
}

- (void)describeInstanceTypeOfferings:(AWSEC2DescribeInstanceTypeOfferingsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeInstanceTypeOfferingsResult *response, NSError *error))completionHandler {
    [[self describeInstanceTypeOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeInstanceTypeOfferingsResult *> * _Nonnull task) {
        AWSEC2DescribeInstanceTypeOfferingsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeInstanceTypesResult *> *)describeInstanceTypes:(AWSEC2DescribeInstanceTypesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceTypes"
                   outputClass:[AWSEC2DescribeInstanceTypesResult class]];
}

- (void)describeInstanceTypes:(AWSEC2DescribeInstanceTypesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeInstanceTypesResult *response, NSError *error))completionHandler {
    [[self describeInstanceTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeInstanceTypesResult *> * _Nonnull task) {
        AWSEC2DescribeInstanceTypesResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeIpv6PoolsResult *> *)describeIpv6Pools:(AWSEC2DescribeIpv6PoolsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeIpv6Pools"
                   outputClass:[AWSEC2DescribeIpv6PoolsResult class]];
}

- (void)describeIpv6Pools:(AWSEC2DescribeIpv6PoolsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeIpv6PoolsResult *response, NSError *error))completionHandler {
    [[self describeIpv6Pools:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeIpv6PoolsResult *> * _Nonnull task) {
        AWSEC2DescribeIpv6PoolsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeLaunchTemplateVersionsResult *> *)describeLaunchTemplateVersions:(AWSEC2DescribeLaunchTemplateVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLaunchTemplateVersions"
                   outputClass:[AWSEC2DescribeLaunchTemplateVersionsResult class]];
}

- (void)describeLaunchTemplateVersions:(AWSEC2DescribeLaunchTemplateVersionsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeLaunchTemplateVersionsResult *response, NSError *error))completionHandler {
    [[self describeLaunchTemplateVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeLaunchTemplateVersionsResult *> * _Nonnull task) {
        AWSEC2DescribeLaunchTemplateVersionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeLaunchTemplatesResult *> *)describeLaunchTemplates:(AWSEC2DescribeLaunchTemplatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLaunchTemplates"
                   outputClass:[AWSEC2DescribeLaunchTemplatesResult class]];
}

- (void)describeLaunchTemplates:(AWSEC2DescribeLaunchTemplatesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeLaunchTemplatesResult *response, NSError *error))completionHandler {
    [[self describeLaunchTemplates:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeLaunchTemplatesResult *> * _Nonnull task) {
        AWSEC2DescribeLaunchTemplatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult *> *)describeLocalGatewayRouteTableVirtualInterfaceGroupAssociations:(AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociations"
                   outputClass:[AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult class]];
}

- (void)describeLocalGatewayRouteTableVirtualInterfaceGroupAssociations:(AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult *response, NSError *error))completionHandler {
    [[self describeLocalGatewayRouteTableVirtualInterfaceGroupAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult *> * _Nonnull task) {
        AWSEC2DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult *> *)describeLocalGatewayRouteTableVpcAssociations:(AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLocalGatewayRouteTableVpcAssociations"
                   outputClass:[AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult class]];
}

- (void)describeLocalGatewayRouteTableVpcAssociations:(AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult *response, NSError *error))completionHandler {
    [[self describeLocalGatewayRouteTableVpcAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult *> * _Nonnull task) {
        AWSEC2DescribeLocalGatewayRouteTableVpcAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeLocalGatewayRouteTablesResult *> *)describeLocalGatewayRouteTables:(AWSEC2DescribeLocalGatewayRouteTablesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLocalGatewayRouteTables"
                   outputClass:[AWSEC2DescribeLocalGatewayRouteTablesResult class]];
}

- (void)describeLocalGatewayRouteTables:(AWSEC2DescribeLocalGatewayRouteTablesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeLocalGatewayRouteTablesResult *response, NSError *error))completionHandler {
    [[self describeLocalGatewayRouteTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeLocalGatewayRouteTablesResult *> * _Nonnull task) {
        AWSEC2DescribeLocalGatewayRouteTablesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult *> *)describeLocalGatewayVirtualInterfaceGroups:(AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLocalGatewayVirtualInterfaceGroups"
                   outputClass:[AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult class]];
}

- (void)describeLocalGatewayVirtualInterfaceGroups:(AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult *response, NSError *error))completionHandler {
    [[self describeLocalGatewayVirtualInterfaceGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult *> * _Nonnull task) {
        AWSEC2DescribeLocalGatewayVirtualInterfaceGroupsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeLocalGatewayVirtualInterfacesResult *> *)describeLocalGatewayVirtualInterfaces:(AWSEC2DescribeLocalGatewayVirtualInterfacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLocalGatewayVirtualInterfaces"
                   outputClass:[AWSEC2DescribeLocalGatewayVirtualInterfacesResult class]];
}

- (void)describeLocalGatewayVirtualInterfaces:(AWSEC2DescribeLocalGatewayVirtualInterfacesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeLocalGatewayVirtualInterfacesResult *response, NSError *error))completionHandler {
    [[self describeLocalGatewayVirtualInterfaces:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeLocalGatewayVirtualInterfacesResult *> * _Nonnull task) {
        AWSEC2DescribeLocalGatewayVirtualInterfacesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeLocalGatewaysResult *> *)describeLocalGateways:(AWSEC2DescribeLocalGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLocalGateways"
                   outputClass:[AWSEC2DescribeLocalGatewaysResult class]];
}

- (void)describeLocalGateways:(AWSEC2DescribeLocalGatewaysRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeLocalGatewaysResult *response, NSError *error))completionHandler {
    [[self describeLocalGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeLocalGatewaysResult *> * _Nonnull task) {
        AWSEC2DescribeLocalGatewaysResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeNetworkInterfacePermissionsResult *> *)describeNetworkInterfacePermissions:(AWSEC2DescribeNetworkInterfacePermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNetworkInterfacePermissions"
                   outputClass:[AWSEC2DescribeNetworkInterfacePermissionsResult class]];
}

- (void)describeNetworkInterfacePermissions:(AWSEC2DescribeNetworkInterfacePermissionsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeNetworkInterfacePermissionsResult *response, NSError *error))completionHandler {
    [[self describeNetworkInterfacePermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeNetworkInterfacePermissionsResult *> * _Nonnull task) {
        AWSEC2DescribeNetworkInterfacePermissionsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribePrincipalIdFormatResult *> *)describePrincipalIdFormat:(AWSEC2DescribePrincipalIdFormatRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePrincipalIdFormat"
                   outputClass:[AWSEC2DescribePrincipalIdFormatResult class]];
}

- (void)describePrincipalIdFormat:(AWSEC2DescribePrincipalIdFormatRequest *)request
     completionHandler:(void (^)(AWSEC2DescribePrincipalIdFormatResult *response, NSError *error))completionHandler {
    [[self describePrincipalIdFormat:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribePrincipalIdFormatResult *> * _Nonnull task) {
        AWSEC2DescribePrincipalIdFormatResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribePublicIpv4PoolsResult *> *)describePublicIpv4Pools:(AWSEC2DescribePublicIpv4PoolsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePublicIpv4Pools"
                   outputClass:[AWSEC2DescribePublicIpv4PoolsResult class]];
}

- (void)describePublicIpv4Pools:(AWSEC2DescribePublicIpv4PoolsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribePublicIpv4PoolsResult *response, NSError *error))completionHandler {
    [[self describePublicIpv4Pools:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribePublicIpv4PoolsResult *> * _Nonnull task) {
        AWSEC2DescribePublicIpv4PoolsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeTrafficMirrorFiltersResult *> *)describeTrafficMirrorFilters:(AWSEC2DescribeTrafficMirrorFiltersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTrafficMirrorFilters"
                   outputClass:[AWSEC2DescribeTrafficMirrorFiltersResult class]];
}

- (void)describeTrafficMirrorFilters:(AWSEC2DescribeTrafficMirrorFiltersRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeTrafficMirrorFiltersResult *response, NSError *error))completionHandler {
    [[self describeTrafficMirrorFilters:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeTrafficMirrorFiltersResult *> * _Nonnull task) {
        AWSEC2DescribeTrafficMirrorFiltersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeTrafficMirrorSessionsResult *> *)describeTrafficMirrorSessions:(AWSEC2DescribeTrafficMirrorSessionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTrafficMirrorSessions"
                   outputClass:[AWSEC2DescribeTrafficMirrorSessionsResult class]];
}

- (void)describeTrafficMirrorSessions:(AWSEC2DescribeTrafficMirrorSessionsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeTrafficMirrorSessionsResult *response, NSError *error))completionHandler {
    [[self describeTrafficMirrorSessions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeTrafficMirrorSessionsResult *> * _Nonnull task) {
        AWSEC2DescribeTrafficMirrorSessionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeTrafficMirrorTargetsResult *> *)describeTrafficMirrorTargets:(AWSEC2DescribeTrafficMirrorTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTrafficMirrorTargets"
                   outputClass:[AWSEC2DescribeTrafficMirrorTargetsResult class]];
}

- (void)describeTrafficMirrorTargets:(AWSEC2DescribeTrafficMirrorTargetsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeTrafficMirrorTargetsResult *response, NSError *error))completionHandler {
    [[self describeTrafficMirrorTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeTrafficMirrorTargetsResult *> * _Nonnull task) {
        AWSEC2DescribeTrafficMirrorTargetsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeTransitGatewayAttachmentsResult *> *)describeTransitGatewayAttachments:(AWSEC2DescribeTransitGatewayAttachmentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTransitGatewayAttachments"
                   outputClass:[AWSEC2DescribeTransitGatewayAttachmentsResult class]];
}

- (void)describeTransitGatewayAttachments:(AWSEC2DescribeTransitGatewayAttachmentsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeTransitGatewayAttachmentsResult *response, NSError *error))completionHandler {
    [[self describeTransitGatewayAttachments:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeTransitGatewayAttachmentsResult *> * _Nonnull task) {
        AWSEC2DescribeTransitGatewayAttachmentsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeTransitGatewayMulticastDomainsResult *> *)describeTransitGatewayMulticastDomains:(AWSEC2DescribeTransitGatewayMulticastDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTransitGatewayMulticastDomains"
                   outputClass:[AWSEC2DescribeTransitGatewayMulticastDomainsResult class]];
}

- (void)describeTransitGatewayMulticastDomains:(AWSEC2DescribeTransitGatewayMulticastDomainsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeTransitGatewayMulticastDomainsResult *response, NSError *error))completionHandler {
    [[self describeTransitGatewayMulticastDomains:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeTransitGatewayMulticastDomainsResult *> * _Nonnull task) {
        AWSEC2DescribeTransitGatewayMulticastDomainsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeTransitGatewayPeeringAttachmentsResult *> *)describeTransitGatewayPeeringAttachments:(AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTransitGatewayPeeringAttachments"
                   outputClass:[AWSEC2DescribeTransitGatewayPeeringAttachmentsResult class]];
}

- (void)describeTransitGatewayPeeringAttachments:(AWSEC2DescribeTransitGatewayPeeringAttachmentsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeTransitGatewayPeeringAttachmentsResult *response, NSError *error))completionHandler {
    [[self describeTransitGatewayPeeringAttachments:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeTransitGatewayPeeringAttachmentsResult *> * _Nonnull task) {
        AWSEC2DescribeTransitGatewayPeeringAttachmentsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeTransitGatewayRouteTablesResult *> *)describeTransitGatewayRouteTables:(AWSEC2DescribeTransitGatewayRouteTablesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTransitGatewayRouteTables"
                   outputClass:[AWSEC2DescribeTransitGatewayRouteTablesResult class]];
}

- (void)describeTransitGatewayRouteTables:(AWSEC2DescribeTransitGatewayRouteTablesRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeTransitGatewayRouteTablesResult *response, NSError *error))completionHandler {
    [[self describeTransitGatewayRouteTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeTransitGatewayRouteTablesResult *> * _Nonnull task) {
        AWSEC2DescribeTransitGatewayRouteTablesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeTransitGatewayVpcAttachmentsResult *> *)describeTransitGatewayVpcAttachments:(AWSEC2DescribeTransitGatewayVpcAttachmentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTransitGatewayVpcAttachments"
                   outputClass:[AWSEC2DescribeTransitGatewayVpcAttachmentsResult class]];
}

- (void)describeTransitGatewayVpcAttachments:(AWSEC2DescribeTransitGatewayVpcAttachmentsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeTransitGatewayVpcAttachmentsResult *response, NSError *error))completionHandler {
    [[self describeTransitGatewayVpcAttachments:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeTransitGatewayVpcAttachmentsResult *> * _Nonnull task) {
        AWSEC2DescribeTransitGatewayVpcAttachmentsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeTransitGatewaysResult *> *)describeTransitGateways:(AWSEC2DescribeTransitGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTransitGateways"
                   outputClass:[AWSEC2DescribeTransitGatewaysResult class]];
}

- (void)describeTransitGateways:(AWSEC2DescribeTransitGatewaysRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeTransitGatewaysResult *response, NSError *error))completionHandler {
    [[self describeTransitGateways:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeTransitGatewaysResult *> * _Nonnull task) {
        AWSEC2DescribeTransitGatewaysResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVolumesModificationsResult *> *)describeVolumesModifications:(AWSEC2DescribeVolumesModificationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVolumesModifications"
                   outputClass:[AWSEC2DescribeVolumesModificationsResult class]];
}

- (void)describeVolumesModifications:(AWSEC2DescribeVolumesModificationsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVolumesModificationsResult *response, NSError *error))completionHandler {
    [[self describeVolumesModifications:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVolumesModificationsResult *> * _Nonnull task) {
        AWSEC2DescribeVolumesModificationsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcEndpointConnectionNotificationsResult *> *)describeVpcEndpointConnectionNotifications:(AWSEC2DescribeVpcEndpointConnectionNotificationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcEndpointConnectionNotifications"
                   outputClass:[AWSEC2DescribeVpcEndpointConnectionNotificationsResult class]];
}

- (void)describeVpcEndpointConnectionNotifications:(AWSEC2DescribeVpcEndpointConnectionNotificationsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcEndpointConnectionNotificationsResult *response, NSError *error))completionHandler {
    [[self describeVpcEndpointConnectionNotifications:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcEndpointConnectionNotificationsResult *> * _Nonnull task) {
        AWSEC2DescribeVpcEndpointConnectionNotificationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcEndpointConnectionsResult *> *)describeVpcEndpointConnections:(AWSEC2DescribeVpcEndpointConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcEndpointConnections"
                   outputClass:[AWSEC2DescribeVpcEndpointConnectionsResult class]];
}

- (void)describeVpcEndpointConnections:(AWSEC2DescribeVpcEndpointConnectionsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcEndpointConnectionsResult *response, NSError *error))completionHandler {
    [[self describeVpcEndpointConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcEndpointConnectionsResult *> * _Nonnull task) {
        AWSEC2DescribeVpcEndpointConnectionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcEndpointServiceConfigurationsResult *> *)describeVpcEndpointServiceConfigurations:(AWSEC2DescribeVpcEndpointServiceConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcEndpointServiceConfigurations"
                   outputClass:[AWSEC2DescribeVpcEndpointServiceConfigurationsResult class]];
}

- (void)describeVpcEndpointServiceConfigurations:(AWSEC2DescribeVpcEndpointServiceConfigurationsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcEndpointServiceConfigurationsResult *response, NSError *error))completionHandler {
    [[self describeVpcEndpointServiceConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcEndpointServiceConfigurationsResult *> * _Nonnull task) {
        AWSEC2DescribeVpcEndpointServiceConfigurationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DescribeVpcEndpointServicePermissionsResult *> *)describeVpcEndpointServicePermissions:(AWSEC2DescribeVpcEndpointServicePermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcEndpointServicePermissions"
                   outputClass:[AWSEC2DescribeVpcEndpointServicePermissionsResult class]];
}

- (void)describeVpcEndpointServicePermissions:(AWSEC2DescribeVpcEndpointServicePermissionsRequest *)request
     completionHandler:(void (^)(AWSEC2DescribeVpcEndpointServicePermissionsResult *response, NSError *error))completionHandler {
    [[self describeVpcEndpointServicePermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DescribeVpcEndpointServicePermissionsResult *> * _Nonnull task) {
        AWSEC2DescribeVpcEndpointServicePermissionsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisableEbsEncryptionByDefaultResult *> *)disableEbsEncryptionByDefault:(AWSEC2DisableEbsEncryptionByDefaultRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableEbsEncryptionByDefault"
                   outputClass:[AWSEC2DisableEbsEncryptionByDefaultResult class]];
}

- (void)disableEbsEncryptionByDefault:(AWSEC2DisableEbsEncryptionByDefaultRequest *)request
     completionHandler:(void (^)(AWSEC2DisableEbsEncryptionByDefaultResult *response, NSError *error))completionHandler {
    [[self disableEbsEncryptionByDefault:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisableEbsEncryptionByDefaultResult *> * _Nonnull task) {
        AWSEC2DisableEbsEncryptionByDefaultResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisableFastSnapshotRestoresResult *> *)disableFastSnapshotRestores:(AWSEC2DisableFastSnapshotRestoresRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableFastSnapshotRestores"
                   outputClass:[AWSEC2DisableFastSnapshotRestoresResult class]];
}

- (void)disableFastSnapshotRestores:(AWSEC2DisableFastSnapshotRestoresRequest *)request
     completionHandler:(void (^)(AWSEC2DisableFastSnapshotRestoresResult *response, NSError *error))completionHandler {
    [[self disableFastSnapshotRestores:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisableFastSnapshotRestoresResult *> * _Nonnull task) {
        AWSEC2DisableFastSnapshotRestoresResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisableTransitGatewayRouteTablePropagationResult *> *)disableTransitGatewayRouteTablePropagation:(AWSEC2DisableTransitGatewayRouteTablePropagationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableTransitGatewayRouteTablePropagation"
                   outputClass:[AWSEC2DisableTransitGatewayRouteTablePropagationResult class]];
}

- (void)disableTransitGatewayRouteTablePropagation:(AWSEC2DisableTransitGatewayRouteTablePropagationRequest *)request
     completionHandler:(void (^)(AWSEC2DisableTransitGatewayRouteTablePropagationResult *response, NSError *error))completionHandler {
    [[self disableTransitGatewayRouteTablePropagation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisableTransitGatewayRouteTablePropagationResult *> * _Nonnull task) {
        AWSEC2DisableTransitGatewayRouteTablePropagationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisassociateClientVpnTargetNetworkResult *> *)disassociateClientVpnTargetNetwork:(AWSEC2DisassociateClientVpnTargetNetworkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateClientVpnTargetNetwork"
                   outputClass:[AWSEC2DisassociateClientVpnTargetNetworkResult class]];
}

- (void)disassociateClientVpnTargetNetwork:(AWSEC2DisassociateClientVpnTargetNetworkRequest *)request
     completionHandler:(void (^)(AWSEC2DisassociateClientVpnTargetNetworkResult *response, NSError *error))completionHandler {
    [[self disassociateClientVpnTargetNetwork:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisassociateClientVpnTargetNetworkResult *> * _Nonnull task) {
        AWSEC2DisassociateClientVpnTargetNetworkResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisassociateIamInstanceProfileResult *> *)disassociateIamInstanceProfile:(AWSEC2DisassociateIamInstanceProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateIamInstanceProfile"
                   outputClass:[AWSEC2DisassociateIamInstanceProfileResult class]];
}

- (void)disassociateIamInstanceProfile:(AWSEC2DisassociateIamInstanceProfileRequest *)request
     completionHandler:(void (^)(AWSEC2DisassociateIamInstanceProfileResult *response, NSError *error))completionHandler {
    [[self disassociateIamInstanceProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisassociateIamInstanceProfileResult *> * _Nonnull task) {
        AWSEC2DisassociateIamInstanceProfileResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisassociateSubnetCidrBlockResult *> *)disassociateSubnetCidrBlock:(AWSEC2DisassociateSubnetCidrBlockRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateSubnetCidrBlock"
                   outputClass:[AWSEC2DisassociateSubnetCidrBlockResult class]];
}

- (void)disassociateSubnetCidrBlock:(AWSEC2DisassociateSubnetCidrBlockRequest *)request
     completionHandler:(void (^)(AWSEC2DisassociateSubnetCidrBlockResult *response, NSError *error))completionHandler {
    [[self disassociateSubnetCidrBlock:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisassociateSubnetCidrBlockResult *> * _Nonnull task) {
        AWSEC2DisassociateSubnetCidrBlockResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisassociateTransitGatewayMulticastDomainResult *> *)disassociateTransitGatewayMulticastDomain:(AWSEC2DisassociateTransitGatewayMulticastDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateTransitGatewayMulticastDomain"
                   outputClass:[AWSEC2DisassociateTransitGatewayMulticastDomainResult class]];
}

- (void)disassociateTransitGatewayMulticastDomain:(AWSEC2DisassociateTransitGatewayMulticastDomainRequest *)request
     completionHandler:(void (^)(AWSEC2DisassociateTransitGatewayMulticastDomainResult *response, NSError *error))completionHandler {
    [[self disassociateTransitGatewayMulticastDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisassociateTransitGatewayMulticastDomainResult *> * _Nonnull task) {
        AWSEC2DisassociateTransitGatewayMulticastDomainResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisassociateTransitGatewayRouteTableResult *> *)disassociateTransitGatewayRouteTable:(AWSEC2DisassociateTransitGatewayRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateTransitGatewayRouteTable"
                   outputClass:[AWSEC2DisassociateTransitGatewayRouteTableResult class]];
}

- (void)disassociateTransitGatewayRouteTable:(AWSEC2DisassociateTransitGatewayRouteTableRequest *)request
     completionHandler:(void (^)(AWSEC2DisassociateTransitGatewayRouteTableResult *response, NSError *error))completionHandler {
    [[self disassociateTransitGatewayRouteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisassociateTransitGatewayRouteTableResult *> * _Nonnull task) {
        AWSEC2DisassociateTransitGatewayRouteTableResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2DisassociateVpcCidrBlockResult *> *)disassociateVpcCidrBlock:(AWSEC2DisassociateVpcCidrBlockRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateVpcCidrBlock"
                   outputClass:[AWSEC2DisassociateVpcCidrBlockResult class]];
}

- (void)disassociateVpcCidrBlock:(AWSEC2DisassociateVpcCidrBlockRequest *)request
     completionHandler:(void (^)(AWSEC2DisassociateVpcCidrBlockResult *response, NSError *error))completionHandler {
    [[self disassociateVpcCidrBlock:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2DisassociateVpcCidrBlockResult *> * _Nonnull task) {
        AWSEC2DisassociateVpcCidrBlockResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2EnableEbsEncryptionByDefaultResult *> *)enableEbsEncryptionByDefault:(AWSEC2EnableEbsEncryptionByDefaultRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableEbsEncryptionByDefault"
                   outputClass:[AWSEC2EnableEbsEncryptionByDefaultResult class]];
}

- (void)enableEbsEncryptionByDefault:(AWSEC2EnableEbsEncryptionByDefaultRequest *)request
     completionHandler:(void (^)(AWSEC2EnableEbsEncryptionByDefaultResult *response, NSError *error))completionHandler {
    [[self enableEbsEncryptionByDefault:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2EnableEbsEncryptionByDefaultResult *> * _Nonnull task) {
        AWSEC2EnableEbsEncryptionByDefaultResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2EnableFastSnapshotRestoresResult *> *)enableFastSnapshotRestores:(AWSEC2EnableFastSnapshotRestoresRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableFastSnapshotRestores"
                   outputClass:[AWSEC2EnableFastSnapshotRestoresResult class]];
}

- (void)enableFastSnapshotRestores:(AWSEC2EnableFastSnapshotRestoresRequest *)request
     completionHandler:(void (^)(AWSEC2EnableFastSnapshotRestoresResult *response, NSError *error))completionHandler {
    [[self enableFastSnapshotRestores:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2EnableFastSnapshotRestoresResult *> * _Nonnull task) {
        AWSEC2EnableFastSnapshotRestoresResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2EnableTransitGatewayRouteTablePropagationResult *> *)enableTransitGatewayRouteTablePropagation:(AWSEC2EnableTransitGatewayRouteTablePropagationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableTransitGatewayRouteTablePropagation"
                   outputClass:[AWSEC2EnableTransitGatewayRouteTablePropagationResult class]];
}

- (void)enableTransitGatewayRouteTablePropagation:(AWSEC2EnableTransitGatewayRouteTablePropagationRequest *)request
     completionHandler:(void (^)(AWSEC2EnableTransitGatewayRouteTablePropagationResult *response, NSError *error))completionHandler {
    [[self enableTransitGatewayRouteTablePropagation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2EnableTransitGatewayRouteTablePropagationResult *> * _Nonnull task) {
        AWSEC2EnableTransitGatewayRouteTablePropagationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ExportClientVpnClientCertificateRevocationListResult *> *)exportClientVpnClientCertificateRevocationList:(AWSEC2ExportClientVpnClientCertificateRevocationListRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ExportClientVpnClientCertificateRevocationList"
                   outputClass:[AWSEC2ExportClientVpnClientCertificateRevocationListResult class]];
}

- (void)exportClientVpnClientCertificateRevocationList:(AWSEC2ExportClientVpnClientCertificateRevocationListRequest *)request
     completionHandler:(void (^)(AWSEC2ExportClientVpnClientCertificateRevocationListResult *response, NSError *error))completionHandler {
    [[self exportClientVpnClientCertificateRevocationList:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ExportClientVpnClientCertificateRevocationListResult *> * _Nonnull task) {
        AWSEC2ExportClientVpnClientCertificateRevocationListResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ExportClientVpnClientConfigurationResult *> *)exportClientVpnClientConfiguration:(AWSEC2ExportClientVpnClientConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ExportClientVpnClientConfiguration"
                   outputClass:[AWSEC2ExportClientVpnClientConfigurationResult class]];
}

- (void)exportClientVpnClientConfiguration:(AWSEC2ExportClientVpnClientConfigurationRequest *)request
     completionHandler:(void (^)(AWSEC2ExportClientVpnClientConfigurationResult *response, NSError *error))completionHandler {
    [[self exportClientVpnClientConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ExportClientVpnClientConfigurationResult *> * _Nonnull task) {
        AWSEC2ExportClientVpnClientConfigurationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ExportImageResult *> *)exportImage:(AWSEC2ExportImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ExportImage"
                   outputClass:[AWSEC2ExportImageResult class]];
}

- (void)exportImage:(AWSEC2ExportImageRequest *)request
     completionHandler:(void (^)(AWSEC2ExportImageResult *response, NSError *error))completionHandler {
    [[self exportImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ExportImageResult *> * _Nonnull task) {
        AWSEC2ExportImageResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ExportTransitGatewayRoutesResult *> *)exportTransitGatewayRoutes:(AWSEC2ExportTransitGatewayRoutesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ExportTransitGatewayRoutes"
                   outputClass:[AWSEC2ExportTransitGatewayRoutesResult class]];
}

- (void)exportTransitGatewayRoutes:(AWSEC2ExportTransitGatewayRoutesRequest *)request
     completionHandler:(void (^)(AWSEC2ExportTransitGatewayRoutesResult *response, NSError *error))completionHandler {
    [[self exportTransitGatewayRoutes:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ExportTransitGatewayRoutesResult *> * _Nonnull task) {
        AWSEC2ExportTransitGatewayRoutesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetAssociatedIpv6PoolCidrsResult *> *)getAssociatedIpv6PoolCidrs:(AWSEC2GetAssociatedIpv6PoolCidrsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetAssociatedIpv6PoolCidrs"
                   outputClass:[AWSEC2GetAssociatedIpv6PoolCidrsResult class]];
}

- (void)getAssociatedIpv6PoolCidrs:(AWSEC2GetAssociatedIpv6PoolCidrsRequest *)request
     completionHandler:(void (^)(AWSEC2GetAssociatedIpv6PoolCidrsResult *response, NSError *error))completionHandler {
    [[self getAssociatedIpv6PoolCidrs:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetAssociatedIpv6PoolCidrsResult *> * _Nonnull task) {
        AWSEC2GetAssociatedIpv6PoolCidrsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetCapacityReservationUsageResult *> *)getCapacityReservationUsage:(AWSEC2GetCapacityReservationUsageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetCapacityReservationUsage"
                   outputClass:[AWSEC2GetCapacityReservationUsageResult class]];
}

- (void)getCapacityReservationUsage:(AWSEC2GetCapacityReservationUsageRequest *)request
     completionHandler:(void (^)(AWSEC2GetCapacityReservationUsageResult *response, NSError *error))completionHandler {
    [[self getCapacityReservationUsage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetCapacityReservationUsageResult *> * _Nonnull task) {
        AWSEC2GetCapacityReservationUsageResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetCoipPoolUsageResult *> *)getCoipPoolUsage:(AWSEC2GetCoipPoolUsageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetCoipPoolUsage"
                   outputClass:[AWSEC2GetCoipPoolUsageResult class]];
}

- (void)getCoipPoolUsage:(AWSEC2GetCoipPoolUsageRequest *)request
     completionHandler:(void (^)(AWSEC2GetCoipPoolUsageResult *response, NSError *error))completionHandler {
    [[self getCoipPoolUsage:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetCoipPoolUsageResult *> * _Nonnull task) {
        AWSEC2GetCoipPoolUsageResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetConsoleScreenshotResult *> *)getConsoleScreenshot:(AWSEC2GetConsoleScreenshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetConsoleScreenshot"
                   outputClass:[AWSEC2GetConsoleScreenshotResult class]];
}

- (void)getConsoleScreenshot:(AWSEC2GetConsoleScreenshotRequest *)request
     completionHandler:(void (^)(AWSEC2GetConsoleScreenshotResult *response, NSError *error))completionHandler {
    [[self getConsoleScreenshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetConsoleScreenshotResult *> * _Nonnull task) {
        AWSEC2GetConsoleScreenshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetDefaultCreditSpecificationResult *> *)getDefaultCreditSpecification:(AWSEC2GetDefaultCreditSpecificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetDefaultCreditSpecification"
                   outputClass:[AWSEC2GetDefaultCreditSpecificationResult class]];
}

- (void)getDefaultCreditSpecification:(AWSEC2GetDefaultCreditSpecificationRequest *)request
     completionHandler:(void (^)(AWSEC2GetDefaultCreditSpecificationResult *response, NSError *error))completionHandler {
    [[self getDefaultCreditSpecification:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetDefaultCreditSpecificationResult *> * _Nonnull task) {
        AWSEC2GetDefaultCreditSpecificationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetEbsDefaultKmsKeyIdResult *> *)getEbsDefaultKmsKeyId:(AWSEC2GetEbsDefaultKmsKeyIdRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetEbsDefaultKmsKeyId"
                   outputClass:[AWSEC2GetEbsDefaultKmsKeyIdResult class]];
}

- (void)getEbsDefaultKmsKeyId:(AWSEC2GetEbsDefaultKmsKeyIdRequest *)request
     completionHandler:(void (^)(AWSEC2GetEbsDefaultKmsKeyIdResult *response, NSError *error))completionHandler {
    [[self getEbsDefaultKmsKeyId:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetEbsDefaultKmsKeyIdResult *> * _Nonnull task) {
        AWSEC2GetEbsDefaultKmsKeyIdResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetEbsEncryptionByDefaultResult *> *)getEbsEncryptionByDefault:(AWSEC2GetEbsEncryptionByDefaultRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetEbsEncryptionByDefault"
                   outputClass:[AWSEC2GetEbsEncryptionByDefaultResult class]];
}

- (void)getEbsEncryptionByDefault:(AWSEC2GetEbsEncryptionByDefaultRequest *)request
     completionHandler:(void (^)(AWSEC2GetEbsEncryptionByDefaultResult *response, NSError *error))completionHandler {
    [[self getEbsEncryptionByDefault:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetEbsEncryptionByDefaultResult *> * _Nonnull task) {
        AWSEC2GetEbsEncryptionByDefaultResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetHostReservationPurchasePreviewResult *> *)getHostReservationPurchasePreview:(AWSEC2GetHostReservationPurchasePreviewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetHostReservationPurchasePreview"
                   outputClass:[AWSEC2GetHostReservationPurchasePreviewResult class]];
}

- (void)getHostReservationPurchasePreview:(AWSEC2GetHostReservationPurchasePreviewRequest *)request
     completionHandler:(void (^)(AWSEC2GetHostReservationPurchasePreviewResult *response, NSError *error))completionHandler {
    [[self getHostReservationPurchasePreview:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetHostReservationPurchasePreviewResult *> * _Nonnull task) {
        AWSEC2GetHostReservationPurchasePreviewResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetLaunchTemplateDataResult *> *)getLaunchTemplateData:(AWSEC2GetLaunchTemplateDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetLaunchTemplateData"
                   outputClass:[AWSEC2GetLaunchTemplateDataResult class]];
}

- (void)getLaunchTemplateData:(AWSEC2GetLaunchTemplateDataRequest *)request
     completionHandler:(void (^)(AWSEC2GetLaunchTemplateDataResult *response, NSError *error))completionHandler {
    [[self getLaunchTemplateData:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetLaunchTemplateDataResult *> * _Nonnull task) {
        AWSEC2GetLaunchTemplateDataResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetReservedInstancesExchangeQuoteResult *> *)getReservedInstancesExchangeQuote:(AWSEC2GetReservedInstancesExchangeQuoteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetReservedInstancesExchangeQuote"
                   outputClass:[AWSEC2GetReservedInstancesExchangeQuoteResult class]];
}

- (void)getReservedInstancesExchangeQuote:(AWSEC2GetReservedInstancesExchangeQuoteRequest *)request
     completionHandler:(void (^)(AWSEC2GetReservedInstancesExchangeQuoteResult *response, NSError *error))completionHandler {
    [[self getReservedInstancesExchangeQuote:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetReservedInstancesExchangeQuoteResult *> * _Nonnull task) {
        AWSEC2GetReservedInstancesExchangeQuoteResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetTransitGatewayAttachmentPropagationsResult *> *)getTransitGatewayAttachmentPropagations:(AWSEC2GetTransitGatewayAttachmentPropagationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetTransitGatewayAttachmentPropagations"
                   outputClass:[AWSEC2GetTransitGatewayAttachmentPropagationsResult class]];
}

- (void)getTransitGatewayAttachmentPropagations:(AWSEC2GetTransitGatewayAttachmentPropagationsRequest *)request
     completionHandler:(void (^)(AWSEC2GetTransitGatewayAttachmentPropagationsResult *response, NSError *error))completionHandler {
    [[self getTransitGatewayAttachmentPropagations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetTransitGatewayAttachmentPropagationsResult *> * _Nonnull task) {
        AWSEC2GetTransitGatewayAttachmentPropagationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetTransitGatewayMulticastDomainAssociationsResult *> *)getTransitGatewayMulticastDomainAssociations:(AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetTransitGatewayMulticastDomainAssociations"
                   outputClass:[AWSEC2GetTransitGatewayMulticastDomainAssociationsResult class]];
}

- (void)getTransitGatewayMulticastDomainAssociations:(AWSEC2GetTransitGatewayMulticastDomainAssociationsRequest *)request
     completionHandler:(void (^)(AWSEC2GetTransitGatewayMulticastDomainAssociationsResult *response, NSError *error))completionHandler {
    [[self getTransitGatewayMulticastDomainAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetTransitGatewayMulticastDomainAssociationsResult *> * _Nonnull task) {
        AWSEC2GetTransitGatewayMulticastDomainAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetTransitGatewayRouteTableAssociationsResult *> *)getTransitGatewayRouteTableAssociations:(AWSEC2GetTransitGatewayRouteTableAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetTransitGatewayRouteTableAssociations"
                   outputClass:[AWSEC2GetTransitGatewayRouteTableAssociationsResult class]];
}

- (void)getTransitGatewayRouteTableAssociations:(AWSEC2GetTransitGatewayRouteTableAssociationsRequest *)request
     completionHandler:(void (^)(AWSEC2GetTransitGatewayRouteTableAssociationsResult *response, NSError *error))completionHandler {
    [[self getTransitGatewayRouteTableAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetTransitGatewayRouteTableAssociationsResult *> * _Nonnull task) {
        AWSEC2GetTransitGatewayRouteTableAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2GetTransitGatewayRouteTablePropagationsResult *> *)getTransitGatewayRouteTablePropagations:(AWSEC2GetTransitGatewayRouteTablePropagationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetTransitGatewayRouteTablePropagations"
                   outputClass:[AWSEC2GetTransitGatewayRouteTablePropagationsResult class]];
}

- (void)getTransitGatewayRouteTablePropagations:(AWSEC2GetTransitGatewayRouteTablePropagationsRequest *)request
     completionHandler:(void (^)(AWSEC2GetTransitGatewayRouteTablePropagationsResult *response, NSError *error))completionHandler {
    [[self getTransitGatewayRouteTablePropagations:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2GetTransitGatewayRouteTablePropagationsResult *> * _Nonnull task) {
        AWSEC2GetTransitGatewayRouteTablePropagationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ImportClientVpnClientCertificateRevocationListResult *> *)importClientVpnClientCertificateRevocationList:(AWSEC2ImportClientVpnClientCertificateRevocationListRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportClientVpnClientCertificateRevocationList"
                   outputClass:[AWSEC2ImportClientVpnClientCertificateRevocationListResult class]];
}

- (void)importClientVpnClientCertificateRevocationList:(AWSEC2ImportClientVpnClientCertificateRevocationListRequest *)request
     completionHandler:(void (^)(AWSEC2ImportClientVpnClientCertificateRevocationListResult *response, NSError *error))completionHandler {
    [[self importClientVpnClientCertificateRevocationList:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ImportClientVpnClientCertificateRevocationListResult *> * _Nonnull task) {
        AWSEC2ImportClientVpnClientCertificateRevocationListResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyAvailabilityZoneGroupResult *> *)modifyAvailabilityZoneGroup:(AWSEC2ModifyAvailabilityZoneGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyAvailabilityZoneGroup"
                   outputClass:[AWSEC2ModifyAvailabilityZoneGroupResult class]];
}

- (void)modifyAvailabilityZoneGroup:(AWSEC2ModifyAvailabilityZoneGroupRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyAvailabilityZoneGroupResult *response, NSError *error))completionHandler {
    [[self modifyAvailabilityZoneGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyAvailabilityZoneGroupResult *> * _Nonnull task) {
        AWSEC2ModifyAvailabilityZoneGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyCapacityReservationResult *> *)modifyCapacityReservation:(AWSEC2ModifyCapacityReservationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyCapacityReservation"
                   outputClass:[AWSEC2ModifyCapacityReservationResult class]];
}

- (void)modifyCapacityReservation:(AWSEC2ModifyCapacityReservationRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyCapacityReservationResult *response, NSError *error))completionHandler {
    [[self modifyCapacityReservation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyCapacityReservationResult *> * _Nonnull task) {
        AWSEC2ModifyCapacityReservationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyClientVpnEndpointResult *> *)modifyClientVpnEndpoint:(AWSEC2ModifyClientVpnEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyClientVpnEndpoint"
                   outputClass:[AWSEC2ModifyClientVpnEndpointResult class]];
}

- (void)modifyClientVpnEndpoint:(AWSEC2ModifyClientVpnEndpointRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyClientVpnEndpointResult *response, NSError *error))completionHandler {
    [[self modifyClientVpnEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyClientVpnEndpointResult *> * _Nonnull task) {
        AWSEC2ModifyClientVpnEndpointResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyDefaultCreditSpecificationResult *> *)modifyDefaultCreditSpecification:(AWSEC2ModifyDefaultCreditSpecificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDefaultCreditSpecification"
                   outputClass:[AWSEC2ModifyDefaultCreditSpecificationResult class]];
}

- (void)modifyDefaultCreditSpecification:(AWSEC2ModifyDefaultCreditSpecificationRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyDefaultCreditSpecificationResult *response, NSError *error))completionHandler {
    [[self modifyDefaultCreditSpecification:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyDefaultCreditSpecificationResult *> * _Nonnull task) {
        AWSEC2ModifyDefaultCreditSpecificationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyEbsDefaultKmsKeyIdResult *> *)modifyEbsDefaultKmsKeyId:(AWSEC2ModifyEbsDefaultKmsKeyIdRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyEbsDefaultKmsKeyId"
                   outputClass:[AWSEC2ModifyEbsDefaultKmsKeyIdResult class]];
}

- (void)modifyEbsDefaultKmsKeyId:(AWSEC2ModifyEbsDefaultKmsKeyIdRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyEbsDefaultKmsKeyIdResult *response, NSError *error))completionHandler {
    [[self modifyEbsDefaultKmsKeyId:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyEbsDefaultKmsKeyIdResult *> * _Nonnull task) {
        AWSEC2ModifyEbsDefaultKmsKeyIdResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyFleetResult *> *)modifyFleet:(AWSEC2ModifyFleetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyFleet"
                   outputClass:[AWSEC2ModifyFleetResult class]];
}

- (void)modifyFleet:(AWSEC2ModifyFleetRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyFleetResult *response, NSError *error))completionHandler {
    [[self modifyFleet:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyFleetResult *> * _Nonnull task) {
        AWSEC2ModifyFleetResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyFpgaImageAttributeResult *> *)modifyFpgaImageAttribute:(AWSEC2ModifyFpgaImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyFpgaImageAttribute"
                   outputClass:[AWSEC2ModifyFpgaImageAttributeResult class]];
}

- (void)modifyFpgaImageAttribute:(AWSEC2ModifyFpgaImageAttributeRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyFpgaImageAttributeResult *response, NSError *error))completionHandler {
    [[self modifyFpgaImageAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyFpgaImageAttributeResult *> * _Nonnull task) {
        AWSEC2ModifyFpgaImageAttributeResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyIdentityIdFormat:(AWSEC2ModifyIdentityIdFormatRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyIdentityIdFormat"
                   outputClass:nil];
}

- (void)modifyIdentityIdFormat:(AWSEC2ModifyIdentityIdFormatRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyIdentityIdFormat:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyInstanceCapacityReservationAttributesResult *> *)modifyInstanceCapacityReservationAttributes:(AWSEC2ModifyInstanceCapacityReservationAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyInstanceCapacityReservationAttributes"
                   outputClass:[AWSEC2ModifyInstanceCapacityReservationAttributesResult class]];
}

- (void)modifyInstanceCapacityReservationAttributes:(AWSEC2ModifyInstanceCapacityReservationAttributesRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyInstanceCapacityReservationAttributesResult *response, NSError *error))completionHandler {
    [[self modifyInstanceCapacityReservationAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyInstanceCapacityReservationAttributesResult *> * _Nonnull task) {
        AWSEC2ModifyInstanceCapacityReservationAttributesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyInstanceCreditSpecificationResult *> *)modifyInstanceCreditSpecification:(AWSEC2ModifyInstanceCreditSpecificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyInstanceCreditSpecification"
                   outputClass:[AWSEC2ModifyInstanceCreditSpecificationResult class]];
}

- (void)modifyInstanceCreditSpecification:(AWSEC2ModifyInstanceCreditSpecificationRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyInstanceCreditSpecificationResult *response, NSError *error))completionHandler {
    [[self modifyInstanceCreditSpecification:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyInstanceCreditSpecificationResult *> * _Nonnull task) {
        AWSEC2ModifyInstanceCreditSpecificationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyInstanceEventStartTimeResult *> *)modifyInstanceEventStartTime:(AWSEC2ModifyInstanceEventStartTimeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyInstanceEventStartTime"
                   outputClass:[AWSEC2ModifyInstanceEventStartTimeResult class]];
}

- (void)modifyInstanceEventStartTime:(AWSEC2ModifyInstanceEventStartTimeRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyInstanceEventStartTimeResult *response, NSError *error))completionHandler {
    [[self modifyInstanceEventStartTime:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyInstanceEventStartTimeResult *> * _Nonnull task) {
        AWSEC2ModifyInstanceEventStartTimeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyInstanceMetadataOptionsResult *> *)modifyInstanceMetadataOptions:(AWSEC2ModifyInstanceMetadataOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyInstanceMetadataOptions"
                   outputClass:[AWSEC2ModifyInstanceMetadataOptionsResult class]];
}

- (void)modifyInstanceMetadataOptions:(AWSEC2ModifyInstanceMetadataOptionsRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyInstanceMetadataOptionsResult *response, NSError *error))completionHandler {
    [[self modifyInstanceMetadataOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyInstanceMetadataOptionsResult *> * _Nonnull task) {
        AWSEC2ModifyInstanceMetadataOptionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyLaunchTemplateResult *> *)modifyLaunchTemplate:(AWSEC2ModifyLaunchTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyLaunchTemplate"
                   outputClass:[AWSEC2ModifyLaunchTemplateResult class]];
}

- (void)modifyLaunchTemplate:(AWSEC2ModifyLaunchTemplateRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyLaunchTemplateResult *response, NSError *error))completionHandler {
    [[self modifyLaunchTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyLaunchTemplateResult *> * _Nonnull task) {
        AWSEC2ModifyLaunchTemplateResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult *> *)modifyTrafficMirrorFilterNetworkServices:(AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyTrafficMirrorFilterNetworkServices"
                   outputClass:[AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult class]];
}

- (void)modifyTrafficMirrorFilterNetworkServices:(AWSEC2ModifyTrafficMirrorFilterNetworkServicesRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult *response, NSError *error))completionHandler {
    [[self modifyTrafficMirrorFilterNetworkServices:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult *> * _Nonnull task) {
        AWSEC2ModifyTrafficMirrorFilterNetworkServicesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyTrafficMirrorFilterRuleResult *> *)modifyTrafficMirrorFilterRule:(AWSEC2ModifyTrafficMirrorFilterRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyTrafficMirrorFilterRule"
                   outputClass:[AWSEC2ModifyTrafficMirrorFilterRuleResult class]];
}

- (void)modifyTrafficMirrorFilterRule:(AWSEC2ModifyTrafficMirrorFilterRuleRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyTrafficMirrorFilterRuleResult *response, NSError *error))completionHandler {
    [[self modifyTrafficMirrorFilterRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyTrafficMirrorFilterRuleResult *> * _Nonnull task) {
        AWSEC2ModifyTrafficMirrorFilterRuleResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyTrafficMirrorSessionResult *> *)modifyTrafficMirrorSession:(AWSEC2ModifyTrafficMirrorSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyTrafficMirrorSession"
                   outputClass:[AWSEC2ModifyTrafficMirrorSessionResult class]];
}

- (void)modifyTrafficMirrorSession:(AWSEC2ModifyTrafficMirrorSessionRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyTrafficMirrorSessionResult *response, NSError *error))completionHandler {
    [[self modifyTrafficMirrorSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyTrafficMirrorSessionResult *> * _Nonnull task) {
        AWSEC2ModifyTrafficMirrorSessionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyTransitGatewayVpcAttachmentResult *> *)modifyTransitGatewayVpcAttachment:(AWSEC2ModifyTransitGatewayVpcAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyTransitGatewayVpcAttachment"
                   outputClass:[AWSEC2ModifyTransitGatewayVpcAttachmentResult class]];
}

- (void)modifyTransitGatewayVpcAttachment:(AWSEC2ModifyTransitGatewayVpcAttachmentRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyTransitGatewayVpcAttachmentResult *response, NSError *error))completionHandler {
    [[self modifyTransitGatewayVpcAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyTransitGatewayVpcAttachmentResult *> * _Nonnull task) {
        AWSEC2ModifyTransitGatewayVpcAttachmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyVolumeResult *> *)modifyVolume:(AWSEC2ModifyVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVolume"
                   outputClass:[AWSEC2ModifyVolumeResult class]];
}

- (void)modifyVolume:(AWSEC2ModifyVolumeRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyVolumeResult *response, NSError *error))completionHandler {
    [[self modifyVolume:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyVolumeResult *> * _Nonnull task) {
        AWSEC2ModifyVolumeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyVpcEndpointConnectionNotificationResult *> *)modifyVpcEndpointConnectionNotification:(AWSEC2ModifyVpcEndpointConnectionNotificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpcEndpointConnectionNotification"
                   outputClass:[AWSEC2ModifyVpcEndpointConnectionNotificationResult class]];
}

- (void)modifyVpcEndpointConnectionNotification:(AWSEC2ModifyVpcEndpointConnectionNotificationRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyVpcEndpointConnectionNotificationResult *response, NSError *error))completionHandler {
    [[self modifyVpcEndpointConnectionNotification:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyVpcEndpointConnectionNotificationResult *> * _Nonnull task) {
        AWSEC2ModifyVpcEndpointConnectionNotificationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyVpcEndpointServiceConfigurationResult *> *)modifyVpcEndpointServiceConfiguration:(AWSEC2ModifyVpcEndpointServiceConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpcEndpointServiceConfiguration"
                   outputClass:[AWSEC2ModifyVpcEndpointServiceConfigurationResult class]];
}

- (void)modifyVpcEndpointServiceConfiguration:(AWSEC2ModifyVpcEndpointServiceConfigurationRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyVpcEndpointServiceConfigurationResult *response, NSError *error))completionHandler {
    [[self modifyVpcEndpointServiceConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyVpcEndpointServiceConfigurationResult *> * _Nonnull task) {
        AWSEC2ModifyVpcEndpointServiceConfigurationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyVpcEndpointServicePermissionsResult *> *)modifyVpcEndpointServicePermissions:(AWSEC2ModifyVpcEndpointServicePermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpcEndpointServicePermissions"
                   outputClass:[AWSEC2ModifyVpcEndpointServicePermissionsResult class]];
}

- (void)modifyVpcEndpointServicePermissions:(AWSEC2ModifyVpcEndpointServicePermissionsRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyVpcEndpointServicePermissionsResult *response, NSError *error))completionHandler {
    [[self modifyVpcEndpointServicePermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyVpcEndpointServicePermissionsResult *> * _Nonnull task) {
        AWSEC2ModifyVpcEndpointServicePermissionsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyVpcTenancyResult *> *)modifyVpcTenancy:(AWSEC2ModifyVpcTenancyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpcTenancy"
                   outputClass:[AWSEC2ModifyVpcTenancyResult class]];
}

- (void)modifyVpcTenancy:(AWSEC2ModifyVpcTenancyRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyVpcTenancyResult *response, NSError *error))completionHandler {
    [[self modifyVpcTenancy:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyVpcTenancyResult *> * _Nonnull task) {
        AWSEC2ModifyVpcTenancyResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyVpnConnectionResult *> *)modifyVpnConnection:(AWSEC2ModifyVpnConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpnConnection"
                   outputClass:[AWSEC2ModifyVpnConnectionResult class]];
}

- (void)modifyVpnConnection:(AWSEC2ModifyVpnConnectionRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyVpnConnectionResult *response, NSError *error))completionHandler {
    [[self modifyVpnConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyVpnConnectionResult *> * _Nonnull task) {
        AWSEC2ModifyVpnConnectionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyVpnTunnelCertificateResult *> *)modifyVpnTunnelCertificate:(AWSEC2ModifyVpnTunnelCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpnTunnelCertificate"
                   outputClass:[AWSEC2ModifyVpnTunnelCertificateResult class]];
}

- (void)modifyVpnTunnelCertificate:(AWSEC2ModifyVpnTunnelCertificateRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyVpnTunnelCertificateResult *response, NSError *error))completionHandler {
    [[self modifyVpnTunnelCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyVpnTunnelCertificateResult *> * _Nonnull task) {
        AWSEC2ModifyVpnTunnelCertificateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ModifyVpnTunnelOptionsResult *> *)modifyVpnTunnelOptions:(AWSEC2ModifyVpnTunnelOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpnTunnelOptions"
                   outputClass:[AWSEC2ModifyVpnTunnelOptionsResult class]];
}

- (void)modifyVpnTunnelOptions:(AWSEC2ModifyVpnTunnelOptionsRequest *)request
     completionHandler:(void (^)(AWSEC2ModifyVpnTunnelOptionsResult *response, NSError *error))completionHandler {
    [[self modifyVpnTunnelOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ModifyVpnTunnelOptionsResult *> * _Nonnull task) {
        AWSEC2ModifyVpnTunnelOptionsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ProvisionByoipCidrResult *> *)provisionByoipCidr:(AWSEC2ProvisionByoipCidrRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ProvisionByoipCidr"
                   outputClass:[AWSEC2ProvisionByoipCidrResult class]];
}

- (void)provisionByoipCidr:(AWSEC2ProvisionByoipCidrRequest *)request
     completionHandler:(void (^)(AWSEC2ProvisionByoipCidrResult *response, NSError *error))completionHandler {
    [[self provisionByoipCidr:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ProvisionByoipCidrResult *> * _Nonnull task) {
        AWSEC2ProvisionByoipCidrResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2PurchaseHostReservationResult *> *)purchaseHostReservation:(AWSEC2PurchaseHostReservationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PurchaseHostReservation"
                   outputClass:[AWSEC2PurchaseHostReservationResult class]];
}

- (void)purchaseHostReservation:(AWSEC2PurchaseHostReservationRequest *)request
     completionHandler:(void (^)(AWSEC2PurchaseHostReservationResult *response, NSError *error))completionHandler {
    [[self purchaseHostReservation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2PurchaseHostReservationResult *> * _Nonnull task) {
        AWSEC2PurchaseHostReservationResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RegisterTransitGatewayMulticastGroupMembersResult *> *)registerTransitGatewayMulticastGroupMembers:(AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterTransitGatewayMulticastGroupMembers"
                   outputClass:[AWSEC2RegisterTransitGatewayMulticastGroupMembersResult class]];
}

- (void)registerTransitGatewayMulticastGroupMembers:(AWSEC2RegisterTransitGatewayMulticastGroupMembersRequest *)request
     completionHandler:(void (^)(AWSEC2RegisterTransitGatewayMulticastGroupMembersResult *response, NSError *error))completionHandler {
    [[self registerTransitGatewayMulticastGroupMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RegisterTransitGatewayMulticastGroupMembersResult *> * _Nonnull task) {
        AWSEC2RegisterTransitGatewayMulticastGroupMembersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult *> *)registerTransitGatewayMulticastGroupSources:(AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterTransitGatewayMulticastGroupSources"
                   outputClass:[AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult class]];
}

- (void)registerTransitGatewayMulticastGroupSources:(AWSEC2RegisterTransitGatewayMulticastGroupSourcesRequest *)request
     completionHandler:(void (^)(AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult *response, NSError *error))completionHandler {
    [[self registerTransitGatewayMulticastGroupSources:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult *> * _Nonnull task) {
        AWSEC2RegisterTransitGatewayMulticastGroupSourcesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RejectTransitGatewayPeeringAttachmentResult *> *)rejectTransitGatewayPeeringAttachment:(AWSEC2RejectTransitGatewayPeeringAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RejectTransitGatewayPeeringAttachment"
                   outputClass:[AWSEC2RejectTransitGatewayPeeringAttachmentResult class]];
}

- (void)rejectTransitGatewayPeeringAttachment:(AWSEC2RejectTransitGatewayPeeringAttachmentRequest *)request
     completionHandler:(void (^)(AWSEC2RejectTransitGatewayPeeringAttachmentResult *response, NSError *error))completionHandler {
    [[self rejectTransitGatewayPeeringAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RejectTransitGatewayPeeringAttachmentResult *> * _Nonnull task) {
        AWSEC2RejectTransitGatewayPeeringAttachmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RejectTransitGatewayVpcAttachmentResult *> *)rejectTransitGatewayVpcAttachment:(AWSEC2RejectTransitGatewayVpcAttachmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RejectTransitGatewayVpcAttachment"
                   outputClass:[AWSEC2RejectTransitGatewayVpcAttachmentResult class]];
}

- (void)rejectTransitGatewayVpcAttachment:(AWSEC2RejectTransitGatewayVpcAttachmentRequest *)request
     completionHandler:(void (^)(AWSEC2RejectTransitGatewayVpcAttachmentResult *response, NSError *error))completionHandler {
    [[self rejectTransitGatewayVpcAttachment:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RejectTransitGatewayVpcAttachmentResult *> * _Nonnull task) {
        AWSEC2RejectTransitGatewayVpcAttachmentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RejectVpcEndpointConnectionsResult *> *)rejectVpcEndpointConnections:(AWSEC2RejectVpcEndpointConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RejectVpcEndpointConnections"
                   outputClass:[AWSEC2RejectVpcEndpointConnectionsResult class]];
}

- (void)rejectVpcEndpointConnections:(AWSEC2RejectVpcEndpointConnectionsRequest *)request
     completionHandler:(void (^)(AWSEC2RejectVpcEndpointConnectionsResult *response, NSError *error))completionHandler {
    [[self rejectVpcEndpointConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RejectVpcEndpointConnectionsResult *> * _Nonnull task) {
        AWSEC2RejectVpcEndpointConnectionsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ReplaceIamInstanceProfileAssociationResult *> *)replaceIamInstanceProfileAssociation:(AWSEC2ReplaceIamInstanceProfileAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceIamInstanceProfileAssociation"
                   outputClass:[AWSEC2ReplaceIamInstanceProfileAssociationResult class]];
}

- (void)replaceIamInstanceProfileAssociation:(AWSEC2ReplaceIamInstanceProfileAssociationRequest *)request
     completionHandler:(void (^)(AWSEC2ReplaceIamInstanceProfileAssociationResult *response, NSError *error))completionHandler {
    [[self replaceIamInstanceProfileAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ReplaceIamInstanceProfileAssociationResult *> * _Nonnull task) {
        AWSEC2ReplaceIamInstanceProfileAssociationResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ReplaceTransitGatewayRouteResult *> *)replaceTransitGatewayRoute:(AWSEC2ReplaceTransitGatewayRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceTransitGatewayRoute"
                   outputClass:[AWSEC2ReplaceTransitGatewayRouteResult class]];
}

- (void)replaceTransitGatewayRoute:(AWSEC2ReplaceTransitGatewayRouteRequest *)request
     completionHandler:(void (^)(AWSEC2ReplaceTransitGatewayRouteResult *response, NSError *error))completionHandler {
    [[self replaceTransitGatewayRoute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ReplaceTransitGatewayRouteResult *> * _Nonnull task) {
        AWSEC2ReplaceTransitGatewayRouteResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ResetEbsDefaultKmsKeyIdResult *> *)resetEbsDefaultKmsKeyId:(AWSEC2ResetEbsDefaultKmsKeyIdRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetEbsDefaultKmsKeyId"
                   outputClass:[AWSEC2ResetEbsDefaultKmsKeyIdResult class]];
}

- (void)resetEbsDefaultKmsKeyId:(AWSEC2ResetEbsDefaultKmsKeyIdRequest *)request
     completionHandler:(void (^)(AWSEC2ResetEbsDefaultKmsKeyIdResult *response, NSError *error))completionHandler {
    [[self resetEbsDefaultKmsKeyId:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ResetEbsDefaultKmsKeyIdResult *> * _Nonnull task) {
        AWSEC2ResetEbsDefaultKmsKeyIdResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2ResetFpgaImageAttributeResult *> *)resetFpgaImageAttribute:(AWSEC2ResetFpgaImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetFpgaImageAttribute"
                   outputClass:[AWSEC2ResetFpgaImageAttributeResult class]];
}

- (void)resetFpgaImageAttribute:(AWSEC2ResetFpgaImageAttributeRequest *)request
     completionHandler:(void (^)(AWSEC2ResetFpgaImageAttributeResult *response, NSError *error))completionHandler {
    [[self resetFpgaImageAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2ResetFpgaImageAttributeResult *> * _Nonnull task) {
        AWSEC2ResetFpgaImageAttributeResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2RevokeClientVpnIngressResult *> *)revokeClientVpnIngress:(AWSEC2RevokeClientVpnIngressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeClientVpnIngress"
                   outputClass:[AWSEC2RevokeClientVpnIngressResult class]];
}

- (void)revokeClientVpnIngress:(AWSEC2RevokeClientVpnIngressRequest *)request
     completionHandler:(void (^)(AWSEC2RevokeClientVpnIngressResult *response, NSError *error))completionHandler {
    [[self revokeClientVpnIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2RevokeClientVpnIngressResult *> * _Nonnull task) {
        AWSEC2RevokeClientVpnIngressResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2SearchLocalGatewayRoutesResult *> *)searchLocalGatewayRoutes:(AWSEC2SearchLocalGatewayRoutesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SearchLocalGatewayRoutes"
                   outputClass:[AWSEC2SearchLocalGatewayRoutesResult class]];
}

- (void)searchLocalGatewayRoutes:(AWSEC2SearchLocalGatewayRoutesRequest *)request
     completionHandler:(void (^)(AWSEC2SearchLocalGatewayRoutesResult *response, NSError *error))completionHandler {
    [[self searchLocalGatewayRoutes:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2SearchLocalGatewayRoutesResult *> * _Nonnull task) {
        AWSEC2SearchLocalGatewayRoutesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2SearchTransitGatewayMulticastGroupsResult *> *)searchTransitGatewayMulticastGroups:(AWSEC2SearchTransitGatewayMulticastGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SearchTransitGatewayMulticastGroups"
                   outputClass:[AWSEC2SearchTransitGatewayMulticastGroupsResult class]];
}

- (void)searchTransitGatewayMulticastGroups:(AWSEC2SearchTransitGatewayMulticastGroupsRequest *)request
     completionHandler:(void (^)(AWSEC2SearchTransitGatewayMulticastGroupsResult *response, NSError *error))completionHandler {
    [[self searchTransitGatewayMulticastGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2SearchTransitGatewayMulticastGroupsResult *> * _Nonnull task) {
        AWSEC2SearchTransitGatewayMulticastGroupsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2SearchTransitGatewayRoutesResult *> *)searchTransitGatewayRoutes:(AWSEC2SearchTransitGatewayRoutesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SearchTransitGatewayRoutes"
                   outputClass:[AWSEC2SearchTransitGatewayRoutesResult class]];
}

- (void)searchTransitGatewayRoutes:(AWSEC2SearchTransitGatewayRoutesRequest *)request
     completionHandler:(void (^)(AWSEC2SearchTransitGatewayRoutesResult *response, NSError *error))completionHandler {
    [[self searchTransitGatewayRoutes:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2SearchTransitGatewayRoutesResult *> * _Nonnull task) {
        AWSEC2SearchTransitGatewayRoutesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)sendDiagnosticInterrupt:(AWSEC2SendDiagnosticInterruptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendDiagnosticInterrupt"
                   outputClass:nil];
}

- (void)sendDiagnosticInterrupt:(AWSEC2SendDiagnosticInterruptRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self sendDiagnosticInterrupt:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult *> *)startVpcEndpointServicePrivateDnsVerification:(AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartVpcEndpointServicePrivateDnsVerification"
                   outputClass:[AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult class]];
}

- (void)startVpcEndpointServicePrivateDnsVerification:(AWSEC2StartVpcEndpointServicePrivateDnsVerificationRequest *)request
     completionHandler:(void (^)(AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult *response, NSError *error))completionHandler {
    [[self startVpcEndpointServicePrivateDnsVerification:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult *> * _Nonnull task) {
        AWSEC2StartVpcEndpointServicePrivateDnsVerificationResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2TerminateClientVpnConnectionsResult *> *)terminateClientVpnConnections:(AWSEC2TerminateClientVpnConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TerminateClientVpnConnections"
                   outputClass:[AWSEC2TerminateClientVpnConnectionsResult class]];
}

- (void)terminateClientVpnConnections:(AWSEC2TerminateClientVpnConnectionsRequest *)request
     completionHandler:(void (^)(AWSEC2TerminateClientVpnConnectionsResult *response, NSError *error))completionHandler {
    [[self terminateClientVpnConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2TerminateClientVpnConnectionsResult *> * _Nonnull task) {
        AWSEC2TerminateClientVpnConnectionsResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2UnassignIpv6AddressesResult *> *)unassignIpv6Addresses:(AWSEC2UnassignIpv6AddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UnassignIpv6Addresses"
                   outputClass:[AWSEC2UnassignIpv6AddressesResult class]];
}

- (void)unassignIpv6Addresses:(AWSEC2UnassignIpv6AddressesRequest *)request
     completionHandler:(void (^)(AWSEC2UnassignIpv6AddressesResult *response, NSError *error))completionHandler {
    [[self unassignIpv6Addresses:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2UnassignIpv6AddressesResult *> * _Nonnull task) {
        AWSEC2UnassignIpv6AddressesResult *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult *> *)updateSecurityGroupRuleDescriptionsEgress:(AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateSecurityGroupRuleDescriptionsEgress"
                   outputClass:[AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult class]];
}

- (void)updateSecurityGroupRuleDescriptionsEgress:(AWSEC2UpdateSecurityGroupRuleDescriptionsEgressRequest *)request
     completionHandler:(void (^)(AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult *response, NSError *error))completionHandler {
    [[self updateSecurityGroupRuleDescriptionsEgress:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult *> * _Nonnull task) {
        AWSEC2UpdateSecurityGroupRuleDescriptionsEgressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult *> *)updateSecurityGroupRuleDescriptionsIngress:(AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateSecurityGroupRuleDescriptionsIngress"
                   outputClass:[AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult class]];
}

- (void)updateSecurityGroupRuleDescriptionsIngress:(AWSEC2UpdateSecurityGroupRuleDescriptionsIngressRequest *)request
     completionHandler:(void (^)(AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult *response, NSError *error))completionHandler {
    [[self updateSecurityGroupRuleDescriptionsIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult *> * _Nonnull task) {
        AWSEC2UpdateSecurityGroupRuleDescriptionsIngressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSEC2WithdrawByoipCidrResult *> *)withdrawByoipCidr:(AWSEC2WithdrawByoipCidrRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"WithdrawByoipCidr"
                   outputClass:[AWSEC2WithdrawByoipCidrResult class]];
}

- (void)withdrawByoipCidr:(AWSEC2WithdrawByoipCidrRequest *)request
     completionHandler:(void (^)(AWSEC2WithdrawByoipCidrResult *response, NSError *error))completionHandler {
    [[self withdrawByoipCidr:request] continueWithBlock:^id _Nullable(AWSTask<AWSEC2WithdrawByoipCidrResult *> * _Nonnull task) {
        AWSEC2WithdrawByoipCidrResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
