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

#import "AWSroute53Service.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSroute53Resources.h"

static NSString *const AWSInforoute53 = @"route53";
NSString *const AWSroute53SDKVersion = @"2.13.2";


@interface AWSroute53ResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSroute53ResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConcurrentModification" : @(AWSroute53ErrorConcurrentModification),
                            @"ConflictingDomainExists" : @(AWSroute53ErrorConflictingDomainExists),
                            @"ConflictingTypes" : @(AWSroute53ErrorConflictingTypes),
                            @"DelegationSetAlreadyCreated" : @(AWSroute53ErrorDelegationSetAlreadyCreated),
                            @"DelegationSetAlreadyReusable" : @(AWSroute53ErrorDelegationSetAlreadyReusable),
                            @"DelegationSetInUse" : @(AWSroute53ErrorDelegationSetInUse),
                            @"DelegationSetNotAvailable" : @(AWSroute53ErrorDelegationSetNotAvailable),
                            @"DelegationSetNotReusable" : @(AWSroute53ErrorDelegationSetNotReusable),
                            @"HealthCheckAlreadyExists" : @(AWSroute53ErrorHealthCheckAlreadyExists),
                            @"HealthCheckInUse" : @(AWSroute53ErrorHealthCheckInUse),
                            @"HealthCheckVersionMismatch" : @(AWSroute53ErrorHealthCheckVersionMismatch),
                            @"HostedZoneAlreadyExists" : @(AWSroute53ErrorHostedZoneAlreadyExists),
                            @"HostedZoneNotEmpty" : @(AWSroute53ErrorHostedZoneNotEmpty),
                            @"HostedZoneNotFound" : @(AWSroute53ErrorHostedZoneNotFound),
                            @"HostedZoneNotPrivate" : @(AWSroute53ErrorHostedZoneNotPrivate),
                            @"IncompatibleVersion" : @(AWSroute53ErrorIncompatibleVersion),
                            @"InsufficientCloudWatchLogsResourcePolicy" : @(AWSroute53ErrorInsufficientCloudWatchLogsResourcePolicy),
                            @"InvalidArgument" : @(AWSroute53ErrorInvalidArgument),
                            @"InvalidChangeBatch" : @(AWSroute53ErrorInvalidChangeBatch),
                            @"InvalidDomainName" : @(AWSroute53ErrorInvalidDomainName),
                            @"InvalidInput" : @(AWSroute53ErrorInvalidInput),
                            @"InvalidPaginationToken" : @(AWSroute53ErrorInvalidPaginationToken),
                            @"InvalidTrafficPolicyDocument" : @(AWSroute53ErrorInvalidTrafficPolicyDocument),
                            @"InvalidVPCId" : @(AWSroute53ErrorInvalidVPCId),
                            @"LastVPCAssociation" : @(AWSroute53ErrorLastVPCAssociation),
                            @"LimitsExceeded" : @(AWSroute53ErrorLimitsExceeded),
                            @"NoSuchChange" : @(AWSroute53ErrorNoSuchChange),
                            @"NoSuchCloudWatchLogsLogGroup" : @(AWSroute53ErrorNoSuchCloudWatchLogsLogGroup),
                            @"NoSuchDelegationSet" : @(AWSroute53ErrorNoSuchDelegationSet),
                            @"NoSuchGeoLocation" : @(AWSroute53ErrorNoSuchGeoLocation),
                            @"NoSuchHealthCheck" : @(AWSroute53ErrorNoSuchHealthCheck),
                            @"NoSuchHostedZone" : @(AWSroute53ErrorNoSuchHostedZone),
                            @"NoSuchQueryLoggingConfig" : @(AWSroute53ErrorNoSuchQueryLoggingConfig),
                            @"NoSuchTrafficPolicy" : @(AWSroute53ErrorNoSuchTrafficPolicy),
                            @"NoSuchTrafficPolicyInstance" : @(AWSroute53ErrorNoSuchTrafficPolicyInstance),
                            @"NotAuthorizedException" : @(AWSroute53ErrorNotAuthorized),
                            @"PriorRequestNotComplete" : @(AWSroute53ErrorPriorRequestNotComplete),
                            @"PublicZoneVPCAssociation" : @(AWSroute53ErrorPublicZoneVPCAssociation),
                            @"QueryLoggingConfigAlreadyExists" : @(AWSroute53ErrorQueryLoggingConfigAlreadyExists),
                            @"ThrottlingException" : @(AWSroute53ErrorThrottling),
                            @"TooManyHealthChecks" : @(AWSroute53ErrorTooManyHealthChecks),
                            @"TooManyHostedZones" : @(AWSroute53ErrorTooManyHostedZones),
                            @"TooManyTrafficPolicies" : @(AWSroute53ErrorTooManyTrafficPolicies),
                            @"TooManyTrafficPolicyInstances" : @(AWSroute53ErrorTooManyTrafficPolicyInstances),
                            @"TooManyTrafficPolicyVersionsForCurrentPolicy" : @(AWSroute53ErrorTooManyTrafficPolicyVersionsForCurrentPolicy),
                            @"TooManyVPCAssociationAuthorizations" : @(AWSroute53ErrorTooManyVPCAssociationAuthorizations),
                            @"TrafficPolicyAlreadyExists" : @(AWSroute53ErrorTrafficPolicyAlreadyExists),
                            @"TrafficPolicyInUse" : @(AWSroute53ErrorTrafficPolicyInUse),
                            @"TrafficPolicyInstanceAlreadyExists" : @(AWSroute53ErrorTrafficPolicyInstanceAlreadyExists),
                            @"VPCAssociationAuthorizationNotFound" : @(AWSroute53ErrorVPCAssociationAuthorizationNotFound),
                            @"VPCAssociationNotFound" : @(AWSroute53ErrorVPCAssociationNotFound),
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
	                *error = [NSError errorWithDomain:AWSroute53ErrorDomain
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
        *error = [NSError errorWithDomain:AWSroute53ErrorDomain
                                     code:AWSroute53ErrorUnknown
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

@interface AWSroute53RequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSroute53RequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSroute53()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSroute53

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSroute53SDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSroute53 versions need to match. Check your SDK installation. AWSCore: %@ AWSroute53: %@", AWSiOSSDKVersion, AWSroute53SDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultroute53 {
    static AWSroute53 *_defaultroute53 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInforoute53];
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
        _defaultroute53 = [[AWSroute53 alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultroute53;
}

+ (void)registerroute53WithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSroute53 alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)route53ForKey:(NSString *)key {
    @synchronized(self) {
        AWSroute53 *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInforoute53
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSroute53 registerroute53WithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeroute53ForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultroute53` or `+ route53ForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceroute53
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceroute53];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSroute53RequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSXMLRequestSerializer alloc] initWithJSONDefinition:[[AWSroute53Resources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSroute53ResponseSerializer alloc] initWithJSONDefinition:[[AWSroute53Resources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSroute53AssociateVPCWithHostedZoneResponse *> *)associateVPCWithHostedZone:(AWSroute53AssociateVPCWithHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}/associatevpc"
                  targetPrefix:@""
                 operationName:@"AssociateVPCWithHostedZone"
                   outputClass:[AWSroute53AssociateVPCWithHostedZoneResponse class]];
}

- (void)associateVPCWithHostedZone:(AWSroute53AssociateVPCWithHostedZoneRequest *)request
     completionHandler:(void (^)(AWSroute53AssociateVPCWithHostedZoneResponse *response, NSError *error))completionHandler {
    [[self associateVPCWithHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53AssociateVPCWithHostedZoneResponse *> * _Nonnull task) {
        AWSroute53AssociateVPCWithHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ChangeResourceRecordSetsResponse *> *)changeResourceRecordSets:(AWSroute53ChangeResourceRecordSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}/rrset/"
                  targetPrefix:@""
                 operationName:@"ChangeResourceRecordSets"
                   outputClass:[AWSroute53ChangeResourceRecordSetsResponse class]];
}

- (void)changeResourceRecordSets:(AWSroute53ChangeResourceRecordSetsRequest *)request
     completionHandler:(void (^)(AWSroute53ChangeResourceRecordSetsResponse *response, NSError *error))completionHandler {
    [[self changeResourceRecordSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ChangeResourceRecordSetsResponse *> * _Nonnull task) {
        AWSroute53ChangeResourceRecordSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ChangeTagsForResourceResponse *> *)changeTagsForResource:(AWSroute53ChangeTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/tags/{ResourceType}/{ResourceId}"
                  targetPrefix:@""
                 operationName:@"ChangeTagsForResource"
                   outputClass:[AWSroute53ChangeTagsForResourceResponse class]];
}

- (void)changeTagsForResource:(AWSroute53ChangeTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSroute53ChangeTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self changeTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ChangeTagsForResourceResponse *> * _Nonnull task) {
        AWSroute53ChangeTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53CreateHealthCheckResponse *> *)createHealthCheck:(AWSroute53CreateHealthCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/healthcheck"
                  targetPrefix:@""
                 operationName:@"CreateHealthCheck"
                   outputClass:[AWSroute53CreateHealthCheckResponse class]];
}

- (void)createHealthCheck:(AWSroute53CreateHealthCheckRequest *)request
     completionHandler:(void (^)(AWSroute53CreateHealthCheckResponse *response, NSError *error))completionHandler {
    [[self createHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53CreateHealthCheckResponse *> * _Nonnull task) {
        AWSroute53CreateHealthCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53CreateHostedZoneResponse *> *)createHostedZone:(AWSroute53CreateHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone"
                  targetPrefix:@""
                 operationName:@"CreateHostedZone"
                   outputClass:[AWSroute53CreateHostedZoneResponse class]];
}

- (void)createHostedZone:(AWSroute53CreateHostedZoneRequest *)request
     completionHandler:(void (^)(AWSroute53CreateHostedZoneResponse *response, NSError *error))completionHandler {
    [[self createHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53CreateHostedZoneResponse *> * _Nonnull task) {
        AWSroute53CreateHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53CreateQueryLoggingConfigResponse *> *)createQueryLoggingConfig:(AWSroute53CreateQueryLoggingConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/queryloggingconfig"
                  targetPrefix:@""
                 operationName:@"CreateQueryLoggingConfig"
                   outputClass:[AWSroute53CreateQueryLoggingConfigResponse class]];
}

- (void)createQueryLoggingConfig:(AWSroute53CreateQueryLoggingConfigRequest *)request
     completionHandler:(void (^)(AWSroute53CreateQueryLoggingConfigResponse *response, NSError *error))completionHandler {
    [[self createQueryLoggingConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53CreateQueryLoggingConfigResponse *> * _Nonnull task) {
        AWSroute53CreateQueryLoggingConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53CreateReusableDelegationSetResponse *> *)createReusableDelegationSet:(AWSroute53CreateReusableDelegationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/delegationset"
                  targetPrefix:@""
                 operationName:@"CreateReusableDelegationSet"
                   outputClass:[AWSroute53CreateReusableDelegationSetResponse class]];
}

- (void)createReusableDelegationSet:(AWSroute53CreateReusableDelegationSetRequest *)request
     completionHandler:(void (^)(AWSroute53CreateReusableDelegationSetResponse *response, NSError *error))completionHandler {
    [[self createReusableDelegationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53CreateReusableDelegationSetResponse *> * _Nonnull task) {
        AWSroute53CreateReusableDelegationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53CreateTrafficPolicyResponse *> *)createTrafficPolicy:(AWSroute53CreateTrafficPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/trafficpolicy"
                  targetPrefix:@""
                 operationName:@"CreateTrafficPolicy"
                   outputClass:[AWSroute53CreateTrafficPolicyResponse class]];
}

- (void)createTrafficPolicy:(AWSroute53CreateTrafficPolicyRequest *)request
     completionHandler:(void (^)(AWSroute53CreateTrafficPolicyResponse *response, NSError *error))completionHandler {
    [[self createTrafficPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53CreateTrafficPolicyResponse *> * _Nonnull task) {
        AWSroute53CreateTrafficPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53CreateTrafficPolicyInstanceResponse *> *)createTrafficPolicyInstance:(AWSroute53CreateTrafficPolicyInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/trafficpolicyinstance"
                  targetPrefix:@""
                 operationName:@"CreateTrafficPolicyInstance"
                   outputClass:[AWSroute53CreateTrafficPolicyInstanceResponse class]];
}

- (void)createTrafficPolicyInstance:(AWSroute53CreateTrafficPolicyInstanceRequest *)request
     completionHandler:(void (^)(AWSroute53CreateTrafficPolicyInstanceResponse *response, NSError *error))completionHandler {
    [[self createTrafficPolicyInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53CreateTrafficPolicyInstanceResponse *> * _Nonnull task) {
        AWSroute53CreateTrafficPolicyInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53CreateTrafficPolicyVersionResponse *> *)createTrafficPolicyVersion:(AWSroute53CreateTrafficPolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/trafficpolicy/{Id}"
                  targetPrefix:@""
                 operationName:@"CreateTrafficPolicyVersion"
                   outputClass:[AWSroute53CreateTrafficPolicyVersionResponse class]];
}

- (void)createTrafficPolicyVersion:(AWSroute53CreateTrafficPolicyVersionRequest *)request
     completionHandler:(void (^)(AWSroute53CreateTrafficPolicyVersionResponse *response, NSError *error))completionHandler {
    [[self createTrafficPolicyVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53CreateTrafficPolicyVersionResponse *> * _Nonnull task) {
        AWSroute53CreateTrafficPolicyVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53CreateVPCAssociationAuthorizationResponse *> *)createVPCAssociationAuthorization:(AWSroute53CreateVPCAssociationAuthorizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}/authorizevpcassociation"
                  targetPrefix:@""
                 operationName:@"CreateVPCAssociationAuthorization"
                   outputClass:[AWSroute53CreateVPCAssociationAuthorizationResponse class]];
}

- (void)createVPCAssociationAuthorization:(AWSroute53CreateVPCAssociationAuthorizationRequest *)request
     completionHandler:(void (^)(AWSroute53CreateVPCAssociationAuthorizationResponse *response, NSError *error))completionHandler {
    [[self createVPCAssociationAuthorization:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53CreateVPCAssociationAuthorizationResponse *> * _Nonnull task) {
        AWSroute53CreateVPCAssociationAuthorizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53DeleteHealthCheckResponse *> *)deleteHealthCheck:(AWSroute53DeleteHealthCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/healthcheck/{HealthCheckId}"
                  targetPrefix:@""
                 operationName:@"DeleteHealthCheck"
                   outputClass:[AWSroute53DeleteHealthCheckResponse class]];
}

- (void)deleteHealthCheck:(AWSroute53DeleteHealthCheckRequest *)request
     completionHandler:(void (^)(AWSroute53DeleteHealthCheckResponse *response, NSError *error))completionHandler {
    [[self deleteHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53DeleteHealthCheckResponse *> * _Nonnull task) {
        AWSroute53DeleteHealthCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53DeleteHostedZoneResponse *> *)deleteHostedZone:(AWSroute53DeleteHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/hostedzone/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteHostedZone"
                   outputClass:[AWSroute53DeleteHostedZoneResponse class]];
}

- (void)deleteHostedZone:(AWSroute53DeleteHostedZoneRequest *)request
     completionHandler:(void (^)(AWSroute53DeleteHostedZoneResponse *response, NSError *error))completionHandler {
    [[self deleteHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53DeleteHostedZoneResponse *> * _Nonnull task) {
        AWSroute53DeleteHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53DeleteQueryLoggingConfigResponse *> *)deleteQueryLoggingConfig:(AWSroute53DeleteQueryLoggingConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/queryloggingconfig/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteQueryLoggingConfig"
                   outputClass:[AWSroute53DeleteQueryLoggingConfigResponse class]];
}

- (void)deleteQueryLoggingConfig:(AWSroute53DeleteQueryLoggingConfigRequest *)request
     completionHandler:(void (^)(AWSroute53DeleteQueryLoggingConfigResponse *response, NSError *error))completionHandler {
    [[self deleteQueryLoggingConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53DeleteQueryLoggingConfigResponse *> * _Nonnull task) {
        AWSroute53DeleteQueryLoggingConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53DeleteReusableDelegationSetResponse *> *)deleteReusableDelegationSet:(AWSroute53DeleteReusableDelegationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/delegationset/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteReusableDelegationSet"
                   outputClass:[AWSroute53DeleteReusableDelegationSetResponse class]];
}

- (void)deleteReusableDelegationSet:(AWSroute53DeleteReusableDelegationSetRequest *)request
     completionHandler:(void (^)(AWSroute53DeleteReusableDelegationSetResponse *response, NSError *error))completionHandler {
    [[self deleteReusableDelegationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53DeleteReusableDelegationSetResponse *> * _Nonnull task) {
        AWSroute53DeleteReusableDelegationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53DeleteTrafficPolicyResponse *> *)deleteTrafficPolicy:(AWSroute53DeleteTrafficPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/trafficpolicy/{Id}/{Version}"
                  targetPrefix:@""
                 operationName:@"DeleteTrafficPolicy"
                   outputClass:[AWSroute53DeleteTrafficPolicyResponse class]];
}

- (void)deleteTrafficPolicy:(AWSroute53DeleteTrafficPolicyRequest *)request
     completionHandler:(void (^)(AWSroute53DeleteTrafficPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteTrafficPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53DeleteTrafficPolicyResponse *> * _Nonnull task) {
        AWSroute53DeleteTrafficPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53DeleteTrafficPolicyInstanceResponse *> *)deleteTrafficPolicyInstance:(AWSroute53DeleteTrafficPolicyInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/trafficpolicyinstance/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteTrafficPolicyInstance"
                   outputClass:[AWSroute53DeleteTrafficPolicyInstanceResponse class]];
}

- (void)deleteTrafficPolicyInstance:(AWSroute53DeleteTrafficPolicyInstanceRequest *)request
     completionHandler:(void (^)(AWSroute53DeleteTrafficPolicyInstanceResponse *response, NSError *error))completionHandler {
    [[self deleteTrafficPolicyInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53DeleteTrafficPolicyInstanceResponse *> * _Nonnull task) {
        AWSroute53DeleteTrafficPolicyInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53DeleteVPCAssociationAuthorizationResponse *> *)deleteVPCAssociationAuthorization:(AWSroute53DeleteVPCAssociationAuthorizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}/deauthorizevpcassociation"
                  targetPrefix:@""
                 operationName:@"DeleteVPCAssociationAuthorization"
                   outputClass:[AWSroute53DeleteVPCAssociationAuthorizationResponse class]];
}

- (void)deleteVPCAssociationAuthorization:(AWSroute53DeleteVPCAssociationAuthorizationRequest *)request
     completionHandler:(void (^)(AWSroute53DeleteVPCAssociationAuthorizationResponse *response, NSError *error))completionHandler {
    [[self deleteVPCAssociationAuthorization:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53DeleteVPCAssociationAuthorizationResponse *> * _Nonnull task) {
        AWSroute53DeleteVPCAssociationAuthorizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53DisassociateVPCFromHostedZoneResponse *> *)disassociateVPCFromHostedZone:(AWSroute53DisassociateVPCFromHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}/disassociatevpc"
                  targetPrefix:@""
                 operationName:@"DisassociateVPCFromHostedZone"
                   outputClass:[AWSroute53DisassociateVPCFromHostedZoneResponse class]];
}

- (void)disassociateVPCFromHostedZone:(AWSroute53DisassociateVPCFromHostedZoneRequest *)request
     completionHandler:(void (^)(AWSroute53DisassociateVPCFromHostedZoneResponse *response, NSError *error))completionHandler {
    [[self disassociateVPCFromHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53DisassociateVPCFromHostedZoneResponse *> * _Nonnull task) {
        AWSroute53DisassociateVPCFromHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetAccountLimitResponse *> *)getAccountLimit:(AWSroute53GetAccountLimitRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/accountlimit/{Type}"
                  targetPrefix:@""
                 operationName:@"GetAccountLimit"
                   outputClass:[AWSroute53GetAccountLimitResponse class]];
}

- (void)getAccountLimit:(AWSroute53GetAccountLimitRequest *)request
     completionHandler:(void (^)(AWSroute53GetAccountLimitResponse *response, NSError *error))completionHandler {
    [[self getAccountLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetAccountLimitResponse *> * _Nonnull task) {
        AWSroute53GetAccountLimitResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetChangeResponse *> *)getChange:(AWSroute53GetChangeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/change/{Id}"
                  targetPrefix:@""
                 operationName:@"GetChange"
                   outputClass:[AWSroute53GetChangeResponse class]];
}

- (void)getChange:(AWSroute53GetChangeRequest *)request
     completionHandler:(void (^)(AWSroute53GetChangeResponse *response, NSError *error))completionHandler {
    [[self getChange:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetChangeResponse *> * _Nonnull task) {
        AWSroute53GetChangeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetCheckerIpRangesResponse *> *)getCheckerIpRanges:(AWSroute53GetCheckerIpRangesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/checkeripranges"
                  targetPrefix:@""
                 operationName:@"GetCheckerIpRanges"
                   outputClass:[AWSroute53GetCheckerIpRangesResponse class]];
}

- (void)getCheckerIpRanges:(AWSroute53GetCheckerIpRangesRequest *)request
     completionHandler:(void (^)(AWSroute53GetCheckerIpRangesResponse *response, NSError *error))completionHandler {
    [[self getCheckerIpRanges:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetCheckerIpRangesResponse *> * _Nonnull task) {
        AWSroute53GetCheckerIpRangesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetGeoLocationResponse *> *)getGeoLocation:(AWSroute53GetGeoLocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/geolocation"
                  targetPrefix:@""
                 operationName:@"GetGeoLocation"
                   outputClass:[AWSroute53GetGeoLocationResponse class]];
}

- (void)getGeoLocation:(AWSroute53GetGeoLocationRequest *)request
     completionHandler:(void (^)(AWSroute53GetGeoLocationResponse *response, NSError *error))completionHandler {
    [[self getGeoLocation:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetGeoLocationResponse *> * _Nonnull task) {
        AWSroute53GetGeoLocationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetHealthCheckResponse *> *)getHealthCheck:(AWSroute53GetHealthCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/healthcheck/{HealthCheckId}"
                  targetPrefix:@""
                 operationName:@"GetHealthCheck"
                   outputClass:[AWSroute53GetHealthCheckResponse class]];
}

- (void)getHealthCheck:(AWSroute53GetHealthCheckRequest *)request
     completionHandler:(void (^)(AWSroute53GetHealthCheckResponse *response, NSError *error))completionHandler {
    [[self getHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetHealthCheckResponse *> * _Nonnull task) {
        AWSroute53GetHealthCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetHealthCheckCountResponse *> *)getHealthCheckCount:(AWSroute53GetHealthCheckCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/healthcheckcount"
                  targetPrefix:@""
                 operationName:@"GetHealthCheckCount"
                   outputClass:[AWSroute53GetHealthCheckCountResponse class]];
}

- (void)getHealthCheckCount:(AWSroute53GetHealthCheckCountRequest *)request
     completionHandler:(void (^)(AWSroute53GetHealthCheckCountResponse *response, NSError *error))completionHandler {
    [[self getHealthCheckCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetHealthCheckCountResponse *> * _Nonnull task) {
        AWSroute53GetHealthCheckCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetHealthCheckLastFailureReasonResponse *> *)getHealthCheckLastFailureReason:(AWSroute53GetHealthCheckLastFailureReasonRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/healthcheck/{HealthCheckId}/lastfailurereason"
                  targetPrefix:@""
                 operationName:@"GetHealthCheckLastFailureReason"
                   outputClass:[AWSroute53GetHealthCheckLastFailureReasonResponse class]];
}

- (void)getHealthCheckLastFailureReason:(AWSroute53GetHealthCheckLastFailureReasonRequest *)request
     completionHandler:(void (^)(AWSroute53GetHealthCheckLastFailureReasonResponse *response, NSError *error))completionHandler {
    [[self getHealthCheckLastFailureReason:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetHealthCheckLastFailureReasonResponse *> * _Nonnull task) {
        AWSroute53GetHealthCheckLastFailureReasonResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetHealthCheckStatusResponse *> *)getHealthCheckStatus:(AWSroute53GetHealthCheckStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/healthcheck/{HealthCheckId}/status"
                  targetPrefix:@""
                 operationName:@"GetHealthCheckStatus"
                   outputClass:[AWSroute53GetHealthCheckStatusResponse class]];
}

- (void)getHealthCheckStatus:(AWSroute53GetHealthCheckStatusRequest *)request
     completionHandler:(void (^)(AWSroute53GetHealthCheckStatusResponse *response, NSError *error))completionHandler {
    [[self getHealthCheckStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetHealthCheckStatusResponse *> * _Nonnull task) {
        AWSroute53GetHealthCheckStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetHostedZoneResponse *> *)getHostedZone:(AWSroute53GetHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzone/{Id}"
                  targetPrefix:@""
                 operationName:@"GetHostedZone"
                   outputClass:[AWSroute53GetHostedZoneResponse class]];
}

- (void)getHostedZone:(AWSroute53GetHostedZoneRequest *)request
     completionHandler:(void (^)(AWSroute53GetHostedZoneResponse *response, NSError *error))completionHandler {
    [[self getHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetHostedZoneResponse *> * _Nonnull task) {
        AWSroute53GetHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetHostedZoneCountResponse *> *)getHostedZoneCount:(AWSroute53GetHostedZoneCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzonecount"
                  targetPrefix:@""
                 operationName:@"GetHostedZoneCount"
                   outputClass:[AWSroute53GetHostedZoneCountResponse class]];
}

- (void)getHostedZoneCount:(AWSroute53GetHostedZoneCountRequest *)request
     completionHandler:(void (^)(AWSroute53GetHostedZoneCountResponse *response, NSError *error))completionHandler {
    [[self getHostedZoneCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetHostedZoneCountResponse *> * _Nonnull task) {
        AWSroute53GetHostedZoneCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetHostedZoneLimitResponse *> *)getHostedZoneLimit:(AWSroute53GetHostedZoneLimitRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzonelimit/{Id}/{Type}"
                  targetPrefix:@""
                 operationName:@"GetHostedZoneLimit"
                   outputClass:[AWSroute53GetHostedZoneLimitResponse class]];
}

- (void)getHostedZoneLimit:(AWSroute53GetHostedZoneLimitRequest *)request
     completionHandler:(void (^)(AWSroute53GetHostedZoneLimitResponse *response, NSError *error))completionHandler {
    [[self getHostedZoneLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetHostedZoneLimitResponse *> * _Nonnull task) {
        AWSroute53GetHostedZoneLimitResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetQueryLoggingConfigResponse *> *)getQueryLoggingConfig:(AWSroute53GetQueryLoggingConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/queryloggingconfig/{Id}"
                  targetPrefix:@""
                 operationName:@"GetQueryLoggingConfig"
                   outputClass:[AWSroute53GetQueryLoggingConfigResponse class]];
}

- (void)getQueryLoggingConfig:(AWSroute53GetQueryLoggingConfigRequest *)request
     completionHandler:(void (^)(AWSroute53GetQueryLoggingConfigResponse *response, NSError *error))completionHandler {
    [[self getQueryLoggingConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetQueryLoggingConfigResponse *> * _Nonnull task) {
        AWSroute53GetQueryLoggingConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetReusableDelegationSetResponse *> *)getReusableDelegationSet:(AWSroute53GetReusableDelegationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/delegationset/{Id}"
                  targetPrefix:@""
                 operationName:@"GetReusableDelegationSet"
                   outputClass:[AWSroute53GetReusableDelegationSetResponse class]];
}

- (void)getReusableDelegationSet:(AWSroute53GetReusableDelegationSetRequest *)request
     completionHandler:(void (^)(AWSroute53GetReusableDelegationSetResponse *response, NSError *error))completionHandler {
    [[self getReusableDelegationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetReusableDelegationSetResponse *> * _Nonnull task) {
        AWSroute53GetReusableDelegationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetReusableDelegationSetLimitResponse *> *)getReusableDelegationSetLimit:(AWSroute53GetReusableDelegationSetLimitRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/reusabledelegationsetlimit/{Id}/{Type}"
                  targetPrefix:@""
                 operationName:@"GetReusableDelegationSetLimit"
                   outputClass:[AWSroute53GetReusableDelegationSetLimitResponse class]];
}

- (void)getReusableDelegationSetLimit:(AWSroute53GetReusableDelegationSetLimitRequest *)request
     completionHandler:(void (^)(AWSroute53GetReusableDelegationSetLimitResponse *response, NSError *error))completionHandler {
    [[self getReusableDelegationSetLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetReusableDelegationSetLimitResponse *> * _Nonnull task) {
        AWSroute53GetReusableDelegationSetLimitResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetTrafficPolicyResponse *> *)getTrafficPolicy:(AWSroute53GetTrafficPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicy/{Id}/{Version}"
                  targetPrefix:@""
                 operationName:@"GetTrafficPolicy"
                   outputClass:[AWSroute53GetTrafficPolicyResponse class]];
}

- (void)getTrafficPolicy:(AWSroute53GetTrafficPolicyRequest *)request
     completionHandler:(void (^)(AWSroute53GetTrafficPolicyResponse *response, NSError *error))completionHandler {
    [[self getTrafficPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetTrafficPolicyResponse *> * _Nonnull task) {
        AWSroute53GetTrafficPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetTrafficPolicyInstanceResponse *> *)getTrafficPolicyInstance:(AWSroute53GetTrafficPolicyInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicyinstance/{Id}"
                  targetPrefix:@""
                 operationName:@"GetTrafficPolicyInstance"
                   outputClass:[AWSroute53GetTrafficPolicyInstanceResponse class]];
}

- (void)getTrafficPolicyInstance:(AWSroute53GetTrafficPolicyInstanceRequest *)request
     completionHandler:(void (^)(AWSroute53GetTrafficPolicyInstanceResponse *response, NSError *error))completionHandler {
    [[self getTrafficPolicyInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetTrafficPolicyInstanceResponse *> * _Nonnull task) {
        AWSroute53GetTrafficPolicyInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53GetTrafficPolicyInstanceCountResponse *> *)getTrafficPolicyInstanceCount:(AWSroute53GetTrafficPolicyInstanceCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicyinstancecount"
                  targetPrefix:@""
                 operationName:@"GetTrafficPolicyInstanceCount"
                   outputClass:[AWSroute53GetTrafficPolicyInstanceCountResponse class]];
}

- (void)getTrafficPolicyInstanceCount:(AWSroute53GetTrafficPolicyInstanceCountRequest *)request
     completionHandler:(void (^)(AWSroute53GetTrafficPolicyInstanceCountResponse *response, NSError *error))completionHandler {
    [[self getTrafficPolicyInstanceCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53GetTrafficPolicyInstanceCountResponse *> * _Nonnull task) {
        AWSroute53GetTrafficPolicyInstanceCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListGeoLocationsResponse *> *)listGeoLocations:(AWSroute53ListGeoLocationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/geolocations"
                  targetPrefix:@""
                 operationName:@"ListGeoLocations"
                   outputClass:[AWSroute53ListGeoLocationsResponse class]];
}

- (void)listGeoLocations:(AWSroute53ListGeoLocationsRequest *)request
     completionHandler:(void (^)(AWSroute53ListGeoLocationsResponse *response, NSError *error))completionHandler {
    [[self listGeoLocations:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListGeoLocationsResponse *> * _Nonnull task) {
        AWSroute53ListGeoLocationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListHealthChecksResponse *> *)listHealthChecks:(AWSroute53ListHealthChecksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/healthcheck"
                  targetPrefix:@""
                 operationName:@"ListHealthChecks"
                   outputClass:[AWSroute53ListHealthChecksResponse class]];
}

- (void)listHealthChecks:(AWSroute53ListHealthChecksRequest *)request
     completionHandler:(void (^)(AWSroute53ListHealthChecksResponse *response, NSError *error))completionHandler {
    [[self listHealthChecks:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListHealthChecksResponse *> * _Nonnull task) {
        AWSroute53ListHealthChecksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListHostedZonesResponse *> *)listHostedZones:(AWSroute53ListHostedZonesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzone"
                  targetPrefix:@""
                 operationName:@"ListHostedZones"
                   outputClass:[AWSroute53ListHostedZonesResponse class]];
}

- (void)listHostedZones:(AWSroute53ListHostedZonesRequest *)request
     completionHandler:(void (^)(AWSroute53ListHostedZonesResponse *response, NSError *error))completionHandler {
    [[self listHostedZones:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListHostedZonesResponse *> * _Nonnull task) {
        AWSroute53ListHostedZonesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListHostedZonesByNameResponse *> *)listHostedZonesByName:(AWSroute53ListHostedZonesByNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzonesbyname"
                  targetPrefix:@""
                 operationName:@"ListHostedZonesByName"
                   outputClass:[AWSroute53ListHostedZonesByNameResponse class]];
}

- (void)listHostedZonesByName:(AWSroute53ListHostedZonesByNameRequest *)request
     completionHandler:(void (^)(AWSroute53ListHostedZonesByNameResponse *response, NSError *error))completionHandler {
    [[self listHostedZonesByName:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListHostedZonesByNameResponse *> * _Nonnull task) {
        AWSroute53ListHostedZonesByNameResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListQueryLoggingConfigsResponse *> *)listQueryLoggingConfigs:(AWSroute53ListQueryLoggingConfigsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/queryloggingconfig"
                  targetPrefix:@""
                 operationName:@"ListQueryLoggingConfigs"
                   outputClass:[AWSroute53ListQueryLoggingConfigsResponse class]];
}

- (void)listQueryLoggingConfigs:(AWSroute53ListQueryLoggingConfigsRequest *)request
     completionHandler:(void (^)(AWSroute53ListQueryLoggingConfigsResponse *response, NSError *error))completionHandler {
    [[self listQueryLoggingConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListQueryLoggingConfigsResponse *> * _Nonnull task) {
        AWSroute53ListQueryLoggingConfigsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListResourceRecordSetsResponse *> *)listResourceRecordSets:(AWSroute53ListResourceRecordSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzone/{Id}/rrset"
                  targetPrefix:@""
                 operationName:@"ListResourceRecordSets"
                   outputClass:[AWSroute53ListResourceRecordSetsResponse class]];
}

- (void)listResourceRecordSets:(AWSroute53ListResourceRecordSetsRequest *)request
     completionHandler:(void (^)(AWSroute53ListResourceRecordSetsResponse *response, NSError *error))completionHandler {
    [[self listResourceRecordSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListResourceRecordSetsResponse *> * _Nonnull task) {
        AWSroute53ListResourceRecordSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListReusableDelegationSetsResponse *> *)listReusableDelegationSets:(AWSroute53ListReusableDelegationSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/delegationset"
                  targetPrefix:@""
                 operationName:@"ListReusableDelegationSets"
                   outputClass:[AWSroute53ListReusableDelegationSetsResponse class]];
}

- (void)listReusableDelegationSets:(AWSroute53ListReusableDelegationSetsRequest *)request
     completionHandler:(void (^)(AWSroute53ListReusableDelegationSetsResponse *response, NSError *error))completionHandler {
    [[self listReusableDelegationSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListReusableDelegationSetsResponse *> * _Nonnull task) {
        AWSroute53ListReusableDelegationSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListTagsForResourceResponse *> *)listTagsForResource:(AWSroute53ListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/tags/{ResourceType}/{ResourceId}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSroute53ListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSroute53ListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSroute53ListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListTagsForResourceResponse *> * _Nonnull task) {
        AWSroute53ListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListTagsForResourcesResponse *> *)listTagsForResources:(AWSroute53ListTagsForResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/tags/{ResourceType}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResources"
                   outputClass:[AWSroute53ListTagsForResourcesResponse class]];
}

- (void)listTagsForResources:(AWSroute53ListTagsForResourcesRequest *)request
     completionHandler:(void (^)(AWSroute53ListTagsForResourcesResponse *response, NSError *error))completionHandler {
    [[self listTagsForResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListTagsForResourcesResponse *> * _Nonnull task) {
        AWSroute53ListTagsForResourcesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListTrafficPoliciesResponse *> *)listTrafficPolicies:(AWSroute53ListTrafficPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicies"
                  targetPrefix:@""
                 operationName:@"ListTrafficPolicies"
                   outputClass:[AWSroute53ListTrafficPoliciesResponse class]];
}

- (void)listTrafficPolicies:(AWSroute53ListTrafficPoliciesRequest *)request
     completionHandler:(void (^)(AWSroute53ListTrafficPoliciesResponse *response, NSError *error))completionHandler {
    [[self listTrafficPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListTrafficPoliciesResponse *> * _Nonnull task) {
        AWSroute53ListTrafficPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListTrafficPolicyInstancesResponse *> *)listTrafficPolicyInstances:(AWSroute53ListTrafficPolicyInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicyinstances"
                  targetPrefix:@""
                 operationName:@"ListTrafficPolicyInstances"
                   outputClass:[AWSroute53ListTrafficPolicyInstancesResponse class]];
}

- (void)listTrafficPolicyInstances:(AWSroute53ListTrafficPolicyInstancesRequest *)request
     completionHandler:(void (^)(AWSroute53ListTrafficPolicyInstancesResponse *response, NSError *error))completionHandler {
    [[self listTrafficPolicyInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListTrafficPolicyInstancesResponse *> * _Nonnull task) {
        AWSroute53ListTrafficPolicyInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListTrafficPolicyInstancesByHostedZoneResponse *> *)listTrafficPolicyInstancesByHostedZone:(AWSroute53ListTrafficPolicyInstancesByHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicyinstances/hostedzone"
                  targetPrefix:@""
                 operationName:@"ListTrafficPolicyInstancesByHostedZone"
                   outputClass:[AWSroute53ListTrafficPolicyInstancesByHostedZoneResponse class]];
}

- (void)listTrafficPolicyInstancesByHostedZone:(AWSroute53ListTrafficPolicyInstancesByHostedZoneRequest *)request
     completionHandler:(void (^)(AWSroute53ListTrafficPolicyInstancesByHostedZoneResponse *response, NSError *error))completionHandler {
    [[self listTrafficPolicyInstancesByHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListTrafficPolicyInstancesByHostedZoneResponse *> * _Nonnull task) {
        AWSroute53ListTrafficPolicyInstancesByHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListTrafficPolicyInstancesByPolicyResponse *> *)listTrafficPolicyInstancesByPolicy:(AWSroute53ListTrafficPolicyInstancesByPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicyinstances/trafficpolicy"
                  targetPrefix:@""
                 operationName:@"ListTrafficPolicyInstancesByPolicy"
                   outputClass:[AWSroute53ListTrafficPolicyInstancesByPolicyResponse class]];
}

- (void)listTrafficPolicyInstancesByPolicy:(AWSroute53ListTrafficPolicyInstancesByPolicyRequest *)request
     completionHandler:(void (^)(AWSroute53ListTrafficPolicyInstancesByPolicyResponse *response, NSError *error))completionHandler {
    [[self listTrafficPolicyInstancesByPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListTrafficPolicyInstancesByPolicyResponse *> * _Nonnull task) {
        AWSroute53ListTrafficPolicyInstancesByPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListTrafficPolicyVersionsResponse *> *)listTrafficPolicyVersions:(AWSroute53ListTrafficPolicyVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicies/{Id}/versions"
                  targetPrefix:@""
                 operationName:@"ListTrafficPolicyVersions"
                   outputClass:[AWSroute53ListTrafficPolicyVersionsResponse class]];
}

- (void)listTrafficPolicyVersions:(AWSroute53ListTrafficPolicyVersionsRequest *)request
     completionHandler:(void (^)(AWSroute53ListTrafficPolicyVersionsResponse *response, NSError *error))completionHandler {
    [[self listTrafficPolicyVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListTrafficPolicyVersionsResponse *> * _Nonnull task) {
        AWSroute53ListTrafficPolicyVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53ListVPCAssociationAuthorizationsResponse *> *)listVPCAssociationAuthorizations:(AWSroute53ListVPCAssociationAuthorizationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzone/{Id}/authorizevpcassociation"
                  targetPrefix:@""
                 operationName:@"ListVPCAssociationAuthorizations"
                   outputClass:[AWSroute53ListVPCAssociationAuthorizationsResponse class]];
}

- (void)listVPCAssociationAuthorizations:(AWSroute53ListVPCAssociationAuthorizationsRequest *)request
     completionHandler:(void (^)(AWSroute53ListVPCAssociationAuthorizationsResponse *response, NSError *error))completionHandler {
    [[self listVPCAssociationAuthorizations:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53ListVPCAssociationAuthorizationsResponse *> * _Nonnull task) {
        AWSroute53ListVPCAssociationAuthorizationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53TestDNSAnswerResponse *> *)testDNSAnswer:(AWSroute53TestDNSAnswerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/testdnsanswer"
                  targetPrefix:@""
                 operationName:@"TestDNSAnswer"
                   outputClass:[AWSroute53TestDNSAnswerResponse class]];
}

- (void)testDNSAnswer:(AWSroute53TestDNSAnswerRequest *)request
     completionHandler:(void (^)(AWSroute53TestDNSAnswerResponse *response, NSError *error))completionHandler {
    [[self testDNSAnswer:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53TestDNSAnswerResponse *> * _Nonnull task) {
        AWSroute53TestDNSAnswerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53UpdateHealthCheckResponse *> *)updateHealthCheck:(AWSroute53UpdateHealthCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/healthcheck/{HealthCheckId}"
                  targetPrefix:@""
                 operationName:@"UpdateHealthCheck"
                   outputClass:[AWSroute53UpdateHealthCheckResponse class]];
}

- (void)updateHealthCheck:(AWSroute53UpdateHealthCheckRequest *)request
     completionHandler:(void (^)(AWSroute53UpdateHealthCheckResponse *response, NSError *error))completionHandler {
    [[self updateHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53UpdateHealthCheckResponse *> * _Nonnull task) {
        AWSroute53UpdateHealthCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53UpdateHostedZoneCommentResponse *> *)updateHostedZoneComment:(AWSroute53UpdateHostedZoneCommentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}"
                  targetPrefix:@""
                 operationName:@"UpdateHostedZoneComment"
                   outputClass:[AWSroute53UpdateHostedZoneCommentResponse class]];
}

- (void)updateHostedZoneComment:(AWSroute53UpdateHostedZoneCommentRequest *)request
     completionHandler:(void (^)(AWSroute53UpdateHostedZoneCommentResponse *response, NSError *error))completionHandler {
    [[self updateHostedZoneComment:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53UpdateHostedZoneCommentResponse *> * _Nonnull task) {
        AWSroute53UpdateHostedZoneCommentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53UpdateTrafficPolicyCommentResponse *> *)updateTrafficPolicyComment:(AWSroute53UpdateTrafficPolicyCommentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/trafficpolicy/{Id}/{Version}"
                  targetPrefix:@""
                 operationName:@"UpdateTrafficPolicyComment"
                   outputClass:[AWSroute53UpdateTrafficPolicyCommentResponse class]];
}

- (void)updateTrafficPolicyComment:(AWSroute53UpdateTrafficPolicyCommentRequest *)request
     completionHandler:(void (^)(AWSroute53UpdateTrafficPolicyCommentResponse *response, NSError *error))completionHandler {
    [[self updateTrafficPolicyComment:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53UpdateTrafficPolicyCommentResponse *> * _Nonnull task) {
        AWSroute53UpdateTrafficPolicyCommentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53UpdateTrafficPolicyInstanceResponse *> *)updateTrafficPolicyInstance:(AWSroute53UpdateTrafficPolicyInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/trafficpolicyinstance/{Id}"
                  targetPrefix:@""
                 operationName:@"UpdateTrafficPolicyInstance"
                   outputClass:[AWSroute53UpdateTrafficPolicyInstanceResponse class]];
}

- (void)updateTrafficPolicyInstance:(AWSroute53UpdateTrafficPolicyInstanceRequest *)request
     completionHandler:(void (^)(AWSroute53UpdateTrafficPolicyInstanceResponse *response, NSError *error))completionHandler {
    [[self updateTrafficPolicyInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53UpdateTrafficPolicyInstanceResponse *> * _Nonnull task) {
        AWSroute53UpdateTrafficPolicyInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
