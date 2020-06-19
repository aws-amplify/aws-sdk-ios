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

#import "AWSOpsworkscmService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSOpsworkscmResources.h"

static NSString *const AWSInfoOpsworkscm = @"Opsworkscm";
NSString *const AWSOpsworkscmSDKVersion = @"2.13.4";


@interface AWSOpsworkscmResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSOpsworkscmResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InvalidNextTokenException" : @(AWSOpsworkscmErrorInvalidNextToken),
                            @"InvalidStateException" : @(AWSOpsworkscmErrorInvalidState),
                            @"LimitExceededException" : @(AWSOpsworkscmErrorLimitExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSOpsworkscmErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSOpsworkscmErrorResourceNotFound),
                            @"ValidationException" : @(AWSOpsworkscmErrorValidation),
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
	                *error = [NSError errorWithDomain:AWSOpsworkscmErrorDomain
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
        *error = [NSError errorWithDomain:AWSOpsworkscmErrorDomain
                                     code:AWSOpsworkscmErrorUnknown
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

@interface AWSOpsworkscmRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSOpsworkscmRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSOpsworkscm()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSOpsworkscm

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSOpsworkscmSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSOpsworkscm versions need to match. Check your SDK installation. AWSCore: %@ AWSOpsworkscm: %@", AWSiOSSDKVersion, AWSOpsworkscmSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultOpsworkscm {
    static AWSOpsworkscm *_defaultOpsworkscm = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoOpsworkscm];
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
        _defaultOpsworkscm = [[AWSOpsworkscm alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultOpsworkscm;
}

+ (void)registerOpsworkscmWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSOpsworkscm alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)OpsworkscmForKey:(NSString *)key {
    @synchronized(self) {
        AWSOpsworkscm *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoOpsworkscm
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSOpsworkscm registerOpsworkscmWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeOpsworkscmForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultOpsworkscm` or `+ OpsworkscmForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceOpsworkscm
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceOpsworkscm];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSOpsworkscmRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSOpsworkscmResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSOpsworkscmResponseSerializer alloc] initWithJSONDefinition:[[AWSOpsworkscmResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSOpsworkscmAssociateNodeResponse *> *)associateNode:(AWSOpsworkscmAssociateNodeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"AssociateNode"
                   outputClass:[AWSOpsworkscmAssociateNodeResponse class]];
}

- (void)associateNode:(AWSOpsworkscmAssociateNodeRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmAssociateNodeResponse *response, NSError *error))completionHandler {
    [[self associateNode:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmAssociateNodeResponse *> * _Nonnull task) {
        AWSOpsworkscmAssociateNodeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmCreateBackupResponse *> *)createBackup:(AWSOpsworkscmCreateBackupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"CreateBackup"
                   outputClass:[AWSOpsworkscmCreateBackupResponse class]];
}

- (void)createBackup:(AWSOpsworkscmCreateBackupRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmCreateBackupResponse *response, NSError *error))completionHandler {
    [[self createBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmCreateBackupResponse *> * _Nonnull task) {
        AWSOpsworkscmCreateBackupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmCreateServerResponse *> *)createServer:(AWSOpsworkscmCreateServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"CreateServer"
                   outputClass:[AWSOpsworkscmCreateServerResponse class]];
}

- (void)createServer:(AWSOpsworkscmCreateServerRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmCreateServerResponse *response, NSError *error))completionHandler {
    [[self createServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmCreateServerResponse *> * _Nonnull task) {
        AWSOpsworkscmCreateServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmDeleteBackupResponse *> *)deleteBackup:(AWSOpsworkscmDeleteBackupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DeleteBackup"
                   outputClass:[AWSOpsworkscmDeleteBackupResponse class]];
}

- (void)deleteBackup:(AWSOpsworkscmDeleteBackupRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmDeleteBackupResponse *response, NSError *error))completionHandler {
    [[self deleteBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmDeleteBackupResponse *> * _Nonnull task) {
        AWSOpsworkscmDeleteBackupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmDeleteServerResponse *> *)deleteServer:(AWSOpsworkscmDeleteServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DeleteServer"
                   outputClass:[AWSOpsworkscmDeleteServerResponse class]];
}

- (void)deleteServer:(AWSOpsworkscmDeleteServerRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmDeleteServerResponse *response, NSError *error))completionHandler {
    [[self deleteServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmDeleteServerResponse *> * _Nonnull task) {
        AWSOpsworkscmDeleteServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmDescribeAccountAttributesResponse *> *)describeAccountAttributes:(AWSOpsworkscmDescribeAccountAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSOpsworkscmDescribeAccountAttributesResponse class]];
}

