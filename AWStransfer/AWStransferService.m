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

#import "AWStransferService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWStransferResources.h"

static NSString *const AWSInfotransfer = @"transfer";
NSString *const AWStransferSDKVersion = @"2.13.2";


@interface AWStransferResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWStransferResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWStransferErrorAccessDenied),
                            @"ConflictException" : @(AWStransferErrorConflict),
                            @"InternalServiceError" : @(AWStransferErrorInternalService),
                            @"InvalidNextTokenException" : @(AWStransferErrorInvalidNextToken),
                            @"InvalidRequestException" : @(AWStransferErrorInvalidRequest),
                            @"ResourceExistsException" : @(AWStransferErrorResourceExists),
                            @"ResourceNotFoundException" : @(AWStransferErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWStransferErrorServiceUnavailable),
                            @"ThrottlingException" : @(AWStransferErrorThrottling),
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
	                *error = [NSError errorWithDomain:AWStransferErrorDomain
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
        *error = [NSError errorWithDomain:AWStransferErrorDomain
                                     code:AWStransferErrorUnknown
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

@interface AWStransferRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWStransferRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWStransfer()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWStransfer

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWStransferSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWStransfer versions need to match. Check your SDK installation. AWSCore: %@ AWStransfer: %@", AWSiOSSDKVersion, AWStransferSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaulttransfer {
    static AWStransfer *_defaulttransfer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfotransfer];
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
        _defaulttransfer = [[AWStransfer alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaulttransfer;
}

+ (void)registertransferWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWStransfer alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)transferForKey:(NSString *)key {
    @synchronized(self) {
        AWStransfer *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfotransfer
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWStransfer registertransferWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removetransferForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaulttransfer` or `+ transferForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicetransfer
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicetransfer];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWStransferRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWStransferResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWStransferResponseSerializer alloc] initWithJSONDefinition:[[AWStransferResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWStransferCreateServerResponse *> *)createServer:(AWStransferCreateServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"CreateServer"
                   outputClass:[AWStransferCreateServerResponse class]];
}

- (void)createServer:(AWStransferCreateServerRequest *)request
     completionHandler:(void (^)(AWStransferCreateServerResponse *response, NSError *error))completionHandler {
    [[self createServer:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferCreateServerResponse *> * _Nonnull task) {
        AWStransferCreateServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWStransferCreateUserResponse *> *)createUser:(AWStransferCreateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"CreateUser"
                   outputClass:[AWStransferCreateUserResponse class]];
}

- (void)createUser:(AWStransferCreateUserRequest *)request
     completionHandler:(void (^)(AWStransferCreateUserResponse *response, NSError *error))completionHandler {
    [[self createUser:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferCreateUserResponse *> * _Nonnull task) {
        AWStransferCreateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteServer:(AWStransferDeleteServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"DeleteServer"
                   outputClass:nil];
}

- (void)deleteServer:(AWStransferDeleteServerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteServer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSshPublicKey:(AWStransferDeleteSshPublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"DeleteSshPublicKey"
                   outputClass:nil];
}

- (void)deleteSshPublicKey:(AWStransferDeleteSshPublicKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSshPublicKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUser:(AWStransferDeleteUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"DeleteUser"
                   outputClass:nil];
}

- (void)deleteUser:(AWStransferDeleteUserRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUser:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWStransferDescribeServerResponse *> *)describeServer:(AWStransferDescribeServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"DescribeServer"
                   outputClass:[AWStransferDescribeServerResponse class]];
}

- (void)describeServer:(AWStransferDescribeServerRequest *)request
     completionHandler:(void (^)(AWStransferDescribeServerResponse *response, NSError *error))completionHandler {
    [[self describeServer:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferDescribeServerResponse *> * _Nonnull task) {
        AWStransferDescribeServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWStransferDescribeUserResponse *> *)describeUser:(AWStransferDescribeUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"DescribeUser"
                   outputClass:[AWStransferDescribeUserResponse class]];
}

- (void)describeUser:(AWStransferDescribeUserRequest *)request
     completionHandler:(void (^)(AWStransferDescribeUserResponse *response, NSError *error))completionHandler {
    [[self describeUser:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferDescribeUserResponse *> * _Nonnull task) {
        AWStransferDescribeUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWStransferImportSshPublicKeyResponse *> *)importSshPublicKey:(AWStransferImportSshPublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"ImportSshPublicKey"
                   outputClass:[AWStransferImportSshPublicKeyResponse class]];
}

- (void)importSshPublicKey:(AWStransferImportSshPublicKeyRequest *)request
     completionHandler:(void (^)(AWStransferImportSshPublicKeyResponse *response, NSError *error))completionHandler {
    [[self importSshPublicKey:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferImportSshPublicKeyResponse *> * _Nonnull task) {
        AWStransferImportSshPublicKeyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWStransferListServersResponse *> *)listServers:(AWStransferListServersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"ListServers"
                   outputClass:[AWStransferListServersResponse class]];
}

- (void)listServers:(AWStransferListServersRequest *)request
     completionHandler:(void (^)(AWStransferListServersResponse *response, NSError *error))completionHandler {
    [[self listServers:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferListServersResponse *> * _Nonnull task) {
        AWStransferListServersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWStransferListTagsForResourceResponse *> *)listTagsForResource:(AWStransferListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWStransferListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWStransferListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWStransferListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferListTagsForResourceResponse *> * _Nonnull task) {
        AWStransferListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWStransferListUsersResponse *> *)listUsers:(AWStransferListUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"ListUsers"
                   outputClass:[AWStransferListUsersResponse class]];
}

- (void)listUsers:(AWStransferListUsersRequest *)request
     completionHandler:(void (^)(AWStransferListUsersResponse *response, NSError *error))completionHandler {
    [[self listUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferListUsersResponse *> * _Nonnull task) {
        AWStransferListUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)startServer:(AWStransferStartServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"StartServer"
                   outputClass:nil];
}

- (void)startServer:(AWStransferStartServerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self startServer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)stopServer:(AWStransferStopServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"StopServer"
                   outputClass:nil];
}

- (void)stopServer:(AWStransferStopServerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self stopServer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWStransferTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWStransferTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWStransferTestIdentityProviderResponse *> *)testIdentityProvider:(AWStransferTestIdentityProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"TestIdentityProvider"
                   outputClass:[AWStransferTestIdentityProviderResponse class]];
}

- (void)testIdentityProvider:(AWStransferTestIdentityProviderRequest *)request
     completionHandler:(void (^)(AWStransferTestIdentityProviderResponse *response, NSError *error))completionHandler {
    [[self testIdentityProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferTestIdentityProviderResponse *> * _Nonnull task) {
        AWStransferTestIdentityProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWStransferUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWStransferUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWStransferUpdateServerResponse *> *)updateServer:(AWStransferUpdateServerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"UpdateServer"
                   outputClass:[AWStransferUpdateServerResponse class]];
}

- (void)updateServer:(AWStransferUpdateServerRequest *)request
     completionHandler:(void (^)(AWStransferUpdateServerResponse *response, NSError *error))completionHandler {
    [[self updateServer:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferUpdateServerResponse *> * _Nonnull task) {
        AWStransferUpdateServerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWStransferUpdateUserResponse *> *)updateUser:(AWStransferUpdateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TransferService"
                 operationName:@"UpdateUser"
                   outputClass:[AWStransferUpdateUserResponse class]];
}

- (void)updateUser:(AWStransferUpdateUserRequest *)request
     completionHandler:(void (^)(AWStransferUpdateUserResponse *response, NSError *error))completionHandler {
    [[self updateUser:request] continueWithBlock:^id _Nullable(AWSTask<AWStransferUpdateUserResponse *> * _Nonnull task) {
        AWStransferUpdateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
