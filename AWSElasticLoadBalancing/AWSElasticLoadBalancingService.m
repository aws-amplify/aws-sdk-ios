//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
NSString *const AWSElasticLoadBalancingSDKVersion = @"2.27.4";


@interface AWSElasticLoadBalancingResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSElasticLoadBalancingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ALPNPolicyNotFound" : @(AWSElasticLoadBalancingErrorALPNPolicyNotSupported),
                            @"AllocationIdNotFound" : @(AWSElasticLoadBalancingErrorAllocationIdNotFound),
                            @"AvailabilityZoneNotSupported" : @(AWSElasticLoadBalancingErrorAvailabilityZoneNotSupported),
                            @"CertificateNotFound" : @(AWSElasticLoadBalancingErrorCertificateNotFound),
                            @"DuplicateListener" : @(AWSElasticLoadBalancingErrorDuplicateListener),
                            @"DuplicateLoadBalancerName" : @(AWSElasticLoadBalancingErrorDuplicateLoadBalancerName),
                            @"DuplicateTagKeys" : @(AWSElasticLoadBalancingErrorDuplicateTagKeys),
                            @"DuplicateTargetGroupName" : @(AWSElasticLoadBalancingErrorDuplicateTargetGroupName),
                            @"HealthUnavailable" : @(AWSElasticLoadBalancingErrorHealthUnavailable),
                            @"IncompatibleProtocols" : @(AWSElasticLoadBalancingErrorIncompatibleProtocols),
                            @"InvalidConfigurationRequest" : @(AWSElasticLoadBalancingErrorInvalidConfigurationRequest),
                            @"InvalidLoadBalancerAction" : @(AWSElasticLoadBalancingErrorInvalidLoadBalancerAction),
                            @"InvalidScheme" : @(AWSElasticLoadBalancingErrorInvalidScheme),
                            @"InvalidSecurityGroup" : @(AWSElasticLoadBalancingErrorInvalidSecurityGroup),
                            @"InvalidSubnet" : @(AWSElasticLoadBalancingErrorInvalidSubnet),
                            @"InvalidTarget" : @(AWSElasticLoadBalancingErrorInvalidTarget),
                            @"ListenerNotFound" : @(AWSElasticLoadBalancingErrorListenerNotFound),
                            @"LoadBalancerNotFound" : @(AWSElasticLoadBalancingErrorLoadBalancerNotFound),
                            @"OperationNotPermitted" : @(AWSElasticLoadBalancingErrorOperationNotPermitted),
                            @"PriorityInUse" : @(AWSElasticLoadBalancingErrorPriorityInUse),
                            @"ResourceInUse" : @(AWSElasticLoadBalancingErrorResourceInUse),
                            @"RuleNotFound" : @(AWSElasticLoadBalancingErrorRuleNotFound),
                            @"SSLPolicyNotFound" : @(AWSElasticLoadBalancingErrorSSLPolicyNotFound),
                            @"SubnetNotFound" : @(AWSElasticLoadBalancingErrorSubnetNotFound),
                            @"TargetGroupAssociationLimit" : @(AWSElasticLoadBalancingErrorTargetGroupAssociationLimit),
                            @"TargetGroupNotFound" : @(AWSElasticLoadBalancingErrorTargetGroupNotFound),
                            @"TooManyActions" : @(AWSElasticLoadBalancingErrorTooManyActions),
                            @"TooManyCertificates" : @(AWSElasticLoadBalancingErrorTooManyCertificates),
                            @"TooManyListeners" : @(AWSElasticLoadBalancingErrorTooManyListeners),
                            @"TooManyLoadBalancers" : @(AWSElasticLoadBalancingErrorTooManyLoadBalancers),
                            @"TooManyRegistrationsForTargetId" : @(AWSElasticLoadBalancingErrorTooManyRegistrationsForTargetId),
                            @"TooManyRules" : @(AWSElasticLoadBalancingErrorTooManyRules),
                            @"TooManyTags" : @(AWSElasticLoadBalancingErrorTooManyTags),
                            @"TooManyTargetGroups" : @(AWSElasticLoadBalancingErrorTooManyTargetGroups),
                            @"TooManyTargets" : @(AWSElasticLoadBalancingErrorTooManyTargets),
                            @"TooManyUniqueTargetGroupsPerLoadBalancer" : @(AWSElasticLoadBalancingErrorTooManyUniqueTargetGroupsPerLoadBalancer),
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

- (AWSTask<AWSElasticLoadBalancingAddListenerCertificatesOutput *> *)addListenerCertificates:(AWSElasticLoadBalancingAddListenerCertificatesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddListenerCertificates"
                   outputClass:[AWSElasticLoadBalancingAddListenerCertificatesOutput class]];
}

