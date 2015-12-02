/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSEC2.h"

#import "AWSNetworking.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSCategory.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSEC2Resources.h"

NSString *const AWSEC2DefinitionFileName = @"ec2-2014-09-01";


@interface AWSEC2ResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSEC2ResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AuthFailure" : @(AWSEC2ErrorAuthFailure),
                            @"SignatureDoesNotMatch" : @(AWSEC2ErrorSignatureDoesNotMatch),
                            };
}

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

        NSDictionary *errorInfo = responseObject[@"Error"];
        if (errorInfo[@"Code"] && errorCodeDictionary[errorInfo[@"Code"]]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSEC2ErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSEC2ErrorDomain
                                             code:AWSEC2ErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }

        }

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

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSEC2ErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        switch (error.code) {
            case AWSEC2ErrorAuthFailure:
                retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                break;

            default:
                break;
        }
    }

    return retryType;
}

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

@implementation AWSEC2

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultEC2 {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    static AWSEC2 *_defaultEC2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultEC2 = [[AWSEC2 alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultEC2;
}

+ (void)registerEC2WithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSEC2 alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)EC2ForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
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

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceEC2
                                                         useUnsafeURL:NO];

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

- (AWSTask *)acceptVpcPeeringConnection:(AWSEC2AcceptVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AcceptVpcPeeringConnection"
                   outputClass:[AWSEC2AcceptVpcPeeringConnectionResult class]];
}

- (AWSTask *)allocateAddress:(AWSEC2AllocateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AllocateAddress"
                   outputClass:[AWSEC2AllocateAddressResult class]];
}

- (AWSTask *)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssignPrivateIpAddresses"
                   outputClass:nil];
}

- (AWSTask *)associateAddress:(AWSEC2AssociateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateAddress"
                   outputClass:[AWSEC2AssociateAddressResult class]];
}

- (AWSTask *)associateDhcpOptions:(AWSEC2AssociateDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateDhcpOptions"
                   outputClass:nil];
}

- (AWSTask *)associateRouteTable:(AWSEC2AssociateRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateRouteTable"
                   outputClass:[AWSEC2AssociateRouteTableResult class]];
}

- (AWSTask *)attachClassicLinkVpc:(AWSEC2AttachClassicLinkVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachClassicLinkVpc"
                   outputClass:[AWSEC2AttachClassicLinkVpcResult class]];
}

- (AWSTask *)attachInternetGateway:(AWSEC2AttachInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachInternetGateway"
                   outputClass:nil];
}

- (AWSTask *)attachNetworkInterface:(AWSEC2AttachNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachNetworkInterface"
                   outputClass:[AWSEC2AttachNetworkInterfaceResult class]];
}

- (AWSTask *)attachVolume:(AWSEC2AttachVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachVolume"
                   outputClass:[AWSEC2VolumeAttachment class]];
}

- (AWSTask *)attachVpnGateway:(AWSEC2AttachVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachVpnGateway"
                   outputClass:[AWSEC2AttachVpnGatewayResult class]];
}

- (AWSTask *)authorizeSecurityGroupEgress:(AWSEC2AuthorizeSecurityGroupEgressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeSecurityGroupEgress"
                   outputClass:nil];
}

- (AWSTask *)authorizeSecurityGroupIngress:(AWSEC2AuthorizeSecurityGroupIngressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeSecurityGroupIngress"
                   outputClass:nil];
}

- (AWSTask *)bundleInstance:(AWSEC2BundleInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BundleInstance"
                   outputClass:[AWSEC2BundleInstanceResult class]];
}

- (AWSTask *)cancelBundleTask:(AWSEC2CancelBundleTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelBundleTask"
                   outputClass:[AWSEC2CancelBundleTaskResult class]];
}

- (AWSTask *)cancelConversionTask:(AWSEC2CancelConversionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelConversionTask"
                   outputClass:nil];
}

- (AWSTask *)cancelExportTask:(AWSEC2CancelExportTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelExportTask"
                   outputClass:nil];
}

