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

#import "AWSElasticLoadBalancingService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSElasticLoadBalancingResources.h"

static NSString *const AWSInfoElasticLoadBalancing = @"ElasticLoadBalancing";
NSString *const AWSElasticLoadBalancingSDKVersion = @"2.13.2";


@interface AWSElasticLoadBalancingResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSElasticLoadBalancingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"LoadBalancerNotFound" : @(AWSElasticLoadBalancingErrorAccessPointNotFound),
                            @"CertificateNotFound" : @(AWSElasticLoadBalancingErrorCertificateNotFound),
                            @"DependencyThrottle" : @(AWSElasticLoadBalancingErrorDependencyThrottle),
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
                            @"OperationNotPermitted" : @(AWSElasticLoadBalancingErrorOperationNotPermitted),
                            @"PolicyNotFound" : @(AWSElasticLoadBalancingErrorPolicyNotFound),
                            @"PolicyTypeNotFound" : @(AWSElasticLoadBalancingErrorPolicyTypeNotFound),
                            @"SubnetNotFound" : @(AWSElasticLoadBalancingErrorSubnetNotFound),
                            @"TooManyLoadBalancers" : @(AWSElasticLoadBalancingErrorTooManyAccessPoints),
                            @"TooManyPolicies" : @(AWSElasticLoadBalancingErrorTooManyPolicies),
                            @"TooManyTags" : @(AWSElasticLoadBalancingErrorTooManyTags),
                            @"UnsupportedProtocol" : @(AWSElasticLoadBalancingErrorUnsupportedProtocol),
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
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSElasticLoadBalancingErrorDomain
                                     code:AWSElasticLoadBalancingErrorUnknown
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

@interface AWSElasticLoadBalancingRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSElasticLoadBalancingRequestRetryHandler

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

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSElasticLoadBalancing

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSElasticLoadBalancingSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSElasticLoadBalancing versions need to match. Check your SDK installation. AWSCore: %@ AWSElasticLoadBalancing: %@", AWSiOSSDKVersion, AWSElasticLoadBalancingSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultElasticLoadBalancing {
    static AWSElasticLoadBalancing *_defaultElasticLoadBalancing = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoElasticLoadBalancing];
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
        _defaultElasticLoadBalancing = [[AWSElasticLoadBalancing alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultElasticLoadBalancing;
}

+ (void)registerElasticLoadBalancingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSElasticLoadBalancing alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ElasticLoadBalancingForKey:(NSString *)key {
    @synchronized(self) {
        AWSElasticLoadBalancing *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoElasticLoadBalancing
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSElasticLoadBalancing registerElasticLoadBalancingWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
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

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceElasticLoadBalancing
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceElasticLoadBalancing];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
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

- (AWSTask<AWSElasticLoadBalancingAddTagsOutput *> *)addTags:(AWSElasticLoadBalancingAddTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddTags"
                   outputClass:[AWSElasticLoadBalancingAddTagsOutput class]];
}

- (void)addTags:(AWSElasticLoadBalancingAddTagsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingAddTagsOutput *response, NSError *error))completionHandler {
    [[self addTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingAddTagsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingAddTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput *> *)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ApplySecurityGroupsToLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput class]];
}

- (void)applySecurityGroupsToLoadBalancer:(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput *response, NSError *error))completionHandler {
    [[self applySecurityGroupsToLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingApplySecurityGroupsToLoadBalancerOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput *> *)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachLoadBalancerToSubnets"
                   outputClass:[AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput class]];
}

- (void)attachLoadBalancerToSubnets:(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput *response, NSError *error))completionHandler {
    [[self attachLoadBalancerToSubnets:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingAttachLoadBalancerToSubnetsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingConfigureHealthCheckOutput *> *)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ConfigureHealthCheck"
                   outputClass:[AWSElasticLoadBalancingConfigureHealthCheckOutput class]];
}

- (void)configureHealthCheck:(AWSElasticLoadBalancingConfigureHealthCheckInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingConfigureHealthCheckOutput *response, NSError *error))completionHandler {
    [[self configureHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingConfigureHealthCheckOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingConfigureHealthCheckOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput *> *)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateAppCookieStickinessPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput class]];
}

