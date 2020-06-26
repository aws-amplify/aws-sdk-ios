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

#import "AWSDatabasemigrationserviceService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSDatabasemigrationserviceResources.h"

static NSString *const AWSInfoDatabasemigrationservice = @"Databasemigrationservice";
NSString *const AWSDatabasemigrationserviceSDKVersion = @"2.13.5";


@interface AWSDatabasemigrationserviceResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSDatabasemigrationserviceResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedFault" : @(AWSDatabasemigrationserviceErrorAccessDenied),
                            @"InsufficientResourceCapacityFault" : @(AWSDatabasemigrationserviceErrorInsufficientResourceCapacity),
                            @"InvalidCertificateFault" : @(AWSDatabasemigrationserviceErrorInvalidCertificate),
                            @"InvalidResourceStateFault" : @(AWSDatabasemigrationserviceErrorInvalidResourceState),
                            @"InvalidSubnet" : @(AWSDatabasemigrationserviceErrorInvalidSubnet),
                            @"KMSAccessDeniedFault" : @(AWSDatabasemigrationserviceErrorKMSAccessDenied),
                            @"KMSDisabledFault" : @(AWSDatabasemigrationserviceErrorKMSDisabled),
                            @"KMSInvalidStateFault" : @(AWSDatabasemigrationserviceErrorKMSInvalidState),
                            @"KMSKeyNotAccessibleFault" : @(AWSDatabasemigrationserviceErrorKMSKeyNotAccessible),
                            @"KMSNotFoundFault" : @(AWSDatabasemigrationserviceErrorKMSNotFound),
                            @"KMSThrottlingFault" : @(AWSDatabasemigrationserviceErrorKMSThrottling),
                            @"ReplicationSubnetGroupDoesNotCoverEnoughAZs" : @(AWSDatabasemigrationserviceErrorReplicationSubnetGroupDoesNotCoverEnoughAZs),
                            @"ResourceAlreadyExistsFault" : @(AWSDatabasemigrationserviceErrorResourceAlreadyExists),
                            @"ResourceNotFoundFault" : @(AWSDatabasemigrationserviceErrorResourceNotFound),
                            @"ResourceQuotaExceededFault" : @(AWSDatabasemigrationserviceErrorResourceQuotaExceeded),
                            @"SNSInvalidTopicFault" : @(AWSDatabasemigrationserviceErrorSNSInvalidTopic),
                            @"SNSNoAuthorizationFault" : @(AWSDatabasemigrationserviceErrorSNSNoAuthorization),
                            @"StorageQuotaExceededFault" : @(AWSDatabasemigrationserviceErrorStorageQuotaExceeded),
                            @"SubnetAlreadyInUse" : @(AWSDatabasemigrationserviceErrorSubnetAlreadyInUse),
                            @"UpgradeDependencyFailureFault" : @(AWSDatabasemigrationserviceErrorUpgradeDependencyFailure),
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
	                *error = [NSError errorWithDomain:AWSDatabasemigrationserviceErrorDomain
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
        *error = [NSError errorWithDomain:AWSDatabasemigrationserviceErrorDomain
                                     code:AWSDatabasemigrationserviceErrorUnknown
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

@interface AWSDatabasemigrationserviceRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSDatabasemigrationserviceRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSDatabasemigrationservice()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSDatabasemigrationservice

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSDatabasemigrationserviceSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSDatabasemigrationservice versions need to match. Check your SDK installation. AWSCore: %@ AWSDatabasemigrationservice: %@", AWSiOSSDKVersion, AWSDatabasemigrationserviceSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultDatabasemigrationservice {
    static AWSDatabasemigrationservice *_defaultDatabasemigrationservice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoDatabasemigrationservice];
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
        _defaultDatabasemigrationservice = [[AWSDatabasemigrationservice alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultDatabasemigrationservice;
}

+ (void)registerDatabasemigrationserviceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSDatabasemigrationservice alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)DatabasemigrationserviceForKey:(NSString *)key {
    @synchronized(self) {
        AWSDatabasemigrationservice *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoDatabasemigrationservice
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSDatabasemigrationservice registerDatabasemigrationserviceWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeDatabasemigrationserviceForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultDatabasemigrationservice` or `+ DatabasemigrationserviceForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceDatabasemigrationservice
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceDatabasemigrationservice];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSDatabasemigrationserviceRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSDatabasemigrationserviceResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSDatabasemigrationserviceResponseSerializer alloc] initWithJSONDefinition:[[AWSDatabasemigrationserviceResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSDatabasemigrationserviceAddTagsToResourceResponse *> *)addTagsToResource:(AWSDatabasemigrationserviceAddTagsToResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"AddTagsToResource"
                   outputClass:[AWSDatabasemigrationserviceAddTagsToResourceResponse class]];
}

- (void)addTagsToResource:(AWSDatabasemigrationserviceAddTagsToResourceMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceAddTagsToResourceResponse *response, NSError *error))completionHandler {
    [[self addTagsToResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceAddTagsToResourceResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceAddTagsToResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse *> *)applyPendingMaintenanceAction:(AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ApplyPendingMaintenanceAction"
                   outputClass:[AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse class]];
}

- (void)applyPendingMaintenanceAction:(AWSDatabasemigrationserviceApplyPendingMaintenanceActionMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse *response, NSError *error))completionHandler {
    [[self applyPendingMaintenanceAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceApplyPendingMaintenanceActionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceCreateEndpointResponse *> *)createEndpoint:(AWSDatabasemigrationserviceCreateEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"CreateEndpoint"
                   outputClass:[AWSDatabasemigrationserviceCreateEndpointResponse class]];
}

- (void)createEndpoint:(AWSDatabasemigrationserviceCreateEndpointMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceCreateEndpointResponse *response, NSError *error))completionHandler {
    [[self createEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceCreateEndpointResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceCreateEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceCreateEventSubscriptionResponse *> *)createEventSubscription:(AWSDatabasemigrationserviceCreateEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"CreateEventSubscription"
                   outputClass:[AWSDatabasemigrationserviceCreateEventSubscriptionResponse class]];
}

- (void)createEventSubscription:(AWSDatabasemigrationserviceCreateEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceCreateEventSubscriptionResponse *response, NSError *error))completionHandler {
    [[self createEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceCreateEventSubscriptionResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceCreateEventSubscriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceCreateReplicationInstanceResponse *> *)createReplicationInstance:(AWSDatabasemigrationserviceCreateReplicationInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"CreateReplicationInstance"
                   outputClass:[AWSDatabasemigrationserviceCreateReplicationInstanceResponse class]];
}

- (void)createReplicationInstance:(AWSDatabasemigrationserviceCreateReplicationInstanceMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceCreateReplicationInstanceResponse *response, NSError *error))completionHandler {
    [[self createReplicationInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceCreateReplicationInstanceResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceCreateReplicationInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse *> *)createReplicationSubnetGroup:(AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"CreateReplicationSubnetGroup"
                   outputClass:[AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse class]];
}

- (void)createReplicationSubnetGroup:(AWSDatabasemigrationserviceCreateReplicationSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse *response, NSError *error))completionHandler {
    [[self createReplicationSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceCreateReplicationSubnetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceCreateReplicationTaskResponse *> *)createReplicationTask:(AWSDatabasemigrationserviceCreateReplicationTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"CreateReplicationTask"
                   outputClass:[AWSDatabasemigrationserviceCreateReplicationTaskResponse class]];
}

- (void)createReplicationTask:(AWSDatabasemigrationserviceCreateReplicationTaskMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceCreateReplicationTaskResponse *response, NSError *error))completionHandler {
    [[self createReplicationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceCreateReplicationTaskResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceCreateReplicationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDeleteCertificateResponse *> *)deleteCertificate:(AWSDatabasemigrationserviceDeleteCertificateMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteCertificate"
                   outputClass:[AWSDatabasemigrationserviceDeleteCertificateResponse class]];
}

- (void)deleteCertificate:(AWSDatabasemigrationserviceDeleteCertificateMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDeleteCertificateResponse *response, NSError *error))completionHandler {
    [[self deleteCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDeleteCertificateResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDeleteCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDeleteConnectionResponse *> *)deleteConnection:(AWSDatabasemigrationserviceDeleteConnectionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteConnection"
                   outputClass:[AWSDatabasemigrationserviceDeleteConnectionResponse class]];
}

- (void)deleteConnection:(AWSDatabasemigrationserviceDeleteConnectionMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDeleteConnectionResponse *response, NSError *error))completionHandler {
    [[self deleteConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDeleteConnectionResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDeleteConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDeleteEndpointResponse *> *)deleteEndpoint:(AWSDatabasemigrationserviceDeleteEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteEndpoint"
                   outputClass:[AWSDatabasemigrationserviceDeleteEndpointResponse class]];
}

- (void)deleteEndpoint:(AWSDatabasemigrationserviceDeleteEndpointMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDeleteEndpointResponse *response, NSError *error))completionHandler {
    [[self deleteEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDeleteEndpointResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDeleteEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDeleteEventSubscriptionResponse *> *)deleteEventSubscription:(AWSDatabasemigrationserviceDeleteEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteEventSubscription"
                   outputClass:[AWSDatabasemigrationserviceDeleteEventSubscriptionResponse class]];
}

- (void)deleteEventSubscription:(AWSDatabasemigrationserviceDeleteEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDeleteEventSubscriptionResponse *response, NSError *error))completionHandler {
    [[self deleteEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDeleteEventSubscriptionResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDeleteEventSubscriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDeleteReplicationInstanceResponse *> *)deleteReplicationInstance:(AWSDatabasemigrationserviceDeleteReplicationInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteReplicationInstance"
                   outputClass:[AWSDatabasemigrationserviceDeleteReplicationInstanceResponse class]];
}

- (void)deleteReplicationInstance:(AWSDatabasemigrationserviceDeleteReplicationInstanceMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDeleteReplicationInstanceResponse *response, NSError *error))completionHandler {
    [[self deleteReplicationInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDeleteReplicationInstanceResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDeleteReplicationInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse *> *)deleteReplicationSubnetGroup:(AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteReplicationSubnetGroup"
                   outputClass:[AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse class]];
}

- (void)deleteReplicationSubnetGroup:(AWSDatabasemigrationserviceDeleteReplicationSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse *response, NSError *error))completionHandler {
    [[self deleteReplicationSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDeleteReplicationSubnetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDeleteReplicationTaskResponse *> *)deleteReplicationTask:(AWSDatabasemigrationserviceDeleteReplicationTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DeleteReplicationTask"
                   outputClass:[AWSDatabasemigrationserviceDeleteReplicationTaskResponse class]];
}

- (void)deleteReplicationTask:(AWSDatabasemigrationserviceDeleteReplicationTaskMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDeleteReplicationTaskResponse *response, NSError *error))completionHandler {
    [[self deleteReplicationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDeleteReplicationTaskResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDeleteReplicationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeAccountAttributesResponse *> *)describeAccountAttributes:(AWSDatabasemigrationserviceDescribeAccountAttributesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSDatabasemigrationserviceDescribeAccountAttributesResponse class]];
}

