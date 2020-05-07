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

#import "AWSSimpleSystemsManagerService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSimpleSystemsManagerResources.h"

static NSString *const AWSInfoSimpleSystemsManager = @"SimpleSystemsManager";
NSString *const AWSSimpleSystemsManagerSDKVersion = @"2.13.3";


@interface AWSSimpleSystemsManagerResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSimpleSystemsManagerResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AlreadyExistsException" : @(AWSSimpleSystemsManagerErrorAlreadyExists),
                            @"AssociatedInstances" : @(AWSSimpleSystemsManagerErrorAssociatedInstances),
                            @"AssociationAlreadyExists" : @(AWSSimpleSystemsManagerErrorAssociationAlreadyExists),
                            @"AssociationDoesNotExist" : @(AWSSimpleSystemsManagerErrorAssociationDoesNotExist),
                            @"AssociationExecutionDoesNotExist" : @(AWSSimpleSystemsManagerErrorAssociationExecutionDoesNotExist),
                            @"AssociationLimitExceeded" : @(AWSSimpleSystemsManagerErrorAssociationLimitExceeded),
                            @"AssociationVersionLimitExceeded" : @(AWSSimpleSystemsManagerErrorAssociationVersionLimitExceeded),
                            @"AutomationDefinitionNotFoundException" : @(AWSSimpleSystemsManagerErrorAutomationDefinitionNotFound),
                            @"AutomationDefinitionVersionNotFoundException" : @(AWSSimpleSystemsManagerErrorAutomationDefinitionVersionNotFound),
                            @"AutomationExecutionLimitExceededException" : @(AWSSimpleSystemsManagerErrorAutomationExecutionLimitExceeded),
                            @"AutomationExecutionNotFoundException" : @(AWSSimpleSystemsManagerErrorAutomationExecutionNotFound),
                            @"AutomationStepNotFoundException" : @(AWSSimpleSystemsManagerErrorAutomationStepNotFound),
                            @"ComplianceTypeCountLimitExceededException" : @(AWSSimpleSystemsManagerErrorComplianceTypeCountLimitExceeded),
                            @"CustomSchemaCountLimitExceededException" : @(AWSSimpleSystemsManagerErrorCustomSchemaCountLimitExceeded),
                            @"DocumentAlreadyExists" : @(AWSSimpleSystemsManagerErrorDocumentAlreadyExists),
                            @"DocumentLimitExceeded" : @(AWSSimpleSystemsManagerErrorDocumentLimitExceeded),
                            @"DocumentPermissionLimit" : @(AWSSimpleSystemsManagerErrorDocumentPermissionLimit),
                            @"DocumentVersionLimitExceeded" : @(AWSSimpleSystemsManagerErrorDocumentVersionLimitExceeded),
                            @"DoesNotExistException" : @(AWSSimpleSystemsManagerErrorDoesNotExist),
                            @"DuplicateDocumentContent" : @(AWSSimpleSystemsManagerErrorDuplicateDocumentContent),
                            @"DuplicateDocumentVersionName" : @(AWSSimpleSystemsManagerErrorDuplicateDocumentVersionName),
                            @"DuplicateInstanceId" : @(AWSSimpleSystemsManagerErrorDuplicateInstanceId),
                            @"FeatureNotAvailableException" : @(AWSSimpleSystemsManagerErrorFeatureNotAvailable),
                            @"HierarchyLevelLimitExceededException" : @(AWSSimpleSystemsManagerErrorHierarchyLevelLimitExceeded),
                            @"HierarchyTypeMismatchException" : @(AWSSimpleSystemsManagerErrorHierarchyTypeMismatch),
                            @"IdempotentParameterMismatch" : @(AWSSimpleSystemsManagerErrorIdempotentParameterMismatch),
                            @"IncompatiblePolicyException" : @(AWSSimpleSystemsManagerErrorIncompatiblePolicy),
                            @"InternalServerError" : @(AWSSimpleSystemsManagerErrorInternalServer),
                            @"InvalidActivation" : @(AWSSimpleSystemsManagerErrorInvalidActivation),
                            @"InvalidActivationId" : @(AWSSimpleSystemsManagerErrorInvalidActivationId),
                            @"InvalidAggregatorException" : @(AWSSimpleSystemsManagerErrorInvalidAggregator),
                            @"InvalidAllowedPatternException" : @(AWSSimpleSystemsManagerErrorInvalidAllowedPattern),
                            @"InvalidAssociation" : @(AWSSimpleSystemsManagerErrorInvalidAssociation),
                            @"InvalidAssociationVersion" : @(AWSSimpleSystemsManagerErrorInvalidAssociationVersion),
                            @"InvalidAutomationExecutionParametersException" : @(AWSSimpleSystemsManagerErrorInvalidAutomationExecutionParameters),
                            @"InvalidAutomationSignalException" : @(AWSSimpleSystemsManagerErrorInvalidAutomationSignal),
                            @"InvalidAutomationStatusUpdateException" : @(AWSSimpleSystemsManagerErrorInvalidAutomationStatusUpdate),
                            @"InvalidCommandId" : @(AWSSimpleSystemsManagerErrorInvalidCommandId),
                            @"InvalidDeleteInventoryParametersException" : @(AWSSimpleSystemsManagerErrorInvalidDeleteInventoryParameters),
                            @"InvalidDeletionIdException" : @(AWSSimpleSystemsManagerErrorInvalidDeletionId),
                            @"InvalidDocument" : @(AWSSimpleSystemsManagerErrorInvalidDocument),
                            @"InvalidDocumentContent" : @(AWSSimpleSystemsManagerErrorInvalidDocumentContent),
                            @"InvalidDocumentOperation" : @(AWSSimpleSystemsManagerErrorInvalidDocumentOperation),
                            @"InvalidDocumentSchemaVersion" : @(AWSSimpleSystemsManagerErrorInvalidDocumentSchemaVersion),
                            @"InvalidDocumentType" : @(AWSSimpleSystemsManagerErrorInvalidDocumentType),
                            @"InvalidDocumentVersion" : @(AWSSimpleSystemsManagerErrorInvalidDocumentVersion),
                            @"InvalidFilter" : @(AWSSimpleSystemsManagerErrorInvalidFilter),
                            @"InvalidFilterKey" : @(AWSSimpleSystemsManagerErrorInvalidFilterKey),
                            @"InvalidFilterOption" : @(AWSSimpleSystemsManagerErrorInvalidFilterOption),
                            @"InvalidFilterValue" : @(AWSSimpleSystemsManagerErrorInvalidFilterValue),
                            @"InvalidInstanceId" : @(AWSSimpleSystemsManagerErrorInvalidInstanceId),
                            @"InvalidInstanceInformationFilterValue" : @(AWSSimpleSystemsManagerErrorInvalidInstanceInformationFilterValue),
                            @"InvalidInventoryGroupException" : @(AWSSimpleSystemsManagerErrorInvalidInventoryGroup),
                            @"InvalidInventoryItemContextException" : @(AWSSimpleSystemsManagerErrorInvalidInventoryItemContext),
                            @"InvalidInventoryRequestException" : @(AWSSimpleSystemsManagerErrorInvalidInventoryRequest),
                            @"InvalidItemContentException" : @(AWSSimpleSystemsManagerErrorInvalidItemContent),
                            @"InvalidKeyId" : @(AWSSimpleSystemsManagerErrorInvalidKeyId),
                            @"InvalidNextToken" : @(AWSSimpleSystemsManagerErrorInvalidNextToken),
                            @"InvalidNotificationConfig" : @(AWSSimpleSystemsManagerErrorInvalidNotificationConfig),
                            @"InvalidOptionException" : @(AWSSimpleSystemsManagerErrorInvalidOption),
                            @"InvalidOutputFolder" : @(AWSSimpleSystemsManagerErrorInvalidOutputFolder),
                            @"InvalidOutputLocation" : @(AWSSimpleSystemsManagerErrorInvalidOutputLocation),
                            @"InvalidParameters" : @(AWSSimpleSystemsManagerErrorInvalidParameters),
                            @"InvalidPermissionType" : @(AWSSimpleSystemsManagerErrorInvalidPermissionType),
                            @"InvalidPluginName" : @(AWSSimpleSystemsManagerErrorInvalidPluginName),
                            @"InvalidPolicyAttributeException" : @(AWSSimpleSystemsManagerErrorInvalidPolicyAttribute),
                            @"InvalidPolicyTypeException" : @(AWSSimpleSystemsManagerErrorInvalidPolicyType),
                            @"InvalidResourceId" : @(AWSSimpleSystemsManagerErrorInvalidResourceId),
                            @"InvalidResourceType" : @(AWSSimpleSystemsManagerErrorInvalidResourceType),
                            @"InvalidResultAttributeException" : @(AWSSimpleSystemsManagerErrorInvalidResultAttribute),
                            @"InvalidRole" : @(AWSSimpleSystemsManagerErrorInvalidRole),
                            @"InvalidSchedule" : @(AWSSimpleSystemsManagerErrorInvalidSchedule),
                            @"InvalidTarget" : @(AWSSimpleSystemsManagerErrorInvalidTarget),
                            @"InvalidTypeNameException" : @(AWSSimpleSystemsManagerErrorInvalidTypeName),
                            @"InvalidUpdate" : @(AWSSimpleSystemsManagerErrorInvalidUpdate),
                            @"InvocationDoesNotExist" : @(AWSSimpleSystemsManagerErrorInvocationDoesNotExist),
                            @"ItemContentMismatchException" : @(AWSSimpleSystemsManagerErrorItemContentMismatch),
                            @"ItemSizeLimitExceededException" : @(AWSSimpleSystemsManagerErrorItemSizeLimitExceeded),
                            @"MaxDocumentSizeExceeded" : @(AWSSimpleSystemsManagerErrorMaxDocumentSizeExceeded),
                            @"OpsItemAlreadyExistsException" : @(AWSSimpleSystemsManagerErrorOpsItemAlreadyExists),
                            @"OpsItemInvalidParameterException" : @(AWSSimpleSystemsManagerErrorOpsItemInvalidParameter),
                            @"OpsItemLimitExceededException" : @(AWSSimpleSystemsManagerErrorOpsItemLimitExceeded),
                            @"OpsItemNotFoundException" : @(AWSSimpleSystemsManagerErrorOpsItemNotFound),
                            @"ParameterAlreadyExists" : @(AWSSimpleSystemsManagerErrorParameterAlreadyExists),
                            @"ParameterLimitExceeded" : @(AWSSimpleSystemsManagerErrorParameterLimitExceeded),
                            @"ParameterMaxVersionLimitExceeded" : @(AWSSimpleSystemsManagerErrorParameterMaxVersionLimitExceeded),
                            @"ParameterNotFound" : @(AWSSimpleSystemsManagerErrorParameterNotFound),
                            @"ParameterPatternMismatchException" : @(AWSSimpleSystemsManagerErrorParameterPatternMismatch),
                            @"ParameterVersionLabelLimitExceeded" : @(AWSSimpleSystemsManagerErrorParameterVersionLabelLimitExceeded),
                            @"ParameterVersionNotFound" : @(AWSSimpleSystemsManagerErrorParameterVersionNotFound),
                            @"PoliciesLimitExceededException" : @(AWSSimpleSystemsManagerErrorPoliciesLimitExceeded),
                            @"ResourceDataSyncAlreadyExistsException" : @(AWSSimpleSystemsManagerErrorResourceDataSyncAlreadyExists),
                            @"ResourceDataSyncConflictException" : @(AWSSimpleSystemsManagerErrorResourceDataSyncConflict),
                            @"ResourceDataSyncCountExceededException" : @(AWSSimpleSystemsManagerErrorResourceDataSyncCountExceeded),
                            @"ResourceDataSyncInvalidConfigurationException" : @(AWSSimpleSystemsManagerErrorResourceDataSyncInvalidConfiguration),
                            @"ResourceDataSyncNotFoundException" : @(AWSSimpleSystemsManagerErrorResourceDataSyncNotFound),
                            @"ResourceInUseException" : @(AWSSimpleSystemsManagerErrorResourceInUse),
                            @"ResourceLimitExceededException" : @(AWSSimpleSystemsManagerErrorResourceLimitExceeded),
                            @"ServiceSettingNotFound" : @(AWSSimpleSystemsManagerErrorServiceSettingNotFound),
                            @"StatusUnchanged" : @(AWSSimpleSystemsManagerErrorStatusUnchanged),
                            @"SubTypeCountLimitExceededException" : @(AWSSimpleSystemsManagerErrorSubTypeCountLimitExceeded),
                            @"TargetInUseException" : @(AWSSimpleSystemsManagerErrorTargetInUse),
                            @"TargetNotConnected" : @(AWSSimpleSystemsManagerErrorTargetNotConnected),
                            @"TooManyTagsError" : @(AWSSimpleSystemsManagerErrorTooManyTags),
                            @"TooManyUpdates" : @(AWSSimpleSystemsManagerErrorTooManyUpdates),
                            @"TotalSizeLimitExceededException" : @(AWSSimpleSystemsManagerErrorTotalSizeLimitExceeded),
                            @"UnsupportedCalendarException" : @(AWSSimpleSystemsManagerErrorUnsupportedCalendar),
                            @"UnsupportedFeatureRequiredException" : @(AWSSimpleSystemsManagerErrorUnsupportedFeatureRequired),
                            @"UnsupportedInventoryItemContextException" : @(AWSSimpleSystemsManagerErrorUnsupportedInventoryItemContext),
                            @"UnsupportedInventorySchemaVersionException" : @(AWSSimpleSystemsManagerErrorUnsupportedInventorySchemaVersion),
                            @"UnsupportedOperatingSystem" : @(AWSSimpleSystemsManagerErrorUnsupportedOperatingSystem),
                            @"UnsupportedParameterType" : @(AWSSimpleSystemsManagerErrorUnsupportedParameterType),
                            @"UnsupportedPlatformType" : @(AWSSimpleSystemsManagerErrorUnsupportedPlatformType),
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
	                *error = [NSError errorWithDomain:AWSSimpleSystemsManagerErrorDomain
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
        *error = [NSError errorWithDomain:AWSSimpleSystemsManagerErrorDomain
                                     code:AWSSimpleSystemsManagerErrorUnknown
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

@interface AWSSimpleSystemsManagerRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSimpleSystemsManagerRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSimpleSystemsManager()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSimpleSystemsManager

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSimpleSystemsManagerSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSimpleSystemsManager versions need to match. Check your SDK installation. AWSCore: %@ AWSSimpleSystemsManager: %@", AWSiOSSDKVersion, AWSSimpleSystemsManagerSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSimpleSystemsManager {
    static AWSSimpleSystemsManager *_defaultSimpleSystemsManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSimpleSystemsManager];
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
        _defaultSimpleSystemsManager = [[AWSSimpleSystemsManager alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSimpleSystemsManager;
}

+ (void)registerSimpleSystemsManagerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSimpleSystemsManager alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SimpleSystemsManagerForKey:(NSString *)key {
    @synchronized(self) {
        AWSSimpleSystemsManager *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSimpleSystemsManager
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSimpleSystemsManager registerSimpleSystemsManagerWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSimpleSystemsManagerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSimpleSystemsManager` or `+ SimpleSystemsManagerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSimpleSystemsManager
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSimpleSystemsManager];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSimpleSystemsManagerRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSimpleSystemsManagerResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSimpleSystemsManagerResponseSerializer alloc] initWithJSONDefinition:[[AWSSimpleSystemsManagerResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSimpleSystemsManagerAddTagsToResourceResult *> *)addTagsToResource:(AWSSimpleSystemsManagerAddTagsToResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"AddTagsToResource"
                   outputClass:[AWSSimpleSystemsManagerAddTagsToResourceResult class]];
}

- (void)addTagsToResource:(AWSSimpleSystemsManagerAddTagsToResourceRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerAddTagsToResourceResult *response, NSError *error))completionHandler {
    [[self addTagsToResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerAddTagsToResourceResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerAddTagsToResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerCancelCommandResult *> *)cancelCommand:(AWSSimpleSystemsManagerCancelCommandRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CancelCommand"
                   outputClass:[AWSSimpleSystemsManagerCancelCommandResult class]];
}

- (void)cancelCommand:(AWSSimpleSystemsManagerCancelCommandRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerCancelCommandResult *response, NSError *error))completionHandler {
    [[self cancelCommand:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerCancelCommandResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerCancelCommandResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult *> *)cancelMaintenanceWindowExecution:(AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CancelMaintenanceWindowExecution"
                   outputClass:[AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult class]];
}

- (void)cancelMaintenanceWindowExecution:(AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult *response, NSError *error))completionHandler {
    [[self cancelMaintenanceWindowExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerCancelMaintenanceWindowExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerCreateActivationResult *> *)createActivation:(AWSSimpleSystemsManagerCreateActivationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateActivation"
                   outputClass:[AWSSimpleSystemsManagerCreateActivationResult class]];
}

- (void)createActivation:(AWSSimpleSystemsManagerCreateActivationRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerCreateActivationResult *response, NSError *error))completionHandler {
    [[self createActivation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerCreateActivationResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerCreateActivationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerCreateAssociationResult *> *)createAssociation:(AWSSimpleSystemsManagerCreateAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateAssociation"
                   outputClass:[AWSSimpleSystemsManagerCreateAssociationResult class]];
}

- (void)createAssociation:(AWSSimpleSystemsManagerCreateAssociationRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerCreateAssociationResult *response, NSError *error))completionHandler {
    [[self createAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerCreateAssociationResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerCreateAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerCreateAssociationBatchResult *> *)createAssociationBatch:(AWSSimpleSystemsManagerCreateAssociationBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateAssociationBatch"
                   outputClass:[AWSSimpleSystemsManagerCreateAssociationBatchResult class]];
}

- (void)createAssociationBatch:(AWSSimpleSystemsManagerCreateAssociationBatchRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerCreateAssociationBatchResult *response, NSError *error))completionHandler {
    [[self createAssociationBatch:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerCreateAssociationBatchResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerCreateAssociationBatchResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerCreateDocumentResult *> *)createDocument:(AWSSimpleSystemsManagerCreateDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateDocument"
                   outputClass:[AWSSimpleSystemsManagerCreateDocumentResult class]];
}

- (void)createDocument:(AWSSimpleSystemsManagerCreateDocumentRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerCreateDocumentResult *response, NSError *error))completionHandler {
    [[self createDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerCreateDocumentResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerCreateDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerCreateMaintenanceWindowResult *> *)createMaintenanceWindow:(AWSSimpleSystemsManagerCreateMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateMaintenanceWindow"
                   outputClass:[AWSSimpleSystemsManagerCreateMaintenanceWindowResult class]];
}

- (void)createMaintenanceWindow:(AWSSimpleSystemsManagerCreateMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerCreateMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self createMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerCreateMaintenanceWindowResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerCreateMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerCreateOpsItemResponse *> *)createOpsItem:(AWSSimpleSystemsManagerCreateOpsItemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateOpsItem"
                   outputClass:[AWSSimpleSystemsManagerCreateOpsItemResponse class]];
}

- (void)createOpsItem:(AWSSimpleSystemsManagerCreateOpsItemRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerCreateOpsItemResponse *response, NSError *error))completionHandler {
    [[self createOpsItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerCreateOpsItemResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerCreateOpsItemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerCreatePatchBaselineResult *> *)createPatchBaseline:(AWSSimpleSystemsManagerCreatePatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreatePatchBaseline"
                   outputClass:[AWSSimpleSystemsManagerCreatePatchBaselineResult class]];
}

- (void)createPatchBaseline:(AWSSimpleSystemsManagerCreatePatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerCreatePatchBaselineResult *response, NSError *error))completionHandler {
    [[self createPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerCreatePatchBaselineResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerCreatePatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerCreateResourceDataSyncResult *> *)createResourceDataSync:(AWSSimpleSystemsManagerCreateResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateResourceDataSync"
                   outputClass:[AWSSimpleSystemsManagerCreateResourceDataSyncResult class]];
}

- (void)createResourceDataSync:(AWSSimpleSystemsManagerCreateResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerCreateResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self createResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerCreateResourceDataSyncResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerCreateResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeleteActivationResult *> *)deleteActivation:(AWSSimpleSystemsManagerDeleteActivationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteActivation"
                   outputClass:[AWSSimpleSystemsManagerDeleteActivationResult class]];
}