- (AWSTask *)cancelReservedInstancesListing:(AWSEC2CancelReservedInstancesListingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelReservedInstancesListing"
                   outputClass:[AWSEC2CancelReservedInstancesListingResult class]];
}

- (AWSTask *)cancelSpotInstanceRequests:(AWSEC2CancelSpotInstanceRequestsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelSpotInstanceRequests"
                   outputClass:[AWSEC2CancelSpotInstanceRequestsResult class]];
}

- (AWSTask *)confirmProductInstance:(AWSEC2ConfirmProductInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ConfirmProductInstance"
                   outputClass:[AWSEC2ConfirmProductInstanceResult class]];
}

- (AWSTask *)createCustomerGateway:(AWSEC2CreateCustomerGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCustomerGateway"
                   outputClass:[AWSEC2CreateCustomerGatewayResult class]];
}

- (AWSTask *)createDhcpOptions:(AWSEC2CreateDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDhcpOptions"
                   outputClass:[AWSEC2CreateDhcpOptionsResult class]];
}

- (AWSTask *)createImage:(AWSEC2CreateImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateImage"
                   outputClass:[AWSEC2CreateImageResult class]];
}

- (AWSTask *)createInstanceExportTask:(AWSEC2CreateInstanceExportTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateInstanceExportTask"
                   outputClass:[AWSEC2CreateInstanceExportTaskResult class]];
}

- (AWSTask *)createInternetGateway:(AWSEC2CreateInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateInternetGateway"
                   outputClass:[AWSEC2CreateInternetGatewayResult class]];
}

- (AWSTask *)createKeyPair:(AWSEC2CreateKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateKeyPair"
                   outputClass:[AWSEC2KeyPair class]];
}

- (AWSTask *)createNetworkAcl:(AWSEC2CreateNetworkAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNetworkAcl"
                   outputClass:[AWSEC2CreateNetworkAclResult class]];
}

- (AWSTask *)createNetworkAclEntry:(AWSEC2CreateNetworkAclEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNetworkAclEntry"
                   outputClass:nil];
}

- (AWSTask *)createNetworkInterface:(AWSEC2CreateNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNetworkInterface"
                   outputClass:[AWSEC2CreateNetworkInterfaceResult class]];
}

- (AWSTask *)createPlacementGroup:(AWSEC2CreatePlacementGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePlacementGroup"
                   outputClass:nil];
}

- (AWSTask *)createReservedInstancesListing:(AWSEC2CreateReservedInstancesListingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateReservedInstancesListing"
                   outputClass:[AWSEC2CreateReservedInstancesListingResult class]];
}

- (AWSTask *)createRoute:(AWSEC2CreateRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateRoute"
                   outputClass:nil];
}

- (AWSTask *)createRouteTable:(AWSEC2CreateRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateRouteTable"
                   outputClass:[AWSEC2CreateRouteTableResult class]];
}

- (AWSTask *)createSecurityGroup:(AWSEC2CreateSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSecurityGroup"
                   outputClass:[AWSEC2CreateSecurityGroupResult class]];
}

- (AWSTask *)createSnapshot:(AWSEC2CreateSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSnapshot"
                   outputClass:[AWSEC2Snapshot class]];
}

- (AWSTask *)createSpotDatafeedSubscription:(AWSEC2CreateSpotDatafeedSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSpotDatafeedSubscription"
                   outputClass:[AWSEC2CreateSpotDatafeedSubscriptionResult class]];
}

- (AWSTask *)createSubnet:(AWSEC2CreateSubnetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSubnet"
                   outputClass:[AWSEC2CreateSubnetResult class]];
}

- (AWSTask *)createTags:(AWSEC2CreateTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTags"
                   outputClass:nil];
}

- (AWSTask *)createVolume:(AWSEC2CreateVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVolume"
                   outputClass:[AWSEC2Volume class]];
}

- (AWSTask *)createVpc:(AWSEC2CreateVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpc"
                   outputClass:[AWSEC2CreateVpcResult class]];
}

- (AWSTask *)createVpcPeeringConnection:(AWSEC2CreateVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpcPeeringConnection"
                   outputClass:[AWSEC2CreateVpcPeeringConnectionResult class]];
}

