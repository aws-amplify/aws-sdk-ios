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

#import "AWSIamService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSIamResources.h"

static NSString *const AWSInfoIam = @"Iam";
NSString *const AWSIamSDKVersion = @"2.13.4";


@interface AWSIamResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSIamResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConcurrentModification" : @(AWSIamErrorConcurrentModification),
                            @"ReportExpired" : @(AWSIamErrorCredentialReportExpired),
                            @"ReportNotPresent" : @(AWSIamErrorCredentialReportNotPresent),
                            @"ReportInProgress" : @(AWSIamErrorCredentialReportNotReady),
                            @"DeleteConflict" : @(AWSIamErrorDeleteConflict),
                            @"DuplicateCertificate" : @(AWSIamErrorDuplicateCertificate),
                            @"DuplicateSSHPublicKey" : @(AWSIamErrorDuplicateSSHPublicKey),
                            @"EntityAlreadyExists" : @(AWSIamErrorEntityAlreadyExists),
                            @"EntityTemporarilyUnmodifiable" : @(AWSIamErrorEntityTemporarilyUnmodifiable),
                            @"InvalidAuthenticationCode" : @(AWSIamErrorInvalidAuthenticationCode),
                            @"InvalidCertificate" : @(AWSIamErrorInvalidCertificate),
                            @"InvalidInput" : @(AWSIamErrorInvalidInput),
                            @"InvalidPublicKey" : @(AWSIamErrorInvalidPublicKey),
                            @"InvalidUserType" : @(AWSIamErrorInvalidUserType),
                            @"KeyPairMismatch" : @(AWSIamErrorKeyPairMismatch),
                            @"LimitExceeded" : @(AWSIamErrorLimitExceeded),
                            @"MalformedCertificate" : @(AWSIamErrorMalformedCertificate),
                            @"MalformedPolicyDocument" : @(AWSIamErrorMalformedPolicyDocument),
                            @"NoSuchEntity" : @(AWSIamErrorNoSuchEntity),
                            @"PasswordPolicyViolation" : @(AWSIamErrorPasswordPolicyViolation),
                            @"PolicyEvaluation" : @(AWSIamErrorPolicyEvaluation),
                            @"PolicyNotAttachable" : @(AWSIamErrorPolicyNotAttachable),
                            @"ReportGenerationLimitExceeded" : @(AWSIamErrorReportGenerationLimitExceeded),
                            @"ServiceFailure" : @(AWSIamErrorServiceFailure),
                            @"NotSupportedService" : @(AWSIamErrorServiceNotSupported),
                            @"UnmodifiableEntity" : @(AWSIamErrorUnmodifiableEntity),
                            @"UnrecognizedPublicKeyEncoding" : @(AWSIamErrorUnrecognizedPublicKeyEncoding),
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

        NSDictionary *errorInfo = responseObject[@"Error"];
        if (errorInfo[@"Code"] && errorCodeDictionary[errorInfo[@"Code"]]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSIamErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                         ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSIamErrorDomain
                                             code:AWSIamErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSIamErrorDomain
                                     code:AWSIamErrorUnknown
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

@interface AWSIamRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSIamRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSIam()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSIam

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSIamSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSIam versions need to match. Check your SDK installation. AWSCore: %@ AWSIam: %@", AWSiOSSDKVersion, AWSIamSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultIam {
    static AWSIam *_defaultIam = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoIam];
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
        _defaultIam = [[AWSIam alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultIam;
}

+ (void)registerIamWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSIam alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)IamForKey:(NSString *)key {
    @synchronized(self) {
        AWSIam *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoIam
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSIam registerIamWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeIamForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultIam` or `+ IamForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceIam
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceIam];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSIamRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSIamResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSIamResponseSerializer alloc] initWithJSONDefinition:[[AWSIamResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)addClientIDToOpenIDConnectProvider:(AWSIamAddClientIDToOpenIDConnectProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddClientIDToOpenIDConnectProvider"
                   outputClass:nil];
}

- (void)addClientIDToOpenIDConnectProvider:(AWSIamAddClientIDToOpenIDConnectProviderRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addClientIDToOpenIDConnectProvider:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)addRoleToInstanceProfile:(AWSIamAddRoleToInstanceProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddRoleToInstanceProfile"
                   outputClass:nil];
}

- (void)addRoleToInstanceProfile:(AWSIamAddRoleToInstanceProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addRoleToInstanceProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)addUserToGroup:(AWSIamAddUserToGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddUserToGroup"
                   outputClass:nil];
}

- (void)addUserToGroup:(AWSIamAddUserToGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addUserToGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)attachGroupPolicy:(AWSIamAttachGroupPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachGroupPolicy"
                   outputClass:nil];
}

- (void)attachGroupPolicy:(AWSIamAttachGroupPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self attachGroupPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)attachRolePolicy:(AWSIamAttachRolePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachRolePolicy"
                   outputClass:nil];
}

- (void)attachRolePolicy:(AWSIamAttachRolePolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self attachRolePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)attachUserPolicy:(AWSIamAttachUserPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachUserPolicy"
                   outputClass:nil];
}

- (void)attachUserPolicy:(AWSIamAttachUserPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self attachUserPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)changePassword:(AWSIamChangePasswordRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ChangePassword"
                   outputClass:nil];
}

- (void)changePassword:(AWSIamChangePasswordRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self changePassword:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateAccessKeyResponse *> *)createAccessKey:(AWSIamCreateAccessKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateAccessKey"
                   outputClass:[AWSIamCreateAccessKeyResponse class]];
}

