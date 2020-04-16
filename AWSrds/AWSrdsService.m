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

#import "AWSrdsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSrdsResources.h"

static NSString *const AWSInfords = @"rds";
NSString *const AWSrdsSDKVersion = @"2.13.2";


@interface AWSrdsResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSrdsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AuthorizationAlreadyExists" : @(AWSrdsErrorAuthorizationAlreadyExists),
                            @"AuthorizationNotFound" : @(AWSrdsErrorAuthorizationNotFound),
                            @"AuthorizationQuotaExceeded" : @(AWSrdsErrorAuthorizationQuotaExceeded),
                            @"BackupPolicyNotFoundFault" : @(AWSrdsErrorBackupPolicyNotFound),
                            @"CertificateNotFound" : @(AWSrdsErrorCertificateNotFound),
                            @"CustomAvailabilityZoneAlreadyExists" : @(AWSrdsErrorCustomAvailabilityZoneAlreadyExists),
                            @"CustomAvailabilityZoneNotFound" : @(AWSrdsErrorCustomAvailabilityZoneNotFound),
                            @"CustomAvailabilityZoneQuotaExceeded" : @(AWSrdsErrorCustomAvailabilityZoneQuotaExceeded),
                            @"DBClusterAlreadyExistsFault" : @(AWSrdsErrorDBClusterAlreadyExists),
                            @"DBClusterBacktrackNotFoundFault" : @(AWSrdsErrorDBClusterBacktrackNotFound),
                            @"DBClusterEndpointAlreadyExistsFault" : @(AWSrdsErrorDBClusterEndpointAlreadyExists),
                            @"DBClusterEndpointNotFoundFault" : @(AWSrdsErrorDBClusterEndpointNotFound),
                            @"DBClusterEndpointQuotaExceededFault" : @(AWSrdsErrorDBClusterEndpointQuotaExceeded),
                            @"DBClusterNotFoundFault" : @(AWSrdsErrorDBClusterNotFound),
                            @"DBClusterParameterGroupNotFound" : @(AWSrdsErrorDBClusterParameterGroupNotFound),
                            @"DBClusterQuotaExceededFault" : @(AWSrdsErrorDBClusterQuotaExceeded),
                            @"DBClusterRoleAlreadyExists" : @(AWSrdsErrorDBClusterRoleAlreadyExists),
                            @"DBClusterRoleNotFound" : @(AWSrdsErrorDBClusterRoleNotFound),
                            @"DBClusterRoleQuotaExceeded" : @(AWSrdsErrorDBClusterRoleQuotaExceeded),
                            @"DBClusterSnapshotAlreadyExistsFault" : @(AWSrdsErrorDBClusterSnapshotAlreadyExists),
                            @"DBClusterSnapshotNotFoundFault" : @(AWSrdsErrorDBClusterSnapshotNotFound),
                            @"DBInstanceAlreadyExists" : @(AWSrdsErrorDBInstanceAlreadyExists),
                            @"DBInstanceAutomatedBackupNotFound" : @(AWSrdsErrorDBInstanceAutomatedBackupNotFound),
                            @"DBInstanceAutomatedBackupQuotaExceeded" : @(AWSrdsErrorDBInstanceAutomatedBackupQuotaExceeded),
                            @"DBInstanceNotFound" : @(AWSrdsErrorDBInstanceNotFound),
                            @"DBInstanceRoleAlreadyExists" : @(AWSrdsErrorDBInstanceRoleAlreadyExists),
                            @"DBInstanceRoleNotFound" : @(AWSrdsErrorDBInstanceRoleNotFound),
                            @"DBInstanceRoleQuotaExceeded" : @(AWSrdsErrorDBInstanceRoleQuotaExceeded),
                            @"DBLogFileNotFoundFault" : @(AWSrdsErrorDBLogFileNotFound),
                            @"DBParameterGroupAlreadyExists" : @(AWSrdsErrorDBParameterGroupAlreadyExists),
                            @"DBParameterGroupNotFound" : @(AWSrdsErrorDBParameterGroupNotFound),
                            @"DBParameterGroupQuotaExceeded" : @(AWSrdsErrorDBParameterGroupQuotaExceeded),
                            @"DBProxyTargetExistsFault" : @(AWSrdsErrorDBProxyAlreadyExists),
                            @"DBProxyNotFoundFault" : @(AWSrdsErrorDBProxyNotFound),
                            @"DBProxyQuotaExceededFault" : @(AWSrdsErrorDBProxyQuotaExceeded),
                            @"DBProxyTargetAlreadyRegisteredFault" : @(AWSrdsErrorDBProxyTargetAlreadyRegistered),
                            @"DBProxyTargetGroupNotFoundFault" : @(AWSrdsErrorDBProxyTargetGroupNotFound),
                            @"DBProxyTargetNotFoundFault" : @(AWSrdsErrorDBProxyTargetNotFound),
                            @"DBSecurityGroupAlreadyExists" : @(AWSrdsErrorDBSecurityGroupAlreadyExists),
                            @"DBSecurityGroupNotFound" : @(AWSrdsErrorDBSecurityGroupNotFound),
                            @"DBSecurityGroupNotSupported" : @(AWSrdsErrorDBSecurityGroupNotSupported),
                            @"QuotaExceeded.DBSecurityGroup" : @(AWSrdsErrorDBSecurityGroupQuotaExceeded),
                            @"DBSnapshotAlreadyExists" : @(AWSrdsErrorDBSnapshotAlreadyExists),
                            @"DBSnapshotNotFound" : @(AWSrdsErrorDBSnapshotNotFound),
                            @"DBSubnetGroupAlreadyExists" : @(AWSrdsErrorDBSubnetGroupAlreadyExists),
                            @"DBSubnetGroupDoesNotCoverEnoughAZs" : @(AWSrdsErrorDBSubnetGroupDoesNotCoverEnoughAZs),
                            @"DBSubnetGroupNotAllowedFault" : @(AWSrdsErrorDBSubnetGroupNotAllowed),
                            @"DBSubnetGroupNotFoundFault" : @(AWSrdsErrorDBSubnetGroupNotFound),
                            @"DBSubnetGroupQuotaExceeded" : @(AWSrdsErrorDBSubnetGroupQuotaExceeded),
                            @"DBSubnetQuotaExceededFault" : @(AWSrdsErrorDBSubnetQuotaExceeded),
                            @"DBUpgradeDependencyFailure" : @(AWSrdsErrorDBUpgradeDependencyFailure),
                            @"DomainNotFoundFault" : @(AWSrdsErrorDomainNotFound),
                            @"EventSubscriptionQuotaExceeded" : @(AWSrdsErrorEventSubscriptionQuotaExceeded),
                            @"ExportTaskAlreadyExists" : @(AWSrdsErrorExportTaskAlreadyExists),
                            @"ExportTaskNotFound" : @(AWSrdsErrorExportTaskNotFound),
                            @"GlobalClusterAlreadyExistsFault" : @(AWSrdsErrorGlobalClusterAlreadyExists),
                            @"GlobalClusterNotFoundFault" : @(AWSrdsErrorGlobalClusterNotFound),
                            @"GlobalClusterQuotaExceededFault" : @(AWSrdsErrorGlobalClusterQuotaExceeded),
                            @"IamRoleMissingPermissions" : @(AWSrdsErrorIamRoleMissingPermissions),
                            @"IamRoleNotFound" : @(AWSrdsErrorIamRoleNotFound),
                            @"InstallationMediaAlreadyExists" : @(AWSrdsErrorInstallationMediaAlreadyExists),
                            @"InstallationMediaNotFound" : @(AWSrdsErrorInstallationMediaNotFound),
                            @"InstanceQuotaExceeded" : @(AWSrdsErrorInstanceQuotaExceeded),
                            @"InsufficientDBClusterCapacityFault" : @(AWSrdsErrorInsufficientDBClusterCapacity),
                            @"InsufficientDBInstanceCapacity" : @(AWSrdsErrorInsufficientDBInstanceCapacity),
                            @"InsufficientStorageClusterCapacity" : @(AWSrdsErrorInsufficientStorageClusterCapacity),
                            @"InvalidDBClusterCapacityFault" : @(AWSrdsErrorInvalidDBClusterCapacity),
                            @"InvalidDBClusterEndpointStateFault" : @(AWSrdsErrorInvalidDBClusterEndpointState),
                            @"InvalidDBClusterSnapshotStateFault" : @(AWSrdsErrorInvalidDBClusterSnapshotState),
                            @"InvalidDBClusterStateFault" : @(AWSrdsErrorInvalidDBClusterState),
                            @"InvalidDBInstanceAutomatedBackupState" : @(AWSrdsErrorInvalidDBInstanceAutomatedBackupState),
                            @"InvalidDBInstanceState" : @(AWSrdsErrorInvalidDBInstanceState),
                            @"InvalidDBParameterGroupState" : @(AWSrdsErrorInvalidDBParameterGroupState),
                            @"InvalidDBProxyStateFault" : @(AWSrdsErrorInvalidDBProxyState),
                            @"InvalidDBSecurityGroupState" : @(AWSrdsErrorInvalidDBSecurityGroupState),
                            @"InvalidDBSnapshotState" : @(AWSrdsErrorInvalidDBSnapshotState),
                            @"InvalidDBSubnetGroupFault" : @(AWSrdsErrorInvalidDBSubnetGroup),
                            @"InvalidDBSubnetGroupStateFault" : @(AWSrdsErrorInvalidDBSubnetGroupState),
                            @"InvalidDBSubnetStateFault" : @(AWSrdsErrorInvalidDBSubnetState),
                            @"InvalidEventSubscriptionState" : @(AWSrdsErrorInvalidEventSubscriptionState),
                            @"InvalidExportOnly" : @(AWSrdsErrorInvalidExportOnly),
                            @"InvalidExportSourceState" : @(AWSrdsErrorInvalidExportSourceState),
                            @"InvalidExportTaskStateFault" : @(AWSrdsErrorInvalidExportTaskState),
                            @"InvalidGlobalClusterStateFault" : @(AWSrdsErrorInvalidGlobalClusterState),
                            @"InvalidOptionGroupStateFault" : @(AWSrdsErrorInvalidOptionGroupState),
                            @"InvalidRestoreFault" : @(AWSrdsErrorInvalidRestore),
                            @"InvalidS3BucketFault" : @(AWSrdsErrorInvalidS3Bucket),
                            @"InvalidSubnet" : @(AWSrdsErrorInvalidSubnet),
                            @"InvalidVPCNetworkStateFault" : @(AWSrdsErrorInvalidVPCNetworkState),
                            @"KMSKeyNotAccessibleFault" : @(AWSrdsErrorKMSKeyNotAccessible),
                            @"OptionGroupAlreadyExistsFault" : @(AWSrdsErrorOptionGroupAlreadyExists),
                            @"OptionGroupNotFoundFault" : @(AWSrdsErrorOptionGroupNotFound),
                            @"OptionGroupQuotaExceededFault" : @(AWSrdsErrorOptionGroupQuotaExceeded),
                            @"PointInTimeRestoreNotEnabled" : @(AWSrdsErrorPointInTimeRestoreNotEnabled),
                            @"ProvisionedIopsNotAvailableInAZFault" : @(AWSrdsErrorProvisionedIopsNotAvailableInAZ),
                            @"ReservedDBInstanceAlreadyExists" : @(AWSrdsErrorReservedDBInstanceAlreadyExists),
                            @"ReservedDBInstanceNotFound" : @(AWSrdsErrorReservedDBInstanceNotFound),
                            @"ReservedDBInstanceQuotaExceeded" : @(AWSrdsErrorReservedDBInstanceQuotaExceeded),
                            @"ReservedDBInstancesOfferingNotFound" : @(AWSrdsErrorReservedDBInstancesOfferingNotFound),
                            @"ResourceNotFoundFault" : @(AWSrdsErrorResourceNotFound),
                            @"SNSInvalidTopic" : @(AWSrdsErrorSNSInvalidTopic),
                            @"SNSNoAuthorization" : @(AWSrdsErrorSNSNoAuthorization),
                            @"SNSTopicArnNotFound" : @(AWSrdsErrorSNSTopicArnNotFound),
                            @"SharedSnapshotQuotaExceeded" : @(AWSrdsErrorSharedSnapshotQuotaExceeded),
                            @"SnapshotQuotaExceeded" : @(AWSrdsErrorSnapshotQuotaExceeded),
                            @"SourceNotFound" : @(AWSrdsErrorSourceNotFound),
                            @"StorageQuotaExceeded" : @(AWSrdsErrorStorageQuotaExceeded),
                            @"StorageTypeNotSupported" : @(AWSrdsErrorStorageTypeNotSupported),
                            @"SubnetAlreadyInUse" : @(AWSrdsErrorSubnetAlreadyInUse),
                            @"SubscriptionAlreadyExist" : @(AWSrdsErrorSubscriptionAlreadyExist),
                            @"SubscriptionCategoryNotFound" : @(AWSrdsErrorSubscriptionCategoryNotFound),
                            @"SubscriptionNotFound" : @(AWSrdsErrorSubscriptionNotFound),
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
                *error = [NSError errorWithDomain:AWSrdsErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                         ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSrdsErrorDomain
                                             code:AWSrdsErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSrdsErrorDomain
                                     code:AWSrdsErrorUnknown
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

@interface AWSrdsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSrdsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSrds()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSrds

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSrdsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSrds versions need to match. Check your SDK installation. AWSCore: %@ AWSrds: %@", AWSiOSSDKVersion, AWSrdsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultrds {
    static AWSrds *_defaultrds = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfords];
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
        _defaultrds = [[AWSrds alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultrds;
}

+ (void)registerrdsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSrds alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)rdsForKey:(NSString *)key {
    @synchronized(self) {
        AWSrds *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfords
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSrds registerrdsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removerdsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultrds` or `+ rdsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicerds
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicerds];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSrdsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSrdsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSrdsResponseSerializer alloc] initWithJSONDefinition:[[AWSrdsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)addRoleToDBCluster:(AWSrdsAddRoleToDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddRoleToDBCluster"
                   outputClass:nil];
}