- (void)createAppCookieStickinessPolicy:(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput *response, NSError *error))completionHandler {
    [[self createAppCookieStickinessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingCreateAppCookieStickinessPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput *> *)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLBCookieStickinessPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput class]];
}

- (void)createLBCookieStickinessPolicy:(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput *response, NSError *error))completionHandler {
    [[self createLBCookieStickinessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingCreateLBCookieStickinessPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingCreateAccessPointOutput *> *)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingCreateAccessPointOutput class]];
}

- (void)createLoadBalancer:(AWSElasticLoadBalancingCreateAccessPointInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingCreateAccessPointOutput *response, NSError *error))completionHandler {
    [[self createLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingCreateAccessPointOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingCreateAccessPointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingCreateLoadBalancerListenerOutput *> *)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancerListeners"
                   outputClass:[AWSElasticLoadBalancingCreateLoadBalancerListenerOutput class]];
}

- (void)createLoadBalancerListeners:(AWSElasticLoadBalancingCreateLoadBalancerListenerInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingCreateLoadBalancerListenerOutput *response, NSError *error))completionHandler {
    [[self createLoadBalancerListeners:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingCreateLoadBalancerListenerOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingCreateLoadBalancerListenerOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput *> *)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancerPolicy"
                   outputClass:[AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput class]];
}

- (void)createLoadBalancerPolicy:(AWSElasticLoadBalancingCreateLoadBalancerPolicyInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput *response, NSError *error))completionHandler {
    [[self createLoadBalancerPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingCreateLoadBalancerPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDeleteAccessPointOutput *> *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingDeleteAccessPointOutput class]];
}

- (void)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteAccessPointInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDeleteAccessPointOutput *response, NSError *error))completionHandler {
    [[self deleteLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDeleteAccessPointOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDeleteAccessPointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput *> *)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancerListeners"
                   outputClass:[AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput class]];
}

- (void)deleteLoadBalancerListeners:(AWSElasticLoadBalancingDeleteLoadBalancerListenerInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput *response, NSError *error))completionHandler {
    [[self deleteLoadBalancerListeners:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDeleteLoadBalancerListenerOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput *> *)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancerPolicy"
                   outputClass:[AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput class]];
}

- (void)deleteLoadBalancerPolicy:(AWSElasticLoadBalancingDeleteLoadBalancerPolicyInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput *response, NSError *error))completionHandler {
    [[self deleteLoadBalancerPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDeleteLoadBalancerPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDeregisterEndPointsOutput *> *)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterInstancesFromLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingDeregisterEndPointsOutput class]];
}

- (void)deregisterInstancesFromLoadBalancer:(AWSElasticLoadBalancingDeregisterEndPointsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDeregisterEndPointsOutput *response, NSError *error))completionHandler {
    [[self deregisterInstancesFromLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDeregisterEndPointsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDeregisterEndPointsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeAccountLimitsOutput *> *)describeAccountLimits:(AWSElasticLoadBalancingDescribeAccountLimitsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountLimits"
                   outputClass:[AWSElasticLoadBalancingDescribeAccountLimitsOutput class]];
}

- (void)describeAccountLimits:(AWSElasticLoadBalancingDescribeAccountLimitsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeAccountLimitsOutput *response, NSError *error))completionHandler {
    [[self describeAccountLimits:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeAccountLimitsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeAccountLimitsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeEndPointStateOutput *> *)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstanceHealth"
                   outputClass:[AWSElasticLoadBalancingDescribeEndPointStateOutput class]];
}

