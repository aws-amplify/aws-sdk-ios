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

#import "AWSSecurityhubService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSecurityhubResources.h"

static NSString *const AWSInfoSecurityhub = @"Securityhub";
NSString *const AWSSecurityhubSDKVersion = @"2.13.3";


@interface AWSSecurityhubResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSecurityhubResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSSecurityhubErrorAccessDenied),
                            @"InternalException" : @(AWSSecurityhubErrorInternal),
                            @"InvalidAccessException" : @(AWSSecurityhubErrorInvalidAccess),
                            @"InvalidInputException" : @(AWSSecurityhubErrorInvalidInput),
                            @"LimitExceededException" : @(AWSSecurityhubErrorLimitExceeded),
                            @"ResourceConflictException" : @(AWSSecurityhubErrorResourceConflict),
                            @"ResourceNotFoundException" : @(AWSSecurityhubErrorResourceNotFound),
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
                    *error = [NSError errorWithDomain:AWSSecurityhubErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSSecurityhubErrorDomain
                                                 code:AWSSecurityhubErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSSecurityhubErrorDomain
                                     code:AWSSecurityhubErrorUnknown
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

@interface AWSSecurityhubRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSecurityhubRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSecurityhub()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSecurityhub

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSecurityhubSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSecurityhub versions need to match. Check your SDK installation. AWSCore: %@ AWSSecurityhub: %@", AWSiOSSDKVersion, AWSSecurityhubSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSecurityhub {
    static AWSSecurityhub *_defaultSecurityhub = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSecurityhub];
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
        _defaultSecurityhub = [[AWSSecurityhub alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSecurityhub;
}

+ (void)registerSecurityhubWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSecurityhub alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SecurityhubForKey:(NSString *)key {
    @synchronized(self) {
        AWSSecurityhub *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSecurityhub
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSecurityhub registerSecurityhubWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSecurityhubForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSecurityhub` or `+ SecurityhubForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSecurityhub
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSecurityhub];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSecurityhubRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSecurityhubResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSecurityhubResponseSerializer alloc] initWithJSONDefinition:[[AWSSecurityhubResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSecurityhubAcceptInvitationResponse *> *)acceptInvitation:(AWSSecurityhubAcceptInvitationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/master"
                  targetPrefix:@""
                 operationName:@"AcceptInvitation"
                   outputClass:[AWSSecurityhubAcceptInvitationResponse class]];
}

- (void)acceptInvitation:(AWSSecurityhubAcceptInvitationRequest *)request
     completionHandler:(void (^)(AWSSecurityhubAcceptInvitationResponse *response, NSError *error))completionHandler {
    [[self acceptInvitation:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubAcceptInvitationResponse *> * _Nonnull task) {
        AWSSecurityhubAcceptInvitationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubBatchDisableStandardsResponse *> *)batchDisableStandards:(AWSSecurityhubBatchDisableStandardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/standards/deregister"
                  targetPrefix:@""
                 operationName:@"BatchDisableStandards"
                   outputClass:[AWSSecurityhubBatchDisableStandardsResponse class]];
}

- (void)batchDisableStandards:(AWSSecurityhubBatchDisableStandardsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubBatchDisableStandardsResponse *response, NSError *error))completionHandler {
    [[self batchDisableStandards:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubBatchDisableStandardsResponse *> * _Nonnull task) {
        AWSSecurityhubBatchDisableStandardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubBatchEnableStandardsResponse *> *)batchEnableStandards:(AWSSecurityhubBatchEnableStandardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/standards/register"
                  targetPrefix:@""
                 operationName:@"BatchEnableStandards"
                   outputClass:[AWSSecurityhubBatchEnableStandardsResponse class]];
}

- (void)batchEnableStandards:(AWSSecurityhubBatchEnableStandardsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubBatchEnableStandardsResponse *response, NSError *error))completionHandler {
    [[self batchEnableStandards:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubBatchEnableStandardsResponse *> * _Nonnull task) {
        AWSSecurityhubBatchEnableStandardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubBatchImportFindingsResponse *> *)batchImportFindings:(AWSSecurityhubBatchImportFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/findings/import"
                  targetPrefix:@""
                 operationName:@"BatchImportFindings"
                   outputClass:[AWSSecurityhubBatchImportFindingsResponse class]];
}

- (void)batchImportFindings:(AWSSecurityhubBatchImportFindingsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubBatchImportFindingsResponse *response, NSError *error))completionHandler {
    [[self batchImportFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubBatchImportFindingsResponse *> * _Nonnull task) {
        AWSSecurityhubBatchImportFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubBatchUpdateFindingsResponse *> *)batchUpdateFindings:(AWSSecurityhubBatchUpdateFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/findings/batchupdate"
                  targetPrefix:@""
                 operationName:@"BatchUpdateFindings"
                   outputClass:[AWSSecurityhubBatchUpdateFindingsResponse class]];
}

- (void)batchUpdateFindings:(AWSSecurityhubBatchUpdateFindingsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubBatchUpdateFindingsResponse *response, NSError *error))completionHandler {
    [[self batchUpdateFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubBatchUpdateFindingsResponse *> * _Nonnull task) {
        AWSSecurityhubBatchUpdateFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubCreateActionTargetResponse *> *)createActionTarget:(AWSSecurityhubCreateActionTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/actionTargets"
                  targetPrefix:@""
                 operationName:@"CreateActionTarget"
                   outputClass:[AWSSecurityhubCreateActionTargetResponse class]];
}

- (void)createActionTarget:(AWSSecurityhubCreateActionTargetRequest *)request
     completionHandler:(void (^)(AWSSecurityhubCreateActionTargetResponse *response, NSError *error))completionHandler {
    [[self createActionTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubCreateActionTargetResponse *> * _Nonnull task) {
        AWSSecurityhubCreateActionTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubCreateInsightResponse *> *)createInsight:(AWSSecurityhubCreateInsightRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/insights"
                  targetPrefix:@""
                 operationName:@"CreateInsight"
                   outputClass:[AWSSecurityhubCreateInsightResponse class]];
}

- (void)createInsight:(AWSSecurityhubCreateInsightRequest *)request
     completionHandler:(void (^)(AWSSecurityhubCreateInsightResponse *response, NSError *error))completionHandler {
    [[self createInsight:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubCreateInsightResponse *> * _Nonnull task) {
        AWSSecurityhubCreateInsightResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubCreateMembersResponse *> *)createMembers:(AWSSecurityhubCreateMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/members"
                  targetPrefix:@""
                 operationName:@"CreateMembers"
                   outputClass:[AWSSecurityhubCreateMembersResponse class]];
}

- (void)createMembers:(AWSSecurityhubCreateMembersRequest *)request
     completionHandler:(void (^)(AWSSecurityhubCreateMembersResponse *response, NSError *error))completionHandler {
    [[self createMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubCreateMembersResponse *> * _Nonnull task) {
        AWSSecurityhubCreateMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDeclineInvitationsResponse *> *)declineInvitations:(AWSSecurityhubDeclineInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/invitations/decline"
                  targetPrefix:@""
                 operationName:@"DeclineInvitations"
                   outputClass:[AWSSecurityhubDeclineInvitationsResponse class]];
}

- (void)declineInvitations:(AWSSecurityhubDeclineInvitationsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDeclineInvitationsResponse *response, NSError *error))completionHandler {
    [[self declineInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDeclineInvitationsResponse *> * _Nonnull task) {
        AWSSecurityhubDeclineInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDeleteActionTargetResponse *> *)deleteActionTarget:(AWSSecurityhubDeleteActionTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/actionTargets/{ActionTargetArn+}"
                  targetPrefix:@""
                 operationName:@"DeleteActionTarget"
                   outputClass:[AWSSecurityhubDeleteActionTargetResponse class]];
}

- (void)deleteActionTarget:(AWSSecurityhubDeleteActionTargetRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDeleteActionTargetResponse *response, NSError *error))completionHandler {
    [[self deleteActionTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDeleteActionTargetResponse *> * _Nonnull task) {
        AWSSecurityhubDeleteActionTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDeleteInsightResponse *> *)deleteInsight:(AWSSecurityhubDeleteInsightRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/insights/{InsightArn+}"
                  targetPrefix:@""
                 operationName:@"DeleteInsight"
                   outputClass:[AWSSecurityhubDeleteInsightResponse class]];
}

- (void)deleteInsight:(AWSSecurityhubDeleteInsightRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDeleteInsightResponse *response, NSError *error))completionHandler {
    [[self deleteInsight:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDeleteInsightResponse *> * _Nonnull task) {
        AWSSecurityhubDeleteInsightResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDeleteInvitationsResponse *> *)deleteInvitations:(AWSSecurityhubDeleteInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/invitations/delete"
                  targetPrefix:@""
                 operationName:@"DeleteInvitations"
                   outputClass:[AWSSecurityhubDeleteInvitationsResponse class]];
}

- (void)deleteInvitations:(AWSSecurityhubDeleteInvitationsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDeleteInvitationsResponse *response, NSError *error))completionHandler {
    [[self deleteInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDeleteInvitationsResponse *> * _Nonnull task) {
        AWSSecurityhubDeleteInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDeleteMembersResponse *> *)deleteMembers:(AWSSecurityhubDeleteMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/members/delete"
                  targetPrefix:@""
                 operationName:@"DeleteMembers"
                   outputClass:[AWSSecurityhubDeleteMembersResponse class]];
}

- (void)deleteMembers:(AWSSecurityhubDeleteMembersRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDeleteMembersResponse *response, NSError *error))completionHandler {
    [[self deleteMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDeleteMembersResponse *> * _Nonnull task) {
        AWSSecurityhubDeleteMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDescribeActionTargetsResponse *> *)describeActionTargets:(AWSSecurityhubDescribeActionTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/actionTargets/get"
                  targetPrefix:@""
                 operationName:@"DescribeActionTargets"
                   outputClass:[AWSSecurityhubDescribeActionTargetsResponse class]];
}

- (void)describeActionTargets:(AWSSecurityhubDescribeActionTargetsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDescribeActionTargetsResponse *response, NSError *error))completionHandler {
    [[self describeActionTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDescribeActionTargetsResponse *> * _Nonnull task) {
        AWSSecurityhubDescribeActionTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDescribeHubResponse *> *)describeHub:(AWSSecurityhubDescribeHubRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts"
                  targetPrefix:@""
                 operationName:@"DescribeHub"
                   outputClass:[AWSSecurityhubDescribeHubResponse class]];
}

- (void)describeHub:(AWSSecurityhubDescribeHubRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDescribeHubResponse *response, NSError *error))completionHandler {
    [[self describeHub:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDescribeHubResponse *> * _Nonnull task) {
        AWSSecurityhubDescribeHubResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDescribeProductsResponse *> *)describeProducts:(AWSSecurityhubDescribeProductsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/products"
                  targetPrefix:@""
                 operationName:@"DescribeProducts"
                   outputClass:[AWSSecurityhubDescribeProductsResponse class]];
}

- (void)describeProducts:(AWSSecurityhubDescribeProductsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDescribeProductsResponse *response, NSError *error))completionHandler {
    [[self describeProducts:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDescribeProductsResponse *> * _Nonnull task) {
        AWSSecurityhubDescribeProductsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDescribeStandardsResponse *> *)describeStandards:(AWSSecurityhubDescribeStandardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/standards"
                  targetPrefix:@""
                 operationName:@"DescribeStandards"
                   outputClass:[AWSSecurityhubDescribeStandardsResponse class]];
}

- (void)describeStandards:(AWSSecurityhubDescribeStandardsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDescribeStandardsResponse *response, NSError *error))completionHandler {
    [[self describeStandards:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDescribeStandardsResponse *> * _Nonnull task) {
        AWSSecurityhubDescribeStandardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDescribeStandardsControlsResponse *> *)describeStandardsControls:(AWSSecurityhubDescribeStandardsControlsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/standards/controls/{StandardsSubscriptionArn+}"
                  targetPrefix:@""
                 operationName:@"DescribeStandardsControls"
                   outputClass:[AWSSecurityhubDescribeStandardsControlsResponse class]];
}

- (void)describeStandardsControls:(AWSSecurityhubDescribeStandardsControlsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDescribeStandardsControlsResponse *response, NSError *error))completionHandler {
    [[self describeStandardsControls:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDescribeStandardsControlsResponse *> * _Nonnull task) {
        AWSSecurityhubDescribeStandardsControlsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDisableImportFindingsForProductResponse *> *)disableImportFindingsForProduct:(AWSSecurityhubDisableImportFindingsForProductRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/productSubscriptions/{ProductSubscriptionArn+}"
                  targetPrefix:@""
                 operationName:@"DisableImportFindingsForProduct"
                   outputClass:[AWSSecurityhubDisableImportFindingsForProductResponse class]];
}

- (void)disableImportFindingsForProduct:(AWSSecurityhubDisableImportFindingsForProductRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDisableImportFindingsForProductResponse *response, NSError *error))completionHandler {
    [[self disableImportFindingsForProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDisableImportFindingsForProductResponse *> * _Nonnull task) {
        AWSSecurityhubDisableImportFindingsForProductResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDisableSecurityHubResponse *> *)disableSecurityHub:(AWSSecurityhubDisableSecurityHubRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts"
                  targetPrefix:@""
                 operationName:@"DisableSecurityHub"
                   outputClass:[AWSSecurityhubDisableSecurityHubResponse class]];
}

- (void)disableSecurityHub:(AWSSecurityhubDisableSecurityHubRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDisableSecurityHubResponse *response, NSError *error))completionHandler {
    [[self disableSecurityHub:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDisableSecurityHubResponse *> * _Nonnull task) {
        AWSSecurityhubDisableSecurityHubResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDisassociateFromMasterAccountResponse *> *)disassociateFromMasterAccount:(AWSSecurityhubDisassociateFromMasterAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/master/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateFromMasterAccount"
                   outputClass:[AWSSecurityhubDisassociateFromMasterAccountResponse class]];
}

- (void)disassociateFromMasterAccount:(AWSSecurityhubDisassociateFromMasterAccountRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDisassociateFromMasterAccountResponse *response, NSError *error))completionHandler {
    [[self disassociateFromMasterAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDisassociateFromMasterAccountResponse *> * _Nonnull task) {
        AWSSecurityhubDisassociateFromMasterAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubDisassociateMembersResponse *> *)disassociateMembers:(AWSSecurityhubDisassociateMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/members/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateMembers"
                   outputClass:[AWSSecurityhubDisassociateMembersResponse class]];
}

- (void)disassociateMembers:(AWSSecurityhubDisassociateMembersRequest *)request
     completionHandler:(void (^)(AWSSecurityhubDisassociateMembersResponse *response, NSError *error))completionHandler {
    [[self disassociateMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubDisassociateMembersResponse *> * _Nonnull task) {
        AWSSecurityhubDisassociateMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubEnableImportFindingsForProductResponse *> *)enableImportFindingsForProduct:(AWSSecurityhubEnableImportFindingsForProductRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/productSubscriptions"
                  targetPrefix:@""
                 operationName:@"EnableImportFindingsForProduct"
                   outputClass:[AWSSecurityhubEnableImportFindingsForProductResponse class]];
}

- (void)enableImportFindingsForProduct:(AWSSecurityhubEnableImportFindingsForProductRequest *)request
     completionHandler:(void (^)(AWSSecurityhubEnableImportFindingsForProductResponse *response, NSError *error))completionHandler {
    [[self enableImportFindingsForProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubEnableImportFindingsForProductResponse *> * _Nonnull task) {
        AWSSecurityhubEnableImportFindingsForProductResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubEnableSecurityHubResponse *> *)enableSecurityHub:(AWSSecurityhubEnableSecurityHubRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts"
                  targetPrefix:@""
                 operationName:@"EnableSecurityHub"
                   outputClass:[AWSSecurityhubEnableSecurityHubResponse class]];
}

- (void)enableSecurityHub:(AWSSecurityhubEnableSecurityHubRequest *)request
     completionHandler:(void (^)(AWSSecurityhubEnableSecurityHubResponse *response, NSError *error))completionHandler {
    [[self enableSecurityHub:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubEnableSecurityHubResponse *> * _Nonnull task) {
        AWSSecurityhubEnableSecurityHubResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubGetEnabledStandardsResponse *> *)getEnabledStandards:(AWSSecurityhubGetEnabledStandardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/standards/get"
                  targetPrefix:@""
                 operationName:@"GetEnabledStandards"
                   outputClass:[AWSSecurityhubGetEnabledStandardsResponse class]];
}

- (void)getEnabledStandards:(AWSSecurityhubGetEnabledStandardsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubGetEnabledStandardsResponse *response, NSError *error))completionHandler {
    [[self getEnabledStandards:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubGetEnabledStandardsResponse *> * _Nonnull task) {
        AWSSecurityhubGetEnabledStandardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubGetFindingsResponse *> *)getFindings:(AWSSecurityhubGetFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/findings"
                  targetPrefix:@""
                 operationName:@"GetFindings"
                   outputClass:[AWSSecurityhubGetFindingsResponse class]];
}

- (void)getFindings:(AWSSecurityhubGetFindingsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubGetFindingsResponse *response, NSError *error))completionHandler {
    [[self getFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubGetFindingsResponse *> * _Nonnull task) {
        AWSSecurityhubGetFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubGetInsightResultsResponse *> *)getInsightResults:(AWSSecurityhubGetInsightResultsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/insights/results/{InsightArn+}"
                  targetPrefix:@""
                 operationName:@"GetInsightResults"
                   outputClass:[AWSSecurityhubGetInsightResultsResponse class]];
}

- (void)getInsightResults:(AWSSecurityhubGetInsightResultsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubGetInsightResultsResponse *response, NSError *error))completionHandler {
    [[self getInsightResults:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubGetInsightResultsResponse *> * _Nonnull task) {
        AWSSecurityhubGetInsightResultsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubGetInsightsResponse *> *)getInsights:(AWSSecurityhubGetInsightsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/insights/get"
                  targetPrefix:@""
                 operationName:@"GetInsights"
                   outputClass:[AWSSecurityhubGetInsightsResponse class]];
}

- (void)getInsights:(AWSSecurityhubGetInsightsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubGetInsightsResponse *response, NSError *error))completionHandler {
    [[self getInsights:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubGetInsightsResponse *> * _Nonnull task) {
        AWSSecurityhubGetInsightsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubGetInvitationsCountResponse *> *)getInvitationsCount:(AWSSecurityhubGetInvitationsCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/invitations/count"
                  targetPrefix:@""
                 operationName:@"GetInvitationsCount"
                   outputClass:[AWSSecurityhubGetInvitationsCountResponse class]];
}

- (void)getInvitationsCount:(AWSSecurityhubGetInvitationsCountRequest *)request
     completionHandler:(void (^)(AWSSecurityhubGetInvitationsCountResponse *response, NSError *error))completionHandler {
    [[self getInvitationsCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubGetInvitationsCountResponse *> * _Nonnull task) {
        AWSSecurityhubGetInvitationsCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubGetMasterAccountResponse *> *)getMasterAccount:(AWSSecurityhubGetMasterAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/master"
                  targetPrefix:@""
                 operationName:@"GetMasterAccount"
                   outputClass:[AWSSecurityhubGetMasterAccountResponse class]];
}

- (void)getMasterAccount:(AWSSecurityhubGetMasterAccountRequest *)request
     completionHandler:(void (^)(AWSSecurityhubGetMasterAccountResponse *response, NSError *error))completionHandler {
    [[self getMasterAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubGetMasterAccountResponse *> * _Nonnull task) {
        AWSSecurityhubGetMasterAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubGetMembersResponse *> *)getMembers:(AWSSecurityhubGetMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/members/get"
                  targetPrefix:@""
                 operationName:@"GetMembers"
                   outputClass:[AWSSecurityhubGetMembersResponse class]];
}

- (void)getMembers:(AWSSecurityhubGetMembersRequest *)request
     completionHandler:(void (^)(AWSSecurityhubGetMembersResponse *response, NSError *error))completionHandler {
    [[self getMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubGetMembersResponse *> * _Nonnull task) {
        AWSSecurityhubGetMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubInviteMembersResponse *> *)inviteMembers:(AWSSecurityhubInviteMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/members/invite"
                  targetPrefix:@""
                 operationName:@"InviteMembers"
                   outputClass:[AWSSecurityhubInviteMembersResponse class]];
}

- (void)inviteMembers:(AWSSecurityhubInviteMembersRequest *)request
     completionHandler:(void (^)(AWSSecurityhubInviteMembersResponse *response, NSError *error))completionHandler {
    [[self inviteMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubInviteMembersResponse *> * _Nonnull task) {
        AWSSecurityhubInviteMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubListEnabledProductsForImportResponse *> *)listEnabledProductsForImport:(AWSSecurityhubListEnabledProductsForImportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/productSubscriptions"
                  targetPrefix:@""
                 operationName:@"ListEnabledProductsForImport"
                   outputClass:[AWSSecurityhubListEnabledProductsForImportResponse class]];
}

- (void)listEnabledProductsForImport:(AWSSecurityhubListEnabledProductsForImportRequest *)request
     completionHandler:(void (^)(AWSSecurityhubListEnabledProductsForImportResponse *response, NSError *error))completionHandler {
    [[self listEnabledProductsForImport:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubListEnabledProductsForImportResponse *> * _Nonnull task) {
        AWSSecurityhubListEnabledProductsForImportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubListInvitationsResponse *> *)listInvitations:(AWSSecurityhubListInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/invitations"
                  targetPrefix:@""
                 operationName:@"ListInvitations"
                   outputClass:[AWSSecurityhubListInvitationsResponse class]];
}

- (void)listInvitations:(AWSSecurityhubListInvitationsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubListInvitationsResponse *response, NSError *error))completionHandler {
    [[self listInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubListInvitationsResponse *> * _Nonnull task) {
        AWSSecurityhubListInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubListMembersResponse *> *)listMembers:(AWSSecurityhubListMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/members"
                  targetPrefix:@""
                 operationName:@"ListMembers"
                   outputClass:[AWSSecurityhubListMembersResponse class]];
}

- (void)listMembers:(AWSSecurityhubListMembersRequest *)request
     completionHandler:(void (^)(AWSSecurityhubListMembersResponse *response, NSError *error))completionHandler {
    [[self listMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubListMembersResponse *> * _Nonnull task) {
        AWSSecurityhubListMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubListTagsForResourceResponse *> *)listTagsForResource:(AWSSecurityhubListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSSecurityhubListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSSecurityhubListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSSecurityhubListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubListTagsForResourceResponse *> * _Nonnull task) {
        AWSSecurityhubListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubTagResourceResponse *> *)tagResource:(AWSSecurityhubTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSSecurityhubTagResourceResponse class]];
}

- (void)tagResource:(AWSSecurityhubTagResourceRequest *)request
     completionHandler:(void (^)(AWSSecurityhubTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubTagResourceResponse *> * _Nonnull task) {
        AWSSecurityhubTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubUntagResourceResponse *> *)untagResource:(AWSSecurityhubUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSSecurityhubUntagResourceResponse class]];
}

- (void)untagResource:(AWSSecurityhubUntagResourceRequest *)request
     completionHandler:(void (^)(AWSSecurityhubUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubUntagResourceResponse *> * _Nonnull task) {
        AWSSecurityhubUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubUpdateActionTargetResponse *> *)updateActionTarget:(AWSSecurityhubUpdateActionTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/actionTargets/{ActionTargetArn+}"
                  targetPrefix:@""
                 operationName:@"UpdateActionTarget"
                   outputClass:[AWSSecurityhubUpdateActionTargetResponse class]];
}

- (void)updateActionTarget:(AWSSecurityhubUpdateActionTargetRequest *)request
     completionHandler:(void (^)(AWSSecurityhubUpdateActionTargetResponse *response, NSError *error))completionHandler {
    [[self updateActionTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubUpdateActionTargetResponse *> * _Nonnull task) {
        AWSSecurityhubUpdateActionTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubUpdateFindingsResponse *> *)updateFindings:(AWSSecurityhubUpdateFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/findings"
                  targetPrefix:@""
                 operationName:@"UpdateFindings"
                   outputClass:[AWSSecurityhubUpdateFindingsResponse class]];
}

- (void)updateFindings:(AWSSecurityhubUpdateFindingsRequest *)request
     completionHandler:(void (^)(AWSSecurityhubUpdateFindingsResponse *response, NSError *error))completionHandler {
    [[self updateFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubUpdateFindingsResponse *> * _Nonnull task) {
        AWSSecurityhubUpdateFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubUpdateInsightResponse *> *)updateInsight:(AWSSecurityhubUpdateInsightRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/insights/{InsightArn+}"
                  targetPrefix:@""
                 operationName:@"UpdateInsight"
                   outputClass:[AWSSecurityhubUpdateInsightResponse class]];
}

- (void)updateInsight:(AWSSecurityhubUpdateInsightRequest *)request
     completionHandler:(void (^)(AWSSecurityhubUpdateInsightResponse *response, NSError *error))completionHandler {
    [[self updateInsight:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubUpdateInsightResponse *> * _Nonnull task) {
        AWSSecurityhubUpdateInsightResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSecurityhubUpdateStandardsControlResponse *> *)updateStandardsControl:(AWSSecurityhubUpdateStandardsControlRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/standards/control/{StandardsControlArn+}"
                  targetPrefix:@""
                 operationName:@"UpdateStandardsControl"
                   outputClass:[AWSSecurityhubUpdateStandardsControlResponse class]];
}

- (void)updateStandardsControl:(AWSSecurityhubUpdateStandardsControlRequest *)request
     completionHandler:(void (^)(AWSSecurityhubUpdateStandardsControlResponse *response, NSError *error))completionHandler {
    [[self updateStandardsControl:request] continueWithBlock:^id _Nullable(AWSTask<AWSSecurityhubUpdateStandardsControlResponse *> * _Nonnull task) {
        AWSSecurityhubUpdateStandardsControlResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
