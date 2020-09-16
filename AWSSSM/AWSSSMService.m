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

#import "AWSSSMService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSSMResources.h"

static NSString *const AWSInfoSSM = @"SSM";
NSString *const AWSSSMSDKVersion = @"2.16.0";


@interface AWSSSMResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSSMResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AlreadyExistsException" : @(AWSSSMErrorAlreadyExists),
                            @"AssociatedInstances" : @(AWSSSMErrorAssociatedInstances),
                            @"AssociationAlreadyExists" : @(AWSSSMErrorAssociationAlreadyExists),
                            @"AssociationDoesNotExist" : @(AWSSSMErrorAssociationDoesNotExist),
                            @"AssociationExecutionDoesNotExist" : @(AWSSSMErrorAssociationExecutionDoesNotExist),
                            @"AssociationLimitExceeded" : @(AWSSSMErrorAssociationLimitExceeded),
                            @"AssociationVersionLimitExceeded" : @(AWSSSMErrorAssociationVersionLimitExceeded),
                            @"AutomationDefinitionNotFoundException" : @(AWSSSMErrorAutomationDefinitionNotFound),
                            @"AutomationDefinitionVersionNotFoundException" : @(AWSSSMErrorAutomationDefinitionVersionNotFound),
                            @"AutomationExecutionLimitExceededException" : @(AWSSSMErrorAutomationExecutionLimitExceeded),
                            @"AutomationExecutionNotFoundException" : @(AWSSSMErrorAutomationExecutionNotFound),
                            @"AutomationStepNotFoundException" : @(AWSSSMErrorAutomationStepNotFound),
                            @"ComplianceTypeCountLimitExceededException" : @(AWSSSMErrorComplianceTypeCountLimitExceeded),
                            @"CustomSchemaCountLimitExceededException" : @(AWSSSMErrorCustomSchemaCountLimitExceeded),
                            @"DocumentAlreadyExists" : @(AWSSSMErrorDocumentAlreadyExists),
                            @"DocumentLimitExceeded" : @(AWSSSMErrorDocumentLimitExceeded),
                            @"DocumentPermissionLimit" : @(AWSSSMErrorDocumentPermissionLimit),
                            @"DocumentVersionLimitExceeded" : @(AWSSSMErrorDocumentVersionLimitExceeded),
                            @"DoesNotExistException" : @(AWSSSMErrorDoesNotExist),
                            @"DuplicateDocumentContent" : @(AWSSSMErrorDuplicateDocumentContent),
                            @"DuplicateDocumentVersionName" : @(AWSSSMErrorDuplicateDocumentVersionName),
                            @"DuplicateInstanceId" : @(AWSSSMErrorDuplicateInstanceId),
                            @"FeatureNotAvailableException" : @(AWSSSMErrorFeatureNotAvailable),
                            @"HierarchyLevelLimitExceededException" : @(AWSSSMErrorHierarchyLevelLimitExceeded),
                            @"HierarchyTypeMismatchException" : @(AWSSSMErrorHierarchyTypeMismatch),
                            @"IdempotentParameterMismatch" : @(AWSSSMErrorIdempotentParameterMismatch),
                            @"IncompatiblePolicyException" : @(AWSSSMErrorIncompatiblePolicy),
                            @"InternalServerError" : @(AWSSSMErrorInternalServer),
                            @"InvalidActivation" : @(AWSSSMErrorInvalidActivation),
                            @"InvalidActivationId" : @(AWSSSMErrorInvalidActivationId),
                            @"InvalidAggregatorException" : @(AWSSSMErrorInvalidAggregator),
                            @"InvalidAllowedPatternException" : @(AWSSSMErrorInvalidAllowedPattern),
                            @"InvalidAssociation" : @(AWSSSMErrorInvalidAssociation),
                            @"InvalidAssociationVersion" : @(AWSSSMErrorInvalidAssociationVersion),
                            @"InvalidAutomationExecutionParametersException" : @(AWSSSMErrorInvalidAutomationExecutionParameters),
                            @"InvalidAutomationSignalException" : @(AWSSSMErrorInvalidAutomationSignal),
                            @"InvalidAutomationStatusUpdateException" : @(AWSSSMErrorInvalidAutomationStatusUpdate),
                            @"InvalidCommandId" : @(AWSSSMErrorInvalidCommandId),
                            @"InvalidDeleteInventoryParametersException" : @(AWSSSMErrorInvalidDeleteInventoryParameters),
                            @"InvalidDeletionIdException" : @(AWSSSMErrorInvalidDeletionId),
                            @"InvalidDocument" : @(AWSSSMErrorInvalidDocument),
                            @"InvalidDocumentContent" : @(AWSSSMErrorInvalidDocumentContent),
                            @"InvalidDocumentOperation" : @(AWSSSMErrorInvalidDocumentOperation),
                            @"InvalidDocumentSchemaVersion" : @(AWSSSMErrorInvalidDocumentSchemaVersion),
                            @"InvalidDocumentType" : @(AWSSSMErrorInvalidDocumentType),
                            @"InvalidDocumentVersion" : @(AWSSSMErrorInvalidDocumentVersion),
                            @"InvalidFilter" : @(AWSSSMErrorInvalidFilter),
                            @"InvalidFilterKey" : @(AWSSSMErrorInvalidFilterKey),
                            @"InvalidFilterOption" : @(AWSSSMErrorInvalidFilterOption),
                            @"InvalidFilterValue" : @(AWSSSMErrorInvalidFilterValue),
                            @"InvalidInstanceId" : @(AWSSSMErrorInvalidInstanceId),
                            @"InvalidInstanceInformationFilterValue" : @(AWSSSMErrorInvalidInstanceInformationFilterValue),
                            @"InvalidInventoryGroupException" : @(AWSSSMErrorInvalidInventoryGroup),
                            @"InvalidInventoryItemContextException" : @(AWSSSMErrorInvalidInventoryItemContext),
                            @"InvalidInventoryRequestException" : @(AWSSSMErrorInvalidInventoryRequest),
                            @"InvalidItemContentException" : @(AWSSSMErrorInvalidItemContent),
                            @"InvalidKeyId" : @(AWSSSMErrorInvalidKeyId),
                            @"InvalidNextToken" : @(AWSSSMErrorInvalidNextToken),
                            @"InvalidNotificationConfig" : @(AWSSSMErrorInvalidNotificationConfig),
                            @"InvalidOptionException" : @(AWSSSMErrorInvalidOption),
                            @"InvalidOutputFolder" : @(AWSSSMErrorInvalidOutputFolder),
                            @"InvalidOutputLocation" : @(AWSSSMErrorInvalidOutputLocation),
                            @"InvalidParameters" : @(AWSSSMErrorInvalidParameters),
                            @"InvalidPermissionType" : @(AWSSSMErrorInvalidPermissionType),
                            @"InvalidPluginName" : @(AWSSSMErrorInvalidPluginName),
                            @"InvalidPolicyAttributeException" : @(AWSSSMErrorInvalidPolicyAttribute),
                            @"InvalidPolicyTypeException" : @(AWSSSMErrorInvalidPolicyType),
                            @"InvalidResourceId" : @(AWSSSMErrorInvalidResourceId),
                            @"InvalidResourceType" : @(AWSSSMErrorInvalidResourceType),
                            @"InvalidResultAttributeException" : @(AWSSSMErrorInvalidResultAttribute),
                            @"InvalidRole" : @(AWSSSMErrorInvalidRole),
                            @"InvalidSchedule" : @(AWSSSMErrorInvalidSchedule),
                            @"InvalidTarget" : @(AWSSSMErrorInvalidTarget),
                            @"InvalidTypeNameException" : @(AWSSSMErrorInvalidTypeName),
                            @"InvalidUpdate" : @(AWSSSMErrorInvalidUpdate),
                            @"InvocationDoesNotExist" : @(AWSSSMErrorInvocationDoesNotExist),
                            @"ItemContentMismatchException" : @(AWSSSMErrorItemContentMismatch),
                            @"ItemSizeLimitExceededException" : @(AWSSSMErrorItemSizeLimitExceeded),
                            @"MaxDocumentSizeExceeded" : @(AWSSSMErrorMaxDocumentSizeExceeded),
                            @"OpsItemAlreadyExistsException" : @(AWSSSMErrorOpsItemAlreadyExists),
                            @"OpsItemInvalidParameterException" : @(AWSSSMErrorOpsItemInvalidParameter),
                            @"OpsItemLimitExceededException" : @(AWSSSMErrorOpsItemLimitExceeded),
                            @"OpsItemNotFoundException" : @(AWSSSMErrorOpsItemNotFound),
                            @"ParameterAlreadyExists" : @(AWSSSMErrorParameterAlreadyExists),
                            @"ParameterLimitExceeded" : @(AWSSSMErrorParameterLimitExceeded),
                            @"ParameterMaxVersionLimitExceeded" : @(AWSSSMErrorParameterMaxVersionLimitExceeded),
                            @"ParameterNotFound" : @(AWSSSMErrorParameterNotFound),
                            @"ParameterPatternMismatchException" : @(AWSSSMErrorParameterPatternMismatch),
                            @"ParameterVersionLabelLimitExceeded" : @(AWSSSMErrorParameterVersionLabelLimitExceeded),
                            @"ParameterVersionNotFound" : @(AWSSSMErrorParameterVersionNotFound),
                            @"PoliciesLimitExceededException" : @(AWSSSMErrorPoliciesLimitExceeded),
                            @"ResourceDataSyncAlreadyExistsException" : @(AWSSSMErrorResourceDataSyncAlreadyExists),
                            @"ResourceDataSyncConflictException" : @(AWSSSMErrorResourceDataSyncConflict),
                            @"ResourceDataSyncCountExceededException" : @(AWSSSMErrorResourceDataSyncCountExceeded),
                            @"ResourceDataSyncInvalidConfigurationException" : @(AWSSSMErrorResourceDataSyncInvalidConfiguration),
                            @"ResourceDataSyncNotFoundException" : @(AWSSSMErrorResourceDataSyncNotFound),
                            @"ResourceInUseException" : @(AWSSSMErrorResourceInUse),
                            @"ResourceLimitExceededException" : @(AWSSSMErrorResourceLimitExceeded),
                            @"ServiceSettingNotFound" : @(AWSSSMErrorServiceSettingNotFound),
                            @"StatusUnchanged" : @(AWSSSMErrorStatusUnchanged),
                            @"SubTypeCountLimitExceededException" : @(AWSSSMErrorSubTypeCountLimitExceeded),
                            @"TargetInUseException" : @(AWSSSMErrorTargetInUse),
                            @"TargetNotConnected" : @(AWSSSMErrorTargetNotConnected),
                            @"TooManyTagsError" : @(AWSSSMErrorTooManyTags),
                            @"TooManyUpdates" : @(AWSSSMErrorTooManyUpdates),
                            @"TotalSizeLimitExceededException" : @(AWSSSMErrorTotalSizeLimitExceeded),
                            @"UnsupportedCalendarException" : @(AWSSSMErrorUnsupportedCalendar),
                            @"UnsupportedFeatureRequiredException" : @(AWSSSMErrorUnsupportedFeatureRequired),
                            @"UnsupportedInventoryItemContextException" : @(AWSSSMErrorUnsupportedInventoryItemContext),
                            @"UnsupportedInventorySchemaVersionException" : @(AWSSSMErrorUnsupportedInventorySchemaVersion),
                            @"UnsupportedOperatingSystem" : @(AWSSSMErrorUnsupportedOperatingSystem),
                            @"UnsupportedParameterType" : @(AWSSSMErrorUnsupportedParameterType),
                            @"UnsupportedPlatformType" : @(AWSSSMErrorUnsupportedPlatformType),
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
	                *error = [NSError errorWithDomain:AWSSSMErrorDomain
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
        *error = [NSError errorWithDomain:AWSSSMErrorDomain
                                     code:AWSSSMErrorUnknown
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

@interface AWSSSMRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSSMRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSSM()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSSM

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSSMSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSSM versions need to match. Check your SDK installation. AWSCore: %@ AWSSSM: %@", AWSiOSSDKVersion, AWSSSMSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSSM {
    static AWSSSM *_defaultSSM = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSSM];
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
        _defaultSSM = [[AWSSSM alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSSM;
}

+ (void)registerSSMWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSSM alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SSMForKey:(NSString *)key {
    @synchronized(self) {
        AWSSSM *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSSM
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSSM registerSSMWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSSMForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSSM` or `+ SSMForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSSM
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSSM];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSSMRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSSMResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSSMResponseSerializer alloc] initWithJSONDefinition:[[AWSSSMResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSSMAddTagsToResourceResult *> *)addTagsToResource:(AWSSSMAddTagsToResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"AddTagsToResource"
                   outputClass:[AWSSSMAddTagsToResourceResult class]];
}

- (void)addTagsToResource:(AWSSSMAddTagsToResourceRequest *)request
     completionHandler:(void (^)(AWSSSMAddTagsToResourceResult *response, NSError *error))completionHandler {
    [[self addTagsToResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMAddTagsToResourceResult *> * _Nonnull task) {
        AWSSSMAddTagsToResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMCancelCommandResult *> *)cancelCommand:(AWSSSMCancelCommandRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CancelCommand"
                   outputClass:[AWSSSMCancelCommandResult class]];
}

- (void)cancelCommand:(AWSSSMCancelCommandRequest *)request
     completionHandler:(void (^)(AWSSSMCancelCommandResult *response, NSError *error))completionHandler {
    [[self cancelCommand:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMCancelCommandResult *> * _Nonnull task) {
        AWSSSMCancelCommandResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMCancelMaintenanceWindowExecutionResult *> *)cancelMaintenanceWindowExecution:(AWSSSMCancelMaintenanceWindowExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CancelMaintenanceWindowExecution"
                   outputClass:[AWSSSMCancelMaintenanceWindowExecutionResult class]];
}

- (void)cancelMaintenanceWindowExecution:(AWSSSMCancelMaintenanceWindowExecutionRequest *)request
     completionHandler:(void (^)(AWSSSMCancelMaintenanceWindowExecutionResult *response, NSError *error))completionHandler {
    [[self cancelMaintenanceWindowExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMCancelMaintenanceWindowExecutionResult *> * _Nonnull task) {
        AWSSSMCancelMaintenanceWindowExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMCreateActivationResult *> *)createActivation:(AWSSSMCreateActivationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateActivation"
                   outputClass:[AWSSSMCreateActivationResult class]];
}

- (void)createActivation:(AWSSSMCreateActivationRequest *)request
     completionHandler:(void (^)(AWSSSMCreateActivationResult *response, NSError *error))completionHandler {
    [[self createActivation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMCreateActivationResult *> * _Nonnull task) {
        AWSSSMCreateActivationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMCreateAssociationResult *> *)createAssociation:(AWSSSMCreateAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateAssociation"
                   outputClass:[AWSSSMCreateAssociationResult class]];
}

- (void)createAssociation:(AWSSSMCreateAssociationRequest *)request
     completionHandler:(void (^)(AWSSSMCreateAssociationResult *response, NSError *error))completionHandler {
    [[self createAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMCreateAssociationResult *> * _Nonnull task) {
        AWSSSMCreateAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMCreateAssociationBatchResult *> *)createAssociationBatch:(AWSSSMCreateAssociationBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateAssociationBatch"
                   outputClass:[AWSSSMCreateAssociationBatchResult class]];
}

- (void)createAssociationBatch:(AWSSSMCreateAssociationBatchRequest *)request
     completionHandler:(void (^)(AWSSSMCreateAssociationBatchResult *response, NSError *error))completionHandler {
    [[self createAssociationBatch:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMCreateAssociationBatchResult *> * _Nonnull task) {
        AWSSSMCreateAssociationBatchResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMCreateDocumentResult *> *)createDocument:(AWSSSMCreateDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateDocument"
                   outputClass:[AWSSSMCreateDocumentResult class]];
}

- (void)createDocument:(AWSSSMCreateDocumentRequest *)request
     completionHandler:(void (^)(AWSSSMCreateDocumentResult *response, NSError *error))completionHandler {
    [[self createDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMCreateDocumentResult *> * _Nonnull task) {
        AWSSSMCreateDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMCreateMaintenanceWindowResult *> *)createMaintenanceWindow:(AWSSSMCreateMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateMaintenanceWindow"
                   outputClass:[AWSSSMCreateMaintenanceWindowResult class]];
}

- (void)createMaintenanceWindow:(AWSSSMCreateMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSSMCreateMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self createMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMCreateMaintenanceWindowResult *> * _Nonnull task) {
        AWSSSMCreateMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMCreateOpsItemResponse *> *)createOpsItem:(AWSSSMCreateOpsItemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateOpsItem"
                   outputClass:[AWSSSMCreateOpsItemResponse class]];
}

- (void)createOpsItem:(AWSSSMCreateOpsItemRequest *)request
     completionHandler:(void (^)(AWSSSMCreateOpsItemResponse *response, NSError *error))completionHandler {
    [[self createOpsItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMCreateOpsItemResponse *> * _Nonnull task) {
        AWSSSMCreateOpsItemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMCreatePatchBaselineResult *> *)createPatchBaseline:(AWSSSMCreatePatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreatePatchBaseline"
                   outputClass:[AWSSSMCreatePatchBaselineResult class]];
}

- (void)createPatchBaseline:(AWSSSMCreatePatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSSMCreatePatchBaselineResult *response, NSError *error))completionHandler {
    [[self createPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMCreatePatchBaselineResult *> * _Nonnull task) {
        AWSSSMCreatePatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMCreateResourceDataSyncResult *> *)createResourceDataSync:(AWSSSMCreateResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"CreateResourceDataSync"
                   outputClass:[AWSSSMCreateResourceDataSyncResult class]];
}

- (void)createResourceDataSync:(AWSSSMCreateResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSSMCreateResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self createResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMCreateResourceDataSyncResult *> * _Nonnull task) {
        AWSSSMCreateResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeleteActivationResult *> *)deleteActivation:(AWSSSMDeleteActivationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteActivation"
                   outputClass:[AWSSSMDeleteActivationResult class]];
}

- (void)deleteActivation:(AWSSSMDeleteActivationRequest *)request
     completionHandler:(void (^)(AWSSSMDeleteActivationResult *response, NSError *error))completionHandler {
    [[self deleteActivation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeleteActivationResult *> * _Nonnull task) {
        AWSSSMDeleteActivationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeleteAssociationResult *> *)deleteAssociation:(AWSSSMDeleteAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteAssociation"
                   outputClass:[AWSSSMDeleteAssociationResult class]];
}

- (void)deleteAssociation:(AWSSSMDeleteAssociationRequest *)request
     completionHandler:(void (^)(AWSSSMDeleteAssociationResult *response, NSError *error))completionHandler {
    [[self deleteAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeleteAssociationResult *> * _Nonnull task) {
        AWSSSMDeleteAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeleteDocumentResult *> *)deleteDocument:(AWSSSMDeleteDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteDocument"
                   outputClass:[AWSSSMDeleteDocumentResult class]];
}

- (void)deleteDocument:(AWSSSMDeleteDocumentRequest *)request
     completionHandler:(void (^)(AWSSSMDeleteDocumentResult *response, NSError *error))completionHandler {
    [[self deleteDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeleteDocumentResult *> * _Nonnull task) {
        AWSSSMDeleteDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeleteInventoryResult *> *)deleteInventory:(AWSSSMDeleteInventoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteInventory"
                   outputClass:[AWSSSMDeleteInventoryResult class]];
}

- (void)deleteInventory:(AWSSSMDeleteInventoryRequest *)request
     completionHandler:(void (^)(AWSSSMDeleteInventoryResult *response, NSError *error))completionHandler {
    [[self deleteInventory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeleteInventoryResult *> * _Nonnull task) {
        AWSSSMDeleteInventoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeleteMaintenanceWindowResult *> *)deleteMaintenanceWindow:(AWSSSMDeleteMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteMaintenanceWindow"
                   outputClass:[AWSSSMDeleteMaintenanceWindowResult class]];
}

- (void)deleteMaintenanceWindow:(AWSSSMDeleteMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSSMDeleteMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self deleteMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeleteMaintenanceWindowResult *> * _Nonnull task) {
        AWSSSMDeleteMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeleteParameterResult *> *)deleteParameter:(AWSSSMDeleteParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteParameter"
                   outputClass:[AWSSSMDeleteParameterResult class]];
}

- (void)deleteParameter:(AWSSSMDeleteParameterRequest *)request
     completionHandler:(void (^)(AWSSSMDeleteParameterResult *response, NSError *error))completionHandler {
    [[self deleteParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeleteParameterResult *> * _Nonnull task) {
        AWSSSMDeleteParameterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeleteParametersResult *> *)deleteParameters:(AWSSSMDeleteParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteParameters"
                   outputClass:[AWSSSMDeleteParametersResult class]];
}

- (void)deleteParameters:(AWSSSMDeleteParametersRequest *)request
     completionHandler:(void (^)(AWSSSMDeleteParametersResult *response, NSError *error))completionHandler {
    [[self deleteParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeleteParametersResult *> * _Nonnull task) {
        AWSSSMDeleteParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeletePatchBaselineResult *> *)deletePatchBaseline:(AWSSSMDeletePatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeletePatchBaseline"
                   outputClass:[AWSSSMDeletePatchBaselineResult class]];
}

- (void)deletePatchBaseline:(AWSSSMDeletePatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSSMDeletePatchBaselineResult *response, NSError *error))completionHandler {
    [[self deletePatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeletePatchBaselineResult *> * _Nonnull task) {
        AWSSSMDeletePatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeleteResourceDataSyncResult *> *)deleteResourceDataSync:(AWSSSMDeleteResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeleteResourceDataSync"
                   outputClass:[AWSSSMDeleteResourceDataSyncResult class]];
}

- (void)deleteResourceDataSync:(AWSSSMDeleteResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSSMDeleteResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self deleteResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeleteResourceDataSyncResult *> * _Nonnull task) {
        AWSSSMDeleteResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeregisterManagedInstanceResult *> *)deregisterManagedInstance:(AWSSSMDeregisterManagedInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterManagedInstance"
                   outputClass:[AWSSSMDeregisterManagedInstanceResult class]];
}

- (void)deregisterManagedInstance:(AWSSSMDeregisterManagedInstanceRequest *)request
     completionHandler:(void (^)(AWSSSMDeregisterManagedInstanceResult *response, NSError *error))completionHandler {
    [[self deregisterManagedInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeregisterManagedInstanceResult *> * _Nonnull task) {
        AWSSSMDeregisterManagedInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeregisterPatchBaselineForPatchGroupResult *> *)deregisterPatchBaselineForPatchGroup:(AWSSSMDeregisterPatchBaselineForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterPatchBaselineForPatchGroup"
                   outputClass:[AWSSSMDeregisterPatchBaselineForPatchGroupResult class]];
}

- (void)deregisterPatchBaselineForPatchGroup:(AWSSSMDeregisterPatchBaselineForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSSMDeregisterPatchBaselineForPatchGroupResult *response, NSError *error))completionHandler {
    [[self deregisterPatchBaselineForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeregisterPatchBaselineForPatchGroupResult *> * _Nonnull task) {
        AWSSSMDeregisterPatchBaselineForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeregisterTargetFromMaintenanceWindowResult *> *)deregisterTargetFromMaintenanceWindow:(AWSSSMDeregisterTargetFromMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterTargetFromMaintenanceWindow"
                   outputClass:[AWSSSMDeregisterTargetFromMaintenanceWindowResult class]];
}

- (void)deregisterTargetFromMaintenanceWindow:(AWSSSMDeregisterTargetFromMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSSMDeregisterTargetFromMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self deregisterTargetFromMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeregisterTargetFromMaintenanceWindowResult *> * _Nonnull task) {
        AWSSSMDeregisterTargetFromMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDeregisterTaskFromMaintenanceWindowResult *> *)deregisterTaskFromMaintenanceWindow:(AWSSSMDeregisterTaskFromMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DeregisterTaskFromMaintenanceWindow"
                   outputClass:[AWSSSMDeregisterTaskFromMaintenanceWindowResult class]];
}

- (void)deregisterTaskFromMaintenanceWindow:(AWSSSMDeregisterTaskFromMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSSMDeregisterTaskFromMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self deregisterTaskFromMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDeregisterTaskFromMaintenanceWindowResult *> * _Nonnull task) {
        AWSSSMDeregisterTaskFromMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeActivationsResult *> *)describeActivations:(AWSSSMDescribeActivationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeActivations"
                   outputClass:[AWSSSMDescribeActivationsResult class]];
}

- (void)describeActivations:(AWSSSMDescribeActivationsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeActivationsResult *response, NSError *error))completionHandler {
    [[self describeActivations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeActivationsResult *> * _Nonnull task) {
        AWSSSMDescribeActivationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeAssociationResult *> *)describeAssociation:(AWSSSMDescribeAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAssociation"
                   outputClass:[AWSSSMDescribeAssociationResult class]];
}

- (void)describeAssociation:(AWSSSMDescribeAssociationRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeAssociationResult *response, NSError *error))completionHandler {
    [[self describeAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeAssociationResult *> * _Nonnull task) {
        AWSSSMDescribeAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeAssociationExecutionTargetsResult *> *)describeAssociationExecutionTargets:(AWSSSMDescribeAssociationExecutionTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAssociationExecutionTargets"
                   outputClass:[AWSSSMDescribeAssociationExecutionTargetsResult class]];
}

- (void)describeAssociationExecutionTargets:(AWSSSMDescribeAssociationExecutionTargetsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeAssociationExecutionTargetsResult *response, NSError *error))completionHandler {
    [[self describeAssociationExecutionTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeAssociationExecutionTargetsResult *> * _Nonnull task) {
        AWSSSMDescribeAssociationExecutionTargetsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeAssociationExecutionsResult *> *)describeAssociationExecutions:(AWSSSMDescribeAssociationExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAssociationExecutions"
                   outputClass:[AWSSSMDescribeAssociationExecutionsResult class]];
}

- (void)describeAssociationExecutions:(AWSSSMDescribeAssociationExecutionsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeAssociationExecutionsResult *response, NSError *error))completionHandler {
    [[self describeAssociationExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeAssociationExecutionsResult *> * _Nonnull task) {
        AWSSSMDescribeAssociationExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeAutomationExecutionsResult *> *)describeAutomationExecutions:(AWSSSMDescribeAutomationExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAutomationExecutions"
                   outputClass:[AWSSSMDescribeAutomationExecutionsResult class]];
}

- (void)describeAutomationExecutions:(AWSSSMDescribeAutomationExecutionsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeAutomationExecutionsResult *response, NSError *error))completionHandler {
    [[self describeAutomationExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeAutomationExecutionsResult *> * _Nonnull task) {
        AWSSSMDescribeAutomationExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeAutomationStepExecutionsResult *> *)describeAutomationStepExecutions:(AWSSSMDescribeAutomationStepExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAutomationStepExecutions"
                   outputClass:[AWSSSMDescribeAutomationStepExecutionsResult class]];
}

- (void)describeAutomationStepExecutions:(AWSSSMDescribeAutomationStepExecutionsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeAutomationStepExecutionsResult *response, NSError *error))completionHandler {
    [[self describeAutomationStepExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeAutomationStepExecutionsResult *> * _Nonnull task) {
        AWSSSMDescribeAutomationStepExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeAvailablePatchesResult *> *)describeAvailablePatches:(AWSSSMDescribeAvailablePatchesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeAvailablePatches"
                   outputClass:[AWSSSMDescribeAvailablePatchesResult class]];
}

- (void)describeAvailablePatches:(AWSSSMDescribeAvailablePatchesRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeAvailablePatchesResult *response, NSError *error))completionHandler {
    [[self describeAvailablePatches:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeAvailablePatchesResult *> * _Nonnull task) {
        AWSSSMDescribeAvailablePatchesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeDocumentResult *> *)describeDocument:(AWSSSMDescribeDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeDocument"
                   outputClass:[AWSSSMDescribeDocumentResult class]];
}

- (void)describeDocument:(AWSSSMDescribeDocumentRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeDocumentResult *response, NSError *error))completionHandler {
    [[self describeDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeDocumentResult *> * _Nonnull task) {
        AWSSSMDescribeDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeDocumentPermissionResponse *> *)describeDocumentPermission:(AWSSSMDescribeDocumentPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeDocumentPermission"
                   outputClass:[AWSSSMDescribeDocumentPermissionResponse class]];
}

- (void)describeDocumentPermission:(AWSSSMDescribeDocumentPermissionRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeDocumentPermissionResponse *response, NSError *error))completionHandler {
    [[self describeDocumentPermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeDocumentPermissionResponse *> * _Nonnull task) {
        AWSSSMDescribeDocumentPermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeEffectiveInstanceAssociationsResult *> *)describeEffectiveInstanceAssociations:(AWSSSMDescribeEffectiveInstanceAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeEffectiveInstanceAssociations"
                   outputClass:[AWSSSMDescribeEffectiveInstanceAssociationsResult class]];
}

- (void)describeEffectiveInstanceAssociations:(AWSSSMDescribeEffectiveInstanceAssociationsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeEffectiveInstanceAssociationsResult *response, NSError *error))completionHandler {
    [[self describeEffectiveInstanceAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeEffectiveInstanceAssociationsResult *> * _Nonnull task) {
        AWSSSMDescribeEffectiveInstanceAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeEffectivePatchesForPatchBaselineResult *> *)describeEffectivePatchesForPatchBaseline:(AWSSSMDescribeEffectivePatchesForPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeEffectivePatchesForPatchBaseline"
                   outputClass:[AWSSSMDescribeEffectivePatchesForPatchBaselineResult class]];
}

- (void)describeEffectivePatchesForPatchBaseline:(AWSSSMDescribeEffectivePatchesForPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeEffectivePatchesForPatchBaselineResult *response, NSError *error))completionHandler {
    [[self describeEffectivePatchesForPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeEffectivePatchesForPatchBaselineResult *> * _Nonnull task) {
        AWSSSMDescribeEffectivePatchesForPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeInstanceAssociationsStatusResult *> *)describeInstanceAssociationsStatus:(AWSSSMDescribeInstanceAssociationsStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstanceAssociationsStatus"
                   outputClass:[AWSSSMDescribeInstanceAssociationsStatusResult class]];
}

- (void)describeInstanceAssociationsStatus:(AWSSSMDescribeInstanceAssociationsStatusRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeInstanceAssociationsStatusResult *response, NSError *error))completionHandler {
    [[self describeInstanceAssociationsStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeInstanceAssociationsStatusResult *> * _Nonnull task) {
        AWSSSMDescribeInstanceAssociationsStatusResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeInstanceInformationResult *> *)describeInstanceInformation:(AWSSSMDescribeInstanceInformationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstanceInformation"
                   outputClass:[AWSSSMDescribeInstanceInformationResult class]];
}

- (void)describeInstanceInformation:(AWSSSMDescribeInstanceInformationRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeInstanceInformationResult *response, NSError *error))completionHandler {
    [[self describeInstanceInformation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeInstanceInformationResult *> * _Nonnull task) {
        AWSSSMDescribeInstanceInformationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeInstancePatchStatesResult *> *)describeInstancePatchStates:(AWSSSMDescribeInstancePatchStatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstancePatchStates"
                   outputClass:[AWSSSMDescribeInstancePatchStatesResult class]];
}

- (void)describeInstancePatchStates:(AWSSSMDescribeInstancePatchStatesRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeInstancePatchStatesResult *response, NSError *error))completionHandler {
    [[self describeInstancePatchStates:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeInstancePatchStatesResult *> * _Nonnull task) {
        AWSSSMDescribeInstancePatchStatesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeInstancePatchStatesForPatchGroupResult *> *)describeInstancePatchStatesForPatchGroup:(AWSSSMDescribeInstancePatchStatesForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstancePatchStatesForPatchGroup"
                   outputClass:[AWSSSMDescribeInstancePatchStatesForPatchGroupResult class]];
}

- (void)describeInstancePatchStatesForPatchGroup:(AWSSSMDescribeInstancePatchStatesForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeInstancePatchStatesForPatchGroupResult *response, NSError *error))completionHandler {
    [[self describeInstancePatchStatesForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeInstancePatchStatesForPatchGroupResult *> * _Nonnull task) {
        AWSSSMDescribeInstancePatchStatesForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeInstancePatchesResult *> *)describeInstancePatches:(AWSSSMDescribeInstancePatchesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInstancePatches"
                   outputClass:[AWSSSMDescribeInstancePatchesResult class]];
}

- (void)describeInstancePatches:(AWSSSMDescribeInstancePatchesRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeInstancePatchesResult *response, NSError *error))completionHandler {
    [[self describeInstancePatches:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeInstancePatchesResult *> * _Nonnull task) {
        AWSSSMDescribeInstancePatchesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeInventoryDeletionsResult *> *)describeInventoryDeletions:(AWSSSMDescribeInventoryDeletionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeInventoryDeletions"
                   outputClass:[AWSSSMDescribeInventoryDeletionsResult class]];
}

- (void)describeInventoryDeletions:(AWSSSMDescribeInventoryDeletionsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeInventoryDeletionsResult *response, NSError *error))completionHandler {
    [[self describeInventoryDeletions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeInventoryDeletionsResult *> * _Nonnull task) {
        AWSSSMDescribeInventoryDeletionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult *> *)describeMaintenanceWindowExecutionTaskInvocations:(AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowExecutionTaskInvocations"
                   outputClass:[AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult class]];
}

- (void)describeMaintenanceWindowExecutionTaskInvocations:(AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowExecutionTaskInvocations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult *> * _Nonnull task) {
        AWSSSMDescribeMaintenanceWindowExecutionTaskInvocationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeMaintenanceWindowExecutionTasksResult *> *)describeMaintenanceWindowExecutionTasks:(AWSSSMDescribeMaintenanceWindowExecutionTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowExecutionTasks"
                   outputClass:[AWSSSMDescribeMaintenanceWindowExecutionTasksResult class]];
}

- (void)describeMaintenanceWindowExecutionTasks:(AWSSSMDescribeMaintenanceWindowExecutionTasksRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeMaintenanceWindowExecutionTasksResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowExecutionTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeMaintenanceWindowExecutionTasksResult *> * _Nonnull task) {
        AWSSSMDescribeMaintenanceWindowExecutionTasksResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeMaintenanceWindowExecutionsResult *> *)describeMaintenanceWindowExecutions:(AWSSSMDescribeMaintenanceWindowExecutionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowExecutions"
                   outputClass:[AWSSSMDescribeMaintenanceWindowExecutionsResult class]];
}

- (void)describeMaintenanceWindowExecutions:(AWSSSMDescribeMaintenanceWindowExecutionsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeMaintenanceWindowExecutionsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeMaintenanceWindowExecutionsResult *> * _Nonnull task) {
        AWSSSMDescribeMaintenanceWindowExecutionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeMaintenanceWindowScheduleResult *> *)describeMaintenanceWindowSchedule:(AWSSSMDescribeMaintenanceWindowScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowSchedule"
                   outputClass:[AWSSSMDescribeMaintenanceWindowScheduleResult class]];
}

- (void)describeMaintenanceWindowSchedule:(AWSSSMDescribeMaintenanceWindowScheduleRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeMaintenanceWindowScheduleResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeMaintenanceWindowScheduleResult *> * _Nonnull task) {
        AWSSSMDescribeMaintenanceWindowScheduleResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeMaintenanceWindowTargetsResult *> *)describeMaintenanceWindowTargets:(AWSSSMDescribeMaintenanceWindowTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowTargets"
                   outputClass:[AWSSSMDescribeMaintenanceWindowTargetsResult class]];
}

- (void)describeMaintenanceWindowTargets:(AWSSSMDescribeMaintenanceWindowTargetsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeMaintenanceWindowTargetsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeMaintenanceWindowTargetsResult *> * _Nonnull task) {
        AWSSSMDescribeMaintenanceWindowTargetsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeMaintenanceWindowTasksResult *> *)describeMaintenanceWindowTasks:(AWSSSMDescribeMaintenanceWindowTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowTasks"
                   outputClass:[AWSSSMDescribeMaintenanceWindowTasksResult class]];
}

- (void)describeMaintenanceWindowTasks:(AWSSSMDescribeMaintenanceWindowTasksRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeMaintenanceWindowTasksResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeMaintenanceWindowTasksResult *> * _Nonnull task) {
        AWSSSMDescribeMaintenanceWindowTasksResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeMaintenanceWindowsResult *> *)describeMaintenanceWindows:(AWSSSMDescribeMaintenanceWindowsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindows"
                   outputClass:[AWSSSMDescribeMaintenanceWindowsResult class]];
}

- (void)describeMaintenanceWindows:(AWSSSMDescribeMaintenanceWindowsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeMaintenanceWindowsResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindows:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeMaintenanceWindowsResult *> * _Nonnull task) {
        AWSSSMDescribeMaintenanceWindowsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeMaintenanceWindowsForTargetResult *> *)describeMaintenanceWindowsForTarget:(AWSSSMDescribeMaintenanceWindowsForTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeMaintenanceWindowsForTarget"
                   outputClass:[AWSSSMDescribeMaintenanceWindowsForTargetResult class]];
}

- (void)describeMaintenanceWindowsForTarget:(AWSSSMDescribeMaintenanceWindowsForTargetRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeMaintenanceWindowsForTargetResult *response, NSError *error))completionHandler {
    [[self describeMaintenanceWindowsForTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeMaintenanceWindowsForTargetResult *> * _Nonnull task) {
        AWSSSMDescribeMaintenanceWindowsForTargetResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeOpsItemsResponse *> *)describeOpsItems:(AWSSSMDescribeOpsItemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeOpsItems"
                   outputClass:[AWSSSMDescribeOpsItemsResponse class]];
}

- (void)describeOpsItems:(AWSSSMDescribeOpsItemsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeOpsItemsResponse *response, NSError *error))completionHandler {
    [[self describeOpsItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeOpsItemsResponse *> * _Nonnull task) {
        AWSSSMDescribeOpsItemsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeParametersResult *> *)describeParameters:(AWSSSMDescribeParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeParameters"
                   outputClass:[AWSSSMDescribeParametersResult class]];
}

- (void)describeParameters:(AWSSSMDescribeParametersRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeParametersResult *response, NSError *error))completionHandler {
    [[self describeParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeParametersResult *> * _Nonnull task) {
        AWSSSMDescribeParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribePatchBaselinesResult *> *)describePatchBaselines:(AWSSSMDescribePatchBaselinesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchBaselines"
                   outputClass:[AWSSSMDescribePatchBaselinesResult class]];
}

- (void)describePatchBaselines:(AWSSSMDescribePatchBaselinesRequest *)request
     completionHandler:(void (^)(AWSSSMDescribePatchBaselinesResult *response, NSError *error))completionHandler {
    [[self describePatchBaselines:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribePatchBaselinesResult *> * _Nonnull task) {
        AWSSSMDescribePatchBaselinesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribePatchGroupStateResult *> *)describePatchGroupState:(AWSSSMDescribePatchGroupStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchGroupState"
                   outputClass:[AWSSSMDescribePatchGroupStateResult class]];
}

- (void)describePatchGroupState:(AWSSSMDescribePatchGroupStateRequest *)request
     completionHandler:(void (^)(AWSSSMDescribePatchGroupStateResult *response, NSError *error))completionHandler {
    [[self describePatchGroupState:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribePatchGroupStateResult *> * _Nonnull task) {
        AWSSSMDescribePatchGroupStateResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribePatchGroupsResult *> *)describePatchGroups:(AWSSSMDescribePatchGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchGroups"
                   outputClass:[AWSSSMDescribePatchGroupsResult class]];
}

- (void)describePatchGroups:(AWSSSMDescribePatchGroupsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribePatchGroupsResult *response, NSError *error))completionHandler {
    [[self describePatchGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribePatchGroupsResult *> * _Nonnull task) {
        AWSSSMDescribePatchGroupsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribePatchPropertiesResult *> *)describePatchProperties:(AWSSSMDescribePatchPropertiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribePatchProperties"
                   outputClass:[AWSSSMDescribePatchPropertiesResult class]];
}

- (void)describePatchProperties:(AWSSSMDescribePatchPropertiesRequest *)request
     completionHandler:(void (^)(AWSSSMDescribePatchPropertiesResult *response, NSError *error))completionHandler {
    [[self describePatchProperties:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribePatchPropertiesResult *> * _Nonnull task) {
        AWSSSMDescribePatchPropertiesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMDescribeSessionsResponse *> *)describeSessions:(AWSSSMDescribeSessionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"DescribeSessions"
                   outputClass:[AWSSSMDescribeSessionsResponse class]];
}

- (void)describeSessions:(AWSSSMDescribeSessionsRequest *)request
     completionHandler:(void (^)(AWSSSMDescribeSessionsResponse *response, NSError *error))completionHandler {
    [[self describeSessions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMDescribeSessionsResponse *> * _Nonnull task) {
        AWSSSMDescribeSessionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetAutomationExecutionResult *> *)getAutomationExecution:(AWSSSMGetAutomationExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetAutomationExecution"
                   outputClass:[AWSSSMGetAutomationExecutionResult class]];
}

- (void)getAutomationExecution:(AWSSSMGetAutomationExecutionRequest *)request
     completionHandler:(void (^)(AWSSSMGetAutomationExecutionResult *response, NSError *error))completionHandler {
    [[self getAutomationExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetAutomationExecutionResult *> * _Nonnull task) {
        AWSSSMGetAutomationExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetCalendarStateResponse *> *)getCalendarState:(AWSSSMGetCalendarStateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetCalendarState"
                   outputClass:[AWSSSMGetCalendarStateResponse class]];
}

- (void)getCalendarState:(AWSSSMGetCalendarStateRequest *)request
     completionHandler:(void (^)(AWSSSMGetCalendarStateResponse *response, NSError *error))completionHandler {
    [[self getCalendarState:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetCalendarStateResponse *> * _Nonnull task) {
        AWSSSMGetCalendarStateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetCommandInvocationResult *> *)getCommandInvocation:(AWSSSMGetCommandInvocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetCommandInvocation"
                   outputClass:[AWSSSMGetCommandInvocationResult class]];
}

- (void)getCommandInvocation:(AWSSSMGetCommandInvocationRequest *)request
     completionHandler:(void (^)(AWSSSMGetCommandInvocationResult *response, NSError *error))completionHandler {
    [[self getCommandInvocation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetCommandInvocationResult *> * _Nonnull task) {
        AWSSSMGetCommandInvocationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetConnectionStatusResponse *> *)getConnectionStatus:(AWSSSMGetConnectionStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetConnectionStatus"
                   outputClass:[AWSSSMGetConnectionStatusResponse class]];
}

- (void)getConnectionStatus:(AWSSSMGetConnectionStatusRequest *)request
     completionHandler:(void (^)(AWSSSMGetConnectionStatusResponse *response, NSError *error))completionHandler {
    [[self getConnectionStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetConnectionStatusResponse *> * _Nonnull task) {
        AWSSSMGetConnectionStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetDefaultPatchBaselineResult *> *)getDefaultPatchBaseline:(AWSSSMGetDefaultPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetDefaultPatchBaseline"
                   outputClass:[AWSSSMGetDefaultPatchBaselineResult class]];
}

- (void)getDefaultPatchBaseline:(AWSSSMGetDefaultPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSSMGetDefaultPatchBaselineResult *response, NSError *error))completionHandler {
    [[self getDefaultPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetDefaultPatchBaselineResult *> * _Nonnull task) {
        AWSSSMGetDefaultPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetDeployablePatchSnapshotForInstanceResult *> *)getDeployablePatchSnapshotForInstance:(AWSSSMGetDeployablePatchSnapshotForInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetDeployablePatchSnapshotForInstance"
                   outputClass:[AWSSSMGetDeployablePatchSnapshotForInstanceResult class]];
}

- (void)getDeployablePatchSnapshotForInstance:(AWSSSMGetDeployablePatchSnapshotForInstanceRequest *)request
     completionHandler:(void (^)(AWSSSMGetDeployablePatchSnapshotForInstanceResult *response, NSError *error))completionHandler {
    [[self getDeployablePatchSnapshotForInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetDeployablePatchSnapshotForInstanceResult *> * _Nonnull task) {
        AWSSSMGetDeployablePatchSnapshotForInstanceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetDocumentResult *> *)getDocument:(AWSSSMGetDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetDocument"
                   outputClass:[AWSSSMGetDocumentResult class]];
}

- (void)getDocument:(AWSSSMGetDocumentRequest *)request
     completionHandler:(void (^)(AWSSSMGetDocumentResult *response, NSError *error))completionHandler {
    [[self getDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetDocumentResult *> * _Nonnull task) {
        AWSSSMGetDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetInventoryResult *> *)getInventory:(AWSSSMGetInventoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetInventory"
                   outputClass:[AWSSSMGetInventoryResult class]];
}

- (void)getInventory:(AWSSSMGetInventoryRequest *)request
     completionHandler:(void (^)(AWSSSMGetInventoryResult *response, NSError *error))completionHandler {
    [[self getInventory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetInventoryResult *> * _Nonnull task) {
        AWSSSMGetInventoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetInventorySchemaResult *> *)getInventorySchema:(AWSSSMGetInventorySchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetInventorySchema"
                   outputClass:[AWSSSMGetInventorySchemaResult class]];
}

- (void)getInventorySchema:(AWSSSMGetInventorySchemaRequest *)request
     completionHandler:(void (^)(AWSSSMGetInventorySchemaResult *response, NSError *error))completionHandler {
    [[self getInventorySchema:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetInventorySchemaResult *> * _Nonnull task) {
        AWSSSMGetInventorySchemaResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetMaintenanceWindowResult *> *)getMaintenanceWindow:(AWSSSMGetMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindow"
                   outputClass:[AWSSSMGetMaintenanceWindowResult class]];
}

- (void)getMaintenanceWindow:(AWSSSMGetMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSSMGetMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetMaintenanceWindowResult *> * _Nonnull task) {
        AWSSSMGetMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetMaintenanceWindowExecutionResult *> *)getMaintenanceWindowExecution:(AWSSSMGetMaintenanceWindowExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowExecution"
                   outputClass:[AWSSSMGetMaintenanceWindowExecutionResult class]];
}

- (void)getMaintenanceWindowExecution:(AWSSSMGetMaintenanceWindowExecutionRequest *)request
     completionHandler:(void (^)(AWSSSMGetMaintenanceWindowExecutionResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetMaintenanceWindowExecutionResult *> * _Nonnull task) {
        AWSSSMGetMaintenanceWindowExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetMaintenanceWindowExecutionTaskResult *> *)getMaintenanceWindowExecutionTask:(AWSSSMGetMaintenanceWindowExecutionTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowExecutionTask"
                   outputClass:[AWSSSMGetMaintenanceWindowExecutionTaskResult class]];
}

- (void)getMaintenanceWindowExecutionTask:(AWSSSMGetMaintenanceWindowExecutionTaskRequest *)request
     completionHandler:(void (^)(AWSSSMGetMaintenanceWindowExecutionTaskResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowExecutionTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetMaintenanceWindowExecutionTaskResult *> * _Nonnull task) {
        AWSSSMGetMaintenanceWindowExecutionTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult *> *)getMaintenanceWindowExecutionTaskInvocation:(AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowExecutionTaskInvocation"
                   outputClass:[AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult class]];
}

- (void)getMaintenanceWindowExecutionTaskInvocation:(AWSSSMGetMaintenanceWindowExecutionTaskInvocationRequest *)request
     completionHandler:(void (^)(AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowExecutionTaskInvocation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult *> * _Nonnull task) {
        AWSSSMGetMaintenanceWindowExecutionTaskInvocationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetMaintenanceWindowTaskResult *> *)getMaintenanceWindowTask:(AWSSSMGetMaintenanceWindowTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetMaintenanceWindowTask"
                   outputClass:[AWSSSMGetMaintenanceWindowTaskResult class]];
}

- (void)getMaintenanceWindowTask:(AWSSSMGetMaintenanceWindowTaskRequest *)request
     completionHandler:(void (^)(AWSSSMGetMaintenanceWindowTaskResult *response, NSError *error))completionHandler {
    [[self getMaintenanceWindowTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetMaintenanceWindowTaskResult *> * _Nonnull task) {
        AWSSSMGetMaintenanceWindowTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetOpsItemResponse *> *)getOpsItem:(AWSSSMGetOpsItemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetOpsItem"
                   outputClass:[AWSSSMGetOpsItemResponse class]];
}

- (void)getOpsItem:(AWSSSMGetOpsItemRequest *)request
     completionHandler:(void (^)(AWSSSMGetOpsItemResponse *response, NSError *error))completionHandler {
    [[self getOpsItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetOpsItemResponse *> * _Nonnull task) {
        AWSSSMGetOpsItemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetOpsSummaryResult *> *)getOpsSummary:(AWSSSMGetOpsSummaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetOpsSummary"
                   outputClass:[AWSSSMGetOpsSummaryResult class]];
}

- (void)getOpsSummary:(AWSSSMGetOpsSummaryRequest *)request
     completionHandler:(void (^)(AWSSSMGetOpsSummaryResult *response, NSError *error))completionHandler {
    [[self getOpsSummary:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetOpsSummaryResult *> * _Nonnull task) {
        AWSSSMGetOpsSummaryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetParameterResult *> *)getParameter:(AWSSSMGetParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParameter"
                   outputClass:[AWSSSMGetParameterResult class]];
}

- (void)getParameter:(AWSSSMGetParameterRequest *)request
     completionHandler:(void (^)(AWSSSMGetParameterResult *response, NSError *error))completionHandler {
    [[self getParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetParameterResult *> * _Nonnull task) {
        AWSSSMGetParameterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetParameterHistoryResult *> *)getParameterHistory:(AWSSSMGetParameterHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParameterHistory"
                   outputClass:[AWSSSMGetParameterHistoryResult class]];
}

- (void)getParameterHistory:(AWSSSMGetParameterHistoryRequest *)request
     completionHandler:(void (^)(AWSSSMGetParameterHistoryResult *response, NSError *error))completionHandler {
    [[self getParameterHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetParameterHistoryResult *> * _Nonnull task) {
        AWSSSMGetParameterHistoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetParametersResult *> *)getParameters:(AWSSSMGetParametersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParameters"
                   outputClass:[AWSSSMGetParametersResult class]];
}

- (void)getParameters:(AWSSSMGetParametersRequest *)request
     completionHandler:(void (^)(AWSSSMGetParametersResult *response, NSError *error))completionHandler {
    [[self getParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetParametersResult *> * _Nonnull task) {
        AWSSSMGetParametersResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetParametersByPathResult *> *)getParametersByPath:(AWSSSMGetParametersByPathRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetParametersByPath"
                   outputClass:[AWSSSMGetParametersByPathResult class]];
}

- (void)getParametersByPath:(AWSSSMGetParametersByPathRequest *)request
     completionHandler:(void (^)(AWSSSMGetParametersByPathResult *response, NSError *error))completionHandler {
    [[self getParametersByPath:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetParametersByPathResult *> * _Nonnull task) {
        AWSSSMGetParametersByPathResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetPatchBaselineResult *> *)getPatchBaseline:(AWSSSMGetPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetPatchBaseline"
                   outputClass:[AWSSSMGetPatchBaselineResult class]];
}

- (void)getPatchBaseline:(AWSSSMGetPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSSMGetPatchBaselineResult *response, NSError *error))completionHandler {
    [[self getPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetPatchBaselineResult *> * _Nonnull task) {
        AWSSSMGetPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetPatchBaselineForPatchGroupResult *> *)getPatchBaselineForPatchGroup:(AWSSSMGetPatchBaselineForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetPatchBaselineForPatchGroup"
                   outputClass:[AWSSSMGetPatchBaselineForPatchGroupResult class]];
}

- (void)getPatchBaselineForPatchGroup:(AWSSSMGetPatchBaselineForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSSMGetPatchBaselineForPatchGroupResult *response, NSError *error))completionHandler {
    [[self getPatchBaselineForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetPatchBaselineForPatchGroupResult *> * _Nonnull task) {
        AWSSSMGetPatchBaselineForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMGetServiceSettingResult *> *)getServiceSetting:(AWSSSMGetServiceSettingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"GetServiceSetting"
                   outputClass:[AWSSSMGetServiceSettingResult class]];
}

- (void)getServiceSetting:(AWSSSMGetServiceSettingRequest *)request
     completionHandler:(void (^)(AWSSSMGetServiceSettingResult *response, NSError *error))completionHandler {
    [[self getServiceSetting:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMGetServiceSettingResult *> * _Nonnull task) {
        AWSSSMGetServiceSettingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMLabelParameterVersionResult *> *)labelParameterVersion:(AWSSSMLabelParameterVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"LabelParameterVersion"
                   outputClass:[AWSSSMLabelParameterVersionResult class]];
}

- (void)labelParameterVersion:(AWSSSMLabelParameterVersionRequest *)request
     completionHandler:(void (^)(AWSSSMLabelParameterVersionResult *response, NSError *error))completionHandler {
    [[self labelParameterVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMLabelParameterVersionResult *> * _Nonnull task) {
        AWSSSMLabelParameterVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListAssociationVersionsResult *> *)listAssociationVersions:(AWSSSMListAssociationVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListAssociationVersions"
                   outputClass:[AWSSSMListAssociationVersionsResult class]];
}

- (void)listAssociationVersions:(AWSSSMListAssociationVersionsRequest *)request
     completionHandler:(void (^)(AWSSSMListAssociationVersionsResult *response, NSError *error))completionHandler {
    [[self listAssociationVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListAssociationVersionsResult *> * _Nonnull task) {
        AWSSSMListAssociationVersionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListAssociationsResult *> *)listAssociations:(AWSSSMListAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListAssociations"
                   outputClass:[AWSSSMListAssociationsResult class]];
}

- (void)listAssociations:(AWSSSMListAssociationsRequest *)request
     completionHandler:(void (^)(AWSSSMListAssociationsResult *response, NSError *error))completionHandler {
    [[self listAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListAssociationsResult *> * _Nonnull task) {
        AWSSSMListAssociationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListCommandInvocationsResult *> *)listCommandInvocations:(AWSSSMListCommandInvocationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListCommandInvocations"
                   outputClass:[AWSSSMListCommandInvocationsResult class]];
}

- (void)listCommandInvocations:(AWSSSMListCommandInvocationsRequest *)request
     completionHandler:(void (^)(AWSSSMListCommandInvocationsResult *response, NSError *error))completionHandler {
    [[self listCommandInvocations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListCommandInvocationsResult *> * _Nonnull task) {
        AWSSSMListCommandInvocationsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListCommandsResult *> *)listCommands:(AWSSSMListCommandsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListCommands"
                   outputClass:[AWSSSMListCommandsResult class]];
}

- (void)listCommands:(AWSSSMListCommandsRequest *)request
     completionHandler:(void (^)(AWSSSMListCommandsResult *response, NSError *error))completionHandler {
    [[self listCommands:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListCommandsResult *> * _Nonnull task) {
        AWSSSMListCommandsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListComplianceItemsResult *> *)listComplianceItems:(AWSSSMListComplianceItemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListComplianceItems"
                   outputClass:[AWSSSMListComplianceItemsResult class]];
}

- (void)listComplianceItems:(AWSSSMListComplianceItemsRequest *)request
     completionHandler:(void (^)(AWSSSMListComplianceItemsResult *response, NSError *error))completionHandler {
    [[self listComplianceItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListComplianceItemsResult *> * _Nonnull task) {
        AWSSSMListComplianceItemsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListComplianceSummariesResult *> *)listComplianceSummaries:(AWSSSMListComplianceSummariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListComplianceSummaries"
                   outputClass:[AWSSSMListComplianceSummariesResult class]];
}

- (void)listComplianceSummaries:(AWSSSMListComplianceSummariesRequest *)request
     completionHandler:(void (^)(AWSSSMListComplianceSummariesResult *response, NSError *error))completionHandler {
    [[self listComplianceSummaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListComplianceSummariesResult *> * _Nonnull task) {
        AWSSSMListComplianceSummariesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListDocumentVersionsResult *> *)listDocumentVersions:(AWSSSMListDocumentVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListDocumentVersions"
                   outputClass:[AWSSSMListDocumentVersionsResult class]];
}

- (void)listDocumentVersions:(AWSSSMListDocumentVersionsRequest *)request
     completionHandler:(void (^)(AWSSSMListDocumentVersionsResult *response, NSError *error))completionHandler {
    [[self listDocumentVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListDocumentVersionsResult *> * _Nonnull task) {
        AWSSSMListDocumentVersionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListDocumentsResult *> *)listDocuments:(AWSSSMListDocumentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListDocuments"
                   outputClass:[AWSSSMListDocumentsResult class]];
}

- (void)listDocuments:(AWSSSMListDocumentsRequest *)request
     completionHandler:(void (^)(AWSSSMListDocumentsResult *response, NSError *error))completionHandler {
    [[self listDocuments:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListDocumentsResult *> * _Nonnull task) {
        AWSSSMListDocumentsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListInventoryEntriesResult *> *)listInventoryEntries:(AWSSSMListInventoryEntriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListInventoryEntries"
                   outputClass:[AWSSSMListInventoryEntriesResult class]];
}

- (void)listInventoryEntries:(AWSSSMListInventoryEntriesRequest *)request
     completionHandler:(void (^)(AWSSSMListInventoryEntriesResult *response, NSError *error))completionHandler {
    [[self listInventoryEntries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListInventoryEntriesResult *> * _Nonnull task) {
        AWSSSMListInventoryEntriesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListResourceComplianceSummariesResult *> *)listResourceComplianceSummaries:(AWSSSMListResourceComplianceSummariesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListResourceComplianceSummaries"
                   outputClass:[AWSSSMListResourceComplianceSummariesResult class]];
}

- (void)listResourceComplianceSummaries:(AWSSSMListResourceComplianceSummariesRequest *)request
     completionHandler:(void (^)(AWSSSMListResourceComplianceSummariesResult *response, NSError *error))completionHandler {
    [[self listResourceComplianceSummaries:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListResourceComplianceSummariesResult *> * _Nonnull task) {
        AWSSSMListResourceComplianceSummariesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListResourceDataSyncResult *> *)listResourceDataSync:(AWSSSMListResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListResourceDataSync"
                   outputClass:[AWSSSMListResourceDataSyncResult class]];
}

- (void)listResourceDataSync:(AWSSSMListResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSSMListResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self listResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListResourceDataSyncResult *> * _Nonnull task) {
        AWSSSMListResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMListTagsForResourceResult *> *)listTagsForResource:(AWSSSMListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSSSMListTagsForResourceResult class]];
}

- (void)listTagsForResource:(AWSSSMListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSSSMListTagsForResourceResult *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMListTagsForResourceResult *> * _Nonnull task) {
        AWSSSMListTagsForResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMModifyDocumentPermissionResponse *> *)modifyDocumentPermission:(AWSSSMModifyDocumentPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ModifyDocumentPermission"
                   outputClass:[AWSSSMModifyDocumentPermissionResponse class]];
}

- (void)modifyDocumentPermission:(AWSSSMModifyDocumentPermissionRequest *)request
     completionHandler:(void (^)(AWSSSMModifyDocumentPermissionResponse *response, NSError *error))completionHandler {
    [[self modifyDocumentPermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMModifyDocumentPermissionResponse *> * _Nonnull task) {
        AWSSSMModifyDocumentPermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMPutComplianceItemsResult *> *)putComplianceItems:(AWSSSMPutComplianceItemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"PutComplianceItems"
                   outputClass:[AWSSSMPutComplianceItemsResult class]];
}

- (void)putComplianceItems:(AWSSSMPutComplianceItemsRequest *)request
     completionHandler:(void (^)(AWSSSMPutComplianceItemsResult *response, NSError *error))completionHandler {
    [[self putComplianceItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMPutComplianceItemsResult *> * _Nonnull task) {
        AWSSSMPutComplianceItemsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMPutInventoryResult *> *)putInventory:(AWSSSMPutInventoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"PutInventory"
                   outputClass:[AWSSSMPutInventoryResult class]];
}

- (void)putInventory:(AWSSSMPutInventoryRequest *)request
     completionHandler:(void (^)(AWSSSMPutInventoryResult *response, NSError *error))completionHandler {
    [[self putInventory:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMPutInventoryResult *> * _Nonnull task) {
        AWSSSMPutInventoryResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMPutParameterResult *> *)putParameter:(AWSSSMPutParameterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"PutParameter"
                   outputClass:[AWSSSMPutParameterResult class]];
}

- (void)putParameter:(AWSSSMPutParameterRequest *)request
     completionHandler:(void (^)(AWSSSMPutParameterResult *response, NSError *error))completionHandler {
    [[self putParameter:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMPutParameterResult *> * _Nonnull task) {
        AWSSSMPutParameterResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMRegisterDefaultPatchBaselineResult *> *)registerDefaultPatchBaseline:(AWSSSMRegisterDefaultPatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterDefaultPatchBaseline"
                   outputClass:[AWSSSMRegisterDefaultPatchBaselineResult class]];
}

- (void)registerDefaultPatchBaseline:(AWSSSMRegisterDefaultPatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSSMRegisterDefaultPatchBaselineResult *response, NSError *error))completionHandler {
    [[self registerDefaultPatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMRegisterDefaultPatchBaselineResult *> * _Nonnull task) {
        AWSSSMRegisterDefaultPatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMRegisterPatchBaselineForPatchGroupResult *> *)registerPatchBaselineForPatchGroup:(AWSSSMRegisterPatchBaselineForPatchGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterPatchBaselineForPatchGroup"
                   outputClass:[AWSSSMRegisterPatchBaselineForPatchGroupResult class]];
}

- (void)registerPatchBaselineForPatchGroup:(AWSSSMRegisterPatchBaselineForPatchGroupRequest *)request
     completionHandler:(void (^)(AWSSSMRegisterPatchBaselineForPatchGroupResult *response, NSError *error))completionHandler {
    [[self registerPatchBaselineForPatchGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMRegisterPatchBaselineForPatchGroupResult *> * _Nonnull task) {
        AWSSSMRegisterPatchBaselineForPatchGroupResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMRegisterTargetWithMaintenanceWindowResult *> *)registerTargetWithMaintenanceWindow:(AWSSSMRegisterTargetWithMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterTargetWithMaintenanceWindow"
                   outputClass:[AWSSSMRegisterTargetWithMaintenanceWindowResult class]];
}

- (void)registerTargetWithMaintenanceWindow:(AWSSSMRegisterTargetWithMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSSMRegisterTargetWithMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self registerTargetWithMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMRegisterTargetWithMaintenanceWindowResult *> * _Nonnull task) {
        AWSSSMRegisterTargetWithMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMRegisterTaskWithMaintenanceWindowResult *> *)registerTaskWithMaintenanceWindow:(AWSSSMRegisterTaskWithMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RegisterTaskWithMaintenanceWindow"
                   outputClass:[AWSSSMRegisterTaskWithMaintenanceWindowResult class]];
}

- (void)registerTaskWithMaintenanceWindow:(AWSSSMRegisterTaskWithMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSSMRegisterTaskWithMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self registerTaskWithMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMRegisterTaskWithMaintenanceWindowResult *> * _Nonnull task) {
        AWSSSMRegisterTaskWithMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMRemoveTagsFromResourceResult *> *)removeTagsFromResource:(AWSSSMRemoveTagsFromResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"RemoveTagsFromResource"
                   outputClass:[AWSSSMRemoveTagsFromResourceResult class]];
}

- (void)removeTagsFromResource:(AWSSSMRemoveTagsFromResourceRequest *)request
     completionHandler:(void (^)(AWSSSMRemoveTagsFromResourceResult *response, NSError *error))completionHandler {
    [[self removeTagsFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMRemoveTagsFromResourceResult *> * _Nonnull task) {
        AWSSSMRemoveTagsFromResourceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMResetServiceSettingResult *> *)resetServiceSetting:(AWSSSMResetServiceSettingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ResetServiceSetting"
                   outputClass:[AWSSSMResetServiceSettingResult class]];
}

- (void)resetServiceSetting:(AWSSSMResetServiceSettingRequest *)request
     completionHandler:(void (^)(AWSSSMResetServiceSettingResult *response, NSError *error))completionHandler {
    [[self resetServiceSetting:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMResetServiceSettingResult *> * _Nonnull task) {
        AWSSSMResetServiceSettingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMResumeSessionResponse *> *)resumeSession:(AWSSSMResumeSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"ResumeSession"
                   outputClass:[AWSSSMResumeSessionResponse class]];
}

- (void)resumeSession:(AWSSSMResumeSessionRequest *)request
     completionHandler:(void (^)(AWSSSMResumeSessionResponse *response, NSError *error))completionHandler {
    [[self resumeSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMResumeSessionResponse *> * _Nonnull task) {
        AWSSSMResumeSessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMSendAutomationSignalResult *> *)sendAutomationSignal:(AWSSSMSendAutomationSignalRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"SendAutomationSignal"
                   outputClass:[AWSSSMSendAutomationSignalResult class]];
}

- (void)sendAutomationSignal:(AWSSSMSendAutomationSignalRequest *)request
     completionHandler:(void (^)(AWSSSMSendAutomationSignalResult *response, NSError *error))completionHandler {
    [[self sendAutomationSignal:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMSendAutomationSignalResult *> * _Nonnull task) {
        AWSSSMSendAutomationSignalResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMSendCommandResult *> *)sendCommand:(AWSSSMSendCommandRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"SendCommand"
                   outputClass:[AWSSSMSendCommandResult class]];
}

- (void)sendCommand:(AWSSSMSendCommandRequest *)request
     completionHandler:(void (^)(AWSSSMSendCommandResult *response, NSError *error))completionHandler {
    [[self sendCommand:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMSendCommandResult *> * _Nonnull task) {
        AWSSSMSendCommandResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMStartAssociationsOnceResult *> *)startAssociationsOnce:(AWSSSMStartAssociationsOnceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StartAssociationsOnce"
                   outputClass:[AWSSSMStartAssociationsOnceResult class]];
}

- (void)startAssociationsOnce:(AWSSSMStartAssociationsOnceRequest *)request
     completionHandler:(void (^)(AWSSSMStartAssociationsOnceResult *response, NSError *error))completionHandler {
    [[self startAssociationsOnce:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMStartAssociationsOnceResult *> * _Nonnull task) {
        AWSSSMStartAssociationsOnceResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMStartAutomationExecutionResult *> *)startAutomationExecution:(AWSSSMStartAutomationExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StartAutomationExecution"
                   outputClass:[AWSSSMStartAutomationExecutionResult class]];
}

- (void)startAutomationExecution:(AWSSSMStartAutomationExecutionRequest *)request
     completionHandler:(void (^)(AWSSSMStartAutomationExecutionResult *response, NSError *error))completionHandler {
    [[self startAutomationExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMStartAutomationExecutionResult *> * _Nonnull task) {
        AWSSSMStartAutomationExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMStartSessionResponse *> *)startSession:(AWSSSMStartSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StartSession"
                   outputClass:[AWSSSMStartSessionResponse class]];
}

- (void)startSession:(AWSSSMStartSessionRequest *)request
     completionHandler:(void (^)(AWSSSMStartSessionResponse *response, NSError *error))completionHandler {
    [[self startSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMStartSessionResponse *> * _Nonnull task) {
        AWSSSMStartSessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMStopAutomationExecutionResult *> *)stopAutomationExecution:(AWSSSMStopAutomationExecutionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"StopAutomationExecution"
                   outputClass:[AWSSSMStopAutomationExecutionResult class]];
}

- (void)stopAutomationExecution:(AWSSSMStopAutomationExecutionRequest *)request
     completionHandler:(void (^)(AWSSSMStopAutomationExecutionResult *response, NSError *error))completionHandler {
    [[self stopAutomationExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMStopAutomationExecutionResult *> * _Nonnull task) {
        AWSSSMStopAutomationExecutionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMTerminateSessionResponse *> *)terminateSession:(AWSSSMTerminateSessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"TerminateSession"
                   outputClass:[AWSSSMTerminateSessionResponse class]];
}

- (void)terminateSession:(AWSSSMTerminateSessionRequest *)request
     completionHandler:(void (^)(AWSSSMTerminateSessionResponse *response, NSError *error))completionHandler {
    [[self terminateSession:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMTerminateSessionResponse *> * _Nonnull task) {
        AWSSSMTerminateSessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateAssociationResult *> *)updateAssociation:(AWSSSMUpdateAssociationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateAssociation"
                   outputClass:[AWSSSMUpdateAssociationResult class]];
}

- (void)updateAssociation:(AWSSSMUpdateAssociationRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateAssociationResult *response, NSError *error))completionHandler {
    [[self updateAssociation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateAssociationResult *> * _Nonnull task) {
        AWSSSMUpdateAssociationResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateAssociationStatusResult *> *)updateAssociationStatus:(AWSSSMUpdateAssociationStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateAssociationStatus"
                   outputClass:[AWSSSMUpdateAssociationStatusResult class]];
}

- (void)updateAssociationStatus:(AWSSSMUpdateAssociationStatusRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateAssociationStatusResult *response, NSError *error))completionHandler {
    [[self updateAssociationStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateAssociationStatusResult *> * _Nonnull task) {
        AWSSSMUpdateAssociationStatusResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateDocumentResult *> *)updateDocument:(AWSSSMUpdateDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateDocument"
                   outputClass:[AWSSSMUpdateDocumentResult class]];
}

- (void)updateDocument:(AWSSSMUpdateDocumentRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateDocumentResult *response, NSError *error))completionHandler {
    [[self updateDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateDocumentResult *> * _Nonnull task) {
        AWSSSMUpdateDocumentResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateDocumentDefaultVersionResult *> *)updateDocumentDefaultVersion:(AWSSSMUpdateDocumentDefaultVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateDocumentDefaultVersion"
                   outputClass:[AWSSSMUpdateDocumentDefaultVersionResult class]];
}

- (void)updateDocumentDefaultVersion:(AWSSSMUpdateDocumentDefaultVersionRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateDocumentDefaultVersionResult *response, NSError *error))completionHandler {
    [[self updateDocumentDefaultVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateDocumentDefaultVersionResult *> * _Nonnull task) {
        AWSSSMUpdateDocumentDefaultVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateMaintenanceWindowResult *> *)updateMaintenanceWindow:(AWSSSMUpdateMaintenanceWindowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateMaintenanceWindow"
                   outputClass:[AWSSSMUpdateMaintenanceWindowResult class]];
}

- (void)updateMaintenanceWindow:(AWSSSMUpdateMaintenanceWindowRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateMaintenanceWindowResult *response, NSError *error))completionHandler {
    [[self updateMaintenanceWindow:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateMaintenanceWindowResult *> * _Nonnull task) {
        AWSSSMUpdateMaintenanceWindowResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateMaintenanceWindowTargetResult *> *)updateMaintenanceWindowTarget:(AWSSSMUpdateMaintenanceWindowTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateMaintenanceWindowTarget"
                   outputClass:[AWSSSMUpdateMaintenanceWindowTargetResult class]];
}

- (void)updateMaintenanceWindowTarget:(AWSSSMUpdateMaintenanceWindowTargetRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateMaintenanceWindowTargetResult *response, NSError *error))completionHandler {
    [[self updateMaintenanceWindowTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateMaintenanceWindowTargetResult *> * _Nonnull task) {
        AWSSSMUpdateMaintenanceWindowTargetResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateMaintenanceWindowTaskResult *> *)updateMaintenanceWindowTask:(AWSSSMUpdateMaintenanceWindowTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateMaintenanceWindowTask"
                   outputClass:[AWSSSMUpdateMaintenanceWindowTaskResult class]];
}

- (void)updateMaintenanceWindowTask:(AWSSSMUpdateMaintenanceWindowTaskRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateMaintenanceWindowTaskResult *response, NSError *error))completionHandler {
    [[self updateMaintenanceWindowTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateMaintenanceWindowTaskResult *> * _Nonnull task) {
        AWSSSMUpdateMaintenanceWindowTaskResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateManagedInstanceRoleResult *> *)updateManagedInstanceRole:(AWSSSMUpdateManagedInstanceRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateManagedInstanceRole"
                   outputClass:[AWSSSMUpdateManagedInstanceRoleResult class]];
}

- (void)updateManagedInstanceRole:(AWSSSMUpdateManagedInstanceRoleRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateManagedInstanceRoleResult *response, NSError *error))completionHandler {
    [[self updateManagedInstanceRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateManagedInstanceRoleResult *> * _Nonnull task) {
        AWSSSMUpdateManagedInstanceRoleResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateOpsItemResponse *> *)updateOpsItem:(AWSSSMUpdateOpsItemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateOpsItem"
                   outputClass:[AWSSSMUpdateOpsItemResponse class]];
}

- (void)updateOpsItem:(AWSSSMUpdateOpsItemRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateOpsItemResponse *response, NSError *error))completionHandler {
    [[self updateOpsItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateOpsItemResponse *> * _Nonnull task) {
        AWSSSMUpdateOpsItemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdatePatchBaselineResult *> *)updatePatchBaseline:(AWSSSMUpdatePatchBaselineRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdatePatchBaseline"
                   outputClass:[AWSSSMUpdatePatchBaselineResult class]];
}

- (void)updatePatchBaseline:(AWSSSMUpdatePatchBaselineRequest *)request
     completionHandler:(void (^)(AWSSSMUpdatePatchBaselineResult *response, NSError *error))completionHandler {
    [[self updatePatchBaseline:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdatePatchBaselineResult *> * _Nonnull task) {
        AWSSSMUpdatePatchBaselineResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateResourceDataSyncResult *> *)updateResourceDataSync:(AWSSSMUpdateResourceDataSyncRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateResourceDataSync"
                   outputClass:[AWSSSMUpdateResourceDataSyncResult class]];
}

- (void)updateResourceDataSync:(AWSSSMUpdateResourceDataSyncRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateResourceDataSyncResult *response, NSError *error))completionHandler {
    [[self updateResourceDataSync:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateResourceDataSyncResult *> * _Nonnull task) {
        AWSSSMUpdateResourceDataSyncResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSSMUpdateServiceSettingResult *> *)updateServiceSetting:(AWSSSMUpdateServiceSettingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonSSM"
                 operationName:@"UpdateServiceSetting"
                   outputClass:[AWSSSMUpdateServiceSettingResult class]];
}

- (void)updateServiceSetting:(AWSSSMUpdateServiceSettingRequest *)request
     completionHandler:(void (^)(AWSSSMUpdateServiceSettingResult *response, NSError *error))completionHandler {
    [[self updateServiceSetting:request] continueWithBlock:^id _Nullable(AWSTask<AWSSSMUpdateServiceSettingResult *> * _Nonnull task) {
        AWSSSMUpdateServiceSettingResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
