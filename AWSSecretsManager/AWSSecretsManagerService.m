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

#import "AWSSecretsManagerService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSecretsManagerResources.h"

static NSString *const AWSInfoSecretsManager = @"SecretsManager";
NSString *const AWSSecretsManagerSDKVersion = @"2.14.2";


@interface AWSSecretsManagerResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSecretsManagerResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"DecryptionFailure" : @(AWSSecretsManagerErrorDecryptionFailure),
                            @"EncryptionFailure" : @(AWSSecretsManagerErrorEncryptionFailure),
                            @"InternalServiceError" : @(AWSSecretsManagerErrorInternalService),
                            @"InvalidNextTokenException" : @(AWSSecretsManagerErrorInvalidNextToken),
                            @"InvalidParameterException" : @(AWSSecretsManagerErrorInvalidParameter),
                            @"InvalidRequestException" : @(AWSSecretsManagerErrorInvalidRequest),
                            @"LimitExceededException" : @(AWSSecretsManagerErrorLimitExceeded),
                            @"MalformedPolicyDocumentException" : @(AWSSecretsManagerErrorMalformedPolicyDocument),
                            @"PreconditionNotMetException" : @(AWSSecretsManagerErrorPreconditionNotMet),
                            @"PublicPolicyException" : @(AWSSecretsManagerErrorPublicPolicy),
                            @"ResourceExistsException" : @(AWSSecretsManagerErrorResourceExists),
                            @"ResourceNotFoundException" : @(AWSSecretsManagerErrorResourceNotFound),
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
	                *error = [NSError errorWithDomain:AWSSecretsManagerErrorDomain
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
        *error = [NSError errorWithDomain:AWSSecretsManagerErrorDomain
                                     code:AWSSecretsManagerErrorUnknown
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

@interface AWSSecretsManagerRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSecretsManagerRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSecretsManager()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSecretsManager

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSecretsManagerSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSecretsManager versions need to match. Check your SDK installation. AWSCore: %@ AWSSecretsManager: %@", AWSiOSSDKVersion, AWSSecretsManagerSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSecretsManager {
    static AWSSecretsManager *_defaultSecretsManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSecretsManager];
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
        _defaultSecretsManager = [[AWSSecretsManager alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSecretsManager;
}

+ (void)registerSecretsManagerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSecretsManager alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SecretsManagerForKey:(NSString *)key {
    @synchronized(self) {
        AWSSecretsManager *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSecretsManager
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSecretsManager registerSecretsManagerWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSecretsManagerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSecretsManager` or `+ SecretsManagerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSecretsManager
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSecretsManager];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSecretsManagerRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSecretsManagerResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSecretsManagerResponseSerializer alloc] initWithJSONDefinition:[[AWSSecretsManagerResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSecretsManagerCancelRotateSecretResponse *> *)cancelRotateSecret:(AWSSecretsManagerCancelRotateSecretRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"CancelRotateSecret"
                   outputClass:[AWSSecretsManagerCancelRotateSecretResponse class]];
}

- (void)cancelRotateSecret:(AWSSecretsManagerCancelRotateSecretRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerCancelRotateSecretResponse *response, NSError *error))completionHandler {
    [[self cancelRotateSecret:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerCancelRotateSecretResponse *> * _Nonnull task) {
        AWSSecretsManagerCancelRotateSecretResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerCreateSecretResponse *> *)createSecret:(AWSSecretsManagerCreateSecretRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"CreateSecret"
                   outputClass:[AWSSecretsManagerCreateSecretResponse class]];
}

- (void)createSecret:(AWSSecretsManagerCreateSecretRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerCreateSecretResponse *response, NSError *error))completionHandler {
    [[self createSecret:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerCreateSecretResponse *> * _Nonnull task) {
        AWSSecretsManagerCreateSecretResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerDeleteResourcePolicyResponse *> *)deleteResourcePolicy:(AWSSecretsManagerDeleteResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"DeleteResourcePolicy"
                   outputClass:[AWSSecretsManagerDeleteResourcePolicyResponse class]];
}

- (void)deleteResourcePolicy:(AWSSecretsManagerDeleteResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerDeleteResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self deleteResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerDeleteResourcePolicyResponse *> * _Nonnull task) {
        AWSSecretsManagerDeleteResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerDeleteSecretResponse *> *)deleteSecret:(AWSSecretsManagerDeleteSecretRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"DeleteSecret"
                   outputClass:[AWSSecretsManagerDeleteSecretResponse class]];
}

- (void)deleteSecret:(AWSSecretsManagerDeleteSecretRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerDeleteSecretResponse *response, NSError *error))completionHandler {
    [[self deleteSecret:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerDeleteSecretResponse *> * _Nonnull task) {
        AWSSecretsManagerDeleteSecretResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerDescribeSecretResponse *> *)describeSecret:(AWSSecretsManagerDescribeSecretRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"DescribeSecret"
                   outputClass:[AWSSecretsManagerDescribeSecretResponse class]];
}

- (void)describeSecret:(AWSSecretsManagerDescribeSecretRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerDescribeSecretResponse *response, NSError *error))completionHandler {
    [[self describeSecret:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerDescribeSecretResponse *> * _Nonnull task) {
        AWSSecretsManagerDescribeSecretResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerGetRandomPasswordResponse *> *)getRandomPassword:(AWSSecretsManagerGetRandomPasswordRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"GetRandomPassword"
                   outputClass:[AWSSecretsManagerGetRandomPasswordResponse class]];
}

- (void)getRandomPassword:(AWSSecretsManagerGetRandomPasswordRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerGetRandomPasswordResponse *response, NSError *error))completionHandler {
    [[self getRandomPassword:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerGetRandomPasswordResponse *> * _Nonnull task) {
        AWSSecretsManagerGetRandomPasswordResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerGetResourcePolicyResponse *> *)getResourcePolicy:(AWSSecretsManagerGetResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"GetResourcePolicy"
                   outputClass:[AWSSecretsManagerGetResourcePolicyResponse class]];
}

- (void)getResourcePolicy:(AWSSecretsManagerGetResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerGetResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self getResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerGetResourcePolicyResponse *> * _Nonnull task) {
        AWSSecretsManagerGetResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerGetSecretValueResponse *> *)getSecretValue:(AWSSecretsManagerGetSecretValueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"GetSecretValue"
                   outputClass:[AWSSecretsManagerGetSecretValueResponse class]];
}

