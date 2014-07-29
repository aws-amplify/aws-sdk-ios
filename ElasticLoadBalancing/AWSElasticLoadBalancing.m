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

#import "AWSElasticLoadBalancing.h"

#import "AZNetworking.h"
#import "AZCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"

NSString *const AWSELBDefinitionFileName = @"elasticloadbalancing-2012-06-01";

@interface AWSElasticLoadBalancingResponseSerializer : AWSXMLResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

@end

@implementation AWSElasticLoadBalancingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSElasticLoadBalancingErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSElasticLoadBalancingErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSElasticLoadBalancingErrorMissingAuthenticationToken),
                            @"AccessPointNotFoundException" : @(AWSElasticLoadBalancingErrorAccessPointNotFound),
                            @"CertificateNotFoundException" : @(AWSElasticLoadBalancingErrorCertificateNotFound),
                            @"DuplicateAccessPointNameException" : @(AWSElasticLoadBalancingErrorDuplicateAccessPointName),
                            @"DuplicateListenerException" : @(AWSElasticLoadBalancingErrorDuplicateListener),
                            @"DuplicatePolicyNameException" : @(AWSElasticLoadBalancingErrorDuplicatePolicyName),
                            @"InvalidConfigurationRequestException" : @(AWSElasticLoadBalancingErrorInvalidConfigurationRequest),
                            @"InvalidEndPointException" : @(AWSElasticLoadBalancingErrorInvalidEndPoint),
                            @"InvalidSchemeException" : @(AWSElasticLoadBalancingErrorInvalidScheme),
                            @"InvalidSecurityGroupException" : @(AWSElasticLoadBalancingErrorInvalidSecurityGroup),
                            @"InvalidSubnetException" : @(AWSElasticLoadBalancingErrorInvalidSubnet),
                            @"ListenerNotFoundException" : @(AWSElasticLoadBalancingErrorListenerNotFound),
                            @"LoadBalancerAttributeNotFoundException" : @(AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound),
                            @"PolicyNotFoundException" : @(AWSElasticLoadBalancingErrorPolicyNotFound),
                            @"PolicyTypeNotFoundException" : @(AWSElasticLoadBalancingErrorPolicyTypeNotFound),
                            @"SubnetNotFoundException" : @(AWSElasticLoadBalancingErrorSubnetNotFound),
                            @"TooManyAccessPointsException" : @(AWSElasticLoadBalancingErrorTooManyAccessPoints),
                            @"TooManyPoliciesException" : @(AWSElasticLoadBalancingErrorTooManyPolicies),
                            };
}

