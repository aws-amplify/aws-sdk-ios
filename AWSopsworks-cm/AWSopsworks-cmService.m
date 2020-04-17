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

#import "AWSopsworks-cmService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSopsworks-cmResources.h"

static NSString *const AWSInfoopsworks-cm = @"opsworks-cm";
NSString *const AWSopsworks-cmSDKVersion = @"2.13.2";


@interface AWSopsworks-cmResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSopsworks-cmResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InvalidNextTokenException" : @(AWSopsworks-cmErrorInvalidNextToken),
                            @"InvalidStateException" : @(AWSopsworks-cmErrorInvalidState),
                            @"LimitExceededException" : @(AWSopsworks-cmErrorLimitExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSopsworks-cmErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSopsworks-cmErrorResourceNotFound),
                            @"ValidationException" : @(AWSopsworks-cmErrorValidation),
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
	                *error = [NSError errorWithDomain:AWSopsworks-cmErrorDomain
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
        *error = [NSError errorWithDomain:AWSopsworks-cmErrorDomain
                                     code:AWSopsworks-cmErrorUnknown
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

@interface AWSopsworks-cmRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSopsworks-cmRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSopsworks-cm()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSopsworks-cm

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSopsworks-cmSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSopsworks-cm versions need to match. Check your SDK installation. AWSCore: %@ AWSopsworks-cm: %@", AWSiOSSDKVersion, AWSopsworks-cmSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultopsworks-cm {
    static AWSopsworks-cm *_defaultopsworks-cm = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoopsworks-cm];
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
        _defaultopsworks-cm = [[AWSopsworks-cm alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultopsworks-cm;
}

+ (void)registeropsworks-cmWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSopsworks-cm alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)opsworks-cmForKey:(NSString *)key {
    @synchronized(self) {
        AWSopsworks-cm *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoopsworks-cm
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSopsworks-cm registeropsworks-cmWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeopsworks-cmForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultopsworks-cm` or `+ opsworks-cmForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceopsworks-cm
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceopsworks-cm];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSopsworks-cmRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSopsworks-cmResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSopsworks-cmResponseSerializer alloc] initWithJSONDefinition:[[AWSopsworks-cmResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSopsworks-cmAssociateNodeResponse *> *)associateNode:(AWSopsworks-cmAssociateNodeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"AssociateNode"
                   outputClass:[AWSopsworks-cmAssociateNodeResponse class]];
}

- (void)associateNode:(AWSopsworks-cmAssociateNodeRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmAssociateNodeResponse *response, NSError *error))completionHandler {
    [[self associateNode:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmAssociateNodeResponse *> * _Nonnull task) {
        AWSopsworks-cmAssociateNodeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmCreateBackupResponse *> *)createBackup:(AWSopsworks-cmCreateBackupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"CreateBackup"
                   outputClass:[AWSopsworks-cmCreateBackupResponse class]];
}

- (void)createBackup:(AWSopsworks-cmCreateBackupRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmCreateBackupResponse *response, NSError *error))completionHandler {
    [[self createBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmCreateBackupResponse *> * _Nonnull task) {
        AWSopsworks-cmCreateBackupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmCreateServerResponse *> *)createServer:(AWSopsworks-cmCreateServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"CreateServer"
                   outputClass:[AWSopsworks-cmCreateServerResponse class]];
}

- (void)createServer:(AWSopsworks-cmCreateServerRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmCreateServerResponse *response, NSError *error))completionHandler {
    [[self createServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmCreateServerResponse *> * _Nonnull task) {
        AWSopsworks-cmCreateServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmDeleteBackupResponse *> *)deleteBackup:(AWSopsworks-cmDeleteBackupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DeleteBackup"
                   outputClass:[AWSopsworks-cmDeleteBackupResponse class]];
}

- (void)deleteBackup:(AWSopsworks-cmDeleteBackupRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmDeleteBackupResponse *response, NSError *error))completionHandler {
    [[self deleteBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmDeleteBackupResponse *> * _Nonnull task) {
        AWSopsworks-cmDeleteBackupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmDeleteServerResponse *> *)deleteServer:(AWSopsworks-cmDeleteServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DeleteServer"
                   outputClass:[AWSopsworks-cmDeleteServerResponse class]];
}

- (void)deleteServer:(AWSopsworks-cmDeleteServerRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmDeleteServerResponse *response, NSError *error))completionHandler {
    [[self deleteServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmDeleteServerResponse *> * _Nonnull task) {
        AWSopsworks-cmDeleteServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmDescribeAccountAttributesResponse *> *)describeAccountAttributes:(AWSopsworks-cmDescribeAccountAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DescribeAccountAttributes"
                   outputClass:[AWSopsworks-cmDescribeAccountAttributesResponse class]];
}

- (void)describeAccountAttributes:(AWSopsworks-cmDescribeAccountAttributesRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmDescribeAccountAttributesResponse *response, NSError *error))completionHandler {
    [[self describeAccountAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmDescribeAccountAttributesResponse *> * _Nonnull task) {
        AWSopsworks-cmDescribeAccountAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmDescribeBackupsResponse *> *)describeBackups:(AWSopsworks-cmDescribeBackupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DescribeBackups"
                   outputClass:[AWSopsworks-cmDescribeBackupsResponse class]];
}

- (void)describeBackups:(AWSopsworks-cmDescribeBackupsRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmDescribeBackupsResponse *response, NSError *error))completionHandler {
    [[self describeBackups:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmDescribeBackupsResponse *> * _Nonnull task) {
        AWSopsworks-cmDescribeBackupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmDescribeEventsResponse *> *)describeEvents:(AWSopsworks-cmDescribeEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DescribeEvents"
                   outputClass:[AWSopsworks-cmDescribeEventsResponse class]];
}

- (void)describeEvents:(AWSopsworks-cmDescribeEventsRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmDescribeEventsResponse *response, NSError *error))completionHandler {
    [[self describeEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmDescribeEventsResponse *> * _Nonnull task) {
        AWSopsworks-cmDescribeEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmDescribeNodeAssociationStatusResponse *> *)describeNodeAssociationStatus:(AWSopsworks-cmDescribeNodeAssociationStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DescribeNodeAssociationStatus"
                   outputClass:[AWSopsworks-cmDescribeNodeAssociationStatusResponse class]];
}

- (void)describeNodeAssociationStatus:(AWSopsworks-cmDescribeNodeAssociationStatusRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmDescribeNodeAssociationStatusResponse *response, NSError *error))completionHandler {
    [[self describeNodeAssociationStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmDescribeNodeAssociationStatusResponse *> * _Nonnull task) {
        AWSopsworks-cmDescribeNodeAssociationStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmDescribeServersResponse *> *)describeServers:(AWSopsworks-cmDescribeServersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DescribeServers"
                   outputClass:[AWSopsworks-cmDescribeServersResponse class]];
}

- (void)describeServers:(AWSopsworks-cmDescribeServersRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmDescribeServersResponse *response, NSError *error))completionHandler {
    [[self describeServers:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmDescribeServersResponse *> * _Nonnull task) {
        AWSopsworks-cmDescribeServersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmDisassociateNodeResponse *> *)disassociateNode:(AWSopsworks-cmDisassociateNodeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"DisassociateNode"
                   outputClass:[AWSopsworks-cmDisassociateNodeResponse class]];
}

- (void)disassociateNode:(AWSopsworks-cmDisassociateNodeRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmDisassociateNodeResponse *response, NSError *error))completionHandler {
    [[self disassociateNode:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmDisassociateNodeResponse *> * _Nonnull task) {
        AWSopsworks-cmDisassociateNodeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmExportServerEngineAttributeResponse *> *)exportServerEngineAttribute:(AWSopsworks-cmExportServerEngineAttributeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"ExportServerEngineAttribute"
                   outputClass:[AWSopsworks-cmExportServerEngineAttributeResponse class]];
}

- (void)exportServerEngineAttribute:(AWSopsworks-cmExportServerEngineAttributeRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmExportServerEngineAttributeResponse *response, NSError *error))completionHandler {
    [[self exportServerEngineAttribute:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmExportServerEngineAttributeResponse *> * _Nonnull task) {
        AWSopsworks-cmExportServerEngineAttributeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmListTagsForResourceResponse *> *)listTagsForResource:(AWSopsworks-cmListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSopsworks-cmListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSopsworks-cmListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmListTagsForResourceResponse *> * _Nonnull task) {
        AWSopsworks-cmListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmRestoreServerResponse *> *)restoreServer:(AWSopsworks-cmRestoreServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"RestoreServer"
                   outputClass:[AWSopsworks-cmRestoreServerResponse class]];
}

- (void)restoreServer:(AWSopsworks-cmRestoreServerRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmRestoreServerResponse *response, NSError *error))completionHandler {
    [[self restoreServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmRestoreServerResponse *> * _Nonnull task) {
        AWSopsworks-cmRestoreServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmStartMaintenanceResponse *> *)startMaintenance:(AWSopsworks-cmStartMaintenanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"StartMaintenance"
                   outputClass:[AWSopsworks-cmStartMaintenanceResponse class]];
}

- (void)startMaintenance:(AWSopsworks-cmStartMaintenanceRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmStartMaintenanceResponse *response, NSError *error))completionHandler {
    [[self startMaintenance:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmStartMaintenanceResponse *> * _Nonnull task) {
        AWSopsworks-cmStartMaintenanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmTagResourceResponse *> *)tagResource:(AWSopsworks-cmTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"TagResource"
                   outputClass:[AWSopsworks-cmTagResourceResponse class]];
}

- (void)tagResource:(AWSopsworks-cmTagResourceRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmTagResourceResponse *> * _Nonnull task) {
        AWSopsworks-cmTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmUntagResourceResponse *> *)untagResource:(AWSopsworks-cmUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"UntagResource"
                   outputClass:[AWSopsworks-cmUntagResourceResponse class]];
}