- (AWSTask *)createVpnConnection:(AWSEC2CreateVpnConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpnConnection"
                   outputClass:[AWSEC2CreateVpnConnectionResult class]];
}

- (AWSTask *)createVpnConnectionRoute:(AWSEC2CreateVpnConnectionRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpnConnectionRoute"
                   outputClass:nil];
}

- (AWSTask *)createVpnGateway:(AWSEC2CreateVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpnGateway"
                   outputClass:[AWSEC2CreateVpnGatewayResult class]];
}

- (AWSTask *)deleteCustomerGateway:(AWSEC2DeleteCustomerGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCustomerGateway"
                   outputClass:nil];
}

- (AWSTask *)deleteDhcpOptions:(AWSEC2DeleteDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDhcpOptions"
                   outputClass:nil];
}

- (AWSTask *)deleteInternetGateway:(AWSEC2DeleteInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteInternetGateway"
                   outputClass:nil];
}

- (AWSTask *)deleteKeyPair:(AWSEC2DeleteKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteKeyPair"
                   outputClass:nil];
}

- (AWSTask *)deleteNetworkAcl:(AWSEC2DeleteNetworkAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNetworkAcl"
                   outputClass:nil];
}

- (AWSTask *)deleteNetworkAclEntry:(AWSEC2DeleteNetworkAclEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNetworkAclEntry"
                   outputClass:nil];
}

- (AWSTask *)deleteNetworkInterface:(AWSEC2DeleteNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNetworkInterface"
                   outputClass:nil];
}

- (AWSTask *)deletePlacementGroup:(AWSEC2DeletePlacementGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePlacementGroup"
                   outputClass:nil];
}

- (AWSTask *)deleteRoute:(AWSEC2DeleteRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteRoute"
                   outputClass:nil];
}

- (AWSTask *)deleteRouteTable:(AWSEC2DeleteRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteRouteTable"
                   outputClass:nil];
}

- (AWSTask *)deleteSecurityGroup:(AWSEC2DeleteSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSecurityGroup"
                   outputClass:nil];
}

- (AWSTask *)deleteSnapshot:(AWSEC2DeleteSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSnapshot"
                   outputClass:nil];
}

- (AWSTask *)deleteSpotDatafeedSubscription:(AWSEC2DeleteSpotDatafeedSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSpotDatafeedSubscription"
                   outputClass:nil];
}

- (AWSTask *)deleteSubnet:(AWSEC2DeleteSubnetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSubnet"
                   outputClass:nil];
}

- (AWSTask *)deleteTags:(AWSEC2DeleteTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTags"
                   outputClass:nil];
}

- (AWSTask *)deleteVolume:(AWSEC2DeleteVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVolume"
                   outputClass:nil];
}

- (AWSTask *)deleteVpc:(AWSEC2DeleteVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpc"
                   outputClass:nil];
}

- (AWSTask *)deleteVpcPeeringConnection:(AWSEC2DeleteVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpcPeeringConnection"
                   outputClass:[AWSEC2DeleteVpcPeeringConnectionResult class]];
}

- (AWSTask *)deleteVpnConnection:(AWSEC2DeleteVpnConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpnConnection"
                   outputClass:nil];
}

- (AWSTask *)deleteVpnConnectionRoute:(AWSEC2DeleteVpnConnectionRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpnConnectionRoute"
                   outputClass:nil];
}

- (AWSTask *)deleteVpnGateway:(AWSEC2DeleteVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpnGateway"
                   outputClass:nil];
}

- (AWSTask *)deregisterImage:(AWSEC2DeregisterImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterImage"
                   outputClass:nil];
}

- (AWSTask *)describeAccountAttributes:(AWSEC2DescribeAccountAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSEC2DescribeAccountAttributesResult class]];
}

- (AWSTask *)describeAddresses:(AWSEC2DescribeAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAddresses"
                   outputClass:[AWSEC2DescribeAddressesResult class]];
}

- (AWSTask *)describeAvailabilityZones:(AWSEC2DescribeAvailabilityZonesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAvailabilityZones"
                   outputClass:[AWSEC2DescribeAvailabilityZonesResult class]];
}

