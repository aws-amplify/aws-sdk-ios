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

#import "AWSLightsailService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSLightsailResources.h"

static NSString *const AWSInfoLightsail = @"Lightsail";
NSString *const AWSLightsailSDKVersion = @"2.13.4";


@interface AWSLightsailResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSLightsailResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSLightsailErrorAccessDenied),
                            @"AccountSetupInProgressException" : @(AWSLightsailErrorAccountSetupInProgress),
                            @"InvalidInputException" : @(AWSLightsailErrorInvalidInput),
                            @"NotFoundException" : @(AWSLightsailErrorNotFound),
                            @"OperationFailureException" : @(AWSLightsailErrorOperationFailure),
                            @"ServiceException" : @(AWSLightsailErrorService),
                            @"UnauthenticatedException" : @(AWSLightsailErrorUnauthenticated),
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
	                *error = [NSError errorWithDomain:AWSLightsailErrorDomain
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
        *error = [NSError errorWithDomain:AWSLightsailErrorDomain
                                     code:AWSLightsailErrorUnknown
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

@interface AWSLightsailRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSLightsailRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSLightsail()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSLightsail

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSLightsailSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSLightsail versions need to match. Check your SDK installation. AWSCore: %@ AWSLightsail: %@", AWSiOSSDKVersion, AWSLightsailSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultLightsail {
    static AWSLightsail *_defaultLightsail = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoLightsail];
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
        _defaultLightsail = [[AWSLightsail alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultLightsail;
}

+ (void)registerLightsailWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSLightsail alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)LightsailForKey:(NSString *)key {
    @synchronized(self) {
        AWSLightsail *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoLightsail
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSLightsail registerLightsailWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeLightsailForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultLightsail` or `+ LightsailForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceLightsail
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceLightsail];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSLightsailRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSLightsailResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSLightsailResponseSerializer alloc] initWithJSONDefinition:[[AWSLightsailResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSLightsailAllocateStaticIpResult *> *)allocateStaticIp:(AWSLightsailAllocateStaticIpRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"AllocateStaticIp"
                   outputClass:[AWSLightsailAllocateStaticIpResult class]];
}

- (void)allocateStaticIp:(AWSLightsailAllocateStaticIpRequest *)request
     completionHandler:(void (^)(AWSLightsailAllocateStaticIpResult *response, NSError *error))completionHandler {
    [[self allocateStaticIp:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailAllocateStaticIpResult *> * _Nonnull task) {
        AWSLightsailAllocateStaticIpResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailAttachDiskResult *> *)attachDisk:(AWSLightsailAttachDiskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"AttachDisk"
                   outputClass:[AWSLightsailAttachDiskResult class]];
}

- (void)attachDisk:(AWSLightsailAttachDiskRequest *)request
     completionHandler:(void (^)(AWSLightsailAttachDiskResult *response, NSError *error))completionHandler {
    [[self attachDisk:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailAttachDiskResult *> * _Nonnull task) {
        AWSLightsailAttachDiskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailAttachInstancesToLoadBalancerResult *> *)attachInstancesToLoadBalancer:(AWSLightsailAttachInstancesToLoadBalancerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"AttachInstancesToLoadBalancer"
                   outputClass:[AWSLightsailAttachInstancesToLoadBalancerResult class]];
}

- (void)attachInstancesToLoadBalancer:(AWSLightsailAttachInstancesToLoadBalancerRequest *)request
     completionHandler:(void (^)(AWSLightsailAttachInstancesToLoadBalancerResult *response, NSError *error))completionHandler {
    [[self attachInstancesToLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailAttachInstancesToLoadBalancerResult *> * _Nonnull task) {
        AWSLightsailAttachInstancesToLoadBalancerResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailAttachLoadBalancerTlsCertificateResult *> *)attachLoadBalancerTlsCertificate:(AWSLightsailAttachLoadBalancerTlsCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"AttachLoadBalancerTlsCertificate"
                   outputClass:[AWSLightsailAttachLoadBalancerTlsCertificateResult class]];
}

- (void)attachLoadBalancerTlsCertificate:(AWSLightsailAttachLoadBalancerTlsCertificateRequest *)request
     completionHandler:(void (^)(AWSLightsailAttachLoadBalancerTlsCertificateResult *response, NSError *error))completionHandler {
    [[self attachLoadBalancerTlsCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailAttachLoadBalancerTlsCertificateResult *> * _Nonnull task) {
        AWSLightsailAttachLoadBalancerTlsCertificateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailAttachStaticIpResult *> *)attachStaticIp:(AWSLightsailAttachStaticIpRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"AttachStaticIp"
                   outputClass:[AWSLightsailAttachStaticIpResult class]];
}

- (void)attachStaticIp:(AWSLightsailAttachStaticIpRequest *)request
     completionHandler:(void (^)(AWSLightsailAttachStaticIpResult *response, NSError *error))completionHandler {
    [[self attachStaticIp:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailAttachStaticIpResult *> * _Nonnull task) {
        AWSLightsailAttachStaticIpResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCloseInstancePublicPortsResult *> *)closeInstancePublicPorts:(AWSLightsailCloseInstancePublicPortsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CloseInstancePublicPorts"
                   outputClass:[AWSLightsailCloseInstancePublicPortsResult class]];
}

- (void)closeInstancePublicPorts:(AWSLightsailCloseInstancePublicPortsRequest *)request
     completionHandler:(void (^)(AWSLightsailCloseInstancePublicPortsResult *response, NSError *error))completionHandler {
    [[self closeInstancePublicPorts:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCloseInstancePublicPortsResult *> * _Nonnull task) {
        AWSLightsailCloseInstancePublicPortsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailReplicateSnapshotResult *> *)replicateSnapshot:(AWSLightsailReplicateSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CopySnapshot"
                   outputClass:[AWSLightsailReplicateSnapshotResult class]];
}

- (void)replicateSnapshot:(AWSLightsailReplicateSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailReplicateSnapshotResult *response, NSError *error))completionHandler {
    [[self replicateSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailReplicateSnapshotResult *> * _Nonnull task) {
        AWSLightsailReplicateSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateCloudFormationStackResult *> *)createCloudFormationStack:(AWSLightsailCreateCloudFormationStackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateCloudFormationStack"
                   outputClass:[AWSLightsailCreateCloudFormationStackResult class]];
}

- (void)createCloudFormationStack:(AWSLightsailCreateCloudFormationStackRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateCloudFormationStackResult *response, NSError *error))completionHandler {
    [[self createCloudFormationStack:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateCloudFormationStackResult *> * _Nonnull task) {
        AWSLightsailCreateCloudFormationStackResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateContactMethodResult *> *)createContactMethod:(AWSLightsailCreateContactMethodRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateContactMethod"
                   outputClass:[AWSLightsailCreateContactMethodResult class]];
}

- (void)createContactMethod:(AWSLightsailCreateContactMethodRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateContactMethodResult *response, NSError *error))completionHandler {
    [[self createContactMethod:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateContactMethodResult *> * _Nonnull task) {
        AWSLightsailCreateContactMethodResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateDiskResult *> *)createDisk:(AWSLightsailCreateDiskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateDisk"
                   outputClass:[AWSLightsailCreateDiskResult class]];
}

- (void)createDisk:(AWSLightsailCreateDiskRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateDiskResult *response, NSError *error))completionHandler {
    [[self createDisk:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateDiskResult *> * _Nonnull task) {
        AWSLightsailCreateDiskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateDiskFromSnapshotResult *> *)createDiskFromSnapshot:(AWSLightsailCreateDiskFromSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateDiskFromSnapshot"
                   outputClass:[AWSLightsailCreateDiskFromSnapshotResult class]];
}

- (void)createDiskFromSnapshot:(AWSLightsailCreateDiskFromSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateDiskFromSnapshotResult *response, NSError *error))completionHandler {
    [[self createDiskFromSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateDiskFromSnapshotResult *> * _Nonnull task) {
        AWSLightsailCreateDiskFromSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateDiskSnapshotResult *> *)createDiskSnapshot:(AWSLightsailCreateDiskSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateDiskSnapshot"
                   outputClass:[AWSLightsailCreateDiskSnapshotResult class]];
}

- (void)createDiskSnapshot:(AWSLightsailCreateDiskSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateDiskSnapshotResult *response, NSError *error))completionHandler {
    [[self createDiskSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateDiskSnapshotResult *> * _Nonnull task) {
        AWSLightsailCreateDiskSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateDomainResult *> *)createDomain:(AWSLightsailCreateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateDomain"
                   outputClass:[AWSLightsailCreateDomainResult class]];
}

- (void)createDomain:(AWSLightsailCreateDomainRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateDomainResult *response, NSError *error))completionHandler {
    [[self createDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateDomainResult *> * _Nonnull task) {
        AWSLightsailCreateDomainResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateDomainEntryResult *> *)createDomainEntry:(AWSLightsailCreateDomainEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateDomainEntry"
                   outputClass:[AWSLightsailCreateDomainEntryResult class]];
}

- (void)createDomainEntry:(AWSLightsailCreateDomainEntryRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateDomainEntryResult *response, NSError *error))completionHandler {
    [[self createDomainEntry:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateDomainEntryResult *> * _Nonnull task) {
        AWSLightsailCreateDomainEntryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateInstanceSnapshotResult *> *)createInstanceSnapshot:(AWSLightsailCreateInstanceSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateInstanceSnapshot"
                   outputClass:[AWSLightsailCreateInstanceSnapshotResult class]];
}

- (void)createInstanceSnapshot:(AWSLightsailCreateInstanceSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateInstanceSnapshotResult *response, NSError *error))completionHandler {
    [[self createInstanceSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateInstanceSnapshotResult *> * _Nonnull task) {
        AWSLightsailCreateInstanceSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateInstancesResult *> *)createInstances:(AWSLightsailCreateInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateInstances"
                   outputClass:[AWSLightsailCreateInstancesResult class]];
}

- (void)createInstances:(AWSLightsailCreateInstancesRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateInstancesResult *response, NSError *error))completionHandler {
    [[self createInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateInstancesResult *> * _Nonnull task) {
        AWSLightsailCreateInstancesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateInstancesFromSnapshotResult *> *)createInstancesFromSnapshot:(AWSLightsailCreateInstancesFromSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateInstancesFromSnapshot"
                   outputClass:[AWSLightsailCreateInstancesFromSnapshotResult class]];
}

- (void)createInstancesFromSnapshot:(AWSLightsailCreateInstancesFromSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateInstancesFromSnapshotResult *response, NSError *error))completionHandler {
    [[self createInstancesFromSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateInstancesFromSnapshotResult *> * _Nonnull task) {
        AWSLightsailCreateInstancesFromSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateKeyPairResult *> *)createKeyPair:(AWSLightsailCreateKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateKeyPair"
                   outputClass:[AWSLightsailCreateKeyPairResult class]];
}

- (void)createKeyPair:(AWSLightsailCreateKeyPairRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateKeyPairResult *response, NSError *error))completionHandler {
    [[self createKeyPair:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateKeyPairResult *> * _Nonnull task) {
        AWSLightsailCreateKeyPairResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateLoadBalancerResult *> *)createLoadBalancer:(AWSLightsailCreateLoadBalancerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateLoadBalancer"
                   outputClass:[AWSLightsailCreateLoadBalancerResult class]];
}

- (void)createLoadBalancer:(AWSLightsailCreateLoadBalancerRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateLoadBalancerResult *response, NSError *error))completionHandler {
    [[self createLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateLoadBalancerResult *> * _Nonnull task) {
        AWSLightsailCreateLoadBalancerResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateLoadBalancerTlsCertificateResult *> *)createLoadBalancerTlsCertificate:(AWSLightsailCreateLoadBalancerTlsCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateLoadBalancerTlsCertificate"
                   outputClass:[AWSLightsailCreateLoadBalancerTlsCertificateResult class]];
}

- (void)createLoadBalancerTlsCertificate:(AWSLightsailCreateLoadBalancerTlsCertificateRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateLoadBalancerTlsCertificateResult *response, NSError *error))completionHandler {
    [[self createLoadBalancerTlsCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateLoadBalancerTlsCertificateResult *> * _Nonnull task) {
        AWSLightsailCreateLoadBalancerTlsCertificateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateRelationalDatabaseResult *> *)createRelationalDatabase:(AWSLightsailCreateRelationalDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateRelationalDatabase"
                   outputClass:[AWSLightsailCreateRelationalDatabaseResult class]];
}

- (void)createRelationalDatabase:(AWSLightsailCreateRelationalDatabaseRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateRelationalDatabaseResult *response, NSError *error))completionHandler {
    [[self createRelationalDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateRelationalDatabaseResult *> * _Nonnull task) {
        AWSLightsailCreateRelationalDatabaseResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateRelationalDatabaseFromSnapshotResult *> *)createRelationalDatabaseFromSnapshot:(AWSLightsailCreateRelationalDatabaseFromSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateRelationalDatabaseFromSnapshot"
                   outputClass:[AWSLightsailCreateRelationalDatabaseFromSnapshotResult class]];
}

- (void)createRelationalDatabaseFromSnapshot:(AWSLightsailCreateRelationalDatabaseFromSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateRelationalDatabaseFromSnapshotResult *response, NSError *error))completionHandler {
    [[self createRelationalDatabaseFromSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateRelationalDatabaseFromSnapshotResult *> * _Nonnull task) {
        AWSLightsailCreateRelationalDatabaseFromSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailCreateRelationalDatabaseSnapshotResult *> *)createRelationalDatabaseSnapshot:(AWSLightsailCreateRelationalDatabaseSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"CreateRelationalDatabaseSnapshot"
                   outputClass:[AWSLightsailCreateRelationalDatabaseSnapshotResult class]];
}

- (void)createRelationalDatabaseSnapshot:(AWSLightsailCreateRelationalDatabaseSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailCreateRelationalDatabaseSnapshotResult *response, NSError *error))completionHandler {
    [[self createRelationalDatabaseSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailCreateRelationalDatabaseSnapshotResult *> * _Nonnull task) {
        AWSLightsailCreateRelationalDatabaseSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteAlarmResult *> *)deleteAlarm:(AWSLightsailDeleteAlarmRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteAlarm"
                   outputClass:[AWSLightsailDeleteAlarmResult class]];
}

- (void)deleteAlarm:(AWSLightsailDeleteAlarmRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteAlarmResult *response, NSError *error))completionHandler {
    [[self deleteAlarm:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteAlarmResult *> * _Nonnull task) {
        AWSLightsailDeleteAlarmResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteAutoSnapshotResult *> *)deleteAutoSnapshot:(AWSLightsailDeleteAutoSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteAutoSnapshot"
                   outputClass:[AWSLightsailDeleteAutoSnapshotResult class]];
}

- (void)deleteAutoSnapshot:(AWSLightsailDeleteAutoSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteAutoSnapshotResult *response, NSError *error))completionHandler {
    [[self deleteAutoSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteAutoSnapshotResult *> * _Nonnull task) {
        AWSLightsailDeleteAutoSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteContactMethodResult *> *)deleteContactMethod:(AWSLightsailDeleteContactMethodRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteContactMethod"
                   outputClass:[AWSLightsailDeleteContactMethodResult class]];
}

- (void)deleteContactMethod:(AWSLightsailDeleteContactMethodRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteContactMethodResult *response, NSError *error))completionHandler {
    [[self deleteContactMethod:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteContactMethodResult *> * _Nonnull task) {
        AWSLightsailDeleteContactMethodResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteDiskResult *> *)deleteDisk:(AWSLightsailDeleteDiskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteDisk"
                   outputClass:[AWSLightsailDeleteDiskResult class]];
}

- (void)deleteDisk:(AWSLightsailDeleteDiskRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteDiskResult *response, NSError *error))completionHandler {
    [[self deleteDisk:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteDiskResult *> * _Nonnull task) {
        AWSLightsailDeleteDiskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteDiskSnapshotResult *> *)deleteDiskSnapshot:(AWSLightsailDeleteDiskSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteDiskSnapshot"
                   outputClass:[AWSLightsailDeleteDiskSnapshotResult class]];
}

- (void)deleteDiskSnapshot:(AWSLightsailDeleteDiskSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteDiskSnapshotResult *response, NSError *error))completionHandler {
    [[self deleteDiskSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteDiskSnapshotResult *> * _Nonnull task) {
        AWSLightsailDeleteDiskSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteDomainResult *> *)deleteDomain:(AWSLightsailDeleteDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteDomain"
                   outputClass:[AWSLightsailDeleteDomainResult class]];
}

- (void)deleteDomain:(AWSLightsailDeleteDomainRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteDomainResult *response, NSError *error))completionHandler {
    [[self deleteDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteDomainResult *> * _Nonnull task) {
        AWSLightsailDeleteDomainResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteDomainEntryResult *> *)deleteDomainEntry:(AWSLightsailDeleteDomainEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteDomainEntry"
                   outputClass:[AWSLightsailDeleteDomainEntryResult class]];
}

- (void)deleteDomainEntry:(AWSLightsailDeleteDomainEntryRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteDomainEntryResult *response, NSError *error))completionHandler {
    [[self deleteDomainEntry:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteDomainEntryResult *> * _Nonnull task) {
        AWSLightsailDeleteDomainEntryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteInstanceResult *> *)deleteInstance:(AWSLightsailDeleteInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteInstance"
                   outputClass:[AWSLightsailDeleteInstanceResult class]];
}

- (void)deleteInstance:(AWSLightsailDeleteInstanceRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteInstanceResult *response, NSError *error))completionHandler {
    [[self deleteInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteInstanceResult *> * _Nonnull task) {
        AWSLightsailDeleteInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteInstanceSnapshotResult *> *)deleteInstanceSnapshot:(AWSLightsailDeleteInstanceSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteInstanceSnapshot"
                   outputClass:[AWSLightsailDeleteInstanceSnapshotResult class]];
}

- (void)deleteInstanceSnapshot:(AWSLightsailDeleteInstanceSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteInstanceSnapshotResult *response, NSError *error))completionHandler {
    [[self deleteInstanceSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteInstanceSnapshotResult *> * _Nonnull task) {
        AWSLightsailDeleteInstanceSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteKeyPairResult *> *)deleteKeyPair:(AWSLightsailDeleteKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteKeyPair"
                   outputClass:[AWSLightsailDeleteKeyPairResult class]];
}

- (void)deleteKeyPair:(AWSLightsailDeleteKeyPairRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteKeyPairResult *response, NSError *error))completionHandler {
    [[self deleteKeyPair:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteKeyPairResult *> * _Nonnull task) {
        AWSLightsailDeleteKeyPairResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteKnownHostKeysResult *> *)deleteKnownHostKeys:(AWSLightsailDeleteKnownHostKeysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteKnownHostKeys"
                   outputClass:[AWSLightsailDeleteKnownHostKeysResult class]];
}

- (void)deleteKnownHostKeys:(AWSLightsailDeleteKnownHostKeysRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteKnownHostKeysResult *response, NSError *error))completionHandler {
    [[self deleteKnownHostKeys:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteKnownHostKeysResult *> * _Nonnull task) {
        AWSLightsailDeleteKnownHostKeysResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteLoadBalancerResult *> *)deleteLoadBalancer:(AWSLightsailDeleteLoadBalancerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteLoadBalancer"
                   outputClass:[AWSLightsailDeleteLoadBalancerResult class]];
}

- (void)deleteLoadBalancer:(AWSLightsailDeleteLoadBalancerRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteLoadBalancerResult *response, NSError *error))completionHandler {
    [[self deleteLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteLoadBalancerResult *> * _Nonnull task) {
        AWSLightsailDeleteLoadBalancerResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteLoadBalancerTlsCertificateResult *> *)deleteLoadBalancerTlsCertificate:(AWSLightsailDeleteLoadBalancerTlsCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteLoadBalancerTlsCertificate"
                   outputClass:[AWSLightsailDeleteLoadBalancerTlsCertificateResult class]];
}

- (void)deleteLoadBalancerTlsCertificate:(AWSLightsailDeleteLoadBalancerTlsCertificateRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteLoadBalancerTlsCertificateResult *response, NSError *error))completionHandler {
    [[self deleteLoadBalancerTlsCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteLoadBalancerTlsCertificateResult *> * _Nonnull task) {
        AWSLightsailDeleteLoadBalancerTlsCertificateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteRelationalDatabaseResult *> *)deleteRelationalDatabase:(AWSLightsailDeleteRelationalDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteRelationalDatabase"
                   outputClass:[AWSLightsailDeleteRelationalDatabaseResult class]];
}

- (void)deleteRelationalDatabase:(AWSLightsailDeleteRelationalDatabaseRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteRelationalDatabaseResult *response, NSError *error))completionHandler {
    [[self deleteRelationalDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteRelationalDatabaseResult *> * _Nonnull task) {
        AWSLightsailDeleteRelationalDatabaseResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDeleteRelationalDatabaseSnapshotResult *> *)deleteRelationalDatabaseSnapshot:(AWSLightsailDeleteRelationalDatabaseSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DeleteRelationalDatabaseSnapshot"
                   outputClass:[AWSLightsailDeleteRelationalDatabaseSnapshotResult class]];
}

- (void)deleteRelationalDatabaseSnapshot:(AWSLightsailDeleteRelationalDatabaseSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailDeleteRelationalDatabaseSnapshotResult *response, NSError *error))completionHandler {
    [[self deleteRelationalDatabaseSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDeleteRelationalDatabaseSnapshotResult *> * _Nonnull task) {
        AWSLightsailDeleteRelationalDatabaseSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDetachDiskResult *> *)detachDisk:(AWSLightsailDetachDiskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DetachDisk"
                   outputClass:[AWSLightsailDetachDiskResult class]];
}

- (void)detachDisk:(AWSLightsailDetachDiskRequest *)request
     completionHandler:(void (^)(AWSLightsailDetachDiskResult *response, NSError *error))completionHandler {
    [[self detachDisk:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDetachDiskResult *> * _Nonnull task) {
        AWSLightsailDetachDiskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDetachInstancesFromLoadBalancerResult *> *)detachInstancesFromLoadBalancer:(AWSLightsailDetachInstancesFromLoadBalancerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DetachInstancesFromLoadBalancer"
                   outputClass:[AWSLightsailDetachInstancesFromLoadBalancerResult class]];
}

- (void)detachInstancesFromLoadBalancer:(AWSLightsailDetachInstancesFromLoadBalancerRequest *)request
     completionHandler:(void (^)(AWSLightsailDetachInstancesFromLoadBalancerResult *response, NSError *error))completionHandler {
    [[self detachInstancesFromLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDetachInstancesFromLoadBalancerResult *> * _Nonnull task) {
        AWSLightsailDetachInstancesFromLoadBalancerResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDetachStaticIpResult *> *)detachStaticIp:(AWSLightsailDetachStaticIpRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DetachStaticIp"
                   outputClass:[AWSLightsailDetachStaticIpResult class]];
}

- (void)detachStaticIp:(AWSLightsailDetachStaticIpRequest *)request
     completionHandler:(void (^)(AWSLightsailDetachStaticIpResult *response, NSError *error))completionHandler {
    [[self detachStaticIp:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDetachStaticIpResult *> * _Nonnull task) {
        AWSLightsailDetachStaticIpResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDisableAddOnResult *> *)disableAddOn:(AWSLightsailDisableAddOnRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DisableAddOn"
                   outputClass:[AWSLightsailDisableAddOnResult class]];
}

- (void)disableAddOn:(AWSLightsailDisableAddOnRequest *)request
     completionHandler:(void (^)(AWSLightsailDisableAddOnResult *response, NSError *error))completionHandler {
    [[self disableAddOn:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDisableAddOnResult *> * _Nonnull task) {
        AWSLightsailDisableAddOnResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailDownloadDefaultKeyPairResult *> *)downloadDefaultKeyPair:(AWSLightsailDownloadDefaultKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"DownloadDefaultKeyPair"
                   outputClass:[AWSLightsailDownloadDefaultKeyPairResult class]];
}

- (void)downloadDefaultKeyPair:(AWSLightsailDownloadDefaultKeyPairRequest *)request
     completionHandler:(void (^)(AWSLightsailDownloadDefaultKeyPairResult *response, NSError *error))completionHandler {
    [[self downloadDefaultKeyPair:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailDownloadDefaultKeyPairResult *> * _Nonnull task) {
        AWSLightsailDownloadDefaultKeyPairResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailEnableAddOnResult *> *)enableAddOn:(AWSLightsailEnableAddOnRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"EnableAddOn"
                   outputClass:[AWSLightsailEnableAddOnResult class]];
}

- (void)enableAddOn:(AWSLightsailEnableAddOnRequest *)request
     completionHandler:(void (^)(AWSLightsailEnableAddOnResult *response, NSError *error))completionHandler {
    [[self enableAddOn:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailEnableAddOnResult *> * _Nonnull task) {
        AWSLightsailEnableAddOnResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailExportSnapshotResult *> *)exportSnapshot:(AWSLightsailExportSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"ExportSnapshot"
                   outputClass:[AWSLightsailExportSnapshotResult class]];
}

- (void)exportSnapshot:(AWSLightsailExportSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailExportSnapshotResult *response, NSError *error))completionHandler {
    [[self exportSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailExportSnapshotResult *> * _Nonnull task) {
        AWSLightsailExportSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetActiveNamesResult *> *)getActiveNames:(AWSLightsailGetActiveNamesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetActiveNames"
                   outputClass:[AWSLightsailGetActiveNamesResult class]];
}

- (void)getActiveNames:(AWSLightsailGetActiveNamesRequest *)request
     completionHandler:(void (^)(AWSLightsailGetActiveNamesResult *response, NSError *error))completionHandler {
    [[self getActiveNames:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetActiveNamesResult *> * _Nonnull task) {
        AWSLightsailGetActiveNamesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetAlarmsResult *> *)getAlarms:(AWSLightsailGetAlarmsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetAlarms"
                   outputClass:[AWSLightsailGetAlarmsResult class]];
}

- (void)getAlarms:(AWSLightsailGetAlarmsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetAlarmsResult *response, NSError *error))completionHandler {
    [[self getAlarms:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetAlarmsResult *> * _Nonnull task) {
        AWSLightsailGetAlarmsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetAutoSnapshotsResult *> *)getAutoSnapshots:(AWSLightsailGetAutoSnapshotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetAutoSnapshots"
                   outputClass:[AWSLightsailGetAutoSnapshotsResult class]];
}

- (void)getAutoSnapshots:(AWSLightsailGetAutoSnapshotsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetAutoSnapshotsResult *response, NSError *error))completionHandler {
    [[self getAutoSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetAutoSnapshotsResult *> * _Nonnull task) {
        AWSLightsailGetAutoSnapshotsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetBlueprintsResult *> *)getBlueprints:(AWSLightsailGetBlueprintsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetBlueprints"
                   outputClass:[AWSLightsailGetBlueprintsResult class]];
}

- (void)getBlueprints:(AWSLightsailGetBlueprintsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetBlueprintsResult *response, NSError *error))completionHandler {
    [[self getBlueprints:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetBlueprintsResult *> * _Nonnull task) {
        AWSLightsailGetBlueprintsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetBundlesResult *> *)getBundles:(AWSLightsailGetBundlesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetBundles"
                   outputClass:[AWSLightsailGetBundlesResult class]];
}

- (void)getBundles:(AWSLightsailGetBundlesRequest *)request
     completionHandler:(void (^)(AWSLightsailGetBundlesResult *response, NSError *error))completionHandler {
    [[self getBundles:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetBundlesResult *> * _Nonnull task) {
        AWSLightsailGetBundlesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetCloudFormationStackRecordsResult *> *)getCloudFormationStackRecords:(AWSLightsailGetCloudFormationStackRecordsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetCloudFormationStackRecords"
                   outputClass:[AWSLightsailGetCloudFormationStackRecordsResult class]];
}

- (void)getCloudFormationStackRecords:(AWSLightsailGetCloudFormationStackRecordsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetCloudFormationStackRecordsResult *response, NSError *error))completionHandler {
    [[self getCloudFormationStackRecords:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetCloudFormationStackRecordsResult *> * _Nonnull task) {
        AWSLightsailGetCloudFormationStackRecordsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetContactMethodsResult *> *)getContactMethods:(AWSLightsailGetContactMethodsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetContactMethods"
                   outputClass:[AWSLightsailGetContactMethodsResult class]];
}

- (void)getContactMethods:(AWSLightsailGetContactMethodsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetContactMethodsResult *response, NSError *error))completionHandler {
    [[self getContactMethods:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetContactMethodsResult *> * _Nonnull task) {
        AWSLightsailGetContactMethodsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetDiskResult *> *)getDisk:(AWSLightsailGetDiskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetDisk"
                   outputClass:[AWSLightsailGetDiskResult class]];
}

- (void)getDisk:(AWSLightsailGetDiskRequest *)request
     completionHandler:(void (^)(AWSLightsailGetDiskResult *response, NSError *error))completionHandler {
    [[self getDisk:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetDiskResult *> * _Nonnull task) {
        AWSLightsailGetDiskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetDiskSnapshotResult *> *)getDiskSnapshot:(AWSLightsailGetDiskSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetDiskSnapshot"
                   outputClass:[AWSLightsailGetDiskSnapshotResult class]];
}

- (void)getDiskSnapshot:(AWSLightsailGetDiskSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailGetDiskSnapshotResult *response, NSError *error))completionHandler {
    [[self getDiskSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetDiskSnapshotResult *> * _Nonnull task) {
        AWSLightsailGetDiskSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetDiskSnapshotsResult *> *)getDiskSnapshots:(AWSLightsailGetDiskSnapshotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetDiskSnapshots"
                   outputClass:[AWSLightsailGetDiskSnapshotsResult class]];
}

- (void)getDiskSnapshots:(AWSLightsailGetDiskSnapshotsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetDiskSnapshotsResult *response, NSError *error))completionHandler {
    [[self getDiskSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetDiskSnapshotsResult *> * _Nonnull task) {
        AWSLightsailGetDiskSnapshotsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetDisksResult *> *)getDisks:(AWSLightsailGetDisksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetDisks"
                   outputClass:[AWSLightsailGetDisksResult class]];
}

- (void)getDisks:(AWSLightsailGetDisksRequest *)request
     completionHandler:(void (^)(AWSLightsailGetDisksResult *response, NSError *error))completionHandler {
    [[self getDisks:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetDisksResult *> * _Nonnull task) {
        AWSLightsailGetDisksResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetDomainResult *> *)getDomain:(AWSLightsailGetDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetDomain"
                   outputClass:[AWSLightsailGetDomainResult class]];
}

- (void)getDomain:(AWSLightsailGetDomainRequest *)request
     completionHandler:(void (^)(AWSLightsailGetDomainResult *response, NSError *error))completionHandler {
    [[self getDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetDomainResult *> * _Nonnull task) {
        AWSLightsailGetDomainResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetDomainsResult *> *)getDomains:(AWSLightsailGetDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetDomains"
                   outputClass:[AWSLightsailGetDomainsResult class]];
}

- (void)getDomains:(AWSLightsailGetDomainsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetDomainsResult *response, NSError *error))completionHandler {
    [[self getDomains:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetDomainsResult *> * _Nonnull task) {
        AWSLightsailGetDomainsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetExportSnapshotRecordsResult *> *)getExportSnapshotRecords:(AWSLightsailGetExportSnapshotRecordsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetExportSnapshotRecords"
                   outputClass:[AWSLightsailGetExportSnapshotRecordsResult class]];
}

- (void)getExportSnapshotRecords:(AWSLightsailGetExportSnapshotRecordsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetExportSnapshotRecordsResult *response, NSError *error))completionHandler {
    [[self getExportSnapshotRecords:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetExportSnapshotRecordsResult *> * _Nonnull task) {
        AWSLightsailGetExportSnapshotRecordsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetInstanceResult *> *)getInstance:(AWSLightsailGetInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetInstance"
                   outputClass:[AWSLightsailGetInstanceResult class]];
}

- (void)getInstance:(AWSLightsailGetInstanceRequest *)request
     completionHandler:(void (^)(AWSLightsailGetInstanceResult *response, NSError *error))completionHandler {
    [[self getInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetInstanceResult *> * _Nonnull task) {
        AWSLightsailGetInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetInstanceAccessDetailsResult *> *)getInstanceAccessDetails:(AWSLightsailGetInstanceAccessDetailsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetInstanceAccessDetails"
                   outputClass:[AWSLightsailGetInstanceAccessDetailsResult class]];
}

- (void)getInstanceAccessDetails:(AWSLightsailGetInstanceAccessDetailsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetInstanceAccessDetailsResult *response, NSError *error))completionHandler {
    [[self getInstanceAccessDetails:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetInstanceAccessDetailsResult *> * _Nonnull task) {
        AWSLightsailGetInstanceAccessDetailsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetInstanceMetricDataResult *> *)getInstanceMetricData:(AWSLightsailGetInstanceMetricDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetInstanceMetricData"
                   outputClass:[AWSLightsailGetInstanceMetricDataResult class]];
}

- (void)getInstanceMetricData:(AWSLightsailGetInstanceMetricDataRequest *)request
     completionHandler:(void (^)(AWSLightsailGetInstanceMetricDataResult *response, NSError *error))completionHandler {
    [[self getInstanceMetricData:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetInstanceMetricDataResult *> * _Nonnull task) {
        AWSLightsailGetInstanceMetricDataResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetInstancePortStatesResult *> *)getInstancePortStates:(AWSLightsailGetInstancePortStatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetInstancePortStates"
                   outputClass:[AWSLightsailGetInstancePortStatesResult class]];
}

- (void)getInstancePortStates:(AWSLightsailGetInstancePortStatesRequest *)request
     completionHandler:(void (^)(AWSLightsailGetInstancePortStatesResult *response, NSError *error))completionHandler {
    [[self getInstancePortStates:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetInstancePortStatesResult *> * _Nonnull task) {
        AWSLightsailGetInstancePortStatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetInstanceSnapshotResult *> *)getInstanceSnapshot:(AWSLightsailGetInstanceSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetInstanceSnapshot"
                   outputClass:[AWSLightsailGetInstanceSnapshotResult class]];
}

- (void)getInstanceSnapshot:(AWSLightsailGetInstanceSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailGetInstanceSnapshotResult *response, NSError *error))completionHandler {
    [[self getInstanceSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetInstanceSnapshotResult *> * _Nonnull task) {
        AWSLightsailGetInstanceSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetInstanceSnapshotsResult *> *)getInstanceSnapshots:(AWSLightsailGetInstanceSnapshotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetInstanceSnapshots"
                   outputClass:[AWSLightsailGetInstanceSnapshotsResult class]];
}

- (void)getInstanceSnapshots:(AWSLightsailGetInstanceSnapshotsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetInstanceSnapshotsResult *response, NSError *error))completionHandler {
    [[self getInstanceSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetInstanceSnapshotsResult *> * _Nonnull task) {
        AWSLightsailGetInstanceSnapshotsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetInstanceStateResult *> *)getInstanceState:(AWSLightsailGetInstanceStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetInstanceState"
                   outputClass:[AWSLightsailGetInstanceStateResult class]];
}

- (void)getInstanceState:(AWSLightsailGetInstanceStateRequest *)request
     completionHandler:(void (^)(AWSLightsailGetInstanceStateResult *response, NSError *error))completionHandler {
    [[self getInstanceState:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetInstanceStateResult *> * _Nonnull task) {
        AWSLightsailGetInstanceStateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetInstancesResult *> *)getInstances:(AWSLightsailGetInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetInstances"
                   outputClass:[AWSLightsailGetInstancesResult class]];
}

- (void)getInstances:(AWSLightsailGetInstancesRequest *)request
     completionHandler:(void (^)(AWSLightsailGetInstancesResult *response, NSError *error))completionHandler {
    [[self getInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetInstancesResult *> * _Nonnull task) {
        AWSLightsailGetInstancesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetKeyPairResult *> *)getKeyPair:(AWSLightsailGetKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetKeyPair"
                   outputClass:[AWSLightsailGetKeyPairResult class]];
}

- (void)getKeyPair:(AWSLightsailGetKeyPairRequest *)request
     completionHandler:(void (^)(AWSLightsailGetKeyPairResult *response, NSError *error))completionHandler {
    [[self getKeyPair:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetKeyPairResult *> * _Nonnull task) {
        AWSLightsailGetKeyPairResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetKeyPairsResult *> *)getKeyPairs:(AWSLightsailGetKeyPairsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetKeyPairs"
                   outputClass:[AWSLightsailGetKeyPairsResult class]];
}

- (void)getKeyPairs:(AWSLightsailGetKeyPairsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetKeyPairsResult *response, NSError *error))completionHandler {
    [[self getKeyPairs:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetKeyPairsResult *> * _Nonnull task) {
        AWSLightsailGetKeyPairsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetLoadBalancerResult *> *)getLoadBalancer:(AWSLightsailGetLoadBalancerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetLoadBalancer"
                   outputClass:[AWSLightsailGetLoadBalancerResult class]];
}

- (void)getLoadBalancer:(AWSLightsailGetLoadBalancerRequest *)request
     completionHandler:(void (^)(AWSLightsailGetLoadBalancerResult *response, NSError *error))completionHandler {
    [[self getLoadBalancer:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetLoadBalancerResult *> * _Nonnull task) {
        AWSLightsailGetLoadBalancerResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetLoadBalancerMetricDataResult *> *)getLoadBalancerMetricData:(AWSLightsailGetLoadBalancerMetricDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetLoadBalancerMetricData"
                   outputClass:[AWSLightsailGetLoadBalancerMetricDataResult class]];
}

- (void)getLoadBalancerMetricData:(AWSLightsailGetLoadBalancerMetricDataRequest *)request
     completionHandler:(void (^)(AWSLightsailGetLoadBalancerMetricDataResult *response, NSError *error))completionHandler {
    [[self getLoadBalancerMetricData:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetLoadBalancerMetricDataResult *> * _Nonnull task) {
        AWSLightsailGetLoadBalancerMetricDataResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetLoadBalancerTlsCertificatesResult *> *)getLoadBalancerTlsCertificates:(AWSLightsailGetLoadBalancerTlsCertificatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetLoadBalancerTlsCertificates"
                   outputClass:[AWSLightsailGetLoadBalancerTlsCertificatesResult class]];
}

- (void)getLoadBalancerTlsCertificates:(AWSLightsailGetLoadBalancerTlsCertificatesRequest *)request
     completionHandler:(void (^)(AWSLightsailGetLoadBalancerTlsCertificatesResult *response, NSError *error))completionHandler {
    [[self getLoadBalancerTlsCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetLoadBalancerTlsCertificatesResult *> * _Nonnull task) {
        AWSLightsailGetLoadBalancerTlsCertificatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetLoadBalancersResult *> *)getLoadBalancers:(AWSLightsailGetLoadBalancersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetLoadBalancers"
                   outputClass:[AWSLightsailGetLoadBalancersResult class]];
}

- (void)getLoadBalancers:(AWSLightsailGetLoadBalancersRequest *)request
     completionHandler:(void (^)(AWSLightsailGetLoadBalancersResult *response, NSError *error))completionHandler {
    [[self getLoadBalancers:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetLoadBalancersResult *> * _Nonnull task) {
        AWSLightsailGetLoadBalancersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetOperationResult *> *)getOperation:(AWSLightsailGetOperationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetOperation"
                   outputClass:[AWSLightsailGetOperationResult class]];
}

- (void)getOperation:(AWSLightsailGetOperationRequest *)request
     completionHandler:(void (^)(AWSLightsailGetOperationResult *response, NSError *error))completionHandler {
    [[self getOperation:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetOperationResult *> * _Nonnull task) {
        AWSLightsailGetOperationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetOperationsResult *> *)getOperations:(AWSLightsailGetOperationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetOperations"
                   outputClass:[AWSLightsailGetOperationsResult class]];
}

- (void)getOperations:(AWSLightsailGetOperationsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetOperationsResult *response, NSError *error))completionHandler {
    [[self getOperations:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetOperationsResult *> * _Nonnull task) {
        AWSLightsailGetOperationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetOperationsForResourceResult *> *)getOperationsForResource:(AWSLightsailGetOperationsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetOperationsForResource"
                   outputClass:[AWSLightsailGetOperationsForResourceResult class]];
}

- (void)getOperationsForResource:(AWSLightsailGetOperationsForResourceRequest *)request
     completionHandler:(void (^)(AWSLightsailGetOperationsForResourceResult *response, NSError *error))completionHandler {
    [[self getOperationsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetOperationsForResourceResult *> * _Nonnull task) {
        AWSLightsailGetOperationsForResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRegionsResult *> *)getRegions:(AWSLightsailGetRegionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRegions"
                   outputClass:[AWSLightsailGetRegionsResult class]];
}

- (void)getRegions:(AWSLightsailGetRegionsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRegionsResult *response, NSError *error))completionHandler {
    [[self getRegions:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRegionsResult *> * _Nonnull task) {
        AWSLightsailGetRegionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseResult *> *)getRelationalDatabase:(AWSLightsailGetRelationalDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabase"
                   outputClass:[AWSLightsailGetRelationalDatabaseResult class]];
}

- (void)getRelationalDatabase:(AWSLightsailGetRelationalDatabaseRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseBlueprintsResult *> *)getRelationalDatabaseBlueprints:(AWSLightsailGetRelationalDatabaseBlueprintsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabaseBlueprints"
                   outputClass:[AWSLightsailGetRelationalDatabaseBlueprintsResult class]];
}

- (void)getRelationalDatabaseBlueprints:(AWSLightsailGetRelationalDatabaseBlueprintsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseBlueprintsResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabaseBlueprints:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseBlueprintsResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseBlueprintsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseBundlesResult *> *)getRelationalDatabaseBundles:(AWSLightsailGetRelationalDatabaseBundlesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabaseBundles"
                   outputClass:[AWSLightsailGetRelationalDatabaseBundlesResult class]];
}

- (void)getRelationalDatabaseBundles:(AWSLightsailGetRelationalDatabaseBundlesRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseBundlesResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabaseBundles:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseBundlesResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseBundlesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseEventsResult *> *)getRelationalDatabaseEvents:(AWSLightsailGetRelationalDatabaseEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabaseEvents"
                   outputClass:[AWSLightsailGetRelationalDatabaseEventsResult class]];
}

- (void)getRelationalDatabaseEvents:(AWSLightsailGetRelationalDatabaseEventsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseEventsResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabaseEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseEventsResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseEventsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseLogEventsResult *> *)getRelationalDatabaseLogEvents:(AWSLightsailGetRelationalDatabaseLogEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabaseLogEvents"
                   outputClass:[AWSLightsailGetRelationalDatabaseLogEventsResult class]];
}

- (void)getRelationalDatabaseLogEvents:(AWSLightsailGetRelationalDatabaseLogEventsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseLogEventsResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabaseLogEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseLogEventsResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseLogEventsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseLogStreamsResult *> *)getRelationalDatabaseLogStreams:(AWSLightsailGetRelationalDatabaseLogStreamsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabaseLogStreams"
                   outputClass:[AWSLightsailGetRelationalDatabaseLogStreamsResult class]];
}

- (void)getRelationalDatabaseLogStreams:(AWSLightsailGetRelationalDatabaseLogStreamsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseLogStreamsResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabaseLogStreams:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseLogStreamsResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseLogStreamsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseMasterUserPasswordResult *> *)getRelationalDatabaseMasterUserPassword:(AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabaseMasterUserPassword"
                   outputClass:[AWSLightsailGetRelationalDatabaseMasterUserPasswordResult class]];
}

- (void)getRelationalDatabaseMasterUserPassword:(AWSLightsailGetRelationalDatabaseMasterUserPasswordRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseMasterUserPasswordResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabaseMasterUserPassword:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseMasterUserPasswordResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseMasterUserPasswordResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseMetricDataResult *> *)getRelationalDatabaseMetricData:(AWSLightsailGetRelationalDatabaseMetricDataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabaseMetricData"
                   outputClass:[AWSLightsailGetRelationalDatabaseMetricDataResult class]];
}

- (void)getRelationalDatabaseMetricData:(AWSLightsailGetRelationalDatabaseMetricDataRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseMetricDataResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabaseMetricData:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseMetricDataResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseMetricDataResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseParametersResult *> *)getRelationalDatabaseParameters:(AWSLightsailGetRelationalDatabaseParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabaseParameters"
                   outputClass:[AWSLightsailGetRelationalDatabaseParametersResult class]];
}

- (void)getRelationalDatabaseParameters:(AWSLightsailGetRelationalDatabaseParametersRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseParametersResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabaseParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseParametersResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseSnapshotResult *> *)getRelationalDatabaseSnapshot:(AWSLightsailGetRelationalDatabaseSnapshotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabaseSnapshot"
                   outputClass:[AWSLightsailGetRelationalDatabaseSnapshotResult class]];
}

- (void)getRelationalDatabaseSnapshot:(AWSLightsailGetRelationalDatabaseSnapshotRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseSnapshotResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabaseSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseSnapshotResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabaseSnapshotsResult *> *)getRelationalDatabaseSnapshots:(AWSLightsailGetRelationalDatabaseSnapshotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabaseSnapshots"
                   outputClass:[AWSLightsailGetRelationalDatabaseSnapshotsResult class]];
}

- (void)getRelationalDatabaseSnapshots:(AWSLightsailGetRelationalDatabaseSnapshotsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabaseSnapshotsResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabaseSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabaseSnapshotsResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabaseSnapshotsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetRelationalDatabasesResult *> *)getRelationalDatabases:(AWSLightsailGetRelationalDatabasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetRelationalDatabases"
                   outputClass:[AWSLightsailGetRelationalDatabasesResult class]];
}

- (void)getRelationalDatabases:(AWSLightsailGetRelationalDatabasesRequest *)request
     completionHandler:(void (^)(AWSLightsailGetRelationalDatabasesResult *response, NSError *error))completionHandler {
    [[self getRelationalDatabases:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetRelationalDatabasesResult *> * _Nonnull task) {
        AWSLightsailGetRelationalDatabasesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetStaticIpResult *> *)getStaticIp:(AWSLightsailGetStaticIpRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetStaticIp"
                   outputClass:[AWSLightsailGetStaticIpResult class]];
}

- (void)getStaticIp:(AWSLightsailGetStaticIpRequest *)request
     completionHandler:(void (^)(AWSLightsailGetStaticIpResult *response, NSError *error))completionHandler {
    [[self getStaticIp:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetStaticIpResult *> * _Nonnull task) {
        AWSLightsailGetStaticIpResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailGetStaticIpsResult *> *)getStaticIps:(AWSLightsailGetStaticIpsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"GetStaticIps"
                   outputClass:[AWSLightsailGetStaticIpsResult class]];
}

- (void)getStaticIps:(AWSLightsailGetStaticIpsRequest *)request
     completionHandler:(void (^)(AWSLightsailGetStaticIpsResult *response, NSError *error))completionHandler {
    [[self getStaticIps:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailGetStaticIpsResult *> * _Nonnull task) {
        AWSLightsailGetStaticIpsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailImportKeyPairResult *> *)importKeyPair:(AWSLightsailImportKeyPairRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"ImportKeyPair"
                   outputClass:[AWSLightsailImportKeyPairResult class]];
}

- (void)importKeyPair:(AWSLightsailImportKeyPairRequest *)request
     completionHandler:(void (^)(AWSLightsailImportKeyPairResult *response, NSError *error))completionHandler {
    [[self importKeyPair:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailImportKeyPairResult *> * _Nonnull task) {
        AWSLightsailImportKeyPairResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailIsVpcPeeredResult *> *)isVpcPeered:(AWSLightsailIsVpcPeeredRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"IsVpcPeered"
                   outputClass:[AWSLightsailIsVpcPeeredResult class]];
}

- (void)isVpcPeered:(AWSLightsailIsVpcPeeredRequest *)request
     completionHandler:(void (^)(AWSLightsailIsVpcPeeredResult *response, NSError *error))completionHandler {
    [[self isVpcPeered:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailIsVpcPeeredResult *> * _Nonnull task) {
        AWSLightsailIsVpcPeeredResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailOpenInstancePublicPortsResult *> *)openInstancePublicPorts:(AWSLightsailOpenInstancePublicPortsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"OpenInstancePublicPorts"
                   outputClass:[AWSLightsailOpenInstancePublicPortsResult class]];
}

- (void)openInstancePublicPorts:(AWSLightsailOpenInstancePublicPortsRequest *)request
     completionHandler:(void (^)(AWSLightsailOpenInstancePublicPortsResult *response, NSError *error))completionHandler {
    [[self openInstancePublicPorts:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailOpenInstancePublicPortsResult *> * _Nonnull task) {
        AWSLightsailOpenInstancePublicPortsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailPeerVpcResult *> *)peerVpc:(AWSLightsailPeerVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"PeerVpc"
                   outputClass:[AWSLightsailPeerVpcResult class]];
}

- (void)peerVpc:(AWSLightsailPeerVpcRequest *)request
     completionHandler:(void (^)(AWSLightsailPeerVpcResult *response, NSError *error))completionHandler {
    [[self peerVpc:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailPeerVpcResult *> * _Nonnull task) {
        AWSLightsailPeerVpcResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailPutAlarmResult *> *)putAlarm:(AWSLightsailPutAlarmRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"PutAlarm"
                   outputClass:[AWSLightsailPutAlarmResult class]];
}

- (void)putAlarm:(AWSLightsailPutAlarmRequest *)request
     completionHandler:(void (^)(AWSLightsailPutAlarmResult *response, NSError *error))completionHandler {
    [[self putAlarm:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailPutAlarmResult *> * _Nonnull task) {
        AWSLightsailPutAlarmResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailPutInstancePublicPortsResult *> *)putInstancePublicPorts:(AWSLightsailPutInstancePublicPortsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"PutInstancePublicPorts"
                   outputClass:[AWSLightsailPutInstancePublicPortsResult class]];
}

- (void)putInstancePublicPorts:(AWSLightsailPutInstancePublicPortsRequest *)request
     completionHandler:(void (^)(AWSLightsailPutInstancePublicPortsResult *response, NSError *error))completionHandler {
    [[self putInstancePublicPorts:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailPutInstancePublicPortsResult *> * _Nonnull task) {
        AWSLightsailPutInstancePublicPortsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailRebootInstanceResult *> *)rebootInstance:(AWSLightsailRebootInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"RebootInstance"
                   outputClass:[AWSLightsailRebootInstanceResult class]];
}

- (void)rebootInstance:(AWSLightsailRebootInstanceRequest *)request
     completionHandler:(void (^)(AWSLightsailRebootInstanceResult *response, NSError *error))completionHandler {
    [[self rebootInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailRebootInstanceResult *> * _Nonnull task) {
        AWSLightsailRebootInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailRebootRelationalDatabaseResult *> *)rebootRelationalDatabase:(AWSLightsailRebootRelationalDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"RebootRelationalDatabase"
                   outputClass:[AWSLightsailRebootRelationalDatabaseResult class]];
}

- (void)rebootRelationalDatabase:(AWSLightsailRebootRelationalDatabaseRequest *)request
     completionHandler:(void (^)(AWSLightsailRebootRelationalDatabaseResult *response, NSError *error))completionHandler {
    [[self rebootRelationalDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailRebootRelationalDatabaseResult *> * _Nonnull task) {
        AWSLightsailRebootRelationalDatabaseResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailReleaseStaticIpResult *> *)releaseStaticIp:(AWSLightsailReleaseStaticIpRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"ReleaseStaticIp"
                   outputClass:[AWSLightsailReleaseStaticIpResult class]];
}

- (void)releaseStaticIp:(AWSLightsailReleaseStaticIpRequest *)request
     completionHandler:(void (^)(AWSLightsailReleaseStaticIpResult *response, NSError *error))completionHandler {
    [[self releaseStaticIp:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailReleaseStaticIpResult *> * _Nonnull task) {
        AWSLightsailReleaseStaticIpResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailSendContactMethodVerificationResult *> *)sendContactMethodVerification:(AWSLightsailSendContactMethodVerificationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"SendContactMethodVerification"
                   outputClass:[AWSLightsailSendContactMethodVerificationResult class]];
}

- (void)sendContactMethodVerification:(AWSLightsailSendContactMethodVerificationRequest *)request
     completionHandler:(void (^)(AWSLightsailSendContactMethodVerificationResult *response, NSError *error))completionHandler {
    [[self sendContactMethodVerification:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailSendContactMethodVerificationResult *> * _Nonnull task) {
        AWSLightsailSendContactMethodVerificationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailStartInstanceResult *> *)startInstance:(AWSLightsailStartInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"StartInstance"
                   outputClass:[AWSLightsailStartInstanceResult class]];
}

- (void)startInstance:(AWSLightsailStartInstanceRequest *)request
     completionHandler:(void (^)(AWSLightsailStartInstanceResult *response, NSError *error))completionHandler {
    [[self startInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailStartInstanceResult *> * _Nonnull task) {
        AWSLightsailStartInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailStartRelationalDatabaseResult *> *)startRelationalDatabase:(AWSLightsailStartRelationalDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"StartRelationalDatabase"
                   outputClass:[AWSLightsailStartRelationalDatabaseResult class]];
}

- (void)startRelationalDatabase:(AWSLightsailStartRelationalDatabaseRequest *)request
     completionHandler:(void (^)(AWSLightsailStartRelationalDatabaseResult *response, NSError *error))completionHandler {
    [[self startRelationalDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailStartRelationalDatabaseResult *> * _Nonnull task) {
        AWSLightsailStartRelationalDatabaseResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailStopInstanceResult *> *)stopInstance:(AWSLightsailStopInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"StopInstance"
                   outputClass:[AWSLightsailStopInstanceResult class]];
}

- (void)stopInstance:(AWSLightsailStopInstanceRequest *)request
     completionHandler:(void (^)(AWSLightsailStopInstanceResult *response, NSError *error))completionHandler {
    [[self stopInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailStopInstanceResult *> * _Nonnull task) {
        AWSLightsailStopInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailStopRelationalDatabaseResult *> *)stopRelationalDatabase:(AWSLightsailStopRelationalDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"StopRelationalDatabase"
                   outputClass:[AWSLightsailStopRelationalDatabaseResult class]];
}

- (void)stopRelationalDatabase:(AWSLightsailStopRelationalDatabaseRequest *)request
     completionHandler:(void (^)(AWSLightsailStopRelationalDatabaseResult *response, NSError *error))completionHandler {
    [[self stopRelationalDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailStopRelationalDatabaseResult *> * _Nonnull task) {
        AWSLightsailStopRelationalDatabaseResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailTagResourceResult *> *)tagResource:(AWSLightsailTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"TagResource"
                   outputClass:[AWSLightsailTagResourceResult class]];
}

- (void)tagResource:(AWSLightsailTagResourceRequest *)request
     completionHandler:(void (^)(AWSLightsailTagResourceResult *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailTagResourceResult *> * _Nonnull task) {
        AWSLightsailTagResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailTestAlarmResult *> *)testAlarm:(AWSLightsailTestAlarmRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"TestAlarm"
                   outputClass:[AWSLightsailTestAlarmResult class]];
}

- (void)testAlarm:(AWSLightsailTestAlarmRequest *)request
     completionHandler:(void (^)(AWSLightsailTestAlarmResult *response, NSError *error))completionHandler {
    [[self testAlarm:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailTestAlarmResult *> * _Nonnull task) {
        AWSLightsailTestAlarmResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailUnpeerVpcResult *> *)unpeerVpc:(AWSLightsailUnpeerVpcRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"UnpeerVpc"
                   outputClass:[AWSLightsailUnpeerVpcResult class]];
}

- (void)unpeerVpc:(AWSLightsailUnpeerVpcRequest *)request
     completionHandler:(void (^)(AWSLightsailUnpeerVpcResult *response, NSError *error))completionHandler {
    [[self unpeerVpc:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailUnpeerVpcResult *> * _Nonnull task) {
        AWSLightsailUnpeerVpcResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailUntagResourceResult *> *)untagResource:(AWSLightsailUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"UntagResource"
                   outputClass:[AWSLightsailUntagResourceResult class]];
}

- (void)untagResource:(AWSLightsailUntagResourceRequest *)request
     completionHandler:(void (^)(AWSLightsailUntagResourceResult *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailUntagResourceResult *> * _Nonnull task) {
        AWSLightsailUntagResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailUpdateDomainEntryResult *> *)updateDomainEntry:(AWSLightsailUpdateDomainEntryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"UpdateDomainEntry"
                   outputClass:[AWSLightsailUpdateDomainEntryResult class]];
}

- (void)updateDomainEntry:(AWSLightsailUpdateDomainEntryRequest *)request
     completionHandler:(void (^)(AWSLightsailUpdateDomainEntryResult *response, NSError *error))completionHandler {
    [[self updateDomainEntry:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailUpdateDomainEntryResult *> * _Nonnull task) {
        AWSLightsailUpdateDomainEntryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailUpdateLoadBalancerAttributeResult *> *)updateLoadBalancerAttribute:(AWSLightsailUpdateLoadBalancerAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"UpdateLoadBalancerAttribute"
                   outputClass:[AWSLightsailUpdateLoadBalancerAttributeResult class]];
}

- (void)updateLoadBalancerAttribute:(AWSLightsailUpdateLoadBalancerAttributeRequest *)request
     completionHandler:(void (^)(AWSLightsailUpdateLoadBalancerAttributeResult *response, NSError *error))completionHandler {
    [[self updateLoadBalancerAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailUpdateLoadBalancerAttributeResult *> * _Nonnull task) {
        AWSLightsailUpdateLoadBalancerAttributeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailUpdateRelationalDatabaseResult *> *)updateRelationalDatabase:(AWSLightsailUpdateRelationalDatabaseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"UpdateRelationalDatabase"
                   outputClass:[AWSLightsailUpdateRelationalDatabaseResult class]];
}

- (void)updateRelationalDatabase:(AWSLightsailUpdateRelationalDatabaseRequest *)request
     completionHandler:(void (^)(AWSLightsailUpdateRelationalDatabaseResult *response, NSError *error))completionHandler {
    [[self updateRelationalDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailUpdateRelationalDatabaseResult *> * _Nonnull task) {
        AWSLightsailUpdateRelationalDatabaseResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLightsailUpdateRelationalDatabaseParametersResult *> *)updateRelationalDatabaseParameters:(AWSLightsailUpdateRelationalDatabaseParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Lightsail_20161128"
                 operationName:@"UpdateRelationalDatabaseParameters"
                   outputClass:[AWSLightsailUpdateRelationalDatabaseParametersResult class]];
}

- (void)updateRelationalDatabaseParameters:(AWSLightsailUpdateRelationalDatabaseParametersRequest *)request
     completionHandler:(void (^)(AWSLightsailUpdateRelationalDatabaseParametersResult *response, NSError *error))completionHandler {
    [[self updateRelationalDatabaseParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSLightsailUpdateRelationalDatabaseParametersResult *> * _Nonnull task) {
        AWSLightsailUpdateRelationalDatabaseParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
