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

#import "AWSredshiftService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSredshiftResources.h"

static NSString *const AWSInforedshift = @"redshift";
NSString *const AWSredshiftSDKVersion = @"2.13.2";


@interface AWSredshiftResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSredshiftResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessToSnapshotDenied" : @(AWSredshiftErrorAccessToSnapshotDenied),
                            @"AuthorizationAlreadyExists" : @(AWSredshiftErrorAuthorizationAlreadyExists),
                            @"AuthorizationNotFound" : @(AWSredshiftErrorAuthorizationNotFound),
                            @"AuthorizationQuotaExceeded" : @(AWSredshiftErrorAuthorizationQuotaExceeded),
                            @"BatchDeleteRequestSizeExceeded" : @(AWSredshiftErrorBatchDeleteRequestSizeExceeded),
                            @"BatchModifyClusterSnapshotsLimitExceededFault" : @(AWSredshiftErrorBatchModifyClusterSnapshotsLimitExceeded),
                            @"BucketNotFoundFault" : @(AWSredshiftErrorBucketNotFound),
                            @"ClusterAlreadyExists" : @(AWSredshiftErrorClusterAlreadyExists),
                            @"ClusterNotFound" : @(AWSredshiftErrorClusterNotFound),
                            @"ClusterOnLatestRevision" : @(AWSredshiftErrorClusterOnLatestRevision),
                            @"ClusterParameterGroupAlreadyExists" : @(AWSredshiftErrorClusterParameterGroupAlreadyExists),
                            @"ClusterParameterGroupNotFound" : @(AWSredshiftErrorClusterParameterGroupNotFound),
                            @"ClusterParameterGroupQuotaExceeded" : @(AWSredshiftErrorClusterParameterGroupQuotaExceeded),
                            @"ClusterQuotaExceeded" : @(AWSredshiftErrorClusterQuotaExceeded),
                            @"ClusterSecurityGroupAlreadyExists" : @(AWSredshiftErrorClusterSecurityGroupAlreadyExists),
                            @"ClusterSecurityGroupNotFound" : @(AWSredshiftErrorClusterSecurityGroupNotFound),
                            @"QuotaExceeded.ClusterSecurityGroup" : @(AWSredshiftErrorClusterSecurityGroupQuotaExceeded),
                            @"ClusterSnapshotAlreadyExists" : @(AWSredshiftErrorClusterSnapshotAlreadyExists),
                            @"ClusterSnapshotNotFound" : @(AWSredshiftErrorClusterSnapshotNotFound),
                            @"ClusterSnapshotQuotaExceeded" : @(AWSredshiftErrorClusterSnapshotQuotaExceeded),
                            @"ClusterSubnetGroupAlreadyExists" : @(AWSredshiftErrorClusterSubnetGroupAlreadyExists),
                            @"ClusterSubnetGroupNotFoundFault" : @(AWSredshiftErrorClusterSubnetGroupNotFound),
                            @"ClusterSubnetGroupQuotaExceeded" : @(AWSredshiftErrorClusterSubnetGroupQuotaExceeded),
                            @"ClusterSubnetQuotaExceededFault" : @(AWSredshiftErrorClusterSubnetQuotaExceeded),
                            @"CopyToRegionDisabledFault" : @(AWSredshiftErrorCopyToRegionDisabled),
                            @"DependentServiceRequestThrottlingFault" : @(AWSredshiftErrorDependentServiceRequestThrottling),
                            @"DependentServiceUnavailableFault" : @(AWSredshiftErrorDependentServiceUnavailable),
                            @"EventSubscriptionQuotaExceeded" : @(AWSredshiftErrorEventSubscriptionQuotaExceeded),
                            @"HsmClientCertificateAlreadyExistsFault" : @(AWSredshiftErrorHsmClientCertificateAlreadyExists),
                            @"HsmClientCertificateNotFoundFault" : @(AWSredshiftErrorHsmClientCertificateNotFound),
                            @"HsmClientCertificateQuotaExceededFault" : @(AWSredshiftErrorHsmClientCertificateQuotaExceeded),
                            @"HsmConfigurationAlreadyExistsFault" : @(AWSredshiftErrorHsmConfigurationAlreadyExists),
                            @"HsmConfigurationNotFoundFault" : @(AWSredshiftErrorHsmConfigurationNotFound),
                            @"HsmConfigurationQuotaExceededFault" : @(AWSredshiftErrorHsmConfigurationQuotaExceeded),
                            @"InProgressTableRestoreQuotaExceededFault" : @(AWSredshiftErrorInProgressTableRestoreQuotaExceeded),
                            @"IncompatibleOrderableOptions" : @(AWSredshiftErrorIncompatibleOrderableOptions),
                            @"InsufficientClusterCapacity" : @(AWSredshiftErrorInsufficientClusterCapacity),
                            @"InsufficientS3BucketPolicyFault" : @(AWSredshiftErrorInsufficientS3BucketPolicy),
                            @"InvalidClusterParameterGroupState" : @(AWSredshiftErrorInvalidClusterParameterGroupState),
                            @"InvalidClusterSecurityGroupState" : @(AWSredshiftErrorInvalidClusterSecurityGroupState),
                            @"InvalidClusterSnapshotScheduleState" : @(AWSredshiftErrorInvalidClusterSnapshotScheduleState),
                            @"InvalidClusterSnapshotState" : @(AWSredshiftErrorInvalidClusterSnapshotState),
                            @"InvalidClusterState" : @(AWSredshiftErrorInvalidClusterState),
                            @"InvalidClusterSubnetGroupStateFault" : @(AWSredshiftErrorInvalidClusterSubnetGroupState),
                            @"InvalidClusterSubnetStateFault" : @(AWSredshiftErrorInvalidClusterSubnetState),
                            @"InvalidClusterTrack" : @(AWSredshiftErrorInvalidClusterTrack),
                            @"InvalidElasticIpFault" : @(AWSredshiftErrorInvalidElasticIp),
                            @"InvalidHsmClientCertificateStateFault" : @(AWSredshiftErrorInvalidHsmClientCertificateState),
                            @"InvalidHsmConfigurationStateFault" : @(AWSredshiftErrorInvalidHsmConfigurationState),
                            @"InvalidReservedNodeState" : @(AWSredshiftErrorInvalidReservedNodeState),
                            @"InvalidRestore" : @(AWSredshiftErrorInvalidRestore),
                            @"InvalidRetentionPeriodFault" : @(AWSredshiftErrorInvalidRetentionPeriod),
                            @"InvalidS3BucketNameFault" : @(AWSredshiftErrorInvalidS3BucketName),
                            @"InvalidS3KeyPrefixFault" : @(AWSredshiftErrorInvalidS3KeyPrefix),
                            @"InvalidSchedule" : @(AWSredshiftErrorInvalidSchedule),
                            @"InvalidScheduledAction" : @(AWSredshiftErrorInvalidScheduledAction),
                            @"InvalidSnapshotCopyGrantStateFault" : @(AWSredshiftErrorInvalidSnapshotCopyGrantState),
                            @"InvalidSubnet" : @(AWSredshiftErrorInvalidSubnet),
                            @"InvalidSubscriptionStateFault" : @(AWSredshiftErrorInvalidSubscriptionState),
                            @"InvalidTableRestoreArgument" : @(AWSredshiftErrorInvalidTableRestoreArgument),
                            @"InvalidTagFault" : @(AWSredshiftErrorInvalidTag),
                            @"InvalidUsageLimit" : @(AWSredshiftErrorInvalidUsageLimit),
                            @"InvalidVPCNetworkStateFault" : @(AWSredshiftErrorInvalidVPCNetworkState),
                            @"LimitExceededFault" : @(AWSredshiftErrorLimitExceeded),
                            @"NumberOfNodesPerClusterLimitExceeded" : @(AWSredshiftErrorNumberOfNodesPerClusterLimitExceeded),
                            @"NumberOfNodesQuotaExceeded" : @(AWSredshiftErrorNumberOfNodesQuotaExceeded),
                            @"ReservedNodeAlreadyExists" : @(AWSredshiftErrorReservedNodeAlreadyExists),
                            @"ReservedNodeAlreadyMigrated" : @(AWSredshiftErrorReservedNodeAlreadyMigrated),
                            @"ReservedNodeNotFound" : @(AWSredshiftErrorReservedNodeNotFound),
                            @"ReservedNodeOfferingNotFound" : @(AWSredshiftErrorReservedNodeOfferingNotFound),
                            @"ReservedNodeQuotaExceeded" : @(AWSredshiftErrorReservedNodeQuotaExceeded),
                            @"ResizeNotFound" : @(AWSredshiftErrorResizeNotFound),
                            @"ResourceNotFoundFault" : @(AWSredshiftErrorResourceNotFound),
                            @"SNSInvalidTopic" : @(AWSredshiftErrorSNSInvalidTopic),
                            @"SNSNoAuthorization" : @(AWSredshiftErrorSNSNoAuthorization),
                            @"SNSTopicArnNotFound" : @(AWSredshiftErrorSNSTopicArnNotFound),
                            @"ScheduleDefinitionTypeUnsupported" : @(AWSredshiftErrorScheduleDefinitionTypeUnsupported),
                            @"ScheduledActionAlreadyExists" : @(AWSredshiftErrorScheduledActionAlreadyExists),
                            @"ScheduledActionNotFound" : @(AWSredshiftErrorScheduledActionNotFound),
                            @"ScheduledActionQuotaExceeded" : @(AWSredshiftErrorScheduledActionQuotaExceeded),
                            @"ScheduledActionTypeUnsupported" : @(AWSredshiftErrorScheduledActionTypeUnsupported),
                            @"SnapshotCopyAlreadyDisabledFault" : @(AWSredshiftErrorSnapshotCopyAlreadyDisabled),
                            @"SnapshotCopyAlreadyEnabledFault" : @(AWSredshiftErrorSnapshotCopyAlreadyEnabled),
                            @"SnapshotCopyDisabledFault" : @(AWSredshiftErrorSnapshotCopyDisabled),
                            @"SnapshotCopyGrantAlreadyExistsFault" : @(AWSredshiftErrorSnapshotCopyGrantAlreadyExists),
                            @"SnapshotCopyGrantNotFoundFault" : @(AWSredshiftErrorSnapshotCopyGrantNotFound),
                            @"SnapshotCopyGrantQuotaExceededFault" : @(AWSredshiftErrorSnapshotCopyGrantQuotaExceeded),
                            @"SnapshotScheduleAlreadyExists" : @(AWSredshiftErrorSnapshotScheduleAlreadyExists),
                            @"SnapshotScheduleNotFound" : @(AWSredshiftErrorSnapshotScheduleNotFound),
                            @"SnapshotScheduleQuotaExceeded" : @(AWSredshiftErrorSnapshotScheduleQuotaExceeded),
                            @"SnapshotScheduleUpdateInProgress" : @(AWSredshiftErrorSnapshotScheduleUpdateInProgress),
                            @"SourceNotFound" : @(AWSredshiftErrorSourceNotFound),
                            @"SubnetAlreadyInUse" : @(AWSredshiftErrorSubnetAlreadyInUse),
                            @"SubscriptionAlreadyExist" : @(AWSredshiftErrorSubscriptionAlreadyExist),
                            @"SubscriptionCategoryNotFound" : @(AWSredshiftErrorSubscriptionCategoryNotFound),
                            @"SubscriptionEventIdNotFound" : @(AWSredshiftErrorSubscriptionEventIdNotFound),
                            @"SubscriptionNotFound" : @(AWSredshiftErrorSubscriptionNotFound),
                            @"SubscriptionSeverityNotFound" : @(AWSredshiftErrorSubscriptionSeverityNotFound),
                            @"TableLimitExceeded" : @(AWSredshiftErrorTableLimitExceeded),
                            @"TableRestoreNotFoundFault" : @(AWSredshiftErrorTableRestoreNotFound),
                            @"TagLimitExceededFault" : @(AWSredshiftErrorTagLimitExceeded),
                            @"UnauthorizedOperation" : @(AWSredshiftErrorUnauthorizedOperation),
                            @"UnknownSnapshotCopyRegionFault" : @(AWSredshiftErrorUnknownSnapshotCopyRegion),
                            @"UnsupportedOperation" : @(AWSredshiftErrorUnsupportedOperation),
                            @"UnsupportedOptionFault" : @(AWSredshiftErrorUnsupportedOption),
                            @"UsageLimitAlreadyExists" : @(AWSredshiftErrorUsageLimitAlreadyExists),
                            @"UsageLimitNotFound" : @(AWSredshiftErrorUsageLimitNotFound),
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
                *error = [NSError errorWithDomain:AWSredshiftErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                         ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSredshiftErrorDomain
                                             code:AWSredshiftErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSredshiftErrorDomain
                                     code:AWSredshiftErrorUnknown
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

@interface AWSredshiftRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSredshiftRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSredshift()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSredshift

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSredshiftSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSredshift versions need to match. Check your SDK installation. AWSCore: %@ AWSredshift: %@", AWSiOSSDKVersion, AWSredshiftSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultredshift {
    static AWSredshift *_defaultredshift = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInforedshift];
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
        _defaultredshift = [[AWSredshift alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultredshift;
}

+ (void)registerredshiftWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSredshift alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)redshiftForKey:(NSString *)key {
    @synchronized(self) {
        AWSredshift *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInforedshift
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSredshift registerredshiftWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeredshiftForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultredshift` or `+ redshiftForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceredshift
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceredshift];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSredshiftRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSredshiftResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSredshiftResponseSerializer alloc] initWithJSONDefinition:[[AWSredshiftResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSredshiftAcceptReservedNodeExchangeOutputMessage *> *)acceptReservedNodeExchange:(AWSredshiftAcceptReservedNodeExchangeInputMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AcceptReservedNodeExchange"
                   outputClass:[AWSredshiftAcceptReservedNodeExchangeOutputMessage class]];
}

