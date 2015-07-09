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

#import "AWSElasticLoadBalancing.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSElasticLoadBalancingResources.h"

NSString *const AWSELBDefinitionFileName = @"elasticloadbalancing-2012-06-01";

@interface AWSElasticLoadBalancingResponseSerializer : AWSXMLResponseSerializer

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
            responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
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

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultElasticLoadBalancing {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSElasticLoadBalancing *_defaultElasticLoadBalancing = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultElasticLoadBalancing = [[AWSElasticLoadBalancing alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultElasticLoadBalancing;
}

+ (void)registerElasticLoadBalancingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSElasticLoadBalancing alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)ElasticLoadBalancingForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeElasticLoadBalancingForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultElasticLoadBalancing` or `+ ElasticLoadBalancingForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceElasticLoadBalancing
                                                         useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSElasticLoadBalancingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];

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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSElasticLoadBalancingResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSElasticLoadBalancingResponseSerializer alloc] initWithJSONDefinition:[[AWSElasticLoadBalancingResources sharedInstance] JSONObject]
                                                                                                              actionName:operationName
                                                                                                             outputClass:outputClass];
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)addTags:(AWSElasticLoadBalancingAddTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddTags"
                   outputClass:[AWSElasticLoadBalancingAddTagsOutput class]];
}

- (AWSTask *)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ApplySecurityGroupsToLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput class]];
}

- (AWSTask *)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachLoadBalancerToSubnets"
                   outputClass:[AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput class]];
}

- (AWSTask *)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ConfigureHealthCheck"
                   outputClass:[AWSElasticLoadBalancingConfigureHealthCheckOutput class]];
}

- (AWSTask *)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateAppCookieStickinessPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput class]];
}

- (AWSTask *)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLBCookieStickinessPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput class]];
}

- (AWSTask *)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingCreateAccessPointOutput class]];
}

- (AWSTask *)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancerListeners"
                   outputClass:[AWSElasticLoadBalancingCreateLoadBalancerListenerOutput class]];
}

- (AWSTask *)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancerPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput class]];
}

- (AWSTask *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingDeleteAccessPointOutput class]];
}

- (AWSTask *)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancerListeners"
                   outputClass:[AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput class]];
}

- (AWSTask *)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancerPolicy"
                   outputClass:[AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput class]];
}

- (AWSTask *)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterInstancesFromLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingDeregisterEndPointsOutput class]];
}

- (AWSTask *)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceHealth"
                   outputClass:[AWSElasticLoadBalancingDescribeEndPointStateOutput class]];
}

- (AWSTask *)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerAttributes"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput class]];
}

- (AWSTask *)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerPolicies"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput class]];
}

- (AWSTask *)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerPolicyTypes"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput class]];
}

- (AWSTask *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancers"
                   outputClass:[AWSElasticLoadBalancingDescribeAccessPointsOutput class]];
}

- (AWSTask *)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSElasticLoadBalancingDescribeTagsOutput class]];
}

- (AWSTask *)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachLoadBalancerFromSubnets"
                   outputClass:[AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput class]];
}

- (AWSTask *)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableAvailabilityZonesForLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingRemoveAvailabilityZonesOutput class]];
}

- (AWSTask *)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableAvailabilityZonesForLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingAddAvailabilityZonesOutput class]];
}

- (AWSTask *)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyLoadBalancerAttributes"
                   outputClass:[AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput class]];
}

- (AWSTask *)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterInstancesWithLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingRegisterEndPointsOutput class]];
}

- (AWSTask *)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveTags"
                   outputClass:[AWSElasticLoadBalancingRemoveTagsOutput class]];
}

- (AWSTask *)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerListenerSSLCertificate"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput class]];
}

- (AWSTask *)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerPoliciesForBackendServer"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput class]];
}

- (AWSTask *)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerPoliciesOfListener"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput class]];
}

@end