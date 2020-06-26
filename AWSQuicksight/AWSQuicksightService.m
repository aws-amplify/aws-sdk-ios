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

#import "AWSQuicksightService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSQuicksightResources.h"

static NSString *const AWSInfoQuicksight = @"Quicksight";
NSString *const AWSQuicksightSDKVersion = @"2.13.5";


@interface AWSQuicksightResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSQuicksightResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSQuicksightErrorAccessDenied),
                            @"ConcurrentUpdatingException" : @(AWSQuicksightErrorConcurrentUpdating),
                            @"ConflictException" : @(AWSQuicksightErrorConflict),
                            @"DomainNotWhitelistedException" : @(AWSQuicksightErrorDomainNotWhitelisted),
                            @"IdentityTypeNotSupportedException" : @(AWSQuicksightErrorIdentityTypeNotSupported),
                            @"InternalFailureException" : @(AWSQuicksightErrorInternalFailure),
                            @"InvalidNextTokenException" : @(AWSQuicksightErrorInvalidNextToken),
                            @"InvalidParameterValueException" : @(AWSQuicksightErrorInvalidParameterValue),
                            @"LimitExceededException" : @(AWSQuicksightErrorLimitExceeded),
                            @"PreconditionNotMetException" : @(AWSQuicksightErrorPreconditionNotMet),
                            @"QuickSightUserNotFoundException" : @(AWSQuicksightErrorQuickSightUserNotFound),
                            @"ResourceExistsException" : @(AWSQuicksightErrorResourceExists),
                            @"ResourceNotFoundException" : @(AWSQuicksightErrorResourceNotFound),
                            @"ResourceUnavailableException" : @(AWSQuicksightErrorResourceUnavailable),
                            @"SessionLifetimeInMinutesInvalidException" : @(AWSQuicksightErrorSessionLifetimeInMinutesInvalid),
                            @"ThrottlingException" : @(AWSQuicksightErrorThrottling),
                            @"UnsupportedUserEditionException" : @(AWSQuicksightErrorUnsupportedUserEdition),
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
                    *error = [NSError errorWithDomain:AWSQuicksightErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSQuicksightErrorDomain
                                                 code:AWSQuicksightErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSQuicksightErrorDomain
                                     code:AWSQuicksightErrorUnknown
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

@interface AWSQuicksightRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSQuicksightRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSQuicksight()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSQuicksight

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSQuicksightSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSQuicksight versions need to match. Check your SDK installation. AWSCore: %@ AWSQuicksight: %@", AWSiOSSDKVersion, AWSQuicksightSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultQuicksight {
    static AWSQuicksight *_defaultQuicksight = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoQuicksight];
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
        _defaultQuicksight = [[AWSQuicksight alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultQuicksight;
}

+ (void)registerQuicksightWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSQuicksight alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)QuicksightForKey:(NSString *)key {
    @synchronized(self) {
        AWSQuicksight *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoQuicksight
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSQuicksight registerQuicksightWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeQuicksightForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultQuicksight` or `+ QuicksightForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceQuicksight
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceQuicksight];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSQuicksightRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.0"}; 
		
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSQuicksightResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSQuicksightResponseSerializer alloc] initWithJSONDefinition:[[AWSQuicksightResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSQuicksightCancelIngestionResponse *> *)cancelIngestion:(AWSQuicksightCancelIngestionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}"
                  targetPrefix:@""
                 operationName:@"CancelIngestion"
                   outputClass:[AWSQuicksightCancelIngestionResponse class]];
}