- (void)deleteActivation:(AWSSimpleSystemsManagerDeleteActivationRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeleteActivationResult *response, NSError *error))completionHandler {
    [[self deleteActivation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeleteActivationResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeleteActivationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeleteAssociationResult *> *)deleteAssociation:(AWSSimpleSystemsManagerDeleteAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteAssociation"
                   outputClass:[AWSSimpleSystemsManagerDeleteAssociationResult class]];
}

- (void)deleteAssociation:(AWSSimpleSystemsManagerDeleteAssociationRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeleteAssociationResult *response, NSError *error))completionHandler {
    [[self deleteAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeleteAssociationResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeleteAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeleteDocumentResult *> *)deleteDocument:(AWSSimpleSystemsManagerDeleteDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteDocument"
                   outputClass:[AWSSimpleSystemsManagerDeleteDocumentResult class]];
}

- (void)deleteDocument:(AWSSimpleSystemsManagerDeleteDocumentRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeleteDocumentResult *response, NSError *error))completionHandler {
    [[self deleteDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeleteDocumentResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeleteDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeleteInventoryResult *> *)deleteInventory:(AWSSimpleSystemsManagerDeleteInventoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteInventory"
                   outputClass:[AWSSimpleSystemsManagerDeleteInventoryResult class]];
}

- (void)deleteInventory:(AWSSimpleSystemsManagerDeleteInventoryRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeleteInventoryResult *response, NSError *error))completionHandler {
    [[self deleteInventory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeleteInventoryResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeleteInventoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeleteMaintenanceWindowResult *> *)deleteMaintenanceWindow:(AWSSimpleSystemsManagerDeleteMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteMaintenanceWindow"
                   outputClass:[AWSSimpleSystemsManagerDeleteMaintenanceWindowResult class]];
}

- (void)deleteMaintenanceWindow:(AWSSimpleSystemsManagerDeleteMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeleteMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self deleteMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeleteMaintenanceWindowResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeleteMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeleteParameterResult *> *)deleteParameter:(AWSSimpleSystemsManagerDeleteParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteParameter"
                   outputClass:[AWSSimpleSystemsManagerDeleteParameterResult class]];
}