#pragma mark -

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSElasticLoadBalancingResponseSerializer *serializer = [AWSElasticLoadBalancingResponseSerializer serializerWithResource:resource
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
                *error = [NSError errorWithDomain:AWSElasticLoadBalancingErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:@{NSLocalizedDescriptionKey :[errorInfo objectForKey:@"Message"]?[errorInfo objectForKey:@"Message"]:[NSNull null]}
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSElasticLoadBalancingErrorDomain
                                             code:AWSElasticLoadBalancingErrorUnknown
                                         userInfo:@{NSLocalizedDescriptionKey : [NSString stringWithFormat:@"%@ -- %@",[errorInfo objectForKey:@"Code"],[errorInfo objectForKey:@"Message"]?[errorInfo objectForKey:@"Message"]:[NSNull null]]
                                                    }];
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

@interface AWSElasticLoadBalancingRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSElasticLoadBalancingRequestRetryHandler

- (AZNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                            response:(NSHTTPURLResponse *)response
                                data:(NSData *)data
                               error:(NSError *)error {
    AZNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                response:response
                                                    data:data
                                                   error:error];
    if(retryType == AZNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSElasticLoadBalancingErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        switch (error.code) {
            case AWSElasticLoadBalancingErrorIncompleteSignature:
            case AWSElasticLoadBalancingErrorInvalidClientTokenId:
            case AWSElasticLoadBalancingErrorMissingAuthenticationToken:
                retryType = AZNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                break;

            default:
                break;
        }
    }

    return retryType;
}

@end

@interface AWSRequest()

@property (nonatomic, strong) AZNetworkingRequest *internalRequest;

@end

@interface AWSElasticLoadBalancing()

@property (nonatomic, strong) AZNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSElasticLoadBalancing

+ (instancetype)defaultElasticLoadBalancing {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSElasticLoadBalancing *_defaultElasticLoadBalancing = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultElasticLoadBalancing = [[AWSElasticLoadBalancing alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultElasticLoadBalancing;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                            service:AWSServiceElasticLoadBalancing];

        AWSSignatureV2Signer *signer = [AWSSignatureV2Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_endpoint];

        _configuration.baseURL = _endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSElasticLoadBalancingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Host" : _endpoint.hostName};

        _networking = [AZNetworking networking:_configuration];
    }

    return self;
}

- (BFTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AZHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    if (!request) {
        request = [AWSRequest new];
    }

    AZNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[MTLJSONAdapter JSONDictionaryFromModel:request] az_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }
    networkingRequest.HTTPMethod = HTTPMethod;

    AWSQueryStringRequestSerializer *requestSerializer = [AWSQueryStringRequestSerializer serializerWithResource:AWSELBDefinitionFileName actionName:operationName];
    networkingRequest.requestSerializer = requestSerializer;

    networkingRequest.responseSerializer = [AWSElasticLoadBalancingResponseSerializer serializerWithOutputClass:outputClass
                                                                                      resource:AWSELBDefinitionFileName
                                                                                    actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ApplySecurityGroupsToLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput class]];
}

- (BFTask *)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachLoadBalancerToSubnets"
                   outputClass:[AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput class]];
}

- (BFTask *)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ConfigureHealthCheck"
                   outputClass:[AWSElasticLoadBalancingConfigureHealthCheckOutput class]];
}

- (BFTask *)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateAppCookieStickinessPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput class]];
}

- (BFTask *)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLBCookieStickinessPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput class]];
}

- (BFTask *)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingCreateAccessPointOutput class]];
}

- (BFTask *)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancerListeners"
                   outputClass:[AWSElasticLoadBalancingCreateLoadBalancerListenerOutput class]];
}

- (BFTask *)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancerPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput class]];
}

- (BFTask *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingDeleteAccessPointOutput class]];
}

- (BFTask *)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancerListeners"
                   outputClass:[AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput class]];
}

- (BFTask *)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancerPolicy"
                   outputClass:[AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput class]];
}

- (BFTask *)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterInstancesFromLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingDeregisterEndPointsOutput class]];
}

- (BFTask *)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceHealth"
                   outputClass:[AWSElasticLoadBalancingDescribeEndPointStateOutput class]];
}

- (BFTask *)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerAttributes"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput class]];
}

- (BFTask *)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerPolicies"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput class]];
}

- (BFTask *)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerPolicyTypes"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput class]];
}

- (BFTask *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancers"
                   outputClass:[AWSElasticLoadBalancingDescribeAccessPointsOutput class]];
}

- (BFTask *)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachLoadBalancerFromSubnets"
                   outputClass:[AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput class]];
}

- (BFTask *)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableAvailabilityZonesForLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingRemoveAvailabilityZonesOutput class]];
}

- (BFTask *)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableAvailabilityZonesForLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingAddAvailabilityZonesOutput class]];
}

- (BFTask *)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyLoadBalancerAttributes"
                   outputClass:[AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput class]];
}

- (BFTask *)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterInstancesWithLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingRegisterEndPointsOutput class]];
}

- (BFTask *)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerListenerSSLCertificate"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput class]];
}

- (BFTask *)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerPoliciesForBackendServer"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput class]];
}

- (BFTask *)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerPoliciesOfListener"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput class]];
}

@end