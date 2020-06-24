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

#import "AWSFsxService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSFsxResources.h"

static NSString *const AWSInfoFsx = @"Fsx";
NSString *const AWSFsxSDKVersion = @"2.13.5";


@interface AWSFsxResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSFsxResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ActiveDirectoryError" : @(AWSFsxErrorActiveDirectory),
                            @"BackupInProgress" : @(AWSFsxErrorBackupInProgress),
                            @"BackupNotFound" : @(AWSFsxErrorBackupNotFound),
                            @"BackupRestoring" : @(AWSFsxErrorBackupRestoring),
                            @"BadRequest" : @(AWSFsxErrorBadRequest),
                            @"DataRepositoryTaskEnded" : @(AWSFsxErrorDataRepositoryTaskEnded),
                            @"DataRepositoryTaskExecuting" : @(AWSFsxErrorDataRepositoryTaskExecuting),
                            @"DataRepositoryTaskNotFound" : @(AWSFsxErrorDataRepositoryTaskNotFound),
                            @"FileSystemNotFound" : @(AWSFsxErrorFileSystemNotFound),
                            @"IncompatibleParameterError" : @(AWSFsxErrorIncompatibleParameter),
                            @"InternalServerError" : @(AWSFsxErrorInternalServer),
                            @"InvalidExportPath" : @(AWSFsxErrorInvalidExportPath),
                            @"InvalidImportPath" : @(AWSFsxErrorInvalidImportPath),
                            @"InvalidNetworkSettings" : @(AWSFsxErrorInvalidNetworkSettings),
                            @"InvalidPerUnitStorageThroughput" : @(AWSFsxErrorInvalidPerUnitStorageThroughput),
                            @"MissingFileSystemConfiguration" : @(AWSFsxErrorMissingFileSystemConfiguration),
                            @"NotServiceResourceError" : @(AWSFsxErrorNotServiceResource),
                            @"ResourceDoesNotSupportTagging" : @(AWSFsxErrorResourceDoesNotSupportTagging),
                            @"ResourceNotFound" : @(AWSFsxErrorResourceNotFound),
                            @"ServiceLimitExceeded" : @(AWSFsxErrorServiceLimitExceeded),
                            @"UnsupportedOperation" : @(AWSFsxErrorUnsupportedOperation),
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
	                *error = [NSError errorWithDomain:AWSFsxErrorDomain
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
        *error = [NSError errorWithDomain:AWSFsxErrorDomain
                                     code:AWSFsxErrorUnknown
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

@interface AWSFsxRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSFsxRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSFsx()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSFsx

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSFsxSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSFsx versions need to match. Check your SDK installation. AWSCore: %@ AWSFsx: %@", AWSiOSSDKVersion, AWSFsxSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultFsx {
    static AWSFsx *_defaultFsx = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoFsx];
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
        _defaultFsx = [[AWSFsx alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultFsx;
}

+ (void)registerFsxWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSFsx alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)FsxForKey:(NSString *)key {
    @synchronized(self) {
        AWSFsx *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoFsx
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSFsx registerFsxWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeFsxForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultFsx` or `+ FsxForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceFsx
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceFsx];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSFsxRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSFsxResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSFsxResponseSerializer alloc] initWithJSONDefinition:[[AWSFsxResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSFsxCancelDataRepositoryTaskResponse *> *)cancelDataRepositoryTask:(AWSFsxCancelDataRepositoryTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"CancelDataRepositoryTask"
                   outputClass:[AWSFsxCancelDataRepositoryTaskResponse class]];
}

- (void)cancelDataRepositoryTask:(AWSFsxCancelDataRepositoryTaskRequest *)request
     completionHandler:(void (^)(AWSFsxCancelDataRepositoryTaskResponse *response, NSError *error))completionHandler {
    [[self cancelDataRepositoryTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxCancelDataRepositoryTaskResponse *> * _Nonnull task) {
        AWSFsxCancelDataRepositoryTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxCreateBackupResponse *> *)createBackup:(AWSFsxCreateBackupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"CreateBackup"
                   outputClass:[AWSFsxCreateBackupResponse class]];
}

- (void)createBackup:(AWSFsxCreateBackupRequest *)request
     completionHandler:(void (^)(AWSFsxCreateBackupResponse *response, NSError *error))completionHandler {
    [[self createBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxCreateBackupResponse *> * _Nonnull task) {
        AWSFsxCreateBackupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxCreateDataRepositoryTaskResponse *> *)createDataRepositoryTask:(AWSFsxCreateDataRepositoryTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"CreateDataRepositoryTask"
                   outputClass:[AWSFsxCreateDataRepositoryTaskResponse class]];
}

- (void)createDataRepositoryTask:(AWSFsxCreateDataRepositoryTaskRequest *)request
     completionHandler:(void (^)(AWSFsxCreateDataRepositoryTaskResponse *response, NSError *error))completionHandler {
    [[self createDataRepositoryTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxCreateDataRepositoryTaskResponse *> * _Nonnull task) {
        AWSFsxCreateDataRepositoryTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxCreateFileSystemResponse *> *)createFileSystem:(AWSFsxCreateFileSystemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"CreateFileSystem"
                   outputClass:[AWSFsxCreateFileSystemResponse class]];
}

- (void)createFileSystem:(AWSFsxCreateFileSystemRequest *)request
     completionHandler:(void (^)(AWSFsxCreateFileSystemResponse *response, NSError *error))completionHandler {
    [[self createFileSystem:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxCreateFileSystemResponse *> * _Nonnull task) {
        AWSFsxCreateFileSystemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxCreateFileSystemFromBackupResponse *> *)createFileSystemFromBackup:(AWSFsxCreateFileSystemFromBackupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"CreateFileSystemFromBackup"
                   outputClass:[AWSFsxCreateFileSystemFromBackupResponse class]];
}

- (void)createFileSystemFromBackup:(AWSFsxCreateFileSystemFromBackupRequest *)request
     completionHandler:(void (^)(AWSFsxCreateFileSystemFromBackupResponse *response, NSError *error))completionHandler {
    [[self createFileSystemFromBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxCreateFileSystemFromBackupResponse *> * _Nonnull task) {
        AWSFsxCreateFileSystemFromBackupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxDeleteBackupResponse *> *)deleteBackup:(AWSFsxDeleteBackupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"DeleteBackup"
                   outputClass:[AWSFsxDeleteBackupResponse class]];
}

- (void)deleteBackup:(AWSFsxDeleteBackupRequest *)request
     completionHandler:(void (^)(AWSFsxDeleteBackupResponse *response, NSError *error))completionHandler {
    [[self deleteBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxDeleteBackupResponse *> * _Nonnull task) {
        AWSFsxDeleteBackupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxDeleteFileSystemResponse *> *)deleteFileSystem:(AWSFsxDeleteFileSystemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"DeleteFileSystem"
                   outputClass:[AWSFsxDeleteFileSystemResponse class]];
}

- (void)deleteFileSystem:(AWSFsxDeleteFileSystemRequest *)request
     completionHandler:(void (^)(AWSFsxDeleteFileSystemResponse *response, NSError *error))completionHandler {
    [[self deleteFileSystem:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxDeleteFileSystemResponse *> * _Nonnull task) {
        AWSFsxDeleteFileSystemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxDescribeBackupsResponse *> *)describeBackups:(AWSFsxDescribeBackupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"DescribeBackups"
                   outputClass:[AWSFsxDescribeBackupsResponse class]];
}

- (void)describeBackups:(AWSFsxDescribeBackupsRequest *)request
     completionHandler:(void (^)(AWSFsxDescribeBackupsResponse *response, NSError *error))completionHandler {
    [[self describeBackups:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxDescribeBackupsResponse *> * _Nonnull task) {
        AWSFsxDescribeBackupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxDescribeDataRepositoryTasksResponse *> *)describeDataRepositoryTasks:(AWSFsxDescribeDataRepositoryTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"DescribeDataRepositoryTasks"
                   outputClass:[AWSFsxDescribeDataRepositoryTasksResponse class]];
}

- (void)describeDataRepositoryTasks:(AWSFsxDescribeDataRepositoryTasksRequest *)request
     completionHandler:(void (^)(AWSFsxDescribeDataRepositoryTasksResponse *response, NSError *error))completionHandler {
    [[self describeDataRepositoryTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxDescribeDataRepositoryTasksResponse *> * _Nonnull task) {
        AWSFsxDescribeDataRepositoryTasksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxDescribeFileSystemsResponse *> *)describeFileSystems:(AWSFsxDescribeFileSystemsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"DescribeFileSystems"
                   outputClass:[AWSFsxDescribeFileSystemsResponse class]];
}

- (void)describeFileSystems:(AWSFsxDescribeFileSystemsRequest *)request
     completionHandler:(void (^)(AWSFsxDescribeFileSystemsResponse *response, NSError *error))completionHandler {
    [[self describeFileSystems:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxDescribeFileSystemsResponse *> * _Nonnull task) {
        AWSFsxDescribeFileSystemsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxListTagsForResourceResponse *> *)listTagsForResource:(AWSFsxListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSFsxListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSFsxListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSFsxListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxListTagsForResourceResponse *> * _Nonnull task) {
        AWSFsxListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxTagResourceResponse *> *)tagResource:(AWSFsxTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"TagResource"
                   outputClass:[AWSFsxTagResourceResponse class]];
}

- (void)tagResource:(AWSFsxTagResourceRequest *)request
     completionHandler:(void (^)(AWSFsxTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxTagResourceResponse *> * _Nonnull task) {
        AWSFsxTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxUntagResourceResponse *> *)untagResource:(AWSFsxUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"UntagResource"
                   outputClass:[AWSFsxUntagResourceResponse class]];
}

- (void)untagResource:(AWSFsxUntagResourceRequest *)request
     completionHandler:(void (^)(AWSFsxUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxUntagResourceResponse *> * _Nonnull task) {
        AWSFsxUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSFsxUpdateFileSystemResponse *> *)updateFileSystem:(AWSFsxUpdateFileSystemRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSSimbaAPIService_v20180301"
                 operationName:@"UpdateFileSystem"
                   outputClass:[AWSFsxUpdateFileSystemResponse class]];
}

- (void)updateFileSystem:(AWSFsxUpdateFileSystemRequest *)request
     completionHandler:(void (^)(AWSFsxUpdateFileSystemResponse *response, NSError *error))completionHandler {
    [[self updateFileSystem:request] continueWithBlock:^id _Nullable(AWSTask<AWSFsxUpdateFileSystemResponse *> * _Nonnull task) {
        AWSFsxUpdateFileSystemResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