- (void)getSecretValue:(AWSSecretsManagerGetSecretValueRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerGetSecretValueResponse *response, NSError *error))completionHandler {
    [[self getSecretValue:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerGetSecretValueResponse *> * _Nonnull task) {
        AWSSecretsManagerGetSecretValueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerListSecretVersionIdsResponse *> *)listSecretVersionIds:(AWSSecretsManagerListSecretVersionIdsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"ListSecretVersionIds"
                   outputClass:[AWSSecretsManagerListSecretVersionIdsResponse class]];
}

- (void)listSecretVersionIds:(AWSSecretsManagerListSecretVersionIdsRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerListSecretVersionIdsResponse *response, NSError *error))completionHandler {
    [[self listSecretVersionIds:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerListSecretVersionIdsResponse *> * _Nonnull task) {
        AWSSecretsManagerListSecretVersionIdsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerListSecretsResponse *> *)listSecrets:(AWSSecretsManagerListSecretsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"ListSecrets"
                   outputClass:[AWSSecretsManagerListSecretsResponse class]];
}

- (void)listSecrets:(AWSSecretsManagerListSecretsRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerListSecretsResponse *response, NSError *error))completionHandler {
    [[self listSecrets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerListSecretsResponse *> * _Nonnull task) {
        AWSSecretsManagerListSecretsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerPutResourcePolicyResponse *> *)putResourcePolicy:(AWSSecretsManagerPutResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"PutResourcePolicy"
                   outputClass:[AWSSecretsManagerPutResourcePolicyResponse class]];
}

- (void)putResourcePolicy:(AWSSecretsManagerPutResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerPutResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self putResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerPutResourcePolicyResponse *> * _Nonnull task) {
        AWSSecretsManagerPutResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerPutSecretValueResponse *> *)putSecretValue:(AWSSecretsManagerPutSecretValueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"PutSecretValue"
                   outputClass:[AWSSecretsManagerPutSecretValueResponse class]];
}

- (void)putSecretValue:(AWSSecretsManagerPutSecretValueRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerPutSecretValueResponse *response, NSError *error))completionHandler {
    [[self putSecretValue:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerPutSecretValueResponse *> * _Nonnull task) {
        AWSSecretsManagerPutSecretValueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerRestoreSecretResponse *> *)restoreSecret:(AWSSecretsManagerRestoreSecretRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"RestoreSecret"
                   outputClass:[AWSSecretsManagerRestoreSecretResponse class]];
}

- (void)restoreSecret:(AWSSecretsManagerRestoreSecretRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerRestoreSecretResponse *response, NSError *error))completionHandler {
    [[self restoreSecret:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerRestoreSecretResponse *> * _Nonnull task) {
        AWSSecretsManagerRestoreSecretResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerRotateSecretResponse *> *)rotateSecret:(AWSSecretsManagerRotateSecretRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"RotateSecret"
                   outputClass:[AWSSecretsManagerRotateSecretResponse class]];
}

- (void)rotateSecret:(AWSSecretsManagerRotateSecretRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerRotateSecretResponse *response, NSError *error))completionHandler {
    [[self rotateSecret:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerRotateSecretResponse *> * _Nonnull task) {
        AWSSecretsManagerRotateSecretResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSSecretsManagerTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSSecretsManagerTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSSecretsManagerUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSSecretsManagerUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerUpdateSecretResponse *> *)updateSecret:(AWSSecretsManagerUpdateSecretRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"UpdateSecret"
                   outputClass:[AWSSecretsManagerUpdateSecretResponse class]];
}

- (void)updateSecret:(AWSSecretsManagerUpdateSecretRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerUpdateSecretResponse *response, NSError *error))completionHandler {
    [[self updateSecret:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerUpdateSecretResponse *> * _Nonnull task) {
        AWSSecretsManagerUpdateSecretResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerUpdateSecretVersionStageResponse *> *)updateSecretVersionStage:(AWSSecretsManagerUpdateSecretVersionStageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"UpdateSecretVersionStage"
                   outputClass:[AWSSecretsManagerUpdateSecretVersionStageResponse class]];
}

- (void)updateSecretVersionStage:(AWSSecretsManagerUpdateSecretVersionStageRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerUpdateSecretVersionStageResponse *response, NSError *error))completionHandler {
    [[self updateSecretVersionStage:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerUpdateSecretVersionStageResponse *> * _Nonnull task) {
        AWSSecretsManagerUpdateSecretVersionStageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecretsManagerValidateResourcePolicyResponse *> *)validateResourcePolicy:(AWSSecretsManagerValidateResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"secretsmanager"
                 operationName:@"ValidateResourcePolicy"
                   outputClass:[AWSSecretsManagerValidateResourcePolicyResponse class]];
}

- (void)validateResourcePolicy:(AWSSecretsManagerValidateResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSSecretsManagerValidateResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self validateResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecretsManagerValidateResourcePolicyResponse *> * _Nonnull task) {
        AWSSecretsManagerValidateResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
