/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
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

NSString *const AWSEC2DefinitionFileName = @"ec2-2014-06-15";


@interface AWSEC2ResponseSerializer : AWSXMLResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

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

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSEC2ResponseSerializer *serializer = [AWSEC2ResponseSerializer serializerWithResource:resource
                                                                                 actionName:actionName];
    serializer.outputClass = outputClass;

    return serializer;
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
            responseObject = [MTLJSONAdapter modelOfClass:self.outputClass
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

+ (instancetype)defaultEC2 {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSEC2 *_defaultEC2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultEC2 = [[AWSEC2 alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultEC2;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                                          service:AWSServiceEC2];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSEC2RequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Host" : _configuration.endpoint.hostName};

        _networking = [AWSNetworking networking:_configuration];
    }

    return self;
}

- (BFTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AWSHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    if (!request) {
        request = [AWSRequest new];
    }

    AWSNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[MTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }
    networkingRequest.HTTPMethod = HTTPMethod;

    AWSQueryStringRequestSerializer *requestSerializer = [AWSEC2RequestSerializer serializerWithResource:AWSEC2DefinitionFileName actionName:operationName];
    networkingRequest.requestSerializer = requestSerializer;

    networkingRequest.responseSerializer = [AWSEC2ResponseSerializer serializerWithOutputClass:outputClass
                                                                                      resource:AWSEC2DefinitionFileName
                                                                                    actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)acceptVpcPeeringConnection:(AWSEC2AcceptVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AcceptVpcPeeringConnection"
                   outputClass:[AWSEC2AcceptVpcPeeringConnectionResult class]];
}

- (BFTask *)allocateAddress:(AWSEC2AllocateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AllocateAddress"
                   outputClass:[AWSEC2AllocateAddressResult class]];
}

- (BFTask *)assignPrivateIpAddresses:(AWSEC2AssignPrivateIpAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssignPrivateIpAddresses"
                   outputClass:nil];
}

- (BFTask *)associateAddress:(AWSEC2AssociateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateAddress"
                   outputClass:[AWSEC2AssociateAddressResult class]];
}

- (BFTask *)associateDhcpOptions:(AWSEC2AssociateDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateDhcpOptions"
                   outputClass:nil];
}

- (BFTask *)associateRouteTable:(AWSEC2AssociateRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssociateRouteTable"
                   outputClass:[AWSEC2AssociateRouteTableResult class]];
}

- (BFTask *)attachInternetGateway:(AWSEC2AttachInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachInternetGateway"
                   outputClass:nil];
}

- (BFTask *)attachNetworkInterface:(AWSEC2AttachNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachNetworkInterface"
                   outputClass:[AWSEC2AttachNetworkInterfaceResult class]];
}

- (BFTask *)attachVolume:(AWSEC2AttachVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachVolume"
                   outputClass:[AWSEC2VolumeAttachment class]];
}

- (BFTask *)attachVpnGateway:(AWSEC2AttachVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachVpnGateway"
                   outputClass:[AWSEC2AttachVpnGatewayResult class]];
}

- (BFTask *)authorizeSecurityGroupEgress:(AWSEC2AuthorizeSecurityGroupEgressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeSecurityGroupEgress"
                   outputClass:nil];
}

- (BFTask *)authorizeSecurityGroupIngress:(AWSEC2AuthorizeSecurityGroupIngressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeSecurityGroupIngress"
                   outputClass:nil];
}

- (BFTask *)bundleInstance:(AWSEC2BundleInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BundleInstance"
                   outputClass:[AWSEC2BundleInstanceResult class]];
}

- (BFTask *)cancelBundleTask:(AWSEC2CancelBundleTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelBundleTask"
                   outputClass:[AWSEC2CancelBundleTaskResult class]];
}

- (BFTask *)cancelConversionTask:(AWSEC2CancelConversionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelConversionTask"
                   outputClass:nil];
}