- (void)describeInstanceHealth:(AWSElasticLoadBalancingDescribeEndPointStateInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeEndPointStateOutput *response, NSError *error))completionHandler {
    [[self describeInstanceHealth:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeEndPointStateOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeEndPointStateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput *> *)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerAttributes"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput class]];
}

- (void)describeLoadBalancerAttributes:(AWSElasticLoadBalancingDescribeLoadBalancerAttributesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput *response, NSError *error))completionHandler {
    [[self describeLoadBalancerAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeLoadBalancerAttributesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput *> *)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerPolicies"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput class]];
}

- (void)describeLoadBalancerPolicies:(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput *response, NSError *error))completionHandler {
    [[self describeLoadBalancerPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeLoadBalancerPoliciesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput *> *)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerPolicyTypes"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput class]];
}

- (void)describeLoadBalancerPolicyTypes:(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput *response, NSError *error))completionHandler {
    [[self describeLoadBalancerPolicyTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeLoadBalancerPolicyTypesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeAccessPointsOutput *> *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancers"
                   outputClass:[AWSElasticLoadBalancingDescribeAccessPointsOutput class]];
}

- (void)describeLoadBalancers:(AWSElasticLoadBalancingDescribeAccessPointsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeAccessPointsOutput *response, NSError *error))completionHandler {
    [[self describeLoadBalancers:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeAccessPointsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeAccessPointsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeTagsOutput *> *)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSElasticLoadBalancingDescribeTagsOutput class]];
}

- (void)describeTags:(AWSElasticLoadBalancingDescribeTagsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeTagsOutput *response, NSError *error))completionHandler {
    [[self describeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeTagsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput *> *)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachLoadBalancerFromSubnets"
                   outputClass:[AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput class]];
}

- (void)detachLoadBalancerFromSubnets:(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput *response, NSError *error))completionHandler {
    [[self detachLoadBalancerFromSubnets:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDetachLoadBalancerFromSubnetsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingRemoveAvailabilityZonesOutput *> *)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableAvailabilityZonesForLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingRemoveAvailabilityZonesOutput class]];
}

- (void)disableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingRemoveAvailabilityZonesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingRemoveAvailabilityZonesOutput *response, NSError *error))completionHandler {
    [[self disableAvailabilityZonesForLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingRemoveAvailabilityZonesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingRemoveAvailabilityZonesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingAddAvailabilityZonesOutput *> *)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableAvailabilityZonesForLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingAddAvailabilityZonesOutput class]];
}

- (void)enableAvailabilityZonesForLoadBalancer:(AWSElasticLoadBalancingAddAvailabilityZonesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingAddAvailabilityZonesOutput *response, NSError *error))completionHandler {
    [[self enableAvailabilityZonesForLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingAddAvailabilityZonesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingAddAvailabilityZonesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput *> *)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyLoadBalancerAttributes"
                   outputClass:[AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput class]];
}

- (void)modifyLoadBalancerAttributes:(AWSElasticLoadBalancingModifyLoadBalancerAttributesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput *response, NSError *error))completionHandler {
    [[self modifyLoadBalancerAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingModifyLoadBalancerAttributesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingRegisterEndPointsOutput *> *)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterInstancesWithLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingRegisterEndPointsOutput class]];
}

- (void)registerInstancesWithLoadBalancer:(AWSElasticLoadBalancingRegisterEndPointsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingRegisterEndPointsOutput *response, NSError *error))completionHandler {
    [[self registerInstancesWithLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingRegisterEndPointsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingRegisterEndPointsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingRemoveTagsOutput *> *)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveTags"
                   outputClass:[AWSElasticLoadBalancingRemoveTagsOutput class]];
}

- (void)removeTags:(AWSElasticLoadBalancingRemoveTagsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingRemoveTagsOutput *response, NSError *error))completionHandler {
    [[self removeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingRemoveTagsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingRemoveTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput *> *)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerListenerSSLCertificate"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput class]];
}

- (void)setLoadBalancerListenerSSLCertificate:(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput *response, NSError *error))completionHandler {
    [[self setLoadBalancerListenerSSLCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingSetLoadBalancerListenerSSLCertificateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput *> *)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerPoliciesForBackendServer"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput class]];
}

- (void)setLoadBalancerPoliciesForBackendServer:(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput *response, NSError *error))completionHandler {
    [[self setLoadBalancerPoliciesForBackendServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput *> *)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetLoadBalancerPoliciesOfListener"
                   outputClass:[AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput class]];
}

- (void)setLoadBalancerPoliciesOfListener:(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput *response, NSError *error))completionHandler {
    [[self setLoadBalancerPoliciesOfListener:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingSetLoadBalancerPoliciesOfListenerOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
