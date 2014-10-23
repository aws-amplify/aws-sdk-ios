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

#import "AWSNetworking.h"
#import "AWSCategory.h"
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
                            @"LoadBalancerNotFound" : @(AWSElasticLoadBalancingErrorAccessPointNotFound),
                            @"CertificateNotFound" : @(AWSElasticLoadBalancingErrorCertificateNotFound),
                            @"DuplicateLoadBalancerName" : @(AWSElasticLoadBalancingErrorDuplicateAccessPointName),
                            @"DuplicateListener" : @(AWSElasticLoadBalancingErrorDuplicateListener),
                            @"DuplicatePolicyName" : @(AWSElasticLoadBalancingErrorDuplicatePolicyName),
                            @"DuplicateTagKeys" : @(AWSElasticLoadBalancingErrorDuplicateTagKeys),
                            @"InvalidConfigurationRequest" : @(AWSElasticLoadBalancingErrorInvalidConfigurationRequest),
                            @"InvalidInstance" : @(AWSElasticLoadBalancingErrorInvalidEndPoint),
                            @"InvalidScheme" : @(AWSElasticLoadBalancingErrorInvalidScheme),
                            @"InvalidSecurityGroup" : @(AWSElasticLoadBalancingErrorInvalidSecurityGroup),
                            @"InvalidSubnet" : @(AWSElasticLoadBalancingErrorInvalidSubnet),
                            @"ListenerNotFound" : @(AWSElasticLoadBalancingErrorListenerNotFound),
                            @"LoadBalancerAttributeNotFound" : @(AWSElasticLoadBalancingErrorLoadBalancerAttributeNotFound),
                            @"PolicyNotFound" : @(AWSElasticLoadBalancingErrorPolicyNotFound),
                            @"PolicyTypeNotFound" : @(AWSElasticLoadBalancingErrorPolicyTypeNotFound),
                            @"SubnetNotFound" : @(AWSElasticLoadBalancingErrorSubnetNotFound),
                            @"TooManyLoadBalancers" : @(AWSElasticLoadBalancingErrorTooManyAccessPoints),
                            @"TooManyPolicies" : @(AWSElasticLoadBalancingErrorTooManyPolicies),
                            @"TooManyTags" : @(AWSElasticLoadBalancingErrorTooManyTags),
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
                                         userInfo:errorInfo
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSElasticLoadBalancingErrorDomain
                                             code:AWSElasticLoadBalancingErrorUnknown
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

@interface AWSElasticLoadBalancingRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSElasticLoadBalancingRequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && currentRetryCount < self.maxRetryCount) {
        if ([error.domain isEqualToString:AWSElasticLoadBalancingErrorDomain]) {
            switch (error.code) {
                case AWSElasticLoadBalancingErrorIncompleteSignature:
                case AWSElasticLoadBalancingErrorInvalidClientTokenId:
                case AWSElasticLoadBalancingErrorMissingAuthenticationToken:
                    retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                    break;

                default:
                    break;
            }
        } else if ([error.domain isEqualToString:AWSGeneralErrorDomain]) {
            switch (error.code) {
                case AWSGeneralErrorSignatureDoesNotMatch:
                    retryType = AWSNetworkingRetryTypeShouldCorrectClockSkewAndRetry;
                    break;

                default:
                    break;
            }
        }
    }

    return retryType;
}

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSElasticLoadBalancing()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

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

        _configuration.endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                                          service:AWSServiceElasticLoadBalancing];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSElasticLoadBalancingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

    AWSQueryStringRequestSerializer *requestSerializer = [AWSQueryStringRequestSerializer serializerWithResource:AWSELBDefinitionFileName actionName:operationName];
    networkingRequest.requestSerializer = requestSerializer;

    networkingRequest.responseSerializer = [AWSElasticLoadBalancingResponseSerializer serializerWithOutputClass:outputClass
                                                                                                       resource:AWSELBDefinitionFileName
                                                                                                     actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)addTags:(AWSElasticLoadBalancingAddTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddTags"
                   outputClass:[AWSElasticLoadBalancingAddTagsOutput class]];
}

- (BFTask *)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ApplySecurityGroupsToLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput class]];
}

- (BFTask *)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachLoadBalancerToSubnets"
                   outputClass:[AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput class]];
}

- (BFTask *)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ConfigureHealthCheck"
                   outputClass:[AWSElasticLoadBalancingConfigureHealthCheckOutput class]];
}

- (BFTask *)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateAppCookieStickinessPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput class]];
}

- (BFTask *)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLBCookieStickinessPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput class]];
}

- (BFTask *)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingCreateAccessPointOutput class]];
}

- (BFTask *)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancerListeners"
                   outputClass:[AWSElasticLoadBalancingCreateLoadBalancerListenerOutput class]];
}

- (BFTask *)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancerPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput class]];
}

- (BFTask *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingDeleteAccessPointOutput class]];
}

- (BFTask *)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancerListeners"
                   outputClass:[AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput class]];
}

- (BFTask *)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancerPolicy"
                   outputClass:[AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput class]];
}

- (BFTask *)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterInstancesFromLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingDeregisterEndPointsOutput class]];
}

- (BFTask *)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceHealth"
                   outputClass:[AWSElasticLoadBalancingDescribeEndPointStateOutput class]];
}

- (BFTask *)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerAttributes"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput class]];
}

- (BFTask *)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerPolicies"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput class]];
}

- (BFTask *)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerPolicyTypes"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput class]];
}

- (BFTask *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancers"
                   outputClass:[AWSElasticLoadBalancingDescribeAccessPointsOutput class]];
}

- (BFTask *)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSElasticLoadBalancingDescribeTagsOutput class]];
}

- (BFTask *)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachLoadBalancerFromSubnets"
                   outputClass:[AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput class]];
}

- (BFTask *)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableAvailabilityZonesForLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingRemoveAvailabilityZonesOutput class]];
}

- (BFTask *)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableAvailabilityZonesForLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingAddAvailabilityZonesOutput class]];
}

- (BFTask *)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyLoadBalancerAttributes"
                   outputClass:[AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput class]];
}

- (BFTask *)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterInstancesWithLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingRegisterEndPointsOutput class]];
}

- (BFTask *)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveTags"
                   outputClass:[AWSElasticLoadBalancingRemoveTagsOutput class]];
}

- (BFTask *)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerListenerSSLCertificate"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput class]];
}

- (BFTask *)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerPoliciesForBackendServer"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput class]];
}

- (BFTask *)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerPoliciesOfListener"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput class]];
}

@end