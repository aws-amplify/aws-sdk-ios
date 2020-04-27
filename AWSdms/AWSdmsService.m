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

#import "AWSdmsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSdmsResources.h"

static NSString *const AWSInfodms = @"dms";
NSString *const AWSdmsSDKVersion = @"2.13.2";


@interface AWSdmsResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSdmsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedFault" : @(AWSdmsErrorAccessDenied),
                            @"InsufficientResourceCapacityFault" : @(AWSdmsErrorInsufficientResourceCapacity),
                            @"InvalidCertificateFault" : @(AWSdmsErrorInvalidCertificate),
                            @"InvalidResourceStateFault" : @(AWSdmsErrorInvalidResourceState),
                            @"InvalidSubnet" : @(AWSdmsErrorInvalidSubnet),
                            @"KMSAccessDeniedFault" : @(AWSdmsErrorKMSAccessDenied),
                            @"KMSDisabledFault" : @(AWSdmsErrorKMSDisabled),
                            @"KMSInvalidStateFault" : @(AWSdmsErrorKMSInvalidState),
                            @"KMSKeyNotAccessibleFault" : @(AWSdmsErrorKMSKeyNotAccessible),
                            @"KMSNotFoundFault" : @(AWSdmsErrorKMSNotFound),
                            @"KMSThrottlingFault" : @(AWSdmsErrorKMSThrottling),
                            @"ReplicationSubnetGroupDoesNotCoverEnoughAZs" : @(AWSdmsErrorReplicationSubnetGroupDoesNotCoverEnoughAZs),
                            @"ResourceAlreadyExistsFault" : @(AWSdmsErrorResourceAlreadyExists),
                            @"ResourceNotFoundFault" : @(AWSdmsErrorResourceNotFound),
                            @"ResourceQuotaExceededFault" : @(AWSdmsErrorResourceQuotaExceeded),
                            @"SNSInvalidTopicFault" : @(AWSdmsErrorSNSInvalidTopic),
                            @"SNSNoAuthorizationFault" : @(AWSdmsErrorSNSNoAuthorization),
                            @"StorageQuotaExceededFault" : @(AWSdmsErrorStorageQuotaExceeded),
                            @"SubnetAlreadyInUse" : @(AWSdmsErrorSubnetAlreadyInUse),
                            @"UpgradeDependencyFailureFault" : @(AWSdmsErrorUpgradeDependencyFailure),
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
	                *error = [NSError errorWithDomain:AWSdmsErrorDomain
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
        *error = [NSError errorWithDomain:AWSdmsErrorDomain
                                     code:AWSdmsErrorUnknown
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

@interface AWSdmsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSdmsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSdms()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSdms

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSdmsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSdms versions need to match. Check your SDK installation. AWSCore: %@ AWSdms: %@", AWSiOSSDKVersion, AWSdmsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultdms {
    static AWSdms *_defaultdms = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfodms];
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
        _defaultdms = [[AWSdms alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultdms;
}

+ (void)registerdmsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSdms alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)dmsForKey:(NSString *)key {
    @synchronized(self) {
        AWSdms *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfodms
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSdms registerdmsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removedmsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultdms` or `+ dmsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicedms
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicedms];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSdmsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSdmsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSdmsResponseSerializer alloc] initWithJSONDefinition:[[AWSdmsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSdmsAddTagsToResourceResponse *> *)addTagsToResource:(AWSdmsAddTagsToResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"AddTagsToResource"
                   outputClass:[AWSdmsAddTagsToResourceResponse class]];
}

- (void)addTagsToResource:(AWSdmsAddTagsToResourceMessage *)request
     completionHandler:(void (^)(AWSdmsAddTagsToResourceResponse *response, NSError *error))completionHandler {
    [[self addTagsToResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsAddTagsToResourceResponse *> * _Nonnull task) {
        AWSdmsAddTagsToResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsApplyPendingMaintenanceActionResponse *> *)applyPendingMaintenanceAction:(AWSdmsApplyPendingMaintenanceActionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ApplyPendingMaintenanceAction"
                   outputClass:[AWSdmsApplyPendingMaintenanceActionResponse class]];
}

- (void)applyPendingMaintenanceAction:(AWSdmsApplyPendingMaintenanceActionMessage *)request
     completionHandler:(void (^)(AWSdmsApplyPendingMaintenanceActionResponse *response, NSError *error))completionHandler {
    [[self applyPendingMaintenanceAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsApplyPendingMaintenanceActionResponse *> * _Nonnull task) {
        AWSdmsApplyPendingMaintenanceActionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsCreateEndpointResponse *> *)createEndpoint:(AWSdmsCreateEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"CreateEndpoint"
                   outputClass:[AWSdmsCreateEndpointResponse class]];
}

- (void)createEndpoint:(AWSdmsCreateEndpointMessage *)request
     completionHandler:(void (^)(AWSdmsCreateEndpointResponse *response, NSError *error))completionHandler {
    [[self createEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsCreateEndpointResponse *> * _Nonnull task) {
        AWSdmsCreateEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsCreateEventSubscriptionResponse *> *)createEventSubscription:(AWSdmsCreateEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"CreateEventSubscription"
                   outputClass:[AWSdmsCreateEventSubscriptionResponse class]];
}

- (void)createEventSubscription:(AWSdmsCreateEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSdmsCreateEventSubscriptionResponse *response, NSError *error))completionHandler {
    [[self createEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsCreateEventSubscriptionResponse *> * _Nonnull task) {
        AWSdmsCreateEventSubscriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsCreateReplicationInstanceResponse *> *)createReplicationInstance:(AWSdmsCreateReplicationInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"CreateReplicationInstance"
                   outputClass:[AWSdmsCreateReplicationInstanceResponse class]];
}

- (void)createReplicationInstance:(AWSdmsCreateReplicationInstanceMessage *)request
     completionHandler:(void (^)(AWSdmsCreateReplicationInstanceResponse *response, NSError *error))completionHandler {
    [[self createReplicationInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsCreateReplicationInstanceResponse *> * _Nonnull task) {
        AWSdmsCreateReplicationInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsCreateReplicationSubnetGroupResponse *> *)createReplicationSubnetGroup:(AWSdmsCreateReplicationSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"CreateReplicationSubnetGroup"
                   outputClass:[AWSdmsCreateReplicationSubnetGroupResponse class]];
}

- (void)createReplicationSubnetGroup:(AWSdmsCreateReplicationSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSdmsCreateReplicationSubnetGroupResponse *response, NSError *error))completionHandler {
    [[self createReplicationSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsCreateReplicationSubnetGroupResponse *> * _Nonnull task) {
        AWSdmsCreateReplicationSubnetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsCreateReplicationTaskResponse *> *)createReplicationTask:(AWSdmsCreateReplicationTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"CreateReplicationTask"
                   outputClass:[AWSdmsCreateReplicationTaskResponse class]];
}

- (void)createReplicationTask:(AWSdmsCreateReplicationTaskMessage *)request
     completionHandler:(void (^)(AWSdmsCreateReplicationTaskResponse *response, NSError *error))completionHandler {
    [[self createReplicationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsCreateReplicationTaskResponse *> * _Nonnull task) {
        AWSdmsCreateReplicationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDeleteCertificateResponse *> *)deleteCertificate:(AWSdmsDeleteCertificateMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteCertificate"
                   outputClass:[AWSdmsDeleteCertificateResponse class]];
}

- (void)deleteCertificate:(AWSdmsDeleteCertificateMessage *)request
     completionHandler:(void (^)(AWSdmsDeleteCertificateResponse *response, NSError *error))completionHandler {
    [[self deleteCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDeleteCertificateResponse *> * _Nonnull task) {
        AWSdmsDeleteCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDeleteConnectionResponse *> *)deleteConnection:(AWSdmsDeleteConnectionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteConnection"
                   outputClass:[AWSdmsDeleteConnectionResponse class]];
}

- (void)deleteConnection:(AWSdmsDeleteConnectionMessage *)request
     completionHandler:(void (^)(AWSdmsDeleteConnectionResponse *response, NSError *error))completionHandler {
    [[self deleteConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDeleteConnectionResponse *> * _Nonnull task) {
        AWSdmsDeleteConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDeleteEndpointResponse *> *)deleteEndpoint:(AWSdmsDeleteEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteEndpoint"
                   outputClass:[AWSdmsDeleteEndpointResponse class]];
}

- (void)deleteEndpoint:(AWSdmsDeleteEndpointMessage *)request
     completionHandler:(void (^)(AWSdmsDeleteEndpointResponse *response, NSError *error))completionHandler {
    [[self deleteEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDeleteEndpointResponse *> * _Nonnull task) {
        AWSdmsDeleteEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDeleteEventSubscriptionResponse *> *)deleteEventSubscription:(AWSdmsDeleteEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteEventSubscription"
                   outputClass:[AWSdmsDeleteEventSubscriptionResponse class]];
}

- (void)deleteEventSubscription:(AWSdmsDeleteEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSdmsDeleteEventSubscriptionResponse *response, NSError *error))completionHandler {
    [[self deleteEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDeleteEventSubscriptionResponse *> * _Nonnull task) {
        AWSdmsDeleteEventSubscriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDeleteReplicationInstanceResponse *> *)deleteReplicationInstance:(AWSdmsDeleteReplicationInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteReplicationInstance"
                   outputClass:[AWSdmsDeleteReplicationInstanceResponse class]];
}

- (void)deleteReplicationInstance:(AWSdmsDeleteReplicationInstanceMessage *)request
     completionHandler:(void (^)(AWSdmsDeleteReplicationInstanceResponse *response, NSError *error))completionHandler {
    [[self deleteReplicationInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDeleteReplicationInstanceResponse *> * _Nonnull task) {
        AWSdmsDeleteReplicationInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDeleteReplicationSubnetGroupResponse *> *)deleteReplicationSubnetGroup:(AWSdmsDeleteReplicationSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteReplicationSubnetGroup"
                   outputClass:[AWSdmsDeleteReplicationSubnetGroupResponse class]];
}

- (void)deleteReplicationSubnetGroup:(AWSdmsDeleteReplicationSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSdmsDeleteReplicationSubnetGroupResponse *response, NSError *error))completionHandler {
    [[self deleteReplicationSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDeleteReplicationSubnetGroupResponse *> * _Nonnull task) {
        AWSdmsDeleteReplicationSubnetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDeleteReplicationTaskResponse *> *)deleteReplicationTask:(AWSdmsDeleteReplicationTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteReplicationTask"
                   outputClass:[AWSdmsDeleteReplicationTaskResponse class]];
}

- (void)deleteReplicationTask:(AWSdmsDeleteReplicationTaskMessage *)request
     completionHandler:(void (^)(AWSdmsDeleteReplicationTaskResponse *response, NSError *error))completionHandler {
    [[self deleteReplicationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDeleteReplicationTaskResponse *> * _Nonnull task) {
        AWSdmsDeleteReplicationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeAccountAttributesResponse *> *)describeAccountAttributes:(AWSdmsDescribeAccountAttributesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSdmsDescribeAccountAttributesResponse class]];
}

- (void)describeAccountAttributes:(AWSdmsDescribeAccountAttributesMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeAccountAttributesResponse *response, NSError *error))completionHandler {
    [[self describeAccountAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeAccountAttributesResponse *> * _Nonnull task) {
        AWSdmsDescribeAccountAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeCertificatesResponse *> *)describeCertificates:(AWSdmsDescribeCertificatesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeCertificates"
                   outputClass:[AWSdmsDescribeCertificatesResponse class]];
}

- (void)describeCertificates:(AWSdmsDescribeCertificatesMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeCertificatesResponse *response, NSError *error))completionHandler {
    [[self describeCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeCertificatesResponse *> * _Nonnull task) {
        AWSdmsDescribeCertificatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeConnectionsResponse *> *)describeConnections:(AWSdmsDescribeConnectionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeConnections"
                   outputClass:[AWSdmsDescribeConnectionsResponse class]];
}

- (void)describeConnections:(AWSdmsDescribeConnectionsMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeConnectionsResponse *response, NSError *error))completionHandler {
    [[self describeConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeConnectionsResponse *> * _Nonnull task) {
        AWSdmsDescribeConnectionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeEndpointTypesResponse *> *)describeEndpointTypes:(AWSdmsDescribeEndpointTypesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeEndpointTypes"
                   outputClass:[AWSdmsDescribeEndpointTypesResponse class]];
}

- (void)describeEndpointTypes:(AWSdmsDescribeEndpointTypesMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeEndpointTypesResponse *response, NSError *error))completionHandler {
    [[self describeEndpointTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeEndpointTypesResponse *> * _Nonnull task) {
        AWSdmsDescribeEndpointTypesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeEndpointsResponse *> *)describeEndpoints:(AWSdmsDescribeEndpointsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeEndpoints"
                   outputClass:[AWSdmsDescribeEndpointsResponse class]];
}

- (void)describeEndpoints:(AWSdmsDescribeEndpointsMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeEndpointsResponse *response, NSError *error))completionHandler {
    [[self describeEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeEndpointsResponse *> * _Nonnull task) {
        AWSdmsDescribeEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeEventCategoriesResponse *> *)describeEventCategories:(AWSdmsDescribeEventCategoriesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeEventCategories"
                   outputClass:[AWSdmsDescribeEventCategoriesResponse class]];
}

- (void)describeEventCategories:(AWSdmsDescribeEventCategoriesMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeEventCategoriesResponse *response, NSError *error))completionHandler {
    [[self describeEventCategories:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeEventCategoriesResponse *> * _Nonnull task) {
        AWSdmsDescribeEventCategoriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeEventSubscriptionsResponse *> *)describeEventSubscriptions:(AWSdmsDescribeEventSubscriptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeEventSubscriptions"
                   outputClass:[AWSdmsDescribeEventSubscriptionsResponse class]];
}

- (void)describeEventSubscriptions:(AWSdmsDescribeEventSubscriptionsMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeEventSubscriptionsResponse *response, NSError *error))completionHandler {
    [[self describeEventSubscriptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeEventSubscriptionsResponse *> * _Nonnull task) {
        AWSdmsDescribeEventSubscriptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeEventsResponse *> *)describeEvents:(AWSdmsDescribeEventsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeEvents"
                   outputClass:[AWSdmsDescribeEventsResponse class]];
}

- (void)describeEvents:(AWSdmsDescribeEventsMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeEventsResponse *response, NSError *error))completionHandler {
    [[self describeEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeEventsResponse *> * _Nonnull task) {
        AWSdmsDescribeEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeOrderableReplicationInstancesResponse *> *)describeOrderableReplicationInstances:(AWSdmsDescribeOrderableReplicationInstancesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeOrderableReplicationInstances"
                   outputClass:[AWSdmsDescribeOrderableReplicationInstancesResponse class]];
}

- (void)describeOrderableReplicationInstances:(AWSdmsDescribeOrderableReplicationInstancesMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeOrderableReplicationInstancesResponse *response, NSError *error))completionHandler {
    [[self describeOrderableReplicationInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeOrderableReplicationInstancesResponse *> * _Nonnull task) {
        AWSdmsDescribeOrderableReplicationInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribePendingMaintenanceActionsResponse *> *)describePendingMaintenanceActions:(AWSdmsDescribePendingMaintenanceActionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribePendingMaintenanceActions"
                   outputClass:[AWSdmsDescribePendingMaintenanceActionsResponse class]];
}

- (void)describePendingMaintenanceActions:(AWSdmsDescribePendingMaintenanceActionsMessage *)request
     completionHandler:(void (^)(AWSdmsDescribePendingMaintenanceActionsResponse *response, NSError *error))completionHandler {
    [[self describePendingMaintenanceActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribePendingMaintenanceActionsResponse *> * _Nonnull task) {
        AWSdmsDescribePendingMaintenanceActionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeRefreshSchemasStatusResponse *> *)describeRefreshSchemasStatus:(AWSdmsDescribeRefreshSchemasStatusMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeRefreshSchemasStatus"
                   outputClass:[AWSdmsDescribeRefreshSchemasStatusResponse class]];
}

- (void)describeRefreshSchemasStatus:(AWSdmsDescribeRefreshSchemasStatusMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeRefreshSchemasStatusResponse *response, NSError *error))completionHandler {
    [[self describeRefreshSchemasStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeRefreshSchemasStatusResponse *> * _Nonnull task) {
        AWSdmsDescribeRefreshSchemasStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeReplicationInstanceTaskLogsResponse *> *)describeReplicationInstanceTaskLogs:(AWSdmsDescribeReplicationInstanceTaskLogsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeReplicationInstanceTaskLogs"
                   outputClass:[AWSdmsDescribeReplicationInstanceTaskLogsResponse class]];
}

- (void)describeReplicationInstanceTaskLogs:(AWSdmsDescribeReplicationInstanceTaskLogsMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeReplicationInstanceTaskLogsResponse *response, NSError *error))completionHandler {
    [[self describeReplicationInstanceTaskLogs:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeReplicationInstanceTaskLogsResponse *> * _Nonnull task) {
        AWSdmsDescribeReplicationInstanceTaskLogsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeReplicationInstancesResponse *> *)describeReplicationInstances:(AWSdmsDescribeReplicationInstancesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeReplicationInstances"
                   outputClass:[AWSdmsDescribeReplicationInstancesResponse class]];
}

- (void)describeReplicationInstances:(AWSdmsDescribeReplicationInstancesMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeReplicationInstancesResponse *response, NSError *error))completionHandler {
    [[self describeReplicationInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeReplicationInstancesResponse *> * _Nonnull task) {
        AWSdmsDescribeReplicationInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeReplicationSubnetGroupsResponse *> *)describeReplicationSubnetGroups:(AWSdmsDescribeReplicationSubnetGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeReplicationSubnetGroups"
                   outputClass:[AWSdmsDescribeReplicationSubnetGroupsResponse class]];
}

- (void)describeReplicationSubnetGroups:(AWSdmsDescribeReplicationSubnetGroupsMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeReplicationSubnetGroupsResponse *response, NSError *error))completionHandler {
    [[self describeReplicationSubnetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeReplicationSubnetGroupsResponse *> * _Nonnull task) {
        AWSdmsDescribeReplicationSubnetGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeReplicationTaskAssessmentResultsResponse *> *)describeReplicationTaskAssessmentResults:(AWSdmsDescribeReplicationTaskAssessmentResultsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeReplicationTaskAssessmentResults"
                   outputClass:[AWSdmsDescribeReplicationTaskAssessmentResultsResponse class]];
}

- (void)describeReplicationTaskAssessmentResults:(AWSdmsDescribeReplicationTaskAssessmentResultsMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeReplicationTaskAssessmentResultsResponse *response, NSError *error))completionHandler {
    [[self describeReplicationTaskAssessmentResults:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeReplicationTaskAssessmentResultsResponse *> * _Nonnull task) {
        AWSdmsDescribeReplicationTaskAssessmentResultsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeReplicationTasksResponse *> *)describeReplicationTasks:(AWSdmsDescribeReplicationTasksMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeReplicationTasks"
                   outputClass:[AWSdmsDescribeReplicationTasksResponse class]];
}

- (void)describeReplicationTasks:(AWSdmsDescribeReplicationTasksMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeReplicationTasksResponse *response, NSError *error))completionHandler {
    [[self describeReplicationTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeReplicationTasksResponse *> * _Nonnull task) {
        AWSdmsDescribeReplicationTasksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeSchemasResponse *> *)describeSchemas:(AWSdmsDescribeSchemasMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeSchemas"
                   outputClass:[AWSdmsDescribeSchemasResponse class]];
}

- (void)describeSchemas:(AWSdmsDescribeSchemasMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeSchemasResponse *response, NSError *error))completionHandler {
    [[self describeSchemas:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeSchemasResponse *> * _Nonnull task) {
        AWSdmsDescribeSchemasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsDescribeTableStatisticsResponse *> *)describeTableStatistics:(AWSdmsDescribeTableStatisticsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeTableStatistics"
                   outputClass:[AWSdmsDescribeTableStatisticsResponse class]];
}

- (void)describeTableStatistics:(AWSdmsDescribeTableStatisticsMessage *)request
     completionHandler:(void (^)(AWSdmsDescribeTableStatisticsResponse *response, NSError *error))completionHandler {
    [[self describeTableStatistics:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsDescribeTableStatisticsResponse *> * _Nonnull task) {
        AWSdmsDescribeTableStatisticsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsImportCertificateResponse *> *)importCertificate:(AWSdmsImportCertificateMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ImportCertificate"
                   outputClass:[AWSdmsImportCertificateResponse class]];
}

- (void)importCertificate:(AWSdmsImportCertificateMessage *)request
     completionHandler:(void (^)(AWSdmsImportCertificateResponse *response, NSError *error))completionHandler {
    [[self importCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsImportCertificateResponse *> * _Nonnull task) {
        AWSdmsImportCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsListTagsForResourceResponse *> *)listTagsForResource:(AWSdmsListTagsForResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSdmsListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSdmsListTagsForResourceMessage *)request
     completionHandler:(void (^)(AWSdmsListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsListTagsForResourceResponse *> * _Nonnull task) {
        AWSdmsListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsModifyEndpointResponse *> *)modifyEndpoint:(AWSdmsModifyEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ModifyEndpoint"
                   outputClass:[AWSdmsModifyEndpointResponse class]];
}

- (void)modifyEndpoint:(AWSdmsModifyEndpointMessage *)request
     completionHandler:(void (^)(AWSdmsModifyEndpointResponse *response, NSError *error))completionHandler {
    [[self modifyEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsModifyEndpointResponse *> * _Nonnull task) {
        AWSdmsModifyEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsModifyEventSubscriptionResponse *> *)modifyEventSubscription:(AWSdmsModifyEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ModifyEventSubscription"
                   outputClass:[AWSdmsModifyEventSubscriptionResponse class]];
}

- (void)modifyEventSubscription:(AWSdmsModifyEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSdmsModifyEventSubscriptionResponse *response, NSError *error))completionHandler {
    [[self modifyEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsModifyEventSubscriptionResponse *> * _Nonnull task) {
        AWSdmsModifyEventSubscriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsModifyReplicationInstanceResponse *> *)modifyReplicationInstance:(AWSdmsModifyReplicationInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ModifyReplicationInstance"
                   outputClass:[AWSdmsModifyReplicationInstanceResponse class]];
}

- (void)modifyReplicationInstance:(AWSdmsModifyReplicationInstanceMessage *)request
     completionHandler:(void (^)(AWSdmsModifyReplicationInstanceResponse *response, NSError *error))completionHandler {
    [[self modifyReplicationInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsModifyReplicationInstanceResponse *> * _Nonnull task) {
        AWSdmsModifyReplicationInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsModifyReplicationSubnetGroupResponse *> *)modifyReplicationSubnetGroup:(AWSdmsModifyReplicationSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ModifyReplicationSubnetGroup"
                   outputClass:[AWSdmsModifyReplicationSubnetGroupResponse class]];
}

- (void)modifyReplicationSubnetGroup:(AWSdmsModifyReplicationSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSdmsModifyReplicationSubnetGroupResponse *response, NSError *error))completionHandler {
    [[self modifyReplicationSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsModifyReplicationSubnetGroupResponse *> * _Nonnull task) {
        AWSdmsModifyReplicationSubnetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsModifyReplicationTaskResponse *> *)modifyReplicationTask:(AWSdmsModifyReplicationTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ModifyReplicationTask"
                   outputClass:[AWSdmsModifyReplicationTaskResponse class]];
}

- (void)modifyReplicationTask:(AWSdmsModifyReplicationTaskMessage *)request
     completionHandler:(void (^)(AWSdmsModifyReplicationTaskResponse *response, NSError *error))completionHandler {
    [[self modifyReplicationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsModifyReplicationTaskResponse *> * _Nonnull task) {
        AWSdmsModifyReplicationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsRebootReplicationInstanceResponse *> *)rebootReplicationInstance:(AWSdmsRebootReplicationInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"RebootReplicationInstance"
                   outputClass:[AWSdmsRebootReplicationInstanceResponse class]];
}

- (void)rebootReplicationInstance:(AWSdmsRebootReplicationInstanceMessage *)request
     completionHandler:(void (^)(AWSdmsRebootReplicationInstanceResponse *response, NSError *error))completionHandler {
    [[self rebootReplicationInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsRebootReplicationInstanceResponse *> * _Nonnull task) {
        AWSdmsRebootReplicationInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsRefreshSchemasResponse *> *)refreshSchemas:(AWSdmsRefreshSchemasMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"RefreshSchemas"
                   outputClass:[AWSdmsRefreshSchemasResponse class]];
}

- (void)refreshSchemas:(AWSdmsRefreshSchemasMessage *)request
     completionHandler:(void (^)(AWSdmsRefreshSchemasResponse *response, NSError *error))completionHandler {
    [[self refreshSchemas:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsRefreshSchemasResponse *> * _Nonnull task) {
        AWSdmsRefreshSchemasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsReloadTablesResponse *> *)reloadTables:(AWSdmsReloadTablesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ReloadTables"
                   outputClass:[AWSdmsReloadTablesResponse class]];
}

- (void)reloadTables:(AWSdmsReloadTablesMessage *)request
     completionHandler:(void (^)(AWSdmsReloadTablesResponse *response, NSError *error))completionHandler {
    [[self reloadTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsReloadTablesResponse *> * _Nonnull task) {
        AWSdmsReloadTablesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsRemoveTagsFromResourceResponse *> *)removeTagsFromResource:(AWSdmsRemoveTagsFromResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"RemoveTagsFromResource"
                   outputClass:[AWSdmsRemoveTagsFromResourceResponse class]];
}

- (void)removeTagsFromResource:(AWSdmsRemoveTagsFromResourceMessage *)request
     completionHandler:(void (^)(AWSdmsRemoveTagsFromResourceResponse *response, NSError *error))completionHandler {
    [[self removeTagsFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsRemoveTagsFromResourceResponse *> * _Nonnull task) {
        AWSdmsRemoveTagsFromResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsStartReplicationTaskResponse *> *)startReplicationTask:(AWSdmsStartReplicationTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"StartReplicationTask"
                   outputClass:[AWSdmsStartReplicationTaskResponse class]];
}

- (void)startReplicationTask:(AWSdmsStartReplicationTaskMessage *)request
     completionHandler:(void (^)(AWSdmsStartReplicationTaskResponse *response, NSError *error))completionHandler {
    [[self startReplicationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsStartReplicationTaskResponse *> * _Nonnull task) {
        AWSdmsStartReplicationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsStartReplicationTaskAssessmentResponse *> *)startReplicationTaskAssessment:(AWSdmsStartReplicationTaskAssessmentMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"StartReplicationTaskAssessment"
                   outputClass:[AWSdmsStartReplicationTaskAssessmentResponse class]];
}

- (void)startReplicationTaskAssessment:(AWSdmsStartReplicationTaskAssessmentMessage *)request
     completionHandler:(void (^)(AWSdmsStartReplicationTaskAssessmentResponse *response, NSError *error))completionHandler {
    [[self startReplicationTaskAssessment:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsStartReplicationTaskAssessmentResponse *> * _Nonnull task) {
        AWSdmsStartReplicationTaskAssessmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsStopReplicationTaskResponse *> *)stopReplicationTask:(AWSdmsStopReplicationTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"StopReplicationTask"
                   outputClass:[AWSdmsStopReplicationTaskResponse class]];
}

- (void)stopReplicationTask:(AWSdmsStopReplicationTaskMessage *)request
     completionHandler:(void (^)(AWSdmsStopReplicationTaskResponse *response, NSError *error))completionHandler {
    [[self stopReplicationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsStopReplicationTaskResponse *> * _Nonnull task) {
        AWSdmsStopReplicationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSdmsTestConnectionResponse *> *)testConnection:(AWSdmsTestConnectionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"TestConnection"
                   outputClass:[AWSdmsTestConnectionResponse class]];
}

- (void)testConnection:(AWSdmsTestConnectionMessage *)request
     completionHandler:(void (^)(AWSdmsTestConnectionResponse *response, NSError *error))completionHandler {
    [[self testConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSdmsTestConnectionResponse *> * _Nonnull task) {
        AWSdmsTestConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
