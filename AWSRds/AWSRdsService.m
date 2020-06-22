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

#import "AWSRdsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSRdsResources.h"

static NSString *const AWSInfoRds = @"Rds";
NSString *const AWSRdsSDKVersion = @"2.13.4";


@interface AWSRdsResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSRdsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AuthorizationAlreadyExists" : @(AWSRdsErrorAuthorizationAlreadyExists),
                            @"AuthorizationNotFound" : @(AWSRdsErrorAuthorizationNotFound),
                            @"AuthorizationQuotaExceeded" : @(AWSRdsErrorAuthorizationQuotaExceeded),
                            @"BackupPolicyNotFoundFault" : @(AWSRdsErrorBackupPolicyNotFound),
                            @"CertificateNotFound" : @(AWSRdsErrorCertificateNotFound),
                            @"CustomAvailabilityZoneAlreadyExists" : @(AWSRdsErrorCustomAvailabilityZoneAlreadyExists),
                            @"CustomAvailabilityZoneNotFound" : @(AWSRdsErrorCustomAvailabilityZoneNotFound),
                            @"CustomAvailabilityZoneQuotaExceeded" : @(AWSRdsErrorCustomAvailabilityZoneQuotaExceeded),
                            @"DBClusterAlreadyExistsFault" : @(AWSRdsErrorDBClusterAlreadyExists),
                            @"DBClusterBacktrackNotFoundFault" : @(AWSRdsErrorDBClusterBacktrackNotFound),
                            @"DBClusterEndpointAlreadyExistsFault" : @(AWSRdsErrorDBClusterEndpointAlreadyExists),
                            @"DBClusterEndpointNotFoundFault" : @(AWSRdsErrorDBClusterEndpointNotFound),
                            @"DBClusterEndpointQuotaExceededFault" : @(AWSRdsErrorDBClusterEndpointQuotaExceeded),
                            @"DBClusterNotFoundFault" : @(AWSRdsErrorDBClusterNotFound),
                            @"DBClusterParameterGroupNotFound" : @(AWSRdsErrorDBClusterParameterGroupNotFound),
                            @"DBClusterQuotaExceededFault" : @(AWSRdsErrorDBClusterQuotaExceeded),
                            @"DBClusterRoleAlreadyExists" : @(AWSRdsErrorDBClusterRoleAlreadyExists),
                            @"DBClusterRoleNotFound" : @(AWSRdsErrorDBClusterRoleNotFound),
                            @"DBClusterRoleQuotaExceeded" : @(AWSRdsErrorDBClusterRoleQuotaExceeded),
                            @"DBClusterSnapshotAlreadyExistsFault" : @(AWSRdsErrorDBClusterSnapshotAlreadyExists),
                            @"DBClusterSnapshotNotFoundFault" : @(AWSRdsErrorDBClusterSnapshotNotFound),
                            @"DBInstanceAlreadyExists" : @(AWSRdsErrorDBInstanceAlreadyExists),
                            @"DBInstanceAutomatedBackupNotFound" : @(AWSRdsErrorDBInstanceAutomatedBackupNotFound),
                            @"DBInstanceAutomatedBackupQuotaExceeded" : @(AWSRdsErrorDBInstanceAutomatedBackupQuotaExceeded),
                            @"DBInstanceNotFound" : @(AWSRdsErrorDBInstanceNotFound),
                            @"DBInstanceRoleAlreadyExists" : @(AWSRdsErrorDBInstanceRoleAlreadyExists),
                            @"DBInstanceRoleNotFound" : @(AWSRdsErrorDBInstanceRoleNotFound),
                            @"DBInstanceRoleQuotaExceeded" : @(AWSRdsErrorDBInstanceRoleQuotaExceeded),
                            @"DBLogFileNotFoundFault" : @(AWSRdsErrorDBLogFileNotFound),
                            @"DBParameterGroupAlreadyExists" : @(AWSRdsErrorDBParameterGroupAlreadyExists),
                            @"DBParameterGroupNotFound" : @(AWSRdsErrorDBParameterGroupNotFound),
                            @"DBParameterGroupQuotaExceeded" : @(AWSRdsErrorDBParameterGroupQuotaExceeded),
                            @"DBProxyTargetExistsFault" : @(AWSRdsErrorDBProxyAlreadyExists),
                            @"DBProxyNotFoundFault" : @(AWSRdsErrorDBProxyNotFound),
                            @"DBProxyQuotaExceededFault" : @(AWSRdsErrorDBProxyQuotaExceeded),
                            @"DBProxyTargetAlreadyRegisteredFault" : @(AWSRdsErrorDBProxyTargetAlreadyRegistered),
                            @"DBProxyTargetGroupNotFoundFault" : @(AWSRdsErrorDBProxyTargetGroupNotFound),
                            @"DBProxyTargetNotFoundFault" : @(AWSRdsErrorDBProxyTargetNotFound),
                            @"DBSecurityGroupAlreadyExists" : @(AWSRdsErrorDBSecurityGroupAlreadyExists),
                            @"DBSecurityGroupNotFound" : @(AWSRdsErrorDBSecurityGroupNotFound),
                            @"DBSecurityGroupNotSupported" : @(AWSRdsErrorDBSecurityGroupNotSupported),
                            @"QuotaExceeded.DBSecurityGroup" : @(AWSRdsErrorDBSecurityGroupQuotaExceeded),
                            @"DBSnapshotAlreadyExists" : @(AWSRdsErrorDBSnapshotAlreadyExists),
                            @"DBSnapshotNotFound" : @(AWSRdsErrorDBSnapshotNotFound),
                            @"DBSubnetGroupAlreadyExists" : @(AWSRdsErrorDBSubnetGroupAlreadyExists),
                            @"DBSubnetGroupDoesNotCoverEnoughAZs" : @(AWSRdsErrorDBSubnetGroupDoesNotCoverEnoughAZs),
                            @"DBSubnetGroupNotAllowedFault" : @(AWSRdsErrorDBSubnetGroupNotAllowed),
                            @"DBSubnetGroupNotFoundFault" : @(AWSRdsErrorDBSubnetGroupNotFound),
                            @"DBSubnetGroupQuotaExceeded" : @(AWSRdsErrorDBSubnetGroupQuotaExceeded),
                            @"DBSubnetQuotaExceededFault" : @(AWSRdsErrorDBSubnetQuotaExceeded),
                            @"DBUpgradeDependencyFailure" : @(AWSRdsErrorDBUpgradeDependencyFailure),
                            @"DomainNotFoundFault" : @(AWSRdsErrorDomainNotFound),
                            @"EventSubscriptionQuotaExceeded" : @(AWSRdsErrorEventSubscriptionQuotaExceeded),
                            @"ExportTaskAlreadyExists" : @(AWSRdsErrorExportTaskAlreadyExists),
                            @"ExportTaskNotFound" : @(AWSRdsErrorExportTaskNotFound),
                            @"GlobalClusterAlreadyExistsFault" : @(AWSRdsErrorGlobalClusterAlreadyExists),
                            @"GlobalClusterNotFoundFault" : @(AWSRdsErrorGlobalClusterNotFound),
                            @"GlobalClusterQuotaExceededFault" : @(AWSRdsErrorGlobalClusterQuotaExceeded),
                            @"IamRoleMissingPermissions" : @(AWSRdsErrorIamRoleMissingPermissions),
                            @"IamRoleNotFound" : @(AWSRdsErrorIamRoleNotFound),
                            @"InstallationMediaAlreadyExists" : @(AWSRdsErrorInstallationMediaAlreadyExists),
                            @"InstallationMediaNotFound" : @(AWSRdsErrorInstallationMediaNotFound),
                            @"InstanceQuotaExceeded" : @(AWSRdsErrorInstanceQuotaExceeded),
                            @"InsufficientDBClusterCapacityFault" : @(AWSRdsErrorInsufficientDBClusterCapacity),
                            @"InsufficientDBInstanceCapacity" : @(AWSRdsErrorInsufficientDBInstanceCapacity),
                            @"InsufficientStorageClusterCapacity" : @(AWSRdsErrorInsufficientStorageClusterCapacity),
                            @"InvalidDBClusterCapacityFault" : @(AWSRdsErrorInvalidDBClusterCapacity),
                            @"InvalidDBClusterEndpointStateFault" : @(AWSRdsErrorInvalidDBClusterEndpointState),
                            @"InvalidDBClusterSnapshotStateFault" : @(AWSRdsErrorInvalidDBClusterSnapshotState),
                            @"InvalidDBClusterStateFault" : @(AWSRdsErrorInvalidDBClusterState),
                            @"InvalidDBInstanceAutomatedBackupState" : @(AWSRdsErrorInvalidDBInstanceAutomatedBackupState),
                            @"InvalidDBInstanceState" : @(AWSRdsErrorInvalidDBInstanceState),
                            @"InvalidDBParameterGroupState" : @(AWSRdsErrorInvalidDBParameterGroupState),
                            @"InvalidDBProxyStateFault" : @(AWSRdsErrorInvalidDBProxyState),
                            @"InvalidDBSecurityGroupState" : @(AWSRdsErrorInvalidDBSecurityGroupState),
                            @"InvalidDBSnapshotState" : @(AWSRdsErrorInvalidDBSnapshotState),
                            @"InvalidDBSubnetGroupFault" : @(AWSRdsErrorInvalidDBSubnetGroup),
                            @"InvalidDBSubnetGroupStateFault" : @(AWSRdsErrorInvalidDBSubnetGroupState),
                            @"InvalidDBSubnetStateFault" : @(AWSRdsErrorInvalidDBSubnetState),
                            @"InvalidEventSubscriptionState" : @(AWSRdsErrorInvalidEventSubscriptionState),
                            @"InvalidExportOnly" : @(AWSRdsErrorInvalidExportOnly),
                            @"InvalidExportSourceState" : @(AWSRdsErrorInvalidExportSourceState),
                            @"InvalidExportTaskStateFault" : @(AWSRdsErrorInvalidExportTaskState),
                            @"InvalidGlobalClusterStateFault" : @(AWSRdsErrorInvalidGlobalClusterState),
                            @"InvalidOptionGroupStateFault" : @(AWSRdsErrorInvalidOptionGroupState),
                            @"InvalidRestoreFault" : @(AWSRdsErrorInvalidRestore),
                            @"InvalidS3BucketFault" : @(AWSRdsErrorInvalidS3Bucket),
                            @"InvalidSubnet" : @(AWSRdsErrorInvalidSubnet),
                            @"InvalidVPCNetworkStateFault" : @(AWSRdsErrorInvalidVPCNetworkState),
                            @"KMSKeyNotAccessibleFault" : @(AWSRdsErrorKMSKeyNotAccessible),
                            @"OptionGroupAlreadyExistsFault" : @(AWSRdsErrorOptionGroupAlreadyExists),
                            @"OptionGroupNotFoundFault" : @(AWSRdsErrorOptionGroupNotFound),
                            @"OptionGroupQuotaExceededFault" : @(AWSRdsErrorOptionGroupQuotaExceeded),
                            @"PointInTimeRestoreNotEnabled" : @(AWSRdsErrorPointInTimeRestoreNotEnabled),
                            @"ProvisionedIopsNotAvailableInAZFault" : @(AWSRdsErrorProvisionedIopsNotAvailableInAZ),
                            @"ReservedDBInstanceAlreadyExists" : @(AWSRdsErrorReservedDBInstanceAlreadyExists),
                            @"ReservedDBInstanceNotFound" : @(AWSRdsErrorReservedDBInstanceNotFound),
                            @"ReservedDBInstanceQuotaExceeded" : @(AWSRdsErrorReservedDBInstanceQuotaExceeded),
                            @"ReservedDBInstancesOfferingNotFound" : @(AWSRdsErrorReservedDBInstancesOfferingNotFound),
                            @"ResourceNotFoundFault" : @(AWSRdsErrorResourceNotFound),
                            @"SNSInvalidTopic" : @(AWSRdsErrorSNSInvalidTopic),
                            @"SNSNoAuthorization" : @(AWSRdsErrorSNSNoAuthorization),
                            @"SNSTopicArnNotFound" : @(AWSRdsErrorSNSTopicArnNotFound),
                            @"SharedSnapshotQuotaExceeded" : @(AWSRdsErrorSharedSnapshotQuotaExceeded),
                            @"SnapshotQuotaExceeded" : @(AWSRdsErrorSnapshotQuotaExceeded),
                            @"SourceNotFound" : @(AWSRdsErrorSourceNotFound),
                            @"StorageQuotaExceeded" : @(AWSRdsErrorStorageQuotaExceeded),
                            @"StorageTypeNotSupported" : @(AWSRdsErrorStorageTypeNotSupported),
                            @"SubnetAlreadyInUse" : @(AWSRdsErrorSubnetAlreadyInUse),
                            @"SubscriptionAlreadyExist" : @(AWSRdsErrorSubscriptionAlreadyExist),
                            @"SubscriptionCategoryNotFound" : @(AWSRdsErrorSubscriptionCategoryNotFound),
                            @"SubscriptionNotFound" : @(AWSRdsErrorSubscriptionNotFound),
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
                *error = [NSError errorWithDomain:AWSRdsErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                         ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSRdsErrorDomain
                                             code:AWSRdsErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSRdsErrorDomain
                                     code:AWSRdsErrorUnknown
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

@interface AWSRdsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSRdsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSRds()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSRds

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSRdsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSRds versions need to match. Check your SDK installation. AWSCore: %@ AWSRds: %@", AWSiOSSDKVersion, AWSRdsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultRds {
    static AWSRds *_defaultRds = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoRds];
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
        _defaultRds = [[AWSRds alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultRds;
}

+ (void)registerRdsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSRds alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)RdsForKey:(NSString *)key {
    @synchronized(self) {
        AWSRds *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoRds
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSRds registerRdsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeRdsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultRds` or `+ RdsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceRds
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceRds];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSRdsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSRdsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSRdsResponseSerializer alloc] initWithJSONDefinition:[[AWSRdsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)addRoleToDBCluster:(AWSRdsAddRoleToDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddRoleToDBCluster"
                   outputClass:nil];
}