- (void)deleteParameter:(AWSSimpleSystemsManagerDeleteParameterRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeleteParameterResult *response, NSError *error))completionHandler {
    [[self deleteParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeleteParameterResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeleteParameterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeleteParametersResult *> *)deleteParameters:(AWSSimpleSystemsManagerDeleteParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteParameters"
                   outputClass:[AWSSimpleSystemsManagerDeleteParametersResult class]];
}

- (void)deleteParameters:(AWSSimpleSystemsManagerDeleteParametersRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeleteParametersResult *response, NSError *error))completionHandler {
    [[self deleteParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeleteParametersResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeleteParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeletePatchBaselineResult *> *)deletePatchBaseline:(AWSSimpleSystemsManagerDeletePatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeletePatchBaseline"
                   outputClass:[AWSSimpleSystemsManagerDeletePatchBaselineResult class]];
}

- (void)deletePatchBaseline:(AWSSimpleSystemsManagerDeletePatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeletePatchBaselineResult *response, NSError *error))completionHandler {
    [[self deletePatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeletePatchBaselineResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeletePatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeleteResourceDataSyncResult *> *)deleteResourceDataSync:(AWSSimpleSystemsManagerDeleteResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteResourceDataSync"
                   outputClass:[AWSSimpleSystemsManagerDeleteResourceDataSyncResult class]];
}

- (void)deleteResourceDataSync:(AWSSimpleSystemsManagerDeleteResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeleteResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self deleteResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeleteResourceDataSyncResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeleteResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeregisterManagedInstanceResult *> *)deregisterManagedInstance:(AWSSimpleSystemsManagerDeregisterManagedInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterManagedInstance"
                   outputClass:[AWSSimpleSystemsManagerDeregisterManagedInstanceResult class]];
}

- (void)deregisterManagedInstance:(AWSSimpleSystemsManagerDeregisterManagedInstanceRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeregisterManagedInstanceResult *response, NSError *error))completionHandler {
    [[self deregisterManagedInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeregisterManagedInstanceResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeregisterManagedInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult *> *)deregisterPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterPatchBaselineForPatchGroup"
                   outputClass:[AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult class]];
}

