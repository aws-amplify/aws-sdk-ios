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

#import "AWSfmsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSfmsResources.h"

static NSString *const AWSInfofms = @"fms";
NSString *const AWSfmsSDKVersion = @"2.13.2";


@interface AWSfmsResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSfmsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalErrorException" : @(AWSfmsErrorInternalError),
                            @"InvalidInputException" : @(AWSfmsErrorInvalidInput),
                            @"InvalidOperationException" : @(AWSfmsErrorInvalidOperation),
                            @"InvalidTypeException" : @(AWSfmsErrorInvalidType),
                            @"LimitExceededException" : @(AWSfmsErrorLimitExceeded),
                            @"ResourceNotFoundException" : @(AWSfmsErrorResourceNotFound),
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
	                *error = [NSError errorWithDomain:AWSfmsErrorDomain
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
        *error = [NSError errorWithDomain:AWSfmsErrorDomain
                                     code:AWSfmsErrorUnknown
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

@interface AWSfmsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSfmsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSfms()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSfms

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSfmsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSfms versions need to match. Check your SDK installation. AWSCore: %@ AWSfms: %@", AWSiOSSDKVersion, AWSfmsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultfms {
    static AWSfms *_defaultfms = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfofms];
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
        _defaultfms = [[AWSfms alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultfms;
}

+ (void)registerfmsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSfms alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)fmsForKey:(NSString *)key {
    @synchronized(self) {
        AWSfms *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfofms
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSfms registerfmsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removefmsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultfms` or `+ fmsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicefms
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicefms];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSfmsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSfmsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSfmsResponseSerializer alloc] initWithJSONDefinition:[[AWSfmsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)associateAdminAccount:(AWSfmsAssociateAdminAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"AssociateAdminAccount"
                   outputClass:nil];
}

- (void)associateAdminAccount:(AWSfmsAssociateAdminAccountRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateAdminAccount:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNotificationChannel:(AWSfmsDeleteNotificationChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"DeleteNotificationChannel"
                   outputClass:nil];
}

- (void)deleteNotificationChannel:(AWSfmsDeleteNotificationChannelRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNotificationChannel:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePolicy:(AWSfmsDeletePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"DeletePolicy"
                   outputClass:nil];
}

- (void)deletePolicy:(AWSfmsDeletePolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateAdminAccount:(AWSfmsDisassociateAdminAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"DisassociateAdminAccount"
                   outputClass:nil];
}

- (void)disassociateAdminAccount:(AWSfmsDisassociateAdminAccountRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateAdminAccount:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsGetAdminAccountResponse *> *)getAdminAccount:(AWSfmsGetAdminAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"GetAdminAccount"
                   outputClass:[AWSfmsGetAdminAccountResponse class]];
}