- (BFTask *)cancelExportTask:(AWSEC2CancelExportTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelExportTask"
                   outputClass:nil];
}

- (BFTask *)cancelReservedInstancesListing:(AWSEC2CancelReservedInstancesListingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelReservedInstancesListing"
                   outputClass:[AWSEC2CancelReservedInstancesListingResult class]];
}

- (BFTask *)cancelSpotInstanceRequests:(AWSEC2CancelSpotInstanceRequestsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelSpotInstanceRequests"
                   outputClass:[AWSEC2CancelSpotInstanceRequestsResult class]];
}

- (BFTask *)confirmProductInstance:(AWSEC2ConfirmProductInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ConfirmProductInstance"
                   outputClass:[AWSEC2ConfirmProductInstanceResult class]];
}

- (BFTask *)createCustomerGateway:(AWSEC2CreateCustomerGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCustomerGateway"
                   outputClass:[AWSEC2CreateCustomerGatewayResult class]];
}

- (BFTask *)createDhcpOptions:(AWSEC2CreateDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDhcpOptions"
                   outputClass:[AWSEC2CreateDhcpOptionsResult class]];
}

- (BFTask *)createImage:(AWSEC2CreateImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateImage"
                   outputClass:[AWSEC2CreateImageResult class]];
}

- (BFTask *)createInstanceExportTask:(AWSEC2CreateInstanceExportTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateInstanceExportTask"
                   outputClass:[AWSEC2CreateInstanceExportTaskResult class]];
}

- (BFTask *)createInternetGateway:(AWSEC2CreateInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateInternetGateway"
                   outputClass:[AWSEC2CreateInternetGatewayResult class]];
}

- (BFTask *)createKeyPair:(AWSEC2CreateKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateKeyPair"
                   outputClass:[AWSEC2KeyPair class]];
}

- (BFTask *)createNetworkAcl:(AWSEC2CreateNetworkAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNetworkAcl"
                   outputClass:[AWSEC2CreateNetworkAclResult class]];
}

- (BFTask *)createNetworkAclEntry:(AWSEC2CreateNetworkAclEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNetworkAclEntry"
                   outputClass:nil];
}

- (BFTask *)createNetworkInterface:(AWSEC2CreateNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateNetworkInterface"
                   outputClass:[AWSEC2CreateNetworkInterfaceResult class]];
}

- (BFTask *)createPlacementGroup:(AWSEC2CreatePlacementGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePlacementGroup"
                   outputClass:nil];
}

- (BFTask *)createReservedInstancesListing:(AWSEC2CreateReservedInstancesListingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateReservedInstancesListing"
                   outputClass:[AWSEC2CreateReservedInstancesListingResult class]];
}

- (BFTask *)createRoute:(AWSEC2CreateRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateRoute"
                   outputClass:nil];
}

- (BFTask *)createRouteTable:(AWSEC2CreateRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateRouteTable"
                   outputClass:[AWSEC2CreateRouteTableResult class]];
}

- (BFTask *)createSecurityGroup:(AWSEC2CreateSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSecurityGroup"
                   outputClass:[AWSEC2CreateSecurityGroupResult class]];
}

- (BFTask *)createSnapshot:(AWSEC2CreateSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSnapshot"
                   outputClass:[AWSEC2Snapshot class]];
}

- (BFTask *)createSpotDatafeedSubscription:(AWSEC2CreateSpotDatafeedSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSpotDatafeedSubscription"
                   outputClass:[AWSEC2CreateSpotDatafeedSubscriptionResult class]];
}

- (BFTask *)createSubnet:(AWSEC2CreateSubnetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSubnet"
                   outputClass:[AWSEC2CreateSubnetResult class]];
}

- (BFTask *)createTags:(AWSEC2CreateTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTags"
                   outputClass:nil];
}

- (BFTask *)createVolume:(AWSEC2CreateVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVolume"
                   outputClass:[AWSEC2Volume class]];
}