- (void)deregisterPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult *response, NSError *error))completionHandler {
    [[self deregisterPatchBaselineForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeregisterPatchBaselineForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult *> *)deregisterTargetFromMaintenanceWindow:(AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterTargetFromMaintenanceWindow"
                   outputClass:[AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult class]];
}

- (void)deregisterTargetFromMaintenanceWindow:(AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self deregisterTargetFromMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeregisterTargetFromMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult *> *)deregisterTaskFromMaintenanceWindow:(AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterTaskFromMaintenanceWindow"
                   outputClass:[AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult class]];
}

- (void)deregisterTaskFromMaintenanceWindow:(AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self deregisterTaskFromMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDeregisterTaskFromMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeActivationsResult *> *)describeActivations:(AWSSimpleSystemsManagerDescribeActivationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeActivations"
                   outputClass:[AWSSimpleSystemsManagerDescribeActivationsResult class]];
}

- (void)describeActivations:(AWSSimpleSystemsManagerDescribeActivationsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeActivationsResult *response, NSError *error))completionHandler {
    [[self describeActivations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeActivationsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeActivationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeAssociationResult *> *)describeAssociation:(AWSSimpleSystemsManagerDescribeAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAssociation"
                   outputClass:[AWSSimpleSystemsManagerDescribeAssociationResult class]];
}

- (void)describeAssociation:(AWSSimpleSystemsManagerDescribeAssociationRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeAssociationResult *response, NSError *error))completionHandler {
    [[self describeAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeAssociationResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult *> *)describeAssociationExecutionTargets:(AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAssociationExecutionTargets"
                   outputClass:[AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult class]];
}

- (void)describeAssociationExecutionTargets:(AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult *response, NSError *error))completionHandler {
    [[self describeAssociationExecutionTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeAssociationExecutionTargetsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeAssociationExecutionsResult *> *)describeAssociationExecutions:(AWSSimpleSystemsManagerDescribeAssociationExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAssociationExecutions"
                   outputClass:[AWSSimpleSystemsManagerDescribeAssociationExecutionsResult class]];
}

- (void)describeAssociationExecutions:(AWSSimpleSystemsManagerDescribeAssociationExecutionsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeAssociationExecutionsResult *response, NSError *error))completionHandler {
    [[self describeAssociationExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeAssociationExecutionsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeAssociationExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeAutomationExecutionsResult *> *)describeAutomationExecutions:(AWSSimpleSystemsManagerDescribeAutomationExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAutomationExecutions"
                   outputClass:[AWSSimpleSystemsManagerDescribeAutomationExecutionsResult class]];
}

- (void)describeAutomationExecutions:(AWSSimpleSystemsManagerDescribeAutomationExecutionsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeAutomationExecutionsResult *response, NSError *error))completionHandler {
    [[self describeAutomationExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeAutomationExecutionsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeAutomationExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult *> *)describeAutomationStepExecutions:(AWSSimpleSystemsManagerDescribeAutomationStepExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAutomationStepExecutions"
                   outputClass:[AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult class]];
}

- (void)describeAutomationStepExecutions:(AWSSimpleSystemsManagerDescribeAutomationStepExecutionsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult *response, NSError *error))completionHandler {
    [[self describeAutomationStepExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeAutomationStepExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeAvailablePatchesResult *> *)describeAvailablePatches:(AWSSimpleSystemsManagerDescribeAvailablePatchesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAvailablePatches"
                   outputClass:[AWSSimpleSystemsManagerDescribeAvailablePatchesResult class]];
}

- (void)describeAvailablePatches:(AWSSimpleSystemsManagerDescribeAvailablePatchesRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeAvailablePatchesResult *response, NSError *error))completionHandler {
    [[self describeAvailablePatches:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeAvailablePatchesResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeAvailablePatchesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeDocumentResult *> *)describeDocument:(AWSSimpleSystemsManagerDescribeDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeDocument"
                   outputClass:[AWSSimpleSystemsManagerDescribeDocumentResult class]];
}

- (void)describeDocument:(AWSSimpleSystemsManagerDescribeDocumentRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeDocumentResult *response, NSError *error))completionHandler {
    [[self describeDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeDocumentResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeDocumentPermissionResponse *> *)describeDocumentPermission:(AWSSimpleSystemsManagerDescribeDocumentPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeDocumentPermission"
                   outputClass:[AWSSimpleSystemsManagerDescribeDocumentPermissionResponse class]];
}

- (void)describeDocumentPermission:(AWSSimpleSystemsManagerDescribeDocumentPermissionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeDocumentPermissionResponse *response, NSError *error))completionHandler {
    [[self describeDocumentPermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeDocumentPermissionResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeDocumentPermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult *> *)describeEffectiveInstanceAssociations:(AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeEffectiveInstanceAssociations"
                   outputClass:[AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult class]];
}

- (void)describeEffectiveInstanceAssociations:(AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult *response, NSError *error))completionHandler {
    [[self describeEffectiveInstanceAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeEffectiveInstanceAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult *> *)describeEffectivePatchesForPatchBaseline:(AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeEffectivePatchesForPatchBaseline"
                   outputClass:[AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult class]];
}

- (void)describeEffectivePatchesForPatchBaseline:(AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult *response, NSError *error))completionHandler {
    [[self describeEffectivePatchesForPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeEffectivePatchesForPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult *> *)describeInstanceAssociationsStatus:(AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstanceAssociationsStatus"
                   outputClass:[AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult class]];
}

- (void)describeInstanceAssociationsStatus:(AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult *response, NSError *error))completionHandler {
    [[self describeInstanceAssociationsStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeInstanceAssociationsStatusResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeInstanceInformationResult *> *)describeInstanceInformation:(AWSSimpleSystemsManagerDescribeInstanceInformationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstanceInformation"
                   outputClass:[AWSSimpleSystemsManagerDescribeInstanceInformationResult class]];
}

- (void)describeInstanceInformation:(AWSSimpleSystemsManagerDescribeInstanceInformationRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeInstanceInformationResult *response, NSError *error))completionHandler {
    [[self describeInstanceInformation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeInstanceInformationResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeInstanceInformationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeInstancePatchStatesResult *> *)describeInstancePatchStates:(AWSSimpleSystemsManagerDescribeInstancePatchStatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstancePatchStates"
                   outputClass:[AWSSimpleSystemsManagerDescribeInstancePatchStatesResult class]];
}

- (void)describeInstancePatchStates:(AWSSimpleSystemsManagerDescribeInstancePatchStatesRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeInstancePatchStatesResult *response, NSError *error))completionHandler {
    [[self describeInstancePatchStates:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeInstancePatchStatesResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeInstancePatchStatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult *> *)describeInstancePatchStatesForPatchGroup:(AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstancePatchStatesForPatchGroup"
                   outputClass:[AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult class]];
}

- (void)describeInstancePatchStatesForPatchGroup:(AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult *response, NSError *error))completionHandler {
    [[self describeInstancePatchStatesForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeInstancePatchStatesForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeInstancePatchesResult *> *)describeInstancePatches:(AWSSimpleSystemsManagerDescribeInstancePatchesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstancePatches"
                   outputClass:[AWSSimpleSystemsManagerDescribeInstancePatchesResult class]];
}

- (void)describeInstancePatches:(AWSSimpleSystemsManagerDescribeInstancePatchesRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeInstancePatchesResult *response, NSError *error))completionHandler {
    [[self describeInstancePatches:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeInstancePatchesResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeInstancePatchesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeInventoryDeletionsResult *> *)describeInventoryDeletions:(AWSSimpleSystemsManagerDescribeInventoryDeletionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInventoryDeletions"
                   outputClass:[AWSSimpleSystemsManagerDescribeInventoryDeletionsResult class]];
}

- (void)describeInventoryDeletions:(AWSSimpleSystemsManagerDescribeInventoryDeletionsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeInventoryDeletionsResult *response, NSError *error))completionHandler {
    [[self describeInventoryDeletions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeInventoryDeletionsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeInventoryDeletionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult *> *)describeMaintenanceWindowExecutionTaskInvocations:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowExecutionTaskInvocations"
                   outputClass:[AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult class]];
}

