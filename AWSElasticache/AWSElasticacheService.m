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

#import "AWSElasticacheService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSElasticacheResources.h"

static NSString *const AWSInfoElasticache = @"Elasticache";
NSString *const AWSElasticacheSDKVersion = @"2.13.4";


@interface AWSElasticacheResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSElasticacheResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"APICallRateForCustomerExceeded" : @(AWSElasticacheErrorAPICallRateForCustomerExceeded),
                            @"AuthorizationAlreadyExists" : @(AWSElasticacheErrorAuthorizationAlreadyExists),
                            @"AuthorizationNotFound" : @(AWSElasticacheErrorAuthorizationNotFound),
                            @"CacheClusterAlreadyExists" : @(AWSElasticacheErrorCacheClusterAlreadyExists),
                            @"CacheClusterNotFound" : @(AWSElasticacheErrorCacheClusterNotFound),
                            @"CacheParameterGroupAlreadyExists" : @(AWSElasticacheErrorCacheParameterGroupAlreadyExists),
                            @"CacheParameterGroupNotFound" : @(AWSElasticacheErrorCacheParameterGroupNotFound),
                            @"CacheParameterGroupQuotaExceeded" : @(AWSElasticacheErrorCacheParameterGroupQuotaExceeded),
                            @"CacheSecurityGroupAlreadyExists" : @(AWSElasticacheErrorCacheSecurityGroupAlreadyExists),
                            @"CacheSecurityGroupNotFound" : @(AWSElasticacheErrorCacheSecurityGroupNotFound),
                            @"QuotaExceeded.CacheSecurityGroup" : @(AWSElasticacheErrorCacheSecurityGroupQuotaExceeded),
                            @"CacheSubnetGroupAlreadyExists" : @(AWSElasticacheErrorCacheSubnetGroupAlreadyExists),
                            @"CacheSubnetGroupInUse" : @(AWSElasticacheErrorCacheSubnetGroupInUse),
                            @"CacheSubnetGroupNotFoundFault" : @(AWSElasticacheErrorCacheSubnetGroupNotFound),
                            @"CacheSubnetGroupQuotaExceeded" : @(AWSElasticacheErrorCacheSubnetGroupQuotaExceeded),
                            @"CacheSubnetQuotaExceededFault" : @(AWSElasticacheErrorCacheSubnetQuotaExceeded),
                            @"ClusterQuotaForCustomerExceeded" : @(AWSElasticacheErrorClusterQuotaForCustomerExceeded),
                            @"GlobalReplicationGroupAlreadyExistsFault" : @(AWSElasticacheErrorGlobalReplicationGroupAlreadyExists),
                            @"GlobalReplicationGroupNotFoundFault" : @(AWSElasticacheErrorGlobalReplicationGroupNotFound),
                            @"InsufficientCacheClusterCapacity" : @(AWSElasticacheErrorInsufficientCacheClusterCapacity),
                            @"InvalidARN" : @(AWSElasticacheErrorInvalidARN),
                            @"InvalidCacheClusterState" : @(AWSElasticacheErrorInvalidCacheClusterState),
                            @"InvalidCacheParameterGroupState" : @(AWSElasticacheErrorInvalidCacheParameterGroupState),
                            @"InvalidCacheSecurityGroupState" : @(AWSElasticacheErrorInvalidCacheSecurityGroupState),
                            @"InvalidGlobalReplicationGroupState" : @(AWSElasticacheErrorInvalidGlobalReplicationGroupState),
                            @"InvalidKMSKeyFault" : @(AWSElasticacheErrorInvalidKMSKey),
                            @"InvalidParameterCombination" : @(AWSElasticacheErrorInvalidParameterCombination),
                            @"InvalidParameterValue" : @(AWSElasticacheErrorInvalidParameterValue),
                            @"InvalidReplicationGroupState" : @(AWSElasticacheErrorInvalidReplicationGroupState),
                            @"InvalidSnapshotState" : @(AWSElasticacheErrorInvalidSnapshotState),
                            @"InvalidSubnet" : @(AWSElasticacheErrorInvalidSubnet),
                            @"InvalidVPCNetworkStateFault" : @(AWSElasticacheErrorInvalidVPCNetworkState),
                            @"NoOperationFault" : @(AWSElasticacheErrorNoOperation),
                            @"NodeGroupNotFoundFault" : @(AWSElasticacheErrorNodeGroupNotFound),
                            @"NodeGroupsPerReplicationGroupQuotaExceeded" : @(AWSElasticacheErrorNodeGroupsPerReplicationGroupQuotaExceeded),
                            @"NodeQuotaForClusterExceeded" : @(AWSElasticacheErrorNodeQuotaForClusterExceeded),
                            @"NodeQuotaForCustomerExceeded" : @(AWSElasticacheErrorNodeQuotaForCustomerExceeded),
                            @"ReplicationGroupAlreadyExists" : @(AWSElasticacheErrorReplicationGroupAlreadyExists),
                            @"ReplicationGroupAlreadyUnderMigrationFault" : @(AWSElasticacheErrorReplicationGroupAlreadyUnderMigration),
                            @"ReplicationGroupNotFoundFault" : @(AWSElasticacheErrorReplicationGroupNotFound),
                            @"ReplicationGroupNotUnderMigrationFault" : @(AWSElasticacheErrorReplicationGroupNotUnderMigration),
                            @"ReservedCacheNodeAlreadyExists" : @(AWSElasticacheErrorReservedCacheNodeAlreadyExists),
                            @"ReservedCacheNodeNotFound" : @(AWSElasticacheErrorReservedCacheNodeNotFound),
                            @"ReservedCacheNodeQuotaExceeded" : @(AWSElasticacheErrorReservedCacheNodeQuotaExceeded),
                            @"ReservedCacheNodesOfferingNotFound" : @(AWSElasticacheErrorReservedCacheNodesOfferingNotFound),
                            @"ServiceLinkedRoleNotFoundFault" : @(AWSElasticacheErrorServiceLinkedRoleNotFound),
                            @"ServiceUpdateNotFoundFault" : @(AWSElasticacheErrorServiceUpdateNotFound),
                            @"SnapshotAlreadyExistsFault" : @(AWSElasticacheErrorSnapshotAlreadyExists),
                            @"SnapshotFeatureNotSupportedFault" : @(AWSElasticacheErrorSnapshotFeatureNotSupported),
                            @"SnapshotNotFoundFault" : @(AWSElasticacheErrorSnapshotNotFound),
                            @"SnapshotQuotaExceededFault" : @(AWSElasticacheErrorSnapshotQuotaExceeded),
                            @"SubnetInUse" : @(AWSElasticacheErrorSubnetInUse),
                            @"TagNotFound" : @(AWSElasticacheErrorTagNotFound),
                            @"TagQuotaPerResourceExceeded" : @(AWSElasticacheErrorTagQuotaPerResourceExceeded),
                            @"TestFailoverNotAvailableFault" : @(AWSElasticacheErrorTestFailoverNotAvailable),
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
                *error = [NSError errorWithDomain:AWSElasticacheErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                         ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSElasticacheErrorDomain
                                             code:AWSElasticacheErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSElasticacheErrorDomain
                                     code:AWSElasticacheErrorUnknown
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

@interface AWSElasticacheRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSElasticacheRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSElasticache()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSElasticache

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSElasticacheSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSElasticache versions need to match. Check your SDK installation. AWSCore: %@ AWSElasticache: %@", AWSiOSSDKVersion, AWSElasticacheSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultElasticache {
    static AWSElasticache *_defaultElasticache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoElasticache];
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
        _defaultElasticache = [[AWSElasticache alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultElasticache;
}

+ (void)registerElasticacheWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSElasticache alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ElasticacheForKey:(NSString *)key {
    @synchronized(self) {
        AWSElasticache *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoElasticache
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSElasticache registerElasticacheWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeElasticacheForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultElasticache` or `+ ElasticacheForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceElasticache
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceElasticache];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSElasticacheRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSElasticacheResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSElasticacheResponseSerializer alloc] initWithJSONDefinition:[[AWSElasticacheResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSElasticacheTagListMessage *> *)addTagsToResource:(AWSElasticacheAddTagsToResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddTagsToResource"
                   outputClass:[AWSElasticacheTagListMessage class]];
}

- (void)addTagsToResource:(AWSElasticacheAddTagsToResourceMessage *)request
     completionHandler:(void (^)(AWSElasticacheTagListMessage *response, NSError *error))completionHandler {
    [[self addTagsToResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheTagListMessage *> * _Nonnull task) {
        AWSElasticacheTagListMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheAuthorizeCacheSecurityGroupIngressResult *> *)authorizeCacheSecurityGroupIngress:(AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeCacheSecurityGroupIngress"
                   outputClass:[AWSElasticacheAuthorizeCacheSecurityGroupIngressResult class]];
}

- (void)authorizeCacheSecurityGroupIngress:(AWSElasticacheAuthorizeCacheSecurityGroupIngressMessage *)request
     completionHandler:(void (^)(AWSElasticacheAuthorizeCacheSecurityGroupIngressResult *response, NSError *error))completionHandler {
    [[self authorizeCacheSecurityGroupIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheAuthorizeCacheSecurityGroupIngressResult *> * _Nonnull task) {
        AWSElasticacheAuthorizeCacheSecurityGroupIngressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheUpdateActionResultsMessage *> *)batchApplyUpdateAction:(AWSElasticacheBatchApplyUpdateActionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BatchApplyUpdateAction"
                   outputClass:[AWSElasticacheUpdateActionResultsMessage class]];
}

- (void)batchApplyUpdateAction:(AWSElasticacheBatchApplyUpdateActionMessage *)request
     completionHandler:(void (^)(AWSElasticacheUpdateActionResultsMessage *response, NSError *error))completionHandler {
    [[self batchApplyUpdateAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheUpdateActionResultsMessage *> * _Nonnull task) {
        AWSElasticacheUpdateActionResultsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheUpdateActionResultsMessage *> *)batchStopUpdateAction:(AWSElasticacheBatchStopUpdateActionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BatchStopUpdateAction"
                   outputClass:[AWSElasticacheUpdateActionResultsMessage class]];
}

- (void)batchStopUpdateAction:(AWSElasticacheBatchStopUpdateActionMessage *)request
     completionHandler:(void (^)(AWSElasticacheUpdateActionResultsMessage *response, NSError *error))completionHandler {
    [[self batchStopUpdateAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheUpdateActionResultsMessage *> * _Nonnull task) {
        AWSElasticacheUpdateActionResultsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCompleteMigrationResponse *> *)completeMigration:(AWSElasticacheCompleteMigrationMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CompleteMigration"
                   outputClass:[AWSElasticacheCompleteMigrationResponse class]];
}

- (void)completeMigration:(AWSElasticacheCompleteMigrationMessage *)request
     completionHandler:(void (^)(AWSElasticacheCompleteMigrationResponse *response, NSError *error))completionHandler {
    [[self completeMigration:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCompleteMigrationResponse *> * _Nonnull task) {
        AWSElasticacheCompleteMigrationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheReplicateSnapshotResult *> *)replicateSnapshot:(AWSElasticacheReplicateSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopySnapshot"
                   outputClass:[AWSElasticacheReplicateSnapshotResult class]];
}

- (void)replicateSnapshot:(AWSElasticacheReplicateSnapshotMessage *)request
     completionHandler:(void (^)(AWSElasticacheReplicateSnapshotResult *response, NSError *error))completionHandler {
    [[self replicateSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheReplicateSnapshotResult *> * _Nonnull task) {
        AWSElasticacheReplicateSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCreateCacheClusterResult *> *)createCacheCluster:(AWSElasticacheCreateCacheClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCacheCluster"
                   outputClass:[AWSElasticacheCreateCacheClusterResult class]];
}

- (void)createCacheCluster:(AWSElasticacheCreateCacheClusterMessage *)request
     completionHandler:(void (^)(AWSElasticacheCreateCacheClusterResult *response, NSError *error))completionHandler {
    [[self createCacheCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCreateCacheClusterResult *> * _Nonnull task) {
        AWSElasticacheCreateCacheClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCreateCacheParameterGroupResult *> *)createCacheParameterGroup:(AWSElasticacheCreateCacheParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCacheParameterGroup"
                   outputClass:[AWSElasticacheCreateCacheParameterGroupResult class]];
}

- (void)createCacheParameterGroup:(AWSElasticacheCreateCacheParameterGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheCreateCacheParameterGroupResult *response, NSError *error))completionHandler {
    [[self createCacheParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCreateCacheParameterGroupResult *> * _Nonnull task) {
        AWSElasticacheCreateCacheParameterGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCreateCacheSecurityGroupResult *> *)createCacheSecurityGroup:(AWSElasticacheCreateCacheSecurityGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCacheSecurityGroup"
                   outputClass:[AWSElasticacheCreateCacheSecurityGroupResult class]];
}

- (void)createCacheSecurityGroup:(AWSElasticacheCreateCacheSecurityGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheCreateCacheSecurityGroupResult *response, NSError *error))completionHandler {
    [[self createCacheSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCreateCacheSecurityGroupResult *> * _Nonnull task) {
        AWSElasticacheCreateCacheSecurityGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCreateCacheSubnetGroupResult *> *)createCacheSubnetGroup:(AWSElasticacheCreateCacheSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCacheSubnetGroup"
                   outputClass:[AWSElasticacheCreateCacheSubnetGroupResult class]];
}

- (void)createCacheSubnetGroup:(AWSElasticacheCreateCacheSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheCreateCacheSubnetGroupResult *response, NSError *error))completionHandler {
    [[self createCacheSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCreateCacheSubnetGroupResult *> * _Nonnull task) {
        AWSElasticacheCreateCacheSubnetGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCreateGlobalReplicationGroupResult *> *)createGlobalReplicationGroup:(AWSElasticacheCreateGlobalReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateGlobalReplicationGroup"
                   outputClass:[AWSElasticacheCreateGlobalReplicationGroupResult class]];
}

- (void)createGlobalReplicationGroup:(AWSElasticacheCreateGlobalReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheCreateGlobalReplicationGroupResult *response, NSError *error))completionHandler {
    [[self createGlobalReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCreateGlobalReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheCreateGlobalReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCreateReplicationGroupResult *> *)createReplicationGroup:(AWSElasticacheCreateReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateReplicationGroup"
                   outputClass:[AWSElasticacheCreateReplicationGroupResult class]];
}

- (void)createReplicationGroup:(AWSElasticacheCreateReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheCreateReplicationGroupResult *response, NSError *error))completionHandler {
    [[self createReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCreateReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheCreateReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCreateSnapshotResult *> *)createSnapshot:(AWSElasticacheCreateSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSnapshot"
                   outputClass:[AWSElasticacheCreateSnapshotResult class]];
}

- (void)createSnapshot:(AWSElasticacheCreateSnapshotMessage *)request
     completionHandler:(void (^)(AWSElasticacheCreateSnapshotResult *response, NSError *error))completionHandler {
    [[self createSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCreateSnapshotResult *> * _Nonnull task) {
        AWSElasticacheCreateSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult *> *)decreaseNodeGroupsInGlobalReplicationGroup:(AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DecreaseNodeGroupsInGlobalReplicationGroup"
                   outputClass:[AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult class]];
}

- (void)decreaseNodeGroupsInGlobalReplicationGroup:(AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult *response, NSError *error))completionHandler {
    [[self decreaseNodeGroupsInGlobalReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheDecreaseNodeGroupsInGlobalReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheDecreaseReplicaCountResult *> *)decreaseReplicaCount:(AWSElasticacheDecreaseReplicaCountMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DecreaseReplicaCount"
                   outputClass:[AWSElasticacheDecreaseReplicaCountResult class]];
}

- (void)decreaseReplicaCount:(AWSElasticacheDecreaseReplicaCountMessage *)request
     completionHandler:(void (^)(AWSElasticacheDecreaseReplicaCountResult *response, NSError *error))completionHandler {
    [[self decreaseReplicaCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheDecreaseReplicaCountResult *> * _Nonnull task) {
        AWSElasticacheDecreaseReplicaCountResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheDeleteCacheClusterResult *> *)deleteCacheCluster:(AWSElasticacheDeleteCacheClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCacheCluster"
                   outputClass:[AWSElasticacheDeleteCacheClusterResult class]];
}

- (void)deleteCacheCluster:(AWSElasticacheDeleteCacheClusterMessage *)request
     completionHandler:(void (^)(AWSElasticacheDeleteCacheClusterResult *response, NSError *error))completionHandler {
    [[self deleteCacheCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheDeleteCacheClusterResult *> * _Nonnull task) {
        AWSElasticacheDeleteCacheClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCacheParameterGroup:(AWSElasticacheDeleteCacheParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCacheParameterGroup"
                   outputClass:nil];
}

- (void)deleteCacheParameterGroup:(AWSElasticacheDeleteCacheParameterGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCacheParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCacheSecurityGroup:(AWSElasticacheDeleteCacheSecurityGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCacheSecurityGroup"
                   outputClass:nil];
}

- (void)deleteCacheSecurityGroup:(AWSElasticacheDeleteCacheSecurityGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCacheSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteCacheSubnetGroup:(AWSElasticacheDeleteCacheSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCacheSubnetGroup"
                   outputClass:nil];
}

- (void)deleteCacheSubnetGroup:(AWSElasticacheDeleteCacheSubnetGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteCacheSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheDeleteGlobalReplicationGroupResult *> *)deleteGlobalReplicationGroup:(AWSElasticacheDeleteGlobalReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteGlobalReplicationGroup"
                   outputClass:[AWSElasticacheDeleteGlobalReplicationGroupResult class]];
}

- (void)deleteGlobalReplicationGroup:(AWSElasticacheDeleteGlobalReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheDeleteGlobalReplicationGroupResult *response, NSError *error))completionHandler {
    [[self deleteGlobalReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheDeleteGlobalReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheDeleteGlobalReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheDeleteReplicationGroupResult *> *)deleteReplicationGroup:(AWSElasticacheDeleteReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteReplicationGroup"
                   outputClass:[AWSElasticacheDeleteReplicationGroupResult class]];
}

- (void)deleteReplicationGroup:(AWSElasticacheDeleteReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheDeleteReplicationGroupResult *response, NSError *error))completionHandler {
    [[self deleteReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheDeleteReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheDeleteReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheDeleteSnapshotResult *> *)deleteSnapshot:(AWSElasticacheDeleteSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSnapshot"
                   outputClass:[AWSElasticacheDeleteSnapshotResult class]];
}

- (void)deleteSnapshot:(AWSElasticacheDeleteSnapshotMessage *)request
     completionHandler:(void (^)(AWSElasticacheDeleteSnapshotResult *response, NSError *error))completionHandler {
    [[self deleteSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheDeleteSnapshotResult *> * _Nonnull task) {
        AWSElasticacheDeleteSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCacheClusterMessage *> *)describeCacheClusters:(AWSElasticacheDescribeCacheClustersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCacheClusters"
                   outputClass:[AWSElasticacheCacheClusterMessage class]];
}

- (void)describeCacheClusters:(AWSElasticacheDescribeCacheClustersMessage *)request
     completionHandler:(void (^)(AWSElasticacheCacheClusterMessage *response, NSError *error))completionHandler {
    [[self describeCacheClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCacheClusterMessage *> * _Nonnull task) {
        AWSElasticacheCacheClusterMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCacheEngineVersionMessage *> *)describeCacheEngineVersions:(AWSElasticacheDescribeCacheEngineVersionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCacheEngineVersions"
                   outputClass:[AWSElasticacheCacheEngineVersionMessage class]];
}

- (void)describeCacheEngineVersions:(AWSElasticacheDescribeCacheEngineVersionsMessage *)request
     completionHandler:(void (^)(AWSElasticacheCacheEngineVersionMessage *response, NSError *error))completionHandler {
    [[self describeCacheEngineVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCacheEngineVersionMessage *> * _Nonnull task) {
        AWSElasticacheCacheEngineVersionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCacheParameterGroupsMessage *> *)describeCacheParameterGroups:(AWSElasticacheDescribeCacheParameterGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCacheParameterGroups"
                   outputClass:[AWSElasticacheCacheParameterGroupsMessage class]];
}

- (void)describeCacheParameterGroups:(AWSElasticacheDescribeCacheParameterGroupsMessage *)request
     completionHandler:(void (^)(AWSElasticacheCacheParameterGroupsMessage *response, NSError *error))completionHandler {
    [[self describeCacheParameterGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCacheParameterGroupsMessage *> * _Nonnull task) {
        AWSElasticacheCacheParameterGroupsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCacheParameterGroupDetails *> *)describeCacheParameters:(AWSElasticacheDescribeCacheParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCacheParameters"
                   outputClass:[AWSElasticacheCacheParameterGroupDetails class]];
}

- (void)describeCacheParameters:(AWSElasticacheDescribeCacheParametersMessage *)request
     completionHandler:(void (^)(AWSElasticacheCacheParameterGroupDetails *response, NSError *error))completionHandler {
    [[self describeCacheParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCacheParameterGroupDetails *> * _Nonnull task) {
        AWSElasticacheCacheParameterGroupDetails *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCacheSecurityGroupMessage *> *)describeCacheSecurityGroups:(AWSElasticacheDescribeCacheSecurityGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCacheSecurityGroups"
                   outputClass:[AWSElasticacheCacheSecurityGroupMessage class]];
}

- (void)describeCacheSecurityGroups:(AWSElasticacheDescribeCacheSecurityGroupsMessage *)request
     completionHandler:(void (^)(AWSElasticacheCacheSecurityGroupMessage *response, NSError *error))completionHandler {
    [[self describeCacheSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCacheSecurityGroupMessage *> * _Nonnull task) {
        AWSElasticacheCacheSecurityGroupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCacheSubnetGroupMessage *> *)describeCacheSubnetGroups:(AWSElasticacheDescribeCacheSubnetGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCacheSubnetGroups"
                   outputClass:[AWSElasticacheCacheSubnetGroupMessage class]];
}

- (void)describeCacheSubnetGroups:(AWSElasticacheDescribeCacheSubnetGroupsMessage *)request
     completionHandler:(void (^)(AWSElasticacheCacheSubnetGroupMessage *response, NSError *error))completionHandler {
    [[self describeCacheSubnetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCacheSubnetGroupMessage *> * _Nonnull task) {
        AWSElasticacheCacheSubnetGroupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheDescribeEngineDefaultParametersResult *> *)describeEngineDefaultParameters:(AWSElasticacheDescribeEngineDefaultParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEngineDefaultParameters"
                   outputClass:[AWSElasticacheDescribeEngineDefaultParametersResult class]];
}

- (void)describeEngineDefaultParameters:(AWSElasticacheDescribeEngineDefaultParametersMessage *)request
     completionHandler:(void (^)(AWSElasticacheDescribeEngineDefaultParametersResult *response, NSError *error))completionHandler {
    [[self describeEngineDefaultParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheDescribeEngineDefaultParametersResult *> * _Nonnull task) {
        AWSElasticacheDescribeEngineDefaultParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheEventsMessage *> *)describeEvents:(AWSElasticacheDescribeEventsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEvents"
                   outputClass:[AWSElasticacheEventsMessage class]];
}

- (void)describeEvents:(AWSElasticacheDescribeEventsMessage *)request
     completionHandler:(void (^)(AWSElasticacheEventsMessage *response, NSError *error))completionHandler {
    [[self describeEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheEventsMessage *> * _Nonnull task) {
        AWSElasticacheEventsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheDescribeGlobalReplicationGroupsResult *> *)describeGlobalReplicationGroups:(AWSElasticacheDescribeGlobalReplicationGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeGlobalReplicationGroups"
                   outputClass:[AWSElasticacheDescribeGlobalReplicationGroupsResult class]];
}

- (void)describeGlobalReplicationGroups:(AWSElasticacheDescribeGlobalReplicationGroupsMessage *)request
     completionHandler:(void (^)(AWSElasticacheDescribeGlobalReplicationGroupsResult *response, NSError *error))completionHandler {
    [[self describeGlobalReplicationGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheDescribeGlobalReplicationGroupsResult *> * _Nonnull task) {
        AWSElasticacheDescribeGlobalReplicationGroupsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheReplicationGroupMessage *> *)describeReplicationGroups:(AWSElasticacheDescribeReplicationGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReplicationGroups"
                   outputClass:[AWSElasticacheReplicationGroupMessage class]];
}

- (void)describeReplicationGroups:(AWSElasticacheDescribeReplicationGroupsMessage *)request
     completionHandler:(void (^)(AWSElasticacheReplicationGroupMessage *response, NSError *error))completionHandler {
    [[self describeReplicationGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheReplicationGroupMessage *> * _Nonnull task) {
        AWSElasticacheReplicationGroupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheReservedCacheNodeMessage *> *)describeReservedCacheNodes:(AWSElasticacheDescribeReservedCacheNodesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedCacheNodes"
                   outputClass:[AWSElasticacheReservedCacheNodeMessage class]];
}

- (void)describeReservedCacheNodes:(AWSElasticacheDescribeReservedCacheNodesMessage *)request
     completionHandler:(void (^)(AWSElasticacheReservedCacheNodeMessage *response, NSError *error))completionHandler {
    [[self describeReservedCacheNodes:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheReservedCacheNodeMessage *> * _Nonnull task) {
        AWSElasticacheReservedCacheNodeMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheReservedCacheNodesOfferingMessage *> *)describeReservedCacheNodesOfferings:(AWSElasticacheDescribeReservedCacheNodesOfferingsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedCacheNodesOfferings"
                   outputClass:[AWSElasticacheReservedCacheNodesOfferingMessage class]];
}

- (void)describeReservedCacheNodesOfferings:(AWSElasticacheDescribeReservedCacheNodesOfferingsMessage *)request
     completionHandler:(void (^)(AWSElasticacheReservedCacheNodesOfferingMessage *response, NSError *error))completionHandler {
    [[self describeReservedCacheNodesOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheReservedCacheNodesOfferingMessage *> * _Nonnull task) {
        AWSElasticacheReservedCacheNodesOfferingMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheServiceUpdatesMessage *> *)describeServiceUpdates:(AWSElasticacheDescribeServiceUpdatesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeServiceUpdates"
                   outputClass:[AWSElasticacheServiceUpdatesMessage class]];
}

- (void)describeServiceUpdates:(AWSElasticacheDescribeServiceUpdatesMessage *)request
     completionHandler:(void (^)(AWSElasticacheServiceUpdatesMessage *response, NSError *error))completionHandler {
    [[self describeServiceUpdates:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheServiceUpdatesMessage *> * _Nonnull task) {
        AWSElasticacheServiceUpdatesMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheDescribeSnapshotsListMessage *> *)describeSnapshots:(AWSElasticacheDescribeSnapshotsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSnapshots"
                   outputClass:[AWSElasticacheDescribeSnapshotsListMessage class]];
}

- (void)describeSnapshots:(AWSElasticacheDescribeSnapshotsMessage *)request
     completionHandler:(void (^)(AWSElasticacheDescribeSnapshotsListMessage *response, NSError *error))completionHandler {
    [[self describeSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheDescribeSnapshotsListMessage *> * _Nonnull task) {
        AWSElasticacheDescribeSnapshotsListMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheUpdateActionsMessage *> *)describeUpdateActions:(AWSElasticacheDescribeUpdateActionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeUpdateActions"
                   outputClass:[AWSElasticacheUpdateActionsMessage class]];
}

- (void)describeUpdateActions:(AWSElasticacheDescribeUpdateActionsMessage *)request
     completionHandler:(void (^)(AWSElasticacheUpdateActionsMessage *response, NSError *error))completionHandler {
    [[self describeUpdateActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheUpdateActionsMessage *> * _Nonnull task) {
        AWSElasticacheUpdateActionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheDisassociateGlobalReplicationGroupResult *> *)disassociateGlobalReplicationGroup:(AWSElasticacheDisassociateGlobalReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisassociateGlobalReplicationGroup"
                   outputClass:[AWSElasticacheDisassociateGlobalReplicationGroupResult class]];
}

- (void)disassociateGlobalReplicationGroup:(AWSElasticacheDisassociateGlobalReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheDisassociateGlobalReplicationGroupResult *response, NSError *error))completionHandler {
    [[self disassociateGlobalReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheDisassociateGlobalReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheDisassociateGlobalReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheFailoverGlobalReplicationGroupResult *> *)failoverGlobalReplicationGroup:(AWSElasticacheFailoverGlobalReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"FailoverGlobalReplicationGroup"
                   outputClass:[AWSElasticacheFailoverGlobalReplicationGroupResult class]];
}

- (void)failoverGlobalReplicationGroup:(AWSElasticacheFailoverGlobalReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheFailoverGlobalReplicationGroupResult *response, NSError *error))completionHandler {
    [[self failoverGlobalReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheFailoverGlobalReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheFailoverGlobalReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult *> *)increaseNodeGroupsInGlobalReplicationGroup:(AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"IncreaseNodeGroupsInGlobalReplicationGroup"
                   outputClass:[AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult class]];
}

- (void)increaseNodeGroupsInGlobalReplicationGroup:(AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult *response, NSError *error))completionHandler {
    [[self increaseNodeGroupsInGlobalReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheIncreaseNodeGroupsInGlobalReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheIncreaseReplicaCountResult *> *)increaseReplicaCount:(AWSElasticacheIncreaseReplicaCountMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"IncreaseReplicaCount"
                   outputClass:[AWSElasticacheIncreaseReplicaCountResult class]];
}

- (void)increaseReplicaCount:(AWSElasticacheIncreaseReplicaCountMessage *)request
     completionHandler:(void (^)(AWSElasticacheIncreaseReplicaCountResult *response, NSError *error))completionHandler {
    [[self increaseReplicaCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheIncreaseReplicaCountResult *> * _Nonnull task) {
        AWSElasticacheIncreaseReplicaCountResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheAllowedNodeTypeModificationsMessage *> *)listAllowedNodeTypeModifications:(AWSElasticacheListAllowedNodeTypeModificationsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListAllowedNodeTypeModifications"
                   outputClass:[AWSElasticacheAllowedNodeTypeModificationsMessage class]];
}

- (void)listAllowedNodeTypeModifications:(AWSElasticacheListAllowedNodeTypeModificationsMessage *)request
     completionHandler:(void (^)(AWSElasticacheAllowedNodeTypeModificationsMessage *response, NSError *error))completionHandler {
    [[self listAllowedNodeTypeModifications:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheAllowedNodeTypeModificationsMessage *> * _Nonnull task) {
        AWSElasticacheAllowedNodeTypeModificationsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheTagListMessage *> *)listTagsForResource:(AWSElasticacheListTagsForResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSElasticacheTagListMessage class]];
}

- (void)listTagsForResource:(AWSElasticacheListTagsForResourceMessage *)request
     completionHandler:(void (^)(AWSElasticacheTagListMessage *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheTagListMessage *> * _Nonnull task) {
        AWSElasticacheTagListMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheModifyCacheClusterResult *> *)modifyCacheCluster:(AWSElasticacheModifyCacheClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyCacheCluster"
                   outputClass:[AWSElasticacheModifyCacheClusterResult class]];
}

- (void)modifyCacheCluster:(AWSElasticacheModifyCacheClusterMessage *)request
     completionHandler:(void (^)(AWSElasticacheModifyCacheClusterResult *response, NSError *error))completionHandler {
    [[self modifyCacheCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheModifyCacheClusterResult *> * _Nonnull task) {
        AWSElasticacheModifyCacheClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCacheParameterGroupNameMessage *> *)modifyCacheParameterGroup:(AWSElasticacheModifyCacheParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyCacheParameterGroup"
                   outputClass:[AWSElasticacheCacheParameterGroupNameMessage class]];
}

- (void)modifyCacheParameterGroup:(AWSElasticacheModifyCacheParameterGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheCacheParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self modifyCacheParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCacheParameterGroupNameMessage *> * _Nonnull task) {
        AWSElasticacheCacheParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheModifyCacheSubnetGroupResult *> *)modifyCacheSubnetGroup:(AWSElasticacheModifyCacheSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyCacheSubnetGroup"
                   outputClass:[AWSElasticacheModifyCacheSubnetGroupResult class]];
}

- (void)modifyCacheSubnetGroup:(AWSElasticacheModifyCacheSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheModifyCacheSubnetGroupResult *response, NSError *error))completionHandler {
    [[self modifyCacheSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheModifyCacheSubnetGroupResult *> * _Nonnull task) {
        AWSElasticacheModifyCacheSubnetGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheModifyGlobalReplicationGroupResult *> *)modifyGlobalReplicationGroup:(AWSElasticacheModifyGlobalReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyGlobalReplicationGroup"
                   outputClass:[AWSElasticacheModifyGlobalReplicationGroupResult class]];
}

- (void)modifyGlobalReplicationGroup:(AWSElasticacheModifyGlobalReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheModifyGlobalReplicationGroupResult *response, NSError *error))completionHandler {
    [[self modifyGlobalReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheModifyGlobalReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheModifyGlobalReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheModifyReplicationGroupResult *> *)modifyReplicationGroup:(AWSElasticacheModifyReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyReplicationGroup"
                   outputClass:[AWSElasticacheModifyReplicationGroupResult class]];
}

- (void)modifyReplicationGroup:(AWSElasticacheModifyReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheModifyReplicationGroupResult *response, NSError *error))completionHandler {
    [[self modifyReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheModifyReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheModifyReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheModifyReplicationGroupShardConfigurationResult *> *)modifyReplicationGroupShardConfiguration:(AWSElasticacheModifyReplicationGroupShardConfigurationMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyReplicationGroupShardConfiguration"
                   outputClass:[AWSElasticacheModifyReplicationGroupShardConfigurationResult class]];
}

- (void)modifyReplicationGroupShardConfiguration:(AWSElasticacheModifyReplicationGroupShardConfigurationMessage *)request
     completionHandler:(void (^)(AWSElasticacheModifyReplicationGroupShardConfigurationResult *response, NSError *error))completionHandler {
    [[self modifyReplicationGroupShardConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheModifyReplicationGroupShardConfigurationResult *> * _Nonnull task) {
        AWSElasticacheModifyReplicationGroupShardConfigurationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticachePurchaseReservedCacheNodesOfferingResult *> *)purchaseReservedCacheNodesOffering:(AWSElasticachePurchaseReservedCacheNodesOfferingMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PurchaseReservedCacheNodesOffering"
                   outputClass:[AWSElasticachePurchaseReservedCacheNodesOfferingResult class]];
}

- (void)purchaseReservedCacheNodesOffering:(AWSElasticachePurchaseReservedCacheNodesOfferingMessage *)request
     completionHandler:(void (^)(AWSElasticachePurchaseReservedCacheNodesOfferingResult *response, NSError *error))completionHandler {
    [[self purchaseReservedCacheNodesOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticachePurchaseReservedCacheNodesOfferingResult *> * _Nonnull task) {
        AWSElasticachePurchaseReservedCacheNodesOfferingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult *> *)rebalanceSlotsInGlobalReplicationGroup:(AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RebalanceSlotsInGlobalReplicationGroup"
                   outputClass:[AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult class]];
}

- (void)rebalanceSlotsInGlobalReplicationGroup:(AWSElasticacheRebalanceSlotsInGlobalReplicationGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult *response, NSError *error))completionHandler {
    [[self rebalanceSlotsInGlobalReplicationGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult *> * _Nonnull task) {
        AWSElasticacheRebalanceSlotsInGlobalReplicationGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheRebootCacheClusterResult *> *)rebootCacheCluster:(AWSElasticacheRebootCacheClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RebootCacheCluster"
                   outputClass:[AWSElasticacheRebootCacheClusterResult class]];
}

- (void)rebootCacheCluster:(AWSElasticacheRebootCacheClusterMessage *)request
     completionHandler:(void (^)(AWSElasticacheRebootCacheClusterResult *response, NSError *error))completionHandler {
    [[self rebootCacheCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheRebootCacheClusterResult *> * _Nonnull task) {
        AWSElasticacheRebootCacheClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheTagListMessage *> *)removeTagsFromResource:(AWSElasticacheRemoveTagsFromResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveTagsFromResource"
                   outputClass:[AWSElasticacheTagListMessage class]];
}

- (void)removeTagsFromResource:(AWSElasticacheRemoveTagsFromResourceMessage *)request
     completionHandler:(void (^)(AWSElasticacheTagListMessage *response, NSError *error))completionHandler {
    [[self removeTagsFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheTagListMessage *> * _Nonnull task) {
        AWSElasticacheTagListMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheCacheParameterGroupNameMessage *> *)resetCacheParameterGroup:(AWSElasticacheResetCacheParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetCacheParameterGroup"
                   outputClass:[AWSElasticacheCacheParameterGroupNameMessage class]];
}

- (void)resetCacheParameterGroup:(AWSElasticacheResetCacheParameterGroupMessage *)request
     completionHandler:(void (^)(AWSElasticacheCacheParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self resetCacheParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheCacheParameterGroupNameMessage *> * _Nonnull task) {
        AWSElasticacheCacheParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheRevokeCacheSecurityGroupIngressResult *> *)revokeCacheSecurityGroupIngress:(AWSElasticacheRevokeCacheSecurityGroupIngressMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeCacheSecurityGroupIngress"
                   outputClass:[AWSElasticacheRevokeCacheSecurityGroupIngressResult class]];
}

- (void)revokeCacheSecurityGroupIngress:(AWSElasticacheRevokeCacheSecurityGroupIngressMessage *)request
     completionHandler:(void (^)(AWSElasticacheRevokeCacheSecurityGroupIngressResult *response, NSError *error))completionHandler {
    [[self revokeCacheSecurityGroupIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheRevokeCacheSecurityGroupIngressResult *> * _Nonnull task) {
        AWSElasticacheRevokeCacheSecurityGroupIngressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheStartMigrationResponse *> *)startMigration:(AWSElasticacheStartMigrationMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartMigration"
                   outputClass:[AWSElasticacheStartMigrationResponse class]];
}

- (void)startMigration:(AWSElasticacheStartMigrationMessage *)request
     completionHandler:(void (^)(AWSElasticacheStartMigrationResponse *response, NSError *error))completionHandler {
    [[self startMigration:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheStartMigrationResponse *> * _Nonnull task) {
        AWSElasticacheStartMigrationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticacheTestFailoverResult *> *)testFailover:(AWSElasticacheTestFailoverMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TestFailover"
                   outputClass:[AWSElasticacheTestFailoverResult class]];
}

- (void)testFailover:(AWSElasticacheTestFailoverMessage *)request
     completionHandler:(void (^)(AWSElasticacheTestFailoverResult *response, NSError *error))completionHandler {
    [[self testFailover:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticacheTestFailoverResult *> * _Nonnull task) {
        AWSElasticacheTestFailoverResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