- (BFTask *)createVpc:(AWSEC2CreateVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpc"
                   outputClass:[AWSEC2CreateVpcResult class]];
}

- (BFTask *)createVpcPeeringConnection:(AWSEC2CreateVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpcPeeringConnection"
                   outputClass:[AWSEC2CreateVpcPeeringConnectionResult class]];
}

- (BFTask *)createVpnConnection:(AWSEC2CreateVpnConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpnConnection"
                   outputClass:[AWSEC2CreateVpnConnectionResult class]];
}

- (BFTask *)createVpnConnectionRoute:(AWSEC2CreateVpnConnectionRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpnConnectionRoute"
                   outputClass:nil];
}

- (BFTask *)createVpnGateway:(AWSEC2CreateVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVpnGateway"
                   outputClass:[AWSEC2CreateVpnGatewayResult class]];
}

- (BFTask *)deleteCustomerGateway:(AWSEC2DeleteCustomerGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCustomerGateway"
                   outputClass:nil];
}

- (BFTask *)deleteDhcpOptions:(AWSEC2DeleteDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDhcpOptions"
                   outputClass:nil];
}

- (BFTask *)deleteInternetGateway:(AWSEC2DeleteInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteInternetGateway"
                   outputClass:nil];
}

- (BFTask *)deleteKeyPair:(AWSEC2DeleteKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteKeyPair"
                   outputClass:nil];
}

- (BFTask *)deleteNetworkAcl:(AWSEC2DeleteNetworkAclRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNetworkAcl"
                   outputClass:nil];
}

- (BFTask *)deleteNetworkAclEntry:(AWSEC2DeleteNetworkAclEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNetworkAclEntry"
                   outputClass:nil];
}

- (BFTask *)deleteNetworkInterface:(AWSEC2DeleteNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNetworkInterface"
                   outputClass:nil];
}

- (BFTask *)deletePlacementGroup:(AWSEC2DeletePlacementGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePlacementGroup"
                   outputClass:nil];
}

- (BFTask *)deleteRoute:(AWSEC2DeleteRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteRoute"
                   outputClass:nil];
}

- (BFTask *)deleteRouteTable:(AWSEC2DeleteRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteRouteTable"
                   outputClass:nil];
}

- (BFTask *)deleteSecurityGroup:(AWSEC2DeleteSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSecurityGroup"
                   outputClass:nil];
}

- (BFTask *)deleteSnapshot:(AWSEC2DeleteSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSnapshot"
                   outputClass:nil];
}

- (BFTask *)deleteSpotDatafeedSubscription:(AWSEC2DeleteSpotDatafeedSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSpotDatafeedSubscription"
                   outputClass:nil];
}

- (BFTask *)deleteSubnet:(AWSEC2DeleteSubnetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSubnet"
                   outputClass:nil];
}

- (BFTask *)deleteTags:(AWSEC2DeleteTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTags"
                   outputClass:nil];
}

- (BFTask *)deleteVolume:(AWSEC2DeleteVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVolume"
                   outputClass:nil];
}

- (BFTask *)deleteVpc:(AWSEC2DeleteVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpc"
                   outputClass:nil];
}

- (BFTask *)deleteVpcPeeringConnection:(AWSEC2DeleteVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpcPeeringConnection"
                   outputClass:[AWSEC2DeleteVpcPeeringConnectionResult class]];
}

- (BFTask *)deleteVpnConnection:(AWSEC2DeleteVpnConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpnConnection"
                   outputClass:nil];
}

- (BFTask *)deleteVpnConnectionRoute:(AWSEC2DeleteVpnConnectionRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpnConnectionRoute"
                   outputClass:nil];
}

- (BFTask *)deleteVpnGateway:(AWSEC2DeleteVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVpnGateway"
                   outputClass:nil];
}

- (BFTask *)deregisterImage:(AWSEC2DeregisterImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterImage"
                   outputClass:nil];
}