- (void)addRoleToDBCluster:(AWSrdsAddRoleToDBClusterMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addRoleToDBCluster:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)addRoleToDBInstance:(AWSrdsAddRoleToDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddRoleToDBInstance"
                   outputClass:nil];
}

- (void)addRoleToDBInstance:(AWSrdsAddRoleToDBInstanceMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addRoleToDBInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsAddSourceIdentifierToSubscriptionResult *> *)addSourceIdentifierToSubscription:(AWSrdsAddSourceIdentifierToSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddSourceIdentifierToSubscription"
                   outputClass:[AWSrdsAddSourceIdentifierToSubscriptionResult class]];
}

- (void)addSourceIdentifierToSubscription:(AWSrdsAddSourceIdentifierToSubscriptionMessage *)request
     completionHandler:(void (^)(AWSrdsAddSourceIdentifierToSubscriptionResult *response, NSError *error))completionHandler {
    [[self addSourceIdentifierToSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsAddSourceIdentifierToSubscriptionResult *> * _Nonnull task) {
        AWSrdsAddSourceIdentifierToSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)addTagsToResource:(AWSrdsAddTagsToResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddTagsToResource"
                   outputClass:nil];
}

- (void)addTagsToResource:(AWSrdsAddTagsToResourceMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addTagsToResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsApplyPendingMaintenanceActionResult *> *)applyPendingMaintenanceAction:(AWSrdsApplyPendingMaintenanceActionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ApplyPendingMaintenanceAction"
                   outputClass:[AWSrdsApplyPendingMaintenanceActionResult class]];
}