- (void)addListenerCertificates:(AWSElasticLoadBalancingAddListenerCertificatesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingAddListenerCertificatesOutput *response, NSError *error))completionHandler {
    [[self addListenerCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingAddListenerCertificatesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingAddListenerCertificatesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

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

- (AWSTask<AWSElasticLoadBalancingCreateListenerOutput *> *)createListener:(AWSElasticLoadBalancingCreateListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateListener"
                   outputClass:[AWSElasticLoadBalancingCreateListenerOutput class]];
}

- (void)createListener:(AWSElasticLoadBalancingCreateListenerInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingCreateListenerOutput *response, NSError *error))completionHandler {
    [[self createListener:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingCreateListenerOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingCreateListenerOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingCreateLoadBalancerOutput *> *)createLoadBalancer:(AWSElasticLoadBalancingCreateLoadBalancerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingCreateLoadBalancerOutput class]];
}

- (void)createLoadBalancer:(AWSElasticLoadBalancingCreateLoadBalancerInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingCreateLoadBalancerOutput *response, NSError *error))completionHandler {
    [[self createLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingCreateLoadBalancerOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingCreateLoadBalancerOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingCreateRuleOutput *> *)createRule:(AWSElasticLoadBalancingCreateRuleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateRule"
                   outputClass:[AWSElasticLoadBalancingCreateRuleOutput class]];
}

- (void)createRule:(AWSElasticLoadBalancingCreateRuleInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingCreateRuleOutput *response, NSError *error))completionHandler {
    [[self createRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingCreateRuleOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingCreateRuleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingCreateTargetGroupOutput *> *)createTargetGroup:(AWSElasticLoadBalancingCreateTargetGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTargetGroup"
                   outputClass:[AWSElasticLoadBalancingCreateTargetGroupOutput class]];
}

- (void)createTargetGroup:(AWSElasticLoadBalancingCreateTargetGroupInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingCreateTargetGroupOutput *response, NSError *error))completionHandler {
    [[self createTargetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingCreateTargetGroupOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingCreateTargetGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDeleteListenerOutput *> *)deleteListener:(AWSElasticLoadBalancingDeleteListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteListener"
                   outputClass:[AWSElasticLoadBalancingDeleteListenerOutput class]];
}

- (void)deleteListener:(AWSElasticLoadBalancingDeleteListenerInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDeleteListenerOutput *response, NSError *error))completionHandler {
    [[self deleteListener:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDeleteListenerOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDeleteListenerOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerOutput *> *)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteLoadBalancerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoadBalancer"
                   outputClass:[AWSElasticLoadBalancingDeleteLoadBalancerOutput class]];
}