- (void)describeMaintenanceWindowExecutionTaskInvocations:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowExecutionTaskInvocations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTaskInvocationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult *> *)describeMaintenanceWindowExecutionTasks:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowExecutionTasks"
                   outputClass:[AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult class]];
}

- (void)describeMaintenanceWindowExecutionTasks:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowExecutionTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionTasksResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult *> *)describeMaintenanceWindowExecutions:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowExecutions"
                   outputClass:[AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult class]];
}

- (void)describeMaintenanceWindowExecutions:(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeMaintenanceWindowExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult *> *)describeMaintenanceWindowSchedule:(AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowSchedule"
                   outputClass:[AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult class]];
}

- (void)describeMaintenanceWindowSchedule:(AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeMaintenanceWindowScheduleResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult *> *)describeMaintenanceWindowTargets:(AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowTargets"
                   outputClass:[AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult class]];
}

- (void)describeMaintenanceWindowTargets:(AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeMaintenanceWindowTargetsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult *> *)describeMaintenanceWindowTasks:(AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowTasks"
                   outputClass:[AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult class]];
}

- (void)describeMaintenanceWindowTasks:(AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeMaintenanceWindowTasksResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult *> *)describeMaintenanceWindows:(AWSSimpleSystemsManagerDescribeMaintenanceWindowsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindows"
                   outputClass:[AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult class]];
}

- (void)describeMaintenanceWindows:(AWSSimpleSystemsManagerDescribeMaintenanceWindowsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindows:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeMaintenanceWindowsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult *> *)describeMaintenanceWindowsForTarget:(AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowsForTarget"
                   outputClass:[AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult class]];
}

- (void)describeMaintenanceWindowsForTarget:(AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowsForTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeMaintenanceWindowsForTargetResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeOpsItemsResponse *> *)describeOpsItems:(AWSSimpleSystemsManagerDescribeOpsItemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeOpsItems"
                   outputClass:[AWSSimpleSystemsManagerDescribeOpsItemsResponse class]];
}

- (void)describeOpsItems:(AWSSimpleSystemsManagerDescribeOpsItemsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeOpsItemsResponse *response, NSError *error))completionHandler {
    [[self describeOpsItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeOpsItemsResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeOpsItemsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeParametersResult *> *)describeParameters:(AWSSimpleSystemsManagerDescribeParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeParameters"
                   outputClass:[AWSSimpleSystemsManagerDescribeParametersResult class]];
}

- (void)describeParameters:(AWSSimpleSystemsManagerDescribeParametersRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeParametersResult *response, NSError *error))completionHandler {
    [[self describeParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeParametersResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribePatchBaselinesResult *> *)describePatchBaselines:(AWSSimpleSystemsManagerDescribePatchBaselinesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchBaselines"
                   outputClass:[AWSSimpleSystemsManagerDescribePatchBaselinesResult class]];
}

- (void)describePatchBaselines:(AWSSimpleSystemsManagerDescribePatchBaselinesRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribePatchBaselinesResult *response, NSError *error))completionHandler {
    [[self describePatchBaselines:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribePatchBaselinesResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribePatchBaselinesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribePatchGroupStateResult *> *)describePatchGroupState:(AWSSimpleSystemsManagerDescribePatchGroupStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchGroupState"
                   outputClass:[AWSSimpleSystemsManagerDescribePatchGroupStateResult class]];
}

- (void)describePatchGroupState:(AWSSimpleSystemsManagerDescribePatchGroupStateRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribePatchGroupStateResult *response, NSError *error))completionHandler {
    [[self describePatchGroupState:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribePatchGroupStateResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribePatchGroupStateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribePatchGroupsResult *> *)describePatchGroups:(AWSSimpleSystemsManagerDescribePatchGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchGroups"
                   outputClass:[AWSSimpleSystemsManagerDescribePatchGroupsResult class]];
}

- (void)describePatchGroups:(AWSSimpleSystemsManagerDescribePatchGroupsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribePatchGroupsResult *response, NSError *error))completionHandler {
    [[self describePatchGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribePatchGroupsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribePatchGroupsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribePatchPropertiesResult *> *)describePatchProperties:(AWSSimpleSystemsManagerDescribePatchPropertiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchProperties"
                   outputClass:[AWSSimpleSystemsManagerDescribePatchPropertiesResult class]];
}

- (void)describePatchProperties:(AWSSimpleSystemsManagerDescribePatchPropertiesRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribePatchPropertiesResult *response, NSError *error))completionHandler {
    [[self describePatchProperties:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribePatchPropertiesResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribePatchPropertiesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerDescribeSessionsResponse *> *)describeSessions:(AWSSimpleSystemsManagerDescribeSessionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeSessions"
                   outputClass:[AWSSimpleSystemsManagerDescribeSessionsResponse class]];
}

- (void)describeSessions:(AWSSimpleSystemsManagerDescribeSessionsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerDescribeSessionsResponse *response, NSError *error))completionHandler {
    [[self describeSessions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerDescribeSessionsResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerDescribeSessionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetAutomationExecutionResult *> *)getAutomationExecution:(AWSSimpleSystemsManagerGetAutomationExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetAutomationExecution"
                   outputClass:[AWSSimpleSystemsManagerGetAutomationExecutionResult class]];
}

- (void)getAutomationExecution:(AWSSimpleSystemsManagerGetAutomationExecutionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetAutomationExecutionResult *response, NSError *error))completionHandler {
    [[self getAutomationExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetAutomationExecutionResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetAutomationExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetCalendarStateResponse *> *)getCalendarState:(AWSSimpleSystemsManagerGetCalendarStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetCalendarState"
                   outputClass:[AWSSimpleSystemsManagerGetCalendarStateResponse class]];
}

- (void)getCalendarState:(AWSSimpleSystemsManagerGetCalendarStateRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetCalendarStateResponse *response, NSError *error))completionHandler {
    [[self getCalendarState:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetCalendarStateResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetCalendarStateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetCommandInvocationResult *> *)getCommandInvocation:(AWSSimpleSystemsManagerGetCommandInvocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetCommandInvocation"
                   outputClass:[AWSSimpleSystemsManagerGetCommandInvocationResult class]];
}

- (void)getCommandInvocation:(AWSSimpleSystemsManagerGetCommandInvocationRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetCommandInvocationResult *response, NSError *error))completionHandler {
    [[self getCommandInvocation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetCommandInvocationResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetCommandInvocationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetConnectionStatusResponse *> *)getConnectionStatus:(AWSSimpleSystemsManagerGetConnectionStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetConnectionStatus"
                   outputClass:[AWSSimpleSystemsManagerGetConnectionStatusResponse class]];
}

- (void)getConnectionStatus:(AWSSimpleSystemsManagerGetConnectionStatusRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetConnectionStatusResponse *response, NSError *error))completionHandler {
    [[self getConnectionStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetConnectionStatusResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetConnectionStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetDefaultPatchBaselineResult *> *)getDefaultPatchBaseline:(AWSSimpleSystemsManagerGetDefaultPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetDefaultPatchBaseline"
                   outputClass:[AWSSimpleSystemsManagerGetDefaultPatchBaselineResult class]];
}

- (void)getDefaultPatchBaseline:(AWSSimpleSystemsManagerGetDefaultPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetDefaultPatchBaselineResult *response, NSError *error))completionHandler {
    [[self getDefaultPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetDefaultPatchBaselineResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetDefaultPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult *> *)getDeployablePatchSnapshotForInstance:(AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetDeployablePatchSnapshotForInstance"
                   outputClass:[AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult class]];
}

- (void)getDeployablePatchSnapshotForInstance:(AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult *response, NSError *error))completionHandler {
    [[self getDeployablePatchSnapshotForInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetDeployablePatchSnapshotForInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetDocumentResult *> *)getDocument:(AWSSimpleSystemsManagerGetDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetDocument"
                   outputClass:[AWSSimpleSystemsManagerGetDocumentResult class]];
}

- (void)getDocument:(AWSSimpleSystemsManagerGetDocumentRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetDocumentResult *response, NSError *error))completionHandler {
    [[self getDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetDocumentResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetInventoryResult *> *)getInventory:(AWSSimpleSystemsManagerGetInventoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetInventory"
                   outputClass:[AWSSimpleSystemsManagerGetInventoryResult class]];
}

- (void)getInventory:(AWSSimpleSystemsManagerGetInventoryRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetInventoryResult *response, NSError *error))completionHandler {
    [[self getInventory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetInventoryResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetInventoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetInventorySchemaResult *> *)getInventorySchema:(AWSSimpleSystemsManagerGetInventorySchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetInventorySchema"
                   outputClass:[AWSSimpleSystemsManagerGetInventorySchemaResult class]];
}

- (void)getInventorySchema:(AWSSimpleSystemsManagerGetInventorySchemaRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetInventorySchemaResult *response, NSError *error))completionHandler {
    [[self getInventorySchema:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetInventorySchemaResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetInventorySchemaResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowResult *> *)getMaintenanceWindow:(AWSSimpleSystemsManagerGetMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindow"
                   outputClass:[AWSSimpleSystemsManagerGetMaintenanceWindowResult class]];
}

- (void)getMaintenanceWindow:(AWSSimpleSystemsManagerGetMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult *> *)getMaintenanceWindowExecution:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowExecution"
                   outputClass:[AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult class]];
}

