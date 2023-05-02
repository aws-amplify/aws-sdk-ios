//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSChimeSDKIdentityService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSChimeSDKIdentityResources.h"

static NSString *const AWSInfoChimeSDKIdentity = @"ChimeSDKIdentity";
NSString *const AWSChimeSDKIdentitySDKVersion = @"2.31.1";


@interface AWSChimeSDKIdentityResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSChimeSDKIdentityResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSChimeSDKIdentityErrorBadRequest),
                            @"ConflictException" : @(AWSChimeSDKIdentityErrorConflict),
                            @"ForbiddenException" : @(AWSChimeSDKIdentityErrorForbidden),
                            @"NotFoundException" : @(AWSChimeSDKIdentityErrorNotFound),
                            @"ResourceLimitExceededException" : @(AWSChimeSDKIdentityErrorResourceLimitExceeded),
                            @"ServiceFailureException" : @(AWSChimeSDKIdentityErrorServiceFailure),
                            @"ServiceUnavailableException" : @(AWSChimeSDKIdentityErrorServiceUnavailable),
                            @"ThrottledClientException" : @(AWSChimeSDKIdentityErrorThrottledClient),
                            @"UnauthorizedClientException" : @(AWSChimeSDKIdentityErrorUnauthorizedClient),
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
                    *error = [NSError errorWithDomain:AWSChimeSDKIdentityErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSChimeSDKIdentityErrorDomain
                                                 code:AWSChimeSDKIdentityErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSChimeSDKIdentityErrorDomain
                                     code:AWSChimeSDKIdentityErrorUnknown
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

@interface AWSChimeSDKIdentityRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSChimeSDKIdentityRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSChimeSDKIdentity()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSChimeSDKIdentity

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSChimeSDKIdentitySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSChimeSDKIdentity versions need to match. Check your SDK installation. AWSCore: %@ AWSChimeSDKIdentity: %@", AWSiOSSDKVersion, AWSChimeSDKIdentitySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultChimeSDKIdentity {
    static AWSChimeSDKIdentity *_defaultChimeSDKIdentity = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoChimeSDKIdentity];
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
        _defaultChimeSDKIdentity = [[AWSChimeSDKIdentity alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultChimeSDKIdentity;
}

+ (void)registerChimeSDKIdentityWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSChimeSDKIdentity alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ChimeSDKIdentityForKey:(NSString *)key {
    @synchronized(self) {
        AWSChimeSDKIdentity *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoChimeSDKIdentity
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSChimeSDKIdentity registerChimeSDKIdentityWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeChimeSDKIdentityForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultChimeSDKIdentity` or `+ ChimeSDKIdentityForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceChimeSDKIdentity
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceChimeSDKIdentity];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSChimeSDKIdentityRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSChimeSDKIdentityResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSChimeSDKIdentityResponseSerializer alloc] initWithJSONDefinition:[[AWSChimeSDKIdentityResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSChimeSDKIdentityCreateAppInstanceResponse *> *)createAppInstance:(AWSChimeSDKIdentityCreateAppInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/app-instances"
                  targetPrefix:@""
                 operationName:@"CreateAppInstance"
                   outputClass:[AWSChimeSDKIdentityCreateAppInstanceResponse class]];
}

- (void)createAppInstance:(AWSChimeSDKIdentityCreateAppInstanceRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityCreateAppInstanceResponse *response, NSError *error))completionHandler {
    [[self createAppInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityCreateAppInstanceResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityCreateAppInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityCreateAppInstanceAdminResponse *> *)createAppInstanceAdmin:(AWSChimeSDKIdentityCreateAppInstanceAdminRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/app-instances/{appInstanceArn}/admins"
                  targetPrefix:@""
                 operationName:@"CreateAppInstanceAdmin"
                   outputClass:[AWSChimeSDKIdentityCreateAppInstanceAdminResponse class]];
}

- (void)createAppInstanceAdmin:(AWSChimeSDKIdentityCreateAppInstanceAdminRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityCreateAppInstanceAdminResponse *response, NSError *error))completionHandler {
    [[self createAppInstanceAdmin:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityCreateAppInstanceAdminResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityCreateAppInstanceAdminResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityCreateAppInstanceBotResponse *> *)createAppInstanceBot:(AWSChimeSDKIdentityCreateAppInstanceBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/app-instance-bots"
                  targetPrefix:@""
                 operationName:@"CreateAppInstanceBot"
                   outputClass:[AWSChimeSDKIdentityCreateAppInstanceBotResponse class]];
}

- (void)createAppInstanceBot:(AWSChimeSDKIdentityCreateAppInstanceBotRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityCreateAppInstanceBotResponse *response, NSError *error))completionHandler {
    [[self createAppInstanceBot:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityCreateAppInstanceBotResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityCreateAppInstanceBotResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityCreateAppInstanceUserResponse *> *)createAppInstanceUser:(AWSChimeSDKIdentityCreateAppInstanceUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/app-instance-users"
                  targetPrefix:@""
                 operationName:@"CreateAppInstanceUser"
                   outputClass:[AWSChimeSDKIdentityCreateAppInstanceUserResponse class]];
}

- (void)createAppInstanceUser:(AWSChimeSDKIdentityCreateAppInstanceUserRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityCreateAppInstanceUserResponse *response, NSError *error))completionHandler {
    [[self createAppInstanceUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityCreateAppInstanceUserResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityCreateAppInstanceUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAppInstance:(AWSChimeSDKIdentityDeleteAppInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/app-instances/{appInstanceArn}"
                  targetPrefix:@""
                 operationName:@"DeleteAppInstance"
                   outputClass:nil];
}

- (void)deleteAppInstance:(AWSChimeSDKIdentityDeleteAppInstanceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAppInstance:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAppInstanceAdmin:(AWSChimeSDKIdentityDeleteAppInstanceAdminRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/app-instances/{appInstanceArn}/admins/{appInstanceAdminArn}"
                  targetPrefix:@""
                 operationName:@"DeleteAppInstanceAdmin"
                   outputClass:nil];
}

- (void)deleteAppInstanceAdmin:(AWSChimeSDKIdentityDeleteAppInstanceAdminRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAppInstanceAdmin:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAppInstanceBot:(AWSChimeSDKIdentityDeleteAppInstanceBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/app-instance-bots/{appInstanceBotArn}"
                  targetPrefix:@""
                 operationName:@"DeleteAppInstanceBot"
                   outputClass:nil];
}

- (void)deleteAppInstanceBot:(AWSChimeSDKIdentityDeleteAppInstanceBotRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAppInstanceBot:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAppInstanceUser:(AWSChimeSDKIdentityDeleteAppInstanceUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/app-instance-users/{appInstanceUserArn}"
                  targetPrefix:@""
                 operationName:@"DeleteAppInstanceUser"
                   outputClass:nil];
}

- (void)deleteAppInstanceUser:(AWSChimeSDKIdentityDeleteAppInstanceUserRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAppInstanceUser:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deregisterAppInstanceUserEndpoint:(AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/app-instance-users/{appInstanceUserArn}/endpoints/{endpointId}"
                  targetPrefix:@""
                 operationName:@"DeregisterAppInstanceUserEndpoint"
                   outputClass:nil];
}

- (void)deregisterAppInstanceUserEndpoint:(AWSChimeSDKIdentityDeregisterAppInstanceUserEndpointRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deregisterAppInstanceUserEndpoint:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityDescribeAppInstanceResponse *> *)describeAppInstance:(AWSChimeSDKIdentityDescribeAppInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instances/{appInstanceArn}"
                  targetPrefix:@""
                 operationName:@"DescribeAppInstance"
                   outputClass:[AWSChimeSDKIdentityDescribeAppInstanceResponse class]];
}

- (void)describeAppInstance:(AWSChimeSDKIdentityDescribeAppInstanceRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityDescribeAppInstanceResponse *response, NSError *error))completionHandler {
    [[self describeAppInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityDescribeAppInstanceResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityDescribeAppInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityDescribeAppInstanceAdminResponse *> *)describeAppInstanceAdmin:(AWSChimeSDKIdentityDescribeAppInstanceAdminRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instances/{appInstanceArn}/admins/{appInstanceAdminArn}"
                  targetPrefix:@""
                 operationName:@"DescribeAppInstanceAdmin"
                   outputClass:[AWSChimeSDKIdentityDescribeAppInstanceAdminResponse class]];
}

- (void)describeAppInstanceAdmin:(AWSChimeSDKIdentityDescribeAppInstanceAdminRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityDescribeAppInstanceAdminResponse *response, NSError *error))completionHandler {
    [[self describeAppInstanceAdmin:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityDescribeAppInstanceAdminResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityDescribeAppInstanceAdminResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityDescribeAppInstanceBotResponse *> *)describeAppInstanceBot:(AWSChimeSDKIdentityDescribeAppInstanceBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instance-bots/{appInstanceBotArn}"
                  targetPrefix:@""
                 operationName:@"DescribeAppInstanceBot"
                   outputClass:[AWSChimeSDKIdentityDescribeAppInstanceBotResponse class]];
}

- (void)describeAppInstanceBot:(AWSChimeSDKIdentityDescribeAppInstanceBotRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityDescribeAppInstanceBotResponse *response, NSError *error))completionHandler {
    [[self describeAppInstanceBot:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityDescribeAppInstanceBotResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityDescribeAppInstanceBotResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityDescribeAppInstanceUserResponse *> *)describeAppInstanceUser:(AWSChimeSDKIdentityDescribeAppInstanceUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instance-users/{appInstanceUserArn}"
                  targetPrefix:@""
                 operationName:@"DescribeAppInstanceUser"
                   outputClass:[AWSChimeSDKIdentityDescribeAppInstanceUserResponse class]];
}

- (void)describeAppInstanceUser:(AWSChimeSDKIdentityDescribeAppInstanceUserRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityDescribeAppInstanceUserResponse *response, NSError *error))completionHandler {
    [[self describeAppInstanceUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityDescribeAppInstanceUserResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityDescribeAppInstanceUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse *> *)describeAppInstanceUserEndpoint:(AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instance-users/{appInstanceUserArn}/endpoints/{endpointId}"
                  targetPrefix:@""
                 operationName:@"DescribeAppInstanceUserEndpoint"
                   outputClass:[AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse class]];
}

- (void)describeAppInstanceUserEndpoint:(AWSChimeSDKIdentityDescribeAppInstanceUserEndpointRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse *response, NSError *error))completionHandler {
    [[self describeAppInstanceUserEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityDescribeAppInstanceUserEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse *> *)getAppInstanceRetentionSettings:(AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instances/{appInstanceArn}/retention-settings"
                  targetPrefix:@""
                 operationName:@"GetAppInstanceRetentionSettings"
                   outputClass:[AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse class]];
}

- (void)getAppInstanceRetentionSettings:(AWSChimeSDKIdentityGetAppInstanceRetentionSettingsRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse *response, NSError *error))completionHandler {
    [[self getAppInstanceRetentionSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityGetAppInstanceRetentionSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityListAppInstanceAdminsResponse *> *)listAppInstanceAdmins:(AWSChimeSDKIdentityListAppInstanceAdminsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instances/{appInstanceArn}/admins"
                  targetPrefix:@""
                 operationName:@"ListAppInstanceAdmins"
                   outputClass:[AWSChimeSDKIdentityListAppInstanceAdminsResponse class]];
}

- (void)listAppInstanceAdmins:(AWSChimeSDKIdentityListAppInstanceAdminsRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityListAppInstanceAdminsResponse *response, NSError *error))completionHandler {
    [[self listAppInstanceAdmins:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityListAppInstanceAdminsResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityListAppInstanceAdminsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityListAppInstanceBotsResponse *> *)listAppInstanceBots:(AWSChimeSDKIdentityListAppInstanceBotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instance-bots"
                  targetPrefix:@""
                 operationName:@"ListAppInstanceBots"
                   outputClass:[AWSChimeSDKIdentityListAppInstanceBotsResponse class]];
}

- (void)listAppInstanceBots:(AWSChimeSDKIdentityListAppInstanceBotsRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityListAppInstanceBotsResponse *response, NSError *error))completionHandler {
    [[self listAppInstanceBots:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityListAppInstanceBotsResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityListAppInstanceBotsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse *> *)listAppInstanceUserEndpoints:(AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instance-users/{appInstanceUserArn}/endpoints"
                  targetPrefix:@""
                 operationName:@"ListAppInstanceUserEndpoints"
                   outputClass:[AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse class]];
}

- (void)listAppInstanceUserEndpoints:(AWSChimeSDKIdentityListAppInstanceUserEndpointsRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse *response, NSError *error))completionHandler {
    [[self listAppInstanceUserEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityListAppInstanceUserEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityListAppInstanceUsersResponse *> *)listAppInstanceUsers:(AWSChimeSDKIdentityListAppInstanceUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instance-users"
                  targetPrefix:@""
                 operationName:@"ListAppInstanceUsers"
                   outputClass:[AWSChimeSDKIdentityListAppInstanceUsersResponse class]];
}

- (void)listAppInstanceUsers:(AWSChimeSDKIdentityListAppInstanceUsersRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityListAppInstanceUsersResponse *response, NSError *error))completionHandler {
    [[self listAppInstanceUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityListAppInstanceUsersResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityListAppInstanceUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityListAppInstancesResponse *> *)listAppInstances:(AWSChimeSDKIdentityListAppInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/app-instances"
                  targetPrefix:@""
                 operationName:@"ListAppInstances"
                   outputClass:[AWSChimeSDKIdentityListAppInstancesResponse class]];
}

- (void)listAppInstances:(AWSChimeSDKIdentityListAppInstancesRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityListAppInstancesResponse *response, NSError *error))completionHandler {
    [[self listAppInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityListAppInstancesResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityListAppInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityListTagsForResourceResponse *> *)listTagsForResource:(AWSChimeSDKIdentityListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSChimeSDKIdentityListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSChimeSDKIdentityListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityListTagsForResourceResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse *> *)putAppInstanceRetentionSettings:(AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/app-instances/{appInstanceArn}/retention-settings"
                  targetPrefix:@""
                 operationName:@"PutAppInstanceRetentionSettings"
                   outputClass:[AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse class]];
}

- (void)putAppInstanceRetentionSettings:(AWSChimeSDKIdentityPutAppInstanceRetentionSettingsRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse *response, NSError *error))completionHandler {
    [[self putAppInstanceRetentionSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityPutAppInstanceRetentionSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse *> *)putAppInstanceUserExpirationSettings:(AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/app-instance-users/{appInstanceUserArn}/expiration-settings"
                  targetPrefix:@""
                 operationName:@"PutAppInstanceUserExpirationSettings"
                   outputClass:[AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse class]];
}

- (void)putAppInstanceUserExpirationSettings:(AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse *response, NSError *error))completionHandler {
    [[self putAppInstanceUserExpirationSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityPutAppInstanceUserExpirationSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse *> *)registerAppInstanceUserEndpoint:(AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/app-instance-users/{appInstanceUserArn}/endpoints"
                  targetPrefix:@""
                 operationName:@"RegisterAppInstanceUserEndpoint"
                   outputClass:[AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse class]];
}

- (void)registerAppInstanceUserEndpoint:(AWSChimeSDKIdentityRegisterAppInstanceUserEndpointRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse *response, NSError *error))completionHandler {
    [[self registerAppInstanceUserEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityRegisterAppInstanceUserEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSChimeSDKIdentityTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags?operation=tag-resource"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSChimeSDKIdentityTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSChimeSDKIdentityUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags?operation=untag-resource"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSChimeSDKIdentityUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityUpdateAppInstanceResponse *> *)updateAppInstance:(AWSChimeSDKIdentityUpdateAppInstanceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/app-instances/{appInstanceArn}"
                  targetPrefix:@""
                 operationName:@"UpdateAppInstance"
                   outputClass:[AWSChimeSDKIdentityUpdateAppInstanceResponse class]];
}

- (void)updateAppInstance:(AWSChimeSDKIdentityUpdateAppInstanceRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityUpdateAppInstanceResponse *response, NSError *error))completionHandler {
    [[self updateAppInstance:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityUpdateAppInstanceResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityUpdateAppInstanceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityUpdateAppInstanceBotResponse *> *)updateAppInstanceBot:(AWSChimeSDKIdentityUpdateAppInstanceBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/app-instance-bots/{appInstanceBotArn}"
                  targetPrefix:@""
                 operationName:@"UpdateAppInstanceBot"
                   outputClass:[AWSChimeSDKIdentityUpdateAppInstanceBotResponse class]];
}

- (void)updateAppInstanceBot:(AWSChimeSDKIdentityUpdateAppInstanceBotRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityUpdateAppInstanceBotResponse *response, NSError *error))completionHandler {
    [[self updateAppInstanceBot:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityUpdateAppInstanceBotResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityUpdateAppInstanceBotResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityUpdateAppInstanceUserResponse *> *)updateAppInstanceUser:(AWSChimeSDKIdentityUpdateAppInstanceUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/app-instance-users/{appInstanceUserArn}"
                  targetPrefix:@""
                 operationName:@"UpdateAppInstanceUser"
                   outputClass:[AWSChimeSDKIdentityUpdateAppInstanceUserResponse class]];
}

- (void)updateAppInstanceUser:(AWSChimeSDKIdentityUpdateAppInstanceUserRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityUpdateAppInstanceUserResponse *response, NSError *error))completionHandler {
    [[self updateAppInstanceUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityUpdateAppInstanceUserResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityUpdateAppInstanceUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse *> *)updateAppInstanceUserEndpoint:(AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/app-instance-users/{appInstanceUserArn}/endpoints/{endpointId}"
                  targetPrefix:@""
                 operationName:@"UpdateAppInstanceUserEndpoint"
                   outputClass:[AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse class]];
}

- (void)updateAppInstanceUserEndpoint:(AWSChimeSDKIdentityUpdateAppInstanceUserEndpointRequest *)request
     completionHandler:(void (^)(AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse *response, NSError *error))completionHandler {
    [[self updateAppInstanceUserEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse *> * _Nonnull task) {
        AWSChimeSDKIdentityUpdateAppInstanceUserEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