- (void)acceptReservedNodeExchange:(AWSredshiftAcceptReservedNodeExchangeInputMessage *)request
     completionHandler:(void (^)(AWSredshiftAcceptReservedNodeExchangeOutputMessage *response, NSError *error))completionHandler {
    [[self acceptReservedNodeExchange:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftAcceptReservedNodeExchangeOutputMessage *> * _Nonnull task) {
        AWSredshiftAcceptReservedNodeExchangeOutputMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftAuthorizeClusterSecurityGroupIngressResult *> *)authorizeClusterSecurityGroupIngress:(AWSredshiftAuthorizeClusterSecurityGroupIngressMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeClusterSecurityGroupIngress"
                   outputClass:[AWSredshiftAuthorizeClusterSecurityGroupIngressResult class]];
}

- (void)authorizeClusterSecurityGroupIngress:(AWSredshiftAuthorizeClusterSecurityGroupIngressMessage *)request
     completionHandler:(void (^)(AWSredshiftAuthorizeClusterSecurityGroupIngressResult *response, NSError *error))completionHandler {
    [[self authorizeClusterSecurityGroupIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftAuthorizeClusterSecurityGroupIngressResult *> * _Nonnull task) {
        AWSredshiftAuthorizeClusterSecurityGroupIngressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftAuthorizeSnapshotAccessResult *> *)authorizeSnapshotAccess:(AWSredshiftAuthorizeSnapshotAccessMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AuthorizeSnapshotAccess"
                   outputClass:[AWSredshiftAuthorizeSnapshotAccessResult class]];
}

- (void)authorizeSnapshotAccess:(AWSredshiftAuthorizeSnapshotAccessMessage *)request
     completionHandler:(void (^)(AWSredshiftAuthorizeSnapshotAccessResult *response, NSError *error))completionHandler {
    [[self authorizeSnapshotAccess:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftAuthorizeSnapshotAccessResult *> * _Nonnull task) {
        AWSredshiftAuthorizeSnapshotAccessResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftBatchDeleteClusterSnapshotsResult *> *)batchDeleteClusterSnapshots:(AWSredshiftBatchDeleteClusterSnapshotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BatchDeleteClusterSnapshots"
                   outputClass:[AWSredshiftBatchDeleteClusterSnapshotsResult class]];
}

- (void)batchDeleteClusterSnapshots:(AWSredshiftBatchDeleteClusterSnapshotsRequest *)request
     completionHandler:(void (^)(AWSredshiftBatchDeleteClusterSnapshotsResult *response, NSError *error))completionHandler {
    [[self batchDeleteClusterSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftBatchDeleteClusterSnapshotsResult *> * _Nonnull task) {
        AWSredshiftBatchDeleteClusterSnapshotsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftBatchModifyClusterSnapshotsOutputMessage *> *)batchModifyClusterSnapshots:(AWSredshiftBatchModifyClusterSnapshotsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BatchModifyClusterSnapshots"
                   outputClass:[AWSredshiftBatchModifyClusterSnapshotsOutputMessage class]];
}

- (void)batchModifyClusterSnapshots:(AWSredshiftBatchModifyClusterSnapshotsMessage *)request
     completionHandler:(void (^)(AWSredshiftBatchModifyClusterSnapshotsOutputMessage *response, NSError *error))completionHandler {
    [[self batchModifyClusterSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftBatchModifyClusterSnapshotsOutputMessage *> * _Nonnull task) {
        AWSredshiftBatchModifyClusterSnapshotsOutputMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftResizeProgressMessage *> *)cancelResize:(AWSredshiftCancelResizeMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CancelResize"
                   outputClass:[AWSredshiftResizeProgressMessage class]];
}

- (void)cancelResize:(AWSredshiftCancelResizeMessage *)request
     completionHandler:(void (^)(AWSredshiftResizeProgressMessage *response, NSError *error))completionHandler {
    [[self cancelResize:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftResizeProgressMessage *> * _Nonnull task) {
        AWSredshiftResizeProgressMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftReplicateClusterSnapshotResult *> *)replicateClusterSnapshot:(AWSredshiftReplicateClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CopyClusterSnapshot"
                   outputClass:[AWSredshiftReplicateClusterSnapshotResult class]];
}

- (void)replicateClusterSnapshot:(AWSredshiftReplicateClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSredshiftReplicateClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self replicateClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftReplicateClusterSnapshotResult *> * _Nonnull task) {
        AWSredshiftReplicateClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftCreateClusterResult *> *)createCluster:(AWSredshiftCreateClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateCluster"
                   outputClass:[AWSredshiftCreateClusterResult class]];
}

- (void)createCluster:(AWSredshiftCreateClusterMessage *)request
     completionHandler:(void (^)(AWSredshiftCreateClusterResult *response, NSError *error))completionHandler {
    [[self createCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftCreateClusterResult *> * _Nonnull task) {
        AWSredshiftCreateClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftCreateClusterParameterGroupResult *> *)createClusterParameterGroup:(AWSredshiftCreateClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateClusterParameterGroup"
                   outputClass:[AWSredshiftCreateClusterParameterGroupResult class]];
}

- (void)createClusterParameterGroup:(AWSredshiftCreateClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSredshiftCreateClusterParameterGroupResult *response, NSError *error))completionHandler {
    [[self createClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftCreateClusterParameterGroupResult *> * _Nonnull task) {
        AWSredshiftCreateClusterParameterGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftCreateClusterSecurityGroupResult *> *)createClusterSecurityGroup:(AWSredshiftCreateClusterSecurityGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateClusterSecurityGroup"
                   outputClass:[AWSredshiftCreateClusterSecurityGroupResult class]];
}

- (void)createClusterSecurityGroup:(AWSredshiftCreateClusterSecurityGroupMessage *)request
     completionHandler:(void (^)(AWSredshiftCreateClusterSecurityGroupResult *response, NSError *error))completionHandler {
    [[self createClusterSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftCreateClusterSecurityGroupResult *> * _Nonnull task) {
        AWSredshiftCreateClusterSecurityGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftCreateClusterSnapshotResult *> *)createClusterSnapshot:(AWSredshiftCreateClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateClusterSnapshot"
                   outputClass:[AWSredshiftCreateClusterSnapshotResult class]];
}

- (void)createClusterSnapshot:(AWSredshiftCreateClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSredshiftCreateClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self createClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftCreateClusterSnapshotResult *> * _Nonnull task) {
        AWSredshiftCreateClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftCreateClusterSubnetGroupResult *> *)createClusterSubnetGroup:(AWSredshiftCreateClusterSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateClusterSubnetGroup"
                   outputClass:[AWSredshiftCreateClusterSubnetGroupResult class]];
}

- (void)createClusterSubnetGroup:(AWSredshiftCreateClusterSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSredshiftCreateClusterSubnetGroupResult *response, NSError *error))completionHandler {
    [[self createClusterSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftCreateClusterSubnetGroupResult *> * _Nonnull task) {
        AWSredshiftCreateClusterSubnetGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftCreateEventSubscriptionResult *> *)createEventSubscription:(AWSredshiftCreateEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateEventSubscription"
                   outputClass:[AWSredshiftCreateEventSubscriptionResult class]];
}

- (void)createEventSubscription:(AWSredshiftCreateEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSredshiftCreateEventSubscriptionResult *response, NSError *error))completionHandler {
    [[self createEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftCreateEventSubscriptionResult *> * _Nonnull task) {
        AWSredshiftCreateEventSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftCreateHsmClientCertificateResult *> *)createHsmClientCertificate:(AWSredshiftCreateHsmClientCertificateMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateHsmClientCertificate"
                   outputClass:[AWSredshiftCreateHsmClientCertificateResult class]];
}

- (void)createHsmClientCertificate:(AWSredshiftCreateHsmClientCertificateMessage *)request
     completionHandler:(void (^)(AWSredshiftCreateHsmClientCertificateResult *response, NSError *error))completionHandler {
    [[self createHsmClientCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftCreateHsmClientCertificateResult *> * _Nonnull task) {
        AWSredshiftCreateHsmClientCertificateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftCreateHsmConfigurationResult *> *)createHsmConfiguration:(AWSredshiftCreateHsmConfigurationMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateHsmConfiguration"
                   outputClass:[AWSredshiftCreateHsmConfigurationResult class]];
}

- (void)createHsmConfiguration:(AWSredshiftCreateHsmConfigurationMessage *)request
     completionHandler:(void (^)(AWSredshiftCreateHsmConfigurationResult *response, NSError *error))completionHandler {
    [[self createHsmConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftCreateHsmConfigurationResult *> * _Nonnull task) {
        AWSredshiftCreateHsmConfigurationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftScheduledAction *> *)createScheduledAction:(AWSredshiftCreateScheduledActionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateScheduledAction"
                   outputClass:[AWSredshiftScheduledAction class]];
}

- (void)createScheduledAction:(AWSredshiftCreateScheduledActionMessage *)request
     completionHandler:(void (^)(AWSredshiftScheduledAction *response, NSError *error))completionHandler {
    [[self createScheduledAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftScheduledAction *> * _Nonnull task) {
        AWSredshiftScheduledAction *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftCreateSnapshotCopyGrantResult *> *)createSnapshotCopyGrant:(AWSredshiftCreateSnapshotCopyGrantMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSnapshotCopyGrant"
                   outputClass:[AWSredshiftCreateSnapshotCopyGrantResult class]];
}

- (void)createSnapshotCopyGrant:(AWSredshiftCreateSnapshotCopyGrantMessage *)request
     completionHandler:(void (^)(AWSredshiftCreateSnapshotCopyGrantResult *response, NSError *error))completionHandler {
    [[self createSnapshotCopyGrant:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftCreateSnapshotCopyGrantResult *> * _Nonnull task) {
        AWSredshiftCreateSnapshotCopyGrantResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftSnapshotSchedule *> *)createSnapshotSchedule:(AWSredshiftCreateSnapshotScheduleMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSnapshotSchedule"
                   outputClass:[AWSredshiftSnapshotSchedule class]];
}

- (void)createSnapshotSchedule:(AWSredshiftCreateSnapshotScheduleMessage *)request
     completionHandler:(void (^)(AWSredshiftSnapshotSchedule *response, NSError *error))completionHandler {
    [[self createSnapshotSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftSnapshotSchedule *> * _Nonnull task) {
        AWSredshiftSnapshotSchedule *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createTags:(AWSredshiftCreateTagsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTags"
                   outputClass:nil];
}

- (void)createTags:(AWSredshiftCreateTagsMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftUsageLimit *> *)createUsageLimit:(AWSredshiftCreateUsageLimitMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateUsageLimit"
                   outputClass:[AWSredshiftUsageLimit class]];
}

- (void)createUsageLimit:(AWSredshiftCreateUsageLimitMessage *)request
     completionHandler:(void (^)(AWSredshiftUsageLimit *response, NSError *error))completionHandler {
    [[self createUsageLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftUsageLimit *> * _Nonnull task) {
        AWSredshiftUsageLimit *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftDeleteClusterResult *> *)deleteCluster:(AWSredshiftDeleteClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteCluster"
                   outputClass:[AWSredshiftDeleteClusterResult class]];
}

- (void)deleteCluster:(AWSredshiftDeleteClusterMessage *)request
     completionHandler:(void (^)(AWSredshiftDeleteClusterResult *response, NSError *error))completionHandler {
    [[self deleteCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftDeleteClusterResult *> * _Nonnull task) {
        AWSredshiftDeleteClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteClusterParameterGroup:(AWSredshiftDeleteClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteClusterParameterGroup"
                   outputClass:nil];
}

- (void)deleteClusterParameterGroup:(AWSredshiftDeleteClusterParameterGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteClusterSecurityGroup:(AWSredshiftDeleteClusterSecurityGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteClusterSecurityGroup"
                   outputClass:nil];
}

- (void)deleteClusterSecurityGroup:(AWSredshiftDeleteClusterSecurityGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteClusterSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftDeleteClusterSnapshotResult *> *)deleteClusterSnapshot:(AWSredshiftDeleteClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteClusterSnapshot"
                   outputClass:[AWSredshiftDeleteClusterSnapshotResult class]];
}

- (void)deleteClusterSnapshot:(AWSredshiftDeleteClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSredshiftDeleteClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self deleteClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftDeleteClusterSnapshotResult *> * _Nonnull task) {
        AWSredshiftDeleteClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteClusterSubnetGroup:(AWSredshiftDeleteClusterSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteClusterSubnetGroup"
                   outputClass:nil];
}

- (void)deleteClusterSubnetGroup:(AWSredshiftDeleteClusterSubnetGroupMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteClusterSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEventSubscription:(AWSredshiftDeleteEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteEventSubscription"
                   outputClass:nil];
}

- (void)deleteEventSubscription:(AWSredshiftDeleteEventSubscriptionMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteHsmClientCertificate:(AWSredshiftDeleteHsmClientCertificateMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteHsmClientCertificate"
                   outputClass:nil];
}

- (void)deleteHsmClientCertificate:(AWSredshiftDeleteHsmClientCertificateMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteHsmClientCertificate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteHsmConfiguration:(AWSredshiftDeleteHsmConfigurationMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteHsmConfiguration"
                   outputClass:nil];
}

- (void)deleteHsmConfiguration:(AWSredshiftDeleteHsmConfigurationMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteHsmConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteScheduledAction:(AWSredshiftDeleteScheduledActionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteScheduledAction"
                   outputClass:nil];
}

- (void)deleteScheduledAction:(AWSredshiftDeleteScheduledActionMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteScheduledAction:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSnapshotCopyGrant:(AWSredshiftDeleteSnapshotCopyGrantMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSnapshotCopyGrant"
                   outputClass:nil];
}

- (void)deleteSnapshotCopyGrant:(AWSredshiftDeleteSnapshotCopyGrantMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSnapshotCopyGrant:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSnapshotSchedule:(AWSredshiftDeleteSnapshotScheduleMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSnapshotSchedule"
                   outputClass:nil];
}

- (void)deleteSnapshotSchedule:(AWSredshiftDeleteSnapshotScheduleMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSnapshotSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteTags:(AWSredshiftDeleteTagsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTags"
                   outputClass:nil];
}

- (void)deleteTags:(AWSredshiftDeleteTagsMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUsageLimit:(AWSredshiftDeleteUsageLimitMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteUsageLimit"
                   outputClass:nil];
}

- (void)deleteUsageLimit:(AWSredshiftDeleteUsageLimitMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUsageLimit:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftAccountAttributeList *> *)describeAccountAttributes:(AWSredshiftDescribeAccountAttributesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSredshiftAccountAttributeList class]];
}

- (void)describeAccountAttributes:(AWSredshiftDescribeAccountAttributesMessage *)request
     completionHandler:(void (^)(AWSredshiftAccountAttributeList *response, NSError *error))completionHandler {
    [[self describeAccountAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftAccountAttributeList *> * _Nonnull task) {
        AWSredshiftAccountAttributeList *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftClusterDbRevisionsMessage *> *)describeClusterDbRevisions:(AWSredshiftDescribeClusterDbRevisionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClusterDbRevisions"
                   outputClass:[AWSredshiftClusterDbRevisionsMessage class]];
}

- (void)describeClusterDbRevisions:(AWSredshiftDescribeClusterDbRevisionsMessage *)request
     completionHandler:(void (^)(AWSredshiftClusterDbRevisionsMessage *response, NSError *error))completionHandler {
    [[self describeClusterDbRevisions:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftClusterDbRevisionsMessage *> * _Nonnull task) {
        AWSredshiftClusterDbRevisionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftClusterParameterGroupsMessage *> *)describeClusterParameterGroups:(AWSredshiftDescribeClusterParameterGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClusterParameterGroups"
                   outputClass:[AWSredshiftClusterParameterGroupsMessage class]];
}

- (void)describeClusterParameterGroups:(AWSredshiftDescribeClusterParameterGroupsMessage *)request
     completionHandler:(void (^)(AWSredshiftClusterParameterGroupsMessage *response, NSError *error))completionHandler {
    [[self describeClusterParameterGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftClusterParameterGroupsMessage *> * _Nonnull task) {
        AWSredshiftClusterParameterGroupsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftClusterParameterGroupDetails *> *)describeClusterParameters:(AWSredshiftDescribeClusterParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClusterParameters"
                   outputClass:[AWSredshiftClusterParameterGroupDetails class]];
}

- (void)describeClusterParameters:(AWSredshiftDescribeClusterParametersMessage *)request
     completionHandler:(void (^)(AWSredshiftClusterParameterGroupDetails *response, NSError *error))completionHandler {
    [[self describeClusterParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftClusterParameterGroupDetails *> * _Nonnull task) {
        AWSredshiftClusterParameterGroupDetails *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftClusterSecurityGroupMessage *> *)describeClusterSecurityGroups:(AWSredshiftDescribeClusterSecurityGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClusterSecurityGroups"
                   outputClass:[AWSredshiftClusterSecurityGroupMessage class]];
}

- (void)describeClusterSecurityGroups:(AWSredshiftDescribeClusterSecurityGroupsMessage *)request
     completionHandler:(void (^)(AWSredshiftClusterSecurityGroupMessage *response, NSError *error))completionHandler {
    [[self describeClusterSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftClusterSecurityGroupMessage *> * _Nonnull task) {
        AWSredshiftClusterSecurityGroupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftSnapshotMessage *> *)describeClusterSnapshots:(AWSredshiftDescribeClusterSnapshotsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClusterSnapshots"
                   outputClass:[AWSredshiftSnapshotMessage class]];
}

- (void)describeClusterSnapshots:(AWSredshiftDescribeClusterSnapshotsMessage *)request
     completionHandler:(void (^)(AWSredshiftSnapshotMessage *response, NSError *error))completionHandler {
    [[self describeClusterSnapshots:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftSnapshotMessage *> * _Nonnull task) {
        AWSredshiftSnapshotMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftClusterSubnetGroupMessage *> *)describeClusterSubnetGroups:(AWSredshiftDescribeClusterSubnetGroupsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClusterSubnetGroups"
                   outputClass:[AWSredshiftClusterSubnetGroupMessage class]];
}

- (void)describeClusterSubnetGroups:(AWSredshiftDescribeClusterSubnetGroupsMessage *)request
     completionHandler:(void (^)(AWSredshiftClusterSubnetGroupMessage *response, NSError *error))completionHandler {
    [[self describeClusterSubnetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftClusterSubnetGroupMessage *> * _Nonnull task) {
        AWSredshiftClusterSubnetGroupMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftTrackListMessage *> *)describeClusterTracks:(AWSredshiftDescribeClusterTracksMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClusterTracks"
                   outputClass:[AWSredshiftTrackListMessage class]];
}

- (void)describeClusterTracks:(AWSredshiftDescribeClusterTracksMessage *)request
     completionHandler:(void (^)(AWSredshiftTrackListMessage *response, NSError *error))completionHandler {
    [[self describeClusterTracks:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftTrackListMessage *> * _Nonnull task) {
        AWSredshiftTrackListMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftClusterVersionsMessage *> *)describeClusterVersions:(AWSredshiftDescribeClusterVersionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClusterVersions"
                   outputClass:[AWSredshiftClusterVersionsMessage class]];
}

- (void)describeClusterVersions:(AWSredshiftDescribeClusterVersionsMessage *)request
     completionHandler:(void (^)(AWSredshiftClusterVersionsMessage *response, NSError *error))completionHandler {
    [[self describeClusterVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftClusterVersionsMessage *> * _Nonnull task) {
        AWSredshiftClusterVersionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftClustersMessage *> *)describeClusters:(AWSredshiftDescribeClustersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeClusters"
                   outputClass:[AWSredshiftClustersMessage class]];
}

- (void)describeClusters:(AWSredshiftDescribeClustersMessage *)request
     completionHandler:(void (^)(AWSredshiftClustersMessage *response, NSError *error))completionHandler {
    [[self describeClusters:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftClustersMessage *> * _Nonnull task) {
        AWSredshiftClustersMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftDescribeDefaultClusterParametersResult *> *)describeDefaultClusterParameters:(AWSredshiftDescribeDefaultClusterParametersMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeDefaultClusterParameters"
                   outputClass:[AWSredshiftDescribeDefaultClusterParametersResult class]];
}

- (void)describeDefaultClusterParameters:(AWSredshiftDescribeDefaultClusterParametersMessage *)request
     completionHandler:(void (^)(AWSredshiftDescribeDefaultClusterParametersResult *response, NSError *error))completionHandler {
    [[self describeDefaultClusterParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftDescribeDefaultClusterParametersResult *> * _Nonnull task) {
        AWSredshiftDescribeDefaultClusterParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftEventCategoriesMessage *> *)describeEventCategories:(AWSredshiftDescribeEventCategoriesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEventCategories"
                   outputClass:[AWSredshiftEventCategoriesMessage class]];
}

- (void)describeEventCategories:(AWSredshiftDescribeEventCategoriesMessage *)request
     completionHandler:(void (^)(AWSredshiftEventCategoriesMessage *response, NSError *error))completionHandler {
    [[self describeEventCategories:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftEventCategoriesMessage *> * _Nonnull task) {
        AWSredshiftEventCategoriesMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftEventSubscriptionsMessage *> *)describeEventSubscriptions:(AWSredshiftDescribeEventSubscriptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEventSubscriptions"
                   outputClass:[AWSredshiftEventSubscriptionsMessage class]];
}

- (void)describeEventSubscriptions:(AWSredshiftDescribeEventSubscriptionsMessage *)request
     completionHandler:(void (^)(AWSredshiftEventSubscriptionsMessage *response, NSError *error))completionHandler {
    [[self describeEventSubscriptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftEventSubscriptionsMessage *> * _Nonnull task) {
        AWSredshiftEventSubscriptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftEventsMessage *> *)describeEvents:(AWSredshiftDescribeEventsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeEvents"
                   outputClass:[AWSredshiftEventsMessage class]];
}

- (void)describeEvents:(AWSredshiftDescribeEventsMessage *)request
     completionHandler:(void (^)(AWSredshiftEventsMessage *response, NSError *error))completionHandler {
    [[self describeEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftEventsMessage *> * _Nonnull task) {
        AWSredshiftEventsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftHsmClientCertificateMessage *> *)describeHsmClientCertificates:(AWSredshiftDescribeHsmClientCertificatesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeHsmClientCertificates"
                   outputClass:[AWSredshiftHsmClientCertificateMessage class]];
}

- (void)describeHsmClientCertificates:(AWSredshiftDescribeHsmClientCertificatesMessage *)request
     completionHandler:(void (^)(AWSredshiftHsmClientCertificateMessage *response, NSError *error))completionHandler {
    [[self describeHsmClientCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftHsmClientCertificateMessage *> * _Nonnull task) {
        AWSredshiftHsmClientCertificateMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftHsmConfigurationMessage *> *)describeHsmConfigurations:(AWSredshiftDescribeHsmConfigurationsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeHsmConfigurations"
                   outputClass:[AWSredshiftHsmConfigurationMessage class]];
}

- (void)describeHsmConfigurations:(AWSredshiftDescribeHsmConfigurationsMessage *)request
     completionHandler:(void (^)(AWSredshiftHsmConfigurationMessage *response, NSError *error))completionHandler {
    [[self describeHsmConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftHsmConfigurationMessage *> * _Nonnull task) {
        AWSredshiftHsmConfigurationMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftLoggingStatus *> *)describeLoggingStatus:(AWSredshiftDescribeLoggingStatusMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoggingStatus"
                   outputClass:[AWSredshiftLoggingStatus class]];
}

- (void)describeLoggingStatus:(AWSredshiftDescribeLoggingStatusMessage *)request
     completionHandler:(void (^)(AWSredshiftLoggingStatus *response, NSError *error))completionHandler {
    [[self describeLoggingStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftLoggingStatus *> * _Nonnull task) {
        AWSredshiftLoggingStatus *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftNodeConfigurationOptionsMessage *> *)describeNodeConfigurationOptions:(AWSredshiftDescribeNodeConfigurationOptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNodeConfigurationOptions"
                   outputClass:[AWSredshiftNodeConfigurationOptionsMessage class]];
}

- (void)describeNodeConfigurationOptions:(AWSredshiftDescribeNodeConfigurationOptionsMessage *)request
     completionHandler:(void (^)(AWSredshiftNodeConfigurationOptionsMessage *response, NSError *error))completionHandler {
    [[self describeNodeConfigurationOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftNodeConfigurationOptionsMessage *> * _Nonnull task) {
        AWSredshiftNodeConfigurationOptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftOrderableClusterOptionsMessage *> *)describeOrderableClusterOptions:(AWSredshiftDescribeOrderableClusterOptionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeOrderableClusterOptions"
                   outputClass:[AWSredshiftOrderableClusterOptionsMessage class]];
}

- (void)describeOrderableClusterOptions:(AWSredshiftDescribeOrderableClusterOptionsMessage *)request
     completionHandler:(void (^)(AWSredshiftOrderableClusterOptionsMessage *response, NSError *error))completionHandler {
    [[self describeOrderableClusterOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftOrderableClusterOptionsMessage *> * _Nonnull task) {
        AWSredshiftOrderableClusterOptionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftReservedNodeOfferingsMessage *> *)describeReservedNodeOfferings:(AWSredshiftDescribeReservedNodeOfferingsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedNodeOfferings"
                   outputClass:[AWSredshiftReservedNodeOfferingsMessage class]];
}

- (void)describeReservedNodeOfferings:(AWSredshiftDescribeReservedNodeOfferingsMessage *)request
     completionHandler:(void (^)(AWSredshiftReservedNodeOfferingsMessage *response, NSError *error))completionHandler {
    [[self describeReservedNodeOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftReservedNodeOfferingsMessage *> * _Nonnull task) {
        AWSredshiftReservedNodeOfferingsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftReservedNodesMessage *> *)describeReservedNodes:(AWSredshiftDescribeReservedNodesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeReservedNodes"
                   outputClass:[AWSredshiftReservedNodesMessage class]];
}

- (void)describeReservedNodes:(AWSredshiftDescribeReservedNodesMessage *)request
     completionHandler:(void (^)(AWSredshiftReservedNodesMessage *response, NSError *error))completionHandler {
    [[self describeReservedNodes:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftReservedNodesMessage *> * _Nonnull task) {
        AWSredshiftReservedNodesMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftResizeProgressMessage *> *)describeResize:(AWSredshiftDescribeResizeMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeResize"
                   outputClass:[AWSredshiftResizeProgressMessage class]];
}

- (void)describeResize:(AWSredshiftDescribeResizeMessage *)request
     completionHandler:(void (^)(AWSredshiftResizeProgressMessage *response, NSError *error))completionHandler {
    [[self describeResize:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftResizeProgressMessage *> * _Nonnull task) {
        AWSredshiftResizeProgressMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftScheduledActionsMessage *> *)describeScheduledActions:(AWSredshiftDescribeScheduledActionsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScheduledActions"
                   outputClass:[AWSredshiftScheduledActionsMessage class]];
}

- (void)describeScheduledActions:(AWSredshiftDescribeScheduledActionsMessage *)request
     completionHandler:(void (^)(AWSredshiftScheduledActionsMessage *response, NSError *error))completionHandler {
    [[self describeScheduledActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftScheduledActionsMessage *> * _Nonnull task) {
        AWSredshiftScheduledActionsMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftSnapshotCopyGrantMessage *> *)describeSnapshotCopyGrants:(AWSredshiftDescribeSnapshotCopyGrantsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSnapshotCopyGrants"
                   outputClass:[AWSredshiftSnapshotCopyGrantMessage class]];
}

- (void)describeSnapshotCopyGrants:(AWSredshiftDescribeSnapshotCopyGrantsMessage *)request
     completionHandler:(void (^)(AWSredshiftSnapshotCopyGrantMessage *response, NSError *error))completionHandler {
    [[self describeSnapshotCopyGrants:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftSnapshotCopyGrantMessage *> * _Nonnull task) {
        AWSredshiftSnapshotCopyGrantMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftDescribeSnapshotSchedulesOutputMessage *> *)describeSnapshotSchedules:(AWSredshiftDescribeSnapshotSchedulesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeSnapshotSchedules"
                   outputClass:[AWSredshiftDescribeSnapshotSchedulesOutputMessage class]];
}

- (void)describeSnapshotSchedules:(AWSredshiftDescribeSnapshotSchedulesMessage *)request
     completionHandler:(void (^)(AWSredshiftDescribeSnapshotSchedulesOutputMessage *response, NSError *error))completionHandler {
    [[self describeSnapshotSchedules:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftDescribeSnapshotSchedulesOutputMessage *> * _Nonnull task) {
        AWSredshiftDescribeSnapshotSchedulesOutputMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftCustomerStorageMessage *> *)describeStorage:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeStorage"
                   outputClass:[AWSredshiftCustomerStorageMessage class]];
}

- (void)describeStorage:(AWSRequest *)request
     completionHandler:(void (^)(AWSredshiftCustomerStorageMessage *response, NSError *error))completionHandler {
    [[self describeStorage:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftCustomerStorageMessage *> * _Nonnull task) {
        AWSredshiftCustomerStorageMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftTableRestoreStatusMessage *> *)describeTableRestoreStatus:(AWSredshiftDescribeTableRestoreStatusMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTableRestoreStatus"
                   outputClass:[AWSredshiftTableRestoreStatusMessage class]];
}

- (void)describeTableRestoreStatus:(AWSredshiftDescribeTableRestoreStatusMessage *)request
     completionHandler:(void (^)(AWSredshiftTableRestoreStatusMessage *response, NSError *error))completionHandler {
    [[self describeTableRestoreStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftTableRestoreStatusMessage *> * _Nonnull task) {
        AWSredshiftTableRestoreStatusMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftTaggedResourceListMessage *> *)describeTags:(AWSredshiftDescribeTagsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSredshiftTaggedResourceListMessage class]];
}

- (void)describeTags:(AWSredshiftDescribeTagsMessage *)request
     completionHandler:(void (^)(AWSredshiftTaggedResourceListMessage *response, NSError *error))completionHandler {
    [[self describeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftTaggedResourceListMessage *> * _Nonnull task) {
        AWSredshiftTaggedResourceListMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftUsageLimitList *> *)describeUsageLimits:(AWSredshiftDescribeUsageLimitsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeUsageLimits"
                   outputClass:[AWSredshiftUsageLimitList class]];
}

- (void)describeUsageLimits:(AWSredshiftDescribeUsageLimitsMessage *)request
     completionHandler:(void (^)(AWSredshiftUsageLimitList *response, NSError *error))completionHandler {
    [[self describeUsageLimits:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftUsageLimitList *> * _Nonnull task) {
        AWSredshiftUsageLimitList *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftLoggingStatus *> *)disableLogging:(AWSredshiftDisableLoggingMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableLogging"
                   outputClass:[AWSredshiftLoggingStatus class]];
}

- (void)disableLogging:(AWSredshiftDisableLoggingMessage *)request
     completionHandler:(void (^)(AWSredshiftLoggingStatus *response, NSError *error))completionHandler {
    [[self disableLogging:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftLoggingStatus *> * _Nonnull task) {
        AWSredshiftLoggingStatus *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftDisableSnapshotCopyResult *> *)disableSnapshotCopy:(AWSredshiftDisableSnapshotCopyMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableSnapshotCopy"
                   outputClass:[AWSredshiftDisableSnapshotCopyResult class]];
}

- (void)disableSnapshotCopy:(AWSredshiftDisableSnapshotCopyMessage *)request
     completionHandler:(void (^)(AWSredshiftDisableSnapshotCopyResult *response, NSError *error))completionHandler {
    [[self disableSnapshotCopy:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftDisableSnapshotCopyResult *> * _Nonnull task) {
        AWSredshiftDisableSnapshotCopyResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftLoggingStatus *> *)enableLogging:(AWSredshiftEnableLoggingMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableLogging"
                   outputClass:[AWSredshiftLoggingStatus class]];
}

- (void)enableLogging:(AWSredshiftEnableLoggingMessage *)request
     completionHandler:(void (^)(AWSredshiftLoggingStatus *response, NSError *error))completionHandler {
    [[self enableLogging:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftLoggingStatus *> * _Nonnull task) {
        AWSredshiftLoggingStatus *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftEnableSnapshotCopyResult *> *)enableSnapshotCopy:(AWSredshiftEnableSnapshotCopyMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableSnapshotCopy"
                   outputClass:[AWSredshiftEnableSnapshotCopyResult class]];
}

- (void)enableSnapshotCopy:(AWSredshiftEnableSnapshotCopyMessage *)request
     completionHandler:(void (^)(AWSredshiftEnableSnapshotCopyResult *response, NSError *error))completionHandler {
    [[self enableSnapshotCopy:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftEnableSnapshotCopyResult *> * _Nonnull task) {
        AWSredshiftEnableSnapshotCopyResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftClusterCredentials *> *)getClusterCredentials:(AWSredshiftGetClusterCredentialsMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetClusterCredentials"
                   outputClass:[AWSredshiftClusterCredentials class]];
}

- (void)getClusterCredentials:(AWSredshiftGetClusterCredentialsMessage *)request
     completionHandler:(void (^)(AWSredshiftClusterCredentials *response, NSError *error))completionHandler {
    [[self getClusterCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftClusterCredentials *> * _Nonnull task) {
        AWSredshiftClusterCredentials *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage *> *)getReservedNodeExchangeOfferings:(AWSredshiftGetReservedNodeExchangeOfferingsInputMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetReservedNodeExchangeOfferings"
                   outputClass:[AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage class]];
}

- (void)getReservedNodeExchangeOfferings:(AWSredshiftGetReservedNodeExchangeOfferingsInputMessage *)request
     completionHandler:(void (^)(AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage *response, NSError *error))completionHandler {
    [[self getReservedNodeExchangeOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage *> * _Nonnull task) {
        AWSredshiftGetReservedNodeExchangeOfferingsOutputMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftModifyClusterResult *> *)modifyCluster:(AWSredshiftModifyClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyCluster"
                   outputClass:[AWSredshiftModifyClusterResult class]];
}

- (void)modifyCluster:(AWSredshiftModifyClusterMessage *)request
     completionHandler:(void (^)(AWSredshiftModifyClusterResult *response, NSError *error))completionHandler {
    [[self modifyCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftModifyClusterResult *> * _Nonnull task) {
        AWSredshiftModifyClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftModifyClusterDbRevisionResult *> *)modifyClusterDbRevision:(AWSredshiftModifyClusterDbRevisionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyClusterDbRevision"
                   outputClass:[AWSredshiftModifyClusterDbRevisionResult class]];
}

- (void)modifyClusterDbRevision:(AWSredshiftModifyClusterDbRevisionMessage *)request
     completionHandler:(void (^)(AWSredshiftModifyClusterDbRevisionResult *response, NSError *error))completionHandler {
    [[self modifyClusterDbRevision:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftModifyClusterDbRevisionResult *> * _Nonnull task) {
        AWSredshiftModifyClusterDbRevisionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftModifyClusterIamRolesResult *> *)modifyClusterIamRoles:(AWSredshiftModifyClusterIamRolesMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyClusterIamRoles"
                   outputClass:[AWSredshiftModifyClusterIamRolesResult class]];
}

- (void)modifyClusterIamRoles:(AWSredshiftModifyClusterIamRolesMessage *)request
     completionHandler:(void (^)(AWSredshiftModifyClusterIamRolesResult *response, NSError *error))completionHandler {
    [[self modifyClusterIamRoles:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftModifyClusterIamRolesResult *> * _Nonnull task) {
        AWSredshiftModifyClusterIamRolesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftModifyClusterMaintenanceResult *> *)modifyClusterMaintenance:(AWSredshiftModifyClusterMaintenanceMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyClusterMaintenance"
                   outputClass:[AWSredshiftModifyClusterMaintenanceResult class]];
}

- (void)modifyClusterMaintenance:(AWSredshiftModifyClusterMaintenanceMessage *)request
     completionHandler:(void (^)(AWSredshiftModifyClusterMaintenanceResult *response, NSError *error))completionHandler {
    [[self modifyClusterMaintenance:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftModifyClusterMaintenanceResult *> * _Nonnull task) {
        AWSredshiftModifyClusterMaintenanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftClusterParameterGroupNameMessage *> *)modifyClusterParameterGroup:(AWSredshiftModifyClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyClusterParameterGroup"
                   outputClass:[AWSredshiftClusterParameterGroupNameMessage class]];
}

- (void)modifyClusterParameterGroup:(AWSredshiftModifyClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSredshiftClusterParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self modifyClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftClusterParameterGroupNameMessage *> * _Nonnull task) {
        AWSredshiftClusterParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftModifyClusterSnapshotResult *> *)modifyClusterSnapshot:(AWSredshiftModifyClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyClusterSnapshot"
                   outputClass:[AWSredshiftModifyClusterSnapshotResult class]];
}

- (void)modifyClusterSnapshot:(AWSredshiftModifyClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSredshiftModifyClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self modifyClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftModifyClusterSnapshotResult *> * _Nonnull task) {
        AWSredshiftModifyClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)modifyClusterSnapshotSchedule:(AWSredshiftModifyClusterSnapshotScheduleMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyClusterSnapshotSchedule"
                   outputClass:nil];
}

- (void)modifyClusterSnapshotSchedule:(AWSredshiftModifyClusterSnapshotScheduleMessage *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self modifyClusterSnapshotSchedule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftModifyClusterSubnetGroupResult *> *)modifyClusterSubnetGroup:(AWSredshiftModifyClusterSubnetGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyClusterSubnetGroup"
                   outputClass:[AWSredshiftModifyClusterSubnetGroupResult class]];
}

- (void)modifyClusterSubnetGroup:(AWSredshiftModifyClusterSubnetGroupMessage *)request
     completionHandler:(void (^)(AWSredshiftModifyClusterSubnetGroupResult *response, NSError *error))completionHandler {
    [[self modifyClusterSubnetGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftModifyClusterSubnetGroupResult *> * _Nonnull task) {
        AWSredshiftModifyClusterSubnetGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftModifyEventSubscriptionResult *> *)modifyEventSubscription:(AWSredshiftModifyEventSubscriptionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyEventSubscription"
                   outputClass:[AWSredshiftModifyEventSubscriptionResult class]];
}

- (void)modifyEventSubscription:(AWSredshiftModifyEventSubscriptionMessage *)request
     completionHandler:(void (^)(AWSredshiftModifyEventSubscriptionResult *response, NSError *error))completionHandler {
    [[self modifyEventSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftModifyEventSubscriptionResult *> * _Nonnull task) {
        AWSredshiftModifyEventSubscriptionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftScheduledAction *> *)modifyScheduledAction:(AWSredshiftModifyScheduledActionMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyScheduledAction"
                   outputClass:[AWSredshiftScheduledAction class]];
}

- (void)modifyScheduledAction:(AWSredshiftModifyScheduledActionMessage *)request
     completionHandler:(void (^)(AWSredshiftScheduledAction *response, NSError *error))completionHandler {
    [[self modifyScheduledAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftScheduledAction *> * _Nonnull task) {
        AWSredshiftScheduledAction *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftModifySnapshotCopyRetentionPeriodResult *> *)modifySnapshotCopyRetentionPeriod:(AWSredshiftModifySnapshotCopyRetentionPeriodMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifySnapshotCopyRetentionPeriod"
                   outputClass:[AWSredshiftModifySnapshotCopyRetentionPeriodResult class]];
}

- (void)modifySnapshotCopyRetentionPeriod:(AWSredshiftModifySnapshotCopyRetentionPeriodMessage *)request
     completionHandler:(void (^)(AWSredshiftModifySnapshotCopyRetentionPeriodResult *response, NSError *error))completionHandler {
    [[self modifySnapshotCopyRetentionPeriod:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftModifySnapshotCopyRetentionPeriodResult *> * _Nonnull task) {
        AWSredshiftModifySnapshotCopyRetentionPeriodResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftSnapshotSchedule *> *)modifySnapshotSchedule:(AWSredshiftModifySnapshotScheduleMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifySnapshotSchedule"
                   outputClass:[AWSredshiftSnapshotSchedule class]];
}

- (void)modifySnapshotSchedule:(AWSredshiftModifySnapshotScheduleMessage *)request
     completionHandler:(void (^)(AWSredshiftSnapshotSchedule *response, NSError *error))completionHandler {
    [[self modifySnapshotSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftSnapshotSchedule *> * _Nonnull task) {
        AWSredshiftSnapshotSchedule *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftUsageLimit *> *)modifyUsageLimit:(AWSredshiftModifyUsageLimitMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ModifyUsageLimit"
                   outputClass:[AWSredshiftUsageLimit class]];
}

- (void)modifyUsageLimit:(AWSredshiftModifyUsageLimitMessage *)request
     completionHandler:(void (^)(AWSredshiftUsageLimit *response, NSError *error))completionHandler {
    [[self modifyUsageLimit:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftUsageLimit *> * _Nonnull task) {
        AWSredshiftUsageLimit *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftPauseClusterResult *> *)pauseCluster:(AWSredshiftPauseClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PauseCluster"
                   outputClass:[AWSredshiftPauseClusterResult class]];
}

- (void)pauseCluster:(AWSredshiftPauseClusterMessage *)request
     completionHandler:(void (^)(AWSredshiftPauseClusterResult *response, NSError *error))completionHandler {
    [[self pauseCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftPauseClusterResult *> * _Nonnull task) {
        AWSredshiftPauseClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftPurchaseReservedNodeOfferingResult *> *)purchaseReservedNodeOffering:(AWSredshiftPurchaseReservedNodeOfferingMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PurchaseReservedNodeOffering"
                   outputClass:[AWSredshiftPurchaseReservedNodeOfferingResult class]];
}

- (void)purchaseReservedNodeOffering:(AWSredshiftPurchaseReservedNodeOfferingMessage *)request
     completionHandler:(void (^)(AWSredshiftPurchaseReservedNodeOfferingResult *response, NSError *error))completionHandler {
    [[self purchaseReservedNodeOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftPurchaseReservedNodeOfferingResult *> * _Nonnull task) {
        AWSredshiftPurchaseReservedNodeOfferingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftRebootClusterResult *> *)rebootCluster:(AWSredshiftRebootClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RebootCluster"
                   outputClass:[AWSredshiftRebootClusterResult class]];
}

- (void)rebootCluster:(AWSredshiftRebootClusterMessage *)request
     completionHandler:(void (^)(AWSredshiftRebootClusterResult *response, NSError *error))completionHandler {
    [[self rebootCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftRebootClusterResult *> * _Nonnull task) {
        AWSredshiftRebootClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftClusterParameterGroupNameMessage *> *)resetClusterParameterGroup:(AWSredshiftResetClusterParameterGroupMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetClusterParameterGroup"
                   outputClass:[AWSredshiftClusterParameterGroupNameMessage class]];
}

- (void)resetClusterParameterGroup:(AWSredshiftResetClusterParameterGroupMessage *)request
     completionHandler:(void (^)(AWSredshiftClusterParameterGroupNameMessage *response, NSError *error))completionHandler {
    [[self resetClusterParameterGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftClusterParameterGroupNameMessage *> * _Nonnull task) {
        AWSredshiftClusterParameterGroupNameMessage *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftResizeClusterResult *> *)resizeCluster:(AWSredshiftResizeClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResizeCluster"
                   outputClass:[AWSredshiftResizeClusterResult class]];
}

- (void)resizeCluster:(AWSredshiftResizeClusterMessage *)request
     completionHandler:(void (^)(AWSredshiftResizeClusterResult *response, NSError *error))completionHandler {
    [[self resizeCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftResizeClusterResult *> * _Nonnull task) {
        AWSredshiftResizeClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftRestoreFromClusterSnapshotResult *> *)restoreFromClusterSnapshot:(AWSredshiftRestoreFromClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreFromClusterSnapshot"
                   outputClass:[AWSredshiftRestoreFromClusterSnapshotResult class]];
}

- (void)restoreFromClusterSnapshot:(AWSredshiftRestoreFromClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSredshiftRestoreFromClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self restoreFromClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftRestoreFromClusterSnapshotResult *> * _Nonnull task) {
        AWSredshiftRestoreFromClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftRestoreTableFromClusterSnapshotResult *> *)restoreTableFromClusterSnapshot:(AWSredshiftRestoreTableFromClusterSnapshotMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RestoreTableFromClusterSnapshot"
                   outputClass:[AWSredshiftRestoreTableFromClusterSnapshotResult class]];
}

- (void)restoreTableFromClusterSnapshot:(AWSredshiftRestoreTableFromClusterSnapshotMessage *)request
     completionHandler:(void (^)(AWSredshiftRestoreTableFromClusterSnapshotResult *response, NSError *error))completionHandler {
    [[self restoreTableFromClusterSnapshot:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftRestoreTableFromClusterSnapshotResult *> * _Nonnull task) {
        AWSredshiftRestoreTableFromClusterSnapshotResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftResumeClusterResult *> *)resumeCluster:(AWSredshiftResumeClusterMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResumeCluster"
                   outputClass:[AWSredshiftResumeClusterResult class]];
}

- (void)resumeCluster:(AWSredshiftResumeClusterMessage *)request
     completionHandler:(void (^)(AWSredshiftResumeClusterResult *response, NSError *error))completionHandler {
    [[self resumeCluster:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftResumeClusterResult *> * _Nonnull task) {
        AWSredshiftResumeClusterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftRevokeClusterSecurityGroupIngressResult *> *)revokeClusterSecurityGroupIngress:(AWSredshiftRevokeClusterSecurityGroupIngressMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeClusterSecurityGroupIngress"
                   outputClass:[AWSredshiftRevokeClusterSecurityGroupIngressResult class]];
}

- (void)revokeClusterSecurityGroupIngress:(AWSredshiftRevokeClusterSecurityGroupIngressMessage *)request
     completionHandler:(void (^)(AWSredshiftRevokeClusterSecurityGroupIngressResult *response, NSError *error))completionHandler {
    [[self revokeClusterSecurityGroupIngress:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftRevokeClusterSecurityGroupIngressResult *> * _Nonnull task) {
        AWSredshiftRevokeClusterSecurityGroupIngressResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftRevokeSnapshotAccessResult *> *)revokeSnapshotAccess:(AWSredshiftRevokeSnapshotAccessMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RevokeSnapshotAccess"
                   outputClass:[AWSredshiftRevokeSnapshotAccessResult class]];
}

- (void)revokeSnapshotAccess:(AWSredshiftRevokeSnapshotAccessMessage *)request
     completionHandler:(void (^)(AWSredshiftRevokeSnapshotAccessResult *response, NSError *error))completionHandler {
    [[self revokeSnapshotAccess:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftRevokeSnapshotAccessResult *> * _Nonnull task) {
        AWSredshiftRevokeSnapshotAccessResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSredshiftRotateEncryptionKeyResult *> *)rotateEncryptionKey:(AWSredshiftRotateEncryptionKeyMessage *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RotateEncryptionKey"
                   outputClass:[AWSredshiftRotateEncryptionKeyResult class]];
}

- (void)rotateEncryptionKey:(AWSredshiftRotateEncryptionKeyMessage *)request
     completionHandler:(void (^)(AWSredshiftRotateEncryptionKeyResult *response, NSError *error))completionHandler {
    [[self rotateEncryptionKey:request] continueWithBlock:^id _Nullable(AWSTask<AWSredshiftRotateEncryptionKeyResult *> * _Nonnull task) {
        AWSredshiftRotateEncryptionKeyResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
