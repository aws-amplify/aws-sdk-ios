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

#import "AWSOrganizationsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSOrganizationsResources.h"

static NSString *const AWSInfoOrganizations = @"Organizations";
NSString *const AWSOrganizationsSDKVersion = @"2.13.4";


@interface AWSOrganizationsResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSOrganizationsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AWSOrganizationsNotInUseException" : @(AWSOrganizationsErrorAWSOrganizationsNotInUse),
                            @"AccessDeniedException" : @(AWSOrganizationsErrorAccessDenied),
                            @"AccessDeniedForDependencyException" : @(AWSOrganizationsErrorAccessDeniedForDependency),
                            @"AccountAlreadyRegisteredException" : @(AWSOrganizationsErrorAccountAlreadyRegistered),
                            @"AccountNotFoundException" : @(AWSOrganizationsErrorAccountNotFound),
                            @"AccountNotRegisteredException" : @(AWSOrganizationsErrorAccountNotRegistered),
                            @"AccountOwnerNotVerifiedException" : @(AWSOrganizationsErrorAccountOwnerNotVerified),
                            @"AlreadyInOrganizationException" : @(AWSOrganizationsErrorAlreadyInOrganization),
                            @"ChildNotFoundException" : @(AWSOrganizationsErrorChildNotFound),
                            @"ConcurrentModificationException" : @(AWSOrganizationsErrorConcurrentModification),
                            @"ConstraintViolationException" : @(AWSOrganizationsErrorConstraintViolation),
                            @"CreateAccountStatusNotFoundException" : @(AWSOrganizationsErrorCreateAccountStatusNotFound),
                            @"DestinationParentNotFoundException" : @(AWSOrganizationsErrorDestinationParentNotFound),
                            @"DuplicateAccountException" : @(AWSOrganizationsErrorDuplicateAccount),
                            @"DuplicateHandshakeException" : @(AWSOrganizationsErrorDuplicateHandshake),
                            @"DuplicateOrganizationalUnitException" : @(AWSOrganizationsErrorDuplicateOrganizationalUnit),
                            @"DuplicatePolicyException" : @(AWSOrganizationsErrorDuplicatePolicy),
                            @"DuplicatePolicyAttachmentException" : @(AWSOrganizationsErrorDuplicatePolicyAttachment),
                            @"EffectivePolicyNotFoundException" : @(AWSOrganizationsErrorEffectivePolicyNotFound),
                            @"FinalizingOrganizationException" : @(AWSOrganizationsErrorFinalizingOrganization),
                            @"HandshakeAlreadyInStateException" : @(AWSOrganizationsErrorHandshakeAlreadyInState),
                            @"HandshakeConstraintViolationException" : @(AWSOrganizationsErrorHandshakeConstraintViolation),
                            @"HandshakeNotFoundException" : @(AWSOrganizationsErrorHandshakeNotFound),
                            @"InvalidHandshakeTransitionException" : @(AWSOrganizationsErrorInvalidHandshakeTransition),
                            @"InvalidInputException" : @(AWSOrganizationsErrorInvalidInput),
                            @"MalformedPolicyDocumentException" : @(AWSOrganizationsErrorMalformedPolicyDocument),
                            @"MasterCannotLeaveOrganizationException" : @(AWSOrganizationsErrorMasterCannotLeaveOrganization),
                            @"OrganizationNotEmptyException" : @(AWSOrganizationsErrorOrganizationNotEmpty),
                            @"OrganizationalUnitNotEmptyException" : @(AWSOrganizationsErrorOrganizationalUnitNotEmpty),
                            @"OrganizationalUnitNotFoundException" : @(AWSOrganizationsErrorOrganizationalUnitNotFound),
                            @"ParentNotFoundException" : @(AWSOrganizationsErrorParentNotFound),
                            @"PolicyChangesInProgressException" : @(AWSOrganizationsErrorPolicyChangesInProgress),
                            @"PolicyInUseException" : @(AWSOrganizationsErrorPolicyInUse),
                            @"PolicyNotAttachedException" : @(AWSOrganizationsErrorPolicyNotAttached),
                            @"PolicyNotFoundException" : @(AWSOrganizationsErrorPolicyNotFound),
                            @"PolicyTypeAlreadyEnabledException" : @(AWSOrganizationsErrorPolicyTypeAlreadyEnabled),
                            @"PolicyTypeNotAvailableForOrganizationException" : @(AWSOrganizationsErrorPolicyTypeNotAvailableForOrganization),
                            @"PolicyTypeNotEnabledException" : @(AWSOrganizationsErrorPolicyTypeNotEnabled),
                            @"RootNotFoundException" : @(AWSOrganizationsErrorRootNotFound),
                            @"ServiceException" : @(AWSOrganizationsErrorService),
                            @"SourceParentNotFoundException" : @(AWSOrganizationsErrorSourceParentNotFound),
                            @"TargetNotFoundException" : @(AWSOrganizationsErrorTargetNotFound),
                            @"TooManyRequestsException" : @(AWSOrganizationsErrorTooManyRequests),
                            @"UnsupportedAPIEndpointException" : @(AWSOrganizationsErrorUnsupportedAPIEndpoint),
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
	                *error = [NSError errorWithDomain:AWSOrganizationsErrorDomain
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
        *error = [NSError errorWithDomain:AWSOrganizationsErrorDomain
                                     code:AWSOrganizationsErrorUnknown
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

@interface AWSOrganizationsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSOrganizationsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSOrganizations()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSOrganizations

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSOrganizationsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSOrganizations versions need to match. Check your SDK installation. AWSCore: %@ AWSOrganizations: %@", AWSiOSSDKVersion, AWSOrganizationsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultOrganizations {
    static AWSOrganizations *_defaultOrganizations = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoOrganizations];
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
        _defaultOrganizations = [[AWSOrganizations alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultOrganizations;
}

+ (void)registerOrganizationsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSOrganizations alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)OrganizationsForKey:(NSString *)key {
    @synchronized(self) {
        AWSOrganizations *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoOrganizations
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSOrganizations registerOrganizationsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeOrganizationsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultOrganizations` or `+ OrganizationsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceOrganizations
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceOrganizations];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSOrganizationsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSOrganizationsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSOrganizationsResponseSerializer alloc] initWithJSONDefinition:[[AWSOrganizationsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSOrganizationsAcceptHandshakeResponse *> *)acceptHandshake:(AWSOrganizationsAcceptHandshakeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"AcceptHandshake"
                   outputClass:[AWSOrganizationsAcceptHandshakeResponse class]];
}

- (void)acceptHandshake:(AWSOrganizationsAcceptHandshakeRequest *)request
     completionHandler:(void (^)(AWSOrganizationsAcceptHandshakeResponse *response, NSError *error))completionHandler {
    [[self acceptHandshake:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsAcceptHandshakeResponse *> * _Nonnull task) {
        AWSOrganizationsAcceptHandshakeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)attachPolicy:(AWSOrganizationsAttachPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"AttachPolicy"
                   outputClass:nil];
}

- (void)attachPolicy:(AWSOrganizationsAttachPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self attachPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsCancelHandshakeResponse *> *)cancelHandshake:(AWSOrganizationsCancelHandshakeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"CancelHandshake"
                   outputClass:[AWSOrganizationsCancelHandshakeResponse class]];
}

- (void)cancelHandshake:(AWSOrganizationsCancelHandshakeRequest *)request
     completionHandler:(void (^)(AWSOrganizationsCancelHandshakeResponse *response, NSError *error))completionHandler {
    [[self cancelHandshake:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsCancelHandshakeResponse *> * _Nonnull task) {
        AWSOrganizationsCancelHandshakeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsCreateAccountResponse *> *)createAccount:(AWSOrganizationsCreateAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"CreateAccount"
                   outputClass:[AWSOrganizationsCreateAccountResponse class]];
}

- (void)createAccount:(AWSOrganizationsCreateAccountRequest *)request
     completionHandler:(void (^)(AWSOrganizationsCreateAccountResponse *response, NSError *error))completionHandler {
    [[self createAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsCreateAccountResponse *> * _Nonnull task) {
        AWSOrganizationsCreateAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsCreateGovCloudAccountResponse *> *)createGovCloudAccount:(AWSOrganizationsCreateGovCloudAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"CreateGovCloudAccount"
                   outputClass:[AWSOrganizationsCreateGovCloudAccountResponse class]];
}

- (void)createGovCloudAccount:(AWSOrganizationsCreateGovCloudAccountRequest *)request
     completionHandler:(void (^)(AWSOrganizationsCreateGovCloudAccountResponse *response, NSError *error))completionHandler {
    [[self createGovCloudAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsCreateGovCloudAccountResponse *> * _Nonnull task) {
        AWSOrganizationsCreateGovCloudAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsCreateOrganizationResponse *> *)createOrganization:(AWSOrganizationsCreateOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"CreateOrganization"
                   outputClass:[AWSOrganizationsCreateOrganizationResponse class]];
}

- (void)createOrganization:(AWSOrganizationsCreateOrganizationRequest *)request
     completionHandler:(void (^)(AWSOrganizationsCreateOrganizationResponse *response, NSError *error))completionHandler {
    [[self createOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsCreateOrganizationResponse *> * _Nonnull task) {
        AWSOrganizationsCreateOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsCreateOrganizationalUnitResponse *> *)createOrganizationalUnit:(AWSOrganizationsCreateOrganizationalUnitRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"CreateOrganizationalUnit"
                   outputClass:[AWSOrganizationsCreateOrganizationalUnitResponse class]];
}

- (void)createOrganizationalUnit:(AWSOrganizationsCreateOrganizationalUnitRequest *)request
     completionHandler:(void (^)(AWSOrganizationsCreateOrganizationalUnitResponse *response, NSError *error))completionHandler {
    [[self createOrganizationalUnit:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsCreateOrganizationalUnitResponse *> * _Nonnull task) {
        AWSOrganizationsCreateOrganizationalUnitResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsCreatePolicyResponse *> *)createPolicy:(AWSOrganizationsCreatePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"CreatePolicy"
                   outputClass:[AWSOrganizationsCreatePolicyResponse class]];
}

- (void)createPolicy:(AWSOrganizationsCreatePolicyRequest *)request
     completionHandler:(void (^)(AWSOrganizationsCreatePolicyResponse *response, NSError *error))completionHandler {
    [[self createPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsCreatePolicyResponse *> * _Nonnull task) {
        AWSOrganizationsCreatePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsDeclineHandshakeResponse *> *)declineHandshake:(AWSOrganizationsDeclineHandshakeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DeclineHandshake"
                   outputClass:[AWSOrganizationsDeclineHandshakeResponse class]];
}

- (void)declineHandshake:(AWSOrganizationsDeclineHandshakeRequest *)request
     completionHandler:(void (^)(AWSOrganizationsDeclineHandshakeResponse *response, NSError *error))completionHandler {
    [[self declineHandshake:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsDeclineHandshakeResponse *> * _Nonnull task) {
        AWSOrganizationsDeclineHandshakeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteOrganization:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DeleteOrganization"
                   outputClass:nil];
}

- (void)deleteOrganization:(AWSRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteOrganization:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteOrganizationalUnit:(AWSOrganizationsDeleteOrganizationalUnitRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DeleteOrganizationalUnit"
                   outputClass:nil];
}

- (void)deleteOrganizationalUnit:(AWSOrganizationsDeleteOrganizationalUnitRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteOrganizationalUnit:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePolicy:(AWSOrganizationsDeletePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DeletePolicy"
                   outputClass:nil];
}

- (void)deletePolicy:(AWSOrganizationsDeletePolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deregisterDelegatedAdministrator:(AWSOrganizationsDeregisterDelegatedAdministratorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DeregisterDelegatedAdministrator"
                   outputClass:nil];
}

- (void)deregisterDelegatedAdministrator:(AWSOrganizationsDeregisterDelegatedAdministratorRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deregisterDelegatedAdministrator:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsDescribeAccountResponse *> *)describeAccount:(AWSOrganizationsDescribeAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DescribeAccount"
                   outputClass:[AWSOrganizationsDescribeAccountResponse class]];
}

- (void)describeAccount:(AWSOrganizationsDescribeAccountRequest *)request
     completionHandler:(void (^)(AWSOrganizationsDescribeAccountResponse *response, NSError *error))completionHandler {
    [[self describeAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsDescribeAccountResponse *> * _Nonnull task) {
        AWSOrganizationsDescribeAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsDescribeCreateAccountStatusResponse *> *)describeCreateAccountStatus:(AWSOrganizationsDescribeCreateAccountStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DescribeCreateAccountStatus"
                   outputClass:[AWSOrganizationsDescribeCreateAccountStatusResponse class]];
}

- (void)describeCreateAccountStatus:(AWSOrganizationsDescribeCreateAccountStatusRequest *)request
     completionHandler:(void (^)(AWSOrganizationsDescribeCreateAccountStatusResponse *response, NSError *error))completionHandler {
    [[self describeCreateAccountStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsDescribeCreateAccountStatusResponse *> * _Nonnull task) {
        AWSOrganizationsDescribeCreateAccountStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsDescribeEffectivePolicyResponse *> *)describeEffectivePolicy:(AWSOrganizationsDescribeEffectivePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DescribeEffectivePolicy"
                   outputClass:[AWSOrganizationsDescribeEffectivePolicyResponse class]];
}

- (void)describeEffectivePolicy:(AWSOrganizationsDescribeEffectivePolicyRequest *)request
     completionHandler:(void (^)(AWSOrganizationsDescribeEffectivePolicyResponse *response, NSError *error))completionHandler {
    [[self describeEffectivePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsDescribeEffectivePolicyResponse *> * _Nonnull task) {
        AWSOrganizationsDescribeEffectivePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsDescribeHandshakeResponse *> *)describeHandshake:(AWSOrganizationsDescribeHandshakeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DescribeHandshake"
                   outputClass:[AWSOrganizationsDescribeHandshakeResponse class]];
}

- (void)describeHandshake:(AWSOrganizationsDescribeHandshakeRequest *)request
     completionHandler:(void (^)(AWSOrganizationsDescribeHandshakeResponse *response, NSError *error))completionHandler {
    [[self describeHandshake:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsDescribeHandshakeResponse *> * _Nonnull task) {
        AWSOrganizationsDescribeHandshakeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsDescribeOrganizationResponse *> *)describeOrganization:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DescribeOrganization"
                   outputClass:[AWSOrganizationsDescribeOrganizationResponse class]];
}

- (void)describeOrganization:(AWSRequest *)request
     completionHandler:(void (^)(AWSOrganizationsDescribeOrganizationResponse *response, NSError *error))completionHandler {
    [[self describeOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsDescribeOrganizationResponse *> * _Nonnull task) {
        AWSOrganizationsDescribeOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsDescribeOrganizationalUnitResponse *> *)describeOrganizationalUnit:(AWSOrganizationsDescribeOrganizationalUnitRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DescribeOrganizationalUnit"
                   outputClass:[AWSOrganizationsDescribeOrganizationalUnitResponse class]];
}

- (void)describeOrganizationalUnit:(AWSOrganizationsDescribeOrganizationalUnitRequest *)request
     completionHandler:(void (^)(AWSOrganizationsDescribeOrganizationalUnitResponse *response, NSError *error))completionHandler {
    [[self describeOrganizationalUnit:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsDescribeOrganizationalUnitResponse *> * _Nonnull task) {
        AWSOrganizationsDescribeOrganizationalUnitResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsDescribePolicyResponse *> *)describePolicy:(AWSOrganizationsDescribePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DescribePolicy"
                   outputClass:[AWSOrganizationsDescribePolicyResponse class]];
}

- (void)describePolicy:(AWSOrganizationsDescribePolicyRequest *)request
     completionHandler:(void (^)(AWSOrganizationsDescribePolicyResponse *response, NSError *error))completionHandler {
    [[self describePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsDescribePolicyResponse *> * _Nonnull task) {
        AWSOrganizationsDescribePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)detachPolicy:(AWSOrganizationsDetachPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DetachPolicy"
                   outputClass:nil];
}

- (void)detachPolicy:(AWSOrganizationsDetachPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self detachPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disableAWSServiceAccess:(AWSOrganizationsDisableAWSServiceAccessRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DisableAWSServiceAccess"
                   outputClass:nil];
}

- (void)disableAWSServiceAccess:(AWSOrganizationsDisableAWSServiceAccessRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disableAWSServiceAccess:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsDisablePolicyTypeResponse *> *)disablePolicyType:(AWSOrganizationsDisablePolicyTypeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"DisablePolicyType"
                   outputClass:[AWSOrganizationsDisablePolicyTypeResponse class]];
}

- (void)disablePolicyType:(AWSOrganizationsDisablePolicyTypeRequest *)request
     completionHandler:(void (^)(AWSOrganizationsDisablePolicyTypeResponse *response, NSError *error))completionHandler {
    [[self disablePolicyType:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsDisablePolicyTypeResponse *> * _Nonnull task) {
        AWSOrganizationsDisablePolicyTypeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)enableAWSServiceAccess:(AWSOrganizationsEnableAWSServiceAccessRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"EnableAWSServiceAccess"
                   outputClass:nil];
}

- (void)enableAWSServiceAccess:(AWSOrganizationsEnableAWSServiceAccessRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self enableAWSServiceAccess:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsEnableAllFeaturesResponse *> *)enableAllFeatures:(AWSOrganizationsEnableAllFeaturesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"EnableAllFeatures"
                   outputClass:[AWSOrganizationsEnableAllFeaturesResponse class]];
}

- (void)enableAllFeatures:(AWSOrganizationsEnableAllFeaturesRequest *)request
     completionHandler:(void (^)(AWSOrganizationsEnableAllFeaturesResponse *response, NSError *error))completionHandler {
    [[self enableAllFeatures:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsEnableAllFeaturesResponse *> * _Nonnull task) {
        AWSOrganizationsEnableAllFeaturesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsEnablePolicyTypeResponse *> *)enablePolicyType:(AWSOrganizationsEnablePolicyTypeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"EnablePolicyType"
                   outputClass:[AWSOrganizationsEnablePolicyTypeResponse class]];
}

- (void)enablePolicyType:(AWSOrganizationsEnablePolicyTypeRequest *)request
     completionHandler:(void (^)(AWSOrganizationsEnablePolicyTypeResponse *response, NSError *error))completionHandler {
    [[self enablePolicyType:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsEnablePolicyTypeResponse *> * _Nonnull task) {
        AWSOrganizationsEnablePolicyTypeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsInviteAccountToOrganizationResponse *> *)inviteAccountToOrganization:(AWSOrganizationsInviteAccountToOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"InviteAccountToOrganization"
                   outputClass:[AWSOrganizationsInviteAccountToOrganizationResponse class]];
}

- (void)inviteAccountToOrganization:(AWSOrganizationsInviteAccountToOrganizationRequest *)request
     completionHandler:(void (^)(AWSOrganizationsInviteAccountToOrganizationResponse *response, NSError *error))completionHandler {
    [[self inviteAccountToOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsInviteAccountToOrganizationResponse *> * _Nonnull task) {
        AWSOrganizationsInviteAccountToOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)leaveOrganization:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"LeaveOrganization"
                   outputClass:nil];
}

- (void)leaveOrganization:(AWSRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self leaveOrganization:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListAWSServiceAccessForOrganizationResponse *> *)listAWSServiceAccessForOrganization:(AWSOrganizationsListAWSServiceAccessForOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListAWSServiceAccessForOrganization"
                   outputClass:[AWSOrganizationsListAWSServiceAccessForOrganizationResponse class]];
}

- (void)listAWSServiceAccessForOrganization:(AWSOrganizationsListAWSServiceAccessForOrganizationRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListAWSServiceAccessForOrganizationResponse *response, NSError *error))completionHandler {
    [[self listAWSServiceAccessForOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListAWSServiceAccessForOrganizationResponse *> * _Nonnull task) {
        AWSOrganizationsListAWSServiceAccessForOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListAccountsResponse *> *)listAccounts:(AWSOrganizationsListAccountsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListAccounts"
                   outputClass:[AWSOrganizationsListAccountsResponse class]];
}

- (void)listAccounts:(AWSOrganizationsListAccountsRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListAccountsResponse *response, NSError *error))completionHandler {
    [[self listAccounts:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListAccountsResponse *> * _Nonnull task) {
        AWSOrganizationsListAccountsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListAccountsForParentResponse *> *)listAccountsForParent:(AWSOrganizationsListAccountsForParentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListAccountsForParent"
                   outputClass:[AWSOrganizationsListAccountsForParentResponse class]];
}

- (void)listAccountsForParent:(AWSOrganizationsListAccountsForParentRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListAccountsForParentResponse *response, NSError *error))completionHandler {
    [[self listAccountsForParent:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListAccountsForParentResponse *> * _Nonnull task) {
        AWSOrganizationsListAccountsForParentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListChildrenResponse *> *)listChildren:(AWSOrganizationsListChildrenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListChildren"
                   outputClass:[AWSOrganizationsListChildrenResponse class]];
}

- (void)listChildren:(AWSOrganizationsListChildrenRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListChildrenResponse *response, NSError *error))completionHandler {
    [[self listChildren:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListChildrenResponse *> * _Nonnull task) {
        AWSOrganizationsListChildrenResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListCreateAccountStatusResponse *> *)listCreateAccountStatus:(AWSOrganizationsListCreateAccountStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListCreateAccountStatus"
                   outputClass:[AWSOrganizationsListCreateAccountStatusResponse class]];
}

- (void)listCreateAccountStatus:(AWSOrganizationsListCreateAccountStatusRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListCreateAccountStatusResponse *response, NSError *error))completionHandler {
    [[self listCreateAccountStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListCreateAccountStatusResponse *> * _Nonnull task) {
        AWSOrganizationsListCreateAccountStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListDelegatedAdministratorsResponse *> *)listDelegatedAdministrators:(AWSOrganizationsListDelegatedAdministratorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListDelegatedAdministrators"
                   outputClass:[AWSOrganizationsListDelegatedAdministratorsResponse class]];
}

- (void)listDelegatedAdministrators:(AWSOrganizationsListDelegatedAdministratorsRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListDelegatedAdministratorsResponse *response, NSError *error))completionHandler {
    [[self listDelegatedAdministrators:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListDelegatedAdministratorsResponse *> * _Nonnull task) {
        AWSOrganizationsListDelegatedAdministratorsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListDelegatedServicesForAccountResponse *> *)listDelegatedServicesForAccount:(AWSOrganizationsListDelegatedServicesForAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListDelegatedServicesForAccount"
                   outputClass:[AWSOrganizationsListDelegatedServicesForAccountResponse class]];
}

- (void)listDelegatedServicesForAccount:(AWSOrganizationsListDelegatedServicesForAccountRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListDelegatedServicesForAccountResponse *response, NSError *error))completionHandler {
    [[self listDelegatedServicesForAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListDelegatedServicesForAccountResponse *> * _Nonnull task) {
        AWSOrganizationsListDelegatedServicesForAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListHandshakesForAccountResponse *> *)listHandshakesForAccount:(AWSOrganizationsListHandshakesForAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListHandshakesForAccount"
                   outputClass:[AWSOrganizationsListHandshakesForAccountResponse class]];
}

- (void)listHandshakesForAccount:(AWSOrganizationsListHandshakesForAccountRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListHandshakesForAccountResponse *response, NSError *error))completionHandler {
    [[self listHandshakesForAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListHandshakesForAccountResponse *> * _Nonnull task) {
        AWSOrganizationsListHandshakesForAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListHandshakesForOrganizationResponse *> *)listHandshakesForOrganization:(AWSOrganizationsListHandshakesForOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListHandshakesForOrganization"
                   outputClass:[AWSOrganizationsListHandshakesForOrganizationResponse class]];
}

- (void)listHandshakesForOrganization:(AWSOrganizationsListHandshakesForOrganizationRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListHandshakesForOrganizationResponse *response, NSError *error))completionHandler {
    [[self listHandshakesForOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListHandshakesForOrganizationResponse *> * _Nonnull task) {
        AWSOrganizationsListHandshakesForOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListOrganizationalUnitsForParentResponse *> *)listOrganizationalUnitsForParent:(AWSOrganizationsListOrganizationalUnitsForParentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListOrganizationalUnitsForParent"
                   outputClass:[AWSOrganizationsListOrganizationalUnitsForParentResponse class]];
}

- (void)listOrganizationalUnitsForParent:(AWSOrganizationsListOrganizationalUnitsForParentRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListOrganizationalUnitsForParentResponse *response, NSError *error))completionHandler {
    [[self listOrganizationalUnitsForParent:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListOrganizationalUnitsForParentResponse *> * _Nonnull task) {
        AWSOrganizationsListOrganizationalUnitsForParentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListParentsResponse *> *)listParents:(AWSOrganizationsListParentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListParents"
                   outputClass:[AWSOrganizationsListParentsResponse class]];
}

- (void)listParents:(AWSOrganizationsListParentsRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListParentsResponse *response, NSError *error))completionHandler {
    [[self listParents:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListParentsResponse *> * _Nonnull task) {
        AWSOrganizationsListParentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListPoliciesResponse *> *)listPolicies:(AWSOrganizationsListPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListPolicies"
                   outputClass:[AWSOrganizationsListPoliciesResponse class]];
}

- (void)listPolicies:(AWSOrganizationsListPoliciesRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListPoliciesResponse *response, NSError *error))completionHandler {
    [[self listPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListPoliciesResponse *> * _Nonnull task) {
        AWSOrganizationsListPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListPoliciesForTargetResponse *> *)listPoliciesForTarget:(AWSOrganizationsListPoliciesForTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListPoliciesForTarget"
                   outputClass:[AWSOrganizationsListPoliciesForTargetResponse class]];
}

- (void)listPoliciesForTarget:(AWSOrganizationsListPoliciesForTargetRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListPoliciesForTargetResponse *response, NSError *error))completionHandler {
    [[self listPoliciesForTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListPoliciesForTargetResponse *> * _Nonnull task) {
        AWSOrganizationsListPoliciesForTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListRootsResponse *> *)listRoots:(AWSOrganizationsListRootsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListRoots"
                   outputClass:[AWSOrganizationsListRootsResponse class]];
}

- (void)listRoots:(AWSOrganizationsListRootsRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListRootsResponse *response, NSError *error))completionHandler {
    [[self listRoots:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListRootsResponse *> * _Nonnull task) {
        AWSOrganizationsListRootsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListTagsForResourceResponse *> *)listTagsForResource:(AWSOrganizationsListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSOrganizationsListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSOrganizationsListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListTagsForResourceResponse *> * _Nonnull task) {
        AWSOrganizationsListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsListTargetsForPolicyResponse *> *)listTargetsForPolicy:(AWSOrganizationsListTargetsForPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"ListTargetsForPolicy"
                   outputClass:[AWSOrganizationsListTargetsForPolicyResponse class]];
}

- (void)listTargetsForPolicy:(AWSOrganizationsListTargetsForPolicyRequest *)request
     completionHandler:(void (^)(AWSOrganizationsListTargetsForPolicyResponse *response, NSError *error))completionHandler {
    [[self listTargetsForPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsListTargetsForPolicyResponse *> * _Nonnull task) {
        AWSOrganizationsListTargetsForPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)moveAccount:(AWSOrganizationsMoveAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"MoveAccount"
                   outputClass:nil];
}

- (void)moveAccount:(AWSOrganizationsMoveAccountRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self moveAccount:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)registerDelegatedAdministrator:(AWSOrganizationsRegisterDelegatedAdministratorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"RegisterDelegatedAdministrator"
                   outputClass:nil];
}

- (void)registerDelegatedAdministrator:(AWSOrganizationsRegisterDelegatedAdministratorRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self registerDelegatedAdministrator:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)removeAccountFromOrganization:(AWSOrganizationsRemoveAccountFromOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"RemoveAccountFromOrganization"
                   outputClass:nil];
}

- (void)removeAccountFromOrganization:(AWSOrganizationsRemoveAccountFromOrganizationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeAccountFromOrganization:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSOrganizationsTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSOrganizationsTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSOrganizationsUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSOrganizationsUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsUpdateOrganizationalUnitResponse *> *)updateOrganizationalUnit:(AWSOrganizationsUpdateOrganizationalUnitRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"UpdateOrganizationalUnit"
                   outputClass:[AWSOrganizationsUpdateOrganizationalUnitResponse class]];
}

- (void)updateOrganizationalUnit:(AWSOrganizationsUpdateOrganizationalUnitRequest *)request
     completionHandler:(void (^)(AWSOrganizationsUpdateOrganizationalUnitResponse *response, NSError *error))completionHandler {
    [[self updateOrganizationalUnit:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsUpdateOrganizationalUnitResponse *> * _Nonnull task) {
        AWSOrganizationsUpdateOrganizationalUnitResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSOrganizationsUpdatePolicyResponse *> *)updatePolicy:(AWSOrganizationsUpdatePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSOrganizationsV20161128"
                 operationName:@"UpdatePolicy"
                   outputClass:[AWSOrganizationsUpdatePolicyResponse class]];
}

- (void)updatePolicy:(AWSOrganizationsUpdatePolicyRequest *)request
     completionHandler:(void (^)(AWSOrganizationsUpdatePolicyResponse *response, NSError *error))completionHandler {
    [[self updatePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSOrganizationsUpdatePolicyResponse *> * _Nonnull task) {
        AWSOrganizationsUpdatePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