- (void)getMaintenanceWindowExecution:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetMaintenanceWindowExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult *> *)getMaintenanceWindowExecutionTask:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowExecutionTask"
                   outputClass:[AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult class]];
}

- (void)getMaintenanceWindowExecutionTask:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowExecutionTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult *> *)getMaintenanceWindowExecutionTaskInvocation:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowExecutionTaskInvocation"
                   outputClass:[AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult class]];
}

- (void)getMaintenanceWindowExecutionTaskInvocation:(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowExecutionTaskInvocation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetMaintenanceWindowExecutionTaskInvocationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult *> *)getMaintenanceWindowTask:(AWSSimpleSystemsManagerGetMaintenanceWindowTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowTask"
                   outputClass:[AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult class]];
}

- (void)getMaintenanceWindowTask:(AWSSimpleSystemsManagerGetMaintenanceWindowTaskRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetMaintenanceWindowTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetOpsItemResponse *> *)getOpsItem:(AWSSimpleSystemsManagerGetOpsItemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetOpsItem"
                   outputClass:[AWSSimpleSystemsManagerGetOpsItemResponse class]];
}

- (void)getOpsItem:(AWSSimpleSystemsManagerGetOpsItemRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetOpsItemResponse *response, NSError *error))completionHandler {
    [[self getOpsItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetOpsItemResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetOpsItemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetOpsSummaryResult *> *)getOpsSummary:(AWSSimpleSystemsManagerGetOpsSummaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetOpsSummary"
                   outputClass:[AWSSimpleSystemsManagerGetOpsSummaryResult class]];
}

- (void)getOpsSummary:(AWSSimpleSystemsManagerGetOpsSummaryRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetOpsSummaryResult *response, NSError *error))completionHandler {
    [[self getOpsSummary:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetOpsSummaryResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetOpsSummaryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetParameterResult *> *)getParameter:(AWSSimpleSystemsManagerGetParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParameter"
                   outputClass:[AWSSimpleSystemsManagerGetParameterResult class]];
}

- (void)getParameter:(AWSSimpleSystemsManagerGetParameterRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetParameterResult *response, NSError *error))completionHandler {
    [[self getParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetParameterResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetParameterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetParameterHistoryResult *> *)getParameterHistory:(AWSSimpleSystemsManagerGetParameterHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParameterHistory"
                   outputClass:[AWSSimpleSystemsManagerGetParameterHistoryResult class]];
}

- (void)getParameterHistory:(AWSSimpleSystemsManagerGetParameterHistoryRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetParameterHistoryResult *response, NSError *error))completionHandler {
    [[self getParameterHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetParameterHistoryResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetParameterHistoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetParametersResult *> *)getParameters:(AWSSimpleSystemsManagerGetParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParameters"
                   outputClass:[AWSSimpleSystemsManagerGetParametersResult class]];
}

- (void)getParameters:(AWSSimpleSystemsManagerGetParametersRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetParametersResult *response, NSError *error))completionHandler {
    [[self getParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetParametersResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetParametersByPathResult *> *)getParametersByPath:(AWSSimpleSystemsManagerGetParametersByPathRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParametersByPath"
                   outputClass:[AWSSimpleSystemsManagerGetParametersByPathResult class]];
}

- (void)getParametersByPath:(AWSSimpleSystemsManagerGetParametersByPathRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetParametersByPathResult *response, NSError *error))completionHandler {
    [[self getParametersByPath:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetParametersByPathResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetParametersByPathResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetPatchBaselineResult *> *)getPatchBaseline:(AWSSimpleSystemsManagerGetPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetPatchBaseline"
                   outputClass:[AWSSimpleSystemsManagerGetPatchBaselineResult class]];
}

- (void)getPatchBaseline:(AWSSimpleSystemsManagerGetPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetPatchBaselineResult *response, NSError *error))completionHandler {
    [[self getPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetPatchBaselineResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult *> *)getPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetPatchBaselineForPatchGroup"
                   outputClass:[AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult class]];
}