- (void)describeAccountAttributes:(AWSDatabasemigrationserviceDescribeAccountAttributesMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeAccountAttributesResponse *response, NSError *error))completionHandler {
    [[self describeAccountAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeAccountAttributesResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeAccountAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeCertificatesResponse *> *)describeCertificates:(AWSDatabasemigrationserviceDescribeCertificatesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeCertificates"
                   outputClass:[AWSDatabasemigrationserviceDescribeCertificatesResponse class]];
}

- (void)describeCertificates:(AWSDatabasemigrationserviceDescribeCertificatesMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeCertificatesResponse *response, NSError *error))completionHandler {
    [[self describeCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeCertificatesResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeCertificatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeConnectionsResponse *> *)describeConnections:(AWSDatabasemigrationserviceDescribeConnectionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeConnections"
                   outputClass:[AWSDatabasemigrationserviceDescribeConnectionsResponse class]];
}

- (void)describeConnections:(AWSDatabasemigrationserviceDescribeConnectionsMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeConnectionsResponse *response, NSError *error))completionHandler {
    [[self describeConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeConnectionsResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeConnectionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeEndpointTypesResponse *> *)describeEndpointTypes:(AWSDatabasemigrationserviceDescribeEndpointTypesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeEndpointTypes"
                   outputClass:[AWSDatabasemigrationserviceDescribeEndpointTypesResponse class]];
}

- (void)describeEndpointTypes:(AWSDatabasemigrationserviceDescribeEndpointTypesMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeEndpointTypesResponse *response, NSError *error))completionHandler {
    [[self describeEndpointTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeEndpointTypesResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeEndpointTypesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeEndpointsResponse *> *)describeEndpoints:(AWSDatabasemigrationserviceDescribeEndpointsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeEndpoints"
                   outputClass:[AWSDatabasemigrationserviceDescribeEndpointsResponse class]];
}

- (void)describeEndpoints:(AWSDatabasemigrationserviceDescribeEndpointsMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeEndpointsResponse *response, NSError *error))completionHandler {
    [[self describeEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeEndpointsResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeEventCategoriesResponse *> *)describeEventCategories:(AWSDatabasemigrationserviceDescribeEventCategoriesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeEventCategories"
                   outputClass:[AWSDatabasemigrationserviceDescribeEventCategoriesResponse class]];
}

- (void)describeEventCategories:(AWSDatabasemigrationserviceDescribeEventCategoriesMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeEventCategoriesResponse *response, NSError *error))completionHandler {
    [[self describeEventCategories:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeEventCategoriesResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeEventCategoriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse *> *)describeEventSubscriptions:(AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeEventSubscriptions"
                   outputClass:[AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse class]];
}

- (void)describeEventSubscriptions:(AWSDatabasemigrationserviceDescribeEventSubscriptionsMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse *response, NSError *error))completionHandler {
    [[self describeEventSubscriptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeEventSubscriptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeEventsResponse *> *)describeEvents:(AWSDatabasemigrationserviceDescribeEventsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeEvents"
                   outputClass:[AWSDatabasemigrationserviceDescribeEventsResponse class]];
}

- (void)describeEvents:(AWSDatabasemigrationserviceDescribeEventsMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeEventsResponse *response, NSError *error))completionHandler {
    [[self describeEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeEventsResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse *> *)describeOrderableReplicationInstances:(AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeOrderableReplicationInstances"
                   outputClass:[AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse class]];
}

- (void)describeOrderableReplicationInstances:(AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse *response, NSError *error))completionHandler {
    [[self describeOrderableReplicationInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeOrderableReplicationInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse *> *)describePendingMaintenanceActions:(AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribePendingMaintenanceActions"
                   outputClass:[AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse class]];
}

- (void)describePendingMaintenanceActions:(AWSDatabasemigrationserviceDescribePendingMaintenanceActionsMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse *response, NSError *error))completionHandler {
    [[self describePendingMaintenanceActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribePendingMaintenanceActionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse *> *)describeRefreshSchemasStatus:(AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeRefreshSchemasStatus"
                   outputClass:[AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse class]];
}

- (void)describeRefreshSchemasStatus:(AWSDatabasemigrationserviceDescribeRefreshSchemasStatusMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse *response, NSError *error))completionHandler {
    [[self describeRefreshSchemasStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeRefreshSchemasStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse *> *)describeReplicationInstanceTaskLogs:(AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeReplicationInstanceTaskLogs"
                   outputClass:[AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse class]];
}

- (void)describeReplicationInstanceTaskLogs:(AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse *response, NSError *error))completionHandler {
    [[self describeReplicationInstanceTaskLogs:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeReplicationInstanceTaskLogsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeReplicationInstancesResponse *> *)describeReplicationInstances:(AWSDatabasemigrationserviceDescribeReplicationInstancesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeReplicationInstances"
                   outputClass:[AWSDatabasemigrationserviceDescribeReplicationInstancesResponse class]];
}

- (void)describeReplicationInstances:(AWSDatabasemigrationserviceDescribeReplicationInstancesMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeReplicationInstancesResponse *response, NSError *error))completionHandler {
    [[self describeReplicationInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeReplicationInstancesResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeReplicationInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse *> *)describeReplicationSubnetGroups:(AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeReplicationSubnetGroups"
                   outputClass:[AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse class]];
}

- (void)describeReplicationSubnetGroups:(AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse *response, NSError *error))completionHandler {
    [[self describeReplicationSubnetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeReplicationSubnetGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse *> *)describeReplicationTaskAssessmentResults:(AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeReplicationTaskAssessmentResults"
                   outputClass:[AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse class]];
}

- (void)describeReplicationTaskAssessmentResults:(AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse *response, NSError *error))completionHandler {
    [[self describeReplicationTaskAssessmentResults:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeReplicationTaskAssessmentResultsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeReplicationTasksResponse *> *)describeReplicationTasks:(AWSDatabasemigrationserviceDescribeReplicationTasksMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeReplicationTasks"
                   outputClass:[AWSDatabasemigrationserviceDescribeReplicationTasksResponse class]];
}

- (void)describeReplicationTasks:(AWSDatabasemigrationserviceDescribeReplicationTasksMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeReplicationTasksResponse *response, NSError *error))completionHandler {
    [[self describeReplicationTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeReplicationTasksResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeReplicationTasksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeSchemasResponse *> *)describeSchemas:(AWSDatabasemigrationserviceDescribeSchemasMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeSchemas"
                   outputClass:[AWSDatabasemigrationserviceDescribeSchemasResponse class]];
}

- (void)describeSchemas:(AWSDatabasemigrationserviceDescribeSchemasMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeSchemasResponse *response, NSError *error))completionHandler {
    [[self describeSchemas:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeSchemasResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeSchemasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceDescribeTableStatisticsResponse *> *)describeTableStatistics:(AWSDatabasemigrationserviceDescribeTableStatisticsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"DescribeTableStatistics"
                   outputClass:[AWSDatabasemigrationserviceDescribeTableStatisticsResponse class]];
}

- (void)describeTableStatistics:(AWSDatabasemigrationserviceDescribeTableStatisticsMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceDescribeTableStatisticsResponse *response, NSError *error))completionHandler {
    [[self describeTableStatistics:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceDescribeTableStatisticsResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceDescribeTableStatisticsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceImportCertificateResponse *> *)importCertificate:(AWSDatabasemigrationserviceImportCertificateMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ImportCertificate"
                   outputClass:[AWSDatabasemigrationserviceImportCertificateResponse class]];
}

- (void)importCertificate:(AWSDatabasemigrationserviceImportCertificateMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceImportCertificateResponse *response, NSError *error))completionHandler {
    [[self importCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceImportCertificateResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceImportCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceListTagsForResourceResponse *> *)listTagsForResource:(AWSDatabasemigrationserviceListTagsForResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSDatabasemigrationserviceListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSDatabasemigrationserviceListTagsForResourceMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceListTagsForResourceResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceModifyEndpointResponse *> *)modifyEndpoint:(AWSDatabasemigrationserviceModifyEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ModifyEndpoint"
                   outputClass:[AWSDatabasemigrationserviceModifyEndpointResponse class]];
}

- (void)modifyEndpoint:(AWSDatabasemigrationserviceModifyEndpointMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceModifyEndpointResponse *response, NSError *error))completionHandler {
    [[self modifyEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceModifyEndpointResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceModifyEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceModifyEventSubscriptionResponse *> *)modifyEventSubscription:(AWSDatabasemigrationserviceModifyEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ModifyEventSubscription"
                   outputClass:[AWSDatabasemigrationserviceModifyEventSubscriptionResponse class]];
}

- (void)modifyEventSubscription:(AWSDatabasemigrationserviceModifyEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceModifyEventSubscriptionResponse *response, NSError *error))completionHandler {
    [[self modifyEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceModifyEventSubscriptionResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceModifyEventSubscriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceModifyReplicationInstanceResponse *> *)modifyReplicationInstance:(AWSDatabasemigrationserviceModifyReplicationInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ModifyReplicationInstance"
                   outputClass:[AWSDatabasemigrationserviceModifyReplicationInstanceResponse class]];
}

- (void)modifyReplicationInstance:(AWSDatabasemigrationserviceModifyReplicationInstanceMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceModifyReplicationInstanceResponse *response, NSError *error))completionHandler {
    [[self modifyReplicationInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceModifyReplicationInstanceResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceModifyReplicationInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse *> *)modifyReplicationSubnetGroup:(AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ModifyReplicationSubnetGroup"
                   outputClass:[AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse class]];
}

- (void)modifyReplicationSubnetGroup:(AWSDatabasemigrationserviceModifyReplicationSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse *response, NSError *error))completionHandler {
    [[self modifyReplicationSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceModifyReplicationSubnetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceModifyReplicationTaskResponse *> *)modifyReplicationTask:(AWSDatabasemigrationserviceModifyReplicationTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ModifyReplicationTask"
                   outputClass:[AWSDatabasemigrationserviceModifyReplicationTaskResponse class]];
}

- (void)modifyReplicationTask:(AWSDatabasemigrationserviceModifyReplicationTaskMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceModifyReplicationTaskResponse *response, NSError *error))completionHandler {
    [[self modifyReplicationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceModifyReplicationTaskResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceModifyReplicationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceRebootReplicationInstanceResponse *> *)rebootReplicationInstance:(AWSDatabasemigrationserviceRebootReplicationInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"RebootReplicationInstance"
                   outputClass:[AWSDatabasemigrationserviceRebootReplicationInstanceResponse class]];
}

- (void)rebootReplicationInstance:(AWSDatabasemigrationserviceRebootReplicationInstanceMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceRebootReplicationInstanceResponse *response, NSError *error))completionHandler {
    [[self rebootReplicationInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceRebootReplicationInstanceResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceRebootReplicationInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceRefreshSchemasResponse *> *)refreshSchemas:(AWSDatabasemigrationserviceRefreshSchemasMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"RefreshSchemas"
                   outputClass:[AWSDatabasemigrationserviceRefreshSchemasResponse class]];
}

- (void)refreshSchemas:(AWSDatabasemigrationserviceRefreshSchemasMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceRefreshSchemasResponse *response, NSError *error))completionHandler {
    [[self refreshSchemas:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceRefreshSchemasResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceRefreshSchemasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceReloadTablesResponse *> *)reloadTables:(AWSDatabasemigrationserviceReloadTablesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"ReloadTables"
                   outputClass:[AWSDatabasemigrationserviceReloadTablesResponse class]];
}

- (void)reloadTables:(AWSDatabasemigrationserviceReloadTablesMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceReloadTablesResponse *response, NSError *error))completionHandler {
    [[self reloadTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceReloadTablesResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceReloadTablesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceRemoveTagsFromResourceResponse *> *)removeTagsFromResource:(AWSDatabasemigrationserviceRemoveTagsFromResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"RemoveTagsFromResource"
                   outputClass:[AWSDatabasemigrationserviceRemoveTagsFromResourceResponse class]];
}

- (void)removeTagsFromResource:(AWSDatabasemigrationserviceRemoveTagsFromResourceMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceRemoveTagsFromResourceResponse *response, NSError *error))completionHandler {
    [[self removeTagsFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceRemoveTagsFromResourceResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceRemoveTagsFromResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceStartReplicationTaskResponse *> *)startReplicationTask:(AWSDatabasemigrationserviceStartReplicationTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"StartReplicationTask"
                   outputClass:[AWSDatabasemigrationserviceStartReplicationTaskResponse class]];
}

- (void)startReplicationTask:(AWSDatabasemigrationserviceStartReplicationTaskMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceStartReplicationTaskResponse *response, NSError *error))completionHandler {
    [[self startReplicationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceStartReplicationTaskResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceStartReplicationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse *> *)startReplicationTaskAssessment:(AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"StartReplicationTaskAssessment"
                   outputClass:[AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse class]];
}

- (void)startReplicationTaskAssessment:(AWSDatabasemigrationserviceStartReplicationTaskAssessmentMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse *response, NSError *error))completionHandler {
    [[self startReplicationTaskAssessment:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceStartReplicationTaskAssessmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceStopReplicationTaskResponse *> *)stopReplicationTask:(AWSDatabasemigrationserviceStopReplicationTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"StopReplicationTask"
                   outputClass:[AWSDatabasemigrationserviceStopReplicationTaskResponse class]];
}

- (void)stopReplicationTask:(AWSDatabasemigrationserviceStopReplicationTaskMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceStopReplicationTaskResponse *response, NSError *error))completionHandler {
    [[self stopReplicationTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceStopReplicationTaskResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceStopReplicationTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDatabasemigrationserviceTestConnectionResponse *> *)testConnection:(AWSDatabasemigrationserviceTestConnectionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonDMSv20160101"
                 operationName:@"TestConnection"
                   outputClass:[AWSDatabasemigrationserviceTestConnectionResponse class]];
}

- (void)testConnection:(AWSDatabasemigrationserviceTestConnectionMessage *)request
     completionHandler:(void (^)(AWSDatabasemigrationserviceTestConnectionResponse *response, NSError *error))completionHandler {
    [[self testConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSDatabasemigrationserviceTestConnectionResponse *> * _Nonnull task) {
        AWSDatabasemigrationserviceTestConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
