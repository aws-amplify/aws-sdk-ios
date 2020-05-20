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

#import "AWSBackupService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSBackupResources.h"

static NSString *const AWSInfoBackup = @"Backup";
NSString *const AWSBackupSDKVersion = @"2.13.3";


@interface AWSBackupResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSBackupResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AlreadyExistsException" : @(AWSBackupErrorAlreadyExists),
                            @"DependencyFailureException" : @(AWSBackupErrorDependencyFailure),
                            @"InvalidParameterValueException" : @(AWSBackupErrorInvalidParameterValue),
                            @"InvalidRequestException" : @(AWSBackupErrorInvalidRequest),
                            @"LimitExceededException" : @(AWSBackupErrorLimitExceeded),
                            @"MissingParameterValueException" : @(AWSBackupErrorMissingParameterValue),
                            @"ResourceNotFoundException" : @(AWSBackupErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSBackupErrorServiceUnavailable),
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
    	NSString *errorTypeString = [[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"];
        NSString *errorTypeHeader = [[errorTypeString componentsSeparatedByString:@":"] firstObject];

        if ([errorTypeString length] > 0 && errorTypeHeader) {
            if (errorCodeDictionary[errorTypeHeader]) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSBackupErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSBackupErrorDomain
                                                 code:AWSBackupErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSBackupErrorDomain
                                     code:AWSBackupErrorUnknown
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

@interface AWSBackupRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSBackupRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSBackup()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSBackup

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSBackupSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSBackup versions need to match. Check your SDK installation. AWSCore: %@ AWSBackup: %@", AWSiOSSDKVersion, AWSBackupSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultBackup {
    static AWSBackup *_defaultBackup = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoBackup];
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
        _defaultBackup = [[AWSBackup alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultBackup;
}

+ (void)registerBackupWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSBackup alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)BackupForKey:(NSString *)key {
    @synchronized(self) {
        AWSBackup *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoBackup
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSBackup registerBackupWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeBackupForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultBackup` or `+ BackupForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceBackup
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceBackup];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSBackupRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSBackupResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSBackupResponseSerializer alloc] initWithJSONDefinition:[[AWSBackupResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSBackupCreateBackupPlanOutput *> *)createBackupPlan:(AWSBackupCreateBackupPlanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/backup/plans/"
                  targetPrefix:@""
                 operationName:@"CreateBackupPlan"
                   outputClass:[AWSBackupCreateBackupPlanOutput class]];
}

- (void)createBackupPlan:(AWSBackupCreateBackupPlanInput *)request
     completionHandler:(void (^)(AWSBackupCreateBackupPlanOutput *response, NSError *error))completionHandler {
    [[self createBackupPlan:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupCreateBackupPlanOutput *> * _Nonnull task) {
        AWSBackupCreateBackupPlanOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupCreateBackupSelectionOutput *> *)createBackupSelection:(AWSBackupCreateBackupSelectionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/backup/plans/{backupPlanId}/selections/"
                  targetPrefix:@""
                 operationName:@"CreateBackupSelection"
                   outputClass:[AWSBackupCreateBackupSelectionOutput class]];
}

- (void)createBackupSelection:(AWSBackupCreateBackupSelectionInput *)request
     completionHandler:(void (^)(AWSBackupCreateBackupSelectionOutput *response, NSError *error))completionHandler {
    [[self createBackupSelection:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupCreateBackupSelectionOutput *> * _Nonnull task) {
        AWSBackupCreateBackupSelectionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupCreateBackupVaultOutput *> *)createBackupVault:(AWSBackupCreateBackupVaultInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/backup-vaults/{backupVaultName}"
                  targetPrefix:@""
                 operationName:@"CreateBackupVault"
                   outputClass:[AWSBackupCreateBackupVaultOutput class]];
}

- (void)createBackupVault:(AWSBackupCreateBackupVaultInput *)request
     completionHandler:(void (^)(AWSBackupCreateBackupVaultOutput *response, NSError *error))completionHandler {
    [[self createBackupVault:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupCreateBackupVaultOutput *> * _Nonnull task) {
        AWSBackupCreateBackupVaultOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupDeleteBackupPlanOutput *> *)deleteBackupPlan:(AWSBackupDeleteBackupPlanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/backup/plans/{backupPlanId}"
                  targetPrefix:@""
                 operationName:@"DeleteBackupPlan"
                   outputClass:[AWSBackupDeleteBackupPlanOutput class]];
}

- (void)deleteBackupPlan:(AWSBackupDeleteBackupPlanInput *)request
     completionHandler:(void (^)(AWSBackupDeleteBackupPlanOutput *response, NSError *error))completionHandler {
    [[self deleteBackupPlan:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupDeleteBackupPlanOutput *> * _Nonnull task) {
        AWSBackupDeleteBackupPlanOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBackupSelection:(AWSBackupDeleteBackupSelectionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/backup/plans/{backupPlanId}/selections/{selectionId}"
                  targetPrefix:@""
                 operationName:@"DeleteBackupSelection"
                   outputClass:nil];
}

- (void)deleteBackupSelection:(AWSBackupDeleteBackupSelectionInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBackupSelection:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBackupVault:(AWSBackupDeleteBackupVaultInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/backup-vaults/{backupVaultName}"
                  targetPrefix:@""
                 operationName:@"DeleteBackupVault"
                   outputClass:nil];
}

- (void)deleteBackupVault:(AWSBackupDeleteBackupVaultInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBackupVault:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBackupVaultAccessPolicy:(AWSBackupDeleteBackupVaultAccessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/backup-vaults/{backupVaultName}/access-policy"
                  targetPrefix:@""
                 operationName:@"DeleteBackupVaultAccessPolicy"
                   outputClass:nil];
}

- (void)deleteBackupVaultAccessPolicy:(AWSBackupDeleteBackupVaultAccessPolicyInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBackupVaultAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteBackupVaultNotifications:(AWSBackupDeleteBackupVaultNotificationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/backup-vaults/{backupVaultName}/notification-configuration"
                  targetPrefix:@""
                 operationName:@"DeleteBackupVaultNotifications"
                   outputClass:nil];
}

- (void)deleteBackupVaultNotifications:(AWSBackupDeleteBackupVaultNotificationsInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteBackupVaultNotifications:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRecoveryPoint:(AWSBackupDeleteRecoveryPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}"
                  targetPrefix:@""
                 operationName:@"DeleteRecoveryPoint"
                   outputClass:nil];
}

- (void)deleteRecoveryPoint:(AWSBackupDeleteRecoveryPointInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRecoveryPoint:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupDescribeBackupJobOutput *> *)describeBackupJob:(AWSBackupDescribeBackupJobInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup-jobs/{backupJobId}"
                  targetPrefix:@""
                 operationName:@"DescribeBackupJob"
                   outputClass:[AWSBackupDescribeBackupJobOutput class]];
}

- (void)describeBackupJob:(AWSBackupDescribeBackupJobInput *)request
     completionHandler:(void (^)(AWSBackupDescribeBackupJobOutput *response, NSError *error))completionHandler {
    [[self describeBackupJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupDescribeBackupJobOutput *> * _Nonnull task) {
        AWSBackupDescribeBackupJobOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupDescribeBackupVaultOutput *> *)describeBackupVault:(AWSBackupDescribeBackupVaultInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup-vaults/{backupVaultName}"
                  targetPrefix:@""
                 operationName:@"DescribeBackupVault"
                   outputClass:[AWSBackupDescribeBackupVaultOutput class]];
}

- (void)describeBackupVault:(AWSBackupDescribeBackupVaultInput *)request
     completionHandler:(void (^)(AWSBackupDescribeBackupVaultOutput *response, NSError *error))completionHandler {
    [[self describeBackupVault:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupDescribeBackupVaultOutput *> * _Nonnull task) {
        AWSBackupDescribeBackupVaultOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupDescribeCopyJobOutput *> *)describeCopyJob:(AWSBackupDescribeCopyJobInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/copy-jobs/{copyJobId}"
                  targetPrefix:@""
                 operationName:@"DescribeCopyJob"
                   outputClass:[AWSBackupDescribeCopyJobOutput class]];
}

- (void)describeCopyJob:(AWSBackupDescribeCopyJobInput *)request
     completionHandler:(void (^)(AWSBackupDescribeCopyJobOutput *response, NSError *error))completionHandler {
    [[self describeCopyJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupDescribeCopyJobOutput *> * _Nonnull task) {
        AWSBackupDescribeCopyJobOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupDescribeProtectedResourceOutput *> *)describeProtectedResource:(AWSBackupDescribeProtectedResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/resources/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"DescribeProtectedResource"
                   outputClass:[AWSBackupDescribeProtectedResourceOutput class]];
}

- (void)describeProtectedResource:(AWSBackupDescribeProtectedResourceInput *)request
     completionHandler:(void (^)(AWSBackupDescribeProtectedResourceOutput *response, NSError *error))completionHandler {
    [[self describeProtectedResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupDescribeProtectedResourceOutput *> * _Nonnull task) {
        AWSBackupDescribeProtectedResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupDescribeRecoveryPointOutput *> *)describeRecoveryPoint:(AWSBackupDescribeRecoveryPointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}"
                  targetPrefix:@""
                 operationName:@"DescribeRecoveryPoint"
                   outputClass:[AWSBackupDescribeRecoveryPointOutput class]];
}

- (void)describeRecoveryPoint:(AWSBackupDescribeRecoveryPointInput *)request
     completionHandler:(void (^)(AWSBackupDescribeRecoveryPointOutput *response, NSError *error))completionHandler {
    [[self describeRecoveryPoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupDescribeRecoveryPointOutput *> * _Nonnull task) {
        AWSBackupDescribeRecoveryPointOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupDescribeRegionSettingsOutput *> *)describeRegionSettings:(AWSBackupDescribeRegionSettingsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/account-settings"
                  targetPrefix:@""
                 operationName:@"DescribeRegionSettings"
                   outputClass:[AWSBackupDescribeRegionSettingsOutput class]];
}

- (void)describeRegionSettings:(AWSBackupDescribeRegionSettingsInput *)request
     completionHandler:(void (^)(AWSBackupDescribeRegionSettingsOutput *response, NSError *error))completionHandler {
    [[self describeRegionSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupDescribeRegionSettingsOutput *> * _Nonnull task) {
        AWSBackupDescribeRegionSettingsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupDescribeRestoreJobOutput *> *)describeRestoreJob:(AWSBackupDescribeRestoreJobInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/restore-jobs/{restoreJobId}"
                  targetPrefix:@""
                 operationName:@"DescribeRestoreJob"
                   outputClass:[AWSBackupDescribeRestoreJobOutput class]];
}

- (void)describeRestoreJob:(AWSBackupDescribeRestoreJobInput *)request
     completionHandler:(void (^)(AWSBackupDescribeRestoreJobOutput *response, NSError *error))completionHandler {
    [[self describeRestoreJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupDescribeRestoreJobOutput *> * _Nonnull task) {
        AWSBackupDescribeRestoreJobOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupExportBackupPlanTemplateOutput *> *)exportBackupPlanTemplate:(AWSBackupExportBackupPlanTemplateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup/plans/{backupPlanId}/toTemplate/"
                  targetPrefix:@""
                 operationName:@"ExportBackupPlanTemplate"
                   outputClass:[AWSBackupExportBackupPlanTemplateOutput class]];
}

- (void)exportBackupPlanTemplate:(AWSBackupExportBackupPlanTemplateInput *)request
     completionHandler:(void (^)(AWSBackupExportBackupPlanTemplateOutput *response, NSError *error))completionHandler {
    [[self exportBackupPlanTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupExportBackupPlanTemplateOutput *> * _Nonnull task) {
        AWSBackupExportBackupPlanTemplateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupGetBackupPlanOutput *> *)getBackupPlan:(AWSBackupGetBackupPlanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup/plans/{backupPlanId}/"
                  targetPrefix:@""
                 operationName:@"GetBackupPlan"
                   outputClass:[AWSBackupGetBackupPlanOutput class]];
}

- (void)getBackupPlan:(AWSBackupGetBackupPlanInput *)request
     completionHandler:(void (^)(AWSBackupGetBackupPlanOutput *response, NSError *error))completionHandler {
    [[self getBackupPlan:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupGetBackupPlanOutput *> * _Nonnull task) {
        AWSBackupGetBackupPlanOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupGetBackupPlanFromJSONOutput *> *)getBackupPlanFromJSON:(AWSBackupGetBackupPlanFromJSONInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/backup/template/json/toPlan"
                  targetPrefix:@""
                 operationName:@"GetBackupPlanFromJSON"
                   outputClass:[AWSBackupGetBackupPlanFromJSONOutput class]];
}

- (void)getBackupPlanFromJSON:(AWSBackupGetBackupPlanFromJSONInput *)request
     completionHandler:(void (^)(AWSBackupGetBackupPlanFromJSONOutput *response, NSError *error))completionHandler {
    [[self getBackupPlanFromJSON:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupGetBackupPlanFromJSONOutput *> * _Nonnull task) {
        AWSBackupGetBackupPlanFromJSONOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupGetBackupPlanFromTemplateOutput *> *)getBackupPlanFromTemplate:(AWSBackupGetBackupPlanFromTemplateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup/template/plans/{templateId}/toPlan"
                  targetPrefix:@""
                 operationName:@"GetBackupPlanFromTemplate"
                   outputClass:[AWSBackupGetBackupPlanFromTemplateOutput class]];
}

- (void)getBackupPlanFromTemplate:(AWSBackupGetBackupPlanFromTemplateInput *)request
     completionHandler:(void (^)(AWSBackupGetBackupPlanFromTemplateOutput *response, NSError *error))completionHandler {
    [[self getBackupPlanFromTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupGetBackupPlanFromTemplateOutput *> * _Nonnull task) {
        AWSBackupGetBackupPlanFromTemplateOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupGetBackupSelectionOutput *> *)getBackupSelection:(AWSBackupGetBackupSelectionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup/plans/{backupPlanId}/selections/{selectionId}"
                  targetPrefix:@""
                 operationName:@"GetBackupSelection"
                   outputClass:[AWSBackupGetBackupSelectionOutput class]];
}

- (void)getBackupSelection:(AWSBackupGetBackupSelectionInput *)request
     completionHandler:(void (^)(AWSBackupGetBackupSelectionOutput *response, NSError *error))completionHandler {
    [[self getBackupSelection:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupGetBackupSelectionOutput *> * _Nonnull task) {
        AWSBackupGetBackupSelectionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupGetBackupVaultAccessPolicyOutput *> *)getBackupVaultAccessPolicy:(AWSBackupGetBackupVaultAccessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup-vaults/{backupVaultName}/access-policy"
                  targetPrefix:@""
                 operationName:@"GetBackupVaultAccessPolicy"
                   outputClass:[AWSBackupGetBackupVaultAccessPolicyOutput class]];
}

- (void)getBackupVaultAccessPolicy:(AWSBackupGetBackupVaultAccessPolicyInput *)request
     completionHandler:(void (^)(AWSBackupGetBackupVaultAccessPolicyOutput *response, NSError *error))completionHandler {
    [[self getBackupVaultAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupGetBackupVaultAccessPolicyOutput *> * _Nonnull task) {
        AWSBackupGetBackupVaultAccessPolicyOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupGetBackupVaultNotificationsOutput *> *)getBackupVaultNotifications:(AWSBackupGetBackupVaultNotificationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup-vaults/{backupVaultName}/notification-configuration"
                  targetPrefix:@""
                 operationName:@"GetBackupVaultNotifications"
                   outputClass:[AWSBackupGetBackupVaultNotificationsOutput class]];
}

- (void)getBackupVaultNotifications:(AWSBackupGetBackupVaultNotificationsInput *)request
     completionHandler:(void (^)(AWSBackupGetBackupVaultNotificationsOutput *response, NSError *error))completionHandler {
    [[self getBackupVaultNotifications:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupGetBackupVaultNotificationsOutput *> * _Nonnull task) {
        AWSBackupGetBackupVaultNotificationsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupGetRecoveryPointRestoreMetadataOutput *> *)getRecoveryPointRestoreMetadata:(AWSBackupGetRecoveryPointRestoreMetadataInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}/restore-metadata"
                  targetPrefix:@""
                 operationName:@"GetRecoveryPointRestoreMetadata"
                   outputClass:[AWSBackupGetRecoveryPointRestoreMetadataOutput class]];
}

- (void)getRecoveryPointRestoreMetadata:(AWSBackupGetRecoveryPointRestoreMetadataInput *)request
     completionHandler:(void (^)(AWSBackupGetRecoveryPointRestoreMetadataOutput *response, NSError *error))completionHandler {
    [[self getRecoveryPointRestoreMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupGetRecoveryPointRestoreMetadataOutput *> * _Nonnull task) {
        AWSBackupGetRecoveryPointRestoreMetadataOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupGetSupportedResourceTypesOutput *> *)getSupportedResourceTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/supported-resource-types"
                  targetPrefix:@""
                 operationName:@"GetSupportedResourceTypes"
                   outputClass:[AWSBackupGetSupportedResourceTypesOutput class]];
}

- (void)getSupportedResourceTypes:(AWSRequest *)request
     completionHandler:(void (^)(AWSBackupGetSupportedResourceTypesOutput *response, NSError *error))completionHandler {
    [[self getSupportedResourceTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupGetSupportedResourceTypesOutput *> * _Nonnull task) {
        AWSBackupGetSupportedResourceTypesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListBackupJobsOutput *> *)listBackupJobs:(AWSBackupListBackupJobsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup-jobs/"
                  targetPrefix:@""
                 operationName:@"ListBackupJobs"
                   outputClass:[AWSBackupListBackupJobsOutput class]];
}

- (void)listBackupJobs:(AWSBackupListBackupJobsInput *)request
     completionHandler:(void (^)(AWSBackupListBackupJobsOutput *response, NSError *error))completionHandler {
    [[self listBackupJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListBackupJobsOutput *> * _Nonnull task) {
        AWSBackupListBackupJobsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListBackupPlanTemplatesOutput *> *)listBackupPlanTemplates:(AWSBackupListBackupPlanTemplatesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup/template/plans"
                  targetPrefix:@""
                 operationName:@"ListBackupPlanTemplates"
                   outputClass:[AWSBackupListBackupPlanTemplatesOutput class]];
}

- (void)listBackupPlanTemplates:(AWSBackupListBackupPlanTemplatesInput *)request
     completionHandler:(void (^)(AWSBackupListBackupPlanTemplatesOutput *response, NSError *error))completionHandler {
    [[self listBackupPlanTemplates:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListBackupPlanTemplatesOutput *> * _Nonnull task) {
        AWSBackupListBackupPlanTemplatesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListBackupPlanVersionsOutput *> *)listBackupPlanVersions:(AWSBackupListBackupPlanVersionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup/plans/{backupPlanId}/versions/"
                  targetPrefix:@""
                 operationName:@"ListBackupPlanVersions"
                   outputClass:[AWSBackupListBackupPlanVersionsOutput class]];
}

- (void)listBackupPlanVersions:(AWSBackupListBackupPlanVersionsInput *)request
     completionHandler:(void (^)(AWSBackupListBackupPlanVersionsOutput *response, NSError *error))completionHandler {
    [[self listBackupPlanVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListBackupPlanVersionsOutput *> * _Nonnull task) {
        AWSBackupListBackupPlanVersionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListBackupPlansOutput *> *)listBackupPlans:(AWSBackupListBackupPlansInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup/plans/"
                  targetPrefix:@""
                 operationName:@"ListBackupPlans"
                   outputClass:[AWSBackupListBackupPlansOutput class]];
}

- (void)listBackupPlans:(AWSBackupListBackupPlansInput *)request
     completionHandler:(void (^)(AWSBackupListBackupPlansOutput *response, NSError *error))completionHandler {
    [[self listBackupPlans:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListBackupPlansOutput *> * _Nonnull task) {
        AWSBackupListBackupPlansOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListBackupSelectionsOutput *> *)listBackupSelections:(AWSBackupListBackupSelectionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup/plans/{backupPlanId}/selections/"
                  targetPrefix:@""
                 operationName:@"ListBackupSelections"
                   outputClass:[AWSBackupListBackupSelectionsOutput class]];
}

- (void)listBackupSelections:(AWSBackupListBackupSelectionsInput *)request
     completionHandler:(void (^)(AWSBackupListBackupSelectionsOutput *response, NSError *error))completionHandler {
    [[self listBackupSelections:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListBackupSelectionsOutput *> * _Nonnull task) {
        AWSBackupListBackupSelectionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListBackupVaultsOutput *> *)listBackupVaults:(AWSBackupListBackupVaultsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup-vaults/"
                  targetPrefix:@""
                 operationName:@"ListBackupVaults"
                   outputClass:[AWSBackupListBackupVaultsOutput class]];
}

- (void)listBackupVaults:(AWSBackupListBackupVaultsInput *)request
     completionHandler:(void (^)(AWSBackupListBackupVaultsOutput *response, NSError *error))completionHandler {
    [[self listBackupVaults:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListBackupVaultsOutput *> * _Nonnull task) {
        AWSBackupListBackupVaultsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListCopyJobsOutput *> *)listCopyJobs:(AWSBackupListCopyJobsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/copy-jobs/"
                  targetPrefix:@""
                 operationName:@"ListCopyJobs"
                   outputClass:[AWSBackupListCopyJobsOutput class]];
}

- (void)listCopyJobs:(AWSBackupListCopyJobsInput *)request
     completionHandler:(void (^)(AWSBackupListCopyJobsOutput *response, NSError *error))completionHandler {
    [[self listCopyJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListCopyJobsOutput *> * _Nonnull task) {
        AWSBackupListCopyJobsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListProtectedResourcesOutput *> *)listProtectedResources:(AWSBackupListProtectedResourcesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/resources/"
                  targetPrefix:@""
                 operationName:@"ListProtectedResources"
                   outputClass:[AWSBackupListProtectedResourcesOutput class]];
}

- (void)listProtectedResources:(AWSBackupListProtectedResourcesInput *)request
     completionHandler:(void (^)(AWSBackupListProtectedResourcesOutput *response, NSError *error))completionHandler {
    [[self listProtectedResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListProtectedResourcesOutput *> * _Nonnull task) {
        AWSBackupListProtectedResourcesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListRecoveryPointsByBackupVaultOutput *> *)listRecoveryPointsByBackupVault:(AWSBackupListRecoveryPointsByBackupVaultInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/backup-vaults/{backupVaultName}/recovery-points/"
                  targetPrefix:@""
                 operationName:@"ListRecoveryPointsByBackupVault"
                   outputClass:[AWSBackupListRecoveryPointsByBackupVaultOutput class]];
}

- (void)listRecoveryPointsByBackupVault:(AWSBackupListRecoveryPointsByBackupVaultInput *)request
     completionHandler:(void (^)(AWSBackupListRecoveryPointsByBackupVaultOutput *response, NSError *error))completionHandler {
    [[self listRecoveryPointsByBackupVault:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListRecoveryPointsByBackupVaultOutput *> * _Nonnull task) {
        AWSBackupListRecoveryPointsByBackupVaultOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListRecoveryPointsByResourceOutput *> *)listRecoveryPointsByResource:(AWSBackupListRecoveryPointsByResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/resources/{resourceArn}/recovery-points/"
                  targetPrefix:@""
                 operationName:@"ListRecoveryPointsByResource"
                   outputClass:[AWSBackupListRecoveryPointsByResourceOutput class]];
}

- (void)listRecoveryPointsByResource:(AWSBackupListRecoveryPointsByResourceInput *)request
     completionHandler:(void (^)(AWSBackupListRecoveryPointsByResourceOutput *response, NSError *error))completionHandler {
    [[self listRecoveryPointsByResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListRecoveryPointsByResourceOutput *> * _Nonnull task) {
        AWSBackupListRecoveryPointsByResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListRestoreJobsOutput *> *)listRestoreJobs:(AWSBackupListRestoreJobsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/restore-jobs/"
                  targetPrefix:@""
                 operationName:@"ListRestoreJobs"
                   outputClass:[AWSBackupListRestoreJobsOutput class]];
}

- (void)listRestoreJobs:(AWSBackupListRestoreJobsInput *)request
     completionHandler:(void (^)(AWSBackupListRestoreJobsOutput *response, NSError *error))completionHandler {
    [[self listRestoreJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListRestoreJobsOutput *> * _Nonnull task) {
        AWSBackupListRestoreJobsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupListTagsOutput *> *)listTags:(AWSBackupListTagsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}/"
                  targetPrefix:@""
                 operationName:@"ListTags"
                   outputClass:[AWSBackupListTagsOutput class]];
}

- (void)listTags:(AWSBackupListTagsInput *)request
     completionHandler:(void (^)(AWSBackupListTagsOutput *response, NSError *error))completionHandler {
    [[self listTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupListTagsOutput *> * _Nonnull task) {
        AWSBackupListTagsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putBackupVaultAccessPolicy:(AWSBackupPutBackupVaultAccessPolicyInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/backup-vaults/{backupVaultName}/access-policy"
                  targetPrefix:@""
                 operationName:@"PutBackupVaultAccessPolicy"
                   outputClass:nil];
}

- (void)putBackupVaultAccessPolicy:(AWSBackupPutBackupVaultAccessPolicyInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBackupVaultAccessPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putBackupVaultNotifications:(AWSBackupPutBackupVaultNotificationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/backup-vaults/{backupVaultName}/notification-configuration"
                  targetPrefix:@""
                 operationName:@"PutBackupVaultNotifications"
                   outputClass:nil];
}

- (void)putBackupVaultNotifications:(AWSBackupPutBackupVaultNotificationsInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putBackupVaultNotifications:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupStartBackupJobOutput *> *)startBackupJob:(AWSBackupStartBackupJobInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/backup-jobs"
                  targetPrefix:@""
                 operationName:@"StartBackupJob"
                   outputClass:[AWSBackupStartBackupJobOutput class]];
}

- (void)startBackupJob:(AWSBackupStartBackupJobInput *)request
     completionHandler:(void (^)(AWSBackupStartBackupJobOutput *response, NSError *error))completionHandler {
    [[self startBackupJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupStartBackupJobOutput *> * _Nonnull task) {
        AWSBackupStartBackupJobOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupStartCopyJobOutput *> *)startCopyJob:(AWSBackupStartCopyJobInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/copy-jobs"
                  targetPrefix:@""
                 operationName:@"StartCopyJob"
                   outputClass:[AWSBackupStartCopyJobOutput class]];
}

- (void)startCopyJob:(AWSBackupStartCopyJobInput *)request
     completionHandler:(void (^)(AWSBackupStartCopyJobOutput *response, NSError *error))completionHandler {
    [[self startCopyJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupStartCopyJobOutput *> * _Nonnull task) {
        AWSBackupStartCopyJobOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupStartRestoreJobOutput *> *)startRestoreJob:(AWSBackupStartRestoreJobInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/restore-jobs"
                  targetPrefix:@""
                 operationName:@"StartRestoreJob"
                   outputClass:[AWSBackupStartRestoreJobOutput class]];
}

- (void)startRestoreJob:(AWSBackupStartRestoreJobInput *)request
     completionHandler:(void (^)(AWSBackupStartRestoreJobOutput *response, NSError *error))completionHandler {
    [[self startRestoreJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupStartRestoreJobOutput *> * _Nonnull task) {
        AWSBackupStartRestoreJobOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)stopBackupJob:(AWSBackupStopBackupJobInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/backup-jobs/{backupJobId}"
                  targetPrefix:@""
                 operationName:@"StopBackupJob"
                   outputClass:nil];
}

- (void)stopBackupJob:(AWSBackupStopBackupJobInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopBackupJob:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSBackupTagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSBackupTagResourceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSBackupUntagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/untag/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSBackupUntagResourceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupUpdateBackupPlanOutput *> *)updateBackupPlan:(AWSBackupUpdateBackupPlanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/backup/plans/{backupPlanId}"
                  targetPrefix:@""
                 operationName:@"UpdateBackupPlan"
                   outputClass:[AWSBackupUpdateBackupPlanOutput class]];
}

- (void)updateBackupPlan:(AWSBackupUpdateBackupPlanInput *)request
     completionHandler:(void (^)(AWSBackupUpdateBackupPlanOutput *response, NSError *error))completionHandler {
    [[self updateBackupPlan:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupUpdateBackupPlanOutput *> * _Nonnull task) {
        AWSBackupUpdateBackupPlanOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSBackupUpdateRecoveryPointLifecycleOutput *> *)updateRecoveryPointLifecycle:(AWSBackupUpdateRecoveryPointLifecycleInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/backup-vaults/{backupVaultName}/recovery-points/{recoveryPointArn}"
                  targetPrefix:@""
                 operationName:@"UpdateRecoveryPointLifecycle"
                   outputClass:[AWSBackupUpdateRecoveryPointLifecycleOutput class]];
}

- (void)updateRecoveryPointLifecycle:(AWSBackupUpdateRecoveryPointLifecycleInput *)request
     completionHandler:(void (^)(AWSBackupUpdateRecoveryPointLifecycleOutput *response, NSError *error))completionHandler {
    [[self updateRecoveryPointLifecycle:request] continueWithBlock:^id _Nullable(AWSTask<AWSBackupUpdateRecoveryPointLifecycleOutput *> * _Nonnull task) {
        AWSBackupUpdateRecoveryPointLifecycleOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateRegionSettings:(AWSBackupUpdateRegionSettingsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/account-settings"
                  targetPrefix:@""
                 operationName:@"UpdateRegionSettings"
                   outputClass:nil];
}

- (void)updateRegionSettings:(AWSBackupUpdateRegionSettingsInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateRegionSettings:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