- (void)getPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult *response, NSError *error))completionHandler {
    [[self getPatchBaselineForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetPatchBaselineForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerGetServiceSettingResult *> *)getServiceSetting:(AWSSimpleSystemsManagerGetServiceSettingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetServiceSetting"
                   outputClass:[AWSSimpleSystemsManagerGetServiceSettingResult class]];
}

- (void)getServiceSetting:(AWSSimpleSystemsManagerGetServiceSettingRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerGetServiceSettingResult *response, NSError *error))completionHandler {
    [[self getServiceSetting:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerGetServiceSettingResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerGetServiceSettingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerLabelParameterVersionResult *> *)labelParameterVersion:(AWSSimpleSystemsManagerLabelParameterVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"LabelParameterVersion"
                   outputClass:[AWSSimpleSystemsManagerLabelParameterVersionResult class]];
}

- (void)labelParameterVersion:(AWSSimpleSystemsManagerLabelParameterVersionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerLabelParameterVersionResult *response, NSError *error))completionHandler {
    [[self labelParameterVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerLabelParameterVersionResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerLabelParameterVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListAssociationVersionsResult *> *)listAssociationVersions:(AWSSimpleSystemsManagerListAssociationVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListAssociationVersions"
                   outputClass:[AWSSimpleSystemsManagerListAssociationVersionsResult class]];
}

- (void)listAssociationVersions:(AWSSimpleSystemsManagerListAssociationVersionsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListAssociationVersionsResult *response, NSError *error))completionHandler {
    [[self listAssociationVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListAssociationVersionsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListAssociationVersionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListAssociationsResult *> *)listAssociations:(AWSSimpleSystemsManagerListAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListAssociations"
                   outputClass:[AWSSimpleSystemsManagerListAssociationsResult class]];
}

- (void)listAssociations:(AWSSimpleSystemsManagerListAssociationsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListAssociationsResult *response, NSError *error))completionHandler {
    [[self listAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListAssociationsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListCommandInvocationsResult *> *)listCommandInvocations:(AWSSimpleSystemsManagerListCommandInvocationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListCommandInvocations"
                   outputClass:[AWSSimpleSystemsManagerListCommandInvocationsResult class]];
}

- (void)listCommandInvocations:(AWSSimpleSystemsManagerListCommandInvocationsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListCommandInvocationsResult *response, NSError *error))completionHandler {
    [[self listCommandInvocations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListCommandInvocationsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListCommandInvocationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListCommandsResult *> *)listCommands:(AWSSimpleSystemsManagerListCommandsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListCommands"
                   outputClass:[AWSSimpleSystemsManagerListCommandsResult class]];
}

- (void)listCommands:(AWSSimpleSystemsManagerListCommandsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListCommandsResult *response, NSError *error))completionHandler {
    [[self listCommands:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListCommandsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListCommandsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListComplianceItemsResult *> *)listComplianceItems:(AWSSimpleSystemsManagerListComplianceItemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListComplianceItems"
                   outputClass:[AWSSimpleSystemsManagerListComplianceItemsResult class]];
}

- (void)listComplianceItems:(AWSSimpleSystemsManagerListComplianceItemsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListComplianceItemsResult *response, NSError *error))completionHandler {
    [[self listComplianceItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListComplianceItemsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListComplianceItemsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListComplianceSummariesResult *> *)listComplianceSummaries:(AWSSimpleSystemsManagerListComplianceSummariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListComplianceSummaries"
                   outputClass:[AWSSimpleSystemsManagerListComplianceSummariesResult class]];
}

- (void)listComplianceSummaries:(AWSSimpleSystemsManagerListComplianceSummariesRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListComplianceSummariesResult *response, NSError *error))completionHandler {
    [[self listComplianceSummaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListComplianceSummariesResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListComplianceSummariesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListDocumentVersionsResult *> *)listDocumentVersions:(AWSSimpleSystemsManagerListDocumentVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListDocumentVersions"
                   outputClass:[AWSSimpleSystemsManagerListDocumentVersionsResult class]];
}

- (void)listDocumentVersions:(AWSSimpleSystemsManagerListDocumentVersionsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListDocumentVersionsResult *response, NSError *error))completionHandler {
    [[self listDocumentVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListDocumentVersionsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListDocumentVersionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListDocumentsResult *> *)listDocuments:(AWSSimpleSystemsManagerListDocumentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListDocuments"
                   outputClass:[AWSSimpleSystemsManagerListDocumentsResult class]];
}

- (void)listDocuments:(AWSSimpleSystemsManagerListDocumentsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListDocumentsResult *response, NSError *error))completionHandler {
    [[self listDocuments:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListDocumentsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListDocumentsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListInventoryEntriesResult *> *)listInventoryEntries:(AWSSimpleSystemsManagerListInventoryEntriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListInventoryEntries"
                   outputClass:[AWSSimpleSystemsManagerListInventoryEntriesResult class]];
}

- (void)listInventoryEntries:(AWSSimpleSystemsManagerListInventoryEntriesRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListInventoryEntriesResult *response, NSError *error))completionHandler {
    [[self listInventoryEntries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListInventoryEntriesResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListInventoryEntriesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListResourceComplianceSummariesResult *> *)listResourceComplianceSummaries:(AWSSimpleSystemsManagerListResourceComplianceSummariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListResourceComplianceSummaries"
                   outputClass:[AWSSimpleSystemsManagerListResourceComplianceSummariesResult class]];
}

- (void)listResourceComplianceSummaries:(AWSSimpleSystemsManagerListResourceComplianceSummariesRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListResourceComplianceSummariesResult *response, NSError *error))completionHandler {
    [[self listResourceComplianceSummaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListResourceComplianceSummariesResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListResourceComplianceSummariesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListResourceDataSyncResult *> *)listResourceDataSync:(AWSSimpleSystemsManagerListResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListResourceDataSync"
                   outputClass:[AWSSimpleSystemsManagerListResourceDataSyncResult class]];
}

- (void)listResourceDataSync:(AWSSimpleSystemsManagerListResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self listResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListResourceDataSyncResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerListTagsForResourceResult *> *)listTagsForResource:(AWSSimpleSystemsManagerListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSSimpleSystemsManagerListTagsForResourceResult class]];
}

- (void)listTagsForResource:(AWSSimpleSystemsManagerListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerListTagsForResourceResult *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerListTagsForResourceResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerListTagsForResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerModifyDocumentPermissionResponse *> *)modifyDocumentPermission:(AWSSimpleSystemsManagerModifyDocumentPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ModifyDocumentPermission"
                   outputClass:[AWSSimpleSystemsManagerModifyDocumentPermissionResponse class]];
}

- (void)modifyDocumentPermission:(AWSSimpleSystemsManagerModifyDocumentPermissionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerModifyDocumentPermissionResponse *response, NSError *error))completionHandler {
    [[self modifyDocumentPermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerModifyDocumentPermissionResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerModifyDocumentPermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerPutComplianceItemsResult *> *)putComplianceItems:(AWSSimpleSystemsManagerPutComplianceItemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"PutComplianceItems"
                   outputClass:[AWSSimpleSystemsManagerPutComplianceItemsResult class]];
}

- (void)putComplianceItems:(AWSSimpleSystemsManagerPutComplianceItemsRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerPutComplianceItemsResult *response, NSError *error))completionHandler {
    [[self putComplianceItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerPutComplianceItemsResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerPutComplianceItemsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerPutInventoryResult *> *)putInventory:(AWSSimpleSystemsManagerPutInventoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"PutInventory"
                   outputClass:[AWSSimpleSystemsManagerPutInventoryResult class]];
}

- (void)putInventory:(AWSSimpleSystemsManagerPutInventoryRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerPutInventoryResult *response, NSError *error))completionHandler {
    [[self putInventory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerPutInventoryResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerPutInventoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerPutParameterResult *> *)putParameter:(AWSSimpleSystemsManagerPutParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"PutParameter"
                   outputClass:[AWSSimpleSystemsManagerPutParameterResult class]];
}

- (void)putParameter:(AWSSimpleSystemsManagerPutParameterRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerPutParameterResult *response, NSError *error))completionHandler {
    [[self putParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerPutParameterResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerPutParameterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult *> *)registerDefaultPatchBaseline:(AWSSimpleSystemsManagerRegisterDefaultPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterDefaultPatchBaseline"
                   outputClass:[AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult class]];
}

- (void)registerDefaultPatchBaseline:(AWSSimpleSystemsManagerRegisterDefaultPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult *response, NSError *error))completionHandler {
    [[self registerDefaultPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerRegisterDefaultPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult *> *)registerPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterPatchBaselineForPatchGroup"
                   outputClass:[AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult class]];
}

- (void)registerPatchBaselineForPatchGroup:(AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult *response, NSError *error))completionHandler {
    [[self registerPatchBaselineForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerRegisterPatchBaselineForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult *> *)registerTargetWithMaintenanceWindow:(AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterTargetWithMaintenanceWindow"
                   outputClass:[AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult class]];
}

- (void)registerTargetWithMaintenanceWindow:(AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self registerTargetWithMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerRegisterTargetWithMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult *> *)registerTaskWithMaintenanceWindow:(AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterTaskWithMaintenanceWindow"
                   outputClass:[AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult class]];
}

- (void)registerTaskWithMaintenanceWindow:(AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self registerTaskWithMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerRegisterTaskWithMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerRemoveTagsFromResourceResult *> *)removeTagsFromResource:(AWSSimpleSystemsManagerRemoveTagsFromResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RemoveTagsFromResource"
                   outputClass:[AWSSimpleSystemsManagerRemoveTagsFromResourceResult class]];
}