- (void)untagResource:(AWSopsworks-cmUntagResourceRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmUntagResourceResponse *> * _Nonnull task) {
        AWSopsworks-cmUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmUpdateServerResponse *> *)updateServer:(AWSopsworks-cmUpdateServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"UpdateServer"
                   outputClass:[AWSopsworks-cmUpdateServerResponse class]];
}

- (void)updateServer:(AWSopsworks-cmUpdateServerRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmUpdateServerResponse *response, NSError *error))completionHandler {
    [[self updateServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmUpdateServerResponse *> * _Nonnull task) {
        AWSopsworks-cmUpdateServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSopsworks-cmUpdateServerEngineAttributesResponse *> *)updateServerEngineAttributes:(AWSopsworks-cmUpdateServerEngineAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"OpsWorksCM_V2016_11_01"
                 operationName:@"UpdateServerEngineAttributes"
                   outputClass:[AWSopsworks-cmUpdateServerEngineAttributesResponse class]];
}

- (void)updateServerEngineAttributes:(AWSopsworks-cmUpdateServerEngineAttributesRequest *)request
     completionHandler:(void (^)(AWSopsworks-cmUpdateServerEngineAttributesResponse *response, NSError *error))completionHandler {
    [[self updateServerEngineAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSopsworks-cmUpdateServerEngineAttributesResponse *> * _Nonnull task) {
        AWSopsworks-cmUpdateServerEngineAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