- (BFTask *)describeAccountAttributes:(AWSEC2DescribeAccountAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSEC2DescribeAccountAttributesResult class]];
}

- (BFTask *)describeAddresses:(AWSEC2DescribeAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAddresses"
                   outputClass:[AWSEC2DescribeAddressesResult class]];
}

- (BFTask *)describeAvailabilityZones:(AWSEC2DescribeAvailabilityZonesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAvailabilityZones"
                   outputClass:[AWSEC2DescribeAvailabilityZonesResult class]];
}

- (BFTask *)describeBundleTasks:(AWSEC2DescribeBundleTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeBundleTasks"
                   outputClass:[AWSEC2DescribeBundleTasksResult class]];
}

- (BFTask *)describeConversionTasks:(AWSEC2DescribeConversionTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeConversionTasks"
                   outputClass:[AWSEC2DescribeConversionTasksResult class]];
}

- (BFTask *)describeCustomerGateways:(AWSEC2DescribeCustomerGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCustomerGateways"
                   outputClass:[AWSEC2DescribeCustomerGatewaysResult class]];
}

- (BFTask *)describeDhcpOptions:(AWSEC2DescribeDhcpOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDhcpOptions"
                   outputClass:[AWSEC2DescribeDhcpOptionsResult class]];
}

- (BFTask *)describeExportTasks:(AWSEC2DescribeExportTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeExportTasks"
                   outputClass:[AWSEC2DescribeExportTasksResult class]];
}

- (BFTask *)describeImageAttribute:(AWSEC2DescribeImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeImageAttribute"
                   outputClass:[AWSEC2ImageAttribute class]];
}

- (BFTask *)describeImages:(AWSEC2DescribeImagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeImages"
                   outputClass:[AWSEC2DescribeImagesResult class]];
}

- (BFTask *)describeInstanceAttribute:(AWSEC2DescribeInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceAttribute"
                   outputClass:[AWSEC2InstanceAttribute class]];
}

- (BFTask *)describeInstanceStatus:(AWSEC2DescribeInstanceStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceStatus"
                   outputClass:[AWSEC2DescribeInstanceStatusResult class]];
}

- (BFTask *)describeInstances:(AWSEC2DescribeInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstances"
                   outputClass:[AWSEC2DescribeInstancesResult class]];
}

- (BFTask *)describeInternetGateways:(AWSEC2DescribeInternetGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInternetGateways"
                   outputClass:[AWSEC2DescribeInternetGatewaysResult class]];
}

- (BFTask *)describeKeyPairs:(AWSEC2DescribeKeyPairsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeKeyPairs"
                   outputClass:[AWSEC2DescribeKeyPairsResult class]];
}

- (BFTask *)describeNetworkAcls:(AWSEC2DescribeNetworkAclsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNetworkAcls"
                   outputClass:[AWSEC2DescribeNetworkAclsResult class]];
}

- (BFTask *)describeNetworkInterfaceAttribute:(AWSEC2DescribeNetworkInterfaceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNetworkInterfaceAttribute"
                   outputClass:[AWSEC2DescribeNetworkInterfaceAttributeResult class]];
}

- (BFTask *)describeNetworkInterfaces:(AWSEC2DescribeNetworkInterfacesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNetworkInterfaces"
                   outputClass:[AWSEC2DescribeNetworkInterfacesResult class]];
}

- (BFTask *)describePlacementGroups:(AWSEC2DescribePlacementGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePlacementGroups"
                   outputClass:[AWSEC2DescribePlacementGroupsResult class]];
}

- (BFTask *)describeRegions:(AWSEC2DescribeRegionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeRegions"
                   outputClass:[AWSEC2DescribeRegionsResult class]];
}

- (BFTask *)describeReservedInstances:(AWSEC2DescribeReservedInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstances"
                   outputClass:[AWSEC2DescribeReservedInstancesResult class]];
}