- (void)cancelIngestion:(AWSQuicksightCancelIngestionRequest *)request
     completionHandler:(void (^)(AWSQuicksightCancelIngestionResponse *response, NSError *error))completionHandler {
    [[self cancelIngestion:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightCancelIngestionResponse *> * _Nonnull task) {
        AWSQuicksightCancelIngestionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightCreateDashboardResponse *> *)createDashboard:(AWSQuicksightCreateDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/dashboards/{DashboardId}"
                  targetPrefix:@""
                 operationName:@"CreateDashboard"
                   outputClass:[AWSQuicksightCreateDashboardResponse class]];
}

- (void)createDashboard:(AWSQuicksightCreateDashboardRequest *)request
     completionHandler:(void (^)(AWSQuicksightCreateDashboardResponse *response, NSError *error))completionHandler {
    [[self createDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightCreateDashboardResponse *> * _Nonnull task) {
        AWSQuicksightCreateDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightCreateDataSetResponse *> *)createDataSet:(AWSQuicksightCreateDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/data-sets"
                  targetPrefix:@""
                 operationName:@"CreateDataSet"
                   outputClass:[AWSQuicksightCreateDataSetResponse class]];
}

- (void)createDataSet:(AWSQuicksightCreateDataSetRequest *)request
     completionHandler:(void (^)(AWSQuicksightCreateDataSetResponse *response, NSError *error))completionHandler {
    [[self createDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightCreateDataSetResponse *> * _Nonnull task) {
        AWSQuicksightCreateDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightCreateDataSourceResponse *> *)createDataSource:(AWSQuicksightCreateDataSourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/data-sources"
                  targetPrefix:@""
                 operationName:@"CreateDataSource"
                   outputClass:[AWSQuicksightCreateDataSourceResponse class]];
}

- (void)createDataSource:(AWSQuicksightCreateDataSourceRequest *)request
     completionHandler:(void (^)(AWSQuicksightCreateDataSourceResponse *response, NSError *error))completionHandler {
    [[self createDataSource:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightCreateDataSourceResponse *> * _Nonnull task) {
        AWSQuicksightCreateDataSourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightCreateGroupResponse *> *)createGroup:(AWSQuicksightCreateGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups"
                  targetPrefix:@""
                 operationName:@"CreateGroup"
                   outputClass:[AWSQuicksightCreateGroupResponse class]];
}

- (void)createGroup:(AWSQuicksightCreateGroupRequest *)request
     completionHandler:(void (^)(AWSQuicksightCreateGroupResponse *response, NSError *error))completionHandler {
    [[self createGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightCreateGroupResponse *> * _Nonnull task) {
        AWSQuicksightCreateGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightCreateGroupMembershipResponse *> *)createGroupMembership:(AWSQuicksightCreateGroupMembershipRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members/{MemberName}"
                  targetPrefix:@""
                 operationName:@"CreateGroupMembership"
                   outputClass:[AWSQuicksightCreateGroupMembershipResponse class]];
}

- (void)createGroupMembership:(AWSQuicksightCreateGroupMembershipRequest *)request
     completionHandler:(void (^)(AWSQuicksightCreateGroupMembershipResponse *response, NSError *error))completionHandler {
    [[self createGroupMembership:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightCreateGroupMembershipResponse *> * _Nonnull task) {
        AWSQuicksightCreateGroupMembershipResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightCreateIAMPolicyAssignmentResponse *> *)createIAMPolicyAssignment:(AWSQuicksightCreateIAMPolicyAssignmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/"
                  targetPrefix:@""
                 operationName:@"CreateIAMPolicyAssignment"
                   outputClass:[AWSQuicksightCreateIAMPolicyAssignmentResponse class]];
}

- (void)createIAMPolicyAssignment:(AWSQuicksightCreateIAMPolicyAssignmentRequest *)request
     completionHandler:(void (^)(AWSQuicksightCreateIAMPolicyAssignmentResponse *response, NSError *error))completionHandler {
    [[self createIAMPolicyAssignment:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightCreateIAMPolicyAssignmentResponse *> * _Nonnull task) {
        AWSQuicksightCreateIAMPolicyAssignmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightCreateIngestionResponse *> *)createIngestion:(AWSQuicksightCreateIngestionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}"
                  targetPrefix:@""
                 operationName:@"CreateIngestion"
                   outputClass:[AWSQuicksightCreateIngestionResponse class]];
}

- (void)createIngestion:(AWSQuicksightCreateIngestionRequest *)request
     completionHandler:(void (^)(AWSQuicksightCreateIngestionResponse *response, NSError *error))completionHandler {
    [[self createIngestion:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightCreateIngestionResponse *> * _Nonnull task) {
        AWSQuicksightCreateIngestionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightCreateTemplateResponse *> *)createTemplate:(AWSQuicksightCreateTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}"
                  targetPrefix:@""
                 operationName:@"CreateTemplate"
                   outputClass:[AWSQuicksightCreateTemplateResponse class]];
}

- (void)createTemplate:(AWSQuicksightCreateTemplateRequest *)request
     completionHandler:(void (^)(AWSQuicksightCreateTemplateResponse *response, NSError *error))completionHandler {
    [[self createTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightCreateTemplateResponse *> * _Nonnull task) {
        AWSQuicksightCreateTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightCreateTemplateAliasResponse *> *)createTemplateAlias:(AWSQuicksightCreateTemplateAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}"
                  targetPrefix:@""
                 operationName:@"CreateTemplateAlias"
                   outputClass:[AWSQuicksightCreateTemplateAliasResponse class]];
}

- (void)createTemplateAlias:(AWSQuicksightCreateTemplateAliasRequest *)request
     completionHandler:(void (^)(AWSQuicksightCreateTemplateAliasResponse *response, NSError *error))completionHandler {
    [[self createTemplateAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightCreateTemplateAliasResponse *> * _Nonnull task) {
        AWSQuicksightCreateTemplateAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDeleteDashboardResponse *> *)deleteDashboard:(AWSQuicksightDeleteDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/dashboards/{DashboardId}"
                  targetPrefix:@""
                 operationName:@"DeleteDashboard"
                   outputClass:[AWSQuicksightDeleteDashboardResponse class]];
}

- (void)deleteDashboard:(AWSQuicksightDeleteDashboardRequest *)request
     completionHandler:(void (^)(AWSQuicksightDeleteDashboardResponse *response, NSError *error))completionHandler {
    [[self deleteDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDeleteDashboardResponse *> * _Nonnull task) {
        AWSQuicksightDeleteDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDeleteDataSetResponse *> *)deleteDataSet:(AWSQuicksightDeleteDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/data-sets/{DataSetId}"
                  targetPrefix:@""
                 operationName:@"DeleteDataSet"
                   outputClass:[AWSQuicksightDeleteDataSetResponse class]];
}

- (void)deleteDataSet:(AWSQuicksightDeleteDataSetRequest *)request
     completionHandler:(void (^)(AWSQuicksightDeleteDataSetResponse *response, NSError *error))completionHandler {
    [[self deleteDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDeleteDataSetResponse *> * _Nonnull task) {
        AWSQuicksightDeleteDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDeleteDataSourceResponse *> *)deleteDataSource:(AWSQuicksightDeleteDataSourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/data-sources/{DataSourceId}"
                  targetPrefix:@""
                 operationName:@"DeleteDataSource"
                   outputClass:[AWSQuicksightDeleteDataSourceResponse class]];
}

- (void)deleteDataSource:(AWSQuicksightDeleteDataSourceRequest *)request
     completionHandler:(void (^)(AWSQuicksightDeleteDataSourceResponse *response, NSError *error))completionHandler {
    [[self deleteDataSource:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDeleteDataSourceResponse *> * _Nonnull task) {
        AWSQuicksightDeleteDataSourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDeleteGroupResponse *> *)deleteGroup:(AWSQuicksightDeleteGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}"
                  targetPrefix:@""
                 operationName:@"DeleteGroup"
                   outputClass:[AWSQuicksightDeleteGroupResponse class]];
}

- (void)deleteGroup:(AWSQuicksightDeleteGroupRequest *)request
     completionHandler:(void (^)(AWSQuicksightDeleteGroupResponse *response, NSError *error))completionHandler {
    [[self deleteGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDeleteGroupResponse *> * _Nonnull task) {
        AWSQuicksightDeleteGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDeleteGroupMembershipResponse *> *)deleteGroupMembership:(AWSQuicksightDeleteGroupMembershipRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members/{MemberName}"
                  targetPrefix:@""
                 operationName:@"DeleteGroupMembership"
                   outputClass:[AWSQuicksightDeleteGroupMembershipResponse class]];
}

- (void)deleteGroupMembership:(AWSQuicksightDeleteGroupMembershipRequest *)request
     completionHandler:(void (^)(AWSQuicksightDeleteGroupMembershipResponse *response, NSError *error))completionHandler {
    [[self deleteGroupMembership:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDeleteGroupMembershipResponse *> * _Nonnull task) {
        AWSQuicksightDeleteGroupMembershipResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDeleteIAMPolicyAssignmentResponse *> *)deleteIAMPolicyAssignment:(AWSQuicksightDeleteIAMPolicyAssignmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/namespace/{Namespace}/iam-policy-assignments/{AssignmentName}"
                  targetPrefix:@""
                 operationName:@"DeleteIAMPolicyAssignment"
                   outputClass:[AWSQuicksightDeleteIAMPolicyAssignmentResponse class]];
}

- (void)deleteIAMPolicyAssignment:(AWSQuicksightDeleteIAMPolicyAssignmentRequest *)request
     completionHandler:(void (^)(AWSQuicksightDeleteIAMPolicyAssignmentResponse *response, NSError *error))completionHandler {
    [[self deleteIAMPolicyAssignment:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDeleteIAMPolicyAssignmentResponse *> * _Nonnull task) {
        AWSQuicksightDeleteIAMPolicyAssignmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDeleteTemplateResponse *> *)deleteTemplate:(AWSQuicksightDeleteTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}"
                  targetPrefix:@""
                 operationName:@"DeleteTemplate"
                   outputClass:[AWSQuicksightDeleteTemplateResponse class]];
}

- (void)deleteTemplate:(AWSQuicksightDeleteTemplateRequest *)request
     completionHandler:(void (^)(AWSQuicksightDeleteTemplateResponse *response, NSError *error))completionHandler {
    [[self deleteTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDeleteTemplateResponse *> * _Nonnull task) {
        AWSQuicksightDeleteTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDeleteTemplateAliasResponse *> *)deleteTemplateAlias:(AWSQuicksightDeleteTemplateAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}"
                  targetPrefix:@""
                 operationName:@"DeleteTemplateAlias"
                   outputClass:[AWSQuicksightDeleteTemplateAliasResponse class]];
}

- (void)deleteTemplateAlias:(AWSQuicksightDeleteTemplateAliasRequest *)request
     completionHandler:(void (^)(AWSQuicksightDeleteTemplateAliasResponse *response, NSError *error))completionHandler {
    [[self deleteTemplateAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDeleteTemplateAliasResponse *> * _Nonnull task) {
        AWSQuicksightDeleteTemplateAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDeleteUserResponse *> *)deleteUser:(AWSQuicksightDeleteUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}"
                  targetPrefix:@""
                 operationName:@"DeleteUser"
                   outputClass:[AWSQuicksightDeleteUserResponse class]];
}

- (void)deleteUser:(AWSQuicksightDeleteUserRequest *)request
     completionHandler:(void (^)(AWSQuicksightDeleteUserResponse *response, NSError *error))completionHandler {
    [[self deleteUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDeleteUserResponse *> * _Nonnull task) {
        AWSQuicksightDeleteUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDeleteUserByPrincipalIdResponse *> *)deleteUserByPrincipalId:(AWSQuicksightDeleteUserByPrincipalIdRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/user-principals/{PrincipalId}"
                  targetPrefix:@""
                 operationName:@"DeleteUserByPrincipalId"
                   outputClass:[AWSQuicksightDeleteUserByPrincipalIdResponse class]];
}

- (void)deleteUserByPrincipalId:(AWSQuicksightDeleteUserByPrincipalIdRequest *)request
     completionHandler:(void (^)(AWSQuicksightDeleteUserByPrincipalIdResponse *response, NSError *error))completionHandler {
    [[self deleteUserByPrincipalId:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDeleteUserByPrincipalIdResponse *> * _Nonnull task) {
        AWSQuicksightDeleteUserByPrincipalIdResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeDashboardResponse *> *)describeDashboard:(AWSQuicksightDescribeDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/dashboards/{DashboardId}"
                  targetPrefix:@""
                 operationName:@"DescribeDashboard"
                   outputClass:[AWSQuicksightDescribeDashboardResponse class]];
}

- (void)describeDashboard:(AWSQuicksightDescribeDashboardRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeDashboardResponse *response, NSError *error))completionHandler {
    [[self describeDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeDashboardResponse *> * _Nonnull task) {
        AWSQuicksightDescribeDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeDashboardPermissionsResponse *> *)describeDashboardPermissions:(AWSQuicksightDescribeDashboardPermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/dashboards/{DashboardId}/permissions"
                  targetPrefix:@""
                 operationName:@"DescribeDashboardPermissions"
                   outputClass:[AWSQuicksightDescribeDashboardPermissionsResponse class]];
}

- (void)describeDashboardPermissions:(AWSQuicksightDescribeDashboardPermissionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeDashboardPermissionsResponse *response, NSError *error))completionHandler {
    [[self describeDashboardPermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeDashboardPermissionsResponse *> * _Nonnull task) {
        AWSQuicksightDescribeDashboardPermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeDataSetResponse *> *)describeDataSet:(AWSQuicksightDescribeDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/data-sets/{DataSetId}"
                  targetPrefix:@""
                 operationName:@"DescribeDataSet"
                   outputClass:[AWSQuicksightDescribeDataSetResponse class]];
}

- (void)describeDataSet:(AWSQuicksightDescribeDataSetRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeDataSetResponse *response, NSError *error))completionHandler {
    [[self describeDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeDataSetResponse *> * _Nonnull task) {
        AWSQuicksightDescribeDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeDataSetPermissionsResponse *> *)describeDataSetPermissions:(AWSQuicksightDescribeDataSetPermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/data-sets/{DataSetId}/permissions"
                  targetPrefix:@""
                 operationName:@"DescribeDataSetPermissions"
                   outputClass:[AWSQuicksightDescribeDataSetPermissionsResponse class]];
}

- (void)describeDataSetPermissions:(AWSQuicksightDescribeDataSetPermissionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeDataSetPermissionsResponse *response, NSError *error))completionHandler {
    [[self describeDataSetPermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeDataSetPermissionsResponse *> * _Nonnull task) {
        AWSQuicksightDescribeDataSetPermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeDataSourceResponse *> *)describeDataSource:(AWSQuicksightDescribeDataSourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/data-sources/{DataSourceId}"
                  targetPrefix:@""
                 operationName:@"DescribeDataSource"
                   outputClass:[AWSQuicksightDescribeDataSourceResponse class]];
}

- (void)describeDataSource:(AWSQuicksightDescribeDataSourceRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeDataSourceResponse *response, NSError *error))completionHandler {
    [[self describeDataSource:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeDataSourceResponse *> * _Nonnull task) {
        AWSQuicksightDescribeDataSourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeDataSourcePermissionsResponse *> *)describeDataSourcePermissions:(AWSQuicksightDescribeDataSourcePermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/data-sources/{DataSourceId}/permissions"
                  targetPrefix:@""
                 operationName:@"DescribeDataSourcePermissions"
                   outputClass:[AWSQuicksightDescribeDataSourcePermissionsResponse class]];
}

- (void)describeDataSourcePermissions:(AWSQuicksightDescribeDataSourcePermissionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeDataSourcePermissionsResponse *response, NSError *error))completionHandler {
    [[self describeDataSourcePermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeDataSourcePermissionsResponse *> * _Nonnull task) {
        AWSQuicksightDescribeDataSourcePermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeGroupResponse *> *)describeGroup:(AWSQuicksightDescribeGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}"
                  targetPrefix:@""
                 operationName:@"DescribeGroup"
                   outputClass:[AWSQuicksightDescribeGroupResponse class]];
}

- (void)describeGroup:(AWSQuicksightDescribeGroupRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeGroupResponse *response, NSError *error))completionHandler {
    [[self describeGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeGroupResponse *> * _Nonnull task) {
        AWSQuicksightDescribeGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeIAMPolicyAssignmentResponse *> *)describeIAMPolicyAssignment:(AWSQuicksightDescribeIAMPolicyAssignmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/{AssignmentName}"
                  targetPrefix:@""
                 operationName:@"DescribeIAMPolicyAssignment"
                   outputClass:[AWSQuicksightDescribeIAMPolicyAssignmentResponse class]];
}

- (void)describeIAMPolicyAssignment:(AWSQuicksightDescribeIAMPolicyAssignmentRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeIAMPolicyAssignmentResponse *response, NSError *error))completionHandler {
    [[self describeIAMPolicyAssignment:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeIAMPolicyAssignmentResponse *> * _Nonnull task) {
        AWSQuicksightDescribeIAMPolicyAssignmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeIngestionResponse *> *)describeIngestion:(AWSQuicksightDescribeIngestionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions/{IngestionId}"
                  targetPrefix:@""
                 operationName:@"DescribeIngestion"
                   outputClass:[AWSQuicksightDescribeIngestionResponse class]];
}

- (void)describeIngestion:(AWSQuicksightDescribeIngestionRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeIngestionResponse *response, NSError *error))completionHandler {
    [[self describeIngestion:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeIngestionResponse *> * _Nonnull task) {
        AWSQuicksightDescribeIngestionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeTemplateResponse *> *)describeTemplate:(AWSQuicksightDescribeTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}"
                  targetPrefix:@""
                 operationName:@"DescribeTemplate"
                   outputClass:[AWSQuicksightDescribeTemplateResponse class]];
}

- (void)describeTemplate:(AWSQuicksightDescribeTemplateRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeTemplateResponse *response, NSError *error))completionHandler {
    [[self describeTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeTemplateResponse *> * _Nonnull task) {
        AWSQuicksightDescribeTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeTemplateAliasResponse *> *)describeTemplateAlias:(AWSQuicksightDescribeTemplateAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}"
                  targetPrefix:@""
                 operationName:@"DescribeTemplateAlias"
                   outputClass:[AWSQuicksightDescribeTemplateAliasResponse class]];
}

- (void)describeTemplateAlias:(AWSQuicksightDescribeTemplateAliasRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeTemplateAliasResponse *response, NSError *error))completionHandler {
    [[self describeTemplateAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeTemplateAliasResponse *> * _Nonnull task) {
        AWSQuicksightDescribeTemplateAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeTemplatePermissionsResponse *> *)describeTemplatePermissions:(AWSQuicksightDescribeTemplatePermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}/permissions"
                  targetPrefix:@""
                 operationName:@"DescribeTemplatePermissions"
                   outputClass:[AWSQuicksightDescribeTemplatePermissionsResponse class]];
}

- (void)describeTemplatePermissions:(AWSQuicksightDescribeTemplatePermissionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeTemplatePermissionsResponse *response, NSError *error))completionHandler {
    [[self describeTemplatePermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeTemplatePermissionsResponse *> * _Nonnull task) {
        AWSQuicksightDescribeTemplatePermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightDescribeUserResponse *> *)describeUser:(AWSQuicksightDescribeUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}"
                  targetPrefix:@""
                 operationName:@"DescribeUser"
                   outputClass:[AWSQuicksightDescribeUserResponse class]];
}

- (void)describeUser:(AWSQuicksightDescribeUserRequest *)request
     completionHandler:(void (^)(AWSQuicksightDescribeUserResponse *response, NSError *error))completionHandler {
    [[self describeUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightDescribeUserResponse *> * _Nonnull task) {
        AWSQuicksightDescribeUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightGetDashboardEmbedUrlResponse *> *)getDashboardEmbedUrl:(AWSQuicksightGetDashboardEmbedUrlRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/dashboards/{DashboardId}/embed-url"
                  targetPrefix:@""
                 operationName:@"GetDashboardEmbedUrl"
                   outputClass:[AWSQuicksightGetDashboardEmbedUrlResponse class]];
}

- (void)getDashboardEmbedUrl:(AWSQuicksightGetDashboardEmbedUrlRequest *)request
     completionHandler:(void (^)(AWSQuicksightGetDashboardEmbedUrlResponse *response, NSError *error))completionHandler {
    [[self getDashboardEmbedUrl:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightGetDashboardEmbedUrlResponse *> * _Nonnull task) {
        AWSQuicksightGetDashboardEmbedUrlResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListDashboardVersionsResponse *> *)listDashboardVersions:(AWSQuicksightListDashboardVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/dashboards/{DashboardId}/versions"
                  targetPrefix:@""
                 operationName:@"ListDashboardVersions"
                   outputClass:[AWSQuicksightListDashboardVersionsResponse class]];
}

- (void)listDashboardVersions:(AWSQuicksightListDashboardVersionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightListDashboardVersionsResponse *response, NSError *error))completionHandler {
    [[self listDashboardVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListDashboardVersionsResponse *> * _Nonnull task) {
        AWSQuicksightListDashboardVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListDashboardsResponse *> *)listDashboards:(AWSQuicksightListDashboardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/dashboards"
                  targetPrefix:@""
                 operationName:@"ListDashboards"
                   outputClass:[AWSQuicksightListDashboardsResponse class]];
}

- (void)listDashboards:(AWSQuicksightListDashboardsRequest *)request
     completionHandler:(void (^)(AWSQuicksightListDashboardsResponse *response, NSError *error))completionHandler {
    [[self listDashboards:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListDashboardsResponse *> * _Nonnull task) {
        AWSQuicksightListDashboardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListDataSetsResponse *> *)listDataSets:(AWSQuicksightListDataSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/data-sets"
                  targetPrefix:@""
                 operationName:@"ListDataSets"
                   outputClass:[AWSQuicksightListDataSetsResponse class]];
}

- (void)listDataSets:(AWSQuicksightListDataSetsRequest *)request
     completionHandler:(void (^)(AWSQuicksightListDataSetsResponse *response, NSError *error))completionHandler {
    [[self listDataSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListDataSetsResponse *> * _Nonnull task) {
        AWSQuicksightListDataSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListDataSourcesResponse *> *)listDataSources:(AWSQuicksightListDataSourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/data-sources"
                  targetPrefix:@""
                 operationName:@"ListDataSources"
                   outputClass:[AWSQuicksightListDataSourcesResponse class]];
}

- (void)listDataSources:(AWSQuicksightListDataSourcesRequest *)request
     completionHandler:(void (^)(AWSQuicksightListDataSourcesResponse *response, NSError *error))completionHandler {
    [[self listDataSources:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListDataSourcesResponse *> * _Nonnull task) {
        AWSQuicksightListDataSourcesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListGroupMembershipsResponse *> *)listGroupMemberships:(AWSQuicksightListGroupMembershipsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}/members"
                  targetPrefix:@""
                 operationName:@"ListGroupMemberships"
                   outputClass:[AWSQuicksightListGroupMembershipsResponse class]];
}

- (void)listGroupMemberships:(AWSQuicksightListGroupMembershipsRequest *)request
     completionHandler:(void (^)(AWSQuicksightListGroupMembershipsResponse *response, NSError *error))completionHandler {
    [[self listGroupMemberships:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListGroupMembershipsResponse *> * _Nonnull task) {
        AWSQuicksightListGroupMembershipsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListGroupsResponse *> *)listGroups:(AWSQuicksightListGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups"
                  targetPrefix:@""
                 operationName:@"ListGroups"
                   outputClass:[AWSQuicksightListGroupsResponse class]];
}

- (void)listGroups:(AWSQuicksightListGroupsRequest *)request
     completionHandler:(void (^)(AWSQuicksightListGroupsResponse *response, NSError *error))completionHandler {
    [[self listGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListGroupsResponse *> * _Nonnull task) {
        AWSQuicksightListGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListIAMPolicyAssignmentsResponse *> *)listIAMPolicyAssignments:(AWSQuicksightListIAMPolicyAssignmentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments"
                  targetPrefix:@""
                 operationName:@"ListIAMPolicyAssignments"
                   outputClass:[AWSQuicksightListIAMPolicyAssignmentsResponse class]];
}

- (void)listIAMPolicyAssignments:(AWSQuicksightListIAMPolicyAssignmentsRequest *)request
     completionHandler:(void (^)(AWSQuicksightListIAMPolicyAssignmentsResponse *response, NSError *error))completionHandler {
    [[self listIAMPolicyAssignments:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListIAMPolicyAssignmentsResponse *> * _Nonnull task) {
        AWSQuicksightListIAMPolicyAssignmentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListIAMPolicyAssignmentsForUserResponse *> *)listIAMPolicyAssignmentsForUser:(AWSQuicksightListIAMPolicyAssignmentsForUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}/iam-policy-assignments"
                  targetPrefix:@""
                 operationName:@"ListIAMPolicyAssignmentsForUser"
                   outputClass:[AWSQuicksightListIAMPolicyAssignmentsForUserResponse class]];
}

- (void)listIAMPolicyAssignmentsForUser:(AWSQuicksightListIAMPolicyAssignmentsForUserRequest *)request
     completionHandler:(void (^)(AWSQuicksightListIAMPolicyAssignmentsForUserResponse *response, NSError *error))completionHandler {
    [[self listIAMPolicyAssignmentsForUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListIAMPolicyAssignmentsForUserResponse *> * _Nonnull task) {
        AWSQuicksightListIAMPolicyAssignmentsForUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListIngestionsResponse *> *)listIngestions:(AWSQuicksightListIngestionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/data-sets/{DataSetId}/ingestions"
                  targetPrefix:@""
                 operationName:@"ListIngestions"
                   outputClass:[AWSQuicksightListIngestionsResponse class]];
}

- (void)listIngestions:(AWSQuicksightListIngestionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightListIngestionsResponse *response, NSError *error))completionHandler {
    [[self listIngestions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListIngestionsResponse *> * _Nonnull task) {
        AWSQuicksightListIngestionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListTagsForResourceResponse *> *)listTagsForResource:(AWSQuicksightListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/resources/{ResourceArn}/tags"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSQuicksightListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSQuicksightListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSQuicksightListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListTagsForResourceResponse *> * _Nonnull task) {
        AWSQuicksightListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListTemplateAliasesResponse *> *)listTemplateAliases:(AWSQuicksightListTemplateAliasesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}/aliases"
                  targetPrefix:@""
                 operationName:@"ListTemplateAliases"
                   outputClass:[AWSQuicksightListTemplateAliasesResponse class]];
}

- (void)listTemplateAliases:(AWSQuicksightListTemplateAliasesRequest *)request
     completionHandler:(void (^)(AWSQuicksightListTemplateAliasesResponse *response, NSError *error))completionHandler {
    [[self listTemplateAliases:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListTemplateAliasesResponse *> * _Nonnull task) {
        AWSQuicksightListTemplateAliasesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListTemplateVersionsResponse *> *)listTemplateVersions:(AWSQuicksightListTemplateVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}/versions"
                  targetPrefix:@""
                 operationName:@"ListTemplateVersions"
                   outputClass:[AWSQuicksightListTemplateVersionsResponse class]];
}

- (void)listTemplateVersions:(AWSQuicksightListTemplateVersionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightListTemplateVersionsResponse *response, NSError *error))completionHandler {
    [[self listTemplateVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListTemplateVersionsResponse *> * _Nonnull task) {
        AWSQuicksightListTemplateVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListTemplatesResponse *> *)listTemplates:(AWSQuicksightListTemplatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/templates"
                  targetPrefix:@""
                 operationName:@"ListTemplates"
                   outputClass:[AWSQuicksightListTemplatesResponse class]];
}

- (void)listTemplates:(AWSQuicksightListTemplatesRequest *)request
     completionHandler:(void (^)(AWSQuicksightListTemplatesResponse *response, NSError *error))completionHandler {
    [[self listTemplates:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListTemplatesResponse *> * _Nonnull task) {
        AWSQuicksightListTemplatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListUserGroupsResponse *> *)listUserGroups:(AWSQuicksightListUserGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}/groups"
                  targetPrefix:@""
                 operationName:@"ListUserGroups"
                   outputClass:[AWSQuicksightListUserGroupsResponse class]];
}

- (void)listUserGroups:(AWSQuicksightListUserGroupsRequest *)request
     completionHandler:(void (^)(AWSQuicksightListUserGroupsResponse *response, NSError *error))completionHandler {
    [[self listUserGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListUserGroupsResponse *> * _Nonnull task) {
        AWSQuicksightListUserGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightListUsersResponse *> *)listUsers:(AWSQuicksightListUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/users"
                  targetPrefix:@""
                 operationName:@"ListUsers"
                   outputClass:[AWSQuicksightListUsersResponse class]];
}

- (void)listUsers:(AWSQuicksightListUsersRequest *)request
     completionHandler:(void (^)(AWSQuicksightListUsersResponse *response, NSError *error))completionHandler {
    [[self listUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightListUsersResponse *> * _Nonnull task) {
        AWSQuicksightListUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightRegisterUserResponse *> *)registerUser:(AWSQuicksightRegisterUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/users"
                  targetPrefix:@""
                 operationName:@"RegisterUser"
                   outputClass:[AWSQuicksightRegisterUserResponse class]];
}

- (void)registerUser:(AWSQuicksightRegisterUserRequest *)request
     completionHandler:(void (^)(AWSQuicksightRegisterUserResponse *response, NSError *error))completionHandler {
    [[self registerUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightRegisterUserResponse *> * _Nonnull task) {
        AWSQuicksightRegisterUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightSearchDashboardsResponse *> *)searchDashboards:(AWSQuicksightSearchDashboardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/search/dashboards"
                  targetPrefix:@""
                 operationName:@"SearchDashboards"
                   outputClass:[AWSQuicksightSearchDashboardsResponse class]];
}

- (void)searchDashboards:(AWSQuicksightSearchDashboardsRequest *)request
     completionHandler:(void (^)(AWSQuicksightSearchDashboardsResponse *response, NSError *error))completionHandler {
    [[self searchDashboards:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightSearchDashboardsResponse *> * _Nonnull task) {
        AWSQuicksightSearchDashboardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightTagResourceResponse *> *)tagResource:(AWSQuicksightTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/resources/{ResourceArn}/tags"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSQuicksightTagResourceResponse class]];
}

- (void)tagResource:(AWSQuicksightTagResourceRequest *)request
     completionHandler:(void (^)(AWSQuicksightTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightTagResourceResponse *> * _Nonnull task) {
        AWSQuicksightTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUntagResourceResponse *> *)untagResource:(AWSQuicksightUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/resources/{ResourceArn}/tags"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSQuicksightUntagResourceResponse class]];
}

- (void)untagResource:(AWSQuicksightUntagResourceRequest *)request
     completionHandler:(void (^)(AWSQuicksightUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUntagResourceResponse *> * _Nonnull task) {
        AWSQuicksightUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateDashboardResponse *> *)updateDashboard:(AWSQuicksightUpdateDashboardRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/dashboards/{DashboardId}"
                  targetPrefix:@""
                 operationName:@"UpdateDashboard"
                   outputClass:[AWSQuicksightUpdateDashboardResponse class]];
}

- (void)updateDashboard:(AWSQuicksightUpdateDashboardRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateDashboardResponse *response, NSError *error))completionHandler {
    [[self updateDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateDashboardResponse *> * _Nonnull task) {
        AWSQuicksightUpdateDashboardResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateDashboardPermissionsResponse *> *)updateDashboardPermissions:(AWSQuicksightUpdateDashboardPermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/dashboards/{DashboardId}/permissions"
                  targetPrefix:@""
                 operationName:@"UpdateDashboardPermissions"
                   outputClass:[AWSQuicksightUpdateDashboardPermissionsResponse class]];
}

- (void)updateDashboardPermissions:(AWSQuicksightUpdateDashboardPermissionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateDashboardPermissionsResponse *response, NSError *error))completionHandler {
    [[self updateDashboardPermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateDashboardPermissionsResponse *> * _Nonnull task) {
        AWSQuicksightUpdateDashboardPermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateDashboardPublishedVersionResponse *> *)updateDashboardPublishedVersion:(AWSQuicksightUpdateDashboardPublishedVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/dashboards/{DashboardId}/versions/{VersionNumber}"
                  targetPrefix:@""
                 operationName:@"UpdateDashboardPublishedVersion"
                   outputClass:[AWSQuicksightUpdateDashboardPublishedVersionResponse class]];
}

- (void)updateDashboardPublishedVersion:(AWSQuicksightUpdateDashboardPublishedVersionRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateDashboardPublishedVersionResponse *response, NSError *error))completionHandler {
    [[self updateDashboardPublishedVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateDashboardPublishedVersionResponse *> * _Nonnull task) {
        AWSQuicksightUpdateDashboardPublishedVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateDataSetResponse *> *)updateDataSet:(AWSQuicksightUpdateDataSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/data-sets/{DataSetId}"
                  targetPrefix:@""
                 operationName:@"UpdateDataSet"
                   outputClass:[AWSQuicksightUpdateDataSetResponse class]];
}

- (void)updateDataSet:(AWSQuicksightUpdateDataSetRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateDataSetResponse *response, NSError *error))completionHandler {
    [[self updateDataSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateDataSetResponse *> * _Nonnull task) {
        AWSQuicksightUpdateDataSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateDataSetPermissionsResponse *> *)updateDataSetPermissions:(AWSQuicksightUpdateDataSetPermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/data-sets/{DataSetId}/permissions"
                  targetPrefix:@""
                 operationName:@"UpdateDataSetPermissions"
                   outputClass:[AWSQuicksightUpdateDataSetPermissionsResponse class]];
}

- (void)updateDataSetPermissions:(AWSQuicksightUpdateDataSetPermissionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateDataSetPermissionsResponse *response, NSError *error))completionHandler {
    [[self updateDataSetPermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateDataSetPermissionsResponse *> * _Nonnull task) {
        AWSQuicksightUpdateDataSetPermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateDataSourceResponse *> *)updateDataSource:(AWSQuicksightUpdateDataSourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/data-sources/{DataSourceId}"
                  targetPrefix:@""
                 operationName:@"UpdateDataSource"
                   outputClass:[AWSQuicksightUpdateDataSourceResponse class]];
}

- (void)updateDataSource:(AWSQuicksightUpdateDataSourceRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateDataSourceResponse *response, NSError *error))completionHandler {
    [[self updateDataSource:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateDataSourceResponse *> * _Nonnull task) {
        AWSQuicksightUpdateDataSourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateDataSourcePermissionsResponse *> *)updateDataSourcePermissions:(AWSQuicksightUpdateDataSourcePermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{AwsAccountId}/data-sources/{DataSourceId}/permissions"
                  targetPrefix:@""
                 operationName:@"UpdateDataSourcePermissions"
                   outputClass:[AWSQuicksightUpdateDataSourcePermissionsResponse class]];
}

- (void)updateDataSourcePermissions:(AWSQuicksightUpdateDataSourcePermissionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateDataSourcePermissionsResponse *response, NSError *error))completionHandler {
    [[self updateDataSourcePermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateDataSourcePermissionsResponse *> * _Nonnull task) {
        AWSQuicksightUpdateDataSourcePermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateGroupResponse *> *)updateGroup:(AWSQuicksightUpdateGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/groups/{GroupName}"
                  targetPrefix:@""
                 operationName:@"UpdateGroup"
                   outputClass:[AWSQuicksightUpdateGroupResponse class]];
}

- (void)updateGroup:(AWSQuicksightUpdateGroupRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateGroupResponse *response, NSError *error))completionHandler {
    [[self updateGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateGroupResponse *> * _Nonnull task) {
        AWSQuicksightUpdateGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateIAMPolicyAssignmentResponse *> *)updateIAMPolicyAssignment:(AWSQuicksightUpdateIAMPolicyAssignmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/iam-policy-assignments/{AssignmentName}"
                  targetPrefix:@""
                 operationName:@"UpdateIAMPolicyAssignment"
                   outputClass:[AWSQuicksightUpdateIAMPolicyAssignmentResponse class]];
}

- (void)updateIAMPolicyAssignment:(AWSQuicksightUpdateIAMPolicyAssignmentRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateIAMPolicyAssignmentResponse *response, NSError *error))completionHandler {
    [[self updateIAMPolicyAssignment:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateIAMPolicyAssignmentResponse *> * _Nonnull task) {
        AWSQuicksightUpdateIAMPolicyAssignmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateTemplateResponse *> *)updateTemplate:(AWSQuicksightUpdateTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}"
                  targetPrefix:@""
                 operationName:@"UpdateTemplate"
                   outputClass:[AWSQuicksightUpdateTemplateResponse class]];
}

- (void)updateTemplate:(AWSQuicksightUpdateTemplateRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateTemplateResponse *response, NSError *error))completionHandler {
    [[self updateTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateTemplateResponse *> * _Nonnull task) {
        AWSQuicksightUpdateTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateTemplateAliasResponse *> *)updateTemplateAlias:(AWSQuicksightUpdateTemplateAliasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}/aliases/{AliasName}"
                  targetPrefix:@""
                 operationName:@"UpdateTemplateAlias"
                   outputClass:[AWSQuicksightUpdateTemplateAliasResponse class]];
}

- (void)updateTemplateAlias:(AWSQuicksightUpdateTemplateAliasRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateTemplateAliasResponse *response, NSError *error))completionHandler {
    [[self updateTemplateAlias:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateTemplateAliasResponse *> * _Nonnull task) {
        AWSQuicksightUpdateTemplateAliasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateTemplatePermissionsResponse *> *)updateTemplatePermissions:(AWSQuicksightUpdateTemplatePermissionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/templates/{TemplateId}/permissions"
                  targetPrefix:@""
                 operationName:@"UpdateTemplatePermissions"
                   outputClass:[AWSQuicksightUpdateTemplatePermissionsResponse class]];
}

- (void)updateTemplatePermissions:(AWSQuicksightUpdateTemplatePermissionsRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateTemplatePermissionsResponse *response, NSError *error))completionHandler {
    [[self updateTemplatePermissions:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateTemplatePermissionsResponse *> * _Nonnull task) {
        AWSQuicksightUpdateTemplatePermissionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSQuicksightUpdateUserResponse *> *)updateUser:(AWSQuicksightUpdateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{AwsAccountId}/namespaces/{Namespace}/users/{UserName}"
                  targetPrefix:@""
                 operationName:@"UpdateUser"
                   outputClass:[AWSQuicksightUpdateUserResponse class]];
}

- (void)updateUser:(AWSQuicksightUpdateUserRequest *)request
     completionHandler:(void (^)(AWSQuicksightUpdateUserResponse *response, NSError *error))completionHandler {
    [[self updateUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSQuicksightUpdateUserResponse *> * _Nonnull task) {
        AWSQuicksightUpdateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