- (void)describeAccountAttributes:(AWSOpsworkscmDescribeAccountAttributesRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmDescribeAccountAttributesResponse *response, NSError *error))completionHandler {
    [[self describeAccountAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmDescribeAccountAttributesResponse *> * _Nonnull task) {
        AWSOpsworkscmDescribeAccountAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmDescribeBackupsResponse *> *)describeBackups:(AWSOpsworkscmDescribeBackupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DescribeBackups"
                   outputClass:[AWSOpsworkscmDescribeBackupsResponse class]];
}

- (void)describeBackups:(AWSOpsworkscmDescribeBackupsRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmDescribeBackupsResponse *response, NSError *error))completionHandler {
    [[self describeBackups:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmDescribeBackupsResponse *> * _Nonnull task) {
        AWSOpsworkscmDescribeBackupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmDescribeEventsResponse *> *)describeEvents:(AWSOpsworkscmDescribeEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DescribeEvents"
                   outputClass:[AWSOpsworkscmDescribeEventsResponse class]];
}

- (void)describeEvents:(AWSOpsworkscmDescribeEventsRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmDescribeEventsResponse *response, NSError *error))completionHandler {
    [[self describeEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmDescribeEventsResponse *> * _Nonnull task) {
        AWSOpsworkscmDescribeEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmDescribeNodeAssociationStatusResponse *> *)describeNodeAssociationStatus:(AWSOpsworkscmDescribeNodeAssociationStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DescribeNodeAssociationStatus"
                   outputClass:[AWSOpsworkscmDescribeNodeAssociationStatusResponse class]];
}

- (void)describeNodeAssociationStatus:(AWSOpsworkscmDescribeNodeAssociationStatusRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmDescribeNodeAssociationStatusResponse *response, NSError *error))completionHandler {
    [[self describeNodeAssociationStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmDescribeNodeAssociationStatusResponse *> * _Nonnull task) {
        AWSOpsworkscmDescribeNodeAssociationStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmDescribeServersResponse *> *)describeServers:(AWSOpsworkscmDescribeServersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DescribeServers"
                   outputClass:[AWSOpsworkscmDescribeServersResponse class]];
}

- (void)describeServers:(AWSOpsworkscmDescribeServersRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmDescribeServersResponse *response, NSError *error))completionHandler {
    [[self describeServers:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmDescribeServersResponse *> * _Nonnull task) {
        AWSOpsworkscmDescribeServersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmDisassociateNodeResponse *> *)disassociateNode:(AWSOpsworkscmDisassociateNodeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DisassociateNode"
                   outputClass:[AWSOpsworkscmDisassociateNodeResponse class]];
}

- (void)disassociateNode:(AWSOpsworkscmDisassociateNodeRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmDisassociateNodeResponse *response, NSError *error))completionHandler {
    [[self disassociateNode:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmDisassociateNodeResponse *> * _Nonnull task) {
        AWSOpsworkscmDisassociateNodeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmExportServerEngineAttributeResponse *> *)exportServerEngineAttribute:(AWSOpsworkscmExportServerEngineAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"ExportServerEngineAttribute"
                   outputClass:[AWSOpsworkscmExportServerEngineAttributeResponse class]];
}

- (void)exportServerEngineAttribute:(AWSOpsworkscmExportServerEngineAttributeRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmExportServerEngineAttributeResponse *response, NSError *error))completionHandler {
    [[self exportServerEngineAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmExportServerEngineAttributeResponse *> * _Nonnull task) {
        AWSOpsworkscmExportServerEngineAttributeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmListTagsForResourceResponse *> *)listTagsForResource:(AWSOpsworkscmListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSOpsworkscmListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSOpsworkscmListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmListTagsForResourceResponse *> * _Nonnull task) {
        AWSOpsworkscmListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmRestoreServerResponse *> *)restoreServer:(AWSOpsworkscmRestoreServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"RestoreServer"
                   outputClass:[AWSOpsworkscmRestoreServerResponse class]];
}

- (void)restoreServer:(AWSOpsworkscmRestoreServerRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmRestoreServerResponse *response, NSError *error))completionHandler {
    [[self restoreServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmRestoreServerResponse *> * _Nonnull task) {
        AWSOpsworkscmRestoreServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmStartMaintenanceResponse *> *)startMaintenance:(AWSOpsworkscmStartMaintenanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"StartMaintenance"
                   outputClass:[AWSOpsworkscmStartMaintenanceResponse class]];
}

- (void)startMaintenance:(AWSOpsworkscmStartMaintenanceRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmStartMaintenanceResponse *response, NSError *error))completionHandler {
    [[self startMaintenance:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmStartMaintenanceResponse *> * _Nonnull task) {
        AWSOpsworkscmStartMaintenanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmTagResourceResponse *> *)tagResource:(AWSOpsworkscmTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"TagResource"
                   outputClass:[AWSOpsworkscmTagResourceResponse class]];
}

- (void)tagResource:(AWSOpsworkscmTagResourceRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmTagResourceResponse *> * _Nonnull task) {
        AWSOpsworkscmTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmUntagResourceResponse *> *)untagResource:(AWSOpsworkscmUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"UntagResource"
                   outputClass:[AWSOpsworkscmUntagResourceResponse class]];
}

- (void)untagResource:(AWSOpsworkscmUntagResourceRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmUntagResourceResponse *> * _Nonnull task) {
        AWSOpsworkscmUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmUpdateServerResponse *> *)updateServer:(AWSOpsworkscmUpdateServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"UpdateServer"
                   outputClass:[AWSOpsworkscmUpdateServerResponse class]];
}

- (void)updateServer:(AWSOpsworkscmUpdateServerRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmUpdateServerResponse *response, NSError *error))completionHandler {
    [[self updateServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmUpdateServerResponse *> * _Nonnull task) {
        AWSOpsworkscmUpdateServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOpsworkscmUpdateServerEngineAttributesResponse *> *)updateServerEngineAttributes:(AWSOpsworkscmUpdateServerEngineAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"UpdateServerEngineAttributes"
                   outputClass:[AWSOpsworkscmUpdateServerEngineAttributesResponse class]];
}

- (void)updateServerEngineAttributes:(AWSOpsworkscmUpdateServerEngineAttributesRequest *)request
     completionHandler:(void (^)(AWSOpsworkscmUpdateServerEngineAttributesResponse *response, NSError *error))completionHandler {
    [[self updateServerEngineAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSOpsworkscmUpdateServerEngineAttributesResponse *> * _Nonnull task) {
        AWSOpsworkscmUpdateServerEngineAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