- (BFTask *)describeReservedInstancesListings:(AWSEC2DescribeReservedInstancesListingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstancesListings"
                   outputClass:[AWSEC2DescribeReservedInstancesListingsResult class]];
}

- (BFTask *)describeReservedInstancesModifications:(AWSEC2DescribeReservedInstancesModificationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstancesModifications"
                   outputClass:[AWSEC2DescribeReservedInstancesModificationsResult class]];
}

- (BFTask *)describeReservedInstancesOfferings:(AWSEC2DescribeReservedInstancesOfferingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedInstancesOfferings"
                   outputClass:[AWSEC2DescribeReservedInstancesOfferingsResult class]];
}

- (BFTask *)describeRouteTables:(AWSEC2DescribeRouteTablesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeRouteTables"
                   outputClass:[AWSEC2DescribeRouteTablesResult class]];
}

- (BFTask *)describeSecurityGroups:(AWSEC2DescribeSecurityGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSecurityGroups"
                   outputClass:[AWSEC2DescribeSecurityGroupsResult class]];
}

- (BFTask *)describeSnapshotAttribute:(AWSEC2DescribeSnapshotAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSnapshotAttribute"
                   outputClass:[AWSEC2DescribeSnapshotAttributeResult class]];
}

- (BFTask *)describeSnapshots:(AWSEC2DescribeSnapshotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSnapshots"
                   outputClass:[AWSEC2DescribeSnapshotsResult class]];
}

- (BFTask *)describeSpotDatafeedSubscription:(AWSEC2DescribeSpotDatafeedSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotDatafeedSubscription"
                   outputClass:[AWSEC2DescribeSpotDatafeedSubscriptionResult class]];
}

- (BFTask *)describeSpotInstanceRequests:(AWSEC2DescribeSpotInstanceRequestsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotInstanceRequests"
                   outputClass:[AWSEC2DescribeSpotInstanceRequestsResult class]];
}

- (BFTask *)describeSpotPriceHistory:(AWSEC2DescribeSpotPriceHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSpotPriceHistory"
                   outputClass:[AWSEC2DescribeSpotPriceHistoryResult class]];
}

- (BFTask *)describeSubnets:(AWSEC2DescribeSubnetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSubnets"
                   outputClass:[AWSEC2DescribeSubnetsResult class]];
}

- (BFTask *)describeTags:(AWSEC2DescribeTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSEC2DescribeTagsResult class]];
}

- (BFTask *)describeVolumeAttribute:(AWSEC2DescribeVolumeAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVolumeAttribute"
                   outputClass:[AWSEC2DescribeVolumeAttributeResult class]];
}

- (BFTask *)describeVolumeStatus:(AWSEC2DescribeVolumeStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVolumeStatus"
                   outputClass:[AWSEC2DescribeVolumeStatusResult class]];
}

- (BFTask *)describeVolumes:(AWSEC2DescribeVolumesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVolumes"
                   outputClass:[AWSEC2DescribeVolumesResult class]];
}

- (BFTask *)describeVpcAttribute:(AWSEC2DescribeVpcAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcAttribute"
                   outputClass:[AWSEC2DescribeVpcAttributeResult class]];
}

- (BFTask *)describeVpcPeeringConnections:(AWSEC2DescribeVpcPeeringConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcPeeringConnections"
                   outputClass:[AWSEC2DescribeVpcPeeringConnectionsResult class]];
}

- (BFTask *)describeVpcs:(AWSEC2DescribeVpcsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpcs"
                   outputClass:[AWSEC2DescribeVpcsResult class]];
}

- (BFTask *)describeVpnConnections:(AWSEC2DescribeVpnConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpnConnections"
                   outputClass:[AWSEC2DescribeVpnConnectionsResult class]];
}

- (BFTask *)describeVpnGateways:(AWSEC2DescribeVpnGatewaysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeVpnGateways"
                   outputClass:[AWSEC2DescribeVpnGatewaysResult class]];
}

- (BFTask *)detachInternetGateway:(AWSEC2DetachInternetGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachInternetGateway"
                   outputClass:nil];
}