- (AWSTask *)describeBundleTasks:(AWSEC2DescribeBundleTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeBundleTasks"
                   outputClass:[AWSEC2DescribeBundleTasksResult class]];
}

- (AWSTask *)describeClassicLinkInstances:(AWSEC2DescribeClassicLinkInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClassicLinkInstances"
                   outputClass:[AWSEC2DescribeClassicLinkInstancesResult class]];
}

- (AWSTask *)describeConversionTasks:(AWSEC2DescribeConversionTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeConversionTasks"
                   outputClass:[AWSEC2DescribeConversionTasksResult class]];
}

- (AWSTask *)describeCustomerGateways:(AWSEC2DescribeCustomerGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCustomerGateways"
                   outputClass:[AWSEC2DescribeCustomerGatewaysResult class]];
}

- (AWSTask *)describeDhcpOptions:(AWSEC2DescribeDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDhcpOptions"
                   outputClass:[AWSEC2DescribeDhcpOptionsResult class]];
}

- (AWSTask *)describeExportTasks:(AWSEC2DescribeExportTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeExportTasks"
                   outputClass:[AWSEC2DescribeExportTasksResult class]];
}

- (AWSTask *)describeImageAttribute:(AWSEC2DescribeImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeImageAttribute"
                   outputClass:[AWSEC2ImageAttribute class]];
}

- (AWSTask *)describeImages:(AWSEC2DescribeImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeImages"
                   outputClass:[AWSEC2DescribeImagesResult class]];
}

- (AWSTask *)describeInstanceAttribute:(AWSEC2DescribeInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceAttribute"
                   outputClass:[AWSEC2InstanceAttribute class]];
}

- (AWSTask *)describeInstanceStatus:(AWSEC2DescribeInstanceStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceStatus"
                   outputClass:[AWSEC2DescribeInstanceStatusResult class]];
}

- (AWSTask *)describeInstances:(AWSEC2DescribeInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstances"
                   outputClass:[AWSEC2DescribeInstancesResult class]];
}

- (AWSTask *)describeInternetGateways:(AWSEC2DescribeInternetGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInternetGateways"
                   outputClass:[AWSEC2DescribeInternetGatewaysResult class]];
}

- (AWSTask *)describeKeyPairs:(AWSEC2DescribeKeyPairsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeKeyPairs"
                   outputClass:[AWSEC2DescribeKeyPairsResult class]];
}

- (AWSTask *)describeNetworkAcls:(AWSEC2DescribeNetworkAclsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNetworkAcls"
                   outputClass:[AWSEC2DescribeNetworkAclsResult class]];
}

- (AWSTask *)describeNetworkInterfaceAttribute:(AWSEC2DescribeNetworkInterfaceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNetworkInterfaceAttribute"
                   outputClass:[AWSEC2DescribeNetworkInterfaceAttributeResult class]];
}

- (AWSTask *)describeNetworkInterfaces:(AWSEC2DescribeNetworkInterfacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNetworkInterfaces"
                   outputClass:[AWSEC2DescribeNetworkInterfacesResult class]];
}

- (AWSTask *)describePlacementGroups:(AWSEC2DescribePlacementGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePlacementGroups"
                   outputClass:[AWSEC2DescribePlacementGroupsResult class]];
}

- (AWSTask *)describeRegions:(AWSEC2DescribeRegionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeRegions"
                   outputClass:[AWSEC2DescribeRegionsResult class]];
}

- (AWSTask *)describeReservedInstances:(AWSEC2DescribeReservedInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstances"
                   outputClass:[AWSEC2DescribeReservedInstancesResult class]];
}

- (AWSTask *)describeReservedInstancesListings:(AWSEC2DescribeReservedInstancesListingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstancesListings"
                   outputClass:[AWSEC2DescribeReservedInstancesListingsResult class]];
}

- (AWSTask *)describeReservedInstancesModifications:(AWSEC2DescribeReservedInstancesModificationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstancesModifications"
                   outputClass:[AWSEC2DescribeReservedInstancesModificationsResult class]];
}

