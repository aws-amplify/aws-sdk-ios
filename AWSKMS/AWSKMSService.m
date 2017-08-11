//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSKMSService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSKMSResources.h"

static NSString *const AWSInfoKMS = @"KMS";
static NSString *const AWSKMSSDKVersion = @"2.5.10";


@interface AWSKMSResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSKMSResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AlreadyExistsException" : @(AWSKMSErrorAlreadyExists),
                            @"DependencyTimeoutException" : @(AWSKMSErrorDependencyTimeout),
                            @"DisabledException" : @(AWSKMSErrorDisabled),
                            @"ExpiredImportTokenException" : @(AWSKMSErrorExpiredImportToken),
                            @"IncorrectKeyMaterialException" : @(AWSKMSErrorIncorrectKeyMaterial),
                            @"InvalidAliasNameException" : @(AWSKMSErrorInvalidAliasName),
                            @"InvalidArnException" : @(AWSKMSErrorInvalidArn),
                            @"InvalidCiphertextException" : @(AWSKMSErrorInvalidCiphertext),
                            @"InvalidGrantIdException" : @(AWSKMSErrorInvalidGrantId),
                            @"InvalidGrantTokenException" : @(AWSKMSErrorInvalidGrantToken),
                            @"InvalidImportTokenException" : @(AWSKMSErrorInvalidImportToken),
                            @"InvalidKeyUsageException" : @(AWSKMSErrorInvalidKeyUsage),
                            @"InvalidMarkerException" : @(AWSKMSErrorInvalidMarker),
                            @"KMSInternalException" : @(AWSKMSErrorKMSInternal),
                            @"KMSInvalidStateException" : @(AWSKMSErrorKMSInvalidState),
                            @"KeyUnavailableException" : @(AWSKMSErrorKeyUnavailable),
                            @"LimitExceededException" : @(AWSKMSErrorLimitExceeded),
                            @"MalformedPolicyDocumentException" : @(AWSKMSErrorMalformedPolicyDocument),
                            @"NotFoundException" : @(AWSKMSErrorNotFound),
                            @"TagException" : @(AWSKMSErrorTag),
                            @"UnsupportedOperationException" : @(AWSKMSErrorUnsupportedOperation),
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
	                *error = [NSError errorWithDomain:AWSKMSErrorDomain
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
        *error = [NSError errorWithDomain:AWSKMSErrorDomain
                                     code:AWSKMSErrorUnknown
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

@interface AWSKMSRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSKMSRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSKMS()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSKMS

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSKMSSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSKMS versions need to match. Check your SDK installation. AWSCore: %@ AWSKMS: %@", AWSiOSSDKVersion, AWSKMSSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultKMS {
    static AWSKMS *_defaultKMS = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoKMS];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultKMS = [[AWSKMS alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultKMS;
}

+ (void)registerKMSWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSKMS alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)KMSForKey:(NSString *)key {
    @synchronized(self) {
        AWSKMS *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoKMS
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSKMS registerKMSWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeKMSForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultKMS` or `+ KMSForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceKMS
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceKMS];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSKMSRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSKMSResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSKMSResponseSerializer alloc] initWithJSONDefinition:[[AWSKMSResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSKMSCancelKeyDeletionResponse *> *)cancelKeyDeletion:(AWSKMSCancelKeyDeletionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"CancelKeyDeletion"
                   outputClass:[AWSKMSCancelKeyDeletionResponse class]];
}

- (void)cancelKeyDeletion:(AWSKMSCancelKeyDeletionRequest *)request
     completionHandler:(void (^)(AWSKMSCancelKeyDeletionResponse *response, NSError *error))completionHandler {
    [[self cancelKeyDeletion:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSCancelKeyDeletionResponse *> * _Nonnull task) {
        AWSKMSCancelKeyDeletionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createAlias:(AWSKMSCreateAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"CreateAlias"
                   outputClass:nil];
}

- (void)createAlias:(AWSKMSCreateAliasRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createAlias:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSCreateGrantResponse *> *)createGrant:(AWSKMSCreateGrantRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"CreateGrant"
                   outputClass:[AWSKMSCreateGrantResponse class]];
}

- (void)createGrant:(AWSKMSCreateGrantRequest *)request
     completionHandler:(void (^)(AWSKMSCreateGrantResponse *response, NSError *error))completionHandler {
    [[self createGrant:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSCreateGrantResponse *> * _Nonnull task) {
        AWSKMSCreateGrantResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSCreateKeyResponse *> *)createKey:(AWSKMSCreateKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"CreateKey"
                   outputClass:[AWSKMSCreateKeyResponse class]];
}

- (void)createKey:(AWSKMSCreateKeyRequest *)request
     completionHandler:(void (^)(AWSKMSCreateKeyResponse *response, NSError *error))completionHandler {
    [[self createKey:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSCreateKeyResponse *> * _Nonnull task) {
        AWSKMSCreateKeyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSDecryptResponse *> *)decrypt:(AWSKMSDecryptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"Decrypt"
                   outputClass:[AWSKMSDecryptResponse class]];
}

- (void)decrypt:(AWSKMSDecryptRequest *)request
     completionHandler:(void (^)(AWSKMSDecryptResponse *response, NSError *error))completionHandler {
    [[self decrypt:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSDecryptResponse *> * _Nonnull task) {
        AWSKMSDecryptResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAlias:(AWSKMSDeleteAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"DeleteAlias"
                   outputClass:nil];
}

- (void)deleteAlias:(AWSKMSDeleteAliasRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAlias:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteImportedKeyMaterial:(AWSKMSDeleteImportedKeyMaterialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"DeleteImportedKeyMaterial"
                   outputClass:nil];
}

- (void)deleteImportedKeyMaterial:(AWSKMSDeleteImportedKeyMaterialRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteImportedKeyMaterial:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSDescribeKeyResponse *> *)describeKey:(AWSKMSDescribeKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"DescribeKey"
                   outputClass:[AWSKMSDescribeKeyResponse class]];
}

- (void)describeKey:(AWSKMSDescribeKeyRequest *)request
     completionHandler:(void (^)(AWSKMSDescribeKeyResponse *response, NSError *error))completionHandler {
    [[self describeKey:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSDescribeKeyResponse *> * _Nonnull task) {
        AWSKMSDescribeKeyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disableKey:(AWSKMSDisableKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"DisableKey"
                   outputClass:nil];
}

- (void)disableKey:(AWSKMSDisableKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disableKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disableKeyRotation:(AWSKMSDisableKeyRotationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"DisableKeyRotation"
                   outputClass:nil];
}

- (void)disableKeyRotation:(AWSKMSDisableKeyRotationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disableKeyRotation:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)enableKey:(AWSKMSEnableKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"EnableKey"
                   outputClass:nil];
}

- (void)enableKey:(AWSKMSEnableKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self enableKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)enableKeyRotation:(AWSKMSEnableKeyRotationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"EnableKeyRotation"
                   outputClass:nil];
}

- (void)enableKeyRotation:(AWSKMSEnableKeyRotationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self enableKeyRotation:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSEncryptResponse *> *)encrypt:(AWSKMSEncryptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"Encrypt"
                   outputClass:[AWSKMSEncryptResponse class]];
}

- (void)encrypt:(AWSKMSEncryptRequest *)request
     completionHandler:(void (^)(AWSKMSEncryptResponse *response, NSError *error))completionHandler {
    [[self encrypt:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSEncryptResponse *> * _Nonnull task) {
        AWSKMSEncryptResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSGenerateDataKeyResponse *> *)generateDataKey:(AWSKMSGenerateDataKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"GenerateDataKey"
                   outputClass:[AWSKMSGenerateDataKeyResponse class]];
}

- (void)generateDataKey:(AWSKMSGenerateDataKeyRequest *)request
     completionHandler:(void (^)(AWSKMSGenerateDataKeyResponse *response, NSError *error))completionHandler {
    [[self generateDataKey:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSGenerateDataKeyResponse *> * _Nonnull task) {
        AWSKMSGenerateDataKeyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSGenerateDataKeyWithoutPlaintextResponse *> *)generateDataKeyWithoutPlaintext:(AWSKMSGenerateDataKeyWithoutPlaintextRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"GenerateDataKeyWithoutPlaintext"
                   outputClass:[AWSKMSGenerateDataKeyWithoutPlaintextResponse class]];
}

- (void)generateDataKeyWithoutPlaintext:(AWSKMSGenerateDataKeyWithoutPlaintextRequest *)request
     completionHandler:(void (^)(AWSKMSGenerateDataKeyWithoutPlaintextResponse *response, NSError *error))completionHandler {
    [[self generateDataKeyWithoutPlaintext:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSGenerateDataKeyWithoutPlaintextResponse *> * _Nonnull task) {
        AWSKMSGenerateDataKeyWithoutPlaintextResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSGenerateRandomResponse *> *)generateRandom:(AWSKMSGenerateRandomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"GenerateRandom"
                   outputClass:[AWSKMSGenerateRandomResponse class]];
}

- (void)generateRandom:(AWSKMSGenerateRandomRequest *)request
     completionHandler:(void (^)(AWSKMSGenerateRandomResponse *response, NSError *error))completionHandler {
    [[self generateRandom:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSGenerateRandomResponse *> * _Nonnull task) {
        AWSKMSGenerateRandomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSGetKeyPolicyResponse *> *)getKeyPolicy:(AWSKMSGetKeyPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"GetKeyPolicy"
                   outputClass:[AWSKMSGetKeyPolicyResponse class]];
}

- (void)getKeyPolicy:(AWSKMSGetKeyPolicyRequest *)request
     completionHandler:(void (^)(AWSKMSGetKeyPolicyResponse *response, NSError *error))completionHandler {
    [[self getKeyPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSGetKeyPolicyResponse *> * _Nonnull task) {
        AWSKMSGetKeyPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSGetKeyRotationStatusResponse *> *)getKeyRotationStatus:(AWSKMSGetKeyRotationStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"GetKeyRotationStatus"
                   outputClass:[AWSKMSGetKeyRotationStatusResponse class]];
}

- (void)getKeyRotationStatus:(AWSKMSGetKeyRotationStatusRequest *)request
     completionHandler:(void (^)(AWSKMSGetKeyRotationStatusResponse *response, NSError *error))completionHandler {
    [[self getKeyRotationStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSGetKeyRotationStatusResponse *> * _Nonnull task) {
        AWSKMSGetKeyRotationStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSGetParametersForImportResponse *> *)getParametersForImport:(AWSKMSGetParametersForImportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"GetParametersForImport"
                   outputClass:[AWSKMSGetParametersForImportResponse class]];
}

- (void)getParametersForImport:(AWSKMSGetParametersForImportRequest *)request
     completionHandler:(void (^)(AWSKMSGetParametersForImportResponse *response, NSError *error))completionHandler {
    [[self getParametersForImport:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSGetParametersForImportResponse *> * _Nonnull task) {
        AWSKMSGetParametersForImportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSImportKeyMaterialResponse *> *)importKeyMaterial:(AWSKMSImportKeyMaterialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"ImportKeyMaterial"
                   outputClass:[AWSKMSImportKeyMaterialResponse class]];
}

- (void)importKeyMaterial:(AWSKMSImportKeyMaterialRequest *)request
     completionHandler:(void (^)(AWSKMSImportKeyMaterialResponse *response, NSError *error))completionHandler {
    [[self importKeyMaterial:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSImportKeyMaterialResponse *> * _Nonnull task) {
        AWSKMSImportKeyMaterialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSListAliasesResponse *> *)listAliases:(AWSKMSListAliasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"ListAliases"
                   outputClass:[AWSKMSListAliasesResponse class]];
}

- (void)listAliases:(AWSKMSListAliasesRequest *)request
     completionHandler:(void (^)(AWSKMSListAliasesResponse *response, NSError *error))completionHandler {
    [[self listAliases:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSListAliasesResponse *> * _Nonnull task) {
        AWSKMSListAliasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSListGrantsResponse *> *)listGrants:(AWSKMSListGrantsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"ListGrants"
                   outputClass:[AWSKMSListGrantsResponse class]];
}

- (void)listGrants:(AWSKMSListGrantsRequest *)request
     completionHandler:(void (^)(AWSKMSListGrantsResponse *response, NSError *error))completionHandler {
    [[self listGrants:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSListGrantsResponse *> * _Nonnull task) {
        AWSKMSListGrantsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSListKeyPoliciesResponse *> *)listKeyPolicies:(AWSKMSListKeyPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"ListKeyPolicies"
                   outputClass:[AWSKMSListKeyPoliciesResponse class]];
}

- (void)listKeyPolicies:(AWSKMSListKeyPoliciesRequest *)request
     completionHandler:(void (^)(AWSKMSListKeyPoliciesResponse *response, NSError *error))completionHandler {
    [[self listKeyPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSListKeyPoliciesResponse *> * _Nonnull task) {
        AWSKMSListKeyPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSListKeysResponse *> *)listKeys:(AWSKMSListKeysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"ListKeys"
                   outputClass:[AWSKMSListKeysResponse class]];
}

- (void)listKeys:(AWSKMSListKeysRequest *)request
     completionHandler:(void (^)(AWSKMSListKeysResponse *response, NSError *error))completionHandler {
    [[self listKeys:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSListKeysResponse *> * _Nonnull task) {
        AWSKMSListKeysResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSListResourceTagsResponse *> *)listResourceTags:(AWSKMSListResourceTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"ListResourceTags"
                   outputClass:[AWSKMSListResourceTagsResponse class]];
}

- (void)listResourceTags:(AWSKMSListResourceTagsRequest *)request
     completionHandler:(void (^)(AWSKMSListResourceTagsResponse *response, NSError *error))completionHandler {
    [[self listResourceTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSListResourceTagsResponse *> * _Nonnull task) {
        AWSKMSListResourceTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSListGrantsResponse *> *)listRetirableGrants:(AWSKMSListRetirableGrantsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"ListRetirableGrants"
                   outputClass:[AWSKMSListGrantsResponse class]];
}

- (void)listRetirableGrants:(AWSKMSListRetirableGrantsRequest *)request
     completionHandler:(void (^)(AWSKMSListGrantsResponse *response, NSError *error))completionHandler {
    [[self listRetirableGrants:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSListGrantsResponse *> * _Nonnull task) {
        AWSKMSListGrantsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putKeyPolicy:(AWSKMSPutKeyPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"PutKeyPolicy"
                   outputClass:nil];
}

- (void)putKeyPolicy:(AWSKMSPutKeyPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putKeyPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSReEncryptResponse *> *)reEncrypt:(AWSKMSReEncryptRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"ReEncrypt"
                   outputClass:[AWSKMSReEncryptResponse class]];
}

- (void)reEncrypt:(AWSKMSReEncryptRequest *)request
     completionHandler:(void (^)(AWSKMSReEncryptResponse *response, NSError *error))completionHandler {
    [[self reEncrypt:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSReEncryptResponse *> * _Nonnull task) {
        AWSKMSReEncryptResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)retireGrant:(AWSKMSRetireGrantRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"RetireGrant"
                   outputClass:nil];
}

- (void)retireGrant:(AWSKMSRetireGrantRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self retireGrant:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)revokeGrant:(AWSKMSRevokeGrantRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"RevokeGrant"
                   outputClass:nil];
}

- (void)revokeGrant:(AWSKMSRevokeGrantRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self revokeGrant:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSKMSScheduleKeyDeletionResponse *> *)scheduleKeyDeletion:(AWSKMSScheduleKeyDeletionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"ScheduleKeyDeletion"
                   outputClass:[AWSKMSScheduleKeyDeletionResponse class]];
}

- (void)scheduleKeyDeletion:(AWSKMSScheduleKeyDeletionRequest *)request
     completionHandler:(void (^)(AWSKMSScheduleKeyDeletionResponse *response, NSError *error))completionHandler {
    [[self scheduleKeyDeletion:request] continueWithBlock:^id _Nullable(AWSTask<AWSKMSScheduleKeyDeletionResponse *> * _Nonnull task) {
        AWSKMSScheduleKeyDeletionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSKMSTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSKMSTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSKMSUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSKMSUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateAlias:(AWSKMSUpdateAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"UpdateAlias"
                   outputClass:nil];
}

- (void)updateAlias:(AWSKMSUpdateAliasRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateAlias:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateKeyDescription:(AWSKMSUpdateKeyDescriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"TrentService"
                 operationName:@"UpdateKeyDescription"
                   outputClass:nil];
}

- (void)updateKeyDescription:(AWSKMSUpdateKeyDescriptionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateKeyDescription:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
