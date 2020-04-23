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

#import "AWSramService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSramResources.h"

static NSString *const AWSInforam = @"ram";
NSString *const AWSramSDKVersion = @"2.13.2";


@interface AWSramResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSramResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IdempotentParameterMismatchException" : @(AWSramErrorIdempotentParameterMismatch),
                            @"InvalidClientTokenException" : @(AWSramErrorInvalidClientToken),
                            @"InvalidMaxResultsException" : @(AWSramErrorInvalidMaxResults),
                            @"InvalidNextTokenException" : @(AWSramErrorInvalidNextToken),
                            @"InvalidParameterException" : @(AWSramErrorInvalidParameter),
                            @"InvalidResourceTypeException" : @(AWSramErrorInvalidResourceType),
                            @"InvalidStateTransitionException" : @(AWSramErrorInvalidStateTransition),
                            @"MalformedArnException" : @(AWSramErrorMalformedArn),
                            @"MissingRequiredParameterException" : @(AWSramErrorMissingRequiredParameter),
                            @"OperationNotPermittedException" : @(AWSramErrorOperationNotPermitted),
                            @"ResourceArnNotFoundException" : @(AWSramErrorResourceArnNotFound),
                            @"ResourceShareInvitationAlreadyAcceptedException" : @(AWSramErrorResourceShareInvitationAlreadyAccepted),
                            @"ResourceShareInvitationAlreadyRejectedException" : @(AWSramErrorResourceShareInvitationAlreadyRejected),
                            @"ResourceShareInvitationArnNotFoundException" : @(AWSramErrorResourceShareInvitationArnNotFound),
                            @"ResourceShareInvitationExpiredException" : @(AWSramErrorResourceShareInvitationExpired),
                            @"ResourceShareLimitExceededException" : @(AWSramErrorResourceShareLimitExceeded),
                            @"ServerInternalException" : @(AWSramErrorServerInternal),
                            @"ServiceUnavailableException" : @(AWSramErrorServiceUnavailable),
                            @"TagLimitExceededException" : @(AWSramErrorTagLimitExceeded),
                            @"TagPolicyViolationException" : @(AWSramErrorTagPolicyViolation),
                            @"UnknownResourceException" : @(AWSramErrorUnknownResource),
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
    	NSString *errorTypeString = [[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"];
        NSString *errorTypeHeader = [[errorTypeString componentsSeparatedByString:@":"] firstObject];

        if ([errorTypeString length] > 0 && errorTypeHeader) {
            if (errorCodeDictionary[errorTypeHeader]) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSramErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSramErrorDomain
                                                 code:AWSramErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSramErrorDomain
                                     code:AWSramErrorUnknown
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

@interface AWSramRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSramRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSram()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSram

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSramSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSram versions need to match. Check your SDK installation. AWSCore: %@ AWSram: %@", AWSiOSSDKVersion, AWSramSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultram {
    static AWSram *_defaultram = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInforam];
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
        _defaultram = [[AWSram alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultram;
}

+ (void)registerramWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSram alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ramForKey:(NSString *)key {
    @synchronized(self) {
        AWSram *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInforam
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSram registerramWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeramForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultram` or `+ ramForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceram
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceram];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSramRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSramResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSramResponseSerializer alloc] initWithJSONDefinition:[[AWSramResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSramAcceptResourceShareInvitationResponse *> *)acceptResourceShareInvitation:(AWSramAcceptResourceShareInvitationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/acceptresourceshareinvitation"
                  targetPrefix:@""
                 operationName:@"AcceptResourceShareInvitation"
                   outputClass:[AWSramAcceptResourceShareInvitationResponse class]];
}

- (void)acceptResourceShareInvitation:(AWSramAcceptResourceShareInvitationRequest *)request
     completionHandler:(void (^)(AWSramAcceptResourceShareInvitationResponse *response, NSError *error))completionHandler {
    [[self acceptResourceShareInvitation:request] continueWithBlock:^id _Nullable(AWSTask<AWSramAcceptResourceShareInvitationResponse *> * _Nonnull task) {
        AWSramAcceptResourceShareInvitationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramAssociateResourceShareResponse *> *)associateResourceShare:(AWSramAssociateResourceShareRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/associateresourceshare"
                  targetPrefix:@""
                 operationName:@"AssociateResourceShare"
                   outputClass:[AWSramAssociateResourceShareResponse class]];
}

- (void)associateResourceShare:(AWSramAssociateResourceShareRequest *)request
     completionHandler:(void (^)(AWSramAssociateResourceShareResponse *response, NSError *error))completionHandler {
    [[self associateResourceShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSramAssociateResourceShareResponse *> * _Nonnull task) {
        AWSramAssociateResourceShareResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramAssociateResourceSharePermissionResponse *> *)associateResourceSharePermission:(AWSramAssociateResourceSharePermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/associateresourcesharepermission"
                  targetPrefix:@""
                 operationName:@"AssociateResourceSharePermission"
                   outputClass:[AWSramAssociateResourceSharePermissionResponse class]];
}

- (void)associateResourceSharePermission:(AWSramAssociateResourceSharePermissionRequest *)request
     completionHandler:(void (^)(AWSramAssociateResourceSharePermissionResponse *response, NSError *error))completionHandler {
    [[self associateResourceSharePermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSramAssociateResourceSharePermissionResponse *> * _Nonnull task) {
        AWSramAssociateResourceSharePermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramCreateResourceShareResponse *> *)createResourceShare:(AWSramCreateResourceShareRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/createresourceshare"
                  targetPrefix:@""
                 operationName:@"CreateResourceShare"
                   outputClass:[AWSramCreateResourceShareResponse class]];
}

- (void)createResourceShare:(AWSramCreateResourceShareRequest *)request
     completionHandler:(void (^)(AWSramCreateResourceShareResponse *response, NSError *error))completionHandler {
    [[self createResourceShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSramCreateResourceShareResponse *> * _Nonnull task) {
        AWSramCreateResourceShareResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramDeleteResourceShareResponse *> *)deleteResourceShare:(AWSramDeleteResourceShareRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/deleteresourceshare"
                  targetPrefix:@""
                 operationName:@"DeleteResourceShare"
                   outputClass:[AWSramDeleteResourceShareResponse class]];
}

- (void)deleteResourceShare:(AWSramDeleteResourceShareRequest *)request
     completionHandler:(void (^)(AWSramDeleteResourceShareResponse *response, NSError *error))completionHandler {
    [[self deleteResourceShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSramDeleteResourceShareResponse *> * _Nonnull task) {
        AWSramDeleteResourceShareResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramDisassociateResourceShareResponse *> *)disassociateResourceShare:(AWSramDisassociateResourceShareRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/disassociateresourceshare"
                  targetPrefix:@""
                 operationName:@"DisassociateResourceShare"
                   outputClass:[AWSramDisassociateResourceShareResponse class]];
}

- (void)disassociateResourceShare:(AWSramDisassociateResourceShareRequest *)request
     completionHandler:(void (^)(AWSramDisassociateResourceShareResponse *response, NSError *error))completionHandler {
    [[self disassociateResourceShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSramDisassociateResourceShareResponse *> * _Nonnull task) {
        AWSramDisassociateResourceShareResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramDisassociateResourceSharePermissionResponse *> *)disassociateResourceSharePermission:(AWSramDisassociateResourceSharePermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/disassociateresourcesharepermission"
                  targetPrefix:@""
                 operationName:@"DisassociateResourceSharePermission"
                   outputClass:[AWSramDisassociateResourceSharePermissionResponse class]];
}

- (void)disassociateResourceSharePermission:(AWSramDisassociateResourceSharePermissionRequest *)request
     completionHandler:(void (^)(AWSramDisassociateResourceSharePermissionResponse *response, NSError *error))completionHandler {
    [[self disassociateResourceSharePermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSramDisassociateResourceSharePermissionResponse *> * _Nonnull task) {
        AWSramDisassociateResourceSharePermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramEnableSharingWithAwsOrganizationResponse *> *)enableSharingWithAwsOrganization:(AWSramEnableSharingWithAwsOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/enablesharingwithawsorganization"
                  targetPrefix:@""
                 operationName:@"EnableSharingWithAwsOrganization"
                   outputClass:[AWSramEnableSharingWithAwsOrganizationResponse class]];
}

- (void)enableSharingWithAwsOrganization:(AWSramEnableSharingWithAwsOrganizationRequest *)request
     completionHandler:(void (^)(AWSramEnableSharingWithAwsOrganizationResponse *response, NSError *error))completionHandler {
    [[self enableSharingWithAwsOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSramEnableSharingWithAwsOrganizationResponse *> * _Nonnull task) {
        AWSramEnableSharingWithAwsOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramGetPermissionResponse *> *)getPermission:(AWSramGetPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getpermission"
                  targetPrefix:@""
                 operationName:@"GetPermission"
                   outputClass:[AWSramGetPermissionResponse class]];
}

- (void)getPermission:(AWSramGetPermissionRequest *)request
     completionHandler:(void (^)(AWSramGetPermissionResponse *response, NSError *error))completionHandler {
    [[self getPermission:request] continueWithBlock:^id _Nullable(AWSTask<AWSramGetPermissionResponse *> * _Nonnull task) {
        AWSramGetPermissionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramGetResourcePoliciesResponse *> *)getResourcePolicies:(AWSramGetResourcePoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getresourcepolicies"
                  targetPrefix:@""
                 operationName:@"GetResourcePolicies"
                   outputClass:[AWSramGetResourcePoliciesResponse class]];
}

- (void)getResourcePolicies:(AWSramGetResourcePoliciesRequest *)request
     completionHandler:(void (^)(AWSramGetResourcePoliciesResponse *response, NSError *error))completionHandler {
    [[self getResourcePolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSramGetResourcePoliciesResponse *> * _Nonnull task) {
        AWSramGetResourcePoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramGetResourceShareAssociationsResponse *> *)getResourceShareAssociations:(AWSramGetResourceShareAssociationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getresourceshareassociations"
                  targetPrefix:@""
                 operationName:@"GetResourceShareAssociations"
                   outputClass:[AWSramGetResourceShareAssociationsResponse class]];
}

- (void)getResourceShareAssociations:(AWSramGetResourceShareAssociationsRequest *)request
     completionHandler:(void (^)(AWSramGetResourceShareAssociationsResponse *response, NSError *error))completionHandler {
    [[self getResourceShareAssociations:request] continueWithBlock:^id _Nullable(AWSTask<AWSramGetResourceShareAssociationsResponse *> * _Nonnull task) {
        AWSramGetResourceShareAssociationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramGetResourceShareInvitationsResponse *> *)getResourceShareInvitations:(AWSramGetResourceShareInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getresourceshareinvitations"
                  targetPrefix:@""
                 operationName:@"GetResourceShareInvitations"
                   outputClass:[AWSramGetResourceShareInvitationsResponse class]];
}

- (void)getResourceShareInvitations:(AWSramGetResourceShareInvitationsRequest *)request
     completionHandler:(void (^)(AWSramGetResourceShareInvitationsResponse *response, NSError *error))completionHandler {
    [[self getResourceShareInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSramGetResourceShareInvitationsResponse *> * _Nonnull task) {
        AWSramGetResourceShareInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramGetResourceSharesResponse *> *)getResourceShares:(AWSramGetResourceSharesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/getresourceshares"
                  targetPrefix:@""
                 operationName:@"GetResourceShares"
                   outputClass:[AWSramGetResourceSharesResponse class]];
}

- (void)getResourceShares:(AWSramGetResourceSharesRequest *)request
     completionHandler:(void (^)(AWSramGetResourceSharesResponse *response, NSError *error))completionHandler {
    [[self getResourceShares:request] continueWithBlock:^id _Nullable(AWSTask<AWSramGetResourceSharesResponse *> * _Nonnull task) {
        AWSramGetResourceSharesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramListPendingInvitationResourcesResponse *> *)listPendingInvitationResources:(AWSramListPendingInvitationResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listpendinginvitationresources"
                  targetPrefix:@""
                 operationName:@"ListPendingInvitationResources"
                   outputClass:[AWSramListPendingInvitationResourcesResponse class]];
}

- (void)listPendingInvitationResources:(AWSramListPendingInvitationResourcesRequest *)request
     completionHandler:(void (^)(AWSramListPendingInvitationResourcesResponse *response, NSError *error))completionHandler {
    [[self listPendingInvitationResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSramListPendingInvitationResourcesResponse *> * _Nonnull task) {
        AWSramListPendingInvitationResourcesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramListPermissionsResponse *> *)listPermissions:(AWSramListPermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listpermissions"
                  targetPrefix:@""
                 operationName:@"ListPermissions"
                   outputClass:[AWSramListPermissionsResponse class]];
}

- (void)listPermissions:(AWSramListPermissionsRequest *)request
     completionHandler:(void (^)(AWSramListPermissionsResponse *response, NSError *error))completionHandler {
    [[self listPermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSramListPermissionsResponse *> * _Nonnull task) {
        AWSramListPermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramListPrincipalsResponse *> *)listPrincipals:(AWSramListPrincipalsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listprincipals"
                  targetPrefix:@""
                 operationName:@"ListPrincipals"
                   outputClass:[AWSramListPrincipalsResponse class]];
}

- (void)listPrincipals:(AWSramListPrincipalsRequest *)request
     completionHandler:(void (^)(AWSramListPrincipalsResponse *response, NSError *error))completionHandler {
    [[self listPrincipals:request] continueWithBlock:^id _Nullable(AWSTask<AWSramListPrincipalsResponse *> * _Nonnull task) {
        AWSramListPrincipalsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramListResourceSharePermissionsResponse *> *)listResourceSharePermissions:(AWSramListResourceSharePermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listresourcesharepermissions"
                  targetPrefix:@""
                 operationName:@"ListResourceSharePermissions"
                   outputClass:[AWSramListResourceSharePermissionsResponse class]];
}

- (void)listResourceSharePermissions:(AWSramListResourceSharePermissionsRequest *)request
     completionHandler:(void (^)(AWSramListResourceSharePermissionsResponse *response, NSError *error))completionHandler {
    [[self listResourceSharePermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSramListResourceSharePermissionsResponse *> * _Nonnull task) {
        AWSramListResourceSharePermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramListResourceTypesResponse *> *)listResourceTypes:(AWSramListResourceTypesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listresourcetypes"
                  targetPrefix:@""
                 operationName:@"ListResourceTypes"
                   outputClass:[AWSramListResourceTypesResponse class]];
}

- (void)listResourceTypes:(AWSramListResourceTypesRequest *)request
     completionHandler:(void (^)(AWSramListResourceTypesResponse *response, NSError *error))completionHandler {
    [[self listResourceTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSramListResourceTypesResponse *> * _Nonnull task) {
        AWSramListResourceTypesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramListResourcesResponse *> *)listResources:(AWSramListResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listresources"
                  targetPrefix:@""
                 operationName:@"ListResources"
                   outputClass:[AWSramListResourcesResponse class]];
}

- (void)listResources:(AWSramListResourcesRequest *)request
     completionHandler:(void (^)(AWSramListResourcesResponse *response, NSError *error))completionHandler {
    [[self listResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSramListResourcesResponse *> * _Nonnull task) {
        AWSramListResourcesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramPromoteResourceShareCreatedFromPolicyResponse *> *)promoteResourceShareCreatedFromPolicy:(AWSramPromoteResourceShareCreatedFromPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/promoteresourcesharecreatedfrompolicy"
                  targetPrefix:@""
                 operationName:@"PromoteResourceShareCreatedFromPolicy"
                   outputClass:[AWSramPromoteResourceShareCreatedFromPolicyResponse class]];
}

- (void)promoteResourceShareCreatedFromPolicy:(AWSramPromoteResourceShareCreatedFromPolicyRequest *)request
     completionHandler:(void (^)(AWSramPromoteResourceShareCreatedFromPolicyResponse *response, NSError *error))completionHandler {
    [[self promoteResourceShareCreatedFromPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSramPromoteResourceShareCreatedFromPolicyResponse *> * _Nonnull task) {
        AWSramPromoteResourceShareCreatedFromPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramRejectResourceShareInvitationResponse *> *)rejectResourceShareInvitation:(AWSramRejectResourceShareInvitationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/rejectresourceshareinvitation"
                  targetPrefix:@""
                 operationName:@"RejectResourceShareInvitation"
                   outputClass:[AWSramRejectResourceShareInvitationResponse class]];
}

- (void)rejectResourceShareInvitation:(AWSramRejectResourceShareInvitationRequest *)request
     completionHandler:(void (^)(AWSramRejectResourceShareInvitationResponse *response, NSError *error))completionHandler {
    [[self rejectResourceShareInvitation:request] continueWithBlock:^id _Nullable(AWSTask<AWSramRejectResourceShareInvitationResponse *> * _Nonnull task) {
        AWSramRejectResourceShareInvitationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramTagResourceResponse *> *)tagResource:(AWSramTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tagresource"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSramTagResourceResponse class]];
}

- (void)tagResource:(AWSramTagResourceRequest *)request
     completionHandler:(void (^)(AWSramTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSramTagResourceResponse *> * _Nonnull task) {
        AWSramTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramUntagResourceResponse *> *)untagResource:(AWSramUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/untagresource"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSramUntagResourceResponse class]];
}

- (void)untagResource:(AWSramUntagResourceRequest *)request
     completionHandler:(void (^)(AWSramUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSramUntagResourceResponse *> * _Nonnull task) {
        AWSramUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSramUpdateResourceShareResponse *> *)updateResourceShare:(AWSramUpdateResourceShareRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/updateresourceshare"
                  targetPrefix:@""
                 operationName:@"UpdateResourceShare"
                   outputClass:[AWSramUpdateResourceShareResponse class]];
}

- (void)updateResourceShare:(AWSramUpdateResourceShareRequest *)request
     completionHandler:(void (^)(AWSramUpdateResourceShareResponse *response, NSError *error))completionHandler {
    [[self updateResourceShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSramUpdateResourceShareResponse *> * _Nonnull task) {
        AWSramUpdateResourceShareResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