- (AWSTask *)describeReservedInstancesOfferings:(AWSEC2DescribeReservedInstancesOfferingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstancesOfferings"
                   outputClass:[AWSEC2DescribeReservedInstancesOfferingsResult class]];
}

- (AWSTask *)describeRouteTables:(AWSEC2DescribeRouteTablesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeRouteTables"
                   outputClass:[AWSEC2DescribeRouteTablesResult class]];
}

- (AWSTask *)describeSecurityGroups:(AWSEC2DescribeSecurityGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSecurityGroups"
                   outputClass:[AWSEC2DescribeSecurityGroupsResult class]];
}

- (AWSTask *)describeSnapshotAttribute:(AWSEC2DescribeSnapshotAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSnapshotAttribute"
                   outputClass:[AWSEC2DescribeSnapshotAttributeResult class]];
}

- (AWSTask *)describeSnapshots:(AWSEC2DescribeSnapshotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSnapshots"
                   outputClass:[AWSEC2DescribeSnapshotsResult class]];
}

- (AWSTask *)describeSpotDatafeedSubscription:(AWSEC2DescribeSpotDatafeedSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotDatafeedSubscription"
                   outputClass:[AWSEC2DescribeSpotDatafeedSubscriptionResult class]];
}

- (AWSTask *)describeSpotInstanceRequests:(AWSEC2DescribeSpotInstanceRequestsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotInstanceRequests"
                   outputClass:[AWSEC2DescribeSpotInstanceRequestsResult class]];
}

- (AWSTask *)describeSpotPriceHistory:(AWSEC2DescribeSpotPriceHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotPriceHistory"
                   outputClass:[AWSEC2DescribeSpotPriceHistoryResult class]];
}

- (AWSTask *)describeSubnets:(AWSEC2DescribeSubnetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSubnets"
                   outputClass:[AWSEC2DescribeSubnetsResult class]];
}

- (AWSTask *)describeTags:(AWSEC2DescribeTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSEC2DescribeTagsResult class]];
}

- (AWSTask *)describeVolumeAttribute:(AWSEC2DescribeVolumeAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVolumeAttribute"
                   outputClass:[AWSEC2DescribeVolumeAttributeResult class]];
}

- (AWSTask *)describeVolumeStatus:(AWSEC2DescribeVolumeStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVolumeStatus"
                   outputClass:[AWSEC2DescribeVolumeStatusResult class]];
}

- (AWSTask *)describeVolumes:(AWSEC2DescribeVolumesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVolumes"
                   outputClass:[AWSEC2DescribeVolumesResult class]];
}

- (AWSTask *)describeVpcAttribute:(AWSEC2DescribeVpcAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcAttribute"
                   outputClass:[AWSEC2DescribeVpcAttributeResult class]];
}

- (AWSTask *)describeVpcClassicLink:(AWSEC2DescribeVpcClassicLinkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcClassicLink"
                   outputClass:[AWSEC2DescribeVpcClassicLinkResult class]];
}

- (AWSTask *)describeVpcPeeringConnections:(AWSEC2DescribeVpcPeeringConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcPeeringConnections"
                   outputClass:[AWSEC2DescribeVpcPeeringConnectionsResult class]];
}

- (AWSTask *)describeVpcs:(AWSEC2DescribeVpcsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcs"
                   outputClass:[AWSEC2DescribeVpcsResult class]];
}

- (AWSTask *)describeVpnConnections:(AWSEC2DescribeVpnConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpnConnections"
                   outputClass:[AWSEC2DescribeVpnConnectionsResult class]];
}

- (AWSTask *)describeVpnGateways:(AWSEC2DescribeVpnGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpnGateways"
                   outputClass:[AWSEC2DescribeVpnGatewaysResult class]];
}

- (AWSTask *)detachClassicLinkVpc:(AWSEC2DetachClassicLinkVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachClassicLinkVpc"
                   outputClass:[AWSEC2DetachClassicLinkVpcResult class]];
}

- (AWSTask *)detachInternetGateway:(AWSEC2DetachInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachInternetGateway"
                   outputClass:nil];
}

