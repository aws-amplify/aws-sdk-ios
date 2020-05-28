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

#import "AWSWorkmailService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSWorkmailResources.h"

static NSString *const AWSInfoWorkmail = @"Workmail";
NSString *const AWSWorkmailSDKVersion = @"2.13.4";


@interface AWSWorkmailResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSWorkmailResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"DirectoryServiceAuthenticationFailedException" : @(AWSWorkmailErrorDirectoryServiceAuthenticationFailed),
                            @"DirectoryUnavailableException" : @(AWSWorkmailErrorDirectoryUnavailable),
                            @"EmailAddressInUseException" : @(AWSWorkmailErrorEmailAddressInUse),
                            @"EntityAlreadyRegisteredException" : @(AWSWorkmailErrorEntityAlreadyRegistered),
                            @"EntityNotFoundException" : @(AWSWorkmailErrorEntityNotFound),
                            @"EntityStateException" : @(AWSWorkmailErrorEntityState),
                            @"InvalidConfigurationException" : @(AWSWorkmailErrorInvalidConfiguration),
                            @"InvalidParameterException" : @(AWSWorkmailErrorInvalidParameter),
                            @"InvalidPasswordException" : @(AWSWorkmailErrorInvalidPassword),
                            @"LimitExceededException" : @(AWSWorkmailErrorLimitExceeded),
                            @"MailDomainNotFoundException" : @(AWSWorkmailErrorMailDomainNotFound),
                            @"MailDomainStateException" : @(AWSWorkmailErrorMailDomainState),
                            @"NameAvailabilityException" : @(AWSWorkmailErrorNameAvailability),
                            @"OrganizationNotFoundException" : @(AWSWorkmailErrorOrganizationNotFound),
                            @"OrganizationStateException" : @(AWSWorkmailErrorOrganizationState),
                            @"ReservedNameException" : @(AWSWorkmailErrorReservedName),
                            @"ResourceNotFoundException" : @(AWSWorkmailErrorResourceNotFound),
                            @"TooManyTagsException" : @(AWSWorkmailErrorTooManyTags),
                            @"UnsupportedOperationException" : @(AWSWorkmailErrorUnsupportedOperation),
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
	                *error = [NSError errorWithDomain:AWSWorkmailErrorDomain
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
        *error = [NSError errorWithDomain:AWSWorkmailErrorDomain
                                     code:AWSWorkmailErrorUnknown
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

@interface AWSWorkmailRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSWorkmailRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSWorkmail()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSWorkmail

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSWorkmailSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSWorkmail versions need to match. Check your SDK installation. AWSCore: %@ AWSWorkmail: %@", AWSiOSSDKVersion, AWSWorkmailSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultWorkmail {
    static AWSWorkmail *_defaultWorkmail = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoWorkmail];
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
        _defaultWorkmail = [[AWSWorkmail alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultWorkmail;
}

+ (void)registerWorkmailWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSWorkmail alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)WorkmailForKey:(NSString *)key {
    @synchronized(self) {
        AWSWorkmail *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoWorkmail
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSWorkmail registerWorkmailWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeWorkmailForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultWorkmail` or `+ WorkmailForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceWorkmail
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceWorkmail];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSWorkmailRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSWorkmailResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSWorkmailResponseSerializer alloc] initWithJSONDefinition:[[AWSWorkmailResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSWorkmailAssociateDelegateToResourceResponse *> *)associateDelegateToResource:(AWSWorkmailAssociateDelegateToResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"AssociateDelegateToResource"
                   outputClass:[AWSWorkmailAssociateDelegateToResourceResponse class]];
}

- (void)associateDelegateToResource:(AWSWorkmailAssociateDelegateToResourceRequest *)request
     completionHandler:(void (^)(AWSWorkmailAssociateDelegateToResourceResponse *response, NSError *error))completionHandler {
    [[self associateDelegateToResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailAssociateDelegateToResourceResponse *> * _Nonnull task) {
        AWSWorkmailAssociateDelegateToResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailAssociateMemberToGroupResponse *> *)associateMemberToGroup:(AWSWorkmailAssociateMemberToGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"AssociateMemberToGroup"
                   outputClass:[AWSWorkmailAssociateMemberToGroupResponse class]];
}

- (void)associateMemberToGroup:(AWSWorkmailAssociateMemberToGroupRequest *)request
     completionHandler:(void (^)(AWSWorkmailAssociateMemberToGroupResponse *response, NSError *error))completionHandler {
    [[self associateMemberToGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailAssociateMemberToGroupResponse *> * _Nonnull task) {
        AWSWorkmailAssociateMemberToGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailCreateAliasResponse *> *)createAlias:(AWSWorkmailCreateAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"CreateAlias"
                   outputClass:[AWSWorkmailCreateAliasResponse class]];
}

- (void)createAlias:(AWSWorkmailCreateAliasRequest *)request
     completionHandler:(void (^)(AWSWorkmailCreateAliasResponse *response, NSError *error))completionHandler {
    [[self createAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailCreateAliasResponse *> * _Nonnull task) {
        AWSWorkmailCreateAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailCreateGroupResponse *> *)createGroup:(AWSWorkmailCreateGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"CreateGroup"
                   outputClass:[AWSWorkmailCreateGroupResponse class]];
}

- (void)createGroup:(AWSWorkmailCreateGroupRequest *)request
     completionHandler:(void (^)(AWSWorkmailCreateGroupResponse *response, NSError *error))completionHandler {
    [[self createGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailCreateGroupResponse *> * _Nonnull task) {
        AWSWorkmailCreateGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailCreateResourceResponse *> *)createResource:(AWSWorkmailCreateResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"CreateResource"
                   outputClass:[AWSWorkmailCreateResourceResponse class]];
}

- (void)createResource:(AWSWorkmailCreateResourceRequest *)request
     completionHandler:(void (^)(AWSWorkmailCreateResourceResponse *response, NSError *error))completionHandler {
    [[self createResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailCreateResourceResponse *> * _Nonnull task) {
        AWSWorkmailCreateResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailCreateUserResponse *> *)createUser:(AWSWorkmailCreateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"CreateUser"
                   outputClass:[AWSWorkmailCreateUserResponse class]];
}

- (void)createUser:(AWSWorkmailCreateUserRequest *)request
     completionHandler:(void (^)(AWSWorkmailCreateUserResponse *response, NSError *error))completionHandler {
    [[self createUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailCreateUserResponse *> * _Nonnull task) {
        AWSWorkmailCreateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDeleteAccessControlRuleResponse *> *)deleteAccessControlRule:(AWSWorkmailDeleteAccessControlRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DeleteAccessControlRule"
                   outputClass:[AWSWorkmailDeleteAccessControlRuleResponse class]];
}

- (void)deleteAccessControlRule:(AWSWorkmailDeleteAccessControlRuleRequest *)request
     completionHandler:(void (^)(AWSWorkmailDeleteAccessControlRuleResponse *response, NSError *error))completionHandler {
    [[self deleteAccessControlRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDeleteAccessControlRuleResponse *> * _Nonnull task) {
        AWSWorkmailDeleteAccessControlRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDeleteAliasResponse *> *)deleteAlias:(AWSWorkmailDeleteAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DeleteAlias"
                   outputClass:[AWSWorkmailDeleteAliasResponse class]];
}

- (void)deleteAlias:(AWSWorkmailDeleteAliasRequest *)request
     completionHandler:(void (^)(AWSWorkmailDeleteAliasResponse *response, NSError *error))completionHandler {
    [[self deleteAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDeleteAliasResponse *> * _Nonnull task) {
        AWSWorkmailDeleteAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDeleteGroupResponse *> *)deleteGroup:(AWSWorkmailDeleteGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DeleteGroup"
                   outputClass:[AWSWorkmailDeleteGroupResponse class]];
}

- (void)deleteGroup:(AWSWorkmailDeleteGroupRequest *)request
     completionHandler:(void (^)(AWSWorkmailDeleteGroupResponse *response, NSError *error))completionHandler {
    [[self deleteGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDeleteGroupResponse *> * _Nonnull task) {
        AWSWorkmailDeleteGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDeleteMailboxPermissionsResponse *> *)deleteMailboxPermissions:(AWSWorkmailDeleteMailboxPermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DeleteMailboxPermissions"
                   outputClass:[AWSWorkmailDeleteMailboxPermissionsResponse class]];
}

- (void)deleteMailboxPermissions:(AWSWorkmailDeleteMailboxPermissionsRequest *)request
     completionHandler:(void (^)(AWSWorkmailDeleteMailboxPermissionsResponse *response, NSError *error))completionHandler {
    [[self deleteMailboxPermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDeleteMailboxPermissionsResponse *> * _Nonnull task) {
        AWSWorkmailDeleteMailboxPermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDeleteResourceResponse *> *)deleteResource:(AWSWorkmailDeleteResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DeleteResource"
                   outputClass:[AWSWorkmailDeleteResourceResponse class]];
}

- (void)deleteResource:(AWSWorkmailDeleteResourceRequest *)request
     completionHandler:(void (^)(AWSWorkmailDeleteResourceResponse *response, NSError *error))completionHandler {
    [[self deleteResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDeleteResourceResponse *> * _Nonnull task) {
        AWSWorkmailDeleteResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDeleteRetentionPolicyResponse *> *)deleteRetentionPolicy:(AWSWorkmailDeleteRetentionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DeleteRetentionPolicy"
                   outputClass:[AWSWorkmailDeleteRetentionPolicyResponse class]];
}

- (void)deleteRetentionPolicy:(AWSWorkmailDeleteRetentionPolicyRequest *)request
     completionHandler:(void (^)(AWSWorkmailDeleteRetentionPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteRetentionPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDeleteRetentionPolicyResponse *> * _Nonnull task) {
        AWSWorkmailDeleteRetentionPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDeleteUserResponse *> *)deleteUser:(AWSWorkmailDeleteUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DeleteUser"
                   outputClass:[AWSWorkmailDeleteUserResponse class]];
}

- (void)deleteUser:(AWSWorkmailDeleteUserRequest *)request
     completionHandler:(void (^)(AWSWorkmailDeleteUserResponse *response, NSError *error))completionHandler {
    [[self deleteUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDeleteUserResponse *> * _Nonnull task) {
        AWSWorkmailDeleteUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDeregisterFromWorkMailResponse *> *)deregisterFromWorkMail:(AWSWorkmailDeregisterFromWorkMailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DeregisterFromWorkMail"
                   outputClass:[AWSWorkmailDeregisterFromWorkMailResponse class]];
}

- (void)deregisterFromWorkMail:(AWSWorkmailDeregisterFromWorkMailRequest *)request
     completionHandler:(void (^)(AWSWorkmailDeregisterFromWorkMailResponse *response, NSError *error))completionHandler {
    [[self deregisterFromWorkMail:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDeregisterFromWorkMailResponse *> * _Nonnull task) {
        AWSWorkmailDeregisterFromWorkMailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDescribeGroupResponse *> *)describeGroup:(AWSWorkmailDescribeGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DescribeGroup"
                   outputClass:[AWSWorkmailDescribeGroupResponse class]];
}

- (void)describeGroup:(AWSWorkmailDescribeGroupRequest *)request
     completionHandler:(void (^)(AWSWorkmailDescribeGroupResponse *response, NSError *error))completionHandler {
    [[self describeGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDescribeGroupResponse *> * _Nonnull task) {
        AWSWorkmailDescribeGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDescribeOrganizationResponse *> *)describeOrganization:(AWSWorkmailDescribeOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DescribeOrganization"
                   outputClass:[AWSWorkmailDescribeOrganizationResponse class]];
}

- (void)describeOrganization:(AWSWorkmailDescribeOrganizationRequest *)request
     completionHandler:(void (^)(AWSWorkmailDescribeOrganizationResponse *response, NSError *error))completionHandler {
    [[self describeOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDescribeOrganizationResponse *> * _Nonnull task) {
        AWSWorkmailDescribeOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDescribeResourceResponse *> *)describeResource:(AWSWorkmailDescribeResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DescribeResource"
                   outputClass:[AWSWorkmailDescribeResourceResponse class]];
}

- (void)describeResource:(AWSWorkmailDescribeResourceRequest *)request
     completionHandler:(void (^)(AWSWorkmailDescribeResourceResponse *response, NSError *error))completionHandler {
    [[self describeResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDescribeResourceResponse *> * _Nonnull task) {
        AWSWorkmailDescribeResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDescribeUserResponse *> *)describeUser:(AWSWorkmailDescribeUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DescribeUser"
                   outputClass:[AWSWorkmailDescribeUserResponse class]];
}

- (void)describeUser:(AWSWorkmailDescribeUserRequest *)request
     completionHandler:(void (^)(AWSWorkmailDescribeUserResponse *response, NSError *error))completionHandler {
    [[self describeUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDescribeUserResponse *> * _Nonnull task) {
        AWSWorkmailDescribeUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDisassociateDelegateFromResourceResponse *> *)disassociateDelegateFromResource:(AWSWorkmailDisassociateDelegateFromResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DisassociateDelegateFromResource"
                   outputClass:[AWSWorkmailDisassociateDelegateFromResourceResponse class]];
}

- (void)disassociateDelegateFromResource:(AWSWorkmailDisassociateDelegateFromResourceRequest *)request
     completionHandler:(void (^)(AWSWorkmailDisassociateDelegateFromResourceResponse *response, NSError *error))completionHandler {
    [[self disassociateDelegateFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDisassociateDelegateFromResourceResponse *> * _Nonnull task) {
        AWSWorkmailDisassociateDelegateFromResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailDisassociateMemberFromGroupResponse *> *)disassociateMemberFromGroup:(AWSWorkmailDisassociateMemberFromGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"DisassociateMemberFromGroup"
                   outputClass:[AWSWorkmailDisassociateMemberFromGroupResponse class]];
}

- (void)disassociateMemberFromGroup:(AWSWorkmailDisassociateMemberFromGroupRequest *)request
     completionHandler:(void (^)(AWSWorkmailDisassociateMemberFromGroupResponse *response, NSError *error))completionHandler {
    [[self disassociateMemberFromGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailDisassociateMemberFromGroupResponse *> * _Nonnull task) {
        AWSWorkmailDisassociateMemberFromGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailGetAccessControlEffectResponse *> *)getAccessControlEffect:(AWSWorkmailGetAccessControlEffectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"GetAccessControlEffect"
                   outputClass:[AWSWorkmailGetAccessControlEffectResponse class]];
}

- (void)getAccessControlEffect:(AWSWorkmailGetAccessControlEffectRequest *)request
     completionHandler:(void (^)(AWSWorkmailGetAccessControlEffectResponse *response, NSError *error))completionHandler {
    [[self getAccessControlEffect:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailGetAccessControlEffectResponse *> * _Nonnull task) {
        AWSWorkmailGetAccessControlEffectResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailGetDefaultRetentionPolicyResponse *> *)getDefaultRetentionPolicy:(AWSWorkmailGetDefaultRetentionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"GetDefaultRetentionPolicy"
                   outputClass:[AWSWorkmailGetDefaultRetentionPolicyResponse class]];
}

- (void)getDefaultRetentionPolicy:(AWSWorkmailGetDefaultRetentionPolicyRequest *)request
     completionHandler:(void (^)(AWSWorkmailGetDefaultRetentionPolicyResponse *response, NSError *error))completionHandler {
    [[self getDefaultRetentionPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailGetDefaultRetentionPolicyResponse *> * _Nonnull task) {
        AWSWorkmailGetDefaultRetentionPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailGetMailboxDetailsResponse *> *)getMailboxDetails:(AWSWorkmailGetMailboxDetailsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"GetMailboxDetails"
                   outputClass:[AWSWorkmailGetMailboxDetailsResponse class]];
}

- (void)getMailboxDetails:(AWSWorkmailGetMailboxDetailsRequest *)request
     completionHandler:(void (^)(AWSWorkmailGetMailboxDetailsResponse *response, NSError *error))completionHandler {
    [[self getMailboxDetails:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailGetMailboxDetailsResponse *> * _Nonnull task) {
        AWSWorkmailGetMailboxDetailsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailListAccessControlRulesResponse *> *)listAccessControlRules:(AWSWorkmailListAccessControlRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ListAccessControlRules"
                   outputClass:[AWSWorkmailListAccessControlRulesResponse class]];
}

- (void)listAccessControlRules:(AWSWorkmailListAccessControlRulesRequest *)request
     completionHandler:(void (^)(AWSWorkmailListAccessControlRulesResponse *response, NSError *error))completionHandler {
    [[self listAccessControlRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailListAccessControlRulesResponse *> * _Nonnull task) {
        AWSWorkmailListAccessControlRulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailListAliasesResponse *> *)listAliases:(AWSWorkmailListAliasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ListAliases"
                   outputClass:[AWSWorkmailListAliasesResponse class]];
}

- (void)listAliases:(AWSWorkmailListAliasesRequest *)request
     completionHandler:(void (^)(AWSWorkmailListAliasesResponse *response, NSError *error))completionHandler {
    [[self listAliases:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailListAliasesResponse *> * _Nonnull task) {
        AWSWorkmailListAliasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailListGroupMembersResponse *> *)listGroupMembers:(AWSWorkmailListGroupMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ListGroupMembers"
                   outputClass:[AWSWorkmailListGroupMembersResponse class]];
}

- (void)listGroupMembers:(AWSWorkmailListGroupMembersRequest *)request
     completionHandler:(void (^)(AWSWorkmailListGroupMembersResponse *response, NSError *error))completionHandler {
    [[self listGroupMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailListGroupMembersResponse *> * _Nonnull task) {
        AWSWorkmailListGroupMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailListGroupsResponse *> *)listGroups:(AWSWorkmailListGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ListGroups"
                   outputClass:[AWSWorkmailListGroupsResponse class]];
}

- (void)listGroups:(AWSWorkmailListGroupsRequest *)request
     completionHandler:(void (^)(AWSWorkmailListGroupsResponse *response, NSError *error))completionHandler {
    [[self listGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailListGroupsResponse *> * _Nonnull task) {
        AWSWorkmailListGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailListMailboxPermissionsResponse *> *)listMailboxPermissions:(AWSWorkmailListMailboxPermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ListMailboxPermissions"
                   outputClass:[AWSWorkmailListMailboxPermissionsResponse class]];
}

- (void)listMailboxPermissions:(AWSWorkmailListMailboxPermissionsRequest *)request
     completionHandler:(void (^)(AWSWorkmailListMailboxPermissionsResponse *response, NSError *error))completionHandler {
    [[self listMailboxPermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailListMailboxPermissionsResponse *> * _Nonnull task) {
        AWSWorkmailListMailboxPermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailListOrganizationsResponse *> *)listOrganizations:(AWSWorkmailListOrganizationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ListOrganizations"
                   outputClass:[AWSWorkmailListOrganizationsResponse class]];
}

- (void)listOrganizations:(AWSWorkmailListOrganizationsRequest *)request
     completionHandler:(void (^)(AWSWorkmailListOrganizationsResponse *response, NSError *error))completionHandler {
    [[self listOrganizations:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailListOrganizationsResponse *> * _Nonnull task) {
        AWSWorkmailListOrganizationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailListResourceDelegatesResponse *> *)listResourceDelegates:(AWSWorkmailListResourceDelegatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ListResourceDelegates"
                   outputClass:[AWSWorkmailListResourceDelegatesResponse class]];
}

- (void)listResourceDelegates:(AWSWorkmailListResourceDelegatesRequest *)request
     completionHandler:(void (^)(AWSWorkmailListResourceDelegatesResponse *response, NSError *error))completionHandler {
    [[self listResourceDelegates:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailListResourceDelegatesResponse *> * _Nonnull task) {
        AWSWorkmailListResourceDelegatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailListResourcesResponse *> *)listResources:(AWSWorkmailListResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ListResources"
                   outputClass:[AWSWorkmailListResourcesResponse class]];
}

- (void)listResources:(AWSWorkmailListResourcesRequest *)request
     completionHandler:(void (^)(AWSWorkmailListResourcesResponse *response, NSError *error))completionHandler {
    [[self listResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailListResourcesResponse *> * _Nonnull task) {
        AWSWorkmailListResourcesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailListTagsForResourceResponse *> *)listTagsForResource:(AWSWorkmailListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSWorkmailListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSWorkmailListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSWorkmailListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailListTagsForResourceResponse *> * _Nonnull task) {
        AWSWorkmailListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailListUsersResponse *> *)listUsers:(AWSWorkmailListUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ListUsers"
                   outputClass:[AWSWorkmailListUsersResponse class]];
}

- (void)listUsers:(AWSWorkmailListUsersRequest *)request
     completionHandler:(void (^)(AWSWorkmailListUsersResponse *response, NSError *error))completionHandler {
    [[self listUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailListUsersResponse *> * _Nonnull task) {
        AWSWorkmailListUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailPutAccessControlRuleResponse *> *)putAccessControlRule:(AWSWorkmailPutAccessControlRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"PutAccessControlRule"
                   outputClass:[AWSWorkmailPutAccessControlRuleResponse class]];
}

- (void)putAccessControlRule:(AWSWorkmailPutAccessControlRuleRequest *)request
     completionHandler:(void (^)(AWSWorkmailPutAccessControlRuleResponse *response, NSError *error))completionHandler {
    [[self putAccessControlRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailPutAccessControlRuleResponse *> * _Nonnull task) {
        AWSWorkmailPutAccessControlRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailPutMailboxPermissionsResponse *> *)putMailboxPermissions:(AWSWorkmailPutMailboxPermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"PutMailboxPermissions"
                   outputClass:[AWSWorkmailPutMailboxPermissionsResponse class]];
}

- (void)putMailboxPermissions:(AWSWorkmailPutMailboxPermissionsRequest *)request
     completionHandler:(void (^)(AWSWorkmailPutMailboxPermissionsResponse *response, NSError *error))completionHandler {
    [[self putMailboxPermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailPutMailboxPermissionsResponse *> * _Nonnull task) {
        AWSWorkmailPutMailboxPermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailPutRetentionPolicyResponse *> *)putRetentionPolicy:(AWSWorkmailPutRetentionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"PutRetentionPolicy"
                   outputClass:[AWSWorkmailPutRetentionPolicyResponse class]];
}

- (void)putRetentionPolicy:(AWSWorkmailPutRetentionPolicyRequest *)request
     completionHandler:(void (^)(AWSWorkmailPutRetentionPolicyResponse *response, NSError *error))completionHandler {
    [[self putRetentionPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailPutRetentionPolicyResponse *> * _Nonnull task) {
        AWSWorkmailPutRetentionPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailRegisterToWorkMailResponse *> *)registerToWorkMail:(AWSWorkmailRegisterToWorkMailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"RegisterToWorkMail"
                   outputClass:[AWSWorkmailRegisterToWorkMailResponse class]];
}

- (void)registerToWorkMail:(AWSWorkmailRegisterToWorkMailRequest *)request
     completionHandler:(void (^)(AWSWorkmailRegisterToWorkMailResponse *response, NSError *error))completionHandler {
    [[self registerToWorkMail:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailRegisterToWorkMailResponse *> * _Nonnull task) {
        AWSWorkmailRegisterToWorkMailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailResetPasswordResponse *> *)resetPassword:(AWSWorkmailResetPasswordRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"ResetPassword"
                   outputClass:[AWSWorkmailResetPasswordResponse class]];
}

- (void)resetPassword:(AWSWorkmailResetPasswordRequest *)request
     completionHandler:(void (^)(AWSWorkmailResetPasswordResponse *response, NSError *error))completionHandler {
    [[self resetPassword:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailResetPasswordResponse *> * _Nonnull task) {
        AWSWorkmailResetPasswordResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailTagResourceResponse *> *)tagResource:(AWSWorkmailTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"TagResource"
                   outputClass:[AWSWorkmailTagResourceResponse class]];
}

- (void)tagResource:(AWSWorkmailTagResourceRequest *)request
     completionHandler:(void (^)(AWSWorkmailTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailTagResourceResponse *> * _Nonnull task) {
        AWSWorkmailTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailUntagResourceResponse *> *)untagResource:(AWSWorkmailUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"UntagResource"
                   outputClass:[AWSWorkmailUntagResourceResponse class]];
}

- (void)untagResource:(AWSWorkmailUntagResourceRequest *)request
     completionHandler:(void (^)(AWSWorkmailUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailUntagResourceResponse *> * _Nonnull task) {
        AWSWorkmailUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailUpdateMailboxQuotaResponse *> *)updateMailboxQuota:(AWSWorkmailUpdateMailboxQuotaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"UpdateMailboxQuota"
                   outputClass:[AWSWorkmailUpdateMailboxQuotaResponse class]];
}

- (void)updateMailboxQuota:(AWSWorkmailUpdateMailboxQuotaRequest *)request
     completionHandler:(void (^)(AWSWorkmailUpdateMailboxQuotaResponse *response, NSError *error))completionHandler {
    [[self updateMailboxQuota:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailUpdateMailboxQuotaResponse *> * _Nonnull task) {
        AWSWorkmailUpdateMailboxQuotaResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailUpdatePrimaryEmailAddressResponse *> *)updatePrimaryEmailAddress:(AWSWorkmailUpdatePrimaryEmailAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"UpdatePrimaryEmailAddress"
                   outputClass:[AWSWorkmailUpdatePrimaryEmailAddressResponse class]];
}

- (void)updatePrimaryEmailAddress:(AWSWorkmailUpdatePrimaryEmailAddressRequest *)request
     completionHandler:(void (^)(AWSWorkmailUpdatePrimaryEmailAddressResponse *response, NSError *error))completionHandler {
    [[self updatePrimaryEmailAddress:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailUpdatePrimaryEmailAddressResponse *> * _Nonnull task) {
        AWSWorkmailUpdatePrimaryEmailAddressResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorkmailUpdateResourceResponse *> *)updateResource:(AWSWorkmailUpdateResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"WorkMailService"
                 operationName:@"UpdateResource"
                   outputClass:[AWSWorkmailUpdateResourceResponse class]];
}

- (void)updateResource:(AWSWorkmailUpdateResourceRequest *)request
     completionHandler:(void (^)(AWSWorkmailUpdateResourceResponse *response, NSError *error))completionHandler {
    [[self updateResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorkmailUpdateResourceResponse *> * _Nonnull task) {
        AWSWorkmailUpdateResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
