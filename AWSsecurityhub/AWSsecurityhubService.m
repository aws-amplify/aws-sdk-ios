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

#import "AWSsecurityhubService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSsecurityhubResources.h"

static NSString *const AWSInfosecurityhub = @"securityhub";
NSString *const AWSsecurityhubSDKVersion = @"2.13.2";


@interface AWSsecurityhubResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSsecurityhubResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSsecurityhubErrorAccessDenied),
                            @"InternalException" : @(AWSsecurityhubErrorInternal),
                            @"InvalidAccessException" : @(AWSsecurityhubErrorInvalidAccess),
                            @"InvalidInputException" : @(AWSsecurityhubErrorInvalidInput),
                            @"LimitExceededException" : @(AWSsecurityhubErrorLimitExceeded),
                            @"ResourceConflictException" : @(AWSsecurityhubErrorResourceConflict),
                            @"ResourceNotFoundException" : @(AWSsecurityhubErrorResourceNotFound),
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
                    *error = [NSError errorWithDomain:AWSsecurityhubErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSsecurityhubErrorDomain
                                                 code:AWSsecurityhubErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSsecurityhubErrorDomain
                                     code:AWSsecurityhubErrorUnknown
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

@interface AWSsecurityhubRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSsecurityhubRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSsecurityhub()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSsecurityhub

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSsecurityhubSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSsecurityhub versions need to match. Check your SDK installation. AWSCore: %@ AWSsecurityhub: %@", AWSiOSSDKVersion, AWSsecurityhubSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultsecurityhub {
    static AWSsecurityhub *_defaultsecurityhub = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfosecurityhub];
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
        _defaultsecurityhub = [[AWSsecurityhub alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultsecurityhub;
}

+ (void)registersecurityhubWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSsecurityhub alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)securityhubForKey:(NSString *)key {
    @synchronized(self) {
        AWSsecurityhub *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfosecurityhub
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSsecurityhub registersecurityhubWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removesecurityhubForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultsecurityhub` or `+ securityhubForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicesecurityhub
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicesecurityhub];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSsecurityhubRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSsecurityhubResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSsecurityhubResponseSerializer alloc] initWithJSONDefinition:[[AWSsecurityhubResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSsecurityhubAcceptInvitationResponse *> *)acceptInvitation:(AWSsecurityhubAcceptInvitationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/master"
                  targetPrefix:@""
                 operationName:@"AcceptInvitation"
                   outputClass:[AWSsecurityhubAcceptInvitationResponse class]];
}