- (AWSTask *)detachNetworkInterface:(AWSEC2DetachNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachNetworkInterface"
                   outputClass:nil];
}

- (AWSTask *)detachVolume:(AWSEC2DetachVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachVolume"
                   outputClass:[AWSEC2VolumeAttachment class]];
}

- (AWSTask *)detachVpnGateway:(AWSEC2DetachVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachVpnGateway"
                   outputClass:nil];
}

- (AWSTask *)disableVgwRoutePropagation:(AWSEC2DisableVgwRoutePropagationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableVgwRoutePropagation"
                   outputClass:nil];
}

- (AWSTask *)disableVpcClassicLink:(AWSEC2DisableVpcClassicLinkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableVpcClassicLink"
                   outputClass:[AWSEC2DisableVpcClassicLinkResult class]];
}

- (AWSTask *)disassociateAddress:(AWSEC2DisassociateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateAddress"
                   outputClass:nil];
}

- (AWSTask *)disassociateRouteTable:(AWSEC2DisassociateRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateRouteTable"
                   outputClass:nil];
}

- (AWSTask *)enableVgwRoutePropagation:(AWSEC2EnableVgwRoutePropagationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableVgwRoutePropagation"
                   outputClass:nil];
}

- (AWSTask *)enableVolumeIO:(AWSEC2EnableVolumeIORequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableVolumeIO"
                   outputClass:nil];
}

- (AWSTask *)enableVpcClassicLink:(AWSEC2EnableVpcClassicLinkRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableVpcClassicLink"
                   outputClass:[AWSEC2EnableVpcClassicLinkResult class]];
}

- (AWSTask *)getConsoleOutput:(AWSEC2GetConsoleOutputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetConsoleOutput"
                   outputClass:[AWSEC2GetConsoleOutputResult class]];
}

- (AWSTask *)getPasswordData:(AWSEC2GetPasswordDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetPasswordData"
                   outputClass:[AWSEC2GetPasswordDataResult class]];
}

- (AWSTask *)importInstance:(AWSEC2ImportInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportInstance"
                   outputClass:[AWSEC2ImportInstanceResult class]];
}

- (AWSTask *)importKeyPair:(AWSEC2ImportKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportKeyPair"
                   outputClass:[AWSEC2ImportKeyPairResult class]];
}

- (AWSTask *)importVolume:(AWSEC2ImportVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportVolume"
                   outputClass:[AWSEC2ImportVolumeResult class]];
}

- (AWSTask *)modifyImageAttribute:(AWSEC2ModifyImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyImageAttribute"
                   outputClass:nil];
}

- (AWSTask *)modifyInstanceAttribute:(AWSEC2ModifyInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyInstanceAttribute"
                   outputClass:nil];
}

- (AWSTask *)modifyNetworkInterfaceAttribute:(AWSEC2ModifyNetworkInterfaceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyNetworkInterfaceAttribute"
                   outputClass:nil];
}

- (AWSTask *)modifyReservedInstances:(AWSEC2ModifyReservedInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyReservedInstances"
                   outputClass:[AWSEC2ModifyReservedInstancesResult class]];
}

- (AWSTask *)modifySnapshotAttribute:(AWSEC2ModifySnapshotAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifySnapshotAttribute"
                   outputClass:nil];
}

- (AWSTask *)modifySubnetAttribute:(AWSEC2ModifySubnetAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifySubnetAttribute"
                   outputClass:nil];
}

- (AWSTask *)modifyVolumeAttribute:(AWSEC2ModifyVolumeAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVolumeAttribute"
                   outputClass:nil];
}

- (AWSTask *)modifyVpcAttribute:(AWSEC2ModifyVpcAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpcAttribute"
                   outputClass:nil];
}

- (AWSTask *)monitorInstances:(AWSEC2MonitorInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"MonitorInstances"
                   outputClass:[AWSEC2MonitorInstancesResult class]];
}

- (AWSTask *)purchaseReservedInstancesOffering:(AWSEC2PurchaseReservedInstancesOfferingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PurchaseReservedInstancesOffering"
                   outputClass:[AWSEC2PurchaseReservedInstancesOfferingResult class]];
}