- (void)createAccessKey:(AWSIamCreateAccessKeyRequest *)request
     completionHandler:(void (^)(AWSIamCreateAccessKeyResponse *response, NSError *error))completionHandler {
    [[self createAccessKey:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateAccessKeyResponse *> * _Nonnull task) {
        AWSIamCreateAccessKeyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createAccountAlias:(AWSIamCreateAccountAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateAccountAlias"
                   outputClass:nil];
}

- (void)createAccountAlias:(AWSIamCreateAccountAliasRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createAccountAlias:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateGroupResponse *> *)createGroup:(AWSIamCreateGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateGroup"
                   outputClass:[AWSIamCreateGroupResponse class]];
}

- (void)createGroup:(AWSIamCreateGroupRequest *)request
     completionHandler:(void (^)(AWSIamCreateGroupResponse *response, NSError *error))completionHandler {
    [[self createGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateGroupResponse *> * _Nonnull task) {
        AWSIamCreateGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateInstanceProfileResponse *> *)createInstanceProfile:(AWSIamCreateInstanceProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateInstanceProfile"
                   outputClass:[AWSIamCreateInstanceProfileResponse class]];
}

- (void)createInstanceProfile:(AWSIamCreateInstanceProfileRequest *)request
     completionHandler:(void (^)(AWSIamCreateInstanceProfileResponse *response, NSError *error))completionHandler {
    [[self createInstanceProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateInstanceProfileResponse *> * _Nonnull task) {
        AWSIamCreateInstanceProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateLoginProfileResponse *> *)createLoginProfile:(AWSIamCreateLoginProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLoginProfile"
                   outputClass:[AWSIamCreateLoginProfileResponse class]];
}

- (void)createLoginProfile:(AWSIamCreateLoginProfileRequest *)request
     completionHandler:(void (^)(AWSIamCreateLoginProfileResponse *response, NSError *error))completionHandler {
    [[self createLoginProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateLoginProfileResponse *> * _Nonnull task) {
        AWSIamCreateLoginProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateOpenIDConnectProviderResponse *> *)createOpenIDConnectProvider:(AWSIamCreateOpenIDConnectProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateOpenIDConnectProvider"
                   outputClass:[AWSIamCreateOpenIDConnectProviderResponse class]];
}

- (void)createOpenIDConnectProvider:(AWSIamCreateOpenIDConnectProviderRequest *)request
     completionHandler:(void (^)(AWSIamCreateOpenIDConnectProviderResponse *response, NSError *error))completionHandler {
    [[self createOpenIDConnectProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateOpenIDConnectProviderResponse *> * _Nonnull task) {
        AWSIamCreateOpenIDConnectProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreatePolicyResponse *> *)createPolicy:(AWSIamCreatePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePolicy"
                   outputClass:[AWSIamCreatePolicyResponse class]];
}

- (void)createPolicy:(AWSIamCreatePolicyRequest *)request
     completionHandler:(void (^)(AWSIamCreatePolicyResponse *response, NSError *error))completionHandler {
    [[self createPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreatePolicyResponse *> * _Nonnull task) {
        AWSIamCreatePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreatePolicyVersionResponse *> *)createPolicyVersion:(AWSIamCreatePolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePolicyVersion"
                   outputClass:[AWSIamCreatePolicyVersionResponse class]];
}

- (void)createPolicyVersion:(AWSIamCreatePolicyVersionRequest *)request
     completionHandler:(void (^)(AWSIamCreatePolicyVersionResponse *response, NSError *error))completionHandler {
    [[self createPolicyVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreatePolicyVersionResponse *> * _Nonnull task) {
        AWSIamCreatePolicyVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateRoleResponse *> *)createRole:(AWSIamCreateRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateRole"
                   outputClass:[AWSIamCreateRoleResponse class]];
}

- (void)createRole:(AWSIamCreateRoleRequest *)request
     completionHandler:(void (^)(AWSIamCreateRoleResponse *response, NSError *error))completionHandler {
    [[self createRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateRoleResponse *> * _Nonnull task) {
        AWSIamCreateRoleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateSAMLProviderResponse *> *)createSAMLProvider:(AWSIamCreateSAMLProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateSAMLProvider"
                   outputClass:[AWSIamCreateSAMLProviderResponse class]];
}

- (void)createSAMLProvider:(AWSIamCreateSAMLProviderRequest *)request
     completionHandler:(void (^)(AWSIamCreateSAMLProviderResponse *response, NSError *error))completionHandler {
    [[self createSAMLProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateSAMLProviderResponse *> * _Nonnull task) {
        AWSIamCreateSAMLProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateServiceLinkedRoleResponse *> *)createServiceLinkedRole:(AWSIamCreateServiceLinkedRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateServiceLinkedRole"
                   outputClass:[AWSIamCreateServiceLinkedRoleResponse class]];
}

- (void)createServiceLinkedRole:(AWSIamCreateServiceLinkedRoleRequest *)request
     completionHandler:(void (^)(AWSIamCreateServiceLinkedRoleResponse *response, NSError *error))completionHandler {
    [[self createServiceLinkedRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateServiceLinkedRoleResponse *> * _Nonnull task) {
        AWSIamCreateServiceLinkedRoleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateServiceSpecificCredentialResponse *> *)createServiceSpecificCredential:(AWSIamCreateServiceSpecificCredentialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateServiceSpecificCredential"
                   outputClass:[AWSIamCreateServiceSpecificCredentialResponse class]];
}

- (void)createServiceSpecificCredential:(AWSIamCreateServiceSpecificCredentialRequest *)request
     completionHandler:(void (^)(AWSIamCreateServiceSpecificCredentialResponse *response, NSError *error))completionHandler {
    [[self createServiceSpecificCredential:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateServiceSpecificCredentialResponse *> * _Nonnull task) {
        AWSIamCreateServiceSpecificCredentialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateUserResponse *> *)createUser:(AWSIamCreateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateUser"
                   outputClass:[AWSIamCreateUserResponse class]];
}

- (void)createUser:(AWSIamCreateUserRequest *)request
     completionHandler:(void (^)(AWSIamCreateUserResponse *response, NSError *error))completionHandler {
    [[self createUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateUserResponse *> * _Nonnull task) {
        AWSIamCreateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamCreateVirtualMFADeviceResponse *> *)createVirtualMFADevice:(AWSIamCreateVirtualMFADeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateVirtualMFADevice"
                   outputClass:[AWSIamCreateVirtualMFADeviceResponse class]];
}

- (void)createVirtualMFADevice:(AWSIamCreateVirtualMFADeviceRequest *)request
     completionHandler:(void (^)(AWSIamCreateVirtualMFADeviceResponse *response, NSError *error))completionHandler {
    [[self createVirtualMFADevice:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamCreateVirtualMFADeviceResponse *> * _Nonnull task) {
        AWSIamCreateVirtualMFADeviceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deactivateMFADevice:(AWSIamDeactivateMFADeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeactivateMFADevice"
                   outputClass:nil];
}

- (void)deactivateMFADevice:(AWSIamDeactivateMFADeviceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deactivateMFADevice:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAccessKey:(AWSIamDeleteAccessKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteAccessKey"
                   outputClass:nil];
}

- (void)deleteAccessKey:(AWSIamDeleteAccessKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAccessKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAccountAlias:(AWSIamDeleteAccountAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteAccountAlias"
                   outputClass:nil];
}

- (void)deleteAccountAlias:(AWSIamDeleteAccountAliasRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAccountAlias:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAccountPasswordPolicy:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteAccountPasswordPolicy"
                   outputClass:nil];
}

- (void)deleteAccountPasswordPolicy:(AWSRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAccountPasswordPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteGroup:(AWSIamDeleteGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteGroup"
                   outputClass:nil];
}

- (void)deleteGroup:(AWSIamDeleteGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteGroupPolicy:(AWSIamDeleteGroupPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteGroupPolicy"
                   outputClass:nil];
}

- (void)deleteGroupPolicy:(AWSIamDeleteGroupPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteGroupPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteInstanceProfile:(AWSIamDeleteInstanceProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteInstanceProfile"
                   outputClass:nil];
}

- (void)deleteInstanceProfile:(AWSIamDeleteInstanceProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteInstanceProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteLoginProfile:(AWSIamDeleteLoginProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLoginProfile"
                   outputClass:nil];
}

- (void)deleteLoginProfile:(AWSIamDeleteLoginProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteLoginProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteOpenIDConnectProvider:(AWSIamDeleteOpenIDConnectProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteOpenIDConnectProvider"
                   outputClass:nil];
}

- (void)deleteOpenIDConnectProvider:(AWSIamDeleteOpenIDConnectProviderRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteOpenIDConnectProvider:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePolicy:(AWSIamDeletePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePolicy"
                   outputClass:nil];
}

- (void)deletePolicy:(AWSIamDeletePolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePolicyVersion:(AWSIamDeletePolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePolicyVersion"
                   outputClass:nil];
}

- (void)deletePolicyVersion:(AWSIamDeletePolicyVersionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePolicyVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRole:(AWSIamDeleteRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteRole"
                   outputClass:nil];
}

- (void)deleteRole:(AWSIamDeleteRoleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRole:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRolePermissionsBoundary:(AWSIamDeleteRolePermissionsBoundaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteRolePermissionsBoundary"
                   outputClass:nil];
}

- (void)deleteRolePermissionsBoundary:(AWSIamDeleteRolePermissionsBoundaryRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRolePermissionsBoundary:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRolePolicy:(AWSIamDeleteRolePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteRolePolicy"
                   outputClass:nil];
}

- (void)deleteRolePolicy:(AWSIamDeleteRolePolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRolePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSAMLProvider:(AWSIamDeleteSAMLProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSAMLProvider"
                   outputClass:nil];
}

- (void)deleteSAMLProvider:(AWSIamDeleteSAMLProviderRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSAMLProvider:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSSHPublicKey:(AWSIamDeleteSSHPublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSSHPublicKey"
                   outputClass:nil];
}

- (void)deleteSSHPublicKey:(AWSIamDeleteSSHPublicKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSSHPublicKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteServerCertificate:(AWSIamDeleteServerCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteServerCertificate"
                   outputClass:nil];
}

- (void)deleteServerCertificate:(AWSIamDeleteServerCertificateRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteServerCertificate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamDeleteServiceLinkedRoleResponse *> *)deleteServiceLinkedRole:(AWSIamDeleteServiceLinkedRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteServiceLinkedRole"
                   outputClass:[AWSIamDeleteServiceLinkedRoleResponse class]];
}

- (void)deleteServiceLinkedRole:(AWSIamDeleteServiceLinkedRoleRequest *)request
     completionHandler:(void (^)(AWSIamDeleteServiceLinkedRoleResponse *response, NSError *error))completionHandler {
    [[self deleteServiceLinkedRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamDeleteServiceLinkedRoleResponse *> * _Nonnull task) {
        AWSIamDeleteServiceLinkedRoleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteServiceSpecificCredential:(AWSIamDeleteServiceSpecificCredentialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteServiceSpecificCredential"
                   outputClass:nil];
}

- (void)deleteServiceSpecificCredential:(AWSIamDeleteServiceSpecificCredentialRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteServiceSpecificCredential:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSigningCertificate:(AWSIamDeleteSigningCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteSigningCertificate"
                   outputClass:nil];
}

- (void)deleteSigningCertificate:(AWSIamDeleteSigningCertificateRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSigningCertificate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUser:(AWSIamDeleteUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteUser"
                   outputClass:nil];
}

- (void)deleteUser:(AWSIamDeleteUserRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUser:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUserPermissionsBoundary:(AWSIamDeleteUserPermissionsBoundaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteUserPermissionsBoundary"
                   outputClass:nil];
}

- (void)deleteUserPermissionsBoundary:(AWSIamDeleteUserPermissionsBoundaryRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUserPermissionsBoundary:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteUserPolicy:(AWSIamDeleteUserPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteUserPolicy"
                   outputClass:nil];
}

- (void)deleteUserPolicy:(AWSIamDeleteUserPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteUserPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVirtualMFADevice:(AWSIamDeleteVirtualMFADeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVirtualMFADevice"
                   outputClass:nil];
}

- (void)deleteVirtualMFADevice:(AWSIamDeleteVirtualMFADeviceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVirtualMFADevice:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)detachGroupPolicy:(AWSIamDetachGroupPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachGroupPolicy"
                   outputClass:nil];
}

- (void)detachGroupPolicy:(AWSIamDetachGroupPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self detachGroupPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)detachRolePolicy:(AWSIamDetachRolePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachRolePolicy"
                   outputClass:nil];
}

- (void)detachRolePolicy:(AWSIamDetachRolePolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self detachRolePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)detachUserPolicy:(AWSIamDetachUserPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachUserPolicy"
                   outputClass:nil];
}

- (void)detachUserPolicy:(AWSIamDetachUserPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self detachUserPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)enableMFADevice:(AWSIamEnableMFADeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableMFADevice"
                   outputClass:nil];
}

- (void)enableMFADevice:(AWSIamEnableMFADeviceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self enableMFADevice:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGenerateCredentialReportResponse *> *)generateCredentialReport:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GenerateCredentialReport"
                   outputClass:[AWSIamGenerateCredentialReportResponse class]];
}

- (void)generateCredentialReport:(AWSRequest *)request
     completionHandler:(void (^)(AWSIamGenerateCredentialReportResponse *response, NSError *error))completionHandler {
    [[self generateCredentialReport:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGenerateCredentialReportResponse *> * _Nonnull task) {
        AWSIamGenerateCredentialReportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGenerateOrganizationsAccessReportResponse *> *)generateOrganizationsAccessReport:(AWSIamGenerateOrganizationsAccessReportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GenerateOrganizationsAccessReport"
                   outputClass:[AWSIamGenerateOrganizationsAccessReportResponse class]];
}

- (void)generateOrganizationsAccessReport:(AWSIamGenerateOrganizationsAccessReportRequest *)request
     completionHandler:(void (^)(AWSIamGenerateOrganizationsAccessReportResponse *response, NSError *error))completionHandler {
    [[self generateOrganizationsAccessReport:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGenerateOrganizationsAccessReportResponse *> * _Nonnull task) {
        AWSIamGenerateOrganizationsAccessReportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGenerateServiceLastAccessedDetailsResponse *> *)generateServiceLastAccessedDetails:(AWSIamGenerateServiceLastAccessedDetailsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GenerateServiceLastAccessedDetails"
                   outputClass:[AWSIamGenerateServiceLastAccessedDetailsResponse class]];
}

- (void)generateServiceLastAccessedDetails:(AWSIamGenerateServiceLastAccessedDetailsRequest *)request
     completionHandler:(void (^)(AWSIamGenerateServiceLastAccessedDetailsResponse *response, NSError *error))completionHandler {
    [[self generateServiceLastAccessedDetails:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGenerateServiceLastAccessedDetailsResponse *> * _Nonnull task) {
        AWSIamGenerateServiceLastAccessedDetailsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetAccessKeyLastUsedResponse *> *)getAccessKeyLastUsed:(AWSIamGetAccessKeyLastUsedRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetAccessKeyLastUsed"
                   outputClass:[AWSIamGetAccessKeyLastUsedResponse class]];
}

- (void)getAccessKeyLastUsed:(AWSIamGetAccessKeyLastUsedRequest *)request
     completionHandler:(void (^)(AWSIamGetAccessKeyLastUsedResponse *response, NSError *error))completionHandler {
    [[self getAccessKeyLastUsed:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetAccessKeyLastUsedResponse *> * _Nonnull task) {
        AWSIamGetAccessKeyLastUsedResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetAccountAuthorizationDetailsResponse *> *)getAccountAuthorizationDetails:(AWSIamGetAccountAuthorizationDetailsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetAccountAuthorizationDetails"
                   outputClass:[AWSIamGetAccountAuthorizationDetailsResponse class]];
}

- (void)getAccountAuthorizationDetails:(AWSIamGetAccountAuthorizationDetailsRequest *)request
     completionHandler:(void (^)(AWSIamGetAccountAuthorizationDetailsResponse *response, NSError *error))completionHandler {
    [[self getAccountAuthorizationDetails:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetAccountAuthorizationDetailsResponse *> * _Nonnull task) {
        AWSIamGetAccountAuthorizationDetailsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetAccountPasswordPolicyResponse *> *)getAccountPasswordPolicy:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetAccountPasswordPolicy"
                   outputClass:[AWSIamGetAccountPasswordPolicyResponse class]];
}

- (void)getAccountPasswordPolicy:(AWSRequest *)request
     completionHandler:(void (^)(AWSIamGetAccountPasswordPolicyResponse *response, NSError *error))completionHandler {
    [[self getAccountPasswordPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetAccountPasswordPolicyResponse *> * _Nonnull task) {
        AWSIamGetAccountPasswordPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetAccountSummaryResponse *> *)getAccountSummary:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetAccountSummary"
                   outputClass:[AWSIamGetAccountSummaryResponse class]];
}

- (void)getAccountSummary:(AWSRequest *)request
     completionHandler:(void (^)(AWSIamGetAccountSummaryResponse *response, NSError *error))completionHandler {
    [[self getAccountSummary:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetAccountSummaryResponse *> * _Nonnull task) {
        AWSIamGetAccountSummaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetContextKeysForPolicyResponse *> *)getContextKeysForCustomPolicy:(AWSIamGetContextKeysForCustomPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetContextKeysForCustomPolicy"
                   outputClass:[AWSIamGetContextKeysForPolicyResponse class]];
}

- (void)getContextKeysForCustomPolicy:(AWSIamGetContextKeysForCustomPolicyRequest *)request
     completionHandler:(void (^)(AWSIamGetContextKeysForPolicyResponse *response, NSError *error))completionHandler {
    [[self getContextKeysForCustomPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetContextKeysForPolicyResponse *> * _Nonnull task) {
        AWSIamGetContextKeysForPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetContextKeysForPolicyResponse *> *)getContextKeysForPrincipalPolicy:(AWSIamGetContextKeysForPrincipalPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetContextKeysForPrincipalPolicy"
                   outputClass:[AWSIamGetContextKeysForPolicyResponse class]];
}

- (void)getContextKeysForPrincipalPolicy:(AWSIamGetContextKeysForPrincipalPolicyRequest *)request
     completionHandler:(void (^)(AWSIamGetContextKeysForPolicyResponse *response, NSError *error))completionHandler {
    [[self getContextKeysForPrincipalPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetContextKeysForPolicyResponse *> * _Nonnull task) {
        AWSIamGetContextKeysForPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetCredentialReportResponse *> *)getCredentialReport:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetCredentialReport"
                   outputClass:[AWSIamGetCredentialReportResponse class]];
}

- (void)getCredentialReport:(AWSRequest *)request
     completionHandler:(void (^)(AWSIamGetCredentialReportResponse *response, NSError *error))completionHandler {
    [[self getCredentialReport:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetCredentialReportResponse *> * _Nonnull task) {
        AWSIamGetCredentialReportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetGroupResponse *> *)getGroup:(AWSIamGetGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetGroup"
                   outputClass:[AWSIamGetGroupResponse class]];
}

- (void)getGroup:(AWSIamGetGroupRequest *)request
     completionHandler:(void (^)(AWSIamGetGroupResponse *response, NSError *error))completionHandler {
    [[self getGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetGroupResponse *> * _Nonnull task) {
        AWSIamGetGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetGroupPolicyResponse *> *)getGroupPolicy:(AWSIamGetGroupPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetGroupPolicy"
                   outputClass:[AWSIamGetGroupPolicyResponse class]];
}

- (void)getGroupPolicy:(AWSIamGetGroupPolicyRequest *)request
     completionHandler:(void (^)(AWSIamGetGroupPolicyResponse *response, NSError *error))completionHandler {
    [[self getGroupPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetGroupPolicyResponse *> * _Nonnull task) {
        AWSIamGetGroupPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetInstanceProfileResponse *> *)getInstanceProfile:(AWSIamGetInstanceProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetInstanceProfile"
                   outputClass:[AWSIamGetInstanceProfileResponse class]];
}

- (void)getInstanceProfile:(AWSIamGetInstanceProfileRequest *)request
     completionHandler:(void (^)(AWSIamGetInstanceProfileResponse *response, NSError *error))completionHandler {
    [[self getInstanceProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetInstanceProfileResponse *> * _Nonnull task) {
        AWSIamGetInstanceProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetLoginProfileResponse *> *)getLoginProfile:(AWSIamGetLoginProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetLoginProfile"
                   outputClass:[AWSIamGetLoginProfileResponse class]];
}

- (void)getLoginProfile:(AWSIamGetLoginProfileRequest *)request
     completionHandler:(void (^)(AWSIamGetLoginProfileResponse *response, NSError *error))completionHandler {
    [[self getLoginProfile:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetLoginProfileResponse *> * _Nonnull task) {
        AWSIamGetLoginProfileResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetOpenIDConnectProviderResponse *> *)getOpenIDConnectProvider:(AWSIamGetOpenIDConnectProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetOpenIDConnectProvider"
                   outputClass:[AWSIamGetOpenIDConnectProviderResponse class]];
}

- (void)getOpenIDConnectProvider:(AWSIamGetOpenIDConnectProviderRequest *)request
     completionHandler:(void (^)(AWSIamGetOpenIDConnectProviderResponse *response, NSError *error))completionHandler {
    [[self getOpenIDConnectProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetOpenIDConnectProviderResponse *> * _Nonnull task) {
        AWSIamGetOpenIDConnectProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetOrganizationsAccessReportResponse *> *)getOrganizationsAccessReport:(AWSIamGetOrganizationsAccessReportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetOrganizationsAccessReport"
                   outputClass:[AWSIamGetOrganizationsAccessReportResponse class]];
}

- (void)getOrganizationsAccessReport:(AWSIamGetOrganizationsAccessReportRequest *)request
     completionHandler:(void (^)(AWSIamGetOrganizationsAccessReportResponse *response, NSError *error))completionHandler {
    [[self getOrganizationsAccessReport:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetOrganizationsAccessReportResponse *> * _Nonnull task) {
        AWSIamGetOrganizationsAccessReportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetPolicyResponse *> *)getPolicy:(AWSIamGetPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetPolicy"
                   outputClass:[AWSIamGetPolicyResponse class]];
}

- (void)getPolicy:(AWSIamGetPolicyRequest *)request
     completionHandler:(void (^)(AWSIamGetPolicyResponse *response, NSError *error))completionHandler {
    [[self getPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetPolicyResponse *> * _Nonnull task) {
        AWSIamGetPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetPolicyVersionResponse *> *)getPolicyVersion:(AWSIamGetPolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetPolicyVersion"
                   outputClass:[AWSIamGetPolicyVersionResponse class]];
}

- (void)getPolicyVersion:(AWSIamGetPolicyVersionRequest *)request
     completionHandler:(void (^)(AWSIamGetPolicyVersionResponse *response, NSError *error))completionHandler {
    [[self getPolicyVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetPolicyVersionResponse *> * _Nonnull task) {
        AWSIamGetPolicyVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetRoleResponse *> *)getRole:(AWSIamGetRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetRole"
                   outputClass:[AWSIamGetRoleResponse class]];
}

- (void)getRole:(AWSIamGetRoleRequest *)request
     completionHandler:(void (^)(AWSIamGetRoleResponse *response, NSError *error))completionHandler {
    [[self getRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetRoleResponse *> * _Nonnull task) {
        AWSIamGetRoleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetRolePolicyResponse *> *)getRolePolicy:(AWSIamGetRolePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetRolePolicy"
                   outputClass:[AWSIamGetRolePolicyResponse class]];
}

- (void)getRolePolicy:(AWSIamGetRolePolicyRequest *)request
     completionHandler:(void (^)(AWSIamGetRolePolicyResponse *response, NSError *error))completionHandler {
    [[self getRolePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetRolePolicyResponse *> * _Nonnull task) {
        AWSIamGetRolePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetSAMLProviderResponse *> *)getSAMLProvider:(AWSIamGetSAMLProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSAMLProvider"
                   outputClass:[AWSIamGetSAMLProviderResponse class]];
}

- (void)getSAMLProvider:(AWSIamGetSAMLProviderRequest *)request
     completionHandler:(void (^)(AWSIamGetSAMLProviderResponse *response, NSError *error))completionHandler {
    [[self getSAMLProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetSAMLProviderResponse *> * _Nonnull task) {
        AWSIamGetSAMLProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetSSHPublicKeyResponse *> *)getSSHPublicKey:(AWSIamGetSSHPublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSSHPublicKey"
                   outputClass:[AWSIamGetSSHPublicKeyResponse class]];
}

- (void)getSSHPublicKey:(AWSIamGetSSHPublicKeyRequest *)request
     completionHandler:(void (^)(AWSIamGetSSHPublicKeyResponse *response, NSError *error))completionHandler {
    [[self getSSHPublicKey:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetSSHPublicKeyResponse *> * _Nonnull task) {
        AWSIamGetSSHPublicKeyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetServerCertificateResponse *> *)getServerCertificate:(AWSIamGetServerCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetServerCertificate"
                   outputClass:[AWSIamGetServerCertificateResponse class]];
}

- (void)getServerCertificate:(AWSIamGetServerCertificateRequest *)request
     completionHandler:(void (^)(AWSIamGetServerCertificateResponse *response, NSError *error))completionHandler {
    [[self getServerCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetServerCertificateResponse *> * _Nonnull task) {
        AWSIamGetServerCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetServiceLastAccessedDetailsResponse *> *)getServiceLastAccessedDetails:(AWSIamGetServiceLastAccessedDetailsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetServiceLastAccessedDetails"
                   outputClass:[AWSIamGetServiceLastAccessedDetailsResponse class]];
}

- (void)getServiceLastAccessedDetails:(AWSIamGetServiceLastAccessedDetailsRequest *)request
     completionHandler:(void (^)(AWSIamGetServiceLastAccessedDetailsResponse *response, NSError *error))completionHandler {
    [[self getServiceLastAccessedDetails:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetServiceLastAccessedDetailsResponse *> * _Nonnull task) {
        AWSIamGetServiceLastAccessedDetailsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetServiceLastAccessedDetailsWithEntitiesResponse *> *)getServiceLastAccessedDetailsWithEntities:(AWSIamGetServiceLastAccessedDetailsWithEntitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetServiceLastAccessedDetailsWithEntities"
                   outputClass:[AWSIamGetServiceLastAccessedDetailsWithEntitiesResponse class]];
}

- (void)getServiceLastAccessedDetailsWithEntities:(AWSIamGetServiceLastAccessedDetailsWithEntitiesRequest *)request
     completionHandler:(void (^)(AWSIamGetServiceLastAccessedDetailsWithEntitiesResponse *response, NSError *error))completionHandler {
    [[self getServiceLastAccessedDetailsWithEntities:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetServiceLastAccessedDetailsWithEntitiesResponse *> * _Nonnull task) {
        AWSIamGetServiceLastAccessedDetailsWithEntitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetServiceLinkedRoleDeletionStatusResponse *> *)getServiceLinkedRoleDeletionStatus:(AWSIamGetServiceLinkedRoleDeletionStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetServiceLinkedRoleDeletionStatus"
                   outputClass:[AWSIamGetServiceLinkedRoleDeletionStatusResponse class]];
}

- (void)getServiceLinkedRoleDeletionStatus:(AWSIamGetServiceLinkedRoleDeletionStatusRequest *)request
     completionHandler:(void (^)(AWSIamGetServiceLinkedRoleDeletionStatusResponse *response, NSError *error))completionHandler {
    [[self getServiceLinkedRoleDeletionStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetServiceLinkedRoleDeletionStatusResponse *> * _Nonnull task) {
        AWSIamGetServiceLinkedRoleDeletionStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetUserResponse *> *)getUser:(AWSIamGetUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetUser"
                   outputClass:[AWSIamGetUserResponse class]];
}

- (void)getUser:(AWSIamGetUserRequest *)request
     completionHandler:(void (^)(AWSIamGetUserResponse *response, NSError *error))completionHandler {
    [[self getUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetUserResponse *> * _Nonnull task) {
        AWSIamGetUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamGetUserPolicyResponse *> *)getUserPolicy:(AWSIamGetUserPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetUserPolicy"
                   outputClass:[AWSIamGetUserPolicyResponse class]];
}

- (void)getUserPolicy:(AWSIamGetUserPolicyRequest *)request
     completionHandler:(void (^)(AWSIamGetUserPolicyResponse *response, NSError *error))completionHandler {
    [[self getUserPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamGetUserPolicyResponse *> * _Nonnull task) {
        AWSIamGetUserPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListAccessKeysResponse *> *)listAccessKeys:(AWSIamListAccessKeysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListAccessKeys"
                   outputClass:[AWSIamListAccessKeysResponse class]];
}

- (void)listAccessKeys:(AWSIamListAccessKeysRequest *)request
     completionHandler:(void (^)(AWSIamListAccessKeysResponse *response, NSError *error))completionHandler {
    [[self listAccessKeys:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListAccessKeysResponse *> * _Nonnull task) {
        AWSIamListAccessKeysResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListAccountAliasesResponse *> *)listAccountAliases:(AWSIamListAccountAliasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListAccountAliases"
                   outputClass:[AWSIamListAccountAliasesResponse class]];
}

- (void)listAccountAliases:(AWSIamListAccountAliasesRequest *)request
     completionHandler:(void (^)(AWSIamListAccountAliasesResponse *response, NSError *error))completionHandler {
    [[self listAccountAliases:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListAccountAliasesResponse *> * _Nonnull task) {
        AWSIamListAccountAliasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListAttachedGroupPoliciesResponse *> *)listAttachedGroupPolicies:(AWSIamListAttachedGroupPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListAttachedGroupPolicies"
                   outputClass:[AWSIamListAttachedGroupPoliciesResponse class]];
}

- (void)listAttachedGroupPolicies:(AWSIamListAttachedGroupPoliciesRequest *)request
     completionHandler:(void (^)(AWSIamListAttachedGroupPoliciesResponse *response, NSError *error))completionHandler {
    [[self listAttachedGroupPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListAttachedGroupPoliciesResponse *> * _Nonnull task) {
        AWSIamListAttachedGroupPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListAttachedRolePoliciesResponse *> *)listAttachedRolePolicies:(AWSIamListAttachedRolePoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListAttachedRolePolicies"
                   outputClass:[AWSIamListAttachedRolePoliciesResponse class]];
}

- (void)listAttachedRolePolicies:(AWSIamListAttachedRolePoliciesRequest *)request
     completionHandler:(void (^)(AWSIamListAttachedRolePoliciesResponse *response, NSError *error))completionHandler {
    [[self listAttachedRolePolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListAttachedRolePoliciesResponse *> * _Nonnull task) {
        AWSIamListAttachedRolePoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListAttachedUserPoliciesResponse *> *)listAttachedUserPolicies:(AWSIamListAttachedUserPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListAttachedUserPolicies"
                   outputClass:[AWSIamListAttachedUserPoliciesResponse class]];
}

- (void)listAttachedUserPolicies:(AWSIamListAttachedUserPoliciesRequest *)request
     completionHandler:(void (^)(AWSIamListAttachedUserPoliciesResponse *response, NSError *error))completionHandler {
    [[self listAttachedUserPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListAttachedUserPoliciesResponse *> * _Nonnull task) {
        AWSIamListAttachedUserPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListEntitiesForPolicyResponse *> *)listEntitiesForPolicy:(AWSIamListEntitiesForPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListEntitiesForPolicy"
                   outputClass:[AWSIamListEntitiesForPolicyResponse class]];
}

- (void)listEntitiesForPolicy:(AWSIamListEntitiesForPolicyRequest *)request
     completionHandler:(void (^)(AWSIamListEntitiesForPolicyResponse *response, NSError *error))completionHandler {
    [[self listEntitiesForPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListEntitiesForPolicyResponse *> * _Nonnull task) {
        AWSIamListEntitiesForPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListGroupPoliciesResponse *> *)listGroupPolicies:(AWSIamListGroupPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListGroupPolicies"
                   outputClass:[AWSIamListGroupPoliciesResponse class]];
}

- (void)listGroupPolicies:(AWSIamListGroupPoliciesRequest *)request
     completionHandler:(void (^)(AWSIamListGroupPoliciesResponse *response, NSError *error))completionHandler {
    [[self listGroupPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListGroupPoliciesResponse *> * _Nonnull task) {
        AWSIamListGroupPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListGroupsResponse *> *)listGroups:(AWSIamListGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListGroups"
                   outputClass:[AWSIamListGroupsResponse class]];
}

- (void)listGroups:(AWSIamListGroupsRequest *)request
     completionHandler:(void (^)(AWSIamListGroupsResponse *response, NSError *error))completionHandler {
    [[self listGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListGroupsResponse *> * _Nonnull task) {
        AWSIamListGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListGroupsForUserResponse *> *)listGroupsForUser:(AWSIamListGroupsForUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListGroupsForUser"
                   outputClass:[AWSIamListGroupsForUserResponse class]];
}

- (void)listGroupsForUser:(AWSIamListGroupsForUserRequest *)request
     completionHandler:(void (^)(AWSIamListGroupsForUserResponse *response, NSError *error))completionHandler {
    [[self listGroupsForUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListGroupsForUserResponse *> * _Nonnull task) {
        AWSIamListGroupsForUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListInstanceProfilesResponse *> *)listInstanceProfiles:(AWSIamListInstanceProfilesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListInstanceProfiles"
                   outputClass:[AWSIamListInstanceProfilesResponse class]];
}

- (void)listInstanceProfiles:(AWSIamListInstanceProfilesRequest *)request
     completionHandler:(void (^)(AWSIamListInstanceProfilesResponse *response, NSError *error))completionHandler {
    [[self listInstanceProfiles:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListInstanceProfilesResponse *> * _Nonnull task) {
        AWSIamListInstanceProfilesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListInstanceProfilesForRoleResponse *> *)listInstanceProfilesForRole:(AWSIamListInstanceProfilesForRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListInstanceProfilesForRole"
                   outputClass:[AWSIamListInstanceProfilesForRoleResponse class]];
}

- (void)listInstanceProfilesForRole:(AWSIamListInstanceProfilesForRoleRequest *)request
     completionHandler:(void (^)(AWSIamListInstanceProfilesForRoleResponse *response, NSError *error))completionHandler {
    [[self listInstanceProfilesForRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListInstanceProfilesForRoleResponse *> * _Nonnull task) {
        AWSIamListInstanceProfilesForRoleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListMFADevicesResponse *> *)listMFADevices:(AWSIamListMFADevicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListMFADevices"
                   outputClass:[AWSIamListMFADevicesResponse class]];
}

- (void)listMFADevices:(AWSIamListMFADevicesRequest *)request
     completionHandler:(void (^)(AWSIamListMFADevicesResponse *response, NSError *error))completionHandler {
    [[self listMFADevices:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListMFADevicesResponse *> * _Nonnull task) {
        AWSIamListMFADevicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListOpenIDConnectProvidersResponse *> *)listOpenIDConnectProviders:(AWSIamListOpenIDConnectProvidersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListOpenIDConnectProviders"
                   outputClass:[AWSIamListOpenIDConnectProvidersResponse class]];
}

- (void)listOpenIDConnectProviders:(AWSIamListOpenIDConnectProvidersRequest *)request
     completionHandler:(void (^)(AWSIamListOpenIDConnectProvidersResponse *response, NSError *error))completionHandler {
    [[self listOpenIDConnectProviders:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListOpenIDConnectProvidersResponse *> * _Nonnull task) {
        AWSIamListOpenIDConnectProvidersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListPoliciesResponse *> *)listPolicies:(AWSIamListPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListPolicies"
                   outputClass:[AWSIamListPoliciesResponse class]];
}

- (void)listPolicies:(AWSIamListPoliciesRequest *)request
     completionHandler:(void (^)(AWSIamListPoliciesResponse *response, NSError *error))completionHandler {
    [[self listPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListPoliciesResponse *> * _Nonnull task) {
        AWSIamListPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListPoliciesGrantingServiceAccessResponse *> *)listPoliciesGrantingServiceAccess:(AWSIamListPoliciesGrantingServiceAccessRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListPoliciesGrantingServiceAccess"
                   outputClass:[AWSIamListPoliciesGrantingServiceAccessResponse class]];
}

- (void)listPoliciesGrantingServiceAccess:(AWSIamListPoliciesGrantingServiceAccessRequest *)request
     completionHandler:(void (^)(AWSIamListPoliciesGrantingServiceAccessResponse *response, NSError *error))completionHandler {
    [[self listPoliciesGrantingServiceAccess:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListPoliciesGrantingServiceAccessResponse *> * _Nonnull task) {
        AWSIamListPoliciesGrantingServiceAccessResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListPolicyVersionsResponse *> *)listPolicyVersions:(AWSIamListPolicyVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListPolicyVersions"
                   outputClass:[AWSIamListPolicyVersionsResponse class]];
}

- (void)listPolicyVersions:(AWSIamListPolicyVersionsRequest *)request
     completionHandler:(void (^)(AWSIamListPolicyVersionsResponse *response, NSError *error))completionHandler {
    [[self listPolicyVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListPolicyVersionsResponse *> * _Nonnull task) {
        AWSIamListPolicyVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListRolePoliciesResponse *> *)listRolePolicies:(AWSIamListRolePoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListRolePolicies"
                   outputClass:[AWSIamListRolePoliciesResponse class]];
}

- (void)listRolePolicies:(AWSIamListRolePoliciesRequest *)request
     completionHandler:(void (^)(AWSIamListRolePoliciesResponse *response, NSError *error))completionHandler {
    [[self listRolePolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListRolePoliciesResponse *> * _Nonnull task) {
        AWSIamListRolePoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListRoleTagsResponse *> *)listRoleTags:(AWSIamListRoleTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListRoleTags"
                   outputClass:[AWSIamListRoleTagsResponse class]];
}

- (void)listRoleTags:(AWSIamListRoleTagsRequest *)request
     completionHandler:(void (^)(AWSIamListRoleTagsResponse *response, NSError *error))completionHandler {
    [[self listRoleTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListRoleTagsResponse *> * _Nonnull task) {
        AWSIamListRoleTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListRolesResponse *> *)listRoles:(AWSIamListRolesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListRoles"
                   outputClass:[AWSIamListRolesResponse class]];
}

- (void)listRoles:(AWSIamListRolesRequest *)request
     completionHandler:(void (^)(AWSIamListRolesResponse *response, NSError *error))completionHandler {
    [[self listRoles:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListRolesResponse *> * _Nonnull task) {
        AWSIamListRolesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListSAMLProvidersResponse *> *)listSAMLProviders:(AWSIamListSAMLProvidersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListSAMLProviders"
                   outputClass:[AWSIamListSAMLProvidersResponse class]];
}

- (void)listSAMLProviders:(AWSIamListSAMLProvidersRequest *)request
     completionHandler:(void (^)(AWSIamListSAMLProvidersResponse *response, NSError *error))completionHandler {
    [[self listSAMLProviders:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListSAMLProvidersResponse *> * _Nonnull task) {
        AWSIamListSAMLProvidersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListSSHPublicKeysResponse *> *)listSSHPublicKeys:(AWSIamListSSHPublicKeysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListSSHPublicKeys"
                   outputClass:[AWSIamListSSHPublicKeysResponse class]];
}

- (void)listSSHPublicKeys:(AWSIamListSSHPublicKeysRequest *)request
     completionHandler:(void (^)(AWSIamListSSHPublicKeysResponse *response, NSError *error))completionHandler {
    [[self listSSHPublicKeys:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListSSHPublicKeysResponse *> * _Nonnull task) {
        AWSIamListSSHPublicKeysResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListServerCertificatesResponse *> *)listServerCertificates:(AWSIamListServerCertificatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListServerCertificates"
                   outputClass:[AWSIamListServerCertificatesResponse class]];
}

- (void)listServerCertificates:(AWSIamListServerCertificatesRequest *)request
     completionHandler:(void (^)(AWSIamListServerCertificatesResponse *response, NSError *error))completionHandler {
    [[self listServerCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListServerCertificatesResponse *> * _Nonnull task) {
        AWSIamListServerCertificatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListServiceSpecificCredentialsResponse *> *)listServiceSpecificCredentials:(AWSIamListServiceSpecificCredentialsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListServiceSpecificCredentials"
                   outputClass:[AWSIamListServiceSpecificCredentialsResponse class]];
}

- (void)listServiceSpecificCredentials:(AWSIamListServiceSpecificCredentialsRequest *)request
     completionHandler:(void (^)(AWSIamListServiceSpecificCredentialsResponse *response, NSError *error))completionHandler {
    [[self listServiceSpecificCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListServiceSpecificCredentialsResponse *> * _Nonnull task) {
        AWSIamListServiceSpecificCredentialsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListSigningCertificatesResponse *> *)listSigningCertificates:(AWSIamListSigningCertificatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListSigningCertificates"
                   outputClass:[AWSIamListSigningCertificatesResponse class]];
}

- (void)listSigningCertificates:(AWSIamListSigningCertificatesRequest *)request
     completionHandler:(void (^)(AWSIamListSigningCertificatesResponse *response, NSError *error))completionHandler {
    [[self listSigningCertificates:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListSigningCertificatesResponse *> * _Nonnull task) {
        AWSIamListSigningCertificatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListUserPoliciesResponse *> *)listUserPolicies:(AWSIamListUserPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListUserPolicies"
                   outputClass:[AWSIamListUserPoliciesResponse class]];
}

- (void)listUserPolicies:(AWSIamListUserPoliciesRequest *)request
     completionHandler:(void (^)(AWSIamListUserPoliciesResponse *response, NSError *error))completionHandler {
    [[self listUserPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListUserPoliciesResponse *> * _Nonnull task) {
        AWSIamListUserPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListUserTagsResponse *> *)listUserTags:(AWSIamListUserTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListUserTags"
                   outputClass:[AWSIamListUserTagsResponse class]];
}

- (void)listUserTags:(AWSIamListUserTagsRequest *)request
     completionHandler:(void (^)(AWSIamListUserTagsResponse *response, NSError *error))completionHandler {
    [[self listUserTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListUserTagsResponse *> * _Nonnull task) {
        AWSIamListUserTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListUsersResponse *> *)listUsers:(AWSIamListUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListUsers"
                   outputClass:[AWSIamListUsersResponse class]];
}

- (void)listUsers:(AWSIamListUsersRequest *)request
     completionHandler:(void (^)(AWSIamListUsersResponse *response, NSError *error))completionHandler {
    [[self listUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListUsersResponse *> * _Nonnull task) {
        AWSIamListUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamListVirtualMFADevicesResponse *> *)listVirtualMFADevices:(AWSIamListVirtualMFADevicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListVirtualMFADevices"
                   outputClass:[AWSIamListVirtualMFADevicesResponse class]];
}

- (void)listVirtualMFADevices:(AWSIamListVirtualMFADevicesRequest *)request
     completionHandler:(void (^)(AWSIamListVirtualMFADevicesResponse *response, NSError *error))completionHandler {
    [[self listVirtualMFADevices:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamListVirtualMFADevicesResponse *> * _Nonnull task) {
        AWSIamListVirtualMFADevicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putGroupPolicy:(AWSIamPutGroupPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutGroupPolicy"
                   outputClass:nil];
}

- (void)putGroupPolicy:(AWSIamPutGroupPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putGroupPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putRolePermissionsBoundary:(AWSIamPutRolePermissionsBoundaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutRolePermissionsBoundary"
                   outputClass:nil];
}

- (void)putRolePermissionsBoundary:(AWSIamPutRolePermissionsBoundaryRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putRolePermissionsBoundary:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putRolePolicy:(AWSIamPutRolePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutRolePolicy"
                   outputClass:nil];
}

- (void)putRolePolicy:(AWSIamPutRolePolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putRolePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putUserPermissionsBoundary:(AWSIamPutUserPermissionsBoundaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutUserPermissionsBoundary"
                   outputClass:nil];
}

- (void)putUserPermissionsBoundary:(AWSIamPutUserPermissionsBoundaryRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putUserPermissionsBoundary:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putUserPolicy:(AWSIamPutUserPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutUserPolicy"
                   outputClass:nil];
}

- (void)putUserPolicy:(AWSIamPutUserPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putUserPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)removeClientIDFromOpenIDConnectProvider:(AWSIamRemoveClientIDFromOpenIDConnectProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveClientIDFromOpenIDConnectProvider"
                   outputClass:nil];
}

- (void)removeClientIDFromOpenIDConnectProvider:(AWSIamRemoveClientIDFromOpenIDConnectProviderRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeClientIDFromOpenIDConnectProvider:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)removeRoleFromInstanceProfile:(AWSIamRemoveRoleFromInstanceProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveRoleFromInstanceProfile"
                   outputClass:nil];
}

- (void)removeRoleFromInstanceProfile:(AWSIamRemoveRoleFromInstanceProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeRoleFromInstanceProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)removeUserFromGroup:(AWSIamRemoveUserFromGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemoveUserFromGroup"
                   outputClass:nil];
}

- (void)removeUserFromGroup:(AWSIamRemoveUserFromGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeUserFromGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamResetServiceSpecificCredentialResponse *> *)resetServiceSpecificCredential:(AWSIamResetServiceSpecificCredentialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResetServiceSpecificCredential"
                   outputClass:[AWSIamResetServiceSpecificCredentialResponse class]];
}

- (void)resetServiceSpecificCredential:(AWSIamResetServiceSpecificCredentialRequest *)request
     completionHandler:(void (^)(AWSIamResetServiceSpecificCredentialResponse *response, NSError *error))completionHandler {
    [[self resetServiceSpecificCredential:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamResetServiceSpecificCredentialResponse *> * _Nonnull task) {
        AWSIamResetServiceSpecificCredentialResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)resyncMFADevice:(AWSIamResyncMFADeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResyncMFADevice"
                   outputClass:nil];
}

- (void)resyncMFADevice:(AWSIamResyncMFADeviceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self resyncMFADevice:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)setDefaultPolicyVersion:(AWSIamSetDefaultPolicyVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetDefaultPolicyVersion"
                   outputClass:nil];
}

- (void)setDefaultPolicyVersion:(AWSIamSetDefaultPolicyVersionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setDefaultPolicyVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)setSecurityTokenServicePreferences:(AWSIamSetSecurityTokenServicePreferencesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetSecurityTokenServicePreferences"
                   outputClass:nil];
}

- (void)setSecurityTokenServicePreferences:(AWSIamSetSecurityTokenServicePreferencesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setSecurityTokenServicePreferences:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamSimulatePolicyResponse *> *)simulateCustomPolicy:(AWSIamSimulateCustomPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SimulateCustomPolicy"
                   outputClass:[AWSIamSimulatePolicyResponse class]];
}

- (void)simulateCustomPolicy:(AWSIamSimulateCustomPolicyRequest *)request
     completionHandler:(void (^)(AWSIamSimulatePolicyResponse *response, NSError *error))completionHandler {
    [[self simulateCustomPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamSimulatePolicyResponse *> * _Nonnull task) {
        AWSIamSimulatePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamSimulatePolicyResponse *> *)simulatePrincipalPolicy:(AWSIamSimulatePrincipalPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SimulatePrincipalPolicy"
                   outputClass:[AWSIamSimulatePolicyResponse class]];
}

- (void)simulatePrincipalPolicy:(AWSIamSimulatePrincipalPolicyRequest *)request
     completionHandler:(void (^)(AWSIamSimulatePolicyResponse *response, NSError *error))completionHandler {
    [[self simulatePrincipalPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamSimulatePolicyResponse *> * _Nonnull task) {
        AWSIamSimulatePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagRole:(AWSIamTagRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TagRole"
                   outputClass:nil];
}

- (void)tagRole:(AWSIamTagRoleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagRole:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)tagUser:(AWSIamTagUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TagUser"
                   outputClass:nil];
}

- (void)tagUser:(AWSIamTagUserRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagUser:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagRole:(AWSIamUntagRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UntagRole"
                   outputClass:nil];
}

- (void)untagRole:(AWSIamUntagRoleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagRole:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagUser:(AWSIamUntagUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UntagUser"
                   outputClass:nil];
}

- (void)untagUser:(AWSIamUntagUserRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagUser:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateAccessKey:(AWSIamUpdateAccessKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateAccessKey"
                   outputClass:nil];
}

- (void)updateAccessKey:(AWSIamUpdateAccessKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateAccessKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateAccountPasswordPolicy:(AWSIamUpdateAccountPasswordPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateAccountPasswordPolicy"
                   outputClass:nil];
}

- (void)updateAccountPasswordPolicy:(AWSIamUpdateAccountPasswordPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateAccountPasswordPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateAssumeRolePolicy:(AWSIamUpdateAssumeRolePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateAssumeRolePolicy"
                   outputClass:nil];
}

- (void)updateAssumeRolePolicy:(AWSIamUpdateAssumeRolePolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateAssumeRolePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateGroup:(AWSIamUpdateGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateGroup"
                   outputClass:nil];
}

- (void)updateGroup:(AWSIamUpdateGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateLoginProfile:(AWSIamUpdateLoginProfileRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateLoginProfile"
                   outputClass:nil];
}

- (void)updateLoginProfile:(AWSIamUpdateLoginProfileRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateLoginProfile:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateOpenIDConnectProviderThumbprint:(AWSIamUpdateOpenIDConnectProviderThumbprintRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateOpenIDConnectProviderThumbprint"
                   outputClass:nil];
}

- (void)updateOpenIDConnectProviderThumbprint:(AWSIamUpdateOpenIDConnectProviderThumbprintRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateOpenIDConnectProviderThumbprint:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamUpdateRoleResponse *> *)updateRole:(AWSIamUpdateRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateRole"
                   outputClass:[AWSIamUpdateRoleResponse class]];
}

- (void)updateRole:(AWSIamUpdateRoleRequest *)request
     completionHandler:(void (^)(AWSIamUpdateRoleResponse *response, NSError *error))completionHandler {
    [[self updateRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamUpdateRoleResponse *> * _Nonnull task) {
        AWSIamUpdateRoleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamUpdateRoleDescriptionResponse *> *)updateRoleDescription:(AWSIamUpdateRoleDescriptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateRoleDescription"
                   outputClass:[AWSIamUpdateRoleDescriptionResponse class]];
}

- (void)updateRoleDescription:(AWSIamUpdateRoleDescriptionRequest *)request
     completionHandler:(void (^)(AWSIamUpdateRoleDescriptionResponse *response, NSError *error))completionHandler {
    [[self updateRoleDescription:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamUpdateRoleDescriptionResponse *> * _Nonnull task) {
        AWSIamUpdateRoleDescriptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamUpdateSAMLProviderResponse *> *)updateSAMLProvider:(AWSIamUpdateSAMLProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateSAMLProvider"
                   outputClass:[AWSIamUpdateSAMLProviderResponse class]];
}

- (void)updateSAMLProvider:(AWSIamUpdateSAMLProviderRequest *)request
     completionHandler:(void (^)(AWSIamUpdateSAMLProviderResponse *response, NSError *error))completionHandler {
    [[self updateSAMLProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamUpdateSAMLProviderResponse *> * _Nonnull task) {
        AWSIamUpdateSAMLProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateSSHPublicKey:(AWSIamUpdateSSHPublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateSSHPublicKey"
                   outputClass:nil];
}

- (void)updateSSHPublicKey:(AWSIamUpdateSSHPublicKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateSSHPublicKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateServerCertificate:(AWSIamUpdateServerCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateServerCertificate"
                   outputClass:nil];
}

- (void)updateServerCertificate:(AWSIamUpdateServerCertificateRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateServerCertificate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateServiceSpecificCredential:(AWSIamUpdateServiceSpecificCredentialRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateServiceSpecificCredential"
                   outputClass:nil];
}

- (void)updateServiceSpecificCredential:(AWSIamUpdateServiceSpecificCredentialRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateServiceSpecificCredential:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateSigningCertificate:(AWSIamUpdateSigningCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateSigningCertificate"
                   outputClass:nil];
}

- (void)updateSigningCertificate:(AWSIamUpdateSigningCertificateRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateSigningCertificate:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateUser:(AWSIamUpdateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateUser"
                   outputClass:nil];
}

- (void)updateUser:(AWSIamUpdateUserRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateUser:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamUploadSSHPublicKeyResponse *> *)uploadSSHPublicKey:(AWSIamUploadSSHPublicKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UploadSSHPublicKey"
                   outputClass:[AWSIamUploadSSHPublicKeyResponse class]];
}

- (void)uploadSSHPublicKey:(AWSIamUploadSSHPublicKeyRequest *)request
     completionHandler:(void (^)(AWSIamUploadSSHPublicKeyResponse *response, NSError *error))completionHandler {
    [[self uploadSSHPublicKey:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamUploadSSHPublicKeyResponse *> * _Nonnull task) {
        AWSIamUploadSSHPublicKeyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamUploadServerCertificateResponse *> *)uploadServerCertificate:(AWSIamUploadServerCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UploadServerCertificate"
                   outputClass:[AWSIamUploadServerCertificateResponse class]];
}

- (void)uploadServerCertificate:(AWSIamUploadServerCertificateRequest *)request
     completionHandler:(void (^)(AWSIamUploadServerCertificateResponse *response, NSError *error))completionHandler {
    [[self uploadServerCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamUploadServerCertificateResponse *> * _Nonnull task) {
        AWSIamUploadServerCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSIamUploadSigningCertificateResponse *> *)uploadSigningCertificate:(AWSIamUploadSigningCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UploadSigningCertificate"
                   outputClass:[AWSIamUploadSigningCertificateResponse class]];
}

- (void)uploadSigningCertificate:(AWSIamUploadSigningCertificateRequest *)request
     completionHandler:(void (^)(AWSIamUploadSigningCertificateResponse *response, NSError *error))completionHandler {
    [[self uploadSigningCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSIamUploadSigningCertificateResponse *> * _Nonnull task) {
        AWSIamUploadSigningCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
