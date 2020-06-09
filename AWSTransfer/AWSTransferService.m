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

#import "AWSTransferService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSTransferResources.h"

static NSString *const AWSInfoTransfer = @"Transfer";
NSString *const AWSTransferSDKVersion = @"2.13.4";


@interface AWSTransferResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSTransferResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSTransferErrorAccessDenied),
                            @"ConflictException" : @(AWSTransferErrorConflict),
                            @"InternalServiceError" : @(AWSTransferErrorInternalService),
                            @"InvalidNextTokenException" : @(AWSTransferErrorInvalidNextToken),
                            @"InvalidRequestException" : @(AWSTransferErrorInvalidRequest),
                            @"ResourceExistsException" : @(AWSTransferErrorResourceExists),
                            @"ResourceNotFoundException" : @(AWSTransferErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSTransferErrorServiceUnavailable),
                            @"ThrottlingException" : @(AWSTransferErrorThrottling),
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
	                *error = [NSError errorWithDomain:AWSTransferErrorDomain
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
        *error = [NSError errorWithDomain:AWSTransferErrorDomain
                                     code:AWSTransferErrorUnknown
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

@interface AWSTransferRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSTransferRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSTransfer()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSTransfer

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSTransferSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSTransfer versions need to match. Check your SDK installation. AWSCore: %@ AWSTransfer: %@", AWSiOSSDKVersion, AWSTransferSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultTransfer {
    static AWSTransfer *_defaultTransfer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoTransfer];
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
        _defaultTransfer = [[AWSTransfer alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultTransfer;
}

+ (void)registerTransferWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSTransfer alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)TransferForKey:(NSString *)key {
    @synchronized(self) {
        AWSTransfer *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoTransfer
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSTransfer registerTransferWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeTransferForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultTransfer` or `+ TransferForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceTransfer
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceTransfer];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSTransferRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSTransferResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSTransferResponseSerializer alloc] initWithJSONDefinition:[[AWSTransferResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSTransferCreateServerResponse *> *)createServer:(AWSTransferCreateServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"CreateServer"
                   outputClass:[AWSTransferCreateServerResponse class]];
}

- (void)createServer:(AWSTransferCreateServerRequest *)request
     completionHandler:(void (^)(AWSTransferCreateServerResponse *response, NSError *error))completionHandler {
    [[self createServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferCreateServerResponse *> * _Nonnull task) {
        AWSTransferCreateServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTransferCreateUserResponse *> *)createUser:(AWSTransferCreateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"CreateUser"
                   outputClass:[AWSTransferCreateUserResponse class]];
}

- (void)createUser:(AWSTransferCreateUserRequest *)request
     completionHandler:(void (^)(AWSTransferCreateUserResponse *response, NSError *error))completionHandler {
    [[self createUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferCreateUserResponse *> * _Nonnull task) {
        AWSTransferCreateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteServer:(AWSTransferDeleteServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"DeleteServer"
                   outputClass:nil];
}

- (void)deleteServer:(AWSTransferDeleteServerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteServer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSshPublicKey:(AWSTransferDeleteSshPublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"DeleteSshPublicKey"
                   outputClass:nil];
}

- (void)deleteSshPublicKey:(AWSTransferDeleteSshPublicKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSshPublicKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUser:(AWSTransferDeleteUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"DeleteUser"
                   outputClass:nil];
}

- (void)deleteUser:(AWSTransferDeleteUserRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUser:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTransferDescribeServerResponse *> *)describeServer:(AWSTransferDescribeServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"DescribeServer"
                   outputClass:[AWSTransferDescribeServerResponse class]];
}

- (void)describeServer:(AWSTransferDescribeServerRequest *)request
     completionHandler:(void (^)(AWSTransferDescribeServerResponse *response, NSError *error))completionHandler {
    [[self describeServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferDescribeServerResponse *> * _Nonnull task) {
        AWSTransferDescribeServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTransferDescribeUserResponse *> *)describeUser:(AWSTransferDescribeUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"DescribeUser"
                   outputClass:[AWSTransferDescribeUserResponse class]];
}

- (void)describeUser:(AWSTransferDescribeUserRequest *)request
     completionHandler:(void (^)(AWSTransferDescribeUserResponse *response, NSError *error))completionHandler {
    [[self describeUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferDescribeUserResponse *> * _Nonnull task) {
        AWSTransferDescribeUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTransferImportSshPublicKeyResponse *> *)importSshPublicKey:(AWSTransferImportSshPublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"ImportSshPublicKey"
                   outputClass:[AWSTransferImportSshPublicKeyResponse class]];
}

- (void)importSshPublicKey:(AWSTransferImportSshPublicKeyRequest *)request
     completionHandler:(void (^)(AWSTransferImportSshPublicKeyResponse *response, NSError *error))completionHandler {
    [[self importSshPublicKey:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferImportSshPublicKeyResponse *> * _Nonnull task) {
        AWSTransferImportSshPublicKeyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTransferListServersResponse *> *)listServers:(AWSTransferListServersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"ListServers"
                   outputClass:[AWSTransferListServersResponse class]];
}

- (void)listServers:(AWSTransferListServersRequest *)request
     completionHandler:(void (^)(AWSTransferListServersResponse *response, NSError *error))completionHandler {
    [[self listServers:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferListServersResponse *> * _Nonnull task) {
        AWSTransferListServersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTransferListTagsForResourceResponse *> *)listTagsForResource:(AWSTransferListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSTransferListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSTransferListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSTransferListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferListTagsForResourceResponse *> * _Nonnull task) {
        AWSTransferListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTransferListUsersResponse *> *)listUsers:(AWSTransferListUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"ListUsers"
                   outputClass:[AWSTransferListUsersResponse class]];
}

- (void)listUsers:(AWSTransferListUsersRequest *)request
     completionHandler:(void (^)(AWSTransferListUsersResponse *response, NSError *error))completionHandler {
    [[self listUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferListUsersResponse *> * _Nonnull task) {
        AWSTransferListUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)startServer:(AWSTransferStartServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"StartServer"
                   outputClass:nil];
}

- (void)startServer:(AWSTransferStartServerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self startServer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopServer:(AWSTransferStopServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"StopServer"
                   outputClass:nil];
}

- (void)stopServer:(AWSTransferStopServerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopServer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSTransferTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSTransferTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTransferTestIdentityProviderResponse *> *)testIdentityProvider:(AWSTransferTestIdentityProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"TestIdentityProvider"
                   outputClass:[AWSTransferTestIdentityProviderResponse class]];
}

- (void)testIdentityProvider:(AWSTransferTestIdentityProviderRequest *)request
     completionHandler:(void (^)(AWSTransferTestIdentityProviderResponse *response, NSError *error))completionHandler {
    [[self testIdentityProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferTestIdentityProviderResponse *> * _Nonnull task) {
        AWSTransferTestIdentityProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSTransferUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSTransferUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTransferUpdateServerResponse *> *)updateServer:(AWSTransferUpdateServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"UpdateServer"
                   outputClass:[AWSTransferUpdateServerResponse class]];
}

- (void)updateServer:(AWSTransferUpdateServerRequest *)request
     completionHandler:(void (^)(AWSTransferUpdateServerResponse *response, NSError *error))completionHandler {
    [[self updateServer:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferUpdateServerResponse *> * _Nonnull task) {
        AWSTransferUpdateServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTransferUpdateUserResponse *> *)updateUser:(AWSTransferUpdateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"UpdateUser"
                   outputClass:[AWSTransferUpdateUserResponse class]];
}

- (void)updateUser:(AWSTransferUpdateUserRequest *)request
     completionHandler:(void (^)(AWSTransferUpdateUserResponse *response, NSError *error))completionHandler {
    [[self updateUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSTransferUpdateUserResponse *> * _Nonnull task) {
        AWSTransferUpdateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