- (AWSTask *)rebootInstances:(AWSEC2RebootInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RebootInstances"
                   outputClass:nil];
}

- (AWSTask *)registerImage:(AWSEC2RegisterImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterImage"
                   outputClass:[AWSEC2RegisterImageResult class]];
}

- (AWSTask *)rejectVpcPeeringConnection:(AWSEC2RejectVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RejectVpcPeeringConnection"
                   outputClass:[AWSEC2RejectVpcPeeringConnectionResult class]];
}

- (AWSTask *)releaseAddress:(AWSEC2ReleaseAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReleaseAddress"
                   outputClass:nil];
}

- (AWSTask *)replaceNetworkAclAssociation:(AWSEC2ReplaceNetworkAclAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceNetworkAclAssociation"
                   outputClass:[AWSEC2ReplaceNetworkAclAssociationResult class]];
}

- (AWSTask *)replaceNetworkAclEntry:(AWSEC2ReplaceNetworkAclEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceNetworkAclEntry"
                   outputClass:nil];
}

- (AWSTask *)replaceRoute:(AWSEC2ReplaceRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceRoute"
                   outputClass:nil];
}

- (AWSTask *)replaceRouteTableAssociation:(AWSEC2ReplaceRouteTableAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceRouteTableAssociation"
                   outputClass:[AWSEC2ReplaceRouteTableAssociationResult class]];
}

- (AWSTask *)replicateImage:(AWSEC2ReplicateImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyImage"
                   outputClass:[AWSEC2ReplicateImageResult class]];
}

- (AWSTask *)replicateSnapshot:(AWSEC2ReplicateSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopySnapshot"
                   outputClass:[AWSEC2ReplicateSnapshotResult class]];
}

- (AWSTask *)reportInstanceStatus:(AWSEC2ReportInstanceStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReportInstanceStatus"
                   outputClass:nil];
}

- (AWSTask *)requestSpotInstances:(AWSEC2RequestSpotInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RequestSpotInstances"
                   outputClass:[AWSEC2RequestSpotInstancesResult class]];
}

- (AWSTask *)resetImageAttribute:(AWSEC2ResetImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetImageAttribute"
                   outputClass:nil];
}

- (AWSTask *)resetInstanceAttribute:(AWSEC2ResetInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetInstanceAttribute"
                   outputClass:nil];
}

- (AWSTask *)resetNetworkInterfaceAttribute:(AWSEC2ResetNetworkInterfaceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetNetworkInterfaceAttribute"
                   outputClass:nil];
}

- (AWSTask *)resetSnapshotAttribute:(AWSEC2ResetSnapshotAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetSnapshotAttribute"
                   outputClass:nil];
}

- (AWSTask *)revokeSecurityGroupEgress:(AWSEC2RevokeSecurityGroupEgressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeSecurityGroupEgress"
                   outputClass:nil];
}

- (AWSTask *)revokeSecurityGroupIngress:(AWSEC2RevokeSecurityGroupIngressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeSecurityGroupIngress"
                   outputClass:nil];
}

- (AWSTask *)runInstances:(AWSEC2RunInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RunInstances"
                   outputClass:[AWSEC2Reservation class]];
}

- (AWSTask *)startInstances:(AWSEC2StartInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartInstances"
                   outputClass:[AWSEC2StartInstancesResult class]];
}

- (AWSTask *)stopInstances:(AWSEC2StopInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StopInstances"
                   outputClass:[AWSEC2StopInstancesResult class]];
}

- (AWSTask *)terminateInstances:(AWSEC2TerminateInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TerminateInstances"
                   outputClass:[AWSEC2TerminateInstancesResult class]];
}

- (AWSTask *)unassignPrivateIpAddresses:(AWSEC2UnassignPrivateIpAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UnassignPrivateIpAddresses"
                   outputClass:nil];
}

- (AWSTask *)unmonitorInstances:(AWSEC2UnmonitorInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UnmonitorInstances"
                   outputClass:[AWSEC2UnmonitorInstancesResult class]];
}

@end