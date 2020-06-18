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

#import "AWSRoute53Service.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSRoute53Resources.h"

static NSString *const AWSInfoRoute53 = @"Route53";
NSString *const AWSRoute53SDKVersion = @"2.13.4";


@interface AWSRoute53ResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSRoute53ResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConcurrentModification" : @(AWSRoute53ErrorConcurrentModification),
                            @"ConflictingDomainExists" : @(AWSRoute53ErrorConflictingDomainExists),
                            @"ConflictingTypes" : @(AWSRoute53ErrorConflictingTypes),
                            @"DelegationSetAlreadyCreated" : @(AWSRoute53ErrorDelegationSetAlreadyCreated),
                            @"DelegationSetAlreadyReusable" : @(AWSRoute53ErrorDelegationSetAlreadyReusable),
                            @"DelegationSetInUse" : @(AWSRoute53ErrorDelegationSetInUse),
                            @"DelegationSetNotAvailable" : @(AWSRoute53ErrorDelegationSetNotAvailable),
                            @"DelegationSetNotReusable" : @(AWSRoute53ErrorDelegationSetNotReusable),
                            @"HealthCheckAlreadyExists" : @(AWSRoute53ErrorHealthCheckAlreadyExists),
                            @"HealthCheckInUse" : @(AWSRoute53ErrorHealthCheckInUse),
                            @"HealthCheckVersionMismatch" : @(AWSRoute53ErrorHealthCheckVersionMismatch),
                            @"HostedZoneAlreadyExists" : @(AWSRoute53ErrorHostedZoneAlreadyExists),
                            @"HostedZoneNotEmpty" : @(AWSRoute53ErrorHostedZoneNotEmpty),
                            @"HostedZoneNotFound" : @(AWSRoute53ErrorHostedZoneNotFound),
                            @"HostedZoneNotPrivate" : @(AWSRoute53ErrorHostedZoneNotPrivate),
                            @"IncompatibleVersion" : @(AWSRoute53ErrorIncompatibleVersion),
                            @"InsufficientCloudWatchLogsResourcePolicy" : @(AWSRoute53ErrorInsufficientCloudWatchLogsResourcePolicy),
                            @"InvalidArgument" : @(AWSRoute53ErrorInvalidArgument),
                            @"InvalidChangeBatch" : @(AWSRoute53ErrorInvalidChangeBatch),
                            @"InvalidDomainName" : @(AWSRoute53ErrorInvalidDomainName),
                            @"InvalidInput" : @(AWSRoute53ErrorInvalidInput),
                            @"InvalidPaginationToken" : @(AWSRoute53ErrorInvalidPaginationToken),
                            @"InvalidTrafficPolicyDocument" : @(AWSRoute53ErrorInvalidTrafficPolicyDocument),
                            @"InvalidVPCId" : @(AWSRoute53ErrorInvalidVPCId),
                            @"LastVPCAssociation" : @(AWSRoute53ErrorLastVPCAssociation),
                            @"LimitsExceeded" : @(AWSRoute53ErrorLimitsExceeded),
                            @"NoSuchChange" : @(AWSRoute53ErrorNoSuchChange),
                            @"NoSuchCloudWatchLogsLogGroup" : @(AWSRoute53ErrorNoSuchCloudWatchLogsLogGroup),
                            @"NoSuchDelegationSet" : @(AWSRoute53ErrorNoSuchDelegationSet),
                            @"NoSuchGeoLocation" : @(AWSRoute53ErrorNoSuchGeoLocation),
                            @"NoSuchHealthCheck" : @(AWSRoute53ErrorNoSuchHealthCheck),
                            @"NoSuchHostedZone" : @(AWSRoute53ErrorNoSuchHostedZone),
                            @"NoSuchQueryLoggingConfig" : @(AWSRoute53ErrorNoSuchQueryLoggingConfig),
                            @"NoSuchTrafficPolicy" : @(AWSRoute53ErrorNoSuchTrafficPolicy),
                            @"NoSuchTrafficPolicyInstance" : @(AWSRoute53ErrorNoSuchTrafficPolicyInstance),
                            @"NotAuthorizedException" : @(AWSRoute53ErrorNotAuthorized),
                            @"PriorRequestNotComplete" : @(AWSRoute53ErrorPriorRequestNotComplete),
                            @"PublicZoneVPCAssociation" : @(AWSRoute53ErrorPublicZoneVPCAssociation),
                            @"QueryLoggingConfigAlreadyExists" : @(AWSRoute53ErrorQueryLoggingConfigAlreadyExists),
                            @"ThrottlingException" : @(AWSRoute53ErrorThrottling),
                            @"TooManyHealthChecks" : @(AWSRoute53ErrorTooManyHealthChecks),
                            @"TooManyHostedZones" : @(AWSRoute53ErrorTooManyHostedZones),
                            @"TooManyTrafficPolicies" : @(AWSRoute53ErrorTooManyTrafficPolicies),
                            @"TooManyTrafficPolicyInstances" : @(AWSRoute53ErrorTooManyTrafficPolicyInstances),
                            @"TooManyTrafficPolicyVersionsForCurrentPolicy" : @(AWSRoute53ErrorTooManyTrafficPolicyVersionsForCurrentPolicy),
                            @"TooManyVPCAssociationAuthorizations" : @(AWSRoute53ErrorTooManyVPCAssociationAuthorizations),
                            @"TrafficPolicyAlreadyExists" : @(AWSRoute53ErrorTrafficPolicyAlreadyExists),
                            @"TrafficPolicyInUse" : @(AWSRoute53ErrorTrafficPolicyInUse),
                            @"TrafficPolicyInstanceAlreadyExists" : @(AWSRoute53ErrorTrafficPolicyInstanceAlreadyExists),
                            @"VPCAssociationAuthorizationNotFound" : @(AWSRoute53ErrorVPCAssociationAuthorizationNotFound),
                            @"VPCAssociationNotFound" : @(AWSRoute53ErrorVPCAssociationNotFound),
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
	                *error = [NSError errorWithDomain:AWSRoute53ErrorDomain
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
        *error = [NSError errorWithDomain:AWSRoute53ErrorDomain
                                     code:AWSRoute53ErrorUnknown
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

@interface AWSRoute53RequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSRoute53RequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSRoute53()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSRoute53

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSRoute53SDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSRoute53 versions need to match. Check your SDK installation. AWSCore: %@ AWSRoute53: %@", AWSiOSSDKVersion, AWSRoute53SDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultRoute53 {
    static AWSRoute53 *_defaultRoute53 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoRoute53];
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
        _defaultRoute53 = [[AWSRoute53 alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultRoute53;
}

+ (void)registerRoute53WithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSRoute53 alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)Route53ForKey:(NSString *)key {
    @synchronized(self) {
        AWSRoute53 *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoRoute53
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSRoute53 registerRoute53WithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeRoute53ForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultRoute53` or `+ Route53ForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceRoute53
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceRoute53];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSRoute53RequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSXMLRequestSerializer alloc] initWithJSONDefinition:[[AWSRoute53Resources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSRoute53ResponseSerializer alloc] initWithJSONDefinition:[[AWSRoute53Resources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSRoute53AssociateVPCWithHostedZoneResponse *> *)associateVPCWithHostedZone:(AWSRoute53AssociateVPCWithHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}/associatevpc"
                  targetPrefix:@""
                 operationName:@"AssociateVPCWithHostedZone"
                   outputClass:[AWSRoute53AssociateVPCWithHostedZoneResponse class]];
}

- (void)associateVPCWithHostedZone:(AWSRoute53AssociateVPCWithHostedZoneRequest *)request
     completionHandler:(void (^)(AWSRoute53AssociateVPCWithHostedZoneResponse *response, NSError *error))completionHandler {
    [[self associateVPCWithHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53AssociateVPCWithHostedZoneResponse *> * _Nonnull task) {
        AWSRoute53AssociateVPCWithHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ChangeResourceRecordSetsResponse *> *)changeResourceRecordSets:(AWSRoute53ChangeResourceRecordSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}/rrset/"
                  targetPrefix:@""
                 operationName:@"ChangeResourceRecordSets"
                   outputClass:[AWSRoute53ChangeResourceRecordSetsResponse class]];
}

- (void)changeResourceRecordSets:(AWSRoute53ChangeResourceRecordSetsRequest *)request
     completionHandler:(void (^)(AWSRoute53ChangeResourceRecordSetsResponse *response, NSError *error))completionHandler {
    [[self changeResourceRecordSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ChangeResourceRecordSetsResponse *> * _Nonnull task) {
        AWSRoute53ChangeResourceRecordSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ChangeTagsForResourceResponse *> *)changeTagsForResource:(AWSRoute53ChangeTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/tags/{ResourceType}/{ResourceId}"
                  targetPrefix:@""
                 operationName:@"ChangeTagsForResource"
                   outputClass:[AWSRoute53ChangeTagsForResourceResponse class]];
}

- (void)changeTagsForResource:(AWSRoute53ChangeTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSRoute53ChangeTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self changeTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ChangeTagsForResourceResponse *> * _Nonnull task) {
        AWSRoute53ChangeTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53CreateHealthCheckResponse *> *)createHealthCheck:(AWSRoute53CreateHealthCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/healthcheck"
                  targetPrefix:@""
                 operationName:@"CreateHealthCheck"
                   outputClass:[AWSRoute53CreateHealthCheckResponse class]];
}

- (void)createHealthCheck:(AWSRoute53CreateHealthCheckRequest *)request
     completionHandler:(void (^)(AWSRoute53CreateHealthCheckResponse *response, NSError *error))completionHandler {
    [[self createHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53CreateHealthCheckResponse *> * _Nonnull task) {
        AWSRoute53CreateHealthCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53CreateHostedZoneResponse *> *)createHostedZone:(AWSRoute53CreateHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone"
                  targetPrefix:@""
                 operationName:@"CreateHostedZone"
                   outputClass:[AWSRoute53CreateHostedZoneResponse class]];
}

- (void)createHostedZone:(AWSRoute53CreateHostedZoneRequest *)request
     completionHandler:(void (^)(AWSRoute53CreateHostedZoneResponse *response, NSError *error))completionHandler {
    [[self createHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53CreateHostedZoneResponse *> * _Nonnull task) {
        AWSRoute53CreateHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53CreateQueryLoggingConfigResponse *> *)createQueryLoggingConfig:(AWSRoute53CreateQueryLoggingConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/queryloggingconfig"
                  targetPrefix:@""
                 operationName:@"CreateQueryLoggingConfig"
                   outputClass:[AWSRoute53CreateQueryLoggingConfigResponse class]];
}

- (void)createQueryLoggingConfig:(AWSRoute53CreateQueryLoggingConfigRequest *)request
     completionHandler:(void (^)(AWSRoute53CreateQueryLoggingConfigResponse *response, NSError *error))completionHandler {
    [[self createQueryLoggingConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53CreateQueryLoggingConfigResponse *> * _Nonnull task) {
        AWSRoute53CreateQueryLoggingConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53CreateReusableDelegationSetResponse *> *)createReusableDelegationSet:(AWSRoute53CreateReusableDelegationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/delegationset"
                  targetPrefix:@""
                 operationName:@"CreateReusableDelegationSet"
                   outputClass:[AWSRoute53CreateReusableDelegationSetResponse class]];
}

- (void)createReusableDelegationSet:(AWSRoute53CreateReusableDelegationSetRequest *)request
     completionHandler:(void (^)(AWSRoute53CreateReusableDelegationSetResponse *response, NSError *error))completionHandler {
    [[self createReusableDelegationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53CreateReusableDelegationSetResponse *> * _Nonnull task) {
        AWSRoute53CreateReusableDelegationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53CreateTrafficPolicyResponse *> *)createTrafficPolicy:(AWSRoute53CreateTrafficPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/trafficpolicy"
                  targetPrefix:@""
                 operationName:@"CreateTrafficPolicy"
                   outputClass:[AWSRoute53CreateTrafficPolicyResponse class]];
}

- (void)createTrafficPolicy:(AWSRoute53CreateTrafficPolicyRequest *)request
     completionHandler:(void (^)(AWSRoute53CreateTrafficPolicyResponse *response, NSError *error))completionHandler {
    [[self createTrafficPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53CreateTrafficPolicyResponse *> * _Nonnull task) {
        AWSRoute53CreateTrafficPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53CreateTrafficPolicyInstanceResponse *> *)createTrafficPolicyInstance:(AWSRoute53CreateTrafficPolicyInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/trafficpolicyinstance"
                  targetPrefix:@""
                 operationName:@"CreateTrafficPolicyInstance"
                   outputClass:[AWSRoute53CreateTrafficPolicyInstanceResponse class]];
}

- (void)createTrafficPolicyInstance:(AWSRoute53CreateTrafficPolicyInstanceRequest *)request
     completionHandler:(void (^)(AWSRoute53CreateTrafficPolicyInstanceResponse *response, NSError *error))completionHandler {
    [[self createTrafficPolicyInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53CreateTrafficPolicyInstanceResponse *> * _Nonnull task) {
        AWSRoute53CreateTrafficPolicyInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53CreateTrafficPolicyVersionResponse *> *)createTrafficPolicyVersion:(AWSRoute53CreateTrafficPolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/trafficpolicy/{Id}"
                  targetPrefix:@""
                 operationName:@"CreateTrafficPolicyVersion"
                   outputClass:[AWSRoute53CreateTrafficPolicyVersionResponse class]];
}

- (void)createTrafficPolicyVersion:(AWSRoute53CreateTrafficPolicyVersionRequest *)request
     completionHandler:(void (^)(AWSRoute53CreateTrafficPolicyVersionResponse *response, NSError *error))completionHandler {
    [[self createTrafficPolicyVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53CreateTrafficPolicyVersionResponse *> * _Nonnull task) {
        AWSRoute53CreateTrafficPolicyVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53CreateVPCAssociationAuthorizationResponse *> *)createVPCAssociationAuthorization:(AWSRoute53CreateVPCAssociationAuthorizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}/authorizevpcassociation"
                  targetPrefix:@""
                 operationName:@"CreateVPCAssociationAuthorization"
                   outputClass:[AWSRoute53CreateVPCAssociationAuthorizationResponse class]];
}

- (void)createVPCAssociationAuthorization:(AWSRoute53CreateVPCAssociationAuthorizationRequest *)request
     completionHandler:(void (^)(AWSRoute53CreateVPCAssociationAuthorizationResponse *response, NSError *error))completionHandler {
    [[self createVPCAssociationAuthorization:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53CreateVPCAssociationAuthorizationResponse *> * _Nonnull task) {
        AWSRoute53CreateVPCAssociationAuthorizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53DeleteHealthCheckResponse *> *)deleteHealthCheck:(AWSRoute53DeleteHealthCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/healthcheck/{HealthCheckId}"
                  targetPrefix:@""
                 operationName:@"DeleteHealthCheck"
                   outputClass:[AWSRoute53DeleteHealthCheckResponse class]];
}

- (void)deleteHealthCheck:(AWSRoute53DeleteHealthCheckRequest *)request
     completionHandler:(void (^)(AWSRoute53DeleteHealthCheckResponse *response, NSError *error))completionHandler {
    [[self deleteHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53DeleteHealthCheckResponse *> * _Nonnull task) {
        AWSRoute53DeleteHealthCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53DeleteHostedZoneResponse *> *)deleteHostedZone:(AWSRoute53DeleteHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/hostedzone/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteHostedZone"
                   outputClass:[AWSRoute53DeleteHostedZoneResponse class]];
}

- (void)deleteHostedZone:(AWSRoute53DeleteHostedZoneRequest *)request
     completionHandler:(void (^)(AWSRoute53DeleteHostedZoneResponse *response, NSError *error))completionHandler {
    [[self deleteHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53DeleteHostedZoneResponse *> * _Nonnull task) {
        AWSRoute53DeleteHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53DeleteQueryLoggingConfigResponse *> *)deleteQueryLoggingConfig:(AWSRoute53DeleteQueryLoggingConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/queryloggingconfig/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteQueryLoggingConfig"
                   outputClass:[AWSRoute53DeleteQueryLoggingConfigResponse class]];
}

- (void)deleteQueryLoggingConfig:(AWSRoute53DeleteQueryLoggingConfigRequest *)request
     completionHandler:(void (^)(AWSRoute53DeleteQueryLoggingConfigResponse *response, NSError *error))completionHandler {
    [[self deleteQueryLoggingConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53DeleteQueryLoggingConfigResponse *> * _Nonnull task) {
        AWSRoute53DeleteQueryLoggingConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53DeleteReusableDelegationSetResponse *> *)deleteReusableDelegationSet:(AWSRoute53DeleteReusableDelegationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/delegationset/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteReusableDelegationSet"
                   outputClass:[AWSRoute53DeleteReusableDelegationSetResponse class]];
}

- (void)deleteReusableDelegationSet:(AWSRoute53DeleteReusableDelegationSetRequest *)request
     completionHandler:(void (^)(AWSRoute53DeleteReusableDelegationSetResponse *response, NSError *error))completionHandler {
    [[self deleteReusableDelegationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53DeleteReusableDelegationSetResponse *> * _Nonnull task) {
        AWSRoute53DeleteReusableDelegationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53DeleteTrafficPolicyResponse *> *)deleteTrafficPolicy:(AWSRoute53DeleteTrafficPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/trafficpolicy/{Id}/{Version}"
                  targetPrefix:@""
                 operationName:@"DeleteTrafficPolicy"
                   outputClass:[AWSRoute53DeleteTrafficPolicyResponse class]];
}

- (void)deleteTrafficPolicy:(AWSRoute53DeleteTrafficPolicyRequest *)request
     completionHandler:(void (^)(AWSRoute53DeleteTrafficPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteTrafficPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53DeleteTrafficPolicyResponse *> * _Nonnull task) {
        AWSRoute53DeleteTrafficPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53DeleteTrafficPolicyInstanceResponse *> *)deleteTrafficPolicyInstance:(AWSRoute53DeleteTrafficPolicyInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2013-04-01/trafficpolicyinstance/{Id}"
                  targetPrefix:@""
                 operationName:@"DeleteTrafficPolicyInstance"
                   outputClass:[AWSRoute53DeleteTrafficPolicyInstanceResponse class]];
}

- (void)deleteTrafficPolicyInstance:(AWSRoute53DeleteTrafficPolicyInstanceRequest *)request
     completionHandler:(void (^)(AWSRoute53DeleteTrafficPolicyInstanceResponse *response, NSError *error))completionHandler {
    [[self deleteTrafficPolicyInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53DeleteTrafficPolicyInstanceResponse *> * _Nonnull task) {
        AWSRoute53DeleteTrafficPolicyInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53DeleteVPCAssociationAuthorizationResponse *> *)deleteVPCAssociationAuthorization:(AWSRoute53DeleteVPCAssociationAuthorizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}/deauthorizevpcassociation"
                  targetPrefix:@""
                 operationName:@"DeleteVPCAssociationAuthorization"
                   outputClass:[AWSRoute53DeleteVPCAssociationAuthorizationResponse class]];
}

- (void)deleteVPCAssociationAuthorization:(AWSRoute53DeleteVPCAssociationAuthorizationRequest *)request
     completionHandler:(void (^)(AWSRoute53DeleteVPCAssociationAuthorizationResponse *response, NSError *error))completionHandler {
    [[self deleteVPCAssociationAuthorization:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53DeleteVPCAssociationAuthorizationResponse *> * _Nonnull task) {
        AWSRoute53DeleteVPCAssociationAuthorizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53DisassociateVPCFromHostedZoneResponse *> *)disassociateVPCFromHostedZone:(AWSRoute53DisassociateVPCFromHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}/disassociatevpc"
                  targetPrefix:@""
                 operationName:@"DisassociateVPCFromHostedZone"
                   outputClass:[AWSRoute53DisassociateVPCFromHostedZoneResponse class]];
}

- (void)disassociateVPCFromHostedZone:(AWSRoute53DisassociateVPCFromHostedZoneRequest *)request
     completionHandler:(void (^)(AWSRoute53DisassociateVPCFromHostedZoneResponse *response, NSError *error))completionHandler {
    [[self disassociateVPCFromHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53DisassociateVPCFromHostedZoneResponse *> * _Nonnull task) {
        AWSRoute53DisassociateVPCFromHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetAccountLimitResponse *> *)getAccountLimit:(AWSRoute53GetAccountLimitRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/accountlimit/{Type}"
                  targetPrefix:@""
                 operationName:@"GetAccountLimit"
                   outputClass:[AWSRoute53GetAccountLimitResponse class]];
}

- (void)getAccountLimit:(AWSRoute53GetAccountLimitRequest *)request
     completionHandler:(void (^)(AWSRoute53GetAccountLimitResponse *response, NSError *error))completionHandler {
    [[self getAccountLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetAccountLimitResponse *> * _Nonnull task) {
        AWSRoute53GetAccountLimitResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetChangeResponse *> *)getChange:(AWSRoute53GetChangeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/change/{Id}"
                  targetPrefix:@""
                 operationName:@"GetChange"
                   outputClass:[AWSRoute53GetChangeResponse class]];
}

- (void)getChange:(AWSRoute53GetChangeRequest *)request
     completionHandler:(void (^)(AWSRoute53GetChangeResponse *response, NSError *error))completionHandler {
    [[self getChange:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetChangeResponse *> * _Nonnull task) {
        AWSRoute53GetChangeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetCheckerIpRangesResponse *> *)getCheckerIpRanges:(AWSRoute53GetCheckerIpRangesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/checkeripranges"
                  targetPrefix:@""
                 operationName:@"GetCheckerIpRanges"
                   outputClass:[AWSRoute53GetCheckerIpRangesResponse class]];
}

- (void)getCheckerIpRanges:(AWSRoute53GetCheckerIpRangesRequest *)request
     completionHandler:(void (^)(AWSRoute53GetCheckerIpRangesResponse *response, NSError *error))completionHandler {
    [[self getCheckerIpRanges:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetCheckerIpRangesResponse *> * _Nonnull task) {
        AWSRoute53GetCheckerIpRangesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetGeoLocationResponse *> *)getGeoLocation:(AWSRoute53GetGeoLocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/geolocation"
                  targetPrefix:@""
                 operationName:@"GetGeoLocation"
                   outputClass:[AWSRoute53GetGeoLocationResponse class]];
}

- (void)getGeoLocation:(AWSRoute53GetGeoLocationRequest *)request
     completionHandler:(void (^)(AWSRoute53GetGeoLocationResponse *response, NSError *error))completionHandler {
    [[self getGeoLocation:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetGeoLocationResponse *> * _Nonnull task) {
        AWSRoute53GetGeoLocationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetHealthCheckResponse *> *)getHealthCheck:(AWSRoute53GetHealthCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/healthcheck/{HealthCheckId}"
                  targetPrefix:@""
                 operationName:@"GetHealthCheck"
                   outputClass:[AWSRoute53GetHealthCheckResponse class]];
}

- (void)getHealthCheck:(AWSRoute53GetHealthCheckRequest *)request
     completionHandler:(void (^)(AWSRoute53GetHealthCheckResponse *response, NSError *error))completionHandler {
    [[self getHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetHealthCheckResponse *> * _Nonnull task) {
        AWSRoute53GetHealthCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetHealthCheckCountResponse *> *)getHealthCheckCount:(AWSRoute53GetHealthCheckCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/healthcheckcount"
                  targetPrefix:@""
                 operationName:@"GetHealthCheckCount"
                   outputClass:[AWSRoute53GetHealthCheckCountResponse class]];
}

- (void)getHealthCheckCount:(AWSRoute53GetHealthCheckCountRequest *)request
     completionHandler:(void (^)(AWSRoute53GetHealthCheckCountResponse *response, NSError *error))completionHandler {
    [[self getHealthCheckCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetHealthCheckCountResponse *> * _Nonnull task) {
        AWSRoute53GetHealthCheckCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetHealthCheckLastFailureReasonResponse *> *)getHealthCheckLastFailureReason:(AWSRoute53GetHealthCheckLastFailureReasonRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/healthcheck/{HealthCheckId}/lastfailurereason"
                  targetPrefix:@""
                 operationName:@"GetHealthCheckLastFailureReason"
                   outputClass:[AWSRoute53GetHealthCheckLastFailureReasonResponse class]];
}

- (void)getHealthCheckLastFailureReason:(AWSRoute53GetHealthCheckLastFailureReasonRequest *)request
     completionHandler:(void (^)(AWSRoute53GetHealthCheckLastFailureReasonResponse *response, NSError *error))completionHandler {
    [[self getHealthCheckLastFailureReason:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetHealthCheckLastFailureReasonResponse *> * _Nonnull task) {
        AWSRoute53GetHealthCheckLastFailureReasonResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetHealthCheckStatusResponse *> *)getHealthCheckStatus:(AWSRoute53GetHealthCheckStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/healthcheck/{HealthCheckId}/status"
                  targetPrefix:@""
                 operationName:@"GetHealthCheckStatus"
                   outputClass:[AWSRoute53GetHealthCheckStatusResponse class]];
}

- (void)getHealthCheckStatus:(AWSRoute53GetHealthCheckStatusRequest *)request
     completionHandler:(void (^)(AWSRoute53GetHealthCheckStatusResponse *response, NSError *error))completionHandler {
    [[self getHealthCheckStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetHealthCheckStatusResponse *> * _Nonnull task) {
        AWSRoute53GetHealthCheckStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetHostedZoneResponse *> *)getHostedZone:(AWSRoute53GetHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzone/{Id}"
                  targetPrefix:@""
                 operationName:@"GetHostedZone"
                   outputClass:[AWSRoute53GetHostedZoneResponse class]];
}

- (void)getHostedZone:(AWSRoute53GetHostedZoneRequest *)request
     completionHandler:(void (^)(AWSRoute53GetHostedZoneResponse *response, NSError *error))completionHandler {
    [[self getHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetHostedZoneResponse *> * _Nonnull task) {
        AWSRoute53GetHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetHostedZoneCountResponse *> *)getHostedZoneCount:(AWSRoute53GetHostedZoneCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzonecount"
                  targetPrefix:@""
                 operationName:@"GetHostedZoneCount"
                   outputClass:[AWSRoute53GetHostedZoneCountResponse class]];
}

- (void)getHostedZoneCount:(AWSRoute53GetHostedZoneCountRequest *)request
     completionHandler:(void (^)(AWSRoute53GetHostedZoneCountResponse *response, NSError *error))completionHandler {
    [[self getHostedZoneCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetHostedZoneCountResponse *> * _Nonnull task) {
        AWSRoute53GetHostedZoneCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetHostedZoneLimitResponse *> *)getHostedZoneLimit:(AWSRoute53GetHostedZoneLimitRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzonelimit/{Id}/{Type}"
                  targetPrefix:@""
                 operationName:@"GetHostedZoneLimit"
                   outputClass:[AWSRoute53GetHostedZoneLimitResponse class]];
}

- (void)getHostedZoneLimit:(AWSRoute53GetHostedZoneLimitRequest *)request
     completionHandler:(void (^)(AWSRoute53GetHostedZoneLimitResponse *response, NSError *error))completionHandler {
    [[self getHostedZoneLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetHostedZoneLimitResponse *> * _Nonnull task) {
        AWSRoute53GetHostedZoneLimitResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetQueryLoggingConfigResponse *> *)getQueryLoggingConfig:(AWSRoute53GetQueryLoggingConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/queryloggingconfig/{Id}"
                  targetPrefix:@""
                 operationName:@"GetQueryLoggingConfig"
                   outputClass:[AWSRoute53GetQueryLoggingConfigResponse class]];
}

- (void)getQueryLoggingConfig:(AWSRoute53GetQueryLoggingConfigRequest *)request
     completionHandler:(void (^)(AWSRoute53GetQueryLoggingConfigResponse *response, NSError *error))completionHandler {
    [[self getQueryLoggingConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetQueryLoggingConfigResponse *> * _Nonnull task) {
        AWSRoute53GetQueryLoggingConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetReusableDelegationSetResponse *> *)getReusableDelegationSet:(AWSRoute53GetReusableDelegationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/delegationset/{Id}"
                  targetPrefix:@""
                 operationName:@"GetReusableDelegationSet"
                   outputClass:[AWSRoute53GetReusableDelegationSetResponse class]];
}

- (void)getReusableDelegationSet:(AWSRoute53GetReusableDelegationSetRequest *)request
     completionHandler:(void (^)(AWSRoute53GetReusableDelegationSetResponse *response, NSError *error))completionHandler {
    [[self getReusableDelegationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetReusableDelegationSetResponse *> * _Nonnull task) {
        AWSRoute53GetReusableDelegationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetReusableDelegationSetLimitResponse *> *)getReusableDelegationSetLimit:(AWSRoute53GetReusableDelegationSetLimitRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/reusabledelegationsetlimit/{Id}/{Type}"
                  targetPrefix:@""
                 operationName:@"GetReusableDelegationSetLimit"
                   outputClass:[AWSRoute53GetReusableDelegationSetLimitResponse class]];
}

- (void)getReusableDelegationSetLimit:(AWSRoute53GetReusableDelegationSetLimitRequest *)request
     completionHandler:(void (^)(AWSRoute53GetReusableDelegationSetLimitResponse *response, NSError *error))completionHandler {
    [[self getReusableDelegationSetLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetReusableDelegationSetLimitResponse *> * _Nonnull task) {
        AWSRoute53GetReusableDelegationSetLimitResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetTrafficPolicyResponse *> *)getTrafficPolicy:(AWSRoute53GetTrafficPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicy/{Id}/{Version}"
                  targetPrefix:@""
                 operationName:@"GetTrafficPolicy"
                   outputClass:[AWSRoute53GetTrafficPolicyResponse class]];
}

- (void)getTrafficPolicy:(AWSRoute53GetTrafficPolicyRequest *)request
     completionHandler:(void (^)(AWSRoute53GetTrafficPolicyResponse *response, NSError *error))completionHandler {
    [[self getTrafficPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetTrafficPolicyResponse *> * _Nonnull task) {
        AWSRoute53GetTrafficPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetTrafficPolicyInstanceResponse *> *)getTrafficPolicyInstance:(AWSRoute53GetTrafficPolicyInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicyinstance/{Id}"
                  targetPrefix:@""
                 operationName:@"GetTrafficPolicyInstance"
                   outputClass:[AWSRoute53GetTrafficPolicyInstanceResponse class]];
}

- (void)getTrafficPolicyInstance:(AWSRoute53GetTrafficPolicyInstanceRequest *)request
     completionHandler:(void (^)(AWSRoute53GetTrafficPolicyInstanceResponse *response, NSError *error))completionHandler {
    [[self getTrafficPolicyInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetTrafficPolicyInstanceResponse *> * _Nonnull task) {
        AWSRoute53GetTrafficPolicyInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53GetTrafficPolicyInstanceCountResponse *> *)getTrafficPolicyInstanceCount:(AWSRoute53GetTrafficPolicyInstanceCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicyinstancecount"
                  targetPrefix:@""
                 operationName:@"GetTrafficPolicyInstanceCount"
                   outputClass:[AWSRoute53GetTrafficPolicyInstanceCountResponse class]];
}

- (void)getTrafficPolicyInstanceCount:(AWSRoute53GetTrafficPolicyInstanceCountRequest *)request
     completionHandler:(void (^)(AWSRoute53GetTrafficPolicyInstanceCountResponse *response, NSError *error))completionHandler {
    [[self getTrafficPolicyInstanceCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53GetTrafficPolicyInstanceCountResponse *> * _Nonnull task) {
        AWSRoute53GetTrafficPolicyInstanceCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListGeoLocationsResponse *> *)listGeoLocations:(AWSRoute53ListGeoLocationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/geolocations"
                  targetPrefix:@""
                 operationName:@"ListGeoLocations"
                   outputClass:[AWSRoute53ListGeoLocationsResponse class]];
}

- (void)listGeoLocations:(AWSRoute53ListGeoLocationsRequest *)request
     completionHandler:(void (^)(AWSRoute53ListGeoLocationsResponse *response, NSError *error))completionHandler {
    [[self listGeoLocations:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListGeoLocationsResponse *> * _Nonnull task) {
        AWSRoute53ListGeoLocationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListHealthChecksResponse *> *)listHealthChecks:(AWSRoute53ListHealthChecksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/healthcheck"
                  targetPrefix:@""
                 operationName:@"ListHealthChecks"
                   outputClass:[AWSRoute53ListHealthChecksResponse class]];
}

- (void)listHealthChecks:(AWSRoute53ListHealthChecksRequest *)request
     completionHandler:(void (^)(AWSRoute53ListHealthChecksResponse *response, NSError *error))completionHandler {
    [[self listHealthChecks:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListHealthChecksResponse *> * _Nonnull task) {
        AWSRoute53ListHealthChecksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListHostedZonesResponse *> *)listHostedZones:(AWSRoute53ListHostedZonesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzone"
                  targetPrefix:@""
                 operationName:@"ListHostedZones"
                   outputClass:[AWSRoute53ListHostedZonesResponse class]];
}

- (void)listHostedZones:(AWSRoute53ListHostedZonesRequest *)request
     completionHandler:(void (^)(AWSRoute53ListHostedZonesResponse *response, NSError *error))completionHandler {
    [[self listHostedZones:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListHostedZonesResponse *> * _Nonnull task) {
        AWSRoute53ListHostedZonesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListHostedZonesByNameResponse *> *)listHostedZonesByName:(AWSRoute53ListHostedZonesByNameRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzonesbyname"
                  targetPrefix:@""
                 operationName:@"ListHostedZonesByName"
                   outputClass:[AWSRoute53ListHostedZonesByNameResponse class]];
}

- (void)listHostedZonesByName:(AWSRoute53ListHostedZonesByNameRequest *)request
     completionHandler:(void (^)(AWSRoute53ListHostedZonesByNameResponse *response, NSError *error))completionHandler {
    [[self listHostedZonesByName:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListHostedZonesByNameResponse *> * _Nonnull task) {
        AWSRoute53ListHostedZonesByNameResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListHostedZonesByVPCResponse *> *)listHostedZonesByVPC:(AWSRoute53ListHostedZonesByVPCRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzonesbyvpc"
                  targetPrefix:@""
                 operationName:@"ListHostedZonesByVPC"
                   outputClass:[AWSRoute53ListHostedZonesByVPCResponse class]];
}

- (void)listHostedZonesByVPC:(AWSRoute53ListHostedZonesByVPCRequest *)request
     completionHandler:(void (^)(AWSRoute53ListHostedZonesByVPCResponse *response, NSError *error))completionHandler {
    [[self listHostedZonesByVPC:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListHostedZonesByVPCResponse *> * _Nonnull task) {
        AWSRoute53ListHostedZonesByVPCResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListQueryLoggingConfigsResponse *> *)listQueryLoggingConfigs:(AWSRoute53ListQueryLoggingConfigsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/queryloggingconfig"
                  targetPrefix:@""
                 operationName:@"ListQueryLoggingConfigs"
                   outputClass:[AWSRoute53ListQueryLoggingConfigsResponse class]];
}

- (void)listQueryLoggingConfigs:(AWSRoute53ListQueryLoggingConfigsRequest *)request
     completionHandler:(void (^)(AWSRoute53ListQueryLoggingConfigsResponse *response, NSError *error))completionHandler {
    [[self listQueryLoggingConfigs:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListQueryLoggingConfigsResponse *> * _Nonnull task) {
        AWSRoute53ListQueryLoggingConfigsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListResourceRecordSetsResponse *> *)listResourceRecordSets:(AWSRoute53ListResourceRecordSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzone/{Id}/rrset"
                  targetPrefix:@""
                 operationName:@"ListResourceRecordSets"
                   outputClass:[AWSRoute53ListResourceRecordSetsResponse class]];
}

- (void)listResourceRecordSets:(AWSRoute53ListResourceRecordSetsRequest *)request
     completionHandler:(void (^)(AWSRoute53ListResourceRecordSetsResponse *response, NSError *error))completionHandler {
    [[self listResourceRecordSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListResourceRecordSetsResponse *> * _Nonnull task) {
        AWSRoute53ListResourceRecordSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListReusableDelegationSetsResponse *> *)listReusableDelegationSets:(AWSRoute53ListReusableDelegationSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/delegationset"
                  targetPrefix:@""
                 operationName:@"ListReusableDelegationSets"
                   outputClass:[AWSRoute53ListReusableDelegationSetsResponse class]];
}

- (void)listReusableDelegationSets:(AWSRoute53ListReusableDelegationSetsRequest *)request
     completionHandler:(void (^)(AWSRoute53ListReusableDelegationSetsResponse *response, NSError *error))completionHandler {
    [[self listReusableDelegationSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListReusableDelegationSetsResponse *> * _Nonnull task) {
        AWSRoute53ListReusableDelegationSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListTagsForResourceResponse *> *)listTagsForResource:(AWSRoute53ListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/tags/{ResourceType}/{ResourceId}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSRoute53ListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSRoute53ListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSRoute53ListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListTagsForResourceResponse *> * _Nonnull task) {
        AWSRoute53ListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListTagsForResourcesResponse *> *)listTagsForResources:(AWSRoute53ListTagsForResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/tags/{ResourceType}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResources"
                   outputClass:[AWSRoute53ListTagsForResourcesResponse class]];
}

- (void)listTagsForResources:(AWSRoute53ListTagsForResourcesRequest *)request
     completionHandler:(void (^)(AWSRoute53ListTagsForResourcesResponse *response, NSError *error))completionHandler {
    [[self listTagsForResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListTagsForResourcesResponse *> * _Nonnull task) {
        AWSRoute53ListTagsForResourcesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListTrafficPoliciesResponse *> *)listTrafficPolicies:(AWSRoute53ListTrafficPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicies"
                  targetPrefix:@""
                 operationName:@"ListTrafficPolicies"
                   outputClass:[AWSRoute53ListTrafficPoliciesResponse class]];
}

- (void)listTrafficPolicies:(AWSRoute53ListTrafficPoliciesRequest *)request
     completionHandler:(void (^)(AWSRoute53ListTrafficPoliciesResponse *response, NSError *error))completionHandler {
    [[self listTrafficPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListTrafficPoliciesResponse *> * _Nonnull task) {
        AWSRoute53ListTrafficPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListTrafficPolicyInstancesResponse *> *)listTrafficPolicyInstances:(AWSRoute53ListTrafficPolicyInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicyinstances"
                  targetPrefix:@""
                 operationName:@"ListTrafficPolicyInstances"
                   outputClass:[AWSRoute53ListTrafficPolicyInstancesResponse class]];
}

- (void)listTrafficPolicyInstances:(AWSRoute53ListTrafficPolicyInstancesRequest *)request
     completionHandler:(void (^)(AWSRoute53ListTrafficPolicyInstancesResponse *response, NSError *error))completionHandler {
    [[self listTrafficPolicyInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListTrafficPolicyInstancesResponse *> * _Nonnull task) {
        AWSRoute53ListTrafficPolicyInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListTrafficPolicyInstancesByHostedZoneResponse *> *)listTrafficPolicyInstancesByHostedZone:(AWSRoute53ListTrafficPolicyInstancesByHostedZoneRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicyinstances/hostedzone"
                  targetPrefix:@""
                 operationName:@"ListTrafficPolicyInstancesByHostedZone"
                   outputClass:[AWSRoute53ListTrafficPolicyInstancesByHostedZoneResponse class]];
}

- (void)listTrafficPolicyInstancesByHostedZone:(AWSRoute53ListTrafficPolicyInstancesByHostedZoneRequest *)request
     completionHandler:(void (^)(AWSRoute53ListTrafficPolicyInstancesByHostedZoneResponse *response, NSError *error))completionHandler {
    [[self listTrafficPolicyInstancesByHostedZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListTrafficPolicyInstancesByHostedZoneResponse *> * _Nonnull task) {
        AWSRoute53ListTrafficPolicyInstancesByHostedZoneResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListTrafficPolicyInstancesByPolicyResponse *> *)listTrafficPolicyInstancesByPolicy:(AWSRoute53ListTrafficPolicyInstancesByPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicyinstances/trafficpolicy"
                  targetPrefix:@""
                 operationName:@"ListTrafficPolicyInstancesByPolicy"
                   outputClass:[AWSRoute53ListTrafficPolicyInstancesByPolicyResponse class]];
}

- (void)listTrafficPolicyInstancesByPolicy:(AWSRoute53ListTrafficPolicyInstancesByPolicyRequest *)request
     completionHandler:(void (^)(AWSRoute53ListTrafficPolicyInstancesByPolicyResponse *response, NSError *error))completionHandler {
    [[self listTrafficPolicyInstancesByPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListTrafficPolicyInstancesByPolicyResponse *> * _Nonnull task) {
        AWSRoute53ListTrafficPolicyInstancesByPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListTrafficPolicyVersionsResponse *> *)listTrafficPolicyVersions:(AWSRoute53ListTrafficPolicyVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/trafficpolicies/{Id}/versions"
                  targetPrefix:@""
                 operationName:@"ListTrafficPolicyVersions"
                   outputClass:[AWSRoute53ListTrafficPolicyVersionsResponse class]];
}

- (void)listTrafficPolicyVersions:(AWSRoute53ListTrafficPolicyVersionsRequest *)request
     completionHandler:(void (^)(AWSRoute53ListTrafficPolicyVersionsResponse *response, NSError *error))completionHandler {
    [[self listTrafficPolicyVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListTrafficPolicyVersionsResponse *> * _Nonnull task) {
        AWSRoute53ListTrafficPolicyVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53ListVPCAssociationAuthorizationsResponse *> *)listVPCAssociationAuthorizations:(AWSRoute53ListVPCAssociationAuthorizationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/hostedzone/{Id}/authorizevpcassociation"
                  targetPrefix:@""
                 operationName:@"ListVPCAssociationAuthorizations"
                   outputClass:[AWSRoute53ListVPCAssociationAuthorizationsResponse class]];
}

- (void)listVPCAssociationAuthorizations:(AWSRoute53ListVPCAssociationAuthorizationsRequest *)request
     completionHandler:(void (^)(AWSRoute53ListVPCAssociationAuthorizationsResponse *response, NSError *error))completionHandler {
    [[self listVPCAssociationAuthorizations:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53ListVPCAssociationAuthorizationsResponse *> * _Nonnull task) {
        AWSRoute53ListVPCAssociationAuthorizationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53TestDNSAnswerResponse *> *)testDNSAnswer:(AWSRoute53TestDNSAnswerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2013-04-01/testdnsanswer"
                  targetPrefix:@""
                 operationName:@"TestDNSAnswer"
                   outputClass:[AWSRoute53TestDNSAnswerResponse class]];
}

- (void)testDNSAnswer:(AWSRoute53TestDNSAnswerRequest *)request
     completionHandler:(void (^)(AWSRoute53TestDNSAnswerResponse *response, NSError *error))completionHandler {
    [[self testDNSAnswer:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53TestDNSAnswerResponse *> * _Nonnull task) {
        AWSRoute53TestDNSAnswerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53UpdateHealthCheckResponse *> *)updateHealthCheck:(AWSRoute53UpdateHealthCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/healthcheck/{HealthCheckId}"
                  targetPrefix:@""
                 operationName:@"UpdateHealthCheck"
                   outputClass:[AWSRoute53UpdateHealthCheckResponse class]];
}

- (void)updateHealthCheck:(AWSRoute53UpdateHealthCheckRequest *)request
     completionHandler:(void (^)(AWSRoute53UpdateHealthCheckResponse *response, NSError *error))completionHandler {
    [[self updateHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53UpdateHealthCheckResponse *> * _Nonnull task) {
        AWSRoute53UpdateHealthCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53UpdateHostedZoneCommentResponse *> *)updateHostedZoneComment:(AWSRoute53UpdateHostedZoneCommentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/hostedzone/{Id}"
                  targetPrefix:@""
                 operationName:@"UpdateHostedZoneComment"
                   outputClass:[AWSRoute53UpdateHostedZoneCommentResponse class]];
}

- (void)updateHostedZoneComment:(AWSRoute53UpdateHostedZoneCommentRequest *)request
     completionHandler:(void (^)(AWSRoute53UpdateHostedZoneCommentResponse *response, NSError *error))completionHandler {
    [[self updateHostedZoneComment:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53UpdateHostedZoneCommentResponse *> * _Nonnull task) {
        AWSRoute53UpdateHostedZoneCommentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53UpdateTrafficPolicyCommentResponse *> *)updateTrafficPolicyComment:(AWSRoute53UpdateTrafficPolicyCommentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/trafficpolicy/{Id}/{Version}"
                  targetPrefix:@""
                 operationName:@"UpdateTrafficPolicyComment"
                   outputClass:[AWSRoute53UpdateTrafficPolicyCommentResponse class]];
}

- (void)updateTrafficPolicyComment:(AWSRoute53UpdateTrafficPolicyCommentRequest *)request
     completionHandler:(void (^)(AWSRoute53UpdateTrafficPolicyCommentResponse *response, NSError *error))completionHandler {
    [[self updateTrafficPolicyComment:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53UpdateTrafficPolicyCommentResponse *> * _Nonnull task) {
        AWSRoute53UpdateTrafficPolicyCommentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRoute53UpdateTrafficPolicyInstanceResponse *> *)updateTrafficPolicyInstance:(AWSRoute53UpdateTrafficPolicyInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2013-04-01/trafficpolicyinstance/{Id}"
                  targetPrefix:@""
                 operationName:@"UpdateTrafficPolicyInstance"
                   outputClass:[AWSRoute53UpdateTrafficPolicyInstanceResponse class]];
}

- (void)updateTrafficPolicyInstance:(AWSRoute53UpdateTrafficPolicyInstanceRequest *)request
     completionHandler:(void (^)(AWSRoute53UpdateTrafficPolicyInstanceResponse *response, NSError *error))completionHandler {
    [[self updateTrafficPolicyInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSRoute53UpdateTrafficPolicyInstanceResponse *> * _Nonnull task) {
        AWSRoute53UpdateTrafficPolicyInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