- (void)addRoleToDBCluster:(AWSRdsAddRoleToDBClusterMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addRoleToDBCluster:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)addRoleToDBInstance:(AWSRdsAddRoleToDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddRoleToDBInstance"
                   outputClass:nil];
}

- (void)addRoleToDBInstance:(AWSRdsAddRoleToDBInstanceMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addRoleToDBInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsAddSourceIdentifierToSubscriptionResult *> *)addSourceIdentifierToSubscription:(AWSRdsAddSourceIdentifierToSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddSourceIdentifierToSubscription"
                   outputClass:[AWSRdsAddSourceIdentifierToSubscriptionResult class]];
}

- (void)addSourceIdentifierToSubscription:(AWSRdsAddSourceIdentifierToSubscriptionMessage *)request
     completionHandler:(void (^)(AWSRdsAddSourceIdentifierToSubscriptionResult *response, NSError *error))completionHandler {
    [[self addSourceIdentifierToSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsAddSourceIdentifierToSubscriptionResult *> * _Nonnull task) {
        AWSRdsAddSourceIdentifierToSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)addTagsToResource:(AWSRdsAddTagsToResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddTagsToResource"
                   outputClass:nil];
}

- (void)addTagsToResource:(AWSRdsAddTagsToResourceMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addTagsToResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsApplyPendingMaintenanceActionResult *> *)applyPendingMaintenanceAction:(AWSRdsApplyPendingMaintenanceActionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ApplyPendingMaintenanceAction"
                   outputClass:[AWSRdsApplyPendingMaintenanceActionResult class]];
}