- (void)deleteLoadBalancer:(AWSElasticLoadBalancingDeleteLoadBalancerInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDeleteLoadBalancerOutput *response, NSError *error))completionHandler {
    [[self deleteLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDeleteLoadBalancerOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDeleteLoadBalancerOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDeleteRuleOutput *> *)deleteRule:(AWSElasticLoadBalancingDeleteRuleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteRule"
                   outputClass:[AWSElasticLoadBalancingDeleteRuleOutput class]];
}

- (void)deleteRule:(AWSElasticLoadBalancingDeleteRuleInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDeleteRuleOutput *response, NSError *error))completionHandler {
    [[self deleteRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDeleteRuleOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDeleteRuleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDeleteTargetGroupOutput *> *)deleteTargetGroup:(AWSElasticLoadBalancingDeleteTargetGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTargetGroup"
                   outputClass:[AWSElasticLoadBalancingDeleteTargetGroupOutput class]];
}

- (void)deleteTargetGroup:(AWSElasticLoadBalancingDeleteTargetGroupInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDeleteTargetGroupOutput *response, NSError *error))completionHandler {
    [[self deleteTargetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDeleteTargetGroupOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDeleteTargetGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDeregisterTargetsOutput *> *)deregisterTargets:(AWSElasticLoadBalancingDeregisterTargetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterTargets"
                   outputClass:[AWSElasticLoadBalancingDeregisterTargetsOutput class]];
}

- (void)deregisterTargets:(AWSElasticLoadBalancingDeregisterTargetsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDeregisterTargetsOutput *response, NSError *error))completionHandler {
    [[self deregisterTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDeregisterTargetsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDeregisterTargetsOutput *result = task.result;
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

- (AWSTask<AWSElasticLoadBalancingDescribeListenerCertificatesOutput *> *)describeListenerCertificates:(AWSElasticLoadBalancingDescribeListenerCertificatesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeListenerCertificates"
                   outputClass:[AWSElasticLoadBalancingDescribeListenerCertificatesOutput class]];
}

- (void)describeListenerCertificates:(AWSElasticLoadBalancingDescribeListenerCertificatesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeListenerCertificatesOutput *response, NSError *error))completionHandler {
    [[self describeListenerCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeListenerCertificatesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeListenerCertificatesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeListenersOutput *> *)describeListeners:(AWSElasticLoadBalancingDescribeListenersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeListeners"
                   outputClass:[AWSElasticLoadBalancingDescribeListenersOutput class]];
}

- (void)describeListeners:(AWSElasticLoadBalancingDescribeListenersInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeListenersOutput *response, NSError *error))completionHandler {
    [[self describeListeners:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeListenersOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeListenersOutput *result = task.result;
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

- (AWSTask<AWSElasticLoadBalancingDescribeLoadBalancersOutput *> *)describeLoadBalancers:(AWSElasticLoadBalancingDescribeLoadBalancersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancers"
                   outputClass:[AWSElasticLoadBalancingDescribeLoadBalancersOutput class]];
}

- (void)describeLoadBalancers:(AWSElasticLoadBalancingDescribeLoadBalancersInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeLoadBalancersOutput *response, NSError *error))completionHandler {
    [[self describeLoadBalancers:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeLoadBalancersOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeLoadBalancersOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeRulesOutput *> *)describeRules:(AWSElasticLoadBalancingDescribeRulesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeRules"
                   outputClass:[AWSElasticLoadBalancingDescribeRulesOutput class]];
}

- (void)describeRules:(AWSElasticLoadBalancingDescribeRulesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeRulesOutput *response, NSError *error))completionHandler {
    [[self describeRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeRulesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeRulesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeSSLPoliciesOutput *> *)describeSSLPolicies:(AWSElasticLoadBalancingDescribeSSLPoliciesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSSLPolicies"
                   outputClass:[AWSElasticLoadBalancingDescribeSSLPoliciesOutput class]];
}

- (void)describeSSLPolicies:(AWSElasticLoadBalancingDescribeSSLPoliciesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeSSLPoliciesOutput *response, NSError *error))completionHandler {
    [[self describeSSLPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeSSLPoliciesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeSSLPoliciesOutput *result = task.result;
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

- (AWSTask<AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput *> *)describeTargetGroupAttributes:(AWSElasticLoadBalancingDescribeTargetGroupAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTargetGroupAttributes"
                   outputClass:[AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput class]];
}

- (void)describeTargetGroupAttributes:(AWSElasticLoadBalancingDescribeTargetGroupAttributesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput *response, NSError *error))completionHandler {
    [[self describeTargetGroupAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeTargetGroupAttributesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeTargetGroupsOutput *> *)describeTargetGroups:(AWSElasticLoadBalancingDescribeTargetGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTargetGroups"
                   outputClass:[AWSElasticLoadBalancingDescribeTargetGroupsOutput class]];
}

- (void)describeTargetGroups:(AWSElasticLoadBalancingDescribeTargetGroupsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeTargetGroupsOutput *response, NSError *error))completionHandler {
    [[self describeTargetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeTargetGroupsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeTargetGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingDescribeTargetHealthOutput *> *)describeTargetHealth:(AWSElasticLoadBalancingDescribeTargetHealthInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTargetHealth"
                   outputClass:[AWSElasticLoadBalancingDescribeTargetHealthOutput class]];
}

- (void)describeTargetHealth:(AWSElasticLoadBalancingDescribeTargetHealthInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingDescribeTargetHealthOutput *response, NSError *error))completionHandler {
    [[self describeTargetHealth:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingDescribeTargetHealthOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingDescribeTargetHealthOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingModifyListenerOutput *> *)modifyListener:(AWSElasticLoadBalancingModifyListenerInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyListener"
                   outputClass:[AWSElasticLoadBalancingModifyListenerOutput class]];
}

- (void)modifyListener:(AWSElasticLoadBalancingModifyListenerInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingModifyListenerOutput *response, NSError *error))completionHandler {
    [[self modifyListener:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingModifyListenerOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingModifyListenerOutput *result = task.result;
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

- (AWSTask<AWSElasticLoadBalancingModifyRuleOutput *> *)modifyRule:(AWSElasticLoadBalancingModifyRuleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyRule"
                   outputClass:[AWSElasticLoadBalancingModifyRuleOutput class]];
}

- (void)modifyRule:(AWSElasticLoadBalancingModifyRuleInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingModifyRuleOutput *response, NSError *error))completionHandler {
    [[self modifyRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingModifyRuleOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingModifyRuleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingModifyTargetGroupOutput *> *)modifyTargetGroup:(AWSElasticLoadBalancingModifyTargetGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyTargetGroup"
                   outputClass:[AWSElasticLoadBalancingModifyTargetGroupOutput class]];
}

- (void)modifyTargetGroup:(AWSElasticLoadBalancingModifyTargetGroupInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingModifyTargetGroupOutput *response, NSError *error))completionHandler {
    [[self modifyTargetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingModifyTargetGroupOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingModifyTargetGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingModifyTargetGroupAttributesOutput *> *)modifyTargetGroupAttributes:(AWSElasticLoadBalancingModifyTargetGroupAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyTargetGroupAttributes"
                   outputClass:[AWSElasticLoadBalancingModifyTargetGroupAttributesOutput class]];
}

- (void)modifyTargetGroupAttributes:(AWSElasticLoadBalancingModifyTargetGroupAttributesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingModifyTargetGroupAttributesOutput *response, NSError *error))completionHandler {
    [[self modifyTargetGroupAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingModifyTargetGroupAttributesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingModifyTargetGroupAttributesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingRegisterTargetsOutput *> *)registerTargets:(AWSElasticLoadBalancingRegisterTargetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterTargets"
                   outputClass:[AWSElasticLoadBalancingRegisterTargetsOutput class]];
}

- (void)registerTargets:(AWSElasticLoadBalancingRegisterTargetsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingRegisterTargetsOutput *response, NSError *error))completionHandler {
    [[self registerTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingRegisterTargetsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingRegisterTargetsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingRemoveListenerCertificatesOutput *> *)removeListenerCertificates:(AWSElasticLoadBalancingRemoveListenerCertificatesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveListenerCertificates"
                   outputClass:[AWSElasticLoadBalancingRemoveListenerCertificatesOutput class]];
}

- (void)removeListenerCertificates:(AWSElasticLoadBalancingRemoveListenerCertificatesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingRemoveListenerCertificatesOutput *response, NSError *error))completionHandler {
    [[self removeListenerCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingRemoveListenerCertificatesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingRemoveListenerCertificatesOutput *result = task.result;
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

- (AWSTask<AWSElasticLoadBalancingSetIpAddressTypeOutput *> *)setIpAddressType:(AWSElasticLoadBalancingSetIpAddressTypeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIpAddressType"
                   outputClass:[AWSElasticLoadBalancingSetIpAddressTypeOutput class]];
}

- (void)setIpAddressType:(AWSElasticLoadBalancingSetIpAddressTypeInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingSetIpAddressTypeOutput *response, NSError *error))completionHandler {
    [[self setIpAddressType:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingSetIpAddressTypeOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingSetIpAddressTypeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingSetRulePrioritiesOutput *> *)setRulePriorities:(AWSElasticLoadBalancingSetRulePrioritiesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetRulePriorities"
                   outputClass:[AWSElasticLoadBalancingSetRulePrioritiesOutput class]];
}

- (void)setRulePriorities:(AWSElasticLoadBalancingSetRulePrioritiesInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingSetRulePrioritiesOutput *response, NSError *error))completionHandler {
    [[self setRulePriorities:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingSetRulePrioritiesOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingSetRulePrioritiesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingSetSecurityGroupsOutput *> *)setSecurityGroups:(AWSElasticLoadBalancingSetSecurityGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetSecurityGroups"
                   outputClass:[AWSElasticLoadBalancingSetSecurityGroupsOutput class]];
}

- (void)setSecurityGroups:(AWSElasticLoadBalancingSetSecurityGroupsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingSetSecurityGroupsOutput *response, NSError *error))completionHandler {
    [[self setSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingSetSecurityGroupsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingSetSecurityGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticLoadBalancingSetSubnetsOutput *> *)setSubnets:(AWSElasticLoadBalancingSetSubnetsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetSubnets"
                   outputClass:[AWSElasticLoadBalancingSetSubnetsOutput class]];
}

- (void)setSubnets:(AWSElasticLoadBalancingSetSubnetsInput *)request
     completionHandler:(void (^)(AWSElasticLoadBalancingSetSubnetsOutput *response, NSError *error))completionHandler {
    [[self setSubnets:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticLoadBalancingSetSubnetsOutput *> * _Nonnull task) {
        AWSElasticLoadBalancingSetSubnetsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