- (void)applyPendingMaintenanceAction:(AWSrdsApplyPendingMaintenanceActionMessage *)request
     completionHandler:(void (^)(AWSrdsApplyPendingMaintenanceActionResult *response, NSError *error))completionHandler {
    [[self applyPendingMaintenanceAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsApplyPendingMaintenanceActionResult *> * _Nonnull task) {
        AWSrdsApplyPendingMaintenanceActionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsAuthorizeDBSecurityGroupIngressResult *> *)authorizeDBSecurityGroupIngress:(AWSrdsAuthorizeDBSecurityGroupIngressMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeDBSecurityGroupIngress"
                   outputClass:[AWSrdsAuthorizeDBSecurityGroupIngressResult class]];
}

- (void)authorizeDBSecurityGroupIngress:(AWSrdsAuthorizeDBSecurityGroupIngressMessage *)request
     completionHandler:(void (^)(AWSrdsAuthorizeDBSecurityGroupIngressResult *response, NSError *error))completionHandler {
    [[self authorizeDBSecurityGroupIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsAuthorizeDBSecurityGroupIngressResult *> * _Nonnull task) {
        AWSrdsAuthorizeDBSecurityGroupIngressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterBacktrack *> *)backtrackDBCluster:(AWSrdsBacktrackDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BacktrackDBCluster"
                   outputClass:[AWSrdsDBClusterBacktrack class]];
}

- (void)backtrackDBCluster:(AWSrdsBacktrackDBClusterMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterBacktrack *response, NSError *error))completionHandler {
    [[self backtrackDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterBacktrack *> * _Nonnull task) {
        AWSrdsDBClusterBacktrack *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsExportTask *> *)cancelExportTask:(AWSrdsCancelExportTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelExportTask"
                   outputClass:[AWSrdsExportTask class]];
}

- (void)cancelExportTask:(AWSrdsCancelExportTaskMessage *)request
     completionHandler:(void (^)(AWSrdsExportTask *response, NSError *error))completionHandler {
    [[self cancelExportTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsExportTask *> * _Nonnull task) {
        AWSrdsExportTask *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsReplicateDBClusterParameterGroupResult *> *)replicateDBClusterParameterGroup:(AWSrdsReplicateDBClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyDBClusterParameterGroup"
                   outputClass:[AWSrdsReplicateDBClusterParameterGroupResult class]];
}

- (void)replicateDBClusterParameterGroup:(AWSrdsReplicateDBClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSrdsReplicateDBClusterParameterGroupResult *response, NSError *error))completionHandler {
    [[self replicateDBClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsReplicateDBClusterParameterGroupResult *> * _Nonnull task) {
        AWSrdsReplicateDBClusterParameterGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsReplicateDBClusterSnapshotResult *> *)replicateDBClusterSnapshot:(AWSrdsReplicateDBClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyDBClusterSnapshot"
                   outputClass:[AWSrdsReplicateDBClusterSnapshotResult class]];
}

- (void)replicateDBClusterSnapshot:(AWSrdsReplicateDBClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSrdsReplicateDBClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self replicateDBClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsReplicateDBClusterSnapshotResult *> * _Nonnull task) {
        AWSrdsReplicateDBClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsReplicateDBParameterGroupResult *> *)replicateDBParameterGroup:(AWSrdsReplicateDBParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyDBParameterGroup"
                   outputClass:[AWSrdsReplicateDBParameterGroupResult class]];
}

- (void)replicateDBParameterGroup:(AWSrdsReplicateDBParameterGroupMessage *)request
     completionHandler:(void (^)(AWSrdsReplicateDBParameterGroupResult *response, NSError *error))completionHandler {
    [[self replicateDBParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsReplicateDBParameterGroupResult *> * _Nonnull task) {
        AWSrdsReplicateDBParameterGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsReplicateDBSnapshotResult *> *)replicateDBSnapshot:(AWSrdsReplicateDBSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyDBSnapshot"
                   outputClass:[AWSrdsReplicateDBSnapshotResult class]];
}

- (void)replicateDBSnapshot:(AWSrdsReplicateDBSnapshotMessage *)request
     completionHandler:(void (^)(AWSrdsReplicateDBSnapshotResult *response, NSError *error))completionHandler {
    [[self replicateDBSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsReplicateDBSnapshotResult *> * _Nonnull task) {
        AWSrdsReplicateDBSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsReplicateOptionGroupResult *> *)replicateOptionGroup:(AWSrdsReplicateOptionGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyOptionGroup"
                   outputClass:[AWSrdsReplicateOptionGroupResult class]];
}

- (void)replicateOptionGroup:(AWSrdsReplicateOptionGroupMessage *)request
     completionHandler:(void (^)(AWSrdsReplicateOptionGroupResult *response, NSError *error))completionHandler {
    [[self replicateOptionGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsReplicateOptionGroupResult *> * _Nonnull task) {
        AWSrdsReplicateOptionGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateCustomAvailabilityZoneResult *> *)createCustomAvailabilityZone:(AWSrdsCreateCustomAvailabilityZoneMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCustomAvailabilityZone"
                   outputClass:[AWSrdsCreateCustomAvailabilityZoneResult class]];
}

- (void)createCustomAvailabilityZone:(AWSrdsCreateCustomAvailabilityZoneMessage *)request
     completionHandler:(void (^)(AWSrdsCreateCustomAvailabilityZoneResult *response, NSError *error))completionHandler {
    [[self createCustomAvailabilityZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateCustomAvailabilityZoneResult *> * _Nonnull task) {
        AWSrdsCreateCustomAvailabilityZoneResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateDBClusterResult *> *)createDBCluster:(AWSrdsCreateDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBCluster"
                   outputClass:[AWSrdsCreateDBClusterResult class]];
}

- (void)createDBCluster:(AWSrdsCreateDBClusterMessage *)request
     completionHandler:(void (^)(AWSrdsCreateDBClusterResult *response, NSError *error))completionHandler {
    [[self createDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateDBClusterResult *> * _Nonnull task) {
        AWSrdsCreateDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterEndpoint *> *)createDBClusterEndpoint:(AWSrdsCreateDBClusterEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBClusterEndpoint"
                   outputClass:[AWSrdsDBClusterEndpoint class]];
}

- (void)createDBClusterEndpoint:(AWSrdsCreateDBClusterEndpointMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterEndpoint *response, NSError *error))completionHandler {
    [[self createDBClusterEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterEndpoint *> * _Nonnull task) {
        AWSrdsDBClusterEndpoint *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateDBClusterParameterGroupResult *> *)createDBClusterParameterGroup:(AWSrdsCreateDBClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBClusterParameterGroup"
                   outputClass:[AWSrdsCreateDBClusterParameterGroupResult class]];
}

- (void)createDBClusterParameterGroup:(AWSrdsCreateDBClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSrdsCreateDBClusterParameterGroupResult *response, NSError *error))completionHandler {
    [[self createDBClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateDBClusterParameterGroupResult *> * _Nonnull task) {
        AWSrdsCreateDBClusterParameterGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateDBClusterSnapshotResult *> *)createDBClusterSnapshot:(AWSrdsCreateDBClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBClusterSnapshot"
                   outputClass:[AWSrdsCreateDBClusterSnapshotResult class]];
}

- (void)createDBClusterSnapshot:(AWSrdsCreateDBClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSrdsCreateDBClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self createDBClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateDBClusterSnapshotResult *> * _Nonnull task) {
        AWSrdsCreateDBClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateDBInstanceResult *> *)createDBInstance:(AWSrdsCreateDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBInstance"
                   outputClass:[AWSrdsCreateDBInstanceResult class]];
}

- (void)createDBInstance:(AWSrdsCreateDBInstanceMessage *)request
     completionHandler:(void (^)(AWSrdsCreateDBInstanceResult *response, NSError *error))completionHandler {
    [[self createDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateDBInstanceResult *> * _Nonnull task) {
        AWSrdsCreateDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateDBInstanceReadReplicaResult *> *)createDBInstanceReadReplica:(AWSrdsCreateDBInstanceReadReplicaMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBInstanceReadReplica"
                   outputClass:[AWSrdsCreateDBInstanceReadReplicaResult class]];
}

- (void)createDBInstanceReadReplica:(AWSrdsCreateDBInstanceReadReplicaMessage *)request
     completionHandler:(void (^)(AWSrdsCreateDBInstanceReadReplicaResult *response, NSError *error))completionHandler {
    [[self createDBInstanceReadReplica:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateDBInstanceReadReplicaResult *> * _Nonnull task) {
        AWSrdsCreateDBInstanceReadReplicaResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateDBParameterGroupResult *> *)createDBParameterGroup:(AWSrdsCreateDBParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBParameterGroup"
                   outputClass:[AWSrdsCreateDBParameterGroupResult class]];
}

- (void)createDBParameterGroup:(AWSrdsCreateDBParameterGroupMessage *)request
     completionHandler:(void (^)(AWSrdsCreateDBParameterGroupResult *response, NSError *error))completionHandler {
    [[self createDBParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateDBParameterGroupResult *> * _Nonnull task) {
        AWSrdsCreateDBParameterGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateDBProxyResponse *> *)createDBProxy:(AWSrdsCreateDBProxyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBProxy"
                   outputClass:[AWSrdsCreateDBProxyResponse class]];
}

- (void)createDBProxy:(AWSrdsCreateDBProxyRequest *)request
     completionHandler:(void (^)(AWSrdsCreateDBProxyResponse *response, NSError *error))completionHandler {
    [[self createDBProxy:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateDBProxyResponse *> * _Nonnull task) {
        AWSrdsCreateDBProxyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateDBSecurityGroupResult *> *)createDBSecurityGroup:(AWSrdsCreateDBSecurityGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBSecurityGroup"
                   outputClass:[AWSrdsCreateDBSecurityGroupResult class]];
}

- (void)createDBSecurityGroup:(AWSrdsCreateDBSecurityGroupMessage *)request
     completionHandler:(void (^)(AWSrdsCreateDBSecurityGroupResult *response, NSError *error))completionHandler {
    [[self createDBSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateDBSecurityGroupResult *> * _Nonnull task) {
        AWSrdsCreateDBSecurityGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateDBSnapshotResult *> *)createDBSnapshot:(AWSrdsCreateDBSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBSnapshot"
                   outputClass:[AWSrdsCreateDBSnapshotResult class]];
}

- (void)createDBSnapshot:(AWSrdsCreateDBSnapshotMessage *)request
     completionHandler:(void (^)(AWSrdsCreateDBSnapshotResult *response, NSError *error))completionHandler {
    [[self createDBSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateDBSnapshotResult *> * _Nonnull task) {
        AWSrdsCreateDBSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateDBSubnetGroupResult *> *)createDBSubnetGroup:(AWSrdsCreateDBSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDBSubnetGroup"
                   outputClass:[AWSrdsCreateDBSubnetGroupResult class]];
}

- (void)createDBSubnetGroup:(AWSrdsCreateDBSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSrdsCreateDBSubnetGroupResult *response, NSError *error))completionHandler {
    [[self createDBSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateDBSubnetGroupResult *> * _Nonnull task) {
        AWSrdsCreateDBSubnetGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateEventSubscriptionResult *> *)createEventSubscription:(AWSrdsCreateEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateEventSubscription"
                   outputClass:[AWSrdsCreateEventSubscriptionResult class]];
}

- (void)createEventSubscription:(AWSrdsCreateEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSrdsCreateEventSubscriptionResult *response, NSError *error))completionHandler {
    [[self createEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateEventSubscriptionResult *> * _Nonnull task) {
        AWSrdsCreateEventSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateGlobalClusterResult *> *)createGlobalCluster:(AWSrdsCreateGlobalClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateGlobalCluster"
                   outputClass:[AWSrdsCreateGlobalClusterResult class]];
}

- (void)createGlobalCluster:(AWSrdsCreateGlobalClusterMessage *)request
     completionHandler:(void (^)(AWSrdsCreateGlobalClusterResult *response, NSError *error))completionHandler {
    [[self createGlobalCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateGlobalClusterResult *> * _Nonnull task) {
        AWSrdsCreateGlobalClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCreateOptionGroupResult *> *)createOptionGroup:(AWSrdsCreateOptionGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateOptionGroup"
                   outputClass:[AWSrdsCreateOptionGroupResult class]];
}

- (void)createOptionGroup:(AWSrdsCreateOptionGroupMessage *)request
     completionHandler:(void (^)(AWSrdsCreateOptionGroupResult *response, NSError *error))completionHandler {
    [[self createOptionGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCreateOptionGroupResult *> * _Nonnull task) {
        AWSrdsCreateOptionGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDeleteCustomAvailabilityZoneResult *> *)deleteCustomAvailabilityZone:(AWSrdsDeleteCustomAvailabilityZoneMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCustomAvailabilityZone"
                   outputClass:[AWSrdsDeleteCustomAvailabilityZoneResult class]];
}

- (void)deleteCustomAvailabilityZone:(AWSrdsDeleteCustomAvailabilityZoneMessage *)request
     completionHandler:(void (^)(AWSrdsDeleteCustomAvailabilityZoneResult *response, NSError *error))completionHandler {
    [[self deleteCustomAvailabilityZone:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDeleteCustomAvailabilityZoneResult *> * _Nonnull task) {
        AWSrdsDeleteCustomAvailabilityZoneResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDeleteDBClusterResult *> *)deleteDBCluster:(AWSrdsDeleteDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBCluster"
                   outputClass:[AWSrdsDeleteDBClusterResult class]];
}

- (void)deleteDBCluster:(AWSrdsDeleteDBClusterMessage *)request
     completionHandler:(void (^)(AWSrdsDeleteDBClusterResult *response, NSError *error))completionHandler {
    [[self deleteDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDeleteDBClusterResult *> * _Nonnull task) {
        AWSrdsDeleteDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterEndpoint *> *)deleteDBClusterEndpoint:(AWSrdsDeleteDBClusterEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBClusterEndpoint"
                   outputClass:[AWSrdsDBClusterEndpoint class]];
}

- (void)deleteDBClusterEndpoint:(AWSrdsDeleteDBClusterEndpointMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterEndpoint *response, NSError *error))completionHandler {
    [[self deleteDBClusterEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterEndpoint *> * _Nonnull task) {
        AWSrdsDBClusterEndpoint *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDBClusterParameterGroup:(AWSrdsDeleteDBClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBClusterParameterGroup"
                   outputClass:nil];
}

- (void)deleteDBClusterParameterGroup:(AWSrdsDeleteDBClusterParameterGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDBClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDeleteDBClusterSnapshotResult *> *)deleteDBClusterSnapshot:(AWSrdsDeleteDBClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBClusterSnapshot"
                   outputClass:[AWSrdsDeleteDBClusterSnapshotResult class]];
}

- (void)deleteDBClusterSnapshot:(AWSrdsDeleteDBClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSrdsDeleteDBClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self deleteDBClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDeleteDBClusterSnapshotResult *> * _Nonnull task) {
        AWSrdsDeleteDBClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDeleteDBInstanceResult *> *)deleteDBInstance:(AWSrdsDeleteDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBInstance"
                   outputClass:[AWSrdsDeleteDBInstanceResult class]];
}

- (void)deleteDBInstance:(AWSrdsDeleteDBInstanceMessage *)request
     completionHandler:(void (^)(AWSrdsDeleteDBInstanceResult *response, NSError *error))completionHandler {
    [[self deleteDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDeleteDBInstanceResult *> * _Nonnull task) {
        AWSrdsDeleteDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDeleteDBInstanceAutomatedBackupResult *> *)deleteDBInstanceAutomatedBackup:(AWSrdsDeleteDBInstanceAutomatedBackupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBInstanceAutomatedBackup"
                   outputClass:[AWSrdsDeleteDBInstanceAutomatedBackupResult class]];
}

- (void)deleteDBInstanceAutomatedBackup:(AWSrdsDeleteDBInstanceAutomatedBackupMessage *)request
     completionHandler:(void (^)(AWSrdsDeleteDBInstanceAutomatedBackupResult *response, NSError *error))completionHandler {
    [[self deleteDBInstanceAutomatedBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDeleteDBInstanceAutomatedBackupResult *> * _Nonnull task) {
        AWSrdsDeleteDBInstanceAutomatedBackupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDBParameterGroup:(AWSrdsDeleteDBParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBParameterGroup"
                   outputClass:nil];
}

- (void)deleteDBParameterGroup:(AWSrdsDeleteDBParameterGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDBParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDeleteDBProxyResponse *> *)deleteDBProxy:(AWSrdsDeleteDBProxyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBProxy"
                   outputClass:[AWSrdsDeleteDBProxyResponse class]];
}

- (void)deleteDBProxy:(AWSrdsDeleteDBProxyRequest *)request
     completionHandler:(void (^)(AWSrdsDeleteDBProxyResponse *response, NSError *error))completionHandler {
    [[self deleteDBProxy:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDeleteDBProxyResponse *> * _Nonnull task) {
        AWSrdsDeleteDBProxyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDBSecurityGroup:(AWSrdsDeleteDBSecurityGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBSecurityGroup"
                   outputClass:nil];
}

- (void)deleteDBSecurityGroup:(AWSrdsDeleteDBSecurityGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDBSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDeleteDBSnapshotResult *> *)deleteDBSnapshot:(AWSrdsDeleteDBSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBSnapshot"
                   outputClass:[AWSrdsDeleteDBSnapshotResult class]];
}

- (void)deleteDBSnapshot:(AWSrdsDeleteDBSnapshotMessage *)request
     completionHandler:(void (^)(AWSrdsDeleteDBSnapshotResult *response, NSError *error))completionHandler {
    [[self deleteDBSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDeleteDBSnapshotResult *> * _Nonnull task) {
        AWSrdsDeleteDBSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDBSubnetGroup:(AWSrdsDeleteDBSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDBSubnetGroup"
                   outputClass:nil];
}

- (void)deleteDBSubnetGroup:(AWSrdsDeleteDBSubnetGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDBSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDeleteEventSubscriptionResult *> *)deleteEventSubscription:(AWSrdsDeleteEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteEventSubscription"
                   outputClass:[AWSrdsDeleteEventSubscriptionResult class]];
}

- (void)deleteEventSubscription:(AWSrdsDeleteEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSrdsDeleteEventSubscriptionResult *response, NSError *error))completionHandler {
    [[self deleteEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDeleteEventSubscriptionResult *> * _Nonnull task) {
        AWSrdsDeleteEventSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDeleteGlobalClusterResult *> *)deleteGlobalCluster:(AWSrdsDeleteGlobalClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteGlobalCluster"
                   outputClass:[AWSrdsDeleteGlobalClusterResult class]];
}

- (void)deleteGlobalCluster:(AWSrdsDeleteGlobalClusterMessage *)request
     completionHandler:(void (^)(AWSrdsDeleteGlobalClusterResult *response, NSError *error))completionHandler {
    [[self deleteGlobalCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDeleteGlobalClusterResult *> * _Nonnull task) {
        AWSrdsDeleteGlobalClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsInstallationMedia *> *)deleteInstallationMedia:(AWSrdsDeleteInstallationMediaMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteInstallationMedia"
                   outputClass:[AWSrdsInstallationMedia class]];
}

- (void)deleteInstallationMedia:(AWSrdsDeleteInstallationMediaMessage *)request
     completionHandler:(void (^)(AWSrdsInstallationMedia *response, NSError *error))completionHandler {
    [[self deleteInstallationMedia:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsInstallationMedia *> * _Nonnull task) {
        AWSrdsInstallationMedia *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteOptionGroup:(AWSrdsDeleteOptionGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteOptionGroup"
                   outputClass:nil];
}

- (void)deleteOptionGroup:(AWSrdsDeleteOptionGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteOptionGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDeregisterDBProxyTargetsResponse *> *)deregisterDBProxyTargets:(AWSrdsDeregisterDBProxyTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeregisterDBProxyTargets"
                   outputClass:[AWSrdsDeregisterDBProxyTargetsResponse class]];
}

- (void)deregisterDBProxyTargets:(AWSrdsDeregisterDBProxyTargetsRequest *)request
     completionHandler:(void (^)(AWSrdsDeregisterDBProxyTargetsResponse *response, NSError *error))completionHandler {
    [[self deregisterDBProxyTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDeregisterDBProxyTargetsResponse *> * _Nonnull task) {
        AWSrdsDeregisterDBProxyTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsAccountAttributesMessage *> *)describeAccountAttributes:(AWSrdsDescribeAccountAttributesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSrdsAccountAttributesMessage class]];
}

- (void)describeAccountAttributes:(AWSrdsDescribeAccountAttributesMessage *)request
     completionHandler:(void (^)(AWSrdsAccountAttributesMessage *response, NSError *error))completionHandler {
    [[self describeAccountAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsAccountAttributesMessage *> * _Nonnull task) {
        AWSrdsAccountAttributesMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCertificateMessage *> *)describeCertificates:(AWSrdsDescribeCertificatesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCertificates"
                   outputClass:[AWSrdsCertificateMessage class]];
}

- (void)describeCertificates:(AWSrdsDescribeCertificatesMessage *)request
     completionHandler:(void (^)(AWSrdsCertificateMessage *response, NSError *error))completionHandler {
    [[self describeCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCertificateMessage *> * _Nonnull task) {
        AWSrdsCertificateMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsCustomAvailabilityZoneMessage *> *)describeCustomAvailabilityZones:(AWSrdsDescribeCustomAvailabilityZonesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeCustomAvailabilityZones"
                   outputClass:[AWSrdsCustomAvailabilityZoneMessage class]];
}

- (void)describeCustomAvailabilityZones:(AWSrdsDescribeCustomAvailabilityZonesMessage *)request
     completionHandler:(void (^)(AWSrdsCustomAvailabilityZoneMessage *response, NSError *error))completionHandler {
    [[self describeCustomAvailabilityZones:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsCustomAvailabilityZoneMessage *> * _Nonnull task) {
        AWSrdsCustomAvailabilityZoneMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterBacktrackMessage *> *)describeDBClusterBacktracks:(AWSrdsDescribeDBClusterBacktracksMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterBacktracks"
                   outputClass:[AWSrdsDBClusterBacktrackMessage class]];
}

- (void)describeDBClusterBacktracks:(AWSrdsDescribeDBClusterBacktracksMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterBacktrackMessage *response, NSError *error))completionHandler {
    [[self describeDBClusterBacktracks:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterBacktrackMessage *> * _Nonnull task) {
        AWSrdsDBClusterBacktrackMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterEndpointMessage *> *)describeDBClusterEndpoints:(AWSrdsDescribeDBClusterEndpointsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterEndpoints"
                   outputClass:[AWSrdsDBClusterEndpointMessage class]];
}

- (void)describeDBClusterEndpoints:(AWSrdsDescribeDBClusterEndpointsMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterEndpointMessage *response, NSError *error))completionHandler {
    [[self describeDBClusterEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterEndpointMessage *> * _Nonnull task) {
        AWSrdsDBClusterEndpointMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterParameterGroupsMessage *> *)describeDBClusterParameterGroups:(AWSrdsDescribeDBClusterParameterGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterParameterGroups"
                   outputClass:[AWSrdsDBClusterParameterGroupsMessage class]];
}

- (void)describeDBClusterParameterGroups:(AWSrdsDescribeDBClusterParameterGroupsMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterParameterGroupsMessage *response, NSError *error))completionHandler {
    [[self describeDBClusterParameterGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterParameterGroupsMessage *> * _Nonnull task) {
        AWSrdsDBClusterParameterGroupsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterParameterGroupDetails *> *)describeDBClusterParameters:(AWSrdsDescribeDBClusterParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterParameters"
                   outputClass:[AWSrdsDBClusterParameterGroupDetails class]];
}

- (void)describeDBClusterParameters:(AWSrdsDescribeDBClusterParametersMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterParameterGroupDetails *response, NSError *error))completionHandler {
    [[self describeDBClusterParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterParameterGroupDetails *> * _Nonnull task) {
        AWSrdsDBClusterParameterGroupDetails *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDescribeDBClusterSnapshotAttributesResult *> *)describeDBClusterSnapshotAttributes:(AWSrdsDescribeDBClusterSnapshotAttributesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterSnapshotAttributes"
                   outputClass:[AWSrdsDescribeDBClusterSnapshotAttributesResult class]];
}

- (void)describeDBClusterSnapshotAttributes:(AWSrdsDescribeDBClusterSnapshotAttributesMessage *)request
     completionHandler:(void (^)(AWSrdsDescribeDBClusterSnapshotAttributesResult *response, NSError *error))completionHandler {
    [[self describeDBClusterSnapshotAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDescribeDBClusterSnapshotAttributesResult *> * _Nonnull task) {
        AWSrdsDescribeDBClusterSnapshotAttributesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterSnapshotMessage *> *)describeDBClusterSnapshots:(AWSrdsDescribeDBClusterSnapshotsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusterSnapshots"
                   outputClass:[AWSrdsDBClusterSnapshotMessage class]];
}

- (void)describeDBClusterSnapshots:(AWSrdsDescribeDBClusterSnapshotsMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterSnapshotMessage *response, NSError *error))completionHandler {
    [[self describeDBClusterSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterSnapshotMessage *> * _Nonnull task) {
        AWSrdsDBClusterSnapshotMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterMessage *> *)describeDBClusters:(AWSrdsDescribeDBClustersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBClusters"
                   outputClass:[AWSrdsDBClusterMessage class]];
}

- (void)describeDBClusters:(AWSrdsDescribeDBClustersMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterMessage *response, NSError *error))completionHandler {
    [[self describeDBClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterMessage *> * _Nonnull task) {
        AWSrdsDBClusterMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBEngineVersionMessage *> *)describeDBEngineVersions:(AWSrdsDescribeDBEngineVersionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBEngineVersions"
                   outputClass:[AWSrdsDBEngineVersionMessage class]];
}

- (void)describeDBEngineVersions:(AWSrdsDescribeDBEngineVersionsMessage *)request
     completionHandler:(void (^)(AWSrdsDBEngineVersionMessage *response, NSError *error))completionHandler {
    [[self describeDBEngineVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBEngineVersionMessage *> * _Nonnull task) {
        AWSrdsDBEngineVersionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBInstanceAutomatedBackupMessage *> *)describeDBInstanceAutomatedBackups:(AWSrdsDescribeDBInstanceAutomatedBackupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBInstanceAutomatedBackups"
                   outputClass:[AWSrdsDBInstanceAutomatedBackupMessage class]];
}

- (void)describeDBInstanceAutomatedBackups:(AWSrdsDescribeDBInstanceAutomatedBackupsMessage *)request
     completionHandler:(void (^)(AWSrdsDBInstanceAutomatedBackupMessage *response, NSError *error))completionHandler {
    [[self describeDBInstanceAutomatedBackups:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBInstanceAutomatedBackupMessage *> * _Nonnull task) {
        AWSrdsDBInstanceAutomatedBackupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBInstanceMessage *> *)describeDBInstances:(AWSrdsDescribeDBInstancesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBInstances"
                   outputClass:[AWSrdsDBInstanceMessage class]];
}

- (void)describeDBInstances:(AWSrdsDescribeDBInstancesMessage *)request
     completionHandler:(void (^)(AWSrdsDBInstanceMessage *response, NSError *error))completionHandler {
    [[self describeDBInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBInstanceMessage *> * _Nonnull task) {
        AWSrdsDBInstanceMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDescribeDBLogFilesResponse *> *)describeDBLogFiles:(AWSrdsDescribeDBLogFilesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBLogFiles"
                   outputClass:[AWSrdsDescribeDBLogFilesResponse class]];
}

- (void)describeDBLogFiles:(AWSrdsDescribeDBLogFilesMessage *)request
     completionHandler:(void (^)(AWSrdsDescribeDBLogFilesResponse *response, NSError *error))completionHandler {
    [[self describeDBLogFiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDescribeDBLogFilesResponse *> * _Nonnull task) {
        AWSrdsDescribeDBLogFilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBParameterGroupsMessage *> *)describeDBParameterGroups:(AWSrdsDescribeDBParameterGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBParameterGroups"
                   outputClass:[AWSrdsDBParameterGroupsMessage class]];
}

- (void)describeDBParameterGroups:(AWSrdsDescribeDBParameterGroupsMessage *)request
     completionHandler:(void (^)(AWSrdsDBParameterGroupsMessage *response, NSError *error))completionHandler {
    [[self describeDBParameterGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBParameterGroupsMessage *> * _Nonnull task) {
        AWSrdsDBParameterGroupsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBParameterGroupDetails *> *)describeDBParameters:(AWSrdsDescribeDBParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBParameters"
                   outputClass:[AWSrdsDBParameterGroupDetails class]];
}

- (void)describeDBParameters:(AWSrdsDescribeDBParametersMessage *)request
     completionHandler:(void (^)(AWSrdsDBParameterGroupDetails *response, NSError *error))completionHandler {
    [[self describeDBParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBParameterGroupDetails *> * _Nonnull task) {
        AWSrdsDBParameterGroupDetails *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDescribeDBProxiesResponse *> *)describeDBProxies:(AWSrdsDescribeDBProxiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBProxies"
                   outputClass:[AWSrdsDescribeDBProxiesResponse class]];
}

- (void)describeDBProxies:(AWSrdsDescribeDBProxiesRequest *)request
     completionHandler:(void (^)(AWSrdsDescribeDBProxiesResponse *response, NSError *error))completionHandler {
    [[self describeDBProxies:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDescribeDBProxiesResponse *> * _Nonnull task) {
        AWSrdsDescribeDBProxiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDescribeDBProxyTargetGroupsResponse *> *)describeDBProxyTargetGroups:(AWSrdsDescribeDBProxyTargetGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBProxyTargetGroups"
                   outputClass:[AWSrdsDescribeDBProxyTargetGroupsResponse class]];
}

- (void)describeDBProxyTargetGroups:(AWSrdsDescribeDBProxyTargetGroupsRequest *)request
     completionHandler:(void (^)(AWSrdsDescribeDBProxyTargetGroupsResponse *response, NSError *error))completionHandler {
    [[self describeDBProxyTargetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDescribeDBProxyTargetGroupsResponse *> * _Nonnull task) {
        AWSrdsDescribeDBProxyTargetGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDescribeDBProxyTargetsResponse *> *)describeDBProxyTargets:(AWSrdsDescribeDBProxyTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBProxyTargets"
                   outputClass:[AWSrdsDescribeDBProxyTargetsResponse class]];
}

- (void)describeDBProxyTargets:(AWSrdsDescribeDBProxyTargetsRequest *)request
     completionHandler:(void (^)(AWSrdsDescribeDBProxyTargetsResponse *response, NSError *error))completionHandler {
    [[self describeDBProxyTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDescribeDBProxyTargetsResponse *> * _Nonnull task) {
        AWSrdsDescribeDBProxyTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBSecurityGroupMessage *> *)describeDBSecurityGroups:(AWSrdsDescribeDBSecurityGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBSecurityGroups"
                   outputClass:[AWSrdsDBSecurityGroupMessage class]];
}

- (void)describeDBSecurityGroups:(AWSrdsDescribeDBSecurityGroupsMessage *)request
     completionHandler:(void (^)(AWSrdsDBSecurityGroupMessage *response, NSError *error))completionHandler {
    [[self describeDBSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBSecurityGroupMessage *> * _Nonnull task) {
        AWSrdsDBSecurityGroupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDescribeDBSnapshotAttributesResult *> *)describeDBSnapshotAttributes:(AWSrdsDescribeDBSnapshotAttributesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBSnapshotAttributes"
                   outputClass:[AWSrdsDescribeDBSnapshotAttributesResult class]];
}

- (void)describeDBSnapshotAttributes:(AWSrdsDescribeDBSnapshotAttributesMessage *)request
     completionHandler:(void (^)(AWSrdsDescribeDBSnapshotAttributesResult *response, NSError *error))completionHandler {
    [[self describeDBSnapshotAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDescribeDBSnapshotAttributesResult *> * _Nonnull task) {
        AWSrdsDescribeDBSnapshotAttributesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBSnapshotMessage *> *)describeDBSnapshots:(AWSrdsDescribeDBSnapshotsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBSnapshots"
                   outputClass:[AWSrdsDBSnapshotMessage class]];
}

- (void)describeDBSnapshots:(AWSrdsDescribeDBSnapshotsMessage *)request
     completionHandler:(void (^)(AWSrdsDBSnapshotMessage *response, NSError *error))completionHandler {
    [[self describeDBSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBSnapshotMessage *> * _Nonnull task) {
        AWSrdsDBSnapshotMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBSubnetGroupMessage *> *)describeDBSubnetGroups:(AWSrdsDescribeDBSubnetGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDBSubnetGroups"
                   outputClass:[AWSrdsDBSubnetGroupMessage class]];
}

- (void)describeDBSubnetGroups:(AWSrdsDescribeDBSubnetGroupsMessage *)request
     completionHandler:(void (^)(AWSrdsDBSubnetGroupMessage *response, NSError *error))completionHandler {
    [[self describeDBSubnetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBSubnetGroupMessage *> * _Nonnull task) {
        AWSrdsDBSubnetGroupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDescribeEngineDefaultClusterParametersResult *> *)describeEngineDefaultClusterParameters:(AWSrdsDescribeEngineDefaultClusterParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEngineDefaultClusterParameters"
                   outputClass:[AWSrdsDescribeEngineDefaultClusterParametersResult class]];
}

- (void)describeEngineDefaultClusterParameters:(AWSrdsDescribeEngineDefaultClusterParametersMessage *)request
     completionHandler:(void (^)(AWSrdsDescribeEngineDefaultClusterParametersResult *response, NSError *error))completionHandler {
    [[self describeEngineDefaultClusterParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDescribeEngineDefaultClusterParametersResult *> * _Nonnull task) {
        AWSrdsDescribeEngineDefaultClusterParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDescribeEngineDefaultParametersResult *> *)describeEngineDefaultParameters:(AWSrdsDescribeEngineDefaultParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEngineDefaultParameters"
                   outputClass:[AWSrdsDescribeEngineDefaultParametersResult class]];
}

- (void)describeEngineDefaultParameters:(AWSrdsDescribeEngineDefaultParametersMessage *)request
     completionHandler:(void (^)(AWSrdsDescribeEngineDefaultParametersResult *response, NSError *error))completionHandler {
    [[self describeEngineDefaultParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDescribeEngineDefaultParametersResult *> * _Nonnull task) {
        AWSrdsDescribeEngineDefaultParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsEventCategoriesMessage *> *)describeEventCategories:(AWSrdsDescribeEventCategoriesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEventCategories"
                   outputClass:[AWSrdsEventCategoriesMessage class]];
}

- (void)describeEventCategories:(AWSrdsDescribeEventCategoriesMessage *)request
     completionHandler:(void (^)(AWSrdsEventCategoriesMessage *response, NSError *error))completionHandler {
    [[self describeEventCategories:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsEventCategoriesMessage *> * _Nonnull task) {
        AWSrdsEventCategoriesMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsEventSubscriptionsMessage *> *)describeEventSubscriptions:(AWSrdsDescribeEventSubscriptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEventSubscriptions"
                   outputClass:[AWSrdsEventSubscriptionsMessage class]];
}

- (void)describeEventSubscriptions:(AWSrdsDescribeEventSubscriptionsMessage *)request
     completionHandler:(void (^)(AWSrdsEventSubscriptionsMessage *response, NSError *error))completionHandler {
    [[self describeEventSubscriptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsEventSubscriptionsMessage *> * _Nonnull task) {
        AWSrdsEventSubscriptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsEventsMessage *> *)describeEvents:(AWSrdsDescribeEventsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEvents"
                   outputClass:[AWSrdsEventsMessage class]];
}

- (void)describeEvents:(AWSrdsDescribeEventsMessage *)request
     completionHandler:(void (^)(AWSrdsEventsMessage *response, NSError *error))completionHandler {
    [[self describeEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsEventsMessage *> * _Nonnull task) {
        AWSrdsEventsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsExportTasksMessage *> *)describeExportTasks:(AWSrdsDescribeExportTasksMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeExportTasks"
                   outputClass:[AWSrdsExportTasksMessage class]];
}

- (void)describeExportTasks:(AWSrdsDescribeExportTasksMessage *)request
     completionHandler:(void (^)(AWSrdsExportTasksMessage *response, NSError *error))completionHandler {
    [[self describeExportTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsExportTasksMessage *> * _Nonnull task) {
        AWSrdsExportTasksMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsGlobalClustersMessage *> *)describeGlobalClusters:(AWSrdsDescribeGlobalClustersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeGlobalClusters"
                   outputClass:[AWSrdsGlobalClustersMessage class]];
}

- (void)describeGlobalClusters:(AWSrdsDescribeGlobalClustersMessage *)request
     completionHandler:(void (^)(AWSrdsGlobalClustersMessage *response, NSError *error))completionHandler {
    [[self describeGlobalClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsGlobalClustersMessage *> * _Nonnull task) {
        AWSrdsGlobalClustersMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsInstallationMediaMessage *> *)describeInstallationMedia:(AWSrdsDescribeInstallationMediaMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeInstallationMedia"
                   outputClass:[AWSrdsInstallationMediaMessage class]];
}

- (void)describeInstallationMedia:(AWSrdsDescribeInstallationMediaMessage *)request
     completionHandler:(void (^)(AWSrdsInstallationMediaMessage *response, NSError *error))completionHandler {
    [[self describeInstallationMedia:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsInstallationMediaMessage *> * _Nonnull task) {
        AWSrdsInstallationMediaMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsOptionGroupOptionsMessage *> *)describeOptionGroupOptions:(AWSrdsDescribeOptionGroupOptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeOptionGroupOptions"
                   outputClass:[AWSrdsOptionGroupOptionsMessage class]];
}

- (void)describeOptionGroupOptions:(AWSrdsDescribeOptionGroupOptionsMessage *)request
     completionHandler:(void (^)(AWSrdsOptionGroupOptionsMessage *response, NSError *error))completionHandler {
    [[self describeOptionGroupOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsOptionGroupOptionsMessage *> * _Nonnull task) {
        AWSrdsOptionGroupOptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsOptionGroups *> *)describeOptionGroups:(AWSrdsDescribeOptionGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeOptionGroups"
                   outputClass:[AWSrdsOptionGroups class]];
}

- (void)describeOptionGroups:(AWSrdsDescribeOptionGroupsMessage *)request
     completionHandler:(void (^)(AWSrdsOptionGroups *response, NSError *error))completionHandler {
    [[self describeOptionGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsOptionGroups *> * _Nonnull task) {
        AWSrdsOptionGroups *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsOrderableDBInstanceOptionsMessage *> *)describeOrderableDBInstanceOptions:(AWSrdsDescribeOrderableDBInstanceOptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeOrderableDBInstanceOptions"
                   outputClass:[AWSrdsOrderableDBInstanceOptionsMessage class]];
}

- (void)describeOrderableDBInstanceOptions:(AWSrdsDescribeOrderableDBInstanceOptionsMessage *)request
     completionHandler:(void (^)(AWSrdsOrderableDBInstanceOptionsMessage *response, NSError *error))completionHandler {
    [[self describeOrderableDBInstanceOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsOrderableDBInstanceOptionsMessage *> * _Nonnull task) {
        AWSrdsOrderableDBInstanceOptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsPendingMaintenanceActionsMessage *> *)describePendingMaintenanceActions:(AWSrdsDescribePendingMaintenanceActionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePendingMaintenanceActions"
                   outputClass:[AWSrdsPendingMaintenanceActionsMessage class]];
}

- (void)describePendingMaintenanceActions:(AWSrdsDescribePendingMaintenanceActionsMessage *)request
     completionHandler:(void (^)(AWSrdsPendingMaintenanceActionsMessage *response, NSError *error))completionHandler {
    [[self describePendingMaintenanceActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsPendingMaintenanceActionsMessage *> * _Nonnull task) {
        AWSrdsPendingMaintenanceActionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsReservedDBInstanceMessage *> *)describeReservedDBInstances:(AWSrdsDescribeReservedDBInstancesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedDBInstances"
                   outputClass:[AWSrdsReservedDBInstanceMessage class]];
}

- (void)describeReservedDBInstances:(AWSrdsDescribeReservedDBInstancesMessage *)request
     completionHandler:(void (^)(AWSrdsReservedDBInstanceMessage *response, NSError *error))completionHandler {
    [[self describeReservedDBInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsReservedDBInstanceMessage *> * _Nonnull task) {
        AWSrdsReservedDBInstanceMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsReservedDBInstancesOfferingMessage *> *)describeReservedDBInstancesOfferings:(AWSrdsDescribeReservedDBInstancesOfferingsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedDBInstancesOfferings"
                   outputClass:[AWSrdsReservedDBInstancesOfferingMessage class]];
}

- (void)describeReservedDBInstancesOfferings:(AWSrdsDescribeReservedDBInstancesOfferingsMessage *)request
     completionHandler:(void (^)(AWSrdsReservedDBInstancesOfferingMessage *response, NSError *error))completionHandler {
    [[self describeReservedDBInstancesOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsReservedDBInstancesOfferingMessage *> * _Nonnull task) {
        AWSrdsReservedDBInstancesOfferingMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsSourceRegionMessage *> *)describeSourceRegions:(AWSrdsDescribeSourceRegionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSourceRegions"
                   outputClass:[AWSrdsSourceRegionMessage class]];
}

- (void)describeSourceRegions:(AWSrdsDescribeSourceRegionsMessage *)request
     completionHandler:(void (^)(AWSrdsSourceRegionMessage *response, NSError *error))completionHandler {
    [[self describeSourceRegions:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsSourceRegionMessage *> * _Nonnull task) {
        AWSrdsSourceRegionMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDescribeValidDBInstanceModificationsResult *> *)describeValidDBInstanceModifications:(AWSrdsDescribeValidDBInstanceModificationsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeValidDBInstanceModifications"
                   outputClass:[AWSrdsDescribeValidDBInstanceModificationsResult class]];
}

- (void)describeValidDBInstanceModifications:(AWSrdsDescribeValidDBInstanceModificationsMessage *)request
     completionHandler:(void (^)(AWSrdsDescribeValidDBInstanceModificationsResult *response, NSError *error))completionHandler {
    [[self describeValidDBInstanceModifications:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDescribeValidDBInstanceModificationsResult *> * _Nonnull task) {
        AWSrdsDescribeValidDBInstanceModificationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDownloadDBLogFilePortionDetails *> *)downloadDBLogFilePortion:(AWSrdsDownloadDBLogFilePortionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DownloadDBLogFilePortion"
                   outputClass:[AWSrdsDownloadDBLogFilePortionDetails class]];
}

- (void)downloadDBLogFilePortion:(AWSrdsDownloadDBLogFilePortionMessage *)request
     completionHandler:(void (^)(AWSrdsDownloadDBLogFilePortionDetails *response, NSError *error))completionHandler {
    [[self downloadDBLogFilePortion:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDownloadDBLogFilePortionDetails *> * _Nonnull task) {
        AWSrdsDownloadDBLogFilePortionDetails *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsFailoverDBClusterResult *> *)failoverDBCluster:(AWSrdsFailoverDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"FailoverDBCluster"
                   outputClass:[AWSrdsFailoverDBClusterResult class]];
}

- (void)failoverDBCluster:(AWSrdsFailoverDBClusterMessage *)request
     completionHandler:(void (^)(AWSrdsFailoverDBClusterResult *response, NSError *error))completionHandler {
    [[self failoverDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsFailoverDBClusterResult *> * _Nonnull task) {
        AWSrdsFailoverDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsInstallationMedia *> *)importInstallationMedia:(AWSrdsImportInstallationMediaMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ImportInstallationMedia"
                   outputClass:[AWSrdsInstallationMedia class]];
}

- (void)importInstallationMedia:(AWSrdsImportInstallationMediaMessage *)request
     completionHandler:(void (^)(AWSrdsInstallationMedia *response, NSError *error))completionHandler {
    [[self importInstallationMedia:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsInstallationMedia *> * _Nonnull task) {
        AWSrdsInstallationMedia *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsTagListMessage *> *)listTagsForResource:(AWSrdsListTagsForResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSrdsTagListMessage class]];
}

- (void)listTagsForResource:(AWSrdsListTagsForResourceMessage *)request
     completionHandler:(void (^)(AWSrdsTagListMessage *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsTagListMessage *> * _Nonnull task) {
        AWSrdsTagListMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyCertificatesResult *> *)modifyCertificates:(AWSrdsModifyCertificatesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyCertificates"
                   outputClass:[AWSrdsModifyCertificatesResult class]];
}

- (void)modifyCertificates:(AWSrdsModifyCertificatesMessage *)request
     completionHandler:(void (^)(AWSrdsModifyCertificatesResult *response, NSError *error))completionHandler {
    [[self modifyCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyCertificatesResult *> * _Nonnull task) {
        AWSrdsModifyCertificatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterCapacityInfo *> *)modifyCurrentDBClusterCapacity:(AWSrdsModifyCurrentDBClusterCapacityMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyCurrentDBClusterCapacity"
                   outputClass:[AWSrdsDBClusterCapacityInfo class]];
}

- (void)modifyCurrentDBClusterCapacity:(AWSrdsModifyCurrentDBClusterCapacityMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterCapacityInfo *response, NSError *error))completionHandler {
    [[self modifyCurrentDBClusterCapacity:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterCapacityInfo *> * _Nonnull task) {
        AWSrdsDBClusterCapacityInfo *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyDBClusterResult *> *)modifyDBCluster:(AWSrdsModifyDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBCluster"
                   outputClass:[AWSrdsModifyDBClusterResult class]];
}

- (void)modifyDBCluster:(AWSrdsModifyDBClusterMessage *)request
     completionHandler:(void (^)(AWSrdsModifyDBClusterResult *response, NSError *error))completionHandler {
    [[self modifyDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyDBClusterResult *> * _Nonnull task) {
        AWSrdsModifyDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterEndpoint *> *)modifyDBClusterEndpoint:(AWSrdsModifyDBClusterEndpointMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBClusterEndpoint"
                   outputClass:[AWSrdsDBClusterEndpoint class]];
}

- (void)modifyDBClusterEndpoint:(AWSrdsModifyDBClusterEndpointMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterEndpoint *response, NSError *error))completionHandler {
    [[self modifyDBClusterEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterEndpoint *> * _Nonnull task) {
        AWSrdsDBClusterEndpoint *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterParameterGroupNameMessage *> *)modifyDBClusterParameterGroup:(AWSrdsModifyDBClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBClusterParameterGroup"
                   outputClass:[AWSrdsDBClusterParameterGroupNameMessage class]];
}

- (void)modifyDBClusterParameterGroup:(AWSrdsModifyDBClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self modifyDBClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterParameterGroupNameMessage *> * _Nonnull task) {
        AWSrdsDBClusterParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyDBClusterSnapshotAttributeResult *> *)modifyDBClusterSnapshotAttribute:(AWSrdsModifyDBClusterSnapshotAttributeMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBClusterSnapshotAttribute"
                   outputClass:[AWSrdsModifyDBClusterSnapshotAttributeResult class]];
}

- (void)modifyDBClusterSnapshotAttribute:(AWSrdsModifyDBClusterSnapshotAttributeMessage *)request
     completionHandler:(void (^)(AWSrdsModifyDBClusterSnapshotAttributeResult *response, NSError *error))completionHandler {
    [[self modifyDBClusterSnapshotAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyDBClusterSnapshotAttributeResult *> * _Nonnull task) {
        AWSrdsModifyDBClusterSnapshotAttributeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyDBInstanceResult *> *)modifyDBInstance:(AWSrdsModifyDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBInstance"
                   outputClass:[AWSrdsModifyDBInstanceResult class]];
}

- (void)modifyDBInstance:(AWSrdsModifyDBInstanceMessage *)request
     completionHandler:(void (^)(AWSrdsModifyDBInstanceResult *response, NSError *error))completionHandler {
    [[self modifyDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyDBInstanceResult *> * _Nonnull task) {
        AWSrdsModifyDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBParameterGroupNameMessage *> *)modifyDBParameterGroup:(AWSrdsModifyDBParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBParameterGroup"
                   outputClass:[AWSrdsDBParameterGroupNameMessage class]];
}

- (void)modifyDBParameterGroup:(AWSrdsModifyDBParameterGroupMessage *)request
     completionHandler:(void (^)(AWSrdsDBParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self modifyDBParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBParameterGroupNameMessage *> * _Nonnull task) {
        AWSrdsDBParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyDBProxyResponse *> *)modifyDBProxy:(AWSrdsModifyDBProxyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBProxy"
                   outputClass:[AWSrdsModifyDBProxyResponse class]];
}

- (void)modifyDBProxy:(AWSrdsModifyDBProxyRequest *)request
     completionHandler:(void (^)(AWSrdsModifyDBProxyResponse *response, NSError *error))completionHandler {
    [[self modifyDBProxy:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyDBProxyResponse *> * _Nonnull task) {
        AWSrdsModifyDBProxyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyDBProxyTargetGroupResponse *> *)modifyDBProxyTargetGroup:(AWSrdsModifyDBProxyTargetGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBProxyTargetGroup"
                   outputClass:[AWSrdsModifyDBProxyTargetGroupResponse class]];
}

- (void)modifyDBProxyTargetGroup:(AWSrdsModifyDBProxyTargetGroupRequest *)request
     completionHandler:(void (^)(AWSrdsModifyDBProxyTargetGroupResponse *response, NSError *error))completionHandler {
    [[self modifyDBProxyTargetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyDBProxyTargetGroupResponse *> * _Nonnull task) {
        AWSrdsModifyDBProxyTargetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyDBSnapshotResult *> *)modifyDBSnapshot:(AWSrdsModifyDBSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBSnapshot"
                   outputClass:[AWSrdsModifyDBSnapshotResult class]];
}

- (void)modifyDBSnapshot:(AWSrdsModifyDBSnapshotMessage *)request
     completionHandler:(void (^)(AWSrdsModifyDBSnapshotResult *response, NSError *error))completionHandler {
    [[self modifyDBSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyDBSnapshotResult *> * _Nonnull task) {
        AWSrdsModifyDBSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyDBSnapshotAttributeResult *> *)modifyDBSnapshotAttribute:(AWSrdsModifyDBSnapshotAttributeMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBSnapshotAttribute"
                   outputClass:[AWSrdsModifyDBSnapshotAttributeResult class]];
}

- (void)modifyDBSnapshotAttribute:(AWSrdsModifyDBSnapshotAttributeMessage *)request
     completionHandler:(void (^)(AWSrdsModifyDBSnapshotAttributeResult *response, NSError *error))completionHandler {
    [[self modifyDBSnapshotAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyDBSnapshotAttributeResult *> * _Nonnull task) {
        AWSrdsModifyDBSnapshotAttributeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyDBSubnetGroupResult *> *)modifyDBSubnetGroup:(AWSrdsModifyDBSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyDBSubnetGroup"
                   outputClass:[AWSrdsModifyDBSubnetGroupResult class]];
}

- (void)modifyDBSubnetGroup:(AWSrdsModifyDBSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSrdsModifyDBSubnetGroupResult *response, NSError *error))completionHandler {
    [[self modifyDBSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyDBSubnetGroupResult *> * _Nonnull task) {
        AWSrdsModifyDBSubnetGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyEventSubscriptionResult *> *)modifyEventSubscription:(AWSrdsModifyEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyEventSubscription"
                   outputClass:[AWSrdsModifyEventSubscriptionResult class]];
}

- (void)modifyEventSubscription:(AWSrdsModifyEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSrdsModifyEventSubscriptionResult *response, NSError *error))completionHandler {
    [[self modifyEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyEventSubscriptionResult *> * _Nonnull task) {
        AWSrdsModifyEventSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyGlobalClusterResult *> *)modifyGlobalCluster:(AWSrdsModifyGlobalClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyGlobalCluster"
                   outputClass:[AWSrdsModifyGlobalClusterResult class]];
}

- (void)modifyGlobalCluster:(AWSrdsModifyGlobalClusterMessage *)request
     completionHandler:(void (^)(AWSrdsModifyGlobalClusterResult *response, NSError *error))completionHandler {
    [[self modifyGlobalCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyGlobalClusterResult *> * _Nonnull task) {
        AWSrdsModifyGlobalClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsModifyOptionGroupResult *> *)modifyOptionGroup:(AWSrdsModifyOptionGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyOptionGroup"
                   outputClass:[AWSrdsModifyOptionGroupResult class]];
}

- (void)modifyOptionGroup:(AWSrdsModifyOptionGroupMessage *)request
     completionHandler:(void (^)(AWSrdsModifyOptionGroupResult *response, NSError *error))completionHandler {
    [[self modifyOptionGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsModifyOptionGroupResult *> * _Nonnull task) {
        AWSrdsModifyOptionGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsPromoteReadReplicaResult *> *)promoteReadReplica:(AWSrdsPromoteReadReplicaMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PromoteReadReplica"
                   outputClass:[AWSrdsPromoteReadReplicaResult class]];
}

- (void)promoteReadReplica:(AWSrdsPromoteReadReplicaMessage *)request
     completionHandler:(void (^)(AWSrdsPromoteReadReplicaResult *response, NSError *error))completionHandler {
    [[self promoteReadReplica:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsPromoteReadReplicaResult *> * _Nonnull task) {
        AWSrdsPromoteReadReplicaResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsPromoteReadReplicaDBClusterResult *> *)promoteReadReplicaDBCluster:(AWSrdsPromoteReadReplicaDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PromoteReadReplicaDBCluster"
                   outputClass:[AWSrdsPromoteReadReplicaDBClusterResult class]];
}

- (void)promoteReadReplicaDBCluster:(AWSrdsPromoteReadReplicaDBClusterMessage *)request
     completionHandler:(void (^)(AWSrdsPromoteReadReplicaDBClusterResult *response, NSError *error))completionHandler {
    [[self promoteReadReplicaDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsPromoteReadReplicaDBClusterResult *> * _Nonnull task) {
        AWSrdsPromoteReadReplicaDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsPurchaseReservedDBInstancesOfferingResult *> *)purchaseReservedDBInstancesOffering:(AWSrdsPurchaseReservedDBInstancesOfferingMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PurchaseReservedDBInstancesOffering"
                   outputClass:[AWSrdsPurchaseReservedDBInstancesOfferingResult class]];
}

- (void)purchaseReservedDBInstancesOffering:(AWSrdsPurchaseReservedDBInstancesOfferingMessage *)request
     completionHandler:(void (^)(AWSrdsPurchaseReservedDBInstancesOfferingResult *response, NSError *error))completionHandler {
    [[self purchaseReservedDBInstancesOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsPurchaseReservedDBInstancesOfferingResult *> * _Nonnull task) {
        AWSrdsPurchaseReservedDBInstancesOfferingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRebootDBInstanceResult *> *)rebootDBInstance:(AWSrdsRebootDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RebootDBInstance"
                   outputClass:[AWSrdsRebootDBInstanceResult class]];
}

- (void)rebootDBInstance:(AWSrdsRebootDBInstanceMessage *)request
     completionHandler:(void (^)(AWSrdsRebootDBInstanceResult *response, NSError *error))completionHandler {
    [[self rebootDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRebootDBInstanceResult *> * _Nonnull task) {
        AWSrdsRebootDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRegisterDBProxyTargetsResponse *> *)registerDBProxyTargets:(AWSrdsRegisterDBProxyTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RegisterDBProxyTargets"
                   outputClass:[AWSrdsRegisterDBProxyTargetsResponse class]];
}

- (void)registerDBProxyTargets:(AWSrdsRegisterDBProxyTargetsRequest *)request
     completionHandler:(void (^)(AWSrdsRegisterDBProxyTargetsResponse *response, NSError *error))completionHandler {
    [[self registerDBProxyTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRegisterDBProxyTargetsResponse *> * _Nonnull task) {
        AWSrdsRegisterDBProxyTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRemoveFromGlobalClusterResult *> *)removeFromGlobalCluster:(AWSrdsRemoveFromGlobalClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveFromGlobalCluster"
                   outputClass:[AWSrdsRemoveFromGlobalClusterResult class]];
}

- (void)removeFromGlobalCluster:(AWSrdsRemoveFromGlobalClusterMessage *)request
     completionHandler:(void (^)(AWSrdsRemoveFromGlobalClusterResult *response, NSError *error))completionHandler {
    [[self removeFromGlobalCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRemoveFromGlobalClusterResult *> * _Nonnull task) {
        AWSrdsRemoveFromGlobalClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)removeRoleFromDBCluster:(AWSrdsRemoveRoleFromDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveRoleFromDBCluster"
                   outputClass:nil];
}

- (void)removeRoleFromDBCluster:(AWSrdsRemoveRoleFromDBClusterMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeRoleFromDBCluster:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)removeRoleFromDBInstance:(AWSrdsRemoveRoleFromDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveRoleFromDBInstance"
                   outputClass:nil];
}

- (void)removeRoleFromDBInstance:(AWSrdsRemoveRoleFromDBInstanceMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeRoleFromDBInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRemoveSourceIdentifierFromSubscriptionResult *> *)removeSourceIdentifierFromSubscription:(AWSrdsRemoveSourceIdentifierFromSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveSourceIdentifierFromSubscription"
                   outputClass:[AWSrdsRemoveSourceIdentifierFromSubscriptionResult class]];
}

- (void)removeSourceIdentifierFromSubscription:(AWSrdsRemoveSourceIdentifierFromSubscriptionMessage *)request
     completionHandler:(void (^)(AWSrdsRemoveSourceIdentifierFromSubscriptionResult *response, NSError *error))completionHandler {
    [[self removeSourceIdentifierFromSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRemoveSourceIdentifierFromSubscriptionResult *> * _Nonnull task) {
        AWSrdsRemoveSourceIdentifierFromSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)removeTagsFromResource:(AWSrdsRemoveTagsFromResourceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveTagsFromResource"
                   outputClass:nil];
}

- (void)removeTagsFromResource:(AWSrdsRemoveTagsFromResourceMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeTagsFromResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBClusterParameterGroupNameMessage *> *)resetDBClusterParameterGroup:(AWSrdsResetDBClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetDBClusterParameterGroup"
                   outputClass:[AWSrdsDBClusterParameterGroupNameMessage class]];
}

- (void)resetDBClusterParameterGroup:(AWSrdsResetDBClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSrdsDBClusterParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self resetDBClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBClusterParameterGroupNameMessage *> * _Nonnull task) {
        AWSrdsDBClusterParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsDBParameterGroupNameMessage *> *)resetDBParameterGroup:(AWSrdsResetDBParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetDBParameterGroup"
                   outputClass:[AWSrdsDBParameterGroupNameMessage class]];
}

- (void)resetDBParameterGroup:(AWSrdsResetDBParameterGroupMessage *)request
     completionHandler:(void (^)(AWSrdsDBParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self resetDBParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsDBParameterGroupNameMessage *> * _Nonnull task) {
        AWSrdsDBParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRestoreDBClusterFromS3Result *> *)restoreDBClusterFromS3:(AWSrdsRestoreDBClusterFromS3Message *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBClusterFromS3"
                   outputClass:[AWSrdsRestoreDBClusterFromS3Result class]];
}

- (void)restoreDBClusterFromS3:(AWSrdsRestoreDBClusterFromS3Message *)request
     completionHandler:(void (^)(AWSrdsRestoreDBClusterFromS3Result *response, NSError *error))completionHandler {
    [[self restoreDBClusterFromS3:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRestoreDBClusterFromS3Result *> * _Nonnull task) {
        AWSrdsRestoreDBClusterFromS3Result *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRestoreDBClusterFromSnapshotResult *> *)restoreDBClusterFromSnapshot:(AWSrdsRestoreDBClusterFromSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBClusterFromSnapshot"
                   outputClass:[AWSrdsRestoreDBClusterFromSnapshotResult class]];
}

- (void)restoreDBClusterFromSnapshot:(AWSrdsRestoreDBClusterFromSnapshotMessage *)request
     completionHandler:(void (^)(AWSrdsRestoreDBClusterFromSnapshotResult *response, NSError *error))completionHandler {
    [[self restoreDBClusterFromSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRestoreDBClusterFromSnapshotResult *> * _Nonnull task) {
        AWSrdsRestoreDBClusterFromSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRestoreDBClusterToPointInTimeResult *> *)restoreDBClusterToPointInTime:(AWSrdsRestoreDBClusterToPointInTimeMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBClusterToPointInTime"
                   outputClass:[AWSrdsRestoreDBClusterToPointInTimeResult class]];
}

- (void)restoreDBClusterToPointInTime:(AWSrdsRestoreDBClusterToPointInTimeMessage *)request
     completionHandler:(void (^)(AWSrdsRestoreDBClusterToPointInTimeResult *response, NSError *error))completionHandler {
    [[self restoreDBClusterToPointInTime:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRestoreDBClusterToPointInTimeResult *> * _Nonnull task) {
        AWSrdsRestoreDBClusterToPointInTimeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRestoreDBInstanceFromDBSnapshotResult *> *)restoreDBInstanceFromDBSnapshot:(AWSrdsRestoreDBInstanceFromDBSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBInstanceFromDBSnapshot"
                   outputClass:[AWSrdsRestoreDBInstanceFromDBSnapshotResult class]];
}

- (void)restoreDBInstanceFromDBSnapshot:(AWSrdsRestoreDBInstanceFromDBSnapshotMessage *)request
     completionHandler:(void (^)(AWSrdsRestoreDBInstanceFromDBSnapshotResult *response, NSError *error))completionHandler {
    [[self restoreDBInstanceFromDBSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRestoreDBInstanceFromDBSnapshotResult *> * _Nonnull task) {
        AWSrdsRestoreDBInstanceFromDBSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRestoreDBInstanceFromS3Result *> *)restoreDBInstanceFromS3:(AWSrdsRestoreDBInstanceFromS3Message *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBInstanceFromS3"
                   outputClass:[AWSrdsRestoreDBInstanceFromS3Result class]];
}

- (void)restoreDBInstanceFromS3:(AWSrdsRestoreDBInstanceFromS3Message *)request
     completionHandler:(void (^)(AWSrdsRestoreDBInstanceFromS3Result *response, NSError *error))completionHandler {
    [[self restoreDBInstanceFromS3:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRestoreDBInstanceFromS3Result *> * _Nonnull task) {
        AWSrdsRestoreDBInstanceFromS3Result *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRestoreDBInstanceToPointInTimeResult *> *)restoreDBInstanceToPointInTime:(AWSrdsRestoreDBInstanceToPointInTimeMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreDBInstanceToPointInTime"
                   outputClass:[AWSrdsRestoreDBInstanceToPointInTimeResult class]];
}

- (void)restoreDBInstanceToPointInTime:(AWSrdsRestoreDBInstanceToPointInTimeMessage *)request
     completionHandler:(void (^)(AWSrdsRestoreDBInstanceToPointInTimeResult *response, NSError *error))completionHandler {
    [[self restoreDBInstanceToPointInTime:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRestoreDBInstanceToPointInTimeResult *> * _Nonnull task) {
        AWSrdsRestoreDBInstanceToPointInTimeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsRevokeDBSecurityGroupIngressResult *> *)revokeDBSecurityGroupIngress:(AWSrdsRevokeDBSecurityGroupIngressMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeDBSecurityGroupIngress"
                   outputClass:[AWSrdsRevokeDBSecurityGroupIngressResult class]];
}

- (void)revokeDBSecurityGroupIngress:(AWSrdsRevokeDBSecurityGroupIngressMessage *)request
     completionHandler:(void (^)(AWSrdsRevokeDBSecurityGroupIngressResult *response, NSError *error))completionHandler {
    [[self revokeDBSecurityGroupIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsRevokeDBSecurityGroupIngressResult *> * _Nonnull task) {
        AWSrdsRevokeDBSecurityGroupIngressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsStartActivityStreamResponse *> *)startActivityStream:(AWSrdsStartActivityStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartActivityStream"
                   outputClass:[AWSrdsStartActivityStreamResponse class]];
}

- (void)startActivityStream:(AWSrdsStartActivityStreamRequest *)request
     completionHandler:(void (^)(AWSrdsStartActivityStreamResponse *response, NSError *error))completionHandler {
    [[self startActivityStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsStartActivityStreamResponse *> * _Nonnull task) {
        AWSrdsStartActivityStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsStartDBClusterResult *> *)startDBCluster:(AWSrdsStartDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartDBCluster"
                   outputClass:[AWSrdsStartDBClusterResult class]];
}

- (void)startDBCluster:(AWSrdsStartDBClusterMessage *)request
     completionHandler:(void (^)(AWSrdsStartDBClusterResult *response, NSError *error))completionHandler {
    [[self startDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsStartDBClusterResult *> * _Nonnull task) {
        AWSrdsStartDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsStartDBInstanceResult *> *)startDBInstance:(AWSrdsStartDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartDBInstance"
                   outputClass:[AWSrdsStartDBInstanceResult class]];
}

- (void)startDBInstance:(AWSrdsStartDBInstanceMessage *)request
     completionHandler:(void (^)(AWSrdsStartDBInstanceResult *response, NSError *error))completionHandler {
    [[self startDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsStartDBInstanceResult *> * _Nonnull task) {
        AWSrdsStartDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsExportTask *> *)startExportTask:(AWSrdsStartExportTaskMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StartExportTask"
                   outputClass:[AWSrdsExportTask class]];
}

- (void)startExportTask:(AWSrdsStartExportTaskMessage *)request
     completionHandler:(void (^)(AWSrdsExportTask *response, NSError *error))completionHandler {
    [[self startExportTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsExportTask *> * _Nonnull task) {
        AWSrdsExportTask *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsStopActivityStreamResponse *> *)stopActivityStream:(AWSrdsStopActivityStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StopActivityStream"
                   outputClass:[AWSrdsStopActivityStreamResponse class]];
}

- (void)stopActivityStream:(AWSrdsStopActivityStreamRequest *)request
     completionHandler:(void (^)(AWSrdsStopActivityStreamResponse *response, NSError *error))completionHandler {
    [[self stopActivityStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsStopActivityStreamResponse *> * _Nonnull task) {
        AWSrdsStopActivityStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsStopDBClusterResult *> *)stopDBCluster:(AWSrdsStopDBClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StopDBCluster"
                   outputClass:[AWSrdsStopDBClusterResult class]];
}

- (void)stopDBCluster:(AWSrdsStopDBClusterMessage *)request
     completionHandler:(void (^)(AWSrdsStopDBClusterResult *response, NSError *error))completionHandler {
    [[self stopDBCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsStopDBClusterResult *> * _Nonnull task) {
        AWSrdsStopDBClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSrdsStopDBInstanceResult *> *)stopDBInstance:(AWSrdsStopDBInstanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"StopDBInstance"
                   outputClass:[AWSrdsStopDBInstanceResult class]];
}

- (void)stopDBInstance:(AWSrdsStopDBInstanceMessage *)request
     completionHandler:(void (^)(AWSrdsStopDBInstanceResult *response, NSError *error))completionHandler {
    [[self stopDBInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSrdsStopDBInstanceResult *> * _Nonnull task) {
        AWSrdsStopDBInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