- (BFTask *)detachNetworkInterface:(AWSEC2DetachNetworkInterfaceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachNetworkInterface"
                   outputClass:nil];
}

- (BFTask *)detachVolume:(AWSEC2DetachVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachVolume"
                   outputClass:[AWSEC2VolumeAttachment class]];
}

- (BFTask *)detachVpnGateway:(AWSEC2DetachVpnGatewayRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachVpnGateway"
                   outputClass:nil];
}

- (BFTask *)disableVgwRoutePropagation:(AWSEC2DisableVgwRoutePropagationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableVgwRoutePropagation"
                   outputClass:nil];
}

- (BFTask *)disassociateAddress:(AWSEC2DisassociateAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateAddress"
                   outputClass:nil];
}

- (BFTask *)disassociateRouteTable:(AWSEC2DisassociateRouteTableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateRouteTable"
                   outputClass:nil];
}

- (BFTask *)enableVgwRoutePropagation:(AWSEC2EnableVgwRoutePropagationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableVgwRoutePropagation"
                   outputClass:nil];
}

- (BFTask *)enableVolumeIO:(AWSEC2EnableVolumeIORequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableVolumeIO"
                   outputClass:nil];
}

- (BFTask *)getConsoleOutput:(AWSEC2GetConsoleOutputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetConsoleOutput"
                   outputClass:[AWSEC2GetConsoleOutputResult class]];
}

- (BFTask *)getPasswordData:(AWSEC2GetPasswordDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetPasswordData"
                   outputClass:[AWSEC2GetPasswordDataResult class]];
}

- (BFTask *)importInstance:(AWSEC2ImportInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportInstance"
                   outputClass:[AWSEC2ImportInstanceResult class]];
}

- (BFTask *)importKeyPair:(AWSEC2ImportKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportKeyPair"
                   outputClass:[AWSEC2ImportKeyPairResult class]];
}

- (BFTask *)importVolume:(AWSEC2ImportVolumeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportVolume"
                   outputClass:[AWSEC2ImportVolumeResult class]];
}

- (BFTask *)modifyImageAttribute:(AWSEC2ModifyImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyImageAttribute"
                   outputClass:nil];
}

- (BFTask *)modifyInstanceAttribute:(AWSEC2ModifyInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyInstanceAttribute"
                   outputClass:nil];
}

- (BFTask *)modifyNetworkInterfaceAttribute:(AWSEC2ModifyNetworkInterfaceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyNetworkInterfaceAttribute"
                   outputClass:nil];
}

- (BFTask *)modifyReservedInstances:(AWSEC2ModifyReservedInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyReservedInstances"
                   outputClass:[AWSEC2ModifyReservedInstancesResult class]];
}

- (BFTask *)modifySnapshotAttribute:(AWSEC2ModifySnapshotAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifySnapshotAttribute"
                   outputClass:nil];
}

- (BFTask *)modifySubnetAttribute:(AWSEC2ModifySubnetAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifySubnetAttribute"
                   outputClass:nil];
}

- (BFTask *)modifyVolumeAttribute:(AWSEC2ModifyVolumeAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVolumeAttribute"
                   outputClass:nil];
}

- (BFTask *)modifyVpcAttribute:(AWSEC2ModifyVpcAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyVpcAttribute"
                   outputClass:nil];
}

- (BFTask *)monitorInstances:(AWSEC2MonitorInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"MonitorInstances"
                   outputClass:[AWSEC2MonitorInstancesResult class]];
}

- (BFTask *)purchaseReservedInstancesOffering:(AWSEC2PurchaseReservedInstancesOfferingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PurchaseReservedInstancesOffering"
                   outputClass:[AWSEC2PurchaseReservedInstancesOfferingResult class]];
}

- (BFTask *)rebootInstances:(AWSEC2RebootInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RebootInstances"
                   outputClass:nil];
}

