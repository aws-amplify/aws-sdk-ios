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

#import "AWSSsmService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSsmResources.h"

static NSString *const AWSInfoSsm = @"Ssm";
NSString *const AWSSsmSDKVersion = @"2.13.4";


@interface AWSSsmResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSsmResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AlreadyExistsException" : @(AWSSsmErrorAlreadyExists),
                            @"AssociatedInstances" : @(AWSSsmErrorAssociatedInstances),
                            @"AssociationAlreadyExists" : @(AWSSsmErrorAssociationAlreadyExists),
                            @"AssociationDoesNotExist" : @(AWSSsmErrorAssociationDoesNotExist),
                            @"AssociationExecutionDoesNotExist" : @(AWSSsmErrorAssociationExecutionDoesNotExist),
                            @"AssociationLimitExceeded" : @(AWSSsmErrorAssociationLimitExceeded),
                            @"AssociationVersionLimitExceeded" : @(AWSSsmErrorAssociationVersionLimitExceeded),
                            @"AutomationDefinitionNotFoundException" : @(AWSSsmErrorAutomationDefinitionNotFound),
                            @"AutomationDefinitionVersionNotFoundException" : @(AWSSsmErrorAutomationDefinitionVersionNotFound),
                            @"AutomationExecutionLimitExceededException" : @(AWSSsmErrorAutomationExecutionLimitExceeded),
                            @"AutomationExecutionNotFoundException" : @(AWSSsmErrorAutomationExecutionNotFound),
                            @"AutomationStepNotFoundException" : @(AWSSsmErrorAutomationStepNotFound),
                            @"ComplianceTypeCountLimitExceededException" : @(AWSSsmErrorComplianceTypeCountLimitExceeded),
                            @"CustomSchemaCountLimitExceededException" : @(AWSSsmErrorCustomSchemaCountLimitExceeded),
                            @"DocumentAlreadyExists" : @(AWSSsmErrorDocumentAlreadyExists),
                            @"DocumentLimitExceeded" : @(AWSSsmErrorDocumentLimitExceeded),
                            @"DocumentPermissionLimit" : @(AWSSsmErrorDocumentPermissionLimit),
                            @"DocumentVersionLimitExceeded" : @(AWSSsmErrorDocumentVersionLimitExceeded),
                            @"DoesNotExistException" : @(AWSSsmErrorDoesNotExist),
                            @"DuplicateDocumentContent" : @(AWSSsmErrorDuplicateDocumentContent),
                            @"DuplicateDocumentVersionName" : @(AWSSsmErrorDuplicateDocumentVersionName),
                            @"DuplicateInstanceId" : @(AWSSsmErrorDuplicateInstanceId),
                            @"FeatureNotAvailableException" : @(AWSSsmErrorFeatureNotAvailable),
                            @"HierarchyLevelLimitExceededException" : @(AWSSsmErrorHierarchyLevelLimitExceeded),
                            @"HierarchyTypeMismatchException" : @(AWSSsmErrorHierarchyTypeMismatch),
                            @"IdempotentParameterMismatch" : @(AWSSsmErrorIdempotentParameterMismatch),
                            @"IncompatiblePolicyException" : @(AWSSsmErrorIncompatiblePolicy),
                            @"InternalServerError" : @(AWSSsmErrorInternalServer),
                            @"InvalidActivation" : @(AWSSsmErrorInvalidActivation),
                            @"InvalidActivationId" : @(AWSSsmErrorInvalidActivationId),
                            @"InvalidAggregatorException" : @(AWSSsmErrorInvalidAggregator),
                            @"InvalidAllowedPatternException" : @(AWSSsmErrorInvalidAllowedPattern),
                            @"InvalidAssociation" : @(AWSSsmErrorInvalidAssociation),
                            @"InvalidAssociationVersion" : @(AWSSsmErrorInvalidAssociationVersion),
                            @"InvalidAutomationExecutionParametersException" : @(AWSSsmErrorInvalidAutomationExecutionParameters),
                            @"InvalidAutomationSignalException" : @(AWSSsmErrorInvalidAutomationSignal),
                            @"InvalidAutomationStatusUpdateException" : @(AWSSsmErrorInvalidAutomationStatusUpdate),
                            @"InvalidCommandId" : @(AWSSsmErrorInvalidCommandId),
                            @"InvalidDeleteInventoryParametersException" : @(AWSSsmErrorInvalidDeleteInventoryParameters),
                            @"InvalidDeletionIdException" : @(AWSSsmErrorInvalidDeletionId),
                            @"InvalidDocument" : @(AWSSsmErrorInvalidDocument),
                            @"InvalidDocumentContent" : @(AWSSsmErrorInvalidDocumentContent),
                            @"InvalidDocumentOperation" : @(AWSSsmErrorInvalidDocumentOperation),
                            @"InvalidDocumentSchemaVersion" : @(AWSSsmErrorInvalidDocumentSchemaVersion),
                            @"InvalidDocumentType" : @(AWSSsmErrorInvalidDocumentType),
                            @"InvalidDocumentVersion" : @(AWSSsmErrorInvalidDocumentVersion),
                            @"InvalidFilter" : @(AWSSsmErrorInvalidFilter),
                            @"InvalidFilterKey" : @(AWSSsmErrorInvalidFilterKey),
                            @"InvalidFilterOption" : @(AWSSsmErrorInvalidFilterOption),
                            @"InvalidFilterValue" : @(AWSSsmErrorInvalidFilterValue),
                            @"InvalidInstanceId" : @(AWSSsmErrorInvalidInstanceId),
                            @"InvalidInstanceInformationFilterValue" : @(AWSSsmErrorInvalidInstanceInformationFilterValue),
                            @"InvalidInventoryGroupException" : @(AWSSsmErrorInvalidInventoryGroup),
                            @"InvalidInventoryItemContextException" : @(AWSSsmErrorInvalidInventoryItemContext),
                            @"InvalidInventoryRequestException" : @(AWSSsmErrorInvalidInventoryRequest),
                            @"InvalidItemContentException" : @(AWSSsmErrorInvalidItemContent),
                            @"InvalidKeyId" : @(AWSSsmErrorInvalidKeyId),
                            @"InvalidNextToken" : @(AWSSsmErrorInvalidNextToken),
                            @"InvalidNotificationConfig" : @(AWSSsmErrorInvalidNotificationConfig),
                            @"InvalidOptionException" : @(AWSSsmErrorInvalidOption),
                            @"InvalidOutputFolder" : @(AWSSsmErrorInvalidOutputFolder),
                            @"InvalidOutputLocation" : @(AWSSsmErrorInvalidOutputLocation),
                            @"InvalidParameters" : @(AWSSsmErrorInvalidParameters),
                            @"InvalidPermissionType" : @(AWSSsmErrorInvalidPermissionType),
                            @"InvalidPluginName" : @(AWSSsmErrorInvalidPluginName),
                            @"InvalidPolicyAttributeException" : @(AWSSsmErrorInvalidPolicyAttribute),
                            @"InvalidPolicyTypeException" : @(AWSSsmErrorInvalidPolicyType),
                            @"InvalidResourceId" : @(AWSSsmErrorInvalidResourceId),
                            @"InvalidResourceType" : @(AWSSsmErrorInvalidResourceType),
                            @"InvalidResultAttributeException" : @(AWSSsmErrorInvalidResultAttribute),
                            @"InvalidRole" : @(AWSSsmErrorInvalidRole),
                            @"InvalidSchedule" : @(AWSSsmErrorInvalidSchedule),
                            @"InvalidTarget" : @(AWSSsmErrorInvalidTarget),
                            @"InvalidTypeNameException" : @(AWSSsmErrorInvalidTypeName),
                            @"InvalidUpdate" : @(AWSSsmErrorInvalidUpdate),
                            @"InvocationDoesNotExist" : @(AWSSsmErrorInvocationDoesNotExist),
                            @"ItemContentMismatchException" : @(AWSSsmErrorItemContentMismatch),
                            @"ItemSizeLimitExceededException" : @(AWSSsmErrorItemSizeLimitExceeded),
                            @"MaxDocumentSizeExceeded" : @(AWSSsmErrorMaxDocumentSizeExceeded),
                            @"OpsItemAlreadyExistsException" : @(AWSSsmErrorOpsItemAlreadyExists),
                            @"OpsItemInvalidParameterException" : @(AWSSsmErrorOpsItemInvalidParameter),
                            @"OpsItemLimitExceededException" : @(AWSSsmErrorOpsItemLimitExceeded),
                            @"OpsItemNotFoundException" : @(AWSSsmErrorOpsItemNotFound),
                            @"ParameterAlreadyExists" : @(AWSSsmErrorParameterAlreadyExists),
                            @"ParameterLimitExceeded" : @(AWSSsmErrorParameterLimitExceeded),
                            @"ParameterMaxVersionLimitExceeded" : @(AWSSsmErrorParameterMaxVersionLimitExceeded),
                            @"ParameterNotFound" : @(AWSSsmErrorParameterNotFound),
                            @"ParameterPatternMismatchException" : @(AWSSsmErrorParameterPatternMismatch),
                            @"ParameterVersionLabelLimitExceeded" : @(AWSSsmErrorParameterVersionLabelLimitExceeded),
                            @"ParameterVersionNotFound" : @(AWSSsmErrorParameterVersionNotFound),
                            @"PoliciesLimitExceededException" : @(AWSSsmErrorPoliciesLimitExceeded),
                            @"ResourceDataSyncAlreadyExistsException" : @(AWSSsmErrorResourceDataSyncAlreadyExists),
                            @"ResourceDataSyncConflictException" : @(AWSSsmErrorResourceDataSyncConflict),
                            @"ResourceDataSyncCountExceededException" : @(AWSSsmErrorResourceDataSyncCountExceeded),
                            @"ResourceDataSyncInvalidConfigurationException" : @(AWSSsmErrorResourceDataSyncInvalidConfiguration),
                            @"ResourceDataSyncNotFoundException" : @(AWSSsmErrorResourceDataSyncNotFound),
                            @"ResourceInUseException" : @(AWSSsmErrorResourceInUse),
                            @"ResourceLimitExceededException" : @(AWSSsmErrorResourceLimitExceeded),
                            @"ServiceSettingNotFound" : @(AWSSsmErrorServiceSettingNotFound),
                            @"StatusUnchanged" : @(AWSSsmErrorStatusUnchanged),
                            @"SubTypeCountLimitExceededException" : @(AWSSsmErrorSubTypeCountLimitExceeded),
                            @"TargetInUseException" : @(AWSSsmErrorTargetInUse),
                            @"TargetNotConnected" : @(AWSSsmErrorTargetNotConnected),
                            @"TooManyTagsError" : @(AWSSsmErrorTooManyTags),
                            @"TooManyUpdates" : @(AWSSsmErrorTooManyUpdates),
                            @"TotalSizeLimitExceededException" : @(AWSSsmErrorTotalSizeLimitExceeded),
                            @"UnsupportedCalendarException" : @(AWSSsmErrorUnsupportedCalendar),
                            @"UnsupportedFeatureRequiredException" : @(AWSSsmErrorUnsupportedFeatureRequired),
                            @"UnsupportedInventoryItemContextException" : @(AWSSsmErrorUnsupportedInventoryItemContext),
                            @"UnsupportedInventorySchemaVersionException" : @(AWSSsmErrorUnsupportedInventorySchemaVersion),
                            @"UnsupportedOperatingSystem" : @(AWSSsmErrorUnsupportedOperatingSystem),
                            @"UnsupportedParameterType" : @(AWSSsmErrorUnsupportedParameterType),
                            @"UnsupportedPlatformType" : @(AWSSsmErrorUnsupportedPlatformType),
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
	                *error = [NSError errorWithDomain:AWSSsmErrorDomain
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
        *error = [NSError errorWithDomain:AWSSsmErrorDomain
                                     code:AWSSsmErrorUnknown
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

@interface AWSSsmRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSsmRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSsm()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSsm

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSsmSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSsm versions need to match. Check your SDK installation. AWSCore: %@ AWSSsm: %@", AWSiOSSDKVersion, AWSSsmSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSsm {
    static AWSSsm *_defaultSsm = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSsm];
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
        _defaultSsm = [[AWSSsm alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSsm;
}

+ (void)registerSsmWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSsm alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SsmForKey:(NSString *)key {
    @synchronized(self) {
        AWSSsm *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSsm
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSsm registerSsmWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSsmForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSsm` or `+ SsmForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSsm
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSsm];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSsmRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSsmResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSsmResponseSerializer alloc] initWithJSONDefinition:[[AWSSsmResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSsmAddTagsToResourceResult *> *)addTagsToResource:(AWSSsmAddTagsToResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"AddTagsToResource"
                   outputClass:[AWSSsmAddTagsToResourceResult class]];
}

- (void)addTagsToResource:(AWSSsmAddTagsToResourceRequest *)request
     completionHandler:(void (^)(AWSSsmAddTagsToResourceResult *response, NSError *error))completionHandler {
    [[self addTagsToResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmAddTagsToResourceResult *> * _Nonnull task) {
        AWSSsmAddTagsToResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmCancelCommandResult *> *)cancelCommand:(AWSSsmCancelCommandRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CancelCommand"
                   outputClass:[AWSSsmCancelCommandResult class]];
}

- (void)cancelCommand:(AWSSsmCancelCommandRequest *)request
     completionHandler:(void (^)(AWSSsmCancelCommandResult *response, NSError *error))completionHandler {
    [[self cancelCommand:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmCancelCommandResult *> * _Nonnull task) {
        AWSSsmCancelCommandResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmCancelMaintenanceWindowExecutionResult *> *)cancelMaintenanceWindowExecution:(AWSSsmCancelMaintenanceWindowExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CancelMaintenanceWindowExecution"
                   outputClass:[AWSSsmCancelMaintenanceWindowExecutionResult class]];
}

- (void)cancelMaintenanceWindowExecution:(AWSSsmCancelMaintenanceWindowExecutionRequest *)request
     completionHandler:(void (^)(AWSSsmCancelMaintenanceWindowExecutionResult *response, NSError *error))completionHandler {
    [[self cancelMaintenanceWindowExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmCancelMaintenanceWindowExecutionResult *> * _Nonnull task) {
        AWSSsmCancelMaintenanceWindowExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmCreateActivationResult *> *)createActivation:(AWSSsmCreateActivationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateActivation"
                   outputClass:[AWSSsmCreateActivationResult class]];
}

- (void)createActivation:(AWSSsmCreateActivationRequest *)request
     completionHandler:(void (^)(AWSSsmCreateActivationResult *response, NSError *error))completionHandler {
    [[self createActivation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmCreateActivationResult *> * _Nonnull task) {
        AWSSsmCreateActivationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmCreateAssociationResult *> *)createAssociation:(AWSSsmCreateAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateAssociation"
                   outputClass:[AWSSsmCreateAssociationResult class]];
}

- (void)createAssociation:(AWSSsmCreateAssociationRequest *)request
     completionHandler:(void (^)(AWSSsmCreateAssociationResult *response, NSError *error))completionHandler {
    [[self createAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmCreateAssociationResult *> * _Nonnull task) {
        AWSSsmCreateAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmCreateAssociationBatchResult *> *)createAssociationBatch:(AWSSsmCreateAssociationBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateAssociationBatch"
                   outputClass:[AWSSsmCreateAssociationBatchResult class]];
}

- (void)createAssociationBatch:(AWSSsmCreateAssociationBatchRequest *)request
     completionHandler:(void (^)(AWSSsmCreateAssociationBatchResult *response, NSError *error))completionHandler {
    [[self createAssociationBatch:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmCreateAssociationBatchResult *> * _Nonnull task) {
        AWSSsmCreateAssociationBatchResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmCreateDocumentResult *> *)createDocument:(AWSSsmCreateDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateDocument"
                   outputClass:[AWSSsmCreateDocumentResult class]];
}

- (void)createDocument:(AWSSsmCreateDocumentRequest *)request
     completionHandler:(void (^)(AWSSsmCreateDocumentResult *response, NSError *error))completionHandler {
    [[self createDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmCreateDocumentResult *> * _Nonnull task) {
        AWSSsmCreateDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmCreateMaintenanceWindowResult *> *)createMaintenanceWindow:(AWSSsmCreateMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateMaintenanceWindow"
                   outputClass:[AWSSsmCreateMaintenanceWindowResult class]];
}

- (void)createMaintenanceWindow:(AWSSsmCreateMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSsmCreateMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self createMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmCreateMaintenanceWindowResult *> * _Nonnull task) {
        AWSSsmCreateMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmCreateOpsItemResponse *> *)createOpsItem:(AWSSsmCreateOpsItemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateOpsItem"
                   outputClass:[AWSSsmCreateOpsItemResponse class]];
}

- (void)createOpsItem:(AWSSsmCreateOpsItemRequest *)request
     completionHandler:(void (^)(AWSSsmCreateOpsItemResponse *response, NSError *error))completionHandler {
    [[self createOpsItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmCreateOpsItemResponse *> * _Nonnull task) {
        AWSSsmCreateOpsItemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmCreatePatchBaselineResult *> *)createPatchBaseline:(AWSSsmCreatePatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreatePatchBaseline"
                   outputClass:[AWSSsmCreatePatchBaselineResult class]];
}

- (void)createPatchBaseline:(AWSSsmCreatePatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSsmCreatePatchBaselineResult *response, NSError *error))completionHandler {
    [[self createPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmCreatePatchBaselineResult *> * _Nonnull task) {
        AWSSsmCreatePatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmCreateResourceDataSyncResult *> *)createResourceDataSync:(AWSSsmCreateResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateResourceDataSync"
                   outputClass:[AWSSsmCreateResourceDataSyncResult class]];
}

- (void)createResourceDataSync:(AWSSsmCreateResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSsmCreateResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self createResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmCreateResourceDataSyncResult *> * _Nonnull task) {
        AWSSsmCreateResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeleteActivationResult *> *)deleteActivation:(AWSSsmDeleteActivationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteActivation"
                   outputClass:[AWSSsmDeleteActivationResult class]];
}

- (void)deleteActivation:(AWSSsmDeleteActivationRequest *)request
     completionHandler:(void (^)(AWSSsmDeleteActivationResult *response, NSError *error))completionHandler {
    [[self deleteActivation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeleteActivationResult *> * _Nonnull task) {
        AWSSsmDeleteActivationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeleteAssociationResult *> *)deleteAssociation:(AWSSsmDeleteAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteAssociation"
                   outputClass:[AWSSsmDeleteAssociationResult class]];
}

- (void)deleteAssociation:(AWSSsmDeleteAssociationRequest *)request
     completionHandler:(void (^)(AWSSsmDeleteAssociationResult *response, NSError *error))completionHandler {
    [[self deleteAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeleteAssociationResult *> * _Nonnull task) {
        AWSSsmDeleteAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeleteDocumentResult *> *)deleteDocument:(AWSSsmDeleteDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteDocument"
                   outputClass:[AWSSsmDeleteDocumentResult class]];
}

- (void)deleteDocument:(AWSSsmDeleteDocumentRequest *)request
     completionHandler:(void (^)(AWSSsmDeleteDocumentResult *response, NSError *error))completionHandler {
    [[self deleteDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeleteDocumentResult *> * _Nonnull task) {
        AWSSsmDeleteDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeleteInventoryResult *> *)deleteInventory:(AWSSsmDeleteInventoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteInventory"
                   outputClass:[AWSSsmDeleteInventoryResult class]];
}

- (void)deleteInventory:(AWSSsmDeleteInventoryRequest *)request
     completionHandler:(void (^)(AWSSsmDeleteInventoryResult *response, NSError *error))completionHandler {
    [[self deleteInventory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeleteInventoryResult *> * _Nonnull task) {
        AWSSsmDeleteInventoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeleteMaintenanceWindowResult *> *)deleteMaintenanceWindow:(AWSSsmDeleteMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteMaintenanceWindow"
                   outputClass:[AWSSsmDeleteMaintenanceWindowResult class]];
}

- (void)deleteMaintenanceWindow:(AWSSsmDeleteMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSsmDeleteMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self deleteMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeleteMaintenanceWindowResult *> * _Nonnull task) {
        AWSSsmDeleteMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeleteParameterResult *> *)deleteParameter:(AWSSsmDeleteParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteParameter"
                   outputClass:[AWSSsmDeleteParameterResult class]];
}

- (void)deleteParameter:(AWSSsmDeleteParameterRequest *)request
     completionHandler:(void (^)(AWSSsmDeleteParameterResult *response, NSError *error))completionHandler {
    [[self deleteParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeleteParameterResult *> * _Nonnull task) {
        AWSSsmDeleteParameterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeleteParametersResult *> *)deleteParameters:(AWSSsmDeleteParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteParameters"
                   outputClass:[AWSSsmDeleteParametersResult class]];
}

- (void)deleteParameters:(AWSSsmDeleteParametersRequest *)request
     completionHandler:(void (^)(AWSSsmDeleteParametersResult *response, NSError *error))completionHandler {
    [[self deleteParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeleteParametersResult *> * _Nonnull task) {
        AWSSsmDeleteParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeletePatchBaselineResult *> *)deletePatchBaseline:(AWSSsmDeletePatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeletePatchBaseline"
                   outputClass:[AWSSsmDeletePatchBaselineResult class]];
}

- (void)deletePatchBaseline:(AWSSsmDeletePatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSsmDeletePatchBaselineResult *response, NSError *error))completionHandler {
    [[self deletePatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeletePatchBaselineResult *> * _Nonnull task) {
        AWSSsmDeletePatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeleteResourceDataSyncResult *> *)deleteResourceDataSync:(AWSSsmDeleteResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteResourceDataSync"
                   outputClass:[AWSSsmDeleteResourceDataSyncResult class]];
}

- (void)deleteResourceDataSync:(AWSSsmDeleteResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSsmDeleteResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self deleteResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeleteResourceDataSyncResult *> * _Nonnull task) {
        AWSSsmDeleteResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeregisterManagedInstanceResult *> *)deregisterManagedInstance:(AWSSsmDeregisterManagedInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterManagedInstance"
                   outputClass:[AWSSsmDeregisterManagedInstanceResult class]];
}

- (void)deregisterManagedInstance:(AWSSsmDeregisterManagedInstanceRequest *)request
     completionHandler:(void (^)(AWSSsmDeregisterManagedInstanceResult *response, NSError *error))completionHandler {
    [[self deregisterManagedInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeregisterManagedInstanceResult *> * _Nonnull task) {
        AWSSsmDeregisterManagedInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeregisterPatchBaselineForPatchGroupResult *> *)deregisterPatchBaselineForPatchGroup:(AWSSsmDeregisterPatchBaselineForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterPatchBaselineForPatchGroup"
                   outputClass:[AWSSsmDeregisterPatchBaselineForPatchGroupResult class]];
}

- (void)deregisterPatchBaselineForPatchGroup:(AWSSsmDeregisterPatchBaselineForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSsmDeregisterPatchBaselineForPatchGroupResult *response, NSError *error))completionHandler {
    [[self deregisterPatchBaselineForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeregisterPatchBaselineForPatchGroupResult *> * _Nonnull task) {
        AWSSsmDeregisterPatchBaselineForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeregisterTargetFromMaintenanceWindowResult *> *)deregisterTargetFromMaintenanceWindow:(AWSSsmDeregisterTargetFromMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterTargetFromMaintenanceWindow"
                   outputClass:[AWSSsmDeregisterTargetFromMaintenanceWindowResult class]];
}

- (void)deregisterTargetFromMaintenanceWindow:(AWSSsmDeregisterTargetFromMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSsmDeregisterTargetFromMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self deregisterTargetFromMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeregisterTargetFromMaintenanceWindowResult *> * _Nonnull task) {
        AWSSsmDeregisterTargetFromMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDeregisterTaskFromMaintenanceWindowResult *> *)deregisterTaskFromMaintenanceWindow:(AWSSsmDeregisterTaskFromMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterTaskFromMaintenanceWindow"
                   outputClass:[AWSSsmDeregisterTaskFromMaintenanceWindowResult class]];
}

- (void)deregisterTaskFromMaintenanceWindow:(AWSSsmDeregisterTaskFromMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSsmDeregisterTaskFromMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self deregisterTaskFromMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDeregisterTaskFromMaintenanceWindowResult *> * _Nonnull task) {
        AWSSsmDeregisterTaskFromMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeActivationsResult *> *)describeActivations:(AWSSsmDescribeActivationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeActivations"
                   outputClass:[AWSSsmDescribeActivationsResult class]];
}

- (void)describeActivations:(AWSSsmDescribeActivationsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeActivationsResult *response, NSError *error))completionHandler {
    [[self describeActivations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeActivationsResult *> * _Nonnull task) {
        AWSSsmDescribeActivationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeAssociationResult *> *)describeAssociation:(AWSSsmDescribeAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAssociation"
                   outputClass:[AWSSsmDescribeAssociationResult class]];
}

- (void)describeAssociation:(AWSSsmDescribeAssociationRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeAssociationResult *response, NSError *error))completionHandler {
    [[self describeAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeAssociationResult *> * _Nonnull task) {
        AWSSsmDescribeAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeAssociationExecutionTargetsResult *> *)describeAssociationExecutionTargets:(AWSSsmDescribeAssociationExecutionTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAssociationExecutionTargets"
                   outputClass:[AWSSsmDescribeAssociationExecutionTargetsResult class]];
}

- (void)describeAssociationExecutionTargets:(AWSSsmDescribeAssociationExecutionTargetsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeAssociationExecutionTargetsResult *response, NSError *error))completionHandler {
    [[self describeAssociationExecutionTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeAssociationExecutionTargetsResult *> * _Nonnull task) {
        AWSSsmDescribeAssociationExecutionTargetsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeAssociationExecutionsResult *> *)describeAssociationExecutions:(AWSSsmDescribeAssociationExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAssociationExecutions"
                   outputClass:[AWSSsmDescribeAssociationExecutionsResult class]];
}

- (void)describeAssociationExecutions:(AWSSsmDescribeAssociationExecutionsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeAssociationExecutionsResult *response, NSError *error))completionHandler {
    [[self describeAssociationExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeAssociationExecutionsResult *> * _Nonnull task) {
        AWSSsmDescribeAssociationExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeAutomationExecutionsResult *> *)describeAutomationExecutions:(AWSSsmDescribeAutomationExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAutomationExecutions"
                   outputClass:[AWSSsmDescribeAutomationExecutionsResult class]];
}

- (void)describeAutomationExecutions:(AWSSsmDescribeAutomationExecutionsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeAutomationExecutionsResult *response, NSError *error))completionHandler {
    [[self describeAutomationExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeAutomationExecutionsResult *> * _Nonnull task) {
        AWSSsmDescribeAutomationExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeAutomationStepExecutionsResult *> *)describeAutomationStepExecutions:(AWSSsmDescribeAutomationStepExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAutomationStepExecutions"
                   outputClass:[AWSSsmDescribeAutomationStepExecutionsResult class]];
}

- (void)describeAutomationStepExecutions:(AWSSsmDescribeAutomationStepExecutionsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeAutomationStepExecutionsResult *response, NSError *error))completionHandler {
    [[self describeAutomationStepExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeAutomationStepExecutionsResult *> * _Nonnull task) {
        AWSSsmDescribeAutomationStepExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeAvailablePatchesResult *> *)describeAvailablePatches:(AWSSsmDescribeAvailablePatchesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAvailablePatches"
                   outputClass:[AWSSsmDescribeAvailablePatchesResult class]];
}

- (void)describeAvailablePatches:(AWSSsmDescribeAvailablePatchesRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeAvailablePatchesResult *response, NSError *error))completionHandler {
    [[self describeAvailablePatches:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeAvailablePatchesResult *> * _Nonnull task) {
        AWSSsmDescribeAvailablePatchesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeDocumentResult *> *)describeDocument:(AWSSsmDescribeDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeDocument"
                   outputClass:[AWSSsmDescribeDocumentResult class]];
}

- (void)describeDocument:(AWSSsmDescribeDocumentRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeDocumentResult *response, NSError *error))completionHandler {
    [[self describeDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeDocumentResult *> * _Nonnull task) {
        AWSSsmDescribeDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeDocumentPermissionResponse *> *)describeDocumentPermission:(AWSSsmDescribeDocumentPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeDocumentPermission"
                   outputClass:[AWSSsmDescribeDocumentPermissionResponse class]];
}

- (void)describeDocumentPermission:(AWSSsmDescribeDocumentPermissionRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeDocumentPermissionResponse *response, NSError *error))completionHandler {
    [[self describeDocumentPermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeDocumentPermissionResponse *> * _Nonnull task) {
        AWSSsmDescribeDocumentPermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeEffectiveInstanceAssociationsResult *> *)describeEffectiveInstanceAssociations:(AWSSsmDescribeEffectiveInstanceAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeEffectiveInstanceAssociations"
                   outputClass:[AWSSsmDescribeEffectiveInstanceAssociationsResult class]];
}

- (void)describeEffectiveInstanceAssociations:(AWSSsmDescribeEffectiveInstanceAssociationsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeEffectiveInstanceAssociationsResult *response, NSError *error))completionHandler {
    [[self describeEffectiveInstanceAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeEffectiveInstanceAssociationsResult *> * _Nonnull task) {
        AWSSsmDescribeEffectiveInstanceAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeEffectivePatchesForPatchBaselineResult *> *)describeEffectivePatchesForPatchBaseline:(AWSSsmDescribeEffectivePatchesForPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeEffectivePatchesForPatchBaseline"
                   outputClass:[AWSSsmDescribeEffectivePatchesForPatchBaselineResult class]];
}

- (void)describeEffectivePatchesForPatchBaseline:(AWSSsmDescribeEffectivePatchesForPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeEffectivePatchesForPatchBaselineResult *response, NSError *error))completionHandler {
    [[self describeEffectivePatchesForPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeEffectivePatchesForPatchBaselineResult *> * _Nonnull task) {
        AWSSsmDescribeEffectivePatchesForPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeInstanceAssociationsStatusResult *> *)describeInstanceAssociationsStatus:(AWSSsmDescribeInstanceAssociationsStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstanceAssociationsStatus"
                   outputClass:[AWSSsmDescribeInstanceAssociationsStatusResult class]];
}

- (void)describeInstanceAssociationsStatus:(AWSSsmDescribeInstanceAssociationsStatusRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeInstanceAssociationsStatusResult *response, NSError *error))completionHandler {
    [[self describeInstanceAssociationsStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeInstanceAssociationsStatusResult *> * _Nonnull task) {
        AWSSsmDescribeInstanceAssociationsStatusResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeInstanceInformationResult *> *)describeInstanceInformation:(AWSSsmDescribeInstanceInformationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstanceInformation"
                   outputClass:[AWSSsmDescribeInstanceInformationResult class]];
}

- (void)describeInstanceInformation:(AWSSsmDescribeInstanceInformationRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeInstanceInformationResult *response, NSError *error))completionHandler {
    [[self describeInstanceInformation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeInstanceInformationResult *> * _Nonnull task) {
        AWSSsmDescribeInstanceInformationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeInstancePatchStatesResult *> *)describeInstancePatchStates:(AWSSsmDescribeInstancePatchStatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstancePatchStates"
                   outputClass:[AWSSsmDescribeInstancePatchStatesResult class]];
}

- (void)describeInstancePatchStates:(AWSSsmDescribeInstancePatchStatesRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeInstancePatchStatesResult *response, NSError *error))completionHandler {
    [[self describeInstancePatchStates:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeInstancePatchStatesResult *> * _Nonnull task) {
        AWSSsmDescribeInstancePatchStatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeInstancePatchStatesForPatchGroupResult *> *)describeInstancePatchStatesForPatchGroup:(AWSSsmDescribeInstancePatchStatesForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstancePatchStatesForPatchGroup"
                   outputClass:[AWSSsmDescribeInstancePatchStatesForPatchGroupResult class]];
}

- (void)describeInstancePatchStatesForPatchGroup:(AWSSsmDescribeInstancePatchStatesForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeInstancePatchStatesForPatchGroupResult *response, NSError *error))completionHandler {
    [[self describeInstancePatchStatesForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeInstancePatchStatesForPatchGroupResult *> * _Nonnull task) {
        AWSSsmDescribeInstancePatchStatesForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeInstancePatchesResult *> *)describeInstancePatches:(AWSSsmDescribeInstancePatchesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstancePatches"
                   outputClass:[AWSSsmDescribeInstancePatchesResult class]];
}

- (void)describeInstancePatches:(AWSSsmDescribeInstancePatchesRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeInstancePatchesResult *response, NSError *error))completionHandler {
    [[self describeInstancePatches:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeInstancePatchesResult *> * _Nonnull task) {
        AWSSsmDescribeInstancePatchesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeInventoryDeletionsResult *> *)describeInventoryDeletions:(AWSSsmDescribeInventoryDeletionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInventoryDeletions"
                   outputClass:[AWSSsmDescribeInventoryDeletionsResult class]];
}

- (void)describeInventoryDeletions:(AWSSsmDescribeInventoryDeletionsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeInventoryDeletionsResult *response, NSError *error))completionHandler {
    [[self describeInventoryDeletions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeInventoryDeletionsResult *> * _Nonnull task) {
        AWSSsmDescribeInventoryDeletionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult *> *)describeMaintenanceWindowExecutionTaskInvocations:(AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowExecutionTaskInvocations"
                   outputClass:[AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult class]];
}

- (void)describeMaintenanceWindowExecutionTaskInvocations:(AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowExecutionTaskInvocations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult *> * _Nonnull task) {
        AWSSsmDescribeMaintenanceWindowExecutionTaskInvocationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeMaintenanceWindowExecutionTasksResult *> *)describeMaintenanceWindowExecutionTasks:(AWSSsmDescribeMaintenanceWindowExecutionTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowExecutionTasks"
                   outputClass:[AWSSsmDescribeMaintenanceWindowExecutionTasksResult class]];
}

- (void)describeMaintenanceWindowExecutionTasks:(AWSSsmDescribeMaintenanceWindowExecutionTasksRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeMaintenanceWindowExecutionTasksResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowExecutionTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeMaintenanceWindowExecutionTasksResult *> * _Nonnull task) {
        AWSSsmDescribeMaintenanceWindowExecutionTasksResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeMaintenanceWindowExecutionsResult *> *)describeMaintenanceWindowExecutions:(AWSSsmDescribeMaintenanceWindowExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowExecutions"
                   outputClass:[AWSSsmDescribeMaintenanceWindowExecutionsResult class]];
}

- (void)describeMaintenanceWindowExecutions:(AWSSsmDescribeMaintenanceWindowExecutionsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeMaintenanceWindowExecutionsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeMaintenanceWindowExecutionsResult *> * _Nonnull task) {
        AWSSsmDescribeMaintenanceWindowExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeMaintenanceWindowScheduleResult *> *)describeMaintenanceWindowSchedule:(AWSSsmDescribeMaintenanceWindowScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowSchedule"
                   outputClass:[AWSSsmDescribeMaintenanceWindowScheduleResult class]];
}

- (void)describeMaintenanceWindowSchedule:(AWSSsmDescribeMaintenanceWindowScheduleRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeMaintenanceWindowScheduleResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeMaintenanceWindowScheduleResult *> * _Nonnull task) {
        AWSSsmDescribeMaintenanceWindowScheduleResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeMaintenanceWindowTargetsResult *> *)describeMaintenanceWindowTargets:(AWSSsmDescribeMaintenanceWindowTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowTargets"
                   outputClass:[AWSSsmDescribeMaintenanceWindowTargetsResult class]];
}

- (void)describeMaintenanceWindowTargets:(AWSSsmDescribeMaintenanceWindowTargetsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeMaintenanceWindowTargetsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeMaintenanceWindowTargetsResult *> * _Nonnull task) {
        AWSSsmDescribeMaintenanceWindowTargetsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeMaintenanceWindowTasksResult *> *)describeMaintenanceWindowTasks:(AWSSsmDescribeMaintenanceWindowTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowTasks"
                   outputClass:[AWSSsmDescribeMaintenanceWindowTasksResult class]];
}

- (void)describeMaintenanceWindowTasks:(AWSSsmDescribeMaintenanceWindowTasksRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeMaintenanceWindowTasksResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeMaintenanceWindowTasksResult *> * _Nonnull task) {
        AWSSsmDescribeMaintenanceWindowTasksResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeMaintenanceWindowsResult *> *)describeMaintenanceWindows:(AWSSsmDescribeMaintenanceWindowsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindows"
                   outputClass:[AWSSsmDescribeMaintenanceWindowsResult class]];
}

- (void)describeMaintenanceWindows:(AWSSsmDescribeMaintenanceWindowsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeMaintenanceWindowsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindows:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeMaintenanceWindowsResult *> * _Nonnull task) {
        AWSSsmDescribeMaintenanceWindowsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeMaintenanceWindowsForTargetResult *> *)describeMaintenanceWindowsForTarget:(AWSSsmDescribeMaintenanceWindowsForTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowsForTarget"
                   outputClass:[AWSSsmDescribeMaintenanceWindowsForTargetResult class]];
}

- (void)describeMaintenanceWindowsForTarget:(AWSSsmDescribeMaintenanceWindowsForTargetRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeMaintenanceWindowsForTargetResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowsForTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeMaintenanceWindowsForTargetResult *> * _Nonnull task) {
        AWSSsmDescribeMaintenanceWindowsForTargetResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeOpsItemsResponse *> *)describeOpsItems:(AWSSsmDescribeOpsItemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeOpsItems"
                   outputClass:[AWSSsmDescribeOpsItemsResponse class]];
}

- (void)describeOpsItems:(AWSSsmDescribeOpsItemsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeOpsItemsResponse *response, NSError *error))completionHandler {
    [[self describeOpsItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeOpsItemsResponse *> * _Nonnull task) {
        AWSSsmDescribeOpsItemsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeParametersResult *> *)describeParameters:(AWSSsmDescribeParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeParameters"
                   outputClass:[AWSSsmDescribeParametersResult class]];
}

- (void)describeParameters:(AWSSsmDescribeParametersRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeParametersResult *response, NSError *error))completionHandler {
    [[self describeParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeParametersResult *> * _Nonnull task) {
        AWSSsmDescribeParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribePatchBaselinesResult *> *)describePatchBaselines:(AWSSsmDescribePatchBaselinesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchBaselines"
                   outputClass:[AWSSsmDescribePatchBaselinesResult class]];
}

- (void)describePatchBaselines:(AWSSsmDescribePatchBaselinesRequest *)request
     completionHandler:(void (^)(AWSSsmDescribePatchBaselinesResult *response, NSError *error))completionHandler {
    [[self describePatchBaselines:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribePatchBaselinesResult *> * _Nonnull task) {
        AWSSsmDescribePatchBaselinesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribePatchGroupStateResult *> *)describePatchGroupState:(AWSSsmDescribePatchGroupStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchGroupState"
                   outputClass:[AWSSsmDescribePatchGroupStateResult class]];
}

- (void)describePatchGroupState:(AWSSsmDescribePatchGroupStateRequest *)request
     completionHandler:(void (^)(AWSSsmDescribePatchGroupStateResult *response, NSError *error))completionHandler {
    [[self describePatchGroupState:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribePatchGroupStateResult *> * _Nonnull task) {
        AWSSsmDescribePatchGroupStateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribePatchGroupsResult *> *)describePatchGroups:(AWSSsmDescribePatchGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchGroups"
                   outputClass:[AWSSsmDescribePatchGroupsResult class]];
}

- (void)describePatchGroups:(AWSSsmDescribePatchGroupsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribePatchGroupsResult *response, NSError *error))completionHandler {
    [[self describePatchGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribePatchGroupsResult *> * _Nonnull task) {
        AWSSsmDescribePatchGroupsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribePatchPropertiesResult *> *)describePatchProperties:(AWSSsmDescribePatchPropertiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchProperties"
                   outputClass:[AWSSsmDescribePatchPropertiesResult class]];
}

- (void)describePatchProperties:(AWSSsmDescribePatchPropertiesRequest *)request
     completionHandler:(void (^)(AWSSsmDescribePatchPropertiesResult *response, NSError *error))completionHandler {
    [[self describePatchProperties:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribePatchPropertiesResult *> * _Nonnull task) {
        AWSSsmDescribePatchPropertiesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmDescribeSessionsResponse *> *)describeSessions:(AWSSsmDescribeSessionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeSessions"
                   outputClass:[AWSSsmDescribeSessionsResponse class]];
}

- (void)describeSessions:(AWSSsmDescribeSessionsRequest *)request
     completionHandler:(void (^)(AWSSsmDescribeSessionsResponse *response, NSError *error))completionHandler {
    [[self describeSessions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmDescribeSessionsResponse *> * _Nonnull task) {
        AWSSsmDescribeSessionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetAutomationExecutionResult *> *)getAutomationExecution:(AWSSsmGetAutomationExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetAutomationExecution"
                   outputClass:[AWSSsmGetAutomationExecutionResult class]];
}

- (void)getAutomationExecution:(AWSSsmGetAutomationExecutionRequest *)request
     completionHandler:(void (^)(AWSSsmGetAutomationExecutionResult *response, NSError *error))completionHandler {
    [[self getAutomationExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetAutomationExecutionResult *> * _Nonnull task) {
        AWSSsmGetAutomationExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetCalendarStateResponse *> *)getCalendarState:(AWSSsmGetCalendarStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetCalendarState"
                   outputClass:[AWSSsmGetCalendarStateResponse class]];
}

- (void)getCalendarState:(AWSSsmGetCalendarStateRequest *)request
     completionHandler:(void (^)(AWSSsmGetCalendarStateResponse *response, NSError *error))completionHandler {
    [[self getCalendarState:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetCalendarStateResponse *> * _Nonnull task) {
        AWSSsmGetCalendarStateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetCommandInvocationResult *> *)getCommandInvocation:(AWSSsmGetCommandInvocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetCommandInvocation"
                   outputClass:[AWSSsmGetCommandInvocationResult class]];
}

- (void)getCommandInvocation:(AWSSsmGetCommandInvocationRequest *)request
     completionHandler:(void (^)(AWSSsmGetCommandInvocationResult *response, NSError *error))completionHandler {
    [[self getCommandInvocation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetCommandInvocationResult *> * _Nonnull task) {
        AWSSsmGetCommandInvocationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetConnectionStatusResponse *> *)getConnectionStatus:(AWSSsmGetConnectionStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetConnectionStatus"
                   outputClass:[AWSSsmGetConnectionStatusResponse class]];
}

- (void)getConnectionStatus:(AWSSsmGetConnectionStatusRequest *)request
     completionHandler:(void (^)(AWSSsmGetConnectionStatusResponse *response, NSError *error))completionHandler {
    [[self getConnectionStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetConnectionStatusResponse *> * _Nonnull task) {
        AWSSsmGetConnectionStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetDefaultPatchBaselineResult *> *)getDefaultPatchBaseline:(AWSSsmGetDefaultPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetDefaultPatchBaseline"
                   outputClass:[AWSSsmGetDefaultPatchBaselineResult class]];
}

- (void)getDefaultPatchBaseline:(AWSSsmGetDefaultPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSsmGetDefaultPatchBaselineResult *response, NSError *error))completionHandler {
    [[self getDefaultPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetDefaultPatchBaselineResult *> * _Nonnull task) {
        AWSSsmGetDefaultPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetDeployablePatchSnapshotForInstanceResult *> *)getDeployablePatchSnapshotForInstance:(AWSSsmGetDeployablePatchSnapshotForInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetDeployablePatchSnapshotForInstance"
                   outputClass:[AWSSsmGetDeployablePatchSnapshotForInstanceResult class]];
}

- (void)getDeployablePatchSnapshotForInstance:(AWSSsmGetDeployablePatchSnapshotForInstanceRequest *)request
     completionHandler:(void (^)(AWSSsmGetDeployablePatchSnapshotForInstanceResult *response, NSError *error))completionHandler {
    [[self getDeployablePatchSnapshotForInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetDeployablePatchSnapshotForInstanceResult *> * _Nonnull task) {
        AWSSsmGetDeployablePatchSnapshotForInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetDocumentResult *> *)getDocument:(AWSSsmGetDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetDocument"
                   outputClass:[AWSSsmGetDocumentResult class]];
}

- (void)getDocument:(AWSSsmGetDocumentRequest *)request
     completionHandler:(void (^)(AWSSsmGetDocumentResult *response, NSError *error))completionHandler {
    [[self getDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetDocumentResult *> * _Nonnull task) {
        AWSSsmGetDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetInventoryResult *> *)getInventory:(AWSSsmGetInventoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetInventory"
                   outputClass:[AWSSsmGetInventoryResult class]];
}

- (void)getInventory:(AWSSsmGetInventoryRequest *)request
     completionHandler:(void (^)(AWSSsmGetInventoryResult *response, NSError *error))completionHandler {
    [[self getInventory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetInventoryResult *> * _Nonnull task) {
        AWSSsmGetInventoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetInventorySchemaResult *> *)getInventorySchema:(AWSSsmGetInventorySchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetInventorySchema"
                   outputClass:[AWSSsmGetInventorySchemaResult class]];
}

- (void)getInventorySchema:(AWSSsmGetInventorySchemaRequest *)request
     completionHandler:(void (^)(AWSSsmGetInventorySchemaResult *response, NSError *error))completionHandler {
    [[self getInventorySchema:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetInventorySchemaResult *> * _Nonnull task) {
        AWSSsmGetInventorySchemaResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetMaintenanceWindowResult *> *)getMaintenanceWindow:(AWSSsmGetMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindow"
                   outputClass:[AWSSsmGetMaintenanceWindowResult class]];
}

- (void)getMaintenanceWindow:(AWSSsmGetMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSsmGetMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetMaintenanceWindowResult *> * _Nonnull task) {
        AWSSsmGetMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetMaintenanceWindowExecutionResult *> *)getMaintenanceWindowExecution:(AWSSsmGetMaintenanceWindowExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowExecution"
                   outputClass:[AWSSsmGetMaintenanceWindowExecutionResult class]];
}

- (void)getMaintenanceWindowExecution:(AWSSsmGetMaintenanceWindowExecutionRequest *)request
     completionHandler:(void (^)(AWSSsmGetMaintenanceWindowExecutionResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetMaintenanceWindowExecutionResult *> * _Nonnull task) {
        AWSSsmGetMaintenanceWindowExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetMaintenanceWindowExecutionTaskResult *> *)getMaintenanceWindowExecutionTask:(AWSSsmGetMaintenanceWindowExecutionTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowExecutionTask"
                   outputClass:[AWSSsmGetMaintenanceWindowExecutionTaskResult class]];
}

- (void)getMaintenanceWindowExecutionTask:(AWSSsmGetMaintenanceWindowExecutionTaskRequest *)request
     completionHandler:(void (^)(AWSSsmGetMaintenanceWindowExecutionTaskResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowExecutionTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetMaintenanceWindowExecutionTaskResult *> * _Nonnull task) {
        AWSSsmGetMaintenanceWindowExecutionTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult *> *)getMaintenanceWindowExecutionTaskInvocation:(AWSSsmGetMaintenanceWindowExecutionTaskInvocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowExecutionTaskInvocation"
                   outputClass:[AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult class]];
}

- (void)getMaintenanceWindowExecutionTaskInvocation:(AWSSsmGetMaintenanceWindowExecutionTaskInvocationRequest *)request
     completionHandler:(void (^)(AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowExecutionTaskInvocation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult *> * _Nonnull task) {
        AWSSsmGetMaintenanceWindowExecutionTaskInvocationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetMaintenanceWindowTaskResult *> *)getMaintenanceWindowTask:(AWSSsmGetMaintenanceWindowTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowTask"
                   outputClass:[AWSSsmGetMaintenanceWindowTaskResult class]];
}

- (void)getMaintenanceWindowTask:(AWSSsmGetMaintenanceWindowTaskRequest *)request
     completionHandler:(void (^)(AWSSsmGetMaintenanceWindowTaskResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetMaintenanceWindowTaskResult *> * _Nonnull task) {
        AWSSsmGetMaintenanceWindowTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetOpsItemResponse *> *)getOpsItem:(AWSSsmGetOpsItemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetOpsItem"
                   outputClass:[AWSSsmGetOpsItemResponse class]];
}

- (void)getOpsItem:(AWSSsmGetOpsItemRequest *)request
     completionHandler:(void (^)(AWSSsmGetOpsItemResponse *response, NSError *error))completionHandler {
    [[self getOpsItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetOpsItemResponse *> * _Nonnull task) {
        AWSSsmGetOpsItemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetOpsSummaryResult *> *)getOpsSummary:(AWSSsmGetOpsSummaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetOpsSummary"
                   outputClass:[AWSSsmGetOpsSummaryResult class]];
}

- (void)getOpsSummary:(AWSSsmGetOpsSummaryRequest *)request
     completionHandler:(void (^)(AWSSsmGetOpsSummaryResult *response, NSError *error))completionHandler {
    [[self getOpsSummary:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetOpsSummaryResult *> * _Nonnull task) {
        AWSSsmGetOpsSummaryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetParameterResult *> *)getParameter:(AWSSsmGetParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParameter"
                   outputClass:[AWSSsmGetParameterResult class]];
}

- (void)getParameter:(AWSSsmGetParameterRequest *)request
     completionHandler:(void (^)(AWSSsmGetParameterResult *response, NSError *error))completionHandler {
    [[self getParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetParameterResult *> * _Nonnull task) {
        AWSSsmGetParameterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetParameterHistoryResult *> *)getParameterHistory:(AWSSsmGetParameterHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParameterHistory"
                   outputClass:[AWSSsmGetParameterHistoryResult class]];
}

- (void)getParameterHistory:(AWSSsmGetParameterHistoryRequest *)request
     completionHandler:(void (^)(AWSSsmGetParameterHistoryResult *response, NSError *error))completionHandler {
    [[self getParameterHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetParameterHistoryResult *> * _Nonnull task) {
        AWSSsmGetParameterHistoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetParametersResult *> *)getParameters:(AWSSsmGetParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParameters"
                   outputClass:[AWSSsmGetParametersResult class]];
}

- (void)getParameters:(AWSSsmGetParametersRequest *)request
     completionHandler:(void (^)(AWSSsmGetParametersResult *response, NSError *error))completionHandler {
    [[self getParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetParametersResult *> * _Nonnull task) {
        AWSSsmGetParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetParametersByPathResult *> *)getParametersByPath:(AWSSsmGetParametersByPathRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParametersByPath"
                   outputClass:[AWSSsmGetParametersByPathResult class]];
}

- (void)getParametersByPath:(AWSSsmGetParametersByPathRequest *)request
     completionHandler:(void (^)(AWSSsmGetParametersByPathResult *response, NSError *error))completionHandler {
    [[self getParametersByPath:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetParametersByPathResult *> * _Nonnull task) {
        AWSSsmGetParametersByPathResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetPatchBaselineResult *> *)getPatchBaseline:(AWSSsmGetPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetPatchBaseline"
                   outputClass:[AWSSsmGetPatchBaselineResult class]];
}

- (void)getPatchBaseline:(AWSSsmGetPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSsmGetPatchBaselineResult *response, NSError *error))completionHandler {
    [[self getPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetPatchBaselineResult *> * _Nonnull task) {
        AWSSsmGetPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetPatchBaselineForPatchGroupResult *> *)getPatchBaselineForPatchGroup:(AWSSsmGetPatchBaselineForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetPatchBaselineForPatchGroup"
                   outputClass:[AWSSsmGetPatchBaselineForPatchGroupResult class]];
}

- (void)getPatchBaselineForPatchGroup:(AWSSsmGetPatchBaselineForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSsmGetPatchBaselineForPatchGroupResult *response, NSError *error))completionHandler {
    [[self getPatchBaselineForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetPatchBaselineForPatchGroupResult *> * _Nonnull task) {
        AWSSsmGetPatchBaselineForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmGetServiceSettingResult *> *)getServiceSetting:(AWSSsmGetServiceSettingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetServiceSetting"
                   outputClass:[AWSSsmGetServiceSettingResult class]];
}

- (void)getServiceSetting:(AWSSsmGetServiceSettingRequest *)request
     completionHandler:(void (^)(AWSSsmGetServiceSettingResult *response, NSError *error))completionHandler {
    [[self getServiceSetting:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmGetServiceSettingResult *> * _Nonnull task) {
        AWSSsmGetServiceSettingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmLabelParameterVersionResult *> *)labelParameterVersion:(AWSSsmLabelParameterVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"LabelParameterVersion"
                   outputClass:[AWSSsmLabelParameterVersionResult class]];
}

- (void)labelParameterVersion:(AWSSsmLabelParameterVersionRequest *)request
     completionHandler:(void (^)(AWSSsmLabelParameterVersionResult *response, NSError *error))completionHandler {
    [[self labelParameterVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmLabelParameterVersionResult *> * _Nonnull task) {
        AWSSsmLabelParameterVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListAssociationVersionsResult *> *)listAssociationVersions:(AWSSsmListAssociationVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListAssociationVersions"
                   outputClass:[AWSSsmListAssociationVersionsResult class]];
}

- (void)listAssociationVersions:(AWSSsmListAssociationVersionsRequest *)request
     completionHandler:(void (^)(AWSSsmListAssociationVersionsResult *response, NSError *error))completionHandler {
    [[self listAssociationVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListAssociationVersionsResult *> * _Nonnull task) {
        AWSSsmListAssociationVersionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListAssociationsResult *> *)listAssociations:(AWSSsmListAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListAssociations"
                   outputClass:[AWSSsmListAssociationsResult class]];
}

- (void)listAssociations:(AWSSsmListAssociationsRequest *)request
     completionHandler:(void (^)(AWSSsmListAssociationsResult *response, NSError *error))completionHandler {
    [[self listAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListAssociationsResult *> * _Nonnull task) {
        AWSSsmListAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListCommandInvocationsResult *> *)listCommandInvocations:(AWSSsmListCommandInvocationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListCommandInvocations"
                   outputClass:[AWSSsmListCommandInvocationsResult class]];
}

- (void)listCommandInvocations:(AWSSsmListCommandInvocationsRequest *)request
     completionHandler:(void (^)(AWSSsmListCommandInvocationsResult *response, NSError *error))completionHandler {
    [[self listCommandInvocations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListCommandInvocationsResult *> * _Nonnull task) {
        AWSSsmListCommandInvocationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListCommandsResult *> *)listCommands:(AWSSsmListCommandsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListCommands"
                   outputClass:[AWSSsmListCommandsResult class]];
}

- (void)listCommands:(AWSSsmListCommandsRequest *)request
     completionHandler:(void (^)(AWSSsmListCommandsResult *response, NSError *error))completionHandler {
    [[self listCommands:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListCommandsResult *> * _Nonnull task) {
        AWSSsmListCommandsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListComplianceItemsResult *> *)listComplianceItems:(AWSSsmListComplianceItemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListComplianceItems"
                   outputClass:[AWSSsmListComplianceItemsResult class]];
}

- (void)listComplianceItems:(AWSSsmListComplianceItemsRequest *)request
     completionHandler:(void (^)(AWSSsmListComplianceItemsResult *response, NSError *error))completionHandler {
    [[self listComplianceItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListComplianceItemsResult *> * _Nonnull task) {
        AWSSsmListComplianceItemsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListComplianceSummariesResult *> *)listComplianceSummaries:(AWSSsmListComplianceSummariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListComplianceSummaries"
                   outputClass:[AWSSsmListComplianceSummariesResult class]];
}

- (void)listComplianceSummaries:(AWSSsmListComplianceSummariesRequest *)request
     completionHandler:(void (^)(AWSSsmListComplianceSummariesResult *response, NSError *error))completionHandler {
    [[self listComplianceSummaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListComplianceSummariesResult *> * _Nonnull task) {
        AWSSsmListComplianceSummariesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListDocumentVersionsResult *> *)listDocumentVersions:(AWSSsmListDocumentVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListDocumentVersions"
                   outputClass:[AWSSsmListDocumentVersionsResult class]];
}

- (void)listDocumentVersions:(AWSSsmListDocumentVersionsRequest *)request
     completionHandler:(void (^)(AWSSsmListDocumentVersionsResult *response, NSError *error))completionHandler {
    [[self listDocumentVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListDocumentVersionsResult *> * _Nonnull task) {
        AWSSsmListDocumentVersionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListDocumentsResult *> *)listDocuments:(AWSSsmListDocumentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListDocuments"
                   outputClass:[AWSSsmListDocumentsResult class]];
}

- (void)listDocuments:(AWSSsmListDocumentsRequest *)request
     completionHandler:(void (^)(AWSSsmListDocumentsResult *response, NSError *error))completionHandler {
    [[self listDocuments:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListDocumentsResult *> * _Nonnull task) {
        AWSSsmListDocumentsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListInventoryEntriesResult *> *)listInventoryEntries:(AWSSsmListInventoryEntriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListInventoryEntries"
                   outputClass:[AWSSsmListInventoryEntriesResult class]];
}

- (void)listInventoryEntries:(AWSSsmListInventoryEntriesRequest *)request
     completionHandler:(void (^)(AWSSsmListInventoryEntriesResult *response, NSError *error))completionHandler {
    [[self listInventoryEntries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListInventoryEntriesResult *> * _Nonnull task) {
        AWSSsmListInventoryEntriesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListResourceComplianceSummariesResult *> *)listResourceComplianceSummaries:(AWSSsmListResourceComplianceSummariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListResourceComplianceSummaries"
                   outputClass:[AWSSsmListResourceComplianceSummariesResult class]];
}

- (void)listResourceComplianceSummaries:(AWSSsmListResourceComplianceSummariesRequest *)request
     completionHandler:(void (^)(AWSSsmListResourceComplianceSummariesResult *response, NSError *error))completionHandler {
    [[self listResourceComplianceSummaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListResourceComplianceSummariesResult *> * _Nonnull task) {
        AWSSsmListResourceComplianceSummariesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListResourceDataSyncResult *> *)listResourceDataSync:(AWSSsmListResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListResourceDataSync"
                   outputClass:[AWSSsmListResourceDataSyncResult class]];
}

- (void)listResourceDataSync:(AWSSsmListResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSsmListResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self listResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListResourceDataSyncResult *> * _Nonnull task) {
        AWSSsmListResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmListTagsForResourceResult *> *)listTagsForResource:(AWSSsmListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSSsmListTagsForResourceResult class]];
}

- (void)listTagsForResource:(AWSSsmListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSSsmListTagsForResourceResult *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmListTagsForResourceResult *> * _Nonnull task) {
        AWSSsmListTagsForResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmModifyDocumentPermissionResponse *> *)modifyDocumentPermission:(AWSSsmModifyDocumentPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ModifyDocumentPermission"
                   outputClass:[AWSSsmModifyDocumentPermissionResponse class]];
}

- (void)modifyDocumentPermission:(AWSSsmModifyDocumentPermissionRequest *)request
     completionHandler:(void (^)(AWSSsmModifyDocumentPermissionResponse *response, NSError *error))completionHandler {
    [[self modifyDocumentPermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmModifyDocumentPermissionResponse *> * _Nonnull task) {
        AWSSsmModifyDocumentPermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmPutComplianceItemsResult *> *)putComplianceItems:(AWSSsmPutComplianceItemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"PutComplianceItems"
                   outputClass:[AWSSsmPutComplianceItemsResult class]];
}

- (void)putComplianceItems:(AWSSsmPutComplianceItemsRequest *)request
     completionHandler:(void (^)(AWSSsmPutComplianceItemsResult *response, NSError *error))completionHandler {
    [[self putComplianceItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmPutComplianceItemsResult *> * _Nonnull task) {
        AWSSsmPutComplianceItemsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmPutInventoryResult *> *)putInventory:(AWSSsmPutInventoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"PutInventory"
                   outputClass:[AWSSsmPutInventoryResult class]];
}

- (void)putInventory:(AWSSsmPutInventoryRequest *)request
     completionHandler:(void (^)(AWSSsmPutInventoryResult *response, NSError *error))completionHandler {
    [[self putInventory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmPutInventoryResult *> * _Nonnull task) {
        AWSSsmPutInventoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmPutParameterResult *> *)putParameter:(AWSSsmPutParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"PutParameter"
                   outputClass:[AWSSsmPutParameterResult class]];
}

- (void)putParameter:(AWSSsmPutParameterRequest *)request
     completionHandler:(void (^)(AWSSsmPutParameterResult *response, NSError *error))completionHandler {
    [[self putParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmPutParameterResult *> * _Nonnull task) {
        AWSSsmPutParameterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmRegisterDefaultPatchBaselineResult *> *)registerDefaultPatchBaseline:(AWSSsmRegisterDefaultPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterDefaultPatchBaseline"
                   outputClass:[AWSSsmRegisterDefaultPatchBaselineResult class]];
}

- (void)registerDefaultPatchBaseline:(AWSSsmRegisterDefaultPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSsmRegisterDefaultPatchBaselineResult *response, NSError *error))completionHandler {
    [[self registerDefaultPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmRegisterDefaultPatchBaselineResult *> * _Nonnull task) {
        AWSSsmRegisterDefaultPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmRegisterPatchBaselineForPatchGroupResult *> *)registerPatchBaselineForPatchGroup:(AWSSsmRegisterPatchBaselineForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterPatchBaselineForPatchGroup"
                   outputClass:[AWSSsmRegisterPatchBaselineForPatchGroupResult class]];
}

- (void)registerPatchBaselineForPatchGroup:(AWSSsmRegisterPatchBaselineForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSsmRegisterPatchBaselineForPatchGroupResult *response, NSError *error))completionHandler {
    [[self registerPatchBaselineForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmRegisterPatchBaselineForPatchGroupResult *> * _Nonnull task) {
        AWSSsmRegisterPatchBaselineForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmRegisterTargetWithMaintenanceWindowResult *> *)registerTargetWithMaintenanceWindow:(AWSSsmRegisterTargetWithMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterTargetWithMaintenanceWindow"
                   outputClass:[AWSSsmRegisterTargetWithMaintenanceWindowResult class]];
}

- (void)registerTargetWithMaintenanceWindow:(AWSSsmRegisterTargetWithMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSsmRegisterTargetWithMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self registerTargetWithMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmRegisterTargetWithMaintenanceWindowResult *> * _Nonnull task) {
        AWSSsmRegisterTargetWithMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmRegisterTaskWithMaintenanceWindowResult *> *)registerTaskWithMaintenanceWindow:(AWSSsmRegisterTaskWithMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterTaskWithMaintenanceWindow"
                   outputClass:[AWSSsmRegisterTaskWithMaintenanceWindowResult class]];
}

- (void)registerTaskWithMaintenanceWindow:(AWSSsmRegisterTaskWithMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSsmRegisterTaskWithMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self registerTaskWithMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmRegisterTaskWithMaintenanceWindowResult *> * _Nonnull task) {
        AWSSsmRegisterTaskWithMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmRemoveTagsFromResourceResult *> *)removeTagsFromResource:(AWSSsmRemoveTagsFromResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RemoveTagsFromResource"
                   outputClass:[AWSSsmRemoveTagsFromResourceResult class]];
}

- (void)removeTagsFromResource:(AWSSsmRemoveTagsFromResourceRequest *)request
     completionHandler:(void (^)(AWSSsmRemoveTagsFromResourceResult *response, NSError *error))completionHandler {
    [[self removeTagsFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmRemoveTagsFromResourceResult *> * _Nonnull task) {
        AWSSsmRemoveTagsFromResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmResetServiceSettingResult *> *)resetServiceSetting:(AWSSsmResetServiceSettingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ResetServiceSetting"
                   outputClass:[AWSSsmResetServiceSettingResult class]];
}

- (void)resetServiceSetting:(AWSSsmResetServiceSettingRequest *)request
     completionHandler:(void (^)(AWSSsmResetServiceSettingResult *response, NSError *error))completionHandler {
    [[self resetServiceSetting:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmResetServiceSettingResult *> * _Nonnull task) {
        AWSSsmResetServiceSettingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmResumeSessionResponse *> *)resumeSession:(AWSSsmResumeSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ResumeSession"
                   outputClass:[AWSSsmResumeSessionResponse class]];
}

- (void)resumeSession:(AWSSsmResumeSessionRequest *)request
     completionHandler:(void (^)(AWSSsmResumeSessionResponse *response, NSError *error))completionHandler {
    [[self resumeSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmResumeSessionResponse *> * _Nonnull task) {
        AWSSsmResumeSessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmSendAutomationSignalResult *> *)sendAutomationSignal:(AWSSsmSendAutomationSignalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"SendAutomationSignal"
                   outputClass:[AWSSsmSendAutomationSignalResult class]];
}

- (void)sendAutomationSignal:(AWSSsmSendAutomationSignalRequest *)request
     completionHandler:(void (^)(AWSSsmSendAutomationSignalResult *response, NSError *error))completionHandler {
    [[self sendAutomationSignal:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmSendAutomationSignalResult *> * _Nonnull task) {
        AWSSsmSendAutomationSignalResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmSendCommandResult *> *)sendCommand:(AWSSsmSendCommandRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"SendCommand"
                   outputClass:[AWSSsmSendCommandResult class]];
}

- (void)sendCommand:(AWSSsmSendCommandRequest *)request
     completionHandler:(void (^)(AWSSsmSendCommandResult *response, NSError *error))completionHandler {
    [[self sendCommand:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmSendCommandResult *> * _Nonnull task) {
        AWSSsmSendCommandResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmStartAssociationsOnceResult *> *)startAssociationsOnce:(AWSSsmStartAssociationsOnceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StartAssociationsOnce"
                   outputClass:[AWSSsmStartAssociationsOnceResult class]];
}

- (void)startAssociationsOnce:(AWSSsmStartAssociationsOnceRequest *)request
     completionHandler:(void (^)(AWSSsmStartAssociationsOnceResult *response, NSError *error))completionHandler {
    [[self startAssociationsOnce:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmStartAssociationsOnceResult *> * _Nonnull task) {
        AWSSsmStartAssociationsOnceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmStartAutomationExecutionResult *> *)startAutomationExecution:(AWSSsmStartAutomationExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StartAutomationExecution"
                   outputClass:[AWSSsmStartAutomationExecutionResult class]];
}

- (void)startAutomationExecution:(AWSSsmStartAutomationExecutionRequest *)request
     completionHandler:(void (^)(AWSSsmStartAutomationExecutionResult *response, NSError *error))completionHandler {
    [[self startAutomationExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmStartAutomationExecutionResult *> * _Nonnull task) {
        AWSSsmStartAutomationExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmStartSessionResponse *> *)startSession:(AWSSsmStartSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StartSession"
                   outputClass:[AWSSsmStartSessionResponse class]];
}

- (void)startSession:(AWSSsmStartSessionRequest *)request
     completionHandler:(void (^)(AWSSsmStartSessionResponse *response, NSError *error))completionHandler {
    [[self startSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmStartSessionResponse *> * _Nonnull task) {
        AWSSsmStartSessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmStopAutomationExecutionResult *> *)stopAutomationExecution:(AWSSsmStopAutomationExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StopAutomationExecution"
                   outputClass:[AWSSsmStopAutomationExecutionResult class]];
}

- (void)stopAutomationExecution:(AWSSsmStopAutomationExecutionRequest *)request
     completionHandler:(void (^)(AWSSsmStopAutomationExecutionResult *response, NSError *error))completionHandler {
    [[self stopAutomationExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmStopAutomationExecutionResult *> * _Nonnull task) {
        AWSSsmStopAutomationExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmTerminateSessionResponse *> *)terminateSession:(AWSSsmTerminateSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"TerminateSession"
                   outputClass:[AWSSsmTerminateSessionResponse class]];
}

- (void)terminateSession:(AWSSsmTerminateSessionRequest *)request
     completionHandler:(void (^)(AWSSsmTerminateSessionResponse *response, NSError *error))completionHandler {
    [[self terminateSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmTerminateSessionResponse *> * _Nonnull task) {
        AWSSsmTerminateSessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateAssociationResult *> *)updateAssociation:(AWSSsmUpdateAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateAssociation"
                   outputClass:[AWSSsmUpdateAssociationResult class]];
}

- (void)updateAssociation:(AWSSsmUpdateAssociationRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateAssociationResult *response, NSError *error))completionHandler {
    [[self updateAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateAssociationResult *> * _Nonnull task) {
        AWSSsmUpdateAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateAssociationStatusResult *> *)updateAssociationStatus:(AWSSsmUpdateAssociationStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateAssociationStatus"
                   outputClass:[AWSSsmUpdateAssociationStatusResult class]];
}

- (void)updateAssociationStatus:(AWSSsmUpdateAssociationStatusRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateAssociationStatusResult *response, NSError *error))completionHandler {
    [[self updateAssociationStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateAssociationStatusResult *> * _Nonnull task) {
        AWSSsmUpdateAssociationStatusResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateDocumentResult *> *)updateDocument:(AWSSsmUpdateDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateDocument"
                   outputClass:[AWSSsmUpdateDocumentResult class]];
}

- (void)updateDocument:(AWSSsmUpdateDocumentRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateDocumentResult *response, NSError *error))completionHandler {
    [[self updateDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateDocumentResult *> * _Nonnull task) {
        AWSSsmUpdateDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateDocumentDefaultVersionResult *> *)updateDocumentDefaultVersion:(AWSSsmUpdateDocumentDefaultVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateDocumentDefaultVersion"
                   outputClass:[AWSSsmUpdateDocumentDefaultVersionResult class]];
}

- (void)updateDocumentDefaultVersion:(AWSSsmUpdateDocumentDefaultVersionRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateDocumentDefaultVersionResult *response, NSError *error))completionHandler {
    [[self updateDocumentDefaultVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateDocumentDefaultVersionResult *> * _Nonnull task) {
        AWSSsmUpdateDocumentDefaultVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateMaintenanceWindowResult *> *)updateMaintenanceWindow:(AWSSsmUpdateMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateMaintenanceWindow"
                   outputClass:[AWSSsmUpdateMaintenanceWindowResult class]];
}

- (void)updateMaintenanceWindow:(AWSSsmUpdateMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self updateMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateMaintenanceWindowResult *> * _Nonnull task) {
        AWSSsmUpdateMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateMaintenanceWindowTargetResult *> *)updateMaintenanceWindowTarget:(AWSSsmUpdateMaintenanceWindowTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateMaintenanceWindowTarget"
                   outputClass:[AWSSsmUpdateMaintenanceWindowTargetResult class]];
}

- (void)updateMaintenanceWindowTarget:(AWSSsmUpdateMaintenanceWindowTargetRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateMaintenanceWindowTargetResult *response, NSError *error))completionHandler {
    [[self updateMaintenanceWindowTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateMaintenanceWindowTargetResult *> * _Nonnull task) {
        AWSSsmUpdateMaintenanceWindowTargetResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateMaintenanceWindowTaskResult *> *)updateMaintenanceWindowTask:(AWSSsmUpdateMaintenanceWindowTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateMaintenanceWindowTask"
                   outputClass:[AWSSsmUpdateMaintenanceWindowTaskResult class]];
}

- (void)updateMaintenanceWindowTask:(AWSSsmUpdateMaintenanceWindowTaskRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateMaintenanceWindowTaskResult *response, NSError *error))completionHandler {
    [[self updateMaintenanceWindowTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateMaintenanceWindowTaskResult *> * _Nonnull task) {
        AWSSsmUpdateMaintenanceWindowTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateManagedInstanceRoleResult *> *)updateManagedInstanceRole:(AWSSsmUpdateManagedInstanceRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateManagedInstanceRole"
                   outputClass:[AWSSsmUpdateManagedInstanceRoleResult class]];
}

- (void)updateManagedInstanceRole:(AWSSsmUpdateManagedInstanceRoleRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateManagedInstanceRoleResult *response, NSError *error))completionHandler {
    [[self updateManagedInstanceRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateManagedInstanceRoleResult *> * _Nonnull task) {
        AWSSsmUpdateManagedInstanceRoleResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateOpsItemResponse *> *)updateOpsItem:(AWSSsmUpdateOpsItemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateOpsItem"
                   outputClass:[AWSSsmUpdateOpsItemResponse class]];
}

- (void)updateOpsItem:(AWSSsmUpdateOpsItemRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateOpsItemResponse *response, NSError *error))completionHandler {
    [[self updateOpsItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateOpsItemResponse *> * _Nonnull task) {
        AWSSsmUpdateOpsItemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdatePatchBaselineResult *> *)updatePatchBaseline:(AWSSsmUpdatePatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdatePatchBaseline"
                   outputClass:[AWSSsmUpdatePatchBaselineResult class]];
}

- (void)updatePatchBaseline:(AWSSsmUpdatePatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSsmUpdatePatchBaselineResult *response, NSError *error))completionHandler {
    [[self updatePatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdatePatchBaselineResult *> * _Nonnull task) {
        AWSSsmUpdatePatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateResourceDataSyncResult *> *)updateResourceDataSync:(AWSSsmUpdateResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateResourceDataSync"
                   outputClass:[AWSSsmUpdateResourceDataSyncResult class]];
}

- (void)updateResourceDataSync:(AWSSsmUpdateResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self updateResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateResourceDataSyncResult *> * _Nonnull task) {
        AWSSsmUpdateResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSsmUpdateServiceSettingResult *> *)updateServiceSetting:(AWSSsmUpdateServiceSettingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateServiceSetting"
                   outputClass:[AWSSsmUpdateServiceSettingResult class]];
}

- (void)updateServiceSetting:(AWSSsmUpdateServiceSettingRequest *)request
     completionHandler:(void (^)(AWSSsmUpdateServiceSettingResult *response, NSError *error))completionHandler {
    [[self updateServiceSetting:request] continueWithBlock:^id _Nullable(AWSTask<AWSSsmUpdateServiceSettingResult *> * _Nonnull task) {
        AWSSsmUpdateServiceSettingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