- (void)applyPendingMaintenanceAction:(AWSRdsApplyPendingMaintenanceActionMessage *)request
     completionHandler:(void (^)(AWSRdsApplyPendingMaintenanceActionResult *response, NSError *error))completionHandler {
    [[self applyPendingMaintenanceAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsApplyPendingMaintenanceActionResult *> * _Nonnull task) {
        AWSRdsApplyPendingMaintenanceActionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsAuthorizeDBSecurityGroupIngressResult *> *)authorizeDBSecurityGroupIngress:(AWSRdsAuthorizeDBSecurityGroupIngressMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeDBSecurityGroupIngress"
                   outputClass:[AWSRdsAuthorizeDBSecurityGroupIngressResult class]];
}

- (void)authorizeDBSecurityGroupIngress:(AWSRdsAuthorizeDBSecurityGroupIngressMessage *)request
     completionHandler:(void (^)(AWSRdsAuthorizeDBSecurityGroupIngressResult *response, NSError *error))completionHandler {
    [[self authorizeDBSecurityGroupIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsAuthorizeDBSecurityGroupIngressResult *> * _Nonnull task) {
        AWSRdsAuthorizeDBSecurityGroupIngressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterBacktrack *> *)backtrackDBCluster:(AWSRdsBacktrackDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BacktrackDBCluster"
                   outputClass:[AWSRdsDBClusterBacktrack class]];
}

- (void)backtrackDBCluster:(AWSRdsBacktrackDBClusterMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterBacktrack *response, NSError *error))completionHandler {
    [[self backtrackDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterBacktrack *> * _Nonnull task) {
        AWSRdsDBClusterBacktrack *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsExportTask *> *)cancelExportTask:(AWSRdsCancelExportTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelExportTask"
                   outputClass:[AWSRdsExportTask class]];
}

- (void)cancelExportTask:(AWSRdsCancelExportTaskMessage *)request
     completionHandler:(void (^)(AWSRdsExportTask *response, NSError *error))completionHandler {
    [[self cancelExportTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsExportTask *> * _Nonnull task) {
        AWSRdsExportTask *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsReplicateDBClusterParameterGroupResult *> *)replicateDBClusterParameterGroup:(AWSRdsReplicateDBClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyDBClusterParameterGroup"
                   outputClass:[AWSRdsReplicateDBClusterParameterGroupResult class]];
}

- (void)replicateDBClusterParameterGroup:(AWSRdsReplicateDBClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSRdsReplicateDBClusterParameterGroupResult *response, NSError *error))completionHandler {
    [[self replicateDBClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsReplicateDBClusterParameterGroupResult *> * _Nonnull task) {
        AWSRdsReplicateDBClusterParameterGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsReplicateDBClusterSnapshotResult *> *)replicateDBClusterSnapshot:(AWSRdsReplicateDBClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyDBClusterSnapshot"
                   outputClass:[AWSRdsReplicateDBClusterSnapshotResult class]];
}

- (void)replicateDBClusterSnapshot:(AWSRdsReplicateDBClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSRdsReplicateDBClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self replicateDBClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsReplicateDBClusterSnapshotResult *> * _Nonnull task) {
        AWSRdsReplicateDBClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsReplicateDBParameterGroupResult *> *)replicateDBParameterGroup:(AWSRdsReplicateDBParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyDBParameterGroup"
                   outputClass:[AWSRdsReplicateDBParameterGroupResult class]];
}

- (void)replicateDBParameterGroup:(AWSRdsReplicateDBParameterGroupMessage *)request
     completionHandler:(void (^)(AWSRdsReplicateDBParameterGroupResult *response, NSError *error))completionHandler {
    [[self replicateDBParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsReplicateDBParameterGroupResult *> * _Nonnull task) {
        AWSRdsReplicateDBParameterGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsReplicateDBSnapshotResult *> *)replicateDBSnapshot:(AWSRdsReplicateDBSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyDBSnapshot"
                   outputClass:[AWSRdsReplicateDBSnapshotResult class]];
}

- (void)replicateDBSnapshot:(AWSRdsReplicateDBSnapshotMessage *)request
     completionHandler:(void (^)(AWSRdsReplicateDBSnapshotResult *response, NSError *error))completionHandler {
    [[self replicateDBSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsReplicateDBSnapshotResult *> * _Nonnull task) {
        AWSRdsReplicateDBSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsReplicateOptionGroupResult *> *)replicateOptionGroup:(AWSRdsReplicateOptionGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyOptionGroup"
                   outputClass:[AWSRdsReplicateOptionGroupResult class]];
}

- (void)replicateOptionGroup:(AWSRdsReplicateOptionGroupMessage *)request
     completionHandler:(void (^)(AWSRdsReplicateOptionGroupResult *response, NSError *error))completionHandler {
    [[self replicateOptionGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsReplicateOptionGroupResult *> * _Nonnull task) {
        AWSRdsReplicateOptionGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateCustomAvailabilityZoneResult *> *)createCustomAvailabilityZone:(AWSRdsCreateCustomAvailabilityZoneMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCustomAvailabilityZone"
                   outputClass:[AWSRdsCreateCustomAvailabilityZoneResult class]];
}

- (void)createCustomAvailabilityZone:(AWSRdsCreateCustomAvailabilityZoneMessage *)request
     completionHandler:(void (^)(AWSRdsCreateCustomAvailabilityZoneResult *response, NSError *error))completionHandler {
    [[self createCustomAvailabilityZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateCustomAvailabilityZoneResult *> * _Nonnull task) {
        AWSRdsCreateCustomAvailabilityZoneResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateDBClusterResult *> *)createDBCluster:(AWSRdsCreateDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBCluster"
                   outputClass:[AWSRdsCreateDBClusterResult class]];
}

- (void)createDBCluster:(AWSRdsCreateDBClusterMessage *)request
     completionHandler:(void (^)(AWSRdsCreateDBClusterResult *response, NSError *error))completionHandler {
    [[self createDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateDBClusterResult *> * _Nonnull task) {
        AWSRdsCreateDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterEndpoint *> *)createDBClusterEndpoint:(AWSRdsCreateDBClusterEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBClusterEndpoint"
                   outputClass:[AWSRdsDBClusterEndpoint class]];
}

- (void)createDBClusterEndpoint:(AWSRdsCreateDBClusterEndpointMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterEndpoint *response, NSError *error))completionHandler {
    [[self createDBClusterEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterEndpoint *> * _Nonnull task) {
        AWSRdsDBClusterEndpoint *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateDBClusterParameterGroupResult *> *)createDBClusterParameterGroup:(AWSRdsCreateDBClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBClusterParameterGroup"
                   outputClass:[AWSRdsCreateDBClusterParameterGroupResult class]];
}

- (void)createDBClusterParameterGroup:(AWSRdsCreateDBClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSRdsCreateDBClusterParameterGroupResult *response, NSError *error))completionHandler {
    [[self createDBClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateDBClusterParameterGroupResult *> * _Nonnull task) {
        AWSRdsCreateDBClusterParameterGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateDBClusterSnapshotResult *> *)createDBClusterSnapshot:(AWSRdsCreateDBClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBClusterSnapshot"
                   outputClass:[AWSRdsCreateDBClusterSnapshotResult class]];
}

- (void)createDBClusterSnapshot:(AWSRdsCreateDBClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSRdsCreateDBClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self createDBClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateDBClusterSnapshotResult *> * _Nonnull task) {
        AWSRdsCreateDBClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateDBInstanceResult *> *)createDBInstance:(AWSRdsCreateDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBInstance"
                   outputClass:[AWSRdsCreateDBInstanceResult class]];
}

- (void)createDBInstance:(AWSRdsCreateDBInstanceMessage *)request
     completionHandler:(void (^)(AWSRdsCreateDBInstanceResult *response, NSError *error))completionHandler {
    [[self createDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateDBInstanceResult *> * _Nonnull task) {
        AWSRdsCreateDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateDBInstanceReadReplicaResult *> *)createDBInstanceReadReplica:(AWSRdsCreateDBInstanceReadReplicaMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBInstanceReadReplica"
                   outputClass:[AWSRdsCreateDBInstanceReadReplicaResult class]];
}

- (void)createDBInstanceReadReplica:(AWSRdsCreateDBInstanceReadReplicaMessage *)request
     completionHandler:(void (^)(AWSRdsCreateDBInstanceReadReplicaResult *response, NSError *error))completionHandler {
    [[self createDBInstanceReadReplica:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateDBInstanceReadReplicaResult *> * _Nonnull task) {
        AWSRdsCreateDBInstanceReadReplicaResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateDBParameterGroupResult *> *)createDBParameterGroup:(AWSRdsCreateDBParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBParameterGroup"
                   outputClass:[AWSRdsCreateDBParameterGroupResult class]];
}

- (void)createDBParameterGroup:(AWSRdsCreateDBParameterGroupMessage *)request
     completionHandler:(void (^)(AWSRdsCreateDBParameterGroupResult *response, NSError *error))completionHandler {
    [[self createDBParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateDBParameterGroupResult *> * _Nonnull task) {
        AWSRdsCreateDBParameterGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateDBProxyResponse *> *)createDBProxy:(AWSRdsCreateDBProxyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBProxy"
                   outputClass:[AWSRdsCreateDBProxyResponse class]];
}

- (void)createDBProxy:(AWSRdsCreateDBProxyRequest *)request
     completionHandler:(void (^)(AWSRdsCreateDBProxyResponse *response, NSError *error))completionHandler {
    [[self createDBProxy:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateDBProxyResponse *> * _Nonnull task) {
        AWSRdsCreateDBProxyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateDBSecurityGroupResult *> *)createDBSecurityGroup:(AWSRdsCreateDBSecurityGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBSecurityGroup"
                   outputClass:[AWSRdsCreateDBSecurityGroupResult class]];
}

- (void)createDBSecurityGroup:(AWSRdsCreateDBSecurityGroupMessage *)request
     completionHandler:(void (^)(AWSRdsCreateDBSecurityGroupResult *response, NSError *error))completionHandler {
    [[self createDBSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateDBSecurityGroupResult *> * _Nonnull task) {
        AWSRdsCreateDBSecurityGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateDBSnapshotResult *> *)createDBSnapshot:(AWSRdsCreateDBSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBSnapshot"
                   outputClass:[AWSRdsCreateDBSnapshotResult class]];
}

- (void)createDBSnapshot:(AWSRdsCreateDBSnapshotMessage *)request
     completionHandler:(void (^)(AWSRdsCreateDBSnapshotResult *response, NSError *error))completionHandler {
    [[self createDBSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateDBSnapshotResult *> * _Nonnull task) {
        AWSRdsCreateDBSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateDBSubnetGroupResult *> *)createDBSubnetGroup:(AWSRdsCreateDBSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBSubnetGroup"
                   outputClass:[AWSRdsCreateDBSubnetGroupResult class]];
}

- (void)createDBSubnetGroup:(AWSRdsCreateDBSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSRdsCreateDBSubnetGroupResult *response, NSError *error))completionHandler {
    [[self createDBSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateDBSubnetGroupResult *> * _Nonnull task) {
        AWSRdsCreateDBSubnetGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateEventSubscriptionResult *> *)createEventSubscription:(AWSRdsCreateEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateEventSubscription"
                   outputClass:[AWSRdsCreateEventSubscriptionResult class]];
}

- (void)createEventSubscription:(AWSRdsCreateEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSRdsCreateEventSubscriptionResult *response, NSError *error))completionHandler {
    [[self createEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateEventSubscriptionResult *> * _Nonnull task) {
        AWSRdsCreateEventSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateGlobalClusterResult *> *)createGlobalCluster:(AWSRdsCreateGlobalClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateGlobalCluster"
                   outputClass:[AWSRdsCreateGlobalClusterResult class]];
}

- (void)createGlobalCluster:(AWSRdsCreateGlobalClusterMessage *)request
     completionHandler:(void (^)(AWSRdsCreateGlobalClusterResult *response, NSError *error))completionHandler {
    [[self createGlobalCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateGlobalClusterResult *> * _Nonnull task) {
        AWSRdsCreateGlobalClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCreateOptionGroupResult *> *)createOptionGroup:(AWSRdsCreateOptionGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateOptionGroup"
                   outputClass:[AWSRdsCreateOptionGroupResult class]];
}

- (void)createOptionGroup:(AWSRdsCreateOptionGroupMessage *)request
     completionHandler:(void (^)(AWSRdsCreateOptionGroupResult *response, NSError *error))completionHandler {
    [[self createOptionGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCreateOptionGroupResult *> * _Nonnull task) {
        AWSRdsCreateOptionGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDeleteCustomAvailabilityZoneResult *> *)deleteCustomAvailabilityZone:(AWSRdsDeleteCustomAvailabilityZoneMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCustomAvailabilityZone"
                   outputClass:[AWSRdsDeleteCustomAvailabilityZoneResult class]];
}

- (void)deleteCustomAvailabilityZone:(AWSRdsDeleteCustomAvailabilityZoneMessage *)request
     completionHandler:(void (^)(AWSRdsDeleteCustomAvailabilityZoneResult *response, NSError *error))completionHandler {
    [[self deleteCustomAvailabilityZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDeleteCustomAvailabilityZoneResult *> * _Nonnull task) {
        AWSRdsDeleteCustomAvailabilityZoneResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDeleteDBClusterResult *> *)deleteDBCluster:(AWSRdsDeleteDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBCluster"
                   outputClass:[AWSRdsDeleteDBClusterResult class]];
}

- (void)deleteDBCluster:(AWSRdsDeleteDBClusterMessage *)request
     completionHandler:(void (^)(AWSRdsDeleteDBClusterResult *response, NSError *error))completionHandler {
    [[self deleteDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDeleteDBClusterResult *> * _Nonnull task) {
        AWSRdsDeleteDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterEndpoint *> *)deleteDBClusterEndpoint:(AWSRdsDeleteDBClusterEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBClusterEndpoint"
                   outputClass:[AWSRdsDBClusterEndpoint class]];
}

- (void)deleteDBClusterEndpoint:(AWSRdsDeleteDBClusterEndpointMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterEndpoint *response, NSError *error))completionHandler {
    [[self deleteDBClusterEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterEndpoint *> * _Nonnull task) {
        AWSRdsDBClusterEndpoint *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDBClusterParameterGroup:(AWSRdsDeleteDBClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBClusterParameterGroup"
                   outputClass:nil];
}

- (void)deleteDBClusterParameterGroup:(AWSRdsDeleteDBClusterParameterGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDBClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDeleteDBClusterSnapshotResult *> *)deleteDBClusterSnapshot:(AWSRdsDeleteDBClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBClusterSnapshot"
                   outputClass:[AWSRdsDeleteDBClusterSnapshotResult class]];
}

- (void)deleteDBClusterSnapshot:(AWSRdsDeleteDBClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSRdsDeleteDBClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self deleteDBClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDeleteDBClusterSnapshotResult *> * _Nonnull task) {
        AWSRdsDeleteDBClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDeleteDBInstanceResult *> *)deleteDBInstance:(AWSRdsDeleteDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBInstance"
                   outputClass:[AWSRdsDeleteDBInstanceResult class]];
}

- (void)deleteDBInstance:(AWSRdsDeleteDBInstanceMessage *)request
     completionHandler:(void (^)(AWSRdsDeleteDBInstanceResult *response, NSError *error))completionHandler {
    [[self deleteDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDeleteDBInstanceResult *> * _Nonnull task) {
        AWSRdsDeleteDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDeleteDBInstanceAutomatedBackupResult *> *)deleteDBInstanceAutomatedBackup:(AWSRdsDeleteDBInstanceAutomatedBackupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBInstanceAutomatedBackup"
                   outputClass:[AWSRdsDeleteDBInstanceAutomatedBackupResult class]];
}

- (void)deleteDBInstanceAutomatedBackup:(AWSRdsDeleteDBInstanceAutomatedBackupMessage *)request
     completionHandler:(void (^)(AWSRdsDeleteDBInstanceAutomatedBackupResult *response, NSError *error))completionHandler {
    [[self deleteDBInstanceAutomatedBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDeleteDBInstanceAutomatedBackupResult *> * _Nonnull task) {
        AWSRdsDeleteDBInstanceAutomatedBackupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDBParameterGroup:(AWSRdsDeleteDBParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBParameterGroup"
                   outputClass:nil];
}

- (void)deleteDBParameterGroup:(AWSRdsDeleteDBParameterGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDBParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDeleteDBProxyResponse *> *)deleteDBProxy:(AWSRdsDeleteDBProxyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBProxy"
                   outputClass:[AWSRdsDeleteDBProxyResponse class]];
}

- (void)deleteDBProxy:(AWSRdsDeleteDBProxyRequest *)request
     completionHandler:(void (^)(AWSRdsDeleteDBProxyResponse *response, NSError *error))completionHandler {
    [[self deleteDBProxy:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDeleteDBProxyResponse *> * _Nonnull task) {
        AWSRdsDeleteDBProxyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDBSecurityGroup:(AWSRdsDeleteDBSecurityGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBSecurityGroup"
                   outputClass:nil];
}

- (void)deleteDBSecurityGroup:(AWSRdsDeleteDBSecurityGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDBSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDeleteDBSnapshotResult *> *)deleteDBSnapshot:(AWSRdsDeleteDBSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBSnapshot"
                   outputClass:[AWSRdsDeleteDBSnapshotResult class]];
}

- (void)deleteDBSnapshot:(AWSRdsDeleteDBSnapshotMessage *)request
     completionHandler:(void (^)(AWSRdsDeleteDBSnapshotResult *response, NSError *error))completionHandler {
    [[self deleteDBSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDeleteDBSnapshotResult *> * _Nonnull task) {
        AWSRdsDeleteDBSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDBSubnetGroup:(AWSRdsDeleteDBSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBSubnetGroup"
                   outputClass:nil];
}

- (void)deleteDBSubnetGroup:(AWSRdsDeleteDBSubnetGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDBSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDeleteEventSubscriptionResult *> *)deleteEventSubscription:(AWSRdsDeleteEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteEventSubscription"
                   outputClass:[AWSRdsDeleteEventSubscriptionResult class]];
}

- (void)deleteEventSubscription:(AWSRdsDeleteEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSRdsDeleteEventSubscriptionResult *response, NSError *error))completionHandler {
    [[self deleteEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDeleteEventSubscriptionResult *> * _Nonnull task) {
        AWSRdsDeleteEventSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDeleteGlobalClusterResult *> *)deleteGlobalCluster:(AWSRdsDeleteGlobalClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteGlobalCluster"
                   outputClass:[AWSRdsDeleteGlobalClusterResult class]];
}

- (void)deleteGlobalCluster:(AWSRdsDeleteGlobalClusterMessage *)request
     completionHandler:(void (^)(AWSRdsDeleteGlobalClusterResult *response, NSError *error))completionHandler {
    [[self deleteGlobalCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDeleteGlobalClusterResult *> * _Nonnull task) {
        AWSRdsDeleteGlobalClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsInstallationMedia *> *)deleteInstallationMedia:(AWSRdsDeleteInstallationMediaMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteInstallationMedia"
                   outputClass:[AWSRdsInstallationMedia class]];
}

- (void)deleteInstallationMedia:(AWSRdsDeleteInstallationMediaMessage *)request
     completionHandler:(void (^)(AWSRdsInstallationMedia *response, NSError *error))completionHandler {
    [[self deleteInstallationMedia:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsInstallationMedia *> * _Nonnull task) {
        AWSRdsInstallationMedia *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteOptionGroup:(AWSRdsDeleteOptionGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteOptionGroup"
                   outputClass:nil];
}

- (void)deleteOptionGroup:(AWSRdsDeleteOptionGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteOptionGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDeregisterDBProxyTargetsResponse *> *)deregisterDBProxyTargets:(AWSRdsDeregisterDBProxyTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterDBProxyTargets"
                   outputClass:[AWSRdsDeregisterDBProxyTargetsResponse class]];
}

- (void)deregisterDBProxyTargets:(AWSRdsDeregisterDBProxyTargetsRequest *)request
     completionHandler:(void (^)(AWSRdsDeregisterDBProxyTargetsResponse *response, NSError *error))completionHandler {
    [[self deregisterDBProxyTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDeregisterDBProxyTargetsResponse *> * _Nonnull task) {
        AWSRdsDeregisterDBProxyTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsAccountAttributesMessage *> *)describeAccountAttributes:(AWSRdsDescribeAccountAttributesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSRdsAccountAttributesMessage class]];
}

- (void)describeAccountAttributes:(AWSRdsDescribeAccountAttributesMessage *)request
     completionHandler:(void (^)(AWSRdsAccountAttributesMessage *response, NSError *error))completionHandler {
    [[self describeAccountAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsAccountAttributesMessage *> * _Nonnull task) {
        AWSRdsAccountAttributesMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCertificateMessage *> *)describeCertificates:(AWSRdsDescribeCertificatesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCertificates"
                   outputClass:[AWSRdsCertificateMessage class]];
}

- (void)describeCertificates:(AWSRdsDescribeCertificatesMessage *)request
     completionHandler:(void (^)(AWSRdsCertificateMessage *response, NSError *error))completionHandler {
    [[self describeCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCertificateMessage *> * _Nonnull task) {
        AWSRdsCertificateMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsCustomAvailabilityZoneMessage *> *)describeCustomAvailabilityZones:(AWSRdsDescribeCustomAvailabilityZonesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCustomAvailabilityZones"
                   outputClass:[AWSRdsCustomAvailabilityZoneMessage class]];
}

- (void)describeCustomAvailabilityZones:(AWSRdsDescribeCustomAvailabilityZonesMessage *)request
     completionHandler:(void (^)(AWSRdsCustomAvailabilityZoneMessage *response, NSError *error))completionHandler {
    [[self describeCustomAvailabilityZones:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsCustomAvailabilityZoneMessage *> * _Nonnull task) {
        AWSRdsCustomAvailabilityZoneMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterBacktrackMessage *> *)describeDBClusterBacktracks:(AWSRdsDescribeDBClusterBacktracksMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterBacktracks"
                   outputClass:[AWSRdsDBClusterBacktrackMessage class]];
}

- (void)describeDBClusterBacktracks:(AWSRdsDescribeDBClusterBacktracksMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterBacktrackMessage *response, NSError *error))completionHandler {
    [[self describeDBClusterBacktracks:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterBacktrackMessage *> * _Nonnull task) {
        AWSRdsDBClusterBacktrackMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterEndpointMessage *> *)describeDBClusterEndpoints:(AWSRdsDescribeDBClusterEndpointsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterEndpoints"
                   outputClass:[AWSRdsDBClusterEndpointMessage class]];
}

- (void)describeDBClusterEndpoints:(AWSRdsDescribeDBClusterEndpointsMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterEndpointMessage *response, NSError *error))completionHandler {
    [[self describeDBClusterEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterEndpointMessage *> * _Nonnull task) {
        AWSRdsDBClusterEndpointMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterParameterGroupsMessage *> *)describeDBClusterParameterGroups:(AWSRdsDescribeDBClusterParameterGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterParameterGroups"
                   outputClass:[AWSRdsDBClusterParameterGroupsMessage class]];
}

- (void)describeDBClusterParameterGroups:(AWSRdsDescribeDBClusterParameterGroupsMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterParameterGroupsMessage *response, NSError *error))completionHandler {
    [[self describeDBClusterParameterGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterParameterGroupsMessage *> * _Nonnull task) {
        AWSRdsDBClusterParameterGroupsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterParameterGroupDetails *> *)describeDBClusterParameters:(AWSRdsDescribeDBClusterParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterParameters"
                   outputClass:[AWSRdsDBClusterParameterGroupDetails class]];
}

- (void)describeDBClusterParameters:(AWSRdsDescribeDBClusterParametersMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterParameterGroupDetails *response, NSError *error))completionHandler {
    [[self describeDBClusterParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterParameterGroupDetails *> * _Nonnull task) {
        AWSRdsDBClusterParameterGroupDetails *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDescribeDBClusterSnapshotAttributesResult *> *)describeDBClusterSnapshotAttributes:(AWSRdsDescribeDBClusterSnapshotAttributesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterSnapshotAttributes"
                   outputClass:[AWSRdsDescribeDBClusterSnapshotAttributesResult class]];
}

- (void)describeDBClusterSnapshotAttributes:(AWSRdsDescribeDBClusterSnapshotAttributesMessage *)request
     completionHandler:(void (^)(AWSRdsDescribeDBClusterSnapshotAttributesResult *response, NSError *error))completionHandler {
    [[self describeDBClusterSnapshotAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDescribeDBClusterSnapshotAttributesResult *> * _Nonnull task) {
        AWSRdsDescribeDBClusterSnapshotAttributesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterSnapshotMessage *> *)describeDBClusterSnapshots:(AWSRdsDescribeDBClusterSnapshotsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterSnapshots"
                   outputClass:[AWSRdsDBClusterSnapshotMessage class]];
}

- (void)describeDBClusterSnapshots:(AWSRdsDescribeDBClusterSnapshotsMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterSnapshotMessage *response, NSError *error))completionHandler {
    [[self describeDBClusterSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterSnapshotMessage *> * _Nonnull task) {
        AWSRdsDBClusterSnapshotMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterMessage *> *)describeDBClusters:(AWSRdsDescribeDBClustersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusters"
                   outputClass:[AWSRdsDBClusterMessage class]];
}

- (void)describeDBClusters:(AWSRdsDescribeDBClustersMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterMessage *response, NSError *error))completionHandler {
    [[self describeDBClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterMessage *> * _Nonnull task) {
        AWSRdsDBClusterMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBEngineVersionMessage *> *)describeDBEngineVersions:(AWSRdsDescribeDBEngineVersionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBEngineVersions"
                   outputClass:[AWSRdsDBEngineVersionMessage class]];
}

- (void)describeDBEngineVersions:(AWSRdsDescribeDBEngineVersionsMessage *)request
     completionHandler:(void (^)(AWSRdsDBEngineVersionMessage *response, NSError *error))completionHandler {
    [[self describeDBEngineVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBEngineVersionMessage *> * _Nonnull task) {
        AWSRdsDBEngineVersionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBInstanceAutomatedBackupMessage *> *)describeDBInstanceAutomatedBackups:(AWSRdsDescribeDBInstanceAutomatedBackupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBInstanceAutomatedBackups"
                   outputClass:[AWSRdsDBInstanceAutomatedBackupMessage class]];
}

- (void)describeDBInstanceAutomatedBackups:(AWSRdsDescribeDBInstanceAutomatedBackupsMessage *)request
     completionHandler:(void (^)(AWSRdsDBInstanceAutomatedBackupMessage *response, NSError *error))completionHandler {
    [[self describeDBInstanceAutomatedBackups:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBInstanceAutomatedBackupMessage *> * _Nonnull task) {
        AWSRdsDBInstanceAutomatedBackupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBInstanceMessage *> *)describeDBInstances:(AWSRdsDescribeDBInstancesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBInstances"
                   outputClass:[AWSRdsDBInstanceMessage class]];
}

- (void)describeDBInstances:(AWSRdsDescribeDBInstancesMessage *)request
     completionHandler:(void (^)(AWSRdsDBInstanceMessage *response, NSError *error))completionHandler {
    [[self describeDBInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBInstanceMessage *> * _Nonnull task) {
        AWSRdsDBInstanceMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDescribeDBLogFilesResponse *> *)describeDBLogFiles:(AWSRdsDescribeDBLogFilesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBLogFiles"
                   outputClass:[AWSRdsDescribeDBLogFilesResponse class]];
}

- (void)describeDBLogFiles:(AWSRdsDescribeDBLogFilesMessage *)request
     completionHandler:(void (^)(AWSRdsDescribeDBLogFilesResponse *response, NSError *error))completionHandler {
    [[self describeDBLogFiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDescribeDBLogFilesResponse *> * _Nonnull task) {
        AWSRdsDescribeDBLogFilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBParameterGroupsMessage *> *)describeDBParameterGroups:(AWSRdsDescribeDBParameterGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBParameterGroups"
                   outputClass:[AWSRdsDBParameterGroupsMessage class]];
}

- (void)describeDBParameterGroups:(AWSRdsDescribeDBParameterGroupsMessage *)request
     completionHandler:(void (^)(AWSRdsDBParameterGroupsMessage *response, NSError *error))completionHandler {
    [[self describeDBParameterGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBParameterGroupsMessage *> * _Nonnull task) {
        AWSRdsDBParameterGroupsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBParameterGroupDetails *> *)describeDBParameters:(AWSRdsDescribeDBParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBParameters"
                   outputClass:[AWSRdsDBParameterGroupDetails class]];
}

- (void)describeDBParameters:(AWSRdsDescribeDBParametersMessage *)request
     completionHandler:(void (^)(AWSRdsDBParameterGroupDetails *response, NSError *error))completionHandler {
    [[self describeDBParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBParameterGroupDetails *> * _Nonnull task) {
        AWSRdsDBParameterGroupDetails *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDescribeDBProxiesResponse *> *)describeDBProxies:(AWSRdsDescribeDBProxiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBProxies"
                   outputClass:[AWSRdsDescribeDBProxiesResponse class]];
}

- (void)describeDBProxies:(AWSRdsDescribeDBProxiesRequest *)request
     completionHandler:(void (^)(AWSRdsDescribeDBProxiesResponse *response, NSError *error))completionHandler {
    [[self describeDBProxies:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDescribeDBProxiesResponse *> * _Nonnull task) {
        AWSRdsDescribeDBProxiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDescribeDBProxyTargetGroupsResponse *> *)describeDBProxyTargetGroups:(AWSRdsDescribeDBProxyTargetGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBProxyTargetGroups"
                   outputClass:[AWSRdsDescribeDBProxyTargetGroupsResponse class]];
}

- (void)describeDBProxyTargetGroups:(AWSRdsDescribeDBProxyTargetGroupsRequest *)request
     completionHandler:(void (^)(AWSRdsDescribeDBProxyTargetGroupsResponse *response, NSError *error))completionHandler {
    [[self describeDBProxyTargetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDescribeDBProxyTargetGroupsResponse *> * _Nonnull task) {
        AWSRdsDescribeDBProxyTargetGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDescribeDBProxyTargetsResponse *> *)describeDBProxyTargets:(AWSRdsDescribeDBProxyTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBProxyTargets"
                   outputClass:[AWSRdsDescribeDBProxyTargetsResponse class]];
}

- (void)describeDBProxyTargets:(AWSRdsDescribeDBProxyTargetsRequest *)request
     completionHandler:(void (^)(AWSRdsDescribeDBProxyTargetsResponse *response, NSError *error))completionHandler {
    [[self describeDBProxyTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDescribeDBProxyTargetsResponse *> * _Nonnull task) {
        AWSRdsDescribeDBProxyTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBSecurityGroupMessage *> *)describeDBSecurityGroups:(AWSRdsDescribeDBSecurityGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBSecurityGroups"
                   outputClass:[AWSRdsDBSecurityGroupMessage class]];
}

- (void)describeDBSecurityGroups:(AWSRdsDescribeDBSecurityGroupsMessage *)request
     completionHandler:(void (^)(AWSRdsDBSecurityGroupMessage *response, NSError *error))completionHandler {
    [[self describeDBSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBSecurityGroupMessage *> * _Nonnull task) {
        AWSRdsDBSecurityGroupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDescribeDBSnapshotAttributesResult *> *)describeDBSnapshotAttributes:(AWSRdsDescribeDBSnapshotAttributesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBSnapshotAttributes"
                   outputClass:[AWSRdsDescribeDBSnapshotAttributesResult class]];
}

- (void)describeDBSnapshotAttributes:(AWSRdsDescribeDBSnapshotAttributesMessage *)request
     completionHandler:(void (^)(AWSRdsDescribeDBSnapshotAttributesResult *response, NSError *error))completionHandler {
    [[self describeDBSnapshotAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDescribeDBSnapshotAttributesResult *> * _Nonnull task) {
        AWSRdsDescribeDBSnapshotAttributesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBSnapshotMessage *> *)describeDBSnapshots:(AWSRdsDescribeDBSnapshotsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBSnapshots"
                   outputClass:[AWSRdsDBSnapshotMessage class]];
}

- (void)describeDBSnapshots:(AWSRdsDescribeDBSnapshotsMessage *)request
     completionHandler:(void (^)(AWSRdsDBSnapshotMessage *response, NSError *error))completionHandler {
    [[self describeDBSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBSnapshotMessage *> * _Nonnull task) {
        AWSRdsDBSnapshotMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBSubnetGroupMessage *> *)describeDBSubnetGroups:(AWSRdsDescribeDBSubnetGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBSubnetGroups"
                   outputClass:[AWSRdsDBSubnetGroupMessage class]];
}

- (void)describeDBSubnetGroups:(AWSRdsDescribeDBSubnetGroupsMessage *)request
     completionHandler:(void (^)(AWSRdsDBSubnetGroupMessage *response, NSError *error))completionHandler {
    [[self describeDBSubnetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBSubnetGroupMessage *> * _Nonnull task) {
        AWSRdsDBSubnetGroupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDescribeEngineDefaultClusterParametersResult *> *)describeEngineDefaultClusterParameters:(AWSRdsDescribeEngineDefaultClusterParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEngineDefaultClusterParameters"
                   outputClass:[AWSRdsDescribeEngineDefaultClusterParametersResult class]];
}

- (void)describeEngineDefaultClusterParameters:(AWSRdsDescribeEngineDefaultClusterParametersMessage *)request
     completionHandler:(void (^)(AWSRdsDescribeEngineDefaultClusterParametersResult *response, NSError *error))completionHandler {
    [[self describeEngineDefaultClusterParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDescribeEngineDefaultClusterParametersResult *> * _Nonnull task) {
        AWSRdsDescribeEngineDefaultClusterParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDescribeEngineDefaultParametersResult *> *)describeEngineDefaultParameters:(AWSRdsDescribeEngineDefaultParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEngineDefaultParameters"
                   outputClass:[AWSRdsDescribeEngineDefaultParametersResult class]];
}

- (void)describeEngineDefaultParameters:(AWSRdsDescribeEngineDefaultParametersMessage *)request
     completionHandler:(void (^)(AWSRdsDescribeEngineDefaultParametersResult *response, NSError *error))completionHandler {
    [[self describeEngineDefaultParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDescribeEngineDefaultParametersResult *> * _Nonnull task) {
        AWSRdsDescribeEngineDefaultParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsEventCategoriesMessage *> *)describeEventCategories:(AWSRdsDescribeEventCategoriesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEventCategories"
                   outputClass:[AWSRdsEventCategoriesMessage class]];
}

- (void)describeEventCategories:(AWSRdsDescribeEventCategoriesMessage *)request
     completionHandler:(void (^)(AWSRdsEventCategoriesMessage *response, NSError *error))completionHandler {
    [[self describeEventCategories:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsEventCategoriesMessage *> * _Nonnull task) {
        AWSRdsEventCategoriesMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsEventSubscriptionsMessage *> *)describeEventSubscriptions:(AWSRdsDescribeEventSubscriptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEventSubscriptions"
                   outputClass:[AWSRdsEventSubscriptionsMessage class]];
}

- (void)describeEventSubscriptions:(AWSRdsDescribeEventSubscriptionsMessage *)request
     completionHandler:(void (^)(AWSRdsEventSubscriptionsMessage *response, NSError *error))completionHandler {
    [[self describeEventSubscriptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsEventSubscriptionsMessage *> * _Nonnull task) {
        AWSRdsEventSubscriptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsEventsMessage *> *)describeEvents:(AWSRdsDescribeEventsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEvents"
                   outputClass:[AWSRdsEventsMessage class]];
}

- (void)describeEvents:(AWSRdsDescribeEventsMessage *)request
     completionHandler:(void (^)(AWSRdsEventsMessage *response, NSError *error))completionHandler {
    [[self describeEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsEventsMessage *> * _Nonnull task) {
        AWSRdsEventsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsExportTasksMessage *> *)describeExportTasks:(AWSRdsDescribeExportTasksMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeExportTasks"
                   outputClass:[AWSRdsExportTasksMessage class]];
}

- (void)describeExportTasks:(AWSRdsDescribeExportTasksMessage *)request
     completionHandler:(void (^)(AWSRdsExportTasksMessage *response, NSError *error))completionHandler {
    [[self describeExportTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsExportTasksMessage *> * _Nonnull task) {
        AWSRdsExportTasksMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsGlobalClustersMessage *> *)describeGlobalClusters:(AWSRdsDescribeGlobalClustersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeGlobalClusters"
                   outputClass:[AWSRdsGlobalClustersMessage class]];
}

- (void)describeGlobalClusters:(AWSRdsDescribeGlobalClustersMessage *)request
     completionHandler:(void (^)(AWSRdsGlobalClustersMessage *response, NSError *error))completionHandler {
    [[self describeGlobalClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsGlobalClustersMessage *> * _Nonnull task) {
        AWSRdsGlobalClustersMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsInstallationMediaMessage *> *)describeInstallationMedia:(AWSRdsDescribeInstallationMediaMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstallationMedia"
                   outputClass:[AWSRdsInstallationMediaMessage class]];
}

- (void)describeInstallationMedia:(AWSRdsDescribeInstallationMediaMessage *)request
     completionHandler:(void (^)(AWSRdsInstallationMediaMessage *response, NSError *error))completionHandler {
    [[self describeInstallationMedia:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsInstallationMediaMessage *> * _Nonnull task) {
        AWSRdsInstallationMediaMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsOptionGroupOptionsMessage *> *)describeOptionGroupOptions:(AWSRdsDescribeOptionGroupOptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeOptionGroupOptions"
                   outputClass:[AWSRdsOptionGroupOptionsMessage class]];
}

- (void)describeOptionGroupOptions:(AWSRdsDescribeOptionGroupOptionsMessage *)request
     completionHandler:(void (^)(AWSRdsOptionGroupOptionsMessage *response, NSError *error))completionHandler {
    [[self describeOptionGroupOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsOptionGroupOptionsMessage *> * _Nonnull task) {
        AWSRdsOptionGroupOptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsOptionGroups *> *)describeOptionGroups:(AWSRdsDescribeOptionGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeOptionGroups"
                   outputClass:[AWSRdsOptionGroups class]];
}

- (void)describeOptionGroups:(AWSRdsDescribeOptionGroupsMessage *)request
     completionHandler:(void (^)(AWSRdsOptionGroups *response, NSError *error))completionHandler {
    [[self describeOptionGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsOptionGroups *> * _Nonnull task) {
        AWSRdsOptionGroups *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsOrderableDBInstanceOptionsMessage *> *)describeOrderableDBInstanceOptions:(AWSRdsDescribeOrderableDBInstanceOptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeOrderableDBInstanceOptions"
                   outputClass:[AWSRdsOrderableDBInstanceOptionsMessage class]];
}

- (void)describeOrderableDBInstanceOptions:(AWSRdsDescribeOrderableDBInstanceOptionsMessage *)request
     completionHandler:(void (^)(AWSRdsOrderableDBInstanceOptionsMessage *response, NSError *error))completionHandler {
    [[self describeOrderableDBInstanceOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsOrderableDBInstanceOptionsMessage *> * _Nonnull task) {
        AWSRdsOrderableDBInstanceOptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsPendingMaintenanceActionsMessage *> *)describePendingMaintenanceActions:(AWSRdsDescribePendingMaintenanceActionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePendingMaintenanceActions"
                   outputClass:[AWSRdsPendingMaintenanceActionsMessage class]];
}

- (void)describePendingMaintenanceActions:(AWSRdsDescribePendingMaintenanceActionsMessage *)request
     completionHandler:(void (^)(AWSRdsPendingMaintenanceActionsMessage *response, NSError *error))completionHandler {
    [[self describePendingMaintenanceActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsPendingMaintenanceActionsMessage *> * _Nonnull task) {
        AWSRdsPendingMaintenanceActionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsReservedDBInstanceMessage *> *)describeReservedDBInstances:(AWSRdsDescribeReservedDBInstancesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedDBInstances"
                   outputClass:[AWSRdsReservedDBInstanceMessage class]];
}

- (void)describeReservedDBInstances:(AWSRdsDescribeReservedDBInstancesMessage *)request
     completionHandler:(void (^)(AWSRdsReservedDBInstanceMessage *response, NSError *error))completionHandler {
    [[self describeReservedDBInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsReservedDBInstanceMessage *> * _Nonnull task) {
        AWSRdsReservedDBInstanceMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsReservedDBInstancesOfferingMessage *> *)describeReservedDBInstancesOfferings:(AWSRdsDescribeReservedDBInstancesOfferingsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedDBInstancesOfferings"
                   outputClass:[AWSRdsReservedDBInstancesOfferingMessage class]];
}

- (void)describeReservedDBInstancesOfferings:(AWSRdsDescribeReservedDBInstancesOfferingsMessage *)request
     completionHandler:(void (^)(AWSRdsReservedDBInstancesOfferingMessage *response, NSError *error))completionHandler {
    [[self describeReservedDBInstancesOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsReservedDBInstancesOfferingMessage *> * _Nonnull task) {
        AWSRdsReservedDBInstancesOfferingMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsSourceRegionMessage *> *)describeSourceRegions:(AWSRdsDescribeSourceRegionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSourceRegions"
                   outputClass:[AWSRdsSourceRegionMessage class]];
}

- (void)describeSourceRegions:(AWSRdsDescribeSourceRegionsMessage *)request
     completionHandler:(void (^)(AWSRdsSourceRegionMessage *response, NSError *error))completionHandler {
    [[self describeSourceRegions:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsSourceRegionMessage *> * _Nonnull task) {
        AWSRdsSourceRegionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDescribeValidDBInstanceModificationsResult *> *)describeValidDBInstanceModifications:(AWSRdsDescribeValidDBInstanceModificationsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeValidDBInstanceModifications"
                   outputClass:[AWSRdsDescribeValidDBInstanceModificationsResult class]];
}

- (void)describeValidDBInstanceModifications:(AWSRdsDescribeValidDBInstanceModificationsMessage *)request
     completionHandler:(void (^)(AWSRdsDescribeValidDBInstanceModificationsResult *response, NSError *error))completionHandler {
    [[self describeValidDBInstanceModifications:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDescribeValidDBInstanceModificationsResult *> * _Nonnull task) {
        AWSRdsDescribeValidDBInstanceModificationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDownloadDBLogFilePortionDetails *> *)downloadDBLogFilePortion:(AWSRdsDownloadDBLogFilePortionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DownloadDBLogFilePortion"
                   outputClass:[AWSRdsDownloadDBLogFilePortionDetails class]];
}

- (void)downloadDBLogFilePortion:(AWSRdsDownloadDBLogFilePortionMessage *)request
     completionHandler:(void (^)(AWSRdsDownloadDBLogFilePortionDetails *response, NSError *error))completionHandler {
    [[self downloadDBLogFilePortion:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDownloadDBLogFilePortionDetails *> * _Nonnull task) {
        AWSRdsDownloadDBLogFilePortionDetails *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsFailoverDBClusterResult *> *)failoverDBCluster:(AWSRdsFailoverDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"FailoverDBCluster"
                   outputClass:[AWSRdsFailoverDBClusterResult class]];
}

- (void)failoverDBCluster:(AWSRdsFailoverDBClusterMessage *)request
     completionHandler:(void (^)(AWSRdsFailoverDBClusterResult *response, NSError *error))completionHandler {
    [[self failoverDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsFailoverDBClusterResult *> * _Nonnull task) {
        AWSRdsFailoverDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsInstallationMedia *> *)importInstallationMedia:(AWSRdsImportInstallationMediaMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportInstallationMedia"
                   outputClass:[AWSRdsInstallationMedia class]];
}

- (void)importInstallationMedia:(AWSRdsImportInstallationMediaMessage *)request
     completionHandler:(void (^)(AWSRdsInstallationMedia *response, NSError *error))completionHandler {
    [[self importInstallationMedia:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsInstallationMedia *> * _Nonnull task) {
        AWSRdsInstallationMedia *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsTagListMessage *> *)listTagsForResource:(AWSRdsListTagsForResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSRdsTagListMessage class]];
}

- (void)listTagsForResource:(AWSRdsListTagsForResourceMessage *)request
     completionHandler:(void (^)(AWSRdsTagListMessage *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsTagListMessage *> * _Nonnull task) {
        AWSRdsTagListMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyCertificatesResult *> *)modifyCertificates:(AWSRdsModifyCertificatesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyCertificates"
                   outputClass:[AWSRdsModifyCertificatesResult class]];
}

- (void)modifyCertificates:(AWSRdsModifyCertificatesMessage *)request
     completionHandler:(void (^)(AWSRdsModifyCertificatesResult *response, NSError *error))completionHandler {
    [[self modifyCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyCertificatesResult *> * _Nonnull task) {
        AWSRdsModifyCertificatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterCapacityInfo *> *)modifyCurrentDBClusterCapacity:(AWSRdsModifyCurrentDBClusterCapacityMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyCurrentDBClusterCapacity"
                   outputClass:[AWSRdsDBClusterCapacityInfo class]];
}

- (void)modifyCurrentDBClusterCapacity:(AWSRdsModifyCurrentDBClusterCapacityMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterCapacityInfo *response, NSError *error))completionHandler {
    [[self modifyCurrentDBClusterCapacity:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterCapacityInfo *> * _Nonnull task) {
        AWSRdsDBClusterCapacityInfo *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyDBClusterResult *> *)modifyDBCluster:(AWSRdsModifyDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBCluster"
                   outputClass:[AWSRdsModifyDBClusterResult class]];
}

- (void)modifyDBCluster:(AWSRdsModifyDBClusterMessage *)request
     completionHandler:(void (^)(AWSRdsModifyDBClusterResult *response, NSError *error))completionHandler {
    [[self modifyDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyDBClusterResult *> * _Nonnull task) {
        AWSRdsModifyDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterEndpoint *> *)modifyDBClusterEndpoint:(AWSRdsModifyDBClusterEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBClusterEndpoint"
                   outputClass:[AWSRdsDBClusterEndpoint class]];
}

- (void)modifyDBClusterEndpoint:(AWSRdsModifyDBClusterEndpointMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterEndpoint *response, NSError *error))completionHandler {
    [[self modifyDBClusterEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterEndpoint *> * _Nonnull task) {
        AWSRdsDBClusterEndpoint *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterParameterGroupNameMessage *> *)modifyDBClusterParameterGroup:(AWSRdsModifyDBClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBClusterParameterGroup"
                   outputClass:[AWSRdsDBClusterParameterGroupNameMessage class]];
}

- (void)modifyDBClusterParameterGroup:(AWSRdsModifyDBClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self modifyDBClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterParameterGroupNameMessage *> * _Nonnull task) {
        AWSRdsDBClusterParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyDBClusterSnapshotAttributeResult *> *)modifyDBClusterSnapshotAttribute:(AWSRdsModifyDBClusterSnapshotAttributeMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBClusterSnapshotAttribute"
                   outputClass:[AWSRdsModifyDBClusterSnapshotAttributeResult class]];
}

- (void)modifyDBClusterSnapshotAttribute:(AWSRdsModifyDBClusterSnapshotAttributeMessage *)request
     completionHandler:(void (^)(AWSRdsModifyDBClusterSnapshotAttributeResult *response, NSError *error))completionHandler {
    [[self modifyDBClusterSnapshotAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyDBClusterSnapshotAttributeResult *> * _Nonnull task) {
        AWSRdsModifyDBClusterSnapshotAttributeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyDBInstanceResult *> *)modifyDBInstance:(AWSRdsModifyDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBInstance"
                   outputClass:[AWSRdsModifyDBInstanceResult class]];
}

- (void)modifyDBInstance:(AWSRdsModifyDBInstanceMessage *)request
     completionHandler:(void (^)(AWSRdsModifyDBInstanceResult *response, NSError *error))completionHandler {
    [[self modifyDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyDBInstanceResult *> * _Nonnull task) {
        AWSRdsModifyDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBParameterGroupNameMessage *> *)modifyDBParameterGroup:(AWSRdsModifyDBParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBParameterGroup"
                   outputClass:[AWSRdsDBParameterGroupNameMessage class]];
}

- (void)modifyDBParameterGroup:(AWSRdsModifyDBParameterGroupMessage *)request
     completionHandler:(void (^)(AWSRdsDBParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self modifyDBParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBParameterGroupNameMessage *> * _Nonnull task) {
        AWSRdsDBParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyDBProxyResponse *> *)modifyDBProxy:(AWSRdsModifyDBProxyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBProxy"
                   outputClass:[AWSRdsModifyDBProxyResponse class]];
}

- (void)modifyDBProxy:(AWSRdsModifyDBProxyRequest *)request
     completionHandler:(void (^)(AWSRdsModifyDBProxyResponse *response, NSError *error))completionHandler {
    [[self modifyDBProxy:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyDBProxyResponse *> * _Nonnull task) {
        AWSRdsModifyDBProxyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyDBProxyTargetGroupResponse *> *)modifyDBProxyTargetGroup:(AWSRdsModifyDBProxyTargetGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBProxyTargetGroup"
                   outputClass:[AWSRdsModifyDBProxyTargetGroupResponse class]];
}

- (void)modifyDBProxyTargetGroup:(AWSRdsModifyDBProxyTargetGroupRequest *)request
     completionHandler:(void (^)(AWSRdsModifyDBProxyTargetGroupResponse *response, NSError *error))completionHandler {
    [[self modifyDBProxyTargetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyDBProxyTargetGroupResponse *> * _Nonnull task) {
        AWSRdsModifyDBProxyTargetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyDBSnapshotResult *> *)modifyDBSnapshot:(AWSRdsModifyDBSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBSnapshot"
                   outputClass:[AWSRdsModifyDBSnapshotResult class]];
}

- (void)modifyDBSnapshot:(AWSRdsModifyDBSnapshotMessage *)request
     completionHandler:(void (^)(AWSRdsModifyDBSnapshotResult *response, NSError *error))completionHandler {
    [[self modifyDBSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyDBSnapshotResult *> * _Nonnull task) {
        AWSRdsModifyDBSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyDBSnapshotAttributeResult *> *)modifyDBSnapshotAttribute:(AWSRdsModifyDBSnapshotAttributeMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBSnapshotAttribute"
                   outputClass:[AWSRdsModifyDBSnapshotAttributeResult class]];
}

- (void)modifyDBSnapshotAttribute:(AWSRdsModifyDBSnapshotAttributeMessage *)request
     completionHandler:(void (^)(AWSRdsModifyDBSnapshotAttributeResult *response, NSError *error))completionHandler {
    [[self modifyDBSnapshotAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyDBSnapshotAttributeResult *> * _Nonnull task) {
        AWSRdsModifyDBSnapshotAttributeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyDBSubnetGroupResult *> *)modifyDBSubnetGroup:(AWSRdsModifyDBSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBSubnetGroup"
                   outputClass:[AWSRdsModifyDBSubnetGroupResult class]];
}

- (void)modifyDBSubnetGroup:(AWSRdsModifyDBSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSRdsModifyDBSubnetGroupResult *response, NSError *error))completionHandler {
    [[self modifyDBSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyDBSubnetGroupResult *> * _Nonnull task) {
        AWSRdsModifyDBSubnetGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyEventSubscriptionResult *> *)modifyEventSubscription:(AWSRdsModifyEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyEventSubscription"
                   outputClass:[AWSRdsModifyEventSubscriptionResult class]];
}

- (void)modifyEventSubscription:(AWSRdsModifyEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSRdsModifyEventSubscriptionResult *response, NSError *error))completionHandler {
    [[self modifyEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyEventSubscriptionResult *> * _Nonnull task) {
        AWSRdsModifyEventSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyGlobalClusterResult *> *)modifyGlobalCluster:(AWSRdsModifyGlobalClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyGlobalCluster"
                   outputClass:[AWSRdsModifyGlobalClusterResult class]];
}

- (void)modifyGlobalCluster:(AWSRdsModifyGlobalClusterMessage *)request
     completionHandler:(void (^)(AWSRdsModifyGlobalClusterResult *response, NSError *error))completionHandler {
    [[self modifyGlobalCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyGlobalClusterResult *> * _Nonnull task) {
        AWSRdsModifyGlobalClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsModifyOptionGroupResult *> *)modifyOptionGroup:(AWSRdsModifyOptionGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyOptionGroup"
                   outputClass:[AWSRdsModifyOptionGroupResult class]];
}

- (void)modifyOptionGroup:(AWSRdsModifyOptionGroupMessage *)request
     completionHandler:(void (^)(AWSRdsModifyOptionGroupResult *response, NSError *error))completionHandler {
    [[self modifyOptionGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsModifyOptionGroupResult *> * _Nonnull task) {
        AWSRdsModifyOptionGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsPromoteReadReplicaResult *> *)promoteReadReplica:(AWSRdsPromoteReadReplicaMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PromoteReadReplica"
                   outputClass:[AWSRdsPromoteReadReplicaResult class]];
}

- (void)promoteReadReplica:(AWSRdsPromoteReadReplicaMessage *)request
     completionHandler:(void (^)(AWSRdsPromoteReadReplicaResult *response, NSError *error))completionHandler {
    [[self promoteReadReplica:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsPromoteReadReplicaResult *> * _Nonnull task) {
        AWSRdsPromoteReadReplicaResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsPromoteReadReplicaDBClusterResult *> *)promoteReadReplicaDBCluster:(AWSRdsPromoteReadReplicaDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PromoteReadReplicaDBCluster"
                   outputClass:[AWSRdsPromoteReadReplicaDBClusterResult class]];
}

- (void)promoteReadReplicaDBCluster:(AWSRdsPromoteReadReplicaDBClusterMessage *)request
     completionHandler:(void (^)(AWSRdsPromoteReadReplicaDBClusterResult *response, NSError *error))completionHandler {
    [[self promoteReadReplicaDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsPromoteReadReplicaDBClusterResult *> * _Nonnull task) {
        AWSRdsPromoteReadReplicaDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsPurchaseReservedDBInstancesOfferingResult *> *)purchaseReservedDBInstancesOffering:(AWSRdsPurchaseReservedDBInstancesOfferingMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PurchaseReservedDBInstancesOffering"
                   outputClass:[AWSRdsPurchaseReservedDBInstancesOfferingResult class]];
}

- (void)purchaseReservedDBInstancesOffering:(AWSRdsPurchaseReservedDBInstancesOfferingMessage *)request
     completionHandler:(void (^)(AWSRdsPurchaseReservedDBInstancesOfferingResult *response, NSError *error))completionHandler {
    [[self purchaseReservedDBInstancesOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsPurchaseReservedDBInstancesOfferingResult *> * _Nonnull task) {
        AWSRdsPurchaseReservedDBInstancesOfferingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRebootDBInstanceResult *> *)rebootDBInstance:(AWSRdsRebootDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RebootDBInstance"
                   outputClass:[AWSRdsRebootDBInstanceResult class]];
}

- (void)rebootDBInstance:(AWSRdsRebootDBInstanceMessage *)request
     completionHandler:(void (^)(AWSRdsRebootDBInstanceResult *response, NSError *error))completionHandler {
    [[self rebootDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRebootDBInstanceResult *> * _Nonnull task) {
        AWSRdsRebootDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRegisterDBProxyTargetsResponse *> *)registerDBProxyTargets:(AWSRdsRegisterDBProxyTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterDBProxyTargets"
                   outputClass:[AWSRdsRegisterDBProxyTargetsResponse class]];
}

- (void)registerDBProxyTargets:(AWSRdsRegisterDBProxyTargetsRequest *)request
     completionHandler:(void (^)(AWSRdsRegisterDBProxyTargetsResponse *response, NSError *error))completionHandler {
    [[self registerDBProxyTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRegisterDBProxyTargetsResponse *> * _Nonnull task) {
        AWSRdsRegisterDBProxyTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRemoveFromGlobalClusterResult *> *)removeFromGlobalCluster:(AWSRdsRemoveFromGlobalClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveFromGlobalCluster"
                   outputClass:[AWSRdsRemoveFromGlobalClusterResult class]];
}

- (void)removeFromGlobalCluster:(AWSRdsRemoveFromGlobalClusterMessage *)request
     completionHandler:(void (^)(AWSRdsRemoveFromGlobalClusterResult *response, NSError *error))completionHandler {
    [[self removeFromGlobalCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRemoveFromGlobalClusterResult *> * _Nonnull task) {
        AWSRdsRemoveFromGlobalClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)removeRoleFromDBCluster:(AWSRdsRemoveRoleFromDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveRoleFromDBCluster"
                   outputClass:nil];
}

- (void)removeRoleFromDBCluster:(AWSRdsRemoveRoleFromDBClusterMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeRoleFromDBCluster:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)removeRoleFromDBInstance:(AWSRdsRemoveRoleFromDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveRoleFromDBInstance"
                   outputClass:nil];
}

- (void)removeRoleFromDBInstance:(AWSRdsRemoveRoleFromDBInstanceMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeRoleFromDBInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRemoveSourceIdentifierFromSubscriptionResult *> *)removeSourceIdentifierFromSubscription:(AWSRdsRemoveSourceIdentifierFromSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveSourceIdentifierFromSubscription"
                   outputClass:[AWSRdsRemoveSourceIdentifierFromSubscriptionResult class]];
}

- (void)removeSourceIdentifierFromSubscription:(AWSRdsRemoveSourceIdentifierFromSubscriptionMessage *)request
     completionHandler:(void (^)(AWSRdsRemoveSourceIdentifierFromSubscriptionResult *response, NSError *error))completionHandler {
    [[self removeSourceIdentifierFromSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRemoveSourceIdentifierFromSubscriptionResult *> * _Nonnull task) {
        AWSRdsRemoveSourceIdentifierFromSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)removeTagsFromResource:(AWSRdsRemoveTagsFromResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveTagsFromResource"
                   outputClass:nil];
}

- (void)removeTagsFromResource:(AWSRdsRemoveTagsFromResourceMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeTagsFromResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBClusterParameterGroupNameMessage *> *)resetDBClusterParameterGroup:(AWSRdsResetDBClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetDBClusterParameterGroup"
                   outputClass:[AWSRdsDBClusterParameterGroupNameMessage class]];
}

- (void)resetDBClusterParameterGroup:(AWSRdsResetDBClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSRdsDBClusterParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self resetDBClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBClusterParameterGroupNameMessage *> * _Nonnull task) {
        AWSRdsDBClusterParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsDBParameterGroupNameMessage *> *)resetDBParameterGroup:(AWSRdsResetDBParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetDBParameterGroup"
                   outputClass:[AWSRdsDBParameterGroupNameMessage class]];
}

- (void)resetDBParameterGroup:(AWSRdsResetDBParameterGroupMessage *)request
     completionHandler:(void (^)(AWSRdsDBParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self resetDBParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsDBParameterGroupNameMessage *> * _Nonnull task) {
        AWSRdsDBParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRestoreDBClusterFromS3Result *> *)restoreDBClusterFromS3:(AWSRdsRestoreDBClusterFromS3Message *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBClusterFromS3"
                   outputClass:[AWSRdsRestoreDBClusterFromS3Result class]];
}

- (void)restoreDBClusterFromS3:(AWSRdsRestoreDBClusterFromS3Message *)request
     completionHandler:(void (^)(AWSRdsRestoreDBClusterFromS3Result *response, NSError *error))completionHandler {
    [[self restoreDBClusterFromS3:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRestoreDBClusterFromS3Result *> * _Nonnull task) {
        AWSRdsRestoreDBClusterFromS3Result *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRestoreDBClusterFromSnapshotResult *> *)restoreDBClusterFromSnapshot:(AWSRdsRestoreDBClusterFromSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBClusterFromSnapshot"
                   outputClass:[AWSRdsRestoreDBClusterFromSnapshotResult class]];
}

- (void)restoreDBClusterFromSnapshot:(AWSRdsRestoreDBClusterFromSnapshotMessage *)request
     completionHandler:(void (^)(AWSRdsRestoreDBClusterFromSnapshotResult *response, NSError *error))completionHandler {
    [[self restoreDBClusterFromSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRestoreDBClusterFromSnapshotResult *> * _Nonnull task) {
        AWSRdsRestoreDBClusterFromSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRestoreDBClusterToPointInTimeResult *> *)restoreDBClusterToPointInTime:(AWSRdsRestoreDBClusterToPointInTimeMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBClusterToPointInTime"
                   outputClass:[AWSRdsRestoreDBClusterToPointInTimeResult class]];
}

- (void)restoreDBClusterToPointInTime:(AWSRdsRestoreDBClusterToPointInTimeMessage *)request
     completionHandler:(void (^)(AWSRdsRestoreDBClusterToPointInTimeResult *response, NSError *error))completionHandler {
    [[self restoreDBClusterToPointInTime:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRestoreDBClusterToPointInTimeResult *> * _Nonnull task) {
        AWSRdsRestoreDBClusterToPointInTimeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRestoreDBInstanceFromDBSnapshotResult *> *)restoreDBInstanceFromDBSnapshot:(AWSRdsRestoreDBInstanceFromDBSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBInstanceFromDBSnapshot"
                   outputClass:[AWSRdsRestoreDBInstanceFromDBSnapshotResult class]];
}

- (void)restoreDBInstanceFromDBSnapshot:(AWSRdsRestoreDBInstanceFromDBSnapshotMessage *)request
     completionHandler:(void (^)(AWSRdsRestoreDBInstanceFromDBSnapshotResult *response, NSError *error))completionHandler {
    [[self restoreDBInstanceFromDBSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRestoreDBInstanceFromDBSnapshotResult *> * _Nonnull task) {
        AWSRdsRestoreDBInstanceFromDBSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRestoreDBInstanceFromS3Result *> *)restoreDBInstanceFromS3:(AWSRdsRestoreDBInstanceFromS3Message *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBInstanceFromS3"
                   outputClass:[AWSRdsRestoreDBInstanceFromS3Result class]];
}

- (void)restoreDBInstanceFromS3:(AWSRdsRestoreDBInstanceFromS3Message *)request
     completionHandler:(void (^)(AWSRdsRestoreDBInstanceFromS3Result *response, NSError *error))completionHandler {
    [[self restoreDBInstanceFromS3:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRestoreDBInstanceFromS3Result *> * _Nonnull task) {
        AWSRdsRestoreDBInstanceFromS3Result *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRestoreDBInstanceToPointInTimeResult *> *)restoreDBInstanceToPointInTime:(AWSRdsRestoreDBInstanceToPointInTimeMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBInstanceToPointInTime"
                   outputClass:[AWSRdsRestoreDBInstanceToPointInTimeResult class]];
}

- (void)restoreDBInstanceToPointInTime:(AWSRdsRestoreDBInstanceToPointInTimeMessage *)request
     completionHandler:(void (^)(AWSRdsRestoreDBInstanceToPointInTimeResult *response, NSError *error))completionHandler {
    [[self restoreDBInstanceToPointInTime:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRestoreDBInstanceToPointInTimeResult *> * _Nonnull task) {
        AWSRdsRestoreDBInstanceToPointInTimeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsRevokeDBSecurityGroupIngressResult *> *)revokeDBSecurityGroupIngress:(AWSRdsRevokeDBSecurityGroupIngressMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeDBSecurityGroupIngress"
                   outputClass:[AWSRdsRevokeDBSecurityGroupIngressResult class]];
}

- (void)revokeDBSecurityGroupIngress:(AWSRdsRevokeDBSecurityGroupIngressMessage *)request
     completionHandler:(void (^)(AWSRdsRevokeDBSecurityGroupIngressResult *response, NSError *error))completionHandler {
    [[self revokeDBSecurityGroupIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsRevokeDBSecurityGroupIngressResult *> * _Nonnull task) {
        AWSRdsRevokeDBSecurityGroupIngressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsStartActivityStreamResponse *> *)startActivityStream:(AWSRdsStartActivityStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartActivityStream"
                   outputClass:[AWSRdsStartActivityStreamResponse class]];
}

- (void)startActivityStream:(AWSRdsStartActivityStreamRequest *)request
     completionHandler:(void (^)(AWSRdsStartActivityStreamResponse *response, NSError *error))completionHandler {
    [[self startActivityStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsStartActivityStreamResponse *> * _Nonnull task) {
        AWSRdsStartActivityStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsStartDBClusterResult *> *)startDBCluster:(AWSRdsStartDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartDBCluster"
                   outputClass:[AWSRdsStartDBClusterResult class]];
}

- (void)startDBCluster:(AWSRdsStartDBClusterMessage *)request
     completionHandler:(void (^)(AWSRdsStartDBClusterResult *response, NSError *error))completionHandler {
    [[self startDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsStartDBClusterResult *> * _Nonnull task) {
        AWSRdsStartDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsStartDBInstanceResult *> *)startDBInstance:(AWSRdsStartDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartDBInstance"
                   outputClass:[AWSRdsStartDBInstanceResult class]];
}

- (void)startDBInstance:(AWSRdsStartDBInstanceMessage *)request
     completionHandler:(void (^)(AWSRdsStartDBInstanceResult *response, NSError *error))completionHandler {
    [[self startDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsStartDBInstanceResult *> * _Nonnull task) {
        AWSRdsStartDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsExportTask *> *)startExportTask:(AWSRdsStartExportTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartExportTask"
                   outputClass:[AWSRdsExportTask class]];
}

- (void)startExportTask:(AWSRdsStartExportTaskMessage *)request
     completionHandler:(void (^)(AWSRdsExportTask *response, NSError *error))completionHandler {
    [[self startExportTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsExportTask *> * _Nonnull task) {
        AWSRdsExportTask *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsStopActivityStreamResponse *> *)stopActivityStream:(AWSRdsStopActivityStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StopActivityStream"
                   outputClass:[AWSRdsStopActivityStreamResponse class]];
}

- (void)stopActivityStream:(AWSRdsStopActivityStreamRequest *)request
     completionHandler:(void (^)(AWSRdsStopActivityStreamResponse *response, NSError *error))completionHandler {
    [[self stopActivityStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsStopActivityStreamResponse *> * _Nonnull task) {
        AWSRdsStopActivityStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsStopDBClusterResult *> *)stopDBCluster:(AWSRdsStopDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StopDBCluster"
                   outputClass:[AWSRdsStopDBClusterResult class]];
}

- (void)stopDBCluster:(AWSRdsStopDBClusterMessage *)request
     completionHandler:(void (^)(AWSRdsStopDBClusterResult *response, NSError *error))completionHandler {
    [[self stopDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsStopDBClusterResult *> * _Nonnull task) {
        AWSRdsStopDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSRdsStopDBInstanceResult *> *)stopDBInstance:(AWSRdsStopDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StopDBInstance"
                   outputClass:[AWSRdsStopDBInstanceResult class]];
}

- (void)stopDBInstance:(AWSRdsStopDBInstanceMessage *)request
     completionHandler:(void (^)(AWSRdsStopDBInstanceResult *response, NSError *error))completionHandler {
    [[self stopDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSRdsStopDBInstanceResult *> * _Nonnull task) {
        AWSRdsStopDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