- (void)getAdminAccount:(AWSfmsGetAdminAccountRequest *)request
     completionHandler:(void (^)(AWSfmsGetAdminAccountResponse *response, NSError *error))completionHandler {
    [[self getAdminAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsGetAdminAccountResponse *> * _Nonnull task) {
        AWSfmsGetAdminAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsGetComplianceDetailResponse *> *)getComplianceDetail:(AWSfmsGetComplianceDetailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"GetComplianceDetail"
                   outputClass:[AWSfmsGetComplianceDetailResponse class]];
}

- (void)getComplianceDetail:(AWSfmsGetComplianceDetailRequest *)request
     completionHandler:(void (^)(AWSfmsGetComplianceDetailResponse *response, NSError *error))completionHandler {
    [[self getComplianceDetail:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsGetComplianceDetailResponse *> * _Nonnull task) {
        AWSfmsGetComplianceDetailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsGetNotificationChannelResponse *> *)getNotificationChannel:(AWSfmsGetNotificationChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"GetNotificationChannel"
                   outputClass:[AWSfmsGetNotificationChannelResponse class]];
}

- (void)getNotificationChannel:(AWSfmsGetNotificationChannelRequest *)request
     completionHandler:(void (^)(AWSfmsGetNotificationChannelResponse *response, NSError *error))completionHandler {
    [[self getNotificationChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsGetNotificationChannelResponse *> * _Nonnull task) {
        AWSfmsGetNotificationChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsGetPolicyResponse *> *)getPolicy:(AWSfmsGetPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"GetPolicy"
                   outputClass:[AWSfmsGetPolicyResponse class]];
}

- (void)getPolicy:(AWSfmsGetPolicyRequest *)request
     completionHandler:(void (^)(AWSfmsGetPolicyResponse *response, NSError *error))completionHandler {
    [[self getPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsGetPolicyResponse *> * _Nonnull task) {
        AWSfmsGetPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsGetProtectionStatusResponse *> *)getProtectionStatus:(AWSfmsGetProtectionStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"GetProtectionStatus"
                   outputClass:[AWSfmsGetProtectionStatusResponse class]];
}

- (void)getProtectionStatus:(AWSfmsGetProtectionStatusRequest *)request
     completionHandler:(void (^)(AWSfmsGetProtectionStatusResponse *response, NSError *error))completionHandler {
    [[self getProtectionStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsGetProtectionStatusResponse *> * _Nonnull task) {
        AWSfmsGetProtectionStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsListComplianceStatusResponse *> *)listComplianceStatus:(AWSfmsListComplianceStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"ListComplianceStatus"
                   outputClass:[AWSfmsListComplianceStatusResponse class]];
}

- (void)listComplianceStatus:(AWSfmsListComplianceStatusRequest *)request
     completionHandler:(void (^)(AWSfmsListComplianceStatusResponse *response, NSError *error))completionHandler {
    [[self listComplianceStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsListComplianceStatusResponse *> * _Nonnull task) {
        AWSfmsListComplianceStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsListMemberAccountsResponse *> *)listMemberAccounts:(AWSfmsListMemberAccountsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"ListMemberAccounts"
                   outputClass:[AWSfmsListMemberAccountsResponse class]];
}

- (void)listMemberAccounts:(AWSfmsListMemberAccountsRequest *)request
     completionHandler:(void (^)(AWSfmsListMemberAccountsResponse *response, NSError *error))completionHandler {
    [[self listMemberAccounts:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsListMemberAccountsResponse *> * _Nonnull task) {
        AWSfmsListMemberAccountsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsListPoliciesResponse *> *)listPolicies:(AWSfmsListPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"ListPolicies"
                   outputClass:[AWSfmsListPoliciesResponse class]];
}

- (void)listPolicies:(AWSfmsListPoliciesRequest *)request
     completionHandler:(void (^)(AWSfmsListPoliciesResponse *response, NSError *error))completionHandler {
    [[self listPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsListPoliciesResponse *> * _Nonnull task) {
        AWSfmsListPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsListTagsForResourceResponse *> *)listTagsForResource:(AWSfmsListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSfmsListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSfmsListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSfmsListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsListTagsForResourceResponse *> * _Nonnull task) {
        AWSfmsListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putNotificationChannel:(AWSfmsPutNotificationChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"PutNotificationChannel"
                   outputClass:nil];
}

- (void)putNotificationChannel:(AWSfmsPutNotificationChannelRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putNotificationChannel:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsPutPolicyResponse *> *)putPolicy:(AWSfmsPutPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"PutPolicy"
                   outputClass:[AWSfmsPutPolicyResponse class]];
}

- (void)putPolicy:(AWSfmsPutPolicyRequest *)request
     completionHandler:(void (^)(AWSfmsPutPolicyResponse *response, NSError *error))completionHandler {
    [[self putPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsPutPolicyResponse *> * _Nonnull task) {
        AWSfmsPutPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsTagResourceResponse *> *)tagResource:(AWSfmsTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"TagResource"
                   outputClass:[AWSfmsTagResourceResponse class]];
}

- (void)tagResource:(AWSfmsTagResourceRequest *)request
     completionHandler:(void (^)(AWSfmsTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsTagResourceResponse *> * _Nonnull task) {
        AWSfmsTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfmsUntagResourceResponse *> *)untagResource:(AWSfmsUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSFMS_20180101"
                 operationName:@"UntagResource"
                   outputClass:[AWSfmsUntagResourceResponse class]];
}

- (void)untagResource:(AWSfmsUntagResourceRequest *)request
     completionHandler:(void (^)(AWSfmsUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSfmsUntagResourceResponse *> * _Nonnull task) {
        AWSfmsUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
