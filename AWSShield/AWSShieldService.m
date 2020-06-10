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

#import "AWSShieldService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSShieldResources.h"

static NSString *const AWSInfoShield = @"Shield";
NSString *const AWSShieldSDKVersion = @"2.13.4";


@interface AWSShieldResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSShieldResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSShieldErrorAccessDenied),
                            @"AccessDeniedForDependencyException" : @(AWSShieldErrorAccessDeniedForDependency),
                            @"InternalErrorException" : @(AWSShieldErrorInternalError),
                            @"InvalidOperationException" : @(AWSShieldErrorInvalidOperation),
                            @"InvalidPaginationTokenException" : @(AWSShieldErrorInvalidPaginationToken),
                            @"InvalidParameterException" : @(AWSShieldErrorInvalidParameter),
                            @"InvalidResourceException" : @(AWSShieldErrorInvalidResource),
                            @"LimitsExceededException" : @(AWSShieldErrorLimitsExceeded),
                            @"LockedSubscriptionException" : @(AWSShieldErrorLockedSubscription),
                            @"NoAssociatedRoleException" : @(AWSShieldErrorNoAssociatedRole),
                            @"OptimisticLockException" : @(AWSShieldErrorOptimisticLock),
                            @"ResourceAlreadyExistsException" : @(AWSShieldErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSShieldErrorResourceNotFound),
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
	                *error = [NSError errorWithDomain:AWSShieldErrorDomain
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
        *error = [NSError errorWithDomain:AWSShieldErrorDomain
                                     code:AWSShieldErrorUnknown
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

@interface AWSShieldRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSShieldRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSShield()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSShield

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSShieldSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSShield versions need to match. Check your SDK installation. AWSCore: %@ AWSShield: %@", AWSiOSSDKVersion, AWSShieldSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultShield {
    static AWSShield *_defaultShield = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoShield];
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
        _defaultShield = [[AWSShield alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultShield;
}

+ (void)registerShieldWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSShield alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ShieldForKey:(NSString *)key {
    @synchronized(self) {
        AWSShield *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoShield
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSShield registerShieldWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeShieldForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultShield` or `+ ShieldForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceShield
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceShield];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSShieldRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.1"}; 
		
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

		NSMutableDictionary *headers = [NSMutableDictionary new];
        headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
        networkingRequest.headers = headers;
        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSShieldResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSShieldResponseSerializer alloc] initWithJSONDefinition:[[AWSShieldResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSShieldAssociateDRTLogBucketResponse *> *)associateDRTLogBucket:(AWSShieldAssociateDRTLogBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"AssociateDRTLogBucket"
                   outputClass:[AWSShieldAssociateDRTLogBucketResponse class]];
}

- (void)associateDRTLogBucket:(AWSShieldAssociateDRTLogBucketRequest *)request
     completionHandler:(void (^)(AWSShieldAssociateDRTLogBucketResponse *response, NSError *error))completionHandler {
    [[self associateDRTLogBucket:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldAssociateDRTLogBucketResponse *> * _Nonnull task) {
        AWSShieldAssociateDRTLogBucketResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldAssociateDRTRoleResponse *> *)associateDRTRole:(AWSShieldAssociateDRTRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"AssociateDRTRole"
                   outputClass:[AWSShieldAssociateDRTRoleResponse class]];
}

- (void)associateDRTRole:(AWSShieldAssociateDRTRoleRequest *)request
     completionHandler:(void (^)(AWSShieldAssociateDRTRoleResponse *response, NSError *error))completionHandler {
    [[self associateDRTRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldAssociateDRTRoleResponse *> * _Nonnull task) {
        AWSShieldAssociateDRTRoleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldAssociateHealthCheckResponse *> *)associateHealthCheck:(AWSShieldAssociateHealthCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"AssociateHealthCheck"
                   outputClass:[AWSShieldAssociateHealthCheckResponse class]];
}

- (void)associateHealthCheck:(AWSShieldAssociateHealthCheckRequest *)request
     completionHandler:(void (^)(AWSShieldAssociateHealthCheckResponse *response, NSError *error))completionHandler {
    [[self associateHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldAssociateHealthCheckResponse *> * _Nonnull task) {
        AWSShieldAssociateHealthCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldAssociateProactiveEngagementDetailsResponse *> *)associateProactiveEngagementDetails:(AWSShieldAssociateProactiveEngagementDetailsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"AssociateProactiveEngagementDetails"
                   outputClass:[AWSShieldAssociateProactiveEngagementDetailsResponse class]];
}

- (void)associateProactiveEngagementDetails:(AWSShieldAssociateProactiveEngagementDetailsRequest *)request
     completionHandler:(void (^)(AWSShieldAssociateProactiveEngagementDetailsResponse *response, NSError *error))completionHandler {
    [[self associateProactiveEngagementDetails:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldAssociateProactiveEngagementDetailsResponse *> * _Nonnull task) {
        AWSShieldAssociateProactiveEngagementDetailsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldCreateProtectionResponse *> *)createProtection:(AWSShieldCreateProtectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"CreateProtection"
                   outputClass:[AWSShieldCreateProtectionResponse class]];
}

- (void)createProtection:(AWSShieldCreateProtectionRequest *)request
     completionHandler:(void (^)(AWSShieldCreateProtectionResponse *response, NSError *error))completionHandler {
    [[self createProtection:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldCreateProtectionResponse *> * _Nonnull task) {
        AWSShieldCreateProtectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldCreateSubscriptionResponse *> *)createSubscription:(AWSShieldCreateSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"CreateSubscription"
                   outputClass:[AWSShieldCreateSubscriptionResponse class]];
}

- (void)createSubscription:(AWSShieldCreateSubscriptionRequest *)request
     completionHandler:(void (^)(AWSShieldCreateSubscriptionResponse *response, NSError *error))completionHandler {
    [[self createSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldCreateSubscriptionResponse *> * _Nonnull task) {
        AWSShieldCreateSubscriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDeleteProtectionResponse *> *)deleteProtection:(AWSShieldDeleteProtectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DeleteProtection"
                   outputClass:[AWSShieldDeleteProtectionResponse class]];
}

- (void)deleteProtection:(AWSShieldDeleteProtectionRequest *)request
     completionHandler:(void (^)(AWSShieldDeleteProtectionResponse *response, NSError *error))completionHandler {
    [[self deleteProtection:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDeleteProtectionResponse *> * _Nonnull task) {
        AWSShieldDeleteProtectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDeleteSubscriptionResponse *> *)deleteSubscription:(AWSShieldDeleteSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DeleteSubscription"
                   outputClass:[AWSShieldDeleteSubscriptionResponse class]];
}

- (void)deleteSubscription:(AWSShieldDeleteSubscriptionRequest *)request
     completionHandler:(void (^)(AWSShieldDeleteSubscriptionResponse *response, NSError *error))completionHandler {
    [[self deleteSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDeleteSubscriptionResponse *> * _Nonnull task) {
        AWSShieldDeleteSubscriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDescribeAttackResponse *> *)describeAttack:(AWSShieldDescribeAttackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DescribeAttack"
                   outputClass:[AWSShieldDescribeAttackResponse class]];
}

- (void)describeAttack:(AWSShieldDescribeAttackRequest *)request
     completionHandler:(void (^)(AWSShieldDescribeAttackResponse *response, NSError *error))completionHandler {
    [[self describeAttack:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDescribeAttackResponse *> * _Nonnull task) {
        AWSShieldDescribeAttackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDescribeDRTAccessResponse *> *)describeDRTAccess:(AWSShieldDescribeDRTAccessRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DescribeDRTAccess"
                   outputClass:[AWSShieldDescribeDRTAccessResponse class]];
}

- (void)describeDRTAccess:(AWSShieldDescribeDRTAccessRequest *)request
     completionHandler:(void (^)(AWSShieldDescribeDRTAccessResponse *response, NSError *error))completionHandler {
    [[self describeDRTAccess:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDescribeDRTAccessResponse *> * _Nonnull task) {
        AWSShieldDescribeDRTAccessResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDescribeEmergencyContactSettingsResponse *> *)describeEmergencyContactSettings:(AWSShieldDescribeEmergencyContactSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DescribeEmergencyContactSettings"
                   outputClass:[AWSShieldDescribeEmergencyContactSettingsResponse class]];
}

- (void)describeEmergencyContactSettings:(AWSShieldDescribeEmergencyContactSettingsRequest *)request
     completionHandler:(void (^)(AWSShieldDescribeEmergencyContactSettingsResponse *response, NSError *error))completionHandler {
    [[self describeEmergencyContactSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDescribeEmergencyContactSettingsResponse *> * _Nonnull task) {
        AWSShieldDescribeEmergencyContactSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDescribeProtectionResponse *> *)describeProtection:(AWSShieldDescribeProtectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DescribeProtection"
                   outputClass:[AWSShieldDescribeProtectionResponse class]];
}

- (void)describeProtection:(AWSShieldDescribeProtectionRequest *)request
     completionHandler:(void (^)(AWSShieldDescribeProtectionResponse *response, NSError *error))completionHandler {
    [[self describeProtection:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDescribeProtectionResponse *> * _Nonnull task) {
        AWSShieldDescribeProtectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDescribeSubscriptionResponse *> *)describeSubscription:(AWSShieldDescribeSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DescribeSubscription"
                   outputClass:[AWSShieldDescribeSubscriptionResponse class]];
}

- (void)describeSubscription:(AWSShieldDescribeSubscriptionRequest *)request
     completionHandler:(void (^)(AWSShieldDescribeSubscriptionResponse *response, NSError *error))completionHandler {
    [[self describeSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDescribeSubscriptionResponse *> * _Nonnull task) {
        AWSShieldDescribeSubscriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDisableProactiveEngagementResponse *> *)disableProactiveEngagement:(AWSShieldDisableProactiveEngagementRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DisableProactiveEngagement"
                   outputClass:[AWSShieldDisableProactiveEngagementResponse class]];
}

- (void)disableProactiveEngagement:(AWSShieldDisableProactiveEngagementRequest *)request
     completionHandler:(void (^)(AWSShieldDisableProactiveEngagementResponse *response, NSError *error))completionHandler {
    [[self disableProactiveEngagement:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDisableProactiveEngagementResponse *> * _Nonnull task) {
        AWSShieldDisableProactiveEngagementResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDisassociateDRTLogBucketResponse *> *)disassociateDRTLogBucket:(AWSShieldDisassociateDRTLogBucketRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DisassociateDRTLogBucket"
                   outputClass:[AWSShieldDisassociateDRTLogBucketResponse class]];
}

- (void)disassociateDRTLogBucket:(AWSShieldDisassociateDRTLogBucketRequest *)request
     completionHandler:(void (^)(AWSShieldDisassociateDRTLogBucketResponse *response, NSError *error))completionHandler {
    [[self disassociateDRTLogBucket:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDisassociateDRTLogBucketResponse *> * _Nonnull task) {
        AWSShieldDisassociateDRTLogBucketResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDisassociateDRTRoleResponse *> *)disassociateDRTRole:(AWSShieldDisassociateDRTRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DisassociateDRTRole"
                   outputClass:[AWSShieldDisassociateDRTRoleResponse class]];
}

- (void)disassociateDRTRole:(AWSShieldDisassociateDRTRoleRequest *)request
     completionHandler:(void (^)(AWSShieldDisassociateDRTRoleResponse *response, NSError *error))completionHandler {
    [[self disassociateDRTRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDisassociateDRTRoleResponse *> * _Nonnull task) {
        AWSShieldDisassociateDRTRoleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldDisassociateHealthCheckResponse *> *)disassociateHealthCheck:(AWSShieldDisassociateHealthCheckRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"DisassociateHealthCheck"
                   outputClass:[AWSShieldDisassociateHealthCheckResponse class]];
}

- (void)disassociateHealthCheck:(AWSShieldDisassociateHealthCheckRequest *)request
     completionHandler:(void (^)(AWSShieldDisassociateHealthCheckResponse *response, NSError *error))completionHandler {
    [[self disassociateHealthCheck:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldDisassociateHealthCheckResponse *> * _Nonnull task) {
        AWSShieldDisassociateHealthCheckResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldEnableProactiveEngagementResponse *> *)enableProactiveEngagement:(AWSShieldEnableProactiveEngagementRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"EnableProactiveEngagement"
                   outputClass:[AWSShieldEnableProactiveEngagementResponse class]];
}

- (void)enableProactiveEngagement:(AWSShieldEnableProactiveEngagementRequest *)request
     completionHandler:(void (^)(AWSShieldEnableProactiveEngagementResponse *response, NSError *error))completionHandler {
    [[self enableProactiveEngagement:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldEnableProactiveEngagementResponse *> * _Nonnull task) {
        AWSShieldEnableProactiveEngagementResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldGetSubscriptionStateResponse *> *)getSubscriptionState:(AWSShieldGetSubscriptionStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"GetSubscriptionState"
                   outputClass:[AWSShieldGetSubscriptionStateResponse class]];
}

- (void)getSubscriptionState:(AWSShieldGetSubscriptionStateRequest *)request
     completionHandler:(void (^)(AWSShieldGetSubscriptionStateResponse *response, NSError *error))completionHandler {
    [[self getSubscriptionState:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldGetSubscriptionStateResponse *> * _Nonnull task) {
        AWSShieldGetSubscriptionStateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldListAttacksResponse *> *)listAttacks:(AWSShieldListAttacksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"ListAttacks"
                   outputClass:[AWSShieldListAttacksResponse class]];
}

- (void)listAttacks:(AWSShieldListAttacksRequest *)request
     completionHandler:(void (^)(AWSShieldListAttacksResponse *response, NSError *error))completionHandler {
    [[self listAttacks:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldListAttacksResponse *> * _Nonnull task) {
        AWSShieldListAttacksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldListProtectionsResponse *> *)listProtections:(AWSShieldListProtectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"ListProtections"
                   outputClass:[AWSShieldListProtectionsResponse class]];
}

- (void)listProtections:(AWSShieldListProtectionsRequest *)request
     completionHandler:(void (^)(AWSShieldListProtectionsResponse *response, NSError *error))completionHandler {
    [[self listProtections:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldListProtectionsResponse *> * _Nonnull task) {
        AWSShieldListProtectionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldUpdateEmergencyContactSettingsResponse *> *)updateEmergencyContactSettings:(AWSShieldUpdateEmergencyContactSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"UpdateEmergencyContactSettings"
                   outputClass:[AWSShieldUpdateEmergencyContactSettingsResponse class]];
}

- (void)updateEmergencyContactSettings:(AWSShieldUpdateEmergencyContactSettingsRequest *)request
     completionHandler:(void (^)(AWSShieldUpdateEmergencyContactSettingsResponse *response, NSError *error))completionHandler {
    [[self updateEmergencyContactSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldUpdateEmergencyContactSettingsResponse *> * _Nonnull task) {
        AWSShieldUpdateEmergencyContactSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSShieldUpdateSubscriptionResponse *> *)updateSubscription:(AWSShieldUpdateSubscriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSShield_20160616"
                 operationName:@"UpdateSubscription"
                   outputClass:[AWSShieldUpdateSubscriptionResponse class]];
}

- (void)updateSubscription:(AWSShieldUpdateSubscriptionRequest *)request
     completionHandler:(void (^)(AWSShieldUpdateSubscriptionResponse *response, NSError *error))completionHandler {
    [[self updateSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSShieldUpdateSubscriptionResponse *> * _Nonnull task) {
        AWSShieldUpdateSubscriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