- (BFTask *)registerImage:(AWSEC2RegisterImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterImage"
                   outputClass:[AWSEC2RegisterImageResult class]];
}

- (BFTask *)rejectVpcPeeringConnection:(AWSEC2RejectVpcPeeringConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RejectVpcPeeringConnection"
                   outputClass:[AWSEC2RejectVpcPeeringConnectionResult class]];
}

- (BFTask *)releaseAddress:(AWSEC2ReleaseAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReleaseAddress"
                   outputClass:nil];
}

- (BFTask *)replaceNetworkAclAssociation:(AWSEC2ReplaceNetworkAclAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceNetworkAclAssociation"
                   outputClass:[AWSEC2ReplaceNetworkAclAssociationResult class]];
}

- (BFTask *)replaceNetworkAclEntry:(AWSEC2ReplaceNetworkAclEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceNetworkAclEntry"
                   outputClass:nil];
}

- (BFTask *)replaceRoute:(AWSEC2ReplaceRouteRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceRoute"
                   outputClass:nil];
}

- (BFTask *)replaceRouteTableAssociation:(AWSEC2ReplaceRouteTableAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplaceRouteTableAssociation"
                   outputClass:[AWSEC2ReplaceRouteTableAssociationResult class]];
}

- (BFTask *)replicateImage:(AWSEC2ReplicateImageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplicateImage"
                   outputClass:[AWSEC2ReplicateImageResult class]];
}

- (BFTask *)replicateSnapshot:(AWSEC2ReplicateSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReplicateSnapshot"
                   outputClass:[AWSEC2ReplicateSnapshotResult class]];
}

- (BFTask *)reportInstanceStatus:(AWSEC2ReportInstanceStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReportInstanceStatus"
                   outputClass:nil];
}

- (BFTask *)requestSpotInstances:(AWSEC2RequestSpotInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RequestSpotInstances"
                   outputClass:[AWSEC2RequestSpotInstancesResult class]];
}

- (BFTask *)resetImageAttribute:(AWSEC2ResetImageAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetImageAttribute"
                   outputClass:nil];
}

- (BFTask *)resetInstanceAttribute:(AWSEC2ResetInstanceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetInstanceAttribute"
                   outputClass:nil];
}

- (BFTask *)resetNetworkInterfaceAttribute:(AWSEC2ResetNetworkInterfaceAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetNetworkInterfaceAttribute"
                   outputClass:nil];
}

- (BFTask *)resetSnapshotAttribute:(AWSEC2ResetSnapshotAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetSnapshotAttribute"
                   outputClass:nil];
}

- (BFTask *)revokeSecurityGroupEgress:(AWSEC2RevokeSecurityGroupEgressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeSecurityGroupEgress"
                   outputClass:nil];
}

- (BFTask *)revokeSecurityGroupIngress:(AWSEC2RevokeSecurityGroupIngressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeSecurityGroupIngress"
                   outputClass:nil];
}

- (BFTask *)runInstances:(AWSEC2RunInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RunInstances"
                   outputClass:[AWSEC2Reservation class]];
}

- (BFTask *)startInstances:(AWSEC2StartInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartInstances"
                   outputClass:[AWSEC2StartInstancesResult class]];
}

- (BFTask *)stopInstances:(AWSEC2StopInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StopInstances"
                   outputClass:[AWSEC2StopInstancesResult class]];
}

- (BFTask *)terminateInstances:(AWSEC2TerminateInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TerminateInstances"
                   outputClass:[AWSEC2TerminateInstancesResult class]];
}

- (BFTask *)unassignPrivateIpAddresses:(AWSEC2UnassignPrivateIpAddressesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UnassignPrivateIpAddresses"
                   outputClass:nil];
}

- (BFTask *)unmonitorInstances:(AWSEC2UnmonitorInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UnmonitorInstances"
                   outputClass:[AWSEC2UnmonitorInstancesResult class]];
}

@end