- (void)removeTagsFromResource:(AWSSimpleSystemsManagerRemoveTagsFromResourceRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerRemoveTagsFromResourceResult *response, NSError *error))completionHandler {
    [[self removeTagsFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerRemoveTagsFromResourceResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerRemoveTagsFromResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerResetServiceSettingResult *> *)resetServiceSetting:(AWSSimpleSystemsManagerResetServiceSettingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ResetServiceSetting"
                   outputClass:[AWSSimpleSystemsManagerResetServiceSettingResult class]];
}

- (void)resetServiceSetting:(AWSSimpleSystemsManagerResetServiceSettingRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerResetServiceSettingResult *response, NSError *error))completionHandler {
    [[self resetServiceSetting:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerResetServiceSettingResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerResetServiceSettingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerResumeSessionResponse *> *)resumeSession:(AWSSimpleSystemsManagerResumeSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ResumeSession"
                   outputClass:[AWSSimpleSystemsManagerResumeSessionResponse class]];
}

- (void)resumeSession:(AWSSimpleSystemsManagerResumeSessionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerResumeSessionResponse *response, NSError *error))completionHandler {
    [[self resumeSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerResumeSessionResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerResumeSessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerSendAutomationSignalResult *> *)sendAutomationSignal:(AWSSimpleSystemsManagerSendAutomationSignalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"SendAutomationSignal"
                   outputClass:[AWSSimpleSystemsManagerSendAutomationSignalResult class]];
}

- (void)sendAutomationSignal:(AWSSimpleSystemsManagerSendAutomationSignalRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerSendAutomationSignalResult *response, NSError *error))completionHandler {
    [[self sendAutomationSignal:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerSendAutomationSignalResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerSendAutomationSignalResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerSendCommandResult *> *)sendCommand:(AWSSimpleSystemsManagerSendCommandRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"SendCommand"
                   outputClass:[AWSSimpleSystemsManagerSendCommandResult class]];
}

- (void)sendCommand:(AWSSimpleSystemsManagerSendCommandRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerSendCommandResult *response, NSError *error))completionHandler {
    [[self sendCommand:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerSendCommandResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerSendCommandResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerStartAssociationsOnceResult *> *)startAssociationsOnce:(AWSSimpleSystemsManagerStartAssociationsOnceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StartAssociationsOnce"
                   outputClass:[AWSSimpleSystemsManagerStartAssociationsOnceResult class]];
}

- (void)startAssociationsOnce:(AWSSimpleSystemsManagerStartAssociationsOnceRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerStartAssociationsOnceResult *response, NSError *error))completionHandler {
    [[self startAssociationsOnce:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerStartAssociationsOnceResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerStartAssociationsOnceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerStartAutomationExecutionResult *> *)startAutomationExecution:(AWSSimpleSystemsManagerStartAutomationExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StartAutomationExecution"
                   outputClass:[AWSSimpleSystemsManagerStartAutomationExecutionResult class]];
}

- (void)startAutomationExecution:(AWSSimpleSystemsManagerStartAutomationExecutionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerStartAutomationExecutionResult *response, NSError *error))completionHandler {
    [[self startAutomationExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerStartAutomationExecutionResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerStartAutomationExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerStartSessionResponse *> *)startSession:(AWSSimpleSystemsManagerStartSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StartSession"
                   outputClass:[AWSSimpleSystemsManagerStartSessionResponse class]];
}

- (void)startSession:(AWSSimpleSystemsManagerStartSessionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerStartSessionResponse *response, NSError *error))completionHandler {
    [[self startSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerStartSessionResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerStartSessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerStopAutomationExecutionResult *> *)stopAutomationExecution:(AWSSimpleSystemsManagerStopAutomationExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StopAutomationExecution"
                   outputClass:[AWSSimpleSystemsManagerStopAutomationExecutionResult class]];
}

- (void)stopAutomationExecution:(AWSSimpleSystemsManagerStopAutomationExecutionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerStopAutomationExecutionResult *response, NSError *error))completionHandler {
    [[self stopAutomationExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerStopAutomationExecutionResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerStopAutomationExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerTerminateSessionResponse *> *)terminateSession:(AWSSimpleSystemsManagerTerminateSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"TerminateSession"
                   outputClass:[AWSSimpleSystemsManagerTerminateSessionResponse class]];
}

- (void)terminateSession:(AWSSimpleSystemsManagerTerminateSessionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerTerminateSessionResponse *response, NSError *error))completionHandler {
    [[self terminateSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerTerminateSessionResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerTerminateSessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateAssociationResult *> *)updateAssociation:(AWSSimpleSystemsManagerUpdateAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateAssociation"
                   outputClass:[AWSSimpleSystemsManagerUpdateAssociationResult class]];
}

- (void)updateAssociation:(AWSSimpleSystemsManagerUpdateAssociationRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateAssociationResult *response, NSError *error))completionHandler {
    [[self updateAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateAssociationResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateAssociationStatusResult *> *)updateAssociationStatus:(AWSSimpleSystemsManagerUpdateAssociationStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateAssociationStatus"
                   outputClass:[AWSSimpleSystemsManagerUpdateAssociationStatusResult class]];
}

- (void)updateAssociationStatus:(AWSSimpleSystemsManagerUpdateAssociationStatusRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateAssociationStatusResult *response, NSError *error))completionHandler {
    [[self updateAssociationStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateAssociationStatusResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateAssociationStatusResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateDocumentResult *> *)updateDocument:(AWSSimpleSystemsManagerUpdateDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateDocument"
                   outputClass:[AWSSimpleSystemsManagerUpdateDocumentResult class]];
}

- (void)updateDocument:(AWSSimpleSystemsManagerUpdateDocumentRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateDocumentResult *response, NSError *error))completionHandler {
    [[self updateDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateDocumentResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult *> *)updateDocumentDefaultVersion:(AWSSimpleSystemsManagerUpdateDocumentDefaultVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateDocumentDefaultVersion"
                   outputClass:[AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult class]];
}

- (void)updateDocumentDefaultVersion:(AWSSimpleSystemsManagerUpdateDocumentDefaultVersionRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult *response, NSError *error))completionHandler {
    [[self updateDocumentDefaultVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateDocumentDefaultVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateMaintenanceWindowResult *> *)updateMaintenanceWindow:(AWSSimpleSystemsManagerUpdateMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateMaintenanceWindow"
                   outputClass:[AWSSimpleSystemsManagerUpdateMaintenanceWindowResult class]];
}

- (void)updateMaintenanceWindow:(AWSSimpleSystemsManagerUpdateMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self updateMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateMaintenanceWindowResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult *> *)updateMaintenanceWindowTarget:(AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateMaintenanceWindowTarget"
                   outputClass:[AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult class]];
}

- (void)updateMaintenanceWindowTarget:(AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult *response, NSError *error))completionHandler {
    [[self updateMaintenanceWindowTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateMaintenanceWindowTargetResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult *> *)updateMaintenanceWindowTask:(AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateMaintenanceWindowTask"
                   outputClass:[AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult class]];
}

- (void)updateMaintenanceWindowTask:(AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult *response, NSError *error))completionHandler {
    [[self updateMaintenanceWindowTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateMaintenanceWindowTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult *> *)updateManagedInstanceRole:(AWSSimpleSystemsManagerUpdateManagedInstanceRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateManagedInstanceRole"
                   outputClass:[AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult class]];
}

- (void)updateManagedInstanceRole:(AWSSimpleSystemsManagerUpdateManagedInstanceRoleRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult *response, NSError *error))completionHandler {
    [[self updateManagedInstanceRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateManagedInstanceRoleResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateOpsItemResponse *> *)updateOpsItem:(AWSSimpleSystemsManagerUpdateOpsItemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateOpsItem"
                   outputClass:[AWSSimpleSystemsManagerUpdateOpsItemResponse class]];
}

- (void)updateOpsItem:(AWSSimpleSystemsManagerUpdateOpsItemRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateOpsItemResponse *response, NSError *error))completionHandler {
    [[self updateOpsItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateOpsItemResponse *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateOpsItemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdatePatchBaselineResult *> *)updatePatchBaseline:(AWSSimpleSystemsManagerUpdatePatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdatePatchBaseline"
                   outputClass:[AWSSimpleSystemsManagerUpdatePatchBaselineResult class]];
}

- (void)updatePatchBaseline:(AWSSimpleSystemsManagerUpdatePatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdatePatchBaselineResult *response, NSError *error))completionHandler {
    [[self updatePatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdatePatchBaselineResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdatePatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateResourceDataSyncResult *> *)updateResourceDataSync:(AWSSimpleSystemsManagerUpdateResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateResourceDataSync"
                   outputClass:[AWSSimpleSystemsManagerUpdateResourceDataSyncResult class]];
}

- (void)updateResourceDataSync:(AWSSimpleSystemsManagerUpdateResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self updateResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateResourceDataSyncResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleSystemsManagerUpdateServiceSettingResult *> *)updateServiceSetting:(AWSSimpleSystemsManagerUpdateServiceSettingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateServiceSetting"
                   outputClass:[AWSSimpleSystemsManagerUpdateServiceSettingResult class]];
}

- (void)updateServiceSetting:(AWSSimpleSystemsManagerUpdateServiceSettingRequest *)request
     completionHandler:(void (^)(AWSSimpleSystemsManagerUpdateServiceSettingResult *response, NSError *error))completionHandler {
    [[self updateServiceSetting:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleSystemsManagerUpdateServiceSettingResult *> * _Nonnull task) {
        AWSSimpleSystemsManagerUpdateServiceSettingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