- (void)acceptInvitation:(AWSsecurityhubAcceptInvitationRequest *)request
     completionHandler:(void (^)(AWSsecurityhubAcceptInvitationResponse *response, NSError *error))completionHandler {
    [[self acceptInvitation:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubAcceptInvitationResponse *> * _Nonnull task) {
        AWSsecurityhubAcceptInvitationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubBatchDisableStandardsResponse *> *)batchDisableStandards:(AWSsecurityhubBatchDisableStandardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/standards/deregister"
                  targetPrefix:@""
                 operationName:@"BatchDisableStandards"
                   outputClass:[AWSsecurityhubBatchDisableStandardsResponse class]];
}

- (void)batchDisableStandards:(AWSsecurityhubBatchDisableStandardsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubBatchDisableStandardsResponse *response, NSError *error))completionHandler {
    [[self batchDisableStandards:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubBatchDisableStandardsResponse *> * _Nonnull task) {
        AWSsecurityhubBatchDisableStandardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubBatchEnableStandardsResponse *> *)batchEnableStandards:(AWSsecurityhubBatchEnableStandardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/standards/register"
                  targetPrefix:@""
                 operationName:@"BatchEnableStandards"
                   outputClass:[AWSsecurityhubBatchEnableStandardsResponse class]];
}

- (void)batchEnableStandards:(AWSsecurityhubBatchEnableStandardsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubBatchEnableStandardsResponse *response, NSError *error))completionHandler {
    [[self batchEnableStandards:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubBatchEnableStandardsResponse *> * _Nonnull task) {
        AWSsecurityhubBatchEnableStandardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubBatchImportFindingsResponse *> *)batchImportFindings:(AWSsecurityhubBatchImportFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/findings/import"
                  targetPrefix:@""
                 operationName:@"BatchImportFindings"
                   outputClass:[AWSsecurityhubBatchImportFindingsResponse class]];
}

- (void)batchImportFindings:(AWSsecurityhubBatchImportFindingsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubBatchImportFindingsResponse *response, NSError *error))completionHandler {
    [[self batchImportFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubBatchImportFindingsResponse *> * _Nonnull task) {
        AWSsecurityhubBatchImportFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubBatchUpdateFindingsResponse *> *)batchUpdateFindings:(AWSsecurityhubBatchUpdateFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/findings/batchupdate"
                  targetPrefix:@""
                 operationName:@"BatchUpdateFindings"
                   outputClass:[AWSsecurityhubBatchUpdateFindingsResponse class]];
}

- (void)batchUpdateFindings:(AWSsecurityhubBatchUpdateFindingsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubBatchUpdateFindingsResponse *response, NSError *error))completionHandler {
    [[self batchUpdateFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubBatchUpdateFindingsResponse *> * _Nonnull task) {
        AWSsecurityhubBatchUpdateFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubCreateActionTargetResponse *> *)createActionTarget:(AWSsecurityhubCreateActionTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/actionTargets"
                  targetPrefix:@""
                 operationName:@"CreateActionTarget"
                   outputClass:[AWSsecurityhubCreateActionTargetResponse class]];
}

- (void)createActionTarget:(AWSsecurityhubCreateActionTargetRequest *)request
     completionHandler:(void (^)(AWSsecurityhubCreateActionTargetResponse *response, NSError *error))completionHandler {
    [[self createActionTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubCreateActionTargetResponse *> * _Nonnull task) {
        AWSsecurityhubCreateActionTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubCreateInsightResponse *> *)createInsight:(AWSsecurityhubCreateInsightRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/insights"
                  targetPrefix:@""
                 operationName:@"CreateInsight"
                   outputClass:[AWSsecurityhubCreateInsightResponse class]];
}

- (void)createInsight:(AWSsecurityhubCreateInsightRequest *)request
     completionHandler:(void (^)(AWSsecurityhubCreateInsightResponse *response, NSError *error))completionHandler {
    [[self createInsight:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubCreateInsightResponse *> * _Nonnull task) {
        AWSsecurityhubCreateInsightResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubCreateMembersResponse *> *)createMembers:(AWSsecurityhubCreateMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/members"
                  targetPrefix:@""
                 operationName:@"CreateMembers"
                   outputClass:[AWSsecurityhubCreateMembersResponse class]];
}

- (void)createMembers:(AWSsecurityhubCreateMembersRequest *)request
     completionHandler:(void (^)(AWSsecurityhubCreateMembersResponse *response, NSError *error))completionHandler {
    [[self createMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubCreateMembersResponse *> * _Nonnull task) {
        AWSsecurityhubCreateMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDeclineInvitationsResponse *> *)declineInvitations:(AWSsecurityhubDeclineInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/invitations/decline"
                  targetPrefix:@""
                 operationName:@"DeclineInvitations"
                   outputClass:[AWSsecurityhubDeclineInvitationsResponse class]];
}

- (void)declineInvitations:(AWSsecurityhubDeclineInvitationsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDeclineInvitationsResponse *response, NSError *error))completionHandler {
    [[self declineInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDeclineInvitationsResponse *> * _Nonnull task) {
        AWSsecurityhubDeclineInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDeleteActionTargetResponse *> *)deleteActionTarget:(AWSsecurityhubDeleteActionTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/actionTargets/{ActionTargetArn+}"
                  targetPrefix:@""
                 operationName:@"DeleteActionTarget"
                   outputClass:[AWSsecurityhubDeleteActionTargetResponse class]];
}

- (void)deleteActionTarget:(AWSsecurityhubDeleteActionTargetRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDeleteActionTargetResponse *response, NSError *error))completionHandler {
    [[self deleteActionTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDeleteActionTargetResponse *> * _Nonnull task) {
        AWSsecurityhubDeleteActionTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDeleteInsightResponse *> *)deleteInsight:(AWSsecurityhubDeleteInsightRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/insights/{InsightArn+}"
                  targetPrefix:@""
                 operationName:@"DeleteInsight"
                   outputClass:[AWSsecurityhubDeleteInsightResponse class]];
}

- (void)deleteInsight:(AWSsecurityhubDeleteInsightRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDeleteInsightResponse *response, NSError *error))completionHandler {
    [[self deleteInsight:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDeleteInsightResponse *> * _Nonnull task) {
        AWSsecurityhubDeleteInsightResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDeleteInvitationsResponse *> *)deleteInvitations:(AWSsecurityhubDeleteInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/invitations/delete"
                  targetPrefix:@""
                 operationName:@"DeleteInvitations"
                   outputClass:[AWSsecurityhubDeleteInvitationsResponse class]];
}

- (void)deleteInvitations:(AWSsecurityhubDeleteInvitationsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDeleteInvitationsResponse *response, NSError *error))completionHandler {
    [[self deleteInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDeleteInvitationsResponse *> * _Nonnull task) {
        AWSsecurityhubDeleteInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDeleteMembersResponse *> *)deleteMembers:(AWSsecurityhubDeleteMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/members/delete"
                  targetPrefix:@""
                 operationName:@"DeleteMembers"
                   outputClass:[AWSsecurityhubDeleteMembersResponse class]];
}

- (void)deleteMembers:(AWSsecurityhubDeleteMembersRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDeleteMembersResponse *response, NSError *error))completionHandler {
    [[self deleteMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDeleteMembersResponse *> * _Nonnull task) {
        AWSsecurityhubDeleteMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDescribeActionTargetsResponse *> *)describeActionTargets:(AWSsecurityhubDescribeActionTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/actionTargets/get"
                  targetPrefix:@""
                 operationName:@"DescribeActionTargets"
                   outputClass:[AWSsecurityhubDescribeActionTargetsResponse class]];
}

- (void)describeActionTargets:(AWSsecurityhubDescribeActionTargetsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDescribeActionTargetsResponse *response, NSError *error))completionHandler {
    [[self describeActionTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDescribeActionTargetsResponse *> * _Nonnull task) {
        AWSsecurityhubDescribeActionTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDescribeHubResponse *> *)describeHub:(AWSsecurityhubDescribeHubRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts"
                  targetPrefix:@""
                 operationName:@"DescribeHub"
                   outputClass:[AWSsecurityhubDescribeHubResponse class]];
}

- (void)describeHub:(AWSsecurityhubDescribeHubRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDescribeHubResponse *response, NSError *error))completionHandler {
    [[self describeHub:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDescribeHubResponse *> * _Nonnull task) {
        AWSsecurityhubDescribeHubResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDescribeProductsResponse *> *)describeProducts:(AWSsecurityhubDescribeProductsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/products"
                  targetPrefix:@""
                 operationName:@"DescribeProducts"
                   outputClass:[AWSsecurityhubDescribeProductsResponse class]];
}

- (void)describeProducts:(AWSsecurityhubDescribeProductsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDescribeProductsResponse *response, NSError *error))completionHandler {
    [[self describeProducts:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDescribeProductsResponse *> * _Nonnull task) {
        AWSsecurityhubDescribeProductsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDescribeStandardsResponse *> *)describeStandards:(AWSsecurityhubDescribeStandardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/standards"
                  targetPrefix:@""
                 operationName:@"DescribeStandards"
                   outputClass:[AWSsecurityhubDescribeStandardsResponse class]];
}

- (void)describeStandards:(AWSsecurityhubDescribeStandardsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDescribeStandardsResponse *response, NSError *error))completionHandler {
    [[self describeStandards:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDescribeStandardsResponse *> * _Nonnull task) {
        AWSsecurityhubDescribeStandardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDescribeStandardsControlsResponse *> *)describeStandardsControls:(AWSsecurityhubDescribeStandardsControlsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/standards/controls/{StandardsSubscriptionArn+}"
                  targetPrefix:@""
                 operationName:@"DescribeStandardsControls"
                   outputClass:[AWSsecurityhubDescribeStandardsControlsResponse class]];
}

- (void)describeStandardsControls:(AWSsecurityhubDescribeStandardsControlsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDescribeStandardsControlsResponse *response, NSError *error))completionHandler {
    [[self describeStandardsControls:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDescribeStandardsControlsResponse *> * _Nonnull task) {
        AWSsecurityhubDescribeStandardsControlsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDisableImportFindingsForProductResponse *> *)disableImportFindingsForProduct:(AWSsecurityhubDisableImportFindingsForProductRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/productSubscriptions/{ProductSubscriptionArn+}"
                  targetPrefix:@""
                 operationName:@"DisableImportFindingsForProduct"
                   outputClass:[AWSsecurityhubDisableImportFindingsForProductResponse class]];
}

- (void)disableImportFindingsForProduct:(AWSsecurityhubDisableImportFindingsForProductRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDisableImportFindingsForProductResponse *response, NSError *error))completionHandler {
    [[self disableImportFindingsForProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDisableImportFindingsForProductResponse *> * _Nonnull task) {
        AWSsecurityhubDisableImportFindingsForProductResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDisableSecurityHubResponse *> *)disableSecurityHub:(AWSsecurityhubDisableSecurityHubRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts"
                  targetPrefix:@""
                 operationName:@"DisableSecurityHub"
                   outputClass:[AWSsecurityhubDisableSecurityHubResponse class]];
}

- (void)disableSecurityHub:(AWSsecurityhubDisableSecurityHubRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDisableSecurityHubResponse *response, NSError *error))completionHandler {
    [[self disableSecurityHub:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDisableSecurityHubResponse *> * _Nonnull task) {
        AWSsecurityhubDisableSecurityHubResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDisassociateFromMasterAccountResponse *> *)disassociateFromMasterAccount:(AWSsecurityhubDisassociateFromMasterAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/master/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateFromMasterAccount"
                   outputClass:[AWSsecurityhubDisassociateFromMasterAccountResponse class]];
}

- (void)disassociateFromMasterAccount:(AWSsecurityhubDisassociateFromMasterAccountRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDisassociateFromMasterAccountResponse *response, NSError *error))completionHandler {
    [[self disassociateFromMasterAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDisassociateFromMasterAccountResponse *> * _Nonnull task) {
        AWSsecurityhubDisassociateFromMasterAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubDisassociateMembersResponse *> *)disassociateMembers:(AWSsecurityhubDisassociateMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/members/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateMembers"
                   outputClass:[AWSsecurityhubDisassociateMembersResponse class]];
}

- (void)disassociateMembers:(AWSsecurityhubDisassociateMembersRequest *)request
     completionHandler:(void (^)(AWSsecurityhubDisassociateMembersResponse *response, NSError *error))completionHandler {
    [[self disassociateMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubDisassociateMembersResponse *> * _Nonnull task) {
        AWSsecurityhubDisassociateMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubEnableImportFindingsForProductResponse *> *)enableImportFindingsForProduct:(AWSsecurityhubEnableImportFindingsForProductRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/productSubscriptions"
                  targetPrefix:@""
                 operationName:@"EnableImportFindingsForProduct"
                   outputClass:[AWSsecurityhubEnableImportFindingsForProductResponse class]];
}

- (void)enableImportFindingsForProduct:(AWSsecurityhubEnableImportFindingsForProductRequest *)request
     completionHandler:(void (^)(AWSsecurityhubEnableImportFindingsForProductResponse *response, NSError *error))completionHandler {
    [[self enableImportFindingsForProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubEnableImportFindingsForProductResponse *> * _Nonnull task) {
        AWSsecurityhubEnableImportFindingsForProductResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubEnableSecurityHubResponse *> *)enableSecurityHub:(AWSsecurityhubEnableSecurityHubRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts"
                  targetPrefix:@""
                 operationName:@"EnableSecurityHub"
                   outputClass:[AWSsecurityhubEnableSecurityHubResponse class]];
}

- (void)enableSecurityHub:(AWSsecurityhubEnableSecurityHubRequest *)request
     completionHandler:(void (^)(AWSsecurityhubEnableSecurityHubResponse *response, NSError *error))completionHandler {
    [[self enableSecurityHub:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubEnableSecurityHubResponse *> * _Nonnull task) {
        AWSsecurityhubEnableSecurityHubResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubGetEnabledStandardsResponse *> *)getEnabledStandards:(AWSsecurityhubGetEnabledStandardsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/standards/get"
                  targetPrefix:@""
                 operationName:@"GetEnabledStandards"
                   outputClass:[AWSsecurityhubGetEnabledStandardsResponse class]];
}

- (void)getEnabledStandards:(AWSsecurityhubGetEnabledStandardsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubGetEnabledStandardsResponse *response, NSError *error))completionHandler {
    [[self getEnabledStandards:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubGetEnabledStandardsResponse *> * _Nonnull task) {
        AWSsecurityhubGetEnabledStandardsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubGetFindingsResponse *> *)getFindings:(AWSsecurityhubGetFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/findings"
                  targetPrefix:@""
                 operationName:@"GetFindings"
                   outputClass:[AWSsecurityhubGetFindingsResponse class]];
}

- (void)getFindings:(AWSsecurityhubGetFindingsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubGetFindingsResponse *response, NSError *error))completionHandler {
    [[self getFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubGetFindingsResponse *> * _Nonnull task) {
        AWSsecurityhubGetFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubGetInsightResultsResponse *> *)getInsightResults:(AWSsecurityhubGetInsightResultsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/insights/results/{InsightArn+}"
                  targetPrefix:@""
                 operationName:@"GetInsightResults"
                   outputClass:[AWSsecurityhubGetInsightResultsResponse class]];
}

- (void)getInsightResults:(AWSsecurityhubGetInsightResultsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubGetInsightResultsResponse *response, NSError *error))completionHandler {
    [[self getInsightResults:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubGetInsightResultsResponse *> * _Nonnull task) {
        AWSsecurityhubGetInsightResultsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubGetInsightsResponse *> *)getInsights:(AWSsecurityhubGetInsightsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/insights/get"
                  targetPrefix:@""
                 operationName:@"GetInsights"
                   outputClass:[AWSsecurityhubGetInsightsResponse class]];
}

- (void)getInsights:(AWSsecurityhubGetInsightsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubGetInsightsResponse *response, NSError *error))completionHandler {
    [[self getInsights:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubGetInsightsResponse *> * _Nonnull task) {
        AWSsecurityhubGetInsightsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubGetInvitationsCountResponse *> *)getInvitationsCount:(AWSsecurityhubGetInvitationsCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/invitations/count"
                  targetPrefix:@""
                 operationName:@"GetInvitationsCount"
                   outputClass:[AWSsecurityhubGetInvitationsCountResponse class]];
}

- (void)getInvitationsCount:(AWSsecurityhubGetInvitationsCountRequest *)request
     completionHandler:(void (^)(AWSsecurityhubGetInvitationsCountResponse *response, NSError *error))completionHandler {
    [[self getInvitationsCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubGetInvitationsCountResponse *> * _Nonnull task) {
        AWSsecurityhubGetInvitationsCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubGetMasterAccountResponse *> *)getMasterAccount:(AWSsecurityhubGetMasterAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/master"
                  targetPrefix:@""
                 operationName:@"GetMasterAccount"
                   outputClass:[AWSsecurityhubGetMasterAccountResponse class]];
}

- (void)getMasterAccount:(AWSsecurityhubGetMasterAccountRequest *)request
     completionHandler:(void (^)(AWSsecurityhubGetMasterAccountResponse *response, NSError *error))completionHandler {
    [[self getMasterAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubGetMasterAccountResponse *> * _Nonnull task) {
        AWSsecurityhubGetMasterAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubGetMembersResponse *> *)getMembers:(AWSsecurityhubGetMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/members/get"
                  targetPrefix:@""
                 operationName:@"GetMembers"
                   outputClass:[AWSsecurityhubGetMembersResponse class]];
}

- (void)getMembers:(AWSsecurityhubGetMembersRequest *)request
     completionHandler:(void (^)(AWSsecurityhubGetMembersResponse *response, NSError *error))completionHandler {
    [[self getMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubGetMembersResponse *> * _Nonnull task) {
        AWSsecurityhubGetMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubInviteMembersResponse *> *)inviteMembers:(AWSsecurityhubInviteMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/members/invite"
                  targetPrefix:@""
                 operationName:@"InviteMembers"
                   outputClass:[AWSsecurityhubInviteMembersResponse class]];
}

- (void)inviteMembers:(AWSsecurityhubInviteMembersRequest *)request
     completionHandler:(void (^)(AWSsecurityhubInviteMembersResponse *response, NSError *error))completionHandler {
    [[self inviteMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubInviteMembersResponse *> * _Nonnull task) {
        AWSsecurityhubInviteMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubListEnabledProductsForImportResponse *> *)listEnabledProductsForImport:(AWSsecurityhubListEnabledProductsForImportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/productSubscriptions"
                  targetPrefix:@""
                 operationName:@"ListEnabledProductsForImport"
                   outputClass:[AWSsecurityhubListEnabledProductsForImportResponse class]];
}

- (void)listEnabledProductsForImport:(AWSsecurityhubListEnabledProductsForImportRequest *)request
     completionHandler:(void (^)(AWSsecurityhubListEnabledProductsForImportResponse *response, NSError *error))completionHandler {
    [[self listEnabledProductsForImport:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubListEnabledProductsForImportResponse *> * _Nonnull task) {
        AWSsecurityhubListEnabledProductsForImportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubListInvitationsResponse *> *)listInvitations:(AWSsecurityhubListInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/invitations"
                  targetPrefix:@""
                 operationName:@"ListInvitations"
                   outputClass:[AWSsecurityhubListInvitationsResponse class]];
}

- (void)listInvitations:(AWSsecurityhubListInvitationsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubListInvitationsResponse *response, NSError *error))completionHandler {
    [[self listInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubListInvitationsResponse *> * _Nonnull task) {
        AWSsecurityhubListInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubListMembersResponse *> *)listMembers:(AWSsecurityhubListMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/members"
                  targetPrefix:@""
                 operationName:@"ListMembers"
                   outputClass:[AWSsecurityhubListMembersResponse class]];
}

- (void)listMembers:(AWSsecurityhubListMembersRequest *)request
     completionHandler:(void (^)(AWSsecurityhubListMembersResponse *response, NSError *error))completionHandler {
    [[self listMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubListMembersResponse *> * _Nonnull task) {
        AWSsecurityhubListMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubListTagsForResourceResponse *> *)listTagsForResource:(AWSsecurityhubListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSsecurityhubListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSsecurityhubListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSsecurityhubListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubListTagsForResourceResponse *> * _Nonnull task) {
        AWSsecurityhubListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubTagResourceResponse *> *)tagResource:(AWSsecurityhubTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSsecurityhubTagResourceResponse class]];
}

- (void)tagResource:(AWSsecurityhubTagResourceRequest *)request
     completionHandler:(void (^)(AWSsecurityhubTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubTagResourceResponse *> * _Nonnull task) {
        AWSsecurityhubTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubUntagResourceResponse *> *)untagResource:(AWSsecurityhubUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSsecurityhubUntagResourceResponse class]];
}

- (void)untagResource:(AWSsecurityhubUntagResourceRequest *)request
     completionHandler:(void (^)(AWSsecurityhubUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubUntagResourceResponse *> * _Nonnull task) {
        AWSsecurityhubUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubUpdateActionTargetResponse *> *)updateActionTarget:(AWSsecurityhubUpdateActionTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/actionTargets/{ActionTargetArn+}"
                  targetPrefix:@""
                 operationName:@"UpdateActionTarget"
                   outputClass:[AWSsecurityhubUpdateActionTargetResponse class]];
}

- (void)updateActionTarget:(AWSsecurityhubUpdateActionTargetRequest *)request
     completionHandler:(void (^)(AWSsecurityhubUpdateActionTargetResponse *response, NSError *error))completionHandler {
    [[self updateActionTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubUpdateActionTargetResponse *> * _Nonnull task) {
        AWSsecurityhubUpdateActionTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubUpdateFindingsResponse *> *)updateFindings:(AWSsecurityhubUpdateFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/findings"
                  targetPrefix:@""
                 operationName:@"UpdateFindings"
                   outputClass:[AWSsecurityhubUpdateFindingsResponse class]];
}

- (void)updateFindings:(AWSsecurityhubUpdateFindingsRequest *)request
     completionHandler:(void (^)(AWSsecurityhubUpdateFindingsResponse *response, NSError *error))completionHandler {
    [[self updateFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubUpdateFindingsResponse *> * _Nonnull task) {
        AWSsecurityhubUpdateFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubUpdateInsightResponse *> *)updateInsight:(AWSsecurityhubUpdateInsightRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/insights/{InsightArn+}"
                  targetPrefix:@""
                 operationName:@"UpdateInsight"
                   outputClass:[AWSsecurityhubUpdateInsightResponse class]];
}

- (void)updateInsight:(AWSsecurityhubUpdateInsightRequest *)request
     completionHandler:(void (^)(AWSsecurityhubUpdateInsightResponse *response, NSError *error))completionHandler {
    [[self updateInsight:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubUpdateInsightResponse *> * _Nonnull task) {
        AWSsecurityhubUpdateInsightResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSsecurityhubUpdateStandardsControlResponse *> *)updateStandardsControl:(AWSsecurityhubUpdateStandardsControlRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPATCH
                     URLString:@"/standards/control/{StandardsControlArn+}"
                  targetPrefix:@""
                 operationName:@"UpdateStandardsControl"
                   outputClass:[AWSsecurityhubUpdateStandardsControlResponse class]];
}

- (void)updateStandardsControl:(AWSsecurityhubUpdateStandardsControlRequest *)request
     completionHandler:(void (^)(AWSsecurityhubUpdateStandardsControlResponse *response, NSError *error))completionHandler {
    [[self updateStandardsControl:request] continueWithBlock:^id _Nullable(AWSTask<AWSsecurityhubUpdateStandardsControlResponse *> * _Nonnull task) {
        AWSsecurityhubUpdateStandardsControlResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
