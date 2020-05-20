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

#import "AWSChimeService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSChimeResources.h"

static NSString *const AWSInfoChime = @"Chime";
NSString *const AWSChimeSDKVersion = @"2.13.3";


@interface AWSChimeResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSChimeResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSChimeErrorAccessDenied),
                            @"BadRequestException" : @(AWSChimeErrorBadRequest),
                            @"ConflictException" : @(AWSChimeErrorConflict),
                            @"ForbiddenException" : @(AWSChimeErrorForbidden),
                            @"NotFoundException" : @(AWSChimeErrorNotFound),
                            @"ResourceLimitExceededException" : @(AWSChimeErrorResourceLimitExceeded),
                            @"ServiceFailureException" : @(AWSChimeErrorServiceFailure),
                            @"ServiceUnavailableException" : @(AWSChimeErrorServiceUnavailable),
                            @"ThrottledClientException" : @(AWSChimeErrorThrottledClient),
                            @"UnauthorizedClientException" : @(AWSChimeErrorUnauthorizedClient),
                            @"UnprocessableEntityException" : @(AWSChimeErrorUnprocessableEntity),
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
                    *error = [NSError errorWithDomain:AWSChimeErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSChimeErrorDomain
                                                 code:AWSChimeErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSChimeErrorDomain
                                     code:AWSChimeErrorUnknown
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

@interface AWSChimeRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSChimeRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSChime()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSChime

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSChimeSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSChime versions need to match. Check your SDK installation. AWSCore: %@ AWSChime: %@", AWSiOSSDKVersion, AWSChimeSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultChime {
    static AWSChime *_defaultChime = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoChime];
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
        _defaultChime = [[AWSChime alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultChime;
}

+ (void)registerChimeWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSChime alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ChimeForKey:(NSString *)key {
    @synchronized(self) {
        AWSChime *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoChime
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSChime registerChimeWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeChimeForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultChime` or `+ ChimeForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceChime
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceChime];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSChimeRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSChimeResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSChimeResponseSerializer alloc] initWithJSONDefinition:[[AWSChimeResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSChimeAssociatePhoneNumberWithUserResponse *> *)associatePhoneNumberWithUser:(AWSChimeAssociatePhoneNumberWithUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/users/{userId}?operation=associate-phone-number"
                  targetPrefix:@""
                 operationName:@"AssociatePhoneNumberWithUser"
                   outputClass:[AWSChimeAssociatePhoneNumberWithUserResponse class]];
}

- (void)associatePhoneNumberWithUser:(AWSChimeAssociatePhoneNumberWithUserRequest *)request
     completionHandler:(void (^)(AWSChimeAssociatePhoneNumberWithUserResponse *response, NSError *error))completionHandler {
    [[self associatePhoneNumberWithUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeAssociatePhoneNumberWithUserResponse *> * _Nonnull task) {
        AWSChimeAssociatePhoneNumberWithUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse *> *)associatePhoneNumbersWithVoiceConnector:(AWSChimeAssociatePhoneNumbersWithVoiceConnectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/voice-connectors/{voiceConnectorId}?operation=associate-phone-numbers"
                  targetPrefix:@""
                 operationName:@"AssociatePhoneNumbersWithVoiceConnector"
                   outputClass:[AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse class]];
}

- (void)associatePhoneNumbersWithVoiceConnector:(AWSChimeAssociatePhoneNumbersWithVoiceConnectorRequest *)request
     completionHandler:(void (^)(AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse *response, NSError *error))completionHandler {
    [[self associatePhoneNumbersWithVoiceConnector:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse *> * _Nonnull task) {
        AWSChimeAssociatePhoneNumbersWithVoiceConnectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse *> *)associatePhoneNumbersWithVoiceConnectorGroup:(AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/voice-connector-groups/{voiceConnectorGroupId}?operation=associate-phone-numbers"
                  targetPrefix:@""
                 operationName:@"AssociatePhoneNumbersWithVoiceConnectorGroup"
                   outputClass:[AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse class]];
}

- (void)associatePhoneNumbersWithVoiceConnectorGroup:(AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupRequest *)request
     completionHandler:(void (^)(AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse *response, NSError *error))completionHandler {
    [[self associatePhoneNumbersWithVoiceConnectorGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse *> * _Nonnull task) {
        AWSChimeAssociatePhoneNumbersWithVoiceConnectorGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeAssociateSigninDelegateGroupsWithAccountResponse *> *)associateSigninDelegateGroupsWithAccount:(AWSChimeAssociateSigninDelegateGroupsWithAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}?operation=associate-signin-delegate-groups"
                  targetPrefix:@""
                 operationName:@"AssociateSigninDelegateGroupsWithAccount"
                   outputClass:[AWSChimeAssociateSigninDelegateGroupsWithAccountResponse class]];
}

- (void)associateSigninDelegateGroupsWithAccount:(AWSChimeAssociateSigninDelegateGroupsWithAccountRequest *)request
     completionHandler:(void (^)(AWSChimeAssociateSigninDelegateGroupsWithAccountResponse *response, NSError *error))completionHandler {
    [[self associateSigninDelegateGroupsWithAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeAssociateSigninDelegateGroupsWithAccountResponse *> * _Nonnull task) {
        AWSChimeAssociateSigninDelegateGroupsWithAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeBatchCreateAttendeeResponse *> *)batchCreateAttendee:(AWSChimeBatchCreateAttendeeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/meetings/{meetingId}/attendees?operation=batch-create"
                  targetPrefix:@""
                 operationName:@"BatchCreateAttendee"
                   outputClass:[AWSChimeBatchCreateAttendeeResponse class]];
}

- (void)batchCreateAttendee:(AWSChimeBatchCreateAttendeeRequest *)request
     completionHandler:(void (^)(AWSChimeBatchCreateAttendeeResponse *response, NSError *error))completionHandler {
    [[self batchCreateAttendee:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeBatchCreateAttendeeResponse *> * _Nonnull task) {
        AWSChimeBatchCreateAttendeeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeBatchCreateRoomMembershipResponse *> *)batchCreateRoomMembership:(AWSChimeBatchCreateRoomMembershipRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/rooms/{roomId}/memberships?operation=batch-create"
                  targetPrefix:@""
                 operationName:@"BatchCreateRoomMembership"
                   outputClass:[AWSChimeBatchCreateRoomMembershipResponse class]];
}

- (void)batchCreateRoomMembership:(AWSChimeBatchCreateRoomMembershipRequest *)request
     completionHandler:(void (^)(AWSChimeBatchCreateRoomMembershipResponse *response, NSError *error))completionHandler {
    [[self batchCreateRoomMembership:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeBatchCreateRoomMembershipResponse *> * _Nonnull task) {
        AWSChimeBatchCreateRoomMembershipResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeBatchDeletePhoneNumberResponse *> *)batchDeletePhoneNumber:(AWSChimeBatchDeletePhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/phone-numbers?operation=batch-delete"
                  targetPrefix:@""
                 operationName:@"BatchDeletePhoneNumber"
                   outputClass:[AWSChimeBatchDeletePhoneNumberResponse class]];
}

- (void)batchDeletePhoneNumber:(AWSChimeBatchDeletePhoneNumberRequest *)request
     completionHandler:(void (^)(AWSChimeBatchDeletePhoneNumberResponse *response, NSError *error))completionHandler {
    [[self batchDeletePhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeBatchDeletePhoneNumberResponse *> * _Nonnull task) {
        AWSChimeBatchDeletePhoneNumberResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeBatchSuspendUserResponse *> *)batchSuspendUser:(AWSChimeBatchSuspendUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/users?operation=suspend"
                  targetPrefix:@""
                 operationName:@"BatchSuspendUser"
                   outputClass:[AWSChimeBatchSuspendUserResponse class]];
}

- (void)batchSuspendUser:(AWSChimeBatchSuspendUserRequest *)request
     completionHandler:(void (^)(AWSChimeBatchSuspendUserResponse *response, NSError *error))completionHandler {
    [[self batchSuspendUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeBatchSuspendUserResponse *> * _Nonnull task) {
        AWSChimeBatchSuspendUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeBatchUnsuspendUserResponse *> *)batchUnsuspendUser:(AWSChimeBatchUnsuspendUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/users?operation=unsuspend"
                  targetPrefix:@""
                 operationName:@"BatchUnsuspendUser"
                   outputClass:[AWSChimeBatchUnsuspendUserResponse class]];
}

- (void)batchUnsuspendUser:(AWSChimeBatchUnsuspendUserRequest *)request
     completionHandler:(void (^)(AWSChimeBatchUnsuspendUserResponse *response, NSError *error))completionHandler {
    [[self batchUnsuspendUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeBatchUnsuspendUserResponse *> * _Nonnull task) {
        AWSChimeBatchUnsuspendUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeBatchUpdatePhoneNumberResponse *> *)batchUpdatePhoneNumber:(AWSChimeBatchUpdatePhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/phone-numbers?operation=batch-update"
                  targetPrefix:@""
                 operationName:@"BatchUpdatePhoneNumber"
                   outputClass:[AWSChimeBatchUpdatePhoneNumberResponse class]];
}

- (void)batchUpdatePhoneNumber:(AWSChimeBatchUpdatePhoneNumberRequest *)request
     completionHandler:(void (^)(AWSChimeBatchUpdatePhoneNumberResponse *response, NSError *error))completionHandler {
    [[self batchUpdatePhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeBatchUpdatePhoneNumberResponse *> * _Nonnull task) {
        AWSChimeBatchUpdatePhoneNumberResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeBatchUpdateUserResponse *> *)batchUpdateUser:(AWSChimeBatchUpdateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/users"
                  targetPrefix:@""
                 operationName:@"BatchUpdateUser"
                   outputClass:[AWSChimeBatchUpdateUserResponse class]];
}

- (void)batchUpdateUser:(AWSChimeBatchUpdateUserRequest *)request
     completionHandler:(void (^)(AWSChimeBatchUpdateUserResponse *response, NSError *error))completionHandler {
    [[self batchUpdateUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeBatchUpdateUserResponse *> * _Nonnull task) {
        AWSChimeBatchUpdateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreateAccountResponse *> *)createAccount:(AWSChimeCreateAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts"
                  targetPrefix:@""
                 operationName:@"CreateAccount"
                   outputClass:[AWSChimeCreateAccountResponse class]];
}

- (void)createAccount:(AWSChimeCreateAccountRequest *)request
     completionHandler:(void (^)(AWSChimeCreateAccountResponse *response, NSError *error))completionHandler {
    [[self createAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreateAccountResponse *> * _Nonnull task) {
        AWSChimeCreateAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreateAttendeeResponse *> *)createAttendee:(AWSChimeCreateAttendeeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/meetings/{meetingId}/attendees"
                  targetPrefix:@""
                 operationName:@"CreateAttendee"
                   outputClass:[AWSChimeCreateAttendeeResponse class]];
}

- (void)createAttendee:(AWSChimeCreateAttendeeRequest *)request
     completionHandler:(void (^)(AWSChimeCreateAttendeeResponse *response, NSError *error))completionHandler {
    [[self createAttendee:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreateAttendeeResponse *> * _Nonnull task) {
        AWSChimeCreateAttendeeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreateBotResponse *> *)createBot:(AWSChimeCreateBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/bots"
                  targetPrefix:@""
                 operationName:@"CreateBot"
                   outputClass:[AWSChimeCreateBotResponse class]];
}

- (void)createBot:(AWSChimeCreateBotRequest *)request
     completionHandler:(void (^)(AWSChimeCreateBotResponse *response, NSError *error))completionHandler {
    [[self createBot:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreateBotResponse *> * _Nonnull task) {
        AWSChimeCreateBotResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreateMeetingResponse *> *)createMeeting:(AWSChimeCreateMeetingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/meetings"
                  targetPrefix:@""
                 operationName:@"CreateMeeting"
                   outputClass:[AWSChimeCreateMeetingResponse class]];
}

- (void)createMeeting:(AWSChimeCreateMeetingRequest *)request
     completionHandler:(void (^)(AWSChimeCreateMeetingResponse *response, NSError *error))completionHandler {
    [[self createMeeting:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreateMeetingResponse *> * _Nonnull task) {
        AWSChimeCreateMeetingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreatePhoneNumberOrderResponse *> *)createPhoneNumberOrder:(AWSChimeCreatePhoneNumberOrderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/phone-number-orders"
                  targetPrefix:@""
                 operationName:@"CreatePhoneNumberOrder"
                   outputClass:[AWSChimeCreatePhoneNumberOrderResponse class]];
}

- (void)createPhoneNumberOrder:(AWSChimeCreatePhoneNumberOrderRequest *)request
     completionHandler:(void (^)(AWSChimeCreatePhoneNumberOrderResponse *response, NSError *error))completionHandler {
    [[self createPhoneNumberOrder:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreatePhoneNumberOrderResponse *> * _Nonnull task) {
        AWSChimeCreatePhoneNumberOrderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreateProxySessionResponse *> *)createProxySession:(AWSChimeCreateProxySessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/voice-connectors/{voiceConnectorId}/proxy-sessions"
                  targetPrefix:@""
                 operationName:@"CreateProxySession"
                   outputClass:[AWSChimeCreateProxySessionResponse class]];
}

- (void)createProxySession:(AWSChimeCreateProxySessionRequest *)request
     completionHandler:(void (^)(AWSChimeCreateProxySessionResponse *response, NSError *error))completionHandler {
    [[self createProxySession:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreateProxySessionResponse *> * _Nonnull task) {
        AWSChimeCreateProxySessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreateRoomResponse *> *)createRoom:(AWSChimeCreateRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/rooms"
                  targetPrefix:@""
                 operationName:@"CreateRoom"
                   outputClass:[AWSChimeCreateRoomResponse class]];
}

- (void)createRoom:(AWSChimeCreateRoomRequest *)request
     completionHandler:(void (^)(AWSChimeCreateRoomResponse *response, NSError *error))completionHandler {
    [[self createRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreateRoomResponse *> * _Nonnull task) {
        AWSChimeCreateRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreateRoomMembershipResponse *> *)createRoomMembership:(AWSChimeCreateRoomMembershipRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/rooms/{roomId}/memberships"
                  targetPrefix:@""
                 operationName:@"CreateRoomMembership"
                   outputClass:[AWSChimeCreateRoomMembershipResponse class]];
}

- (void)createRoomMembership:(AWSChimeCreateRoomMembershipRequest *)request
     completionHandler:(void (^)(AWSChimeCreateRoomMembershipResponse *response, NSError *error))completionHandler {
    [[self createRoomMembership:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreateRoomMembershipResponse *> * _Nonnull task) {
        AWSChimeCreateRoomMembershipResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreateUserResponse *> *)createUser:(AWSChimeCreateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/users?operation=create"
                  targetPrefix:@""
                 operationName:@"CreateUser"
                   outputClass:[AWSChimeCreateUserResponse class]];
}

- (void)createUser:(AWSChimeCreateUserRequest *)request
     completionHandler:(void (^)(AWSChimeCreateUserResponse *response, NSError *error))completionHandler {
    [[self createUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreateUserResponse *> * _Nonnull task) {
        AWSChimeCreateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreateVoiceConnectorResponse *> *)createVoiceConnector:(AWSChimeCreateVoiceConnectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/voice-connectors"
                  targetPrefix:@""
                 operationName:@"CreateVoiceConnector"
                   outputClass:[AWSChimeCreateVoiceConnectorResponse class]];
}

- (void)createVoiceConnector:(AWSChimeCreateVoiceConnectorRequest *)request
     completionHandler:(void (^)(AWSChimeCreateVoiceConnectorResponse *response, NSError *error))completionHandler {
    [[self createVoiceConnector:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreateVoiceConnectorResponse *> * _Nonnull task) {
        AWSChimeCreateVoiceConnectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeCreateVoiceConnectorGroupResponse *> *)createVoiceConnectorGroup:(AWSChimeCreateVoiceConnectorGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/voice-connector-groups"
                  targetPrefix:@""
                 operationName:@"CreateVoiceConnectorGroup"
                   outputClass:[AWSChimeCreateVoiceConnectorGroupResponse class]];
}

- (void)createVoiceConnectorGroup:(AWSChimeCreateVoiceConnectorGroupRequest *)request
     completionHandler:(void (^)(AWSChimeCreateVoiceConnectorGroupResponse *response, NSError *error))completionHandler {
    [[self createVoiceConnectorGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeCreateVoiceConnectorGroupResponse *> * _Nonnull task) {
        AWSChimeCreateVoiceConnectorGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeDeleteAccountResponse *> *)deleteAccount:(AWSChimeDeleteAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{accountId}"
                  targetPrefix:@""
                 operationName:@"DeleteAccount"
                   outputClass:[AWSChimeDeleteAccountResponse class]];
}

- (void)deleteAccount:(AWSChimeDeleteAccountRequest *)request
     completionHandler:(void (^)(AWSChimeDeleteAccountResponse *response, NSError *error))completionHandler {
    [[self deleteAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeDeleteAccountResponse *> * _Nonnull task) {
        AWSChimeDeleteAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAttendee:(AWSChimeDeleteAttendeeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/meetings/{meetingId}/attendees/{attendeeId}"
                  targetPrefix:@""
                 operationName:@"DeleteAttendee"
                   outputClass:nil];
}

- (void)deleteAttendee:(AWSChimeDeleteAttendeeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAttendee:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteEventsConfiguration:(AWSChimeDeleteEventsConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{accountId}/bots/{botId}/events-configuration"
                  targetPrefix:@""
                 operationName:@"DeleteEventsConfiguration"
                   outputClass:nil];
}

- (void)deleteEventsConfiguration:(AWSChimeDeleteEventsConfigurationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEventsConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteMeeting:(AWSChimeDeleteMeetingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/meetings/{meetingId}"
                  targetPrefix:@""
                 operationName:@"DeleteMeeting"
                   outputClass:nil];
}

- (void)deleteMeeting:(AWSChimeDeleteMeetingRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteMeeting:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePhoneNumber:(AWSChimeDeletePhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/phone-numbers/{phoneNumberId}"
                  targetPrefix:@""
                 operationName:@"DeletePhoneNumber"
                   outputClass:nil];
}

- (void)deletePhoneNumber:(AWSChimeDeletePhoneNumberRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteProxySession:(AWSChimeDeleteProxySessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/voice-connectors/{voiceConnectorId}/proxy-sessions/{proxySessionId}"
                  targetPrefix:@""
                 operationName:@"DeleteProxySession"
                   outputClass:nil];
}

- (void)deleteProxySession:(AWSChimeDeleteProxySessionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteProxySession:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRoom:(AWSChimeDeleteRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{accountId}/rooms/{roomId}"
                  targetPrefix:@""
                 operationName:@"DeleteRoom"
                   outputClass:nil];
}

- (void)deleteRoom:(AWSChimeDeleteRoomRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRoom:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRoomMembership:(AWSChimeDeleteRoomMembershipRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/accounts/{accountId}/rooms/{roomId}/memberships/{memberId}"
                  targetPrefix:@""
                 operationName:@"DeleteRoomMembership"
                   outputClass:nil];
}

- (void)deleteRoomMembership:(AWSChimeDeleteRoomMembershipRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRoomMembership:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVoiceConnector:(AWSChimeDeleteVoiceConnectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/voice-connectors/{voiceConnectorId}"
                  targetPrefix:@""
                 operationName:@"DeleteVoiceConnector"
                   outputClass:nil];
}

- (void)deleteVoiceConnector:(AWSChimeDeleteVoiceConnectorRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVoiceConnector:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVoiceConnectorGroup:(AWSChimeDeleteVoiceConnectorGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/voice-connector-groups/{voiceConnectorGroupId}"
                  targetPrefix:@""
                 operationName:@"DeleteVoiceConnectorGroup"
                   outputClass:nil];
}

- (void)deleteVoiceConnectorGroup:(AWSChimeDeleteVoiceConnectorGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVoiceConnectorGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVoiceConnectorOrigination:(AWSChimeDeleteVoiceConnectorOriginationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/voice-connectors/{voiceConnectorId}/origination"
                  targetPrefix:@""
                 operationName:@"DeleteVoiceConnectorOrigination"
                   outputClass:nil];
}

- (void)deleteVoiceConnectorOrigination:(AWSChimeDeleteVoiceConnectorOriginationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVoiceConnectorOrigination:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVoiceConnectorProxy:(AWSChimeDeleteVoiceConnectorProxyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/voice-connectors/{voiceConnectorId}/programmable-numbers/proxy"
                  targetPrefix:@""
                 operationName:@"DeleteVoiceConnectorProxy"
                   outputClass:nil];
}

- (void)deleteVoiceConnectorProxy:(AWSChimeDeleteVoiceConnectorProxyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVoiceConnectorProxy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVoiceConnectorStreamingConfiguration:(AWSChimeDeleteVoiceConnectorStreamingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/voice-connectors/{voiceConnectorId}/streaming-configuration"
                  targetPrefix:@""
                 operationName:@"DeleteVoiceConnectorStreamingConfiguration"
                   outputClass:nil];
}

- (void)deleteVoiceConnectorStreamingConfiguration:(AWSChimeDeleteVoiceConnectorStreamingConfigurationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVoiceConnectorStreamingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVoiceConnectorTermination:(AWSChimeDeleteVoiceConnectorTerminationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/voice-connectors/{voiceConnectorId}/termination"
                  targetPrefix:@""
                 operationName:@"DeleteVoiceConnectorTermination"
                   outputClass:nil];
}

- (void)deleteVoiceConnectorTermination:(AWSChimeDeleteVoiceConnectorTerminationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVoiceConnectorTermination:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVoiceConnectorTerminationCredentials:(AWSChimeDeleteVoiceConnectorTerminationCredentialsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/voice-connectors/{voiceConnectorId}/termination/credentials?operation=delete"
                  targetPrefix:@""
                 operationName:@"DeleteVoiceConnectorTerminationCredentials"
                   outputClass:nil];
}

- (void)deleteVoiceConnectorTerminationCredentials:(AWSChimeDeleteVoiceConnectorTerminationCredentialsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVoiceConnectorTerminationCredentials:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeDisassociatePhoneNumberFromUserResponse *> *)disassociatePhoneNumberFromUser:(AWSChimeDisassociatePhoneNumberFromUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/users/{userId}?operation=disassociate-phone-number"
                  targetPrefix:@""
                 operationName:@"DisassociatePhoneNumberFromUser"
                   outputClass:[AWSChimeDisassociatePhoneNumberFromUserResponse class]];
}

- (void)disassociatePhoneNumberFromUser:(AWSChimeDisassociatePhoneNumberFromUserRequest *)request
     completionHandler:(void (^)(AWSChimeDisassociatePhoneNumberFromUserResponse *response, NSError *error))completionHandler {
    [[self disassociatePhoneNumberFromUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeDisassociatePhoneNumberFromUserResponse *> * _Nonnull task) {
        AWSChimeDisassociatePhoneNumberFromUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse *> *)disassociatePhoneNumbersFromVoiceConnector:(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/voice-connectors/{voiceConnectorId}?operation=disassociate-phone-numbers"
                  targetPrefix:@""
                 operationName:@"DisassociatePhoneNumbersFromVoiceConnector"
                   outputClass:[AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse class]];
}

- (void)disassociatePhoneNumbersFromVoiceConnector:(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorRequest *)request
     completionHandler:(void (^)(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse *response, NSError *error))completionHandler {
    [[self disassociatePhoneNumbersFromVoiceConnector:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse *> * _Nonnull task) {
        AWSChimeDisassociatePhoneNumbersFromVoiceConnectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse *> *)disassociatePhoneNumbersFromVoiceConnectorGroup:(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/voice-connector-groups/{voiceConnectorGroupId}?operation=disassociate-phone-numbers"
                  targetPrefix:@""
                 operationName:@"DisassociatePhoneNumbersFromVoiceConnectorGroup"
                   outputClass:[AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse class]];
}

- (void)disassociatePhoneNumbersFromVoiceConnectorGroup:(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupRequest *)request
     completionHandler:(void (^)(AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse *response, NSError *error))completionHandler {
    [[self disassociatePhoneNumbersFromVoiceConnectorGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse *> * _Nonnull task) {
        AWSChimeDisassociatePhoneNumbersFromVoiceConnectorGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse *> *)disassociateSigninDelegateGroupsFromAccount:(AWSChimeDisassociateSigninDelegateGroupsFromAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}?operation=disassociate-signin-delegate-groups"
                  targetPrefix:@""
                 operationName:@"DisassociateSigninDelegateGroupsFromAccount"
                   outputClass:[AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse class]];
}

- (void)disassociateSigninDelegateGroupsFromAccount:(AWSChimeDisassociateSigninDelegateGroupsFromAccountRequest *)request
     completionHandler:(void (^)(AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse *response, NSError *error))completionHandler {
    [[self disassociateSigninDelegateGroupsFromAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse *> * _Nonnull task) {
        AWSChimeDisassociateSigninDelegateGroupsFromAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetAccountResponse *> *)getAccount:(AWSChimeGetAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}"
                  targetPrefix:@""
                 operationName:@"GetAccount"
                   outputClass:[AWSChimeGetAccountResponse class]];
}

- (void)getAccount:(AWSChimeGetAccountRequest *)request
     completionHandler:(void (^)(AWSChimeGetAccountResponse *response, NSError *error))completionHandler {
    [[self getAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetAccountResponse *> * _Nonnull task) {
        AWSChimeGetAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetAccountSettingsResponse *> *)getAccountSettings:(AWSChimeGetAccountSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/settings"
                  targetPrefix:@""
                 operationName:@"GetAccountSettings"
                   outputClass:[AWSChimeGetAccountSettingsResponse class]];
}

- (void)getAccountSettings:(AWSChimeGetAccountSettingsRequest *)request
     completionHandler:(void (^)(AWSChimeGetAccountSettingsResponse *response, NSError *error))completionHandler {
    [[self getAccountSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetAccountSettingsResponse *> * _Nonnull task) {
        AWSChimeGetAccountSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetAttendeeResponse *> *)getAttendee:(AWSChimeGetAttendeeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/meetings/{meetingId}/attendees/{attendeeId}"
                  targetPrefix:@""
                 operationName:@"GetAttendee"
                   outputClass:[AWSChimeGetAttendeeResponse class]];
}

- (void)getAttendee:(AWSChimeGetAttendeeRequest *)request
     completionHandler:(void (^)(AWSChimeGetAttendeeResponse *response, NSError *error))completionHandler {
    [[self getAttendee:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetAttendeeResponse *> * _Nonnull task) {
        AWSChimeGetAttendeeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetBotResponse *> *)getBot:(AWSChimeGetBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/bots/{botId}"
                  targetPrefix:@""
                 operationName:@"GetBot"
                   outputClass:[AWSChimeGetBotResponse class]];
}

- (void)getBot:(AWSChimeGetBotRequest *)request
     completionHandler:(void (^)(AWSChimeGetBotResponse *response, NSError *error))completionHandler {
    [[self getBot:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetBotResponse *> * _Nonnull task) {
        AWSChimeGetBotResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetEventsConfigurationResponse *> *)getEventsConfiguration:(AWSChimeGetEventsConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/bots/{botId}/events-configuration"
                  targetPrefix:@""
                 operationName:@"GetEventsConfiguration"
                   outputClass:[AWSChimeGetEventsConfigurationResponse class]];
}

- (void)getEventsConfiguration:(AWSChimeGetEventsConfigurationRequest *)request
     completionHandler:(void (^)(AWSChimeGetEventsConfigurationResponse *response, NSError *error))completionHandler {
    [[self getEventsConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetEventsConfigurationResponse *> * _Nonnull task) {
        AWSChimeGetEventsConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetGlobalSettingsResponse *> *)getGlobalSettings:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/settings"
                  targetPrefix:@""
                 operationName:@"GetGlobalSettings"
                   outputClass:[AWSChimeGetGlobalSettingsResponse class]];
}

- (void)getGlobalSettings:(AWSRequest *)request
     completionHandler:(void (^)(AWSChimeGetGlobalSettingsResponse *response, NSError *error))completionHandler {
    [[self getGlobalSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetGlobalSettingsResponse *> * _Nonnull task) {
        AWSChimeGetGlobalSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetMeetingResponse *> *)getMeeting:(AWSChimeGetMeetingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/meetings/{meetingId}"
                  targetPrefix:@""
                 operationName:@"GetMeeting"
                   outputClass:[AWSChimeGetMeetingResponse class]];
}

- (void)getMeeting:(AWSChimeGetMeetingRequest *)request
     completionHandler:(void (^)(AWSChimeGetMeetingResponse *response, NSError *error))completionHandler {
    [[self getMeeting:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetMeetingResponse *> * _Nonnull task) {
        AWSChimeGetMeetingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetPhoneNumberResponse *> *)getPhoneNumber:(AWSChimeGetPhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/phone-numbers/{phoneNumberId}"
                  targetPrefix:@""
                 operationName:@"GetPhoneNumber"
                   outputClass:[AWSChimeGetPhoneNumberResponse class]];
}

- (void)getPhoneNumber:(AWSChimeGetPhoneNumberRequest *)request
     completionHandler:(void (^)(AWSChimeGetPhoneNumberResponse *response, NSError *error))completionHandler {
    [[self getPhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetPhoneNumberResponse *> * _Nonnull task) {
        AWSChimeGetPhoneNumberResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetPhoneNumberOrderResponse *> *)getPhoneNumberOrder:(AWSChimeGetPhoneNumberOrderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/phone-number-orders/{phoneNumberOrderId}"
                  targetPrefix:@""
                 operationName:@"GetPhoneNumberOrder"
                   outputClass:[AWSChimeGetPhoneNumberOrderResponse class]];
}

- (void)getPhoneNumberOrder:(AWSChimeGetPhoneNumberOrderRequest *)request
     completionHandler:(void (^)(AWSChimeGetPhoneNumberOrderResponse *response, NSError *error))completionHandler {
    [[self getPhoneNumberOrder:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetPhoneNumberOrderResponse *> * _Nonnull task) {
        AWSChimeGetPhoneNumberOrderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetPhoneNumberSettingsResponse *> *)getPhoneNumberSettings:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/settings/phone-number"
                  targetPrefix:@""
                 operationName:@"GetPhoneNumberSettings"
                   outputClass:[AWSChimeGetPhoneNumberSettingsResponse class]];
}

- (void)getPhoneNumberSettings:(AWSRequest *)request
     completionHandler:(void (^)(AWSChimeGetPhoneNumberSettingsResponse *response, NSError *error))completionHandler {
    [[self getPhoneNumberSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetPhoneNumberSettingsResponse *> * _Nonnull task) {
        AWSChimeGetPhoneNumberSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetProxySessionResponse *> *)getProxySession:(AWSChimeGetProxySessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors/{voiceConnectorId}/proxy-sessions/{proxySessionId}"
                  targetPrefix:@""
                 operationName:@"GetProxySession"
                   outputClass:[AWSChimeGetProxySessionResponse class]];
}

- (void)getProxySession:(AWSChimeGetProxySessionRequest *)request
     completionHandler:(void (^)(AWSChimeGetProxySessionResponse *response, NSError *error))completionHandler {
    [[self getProxySession:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetProxySessionResponse *> * _Nonnull task) {
        AWSChimeGetProxySessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetRetentionSettingsResponse *> *)getRetentionSettings:(AWSChimeGetRetentionSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/retention-settings"
                  targetPrefix:@""
                 operationName:@"GetRetentionSettings"
                   outputClass:[AWSChimeGetRetentionSettingsResponse class]];
}

- (void)getRetentionSettings:(AWSChimeGetRetentionSettingsRequest *)request
     completionHandler:(void (^)(AWSChimeGetRetentionSettingsResponse *response, NSError *error))completionHandler {
    [[self getRetentionSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetRetentionSettingsResponse *> * _Nonnull task) {
        AWSChimeGetRetentionSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetRoomResponse *> *)getRoom:(AWSChimeGetRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/rooms/{roomId}"
                  targetPrefix:@""
                 operationName:@"GetRoom"
                   outputClass:[AWSChimeGetRoomResponse class]];
}

- (void)getRoom:(AWSChimeGetRoomRequest *)request
     completionHandler:(void (^)(AWSChimeGetRoomResponse *response, NSError *error))completionHandler {
    [[self getRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetRoomResponse *> * _Nonnull task) {
        AWSChimeGetRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetUserResponse *> *)getUser:(AWSChimeGetUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/users/{userId}"
                  targetPrefix:@""
                 operationName:@"GetUser"
                   outputClass:[AWSChimeGetUserResponse class]];
}

- (void)getUser:(AWSChimeGetUserRequest *)request
     completionHandler:(void (^)(AWSChimeGetUserResponse *response, NSError *error))completionHandler {
    [[self getUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetUserResponse *> * _Nonnull task) {
        AWSChimeGetUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetUserSettingsResponse *> *)getUserSettings:(AWSChimeGetUserSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/users/{userId}/settings"
                  targetPrefix:@""
                 operationName:@"GetUserSettings"
                   outputClass:[AWSChimeGetUserSettingsResponse class]];
}

- (void)getUserSettings:(AWSChimeGetUserSettingsRequest *)request
     completionHandler:(void (^)(AWSChimeGetUserSettingsResponse *response, NSError *error))completionHandler {
    [[self getUserSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetUserSettingsResponse *> * _Nonnull task) {
        AWSChimeGetUserSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetVoiceConnectorResponse *> *)getVoiceConnector:(AWSChimeGetVoiceConnectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors/{voiceConnectorId}"
                  targetPrefix:@""
                 operationName:@"GetVoiceConnector"
                   outputClass:[AWSChimeGetVoiceConnectorResponse class]];
}

- (void)getVoiceConnector:(AWSChimeGetVoiceConnectorRequest *)request
     completionHandler:(void (^)(AWSChimeGetVoiceConnectorResponse *response, NSError *error))completionHandler {
    [[self getVoiceConnector:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetVoiceConnectorResponse *> * _Nonnull task) {
        AWSChimeGetVoiceConnectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetVoiceConnectorGroupResponse *> *)getVoiceConnectorGroup:(AWSChimeGetVoiceConnectorGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connector-groups/{voiceConnectorGroupId}"
                  targetPrefix:@""
                 operationName:@"GetVoiceConnectorGroup"
                   outputClass:[AWSChimeGetVoiceConnectorGroupResponse class]];
}

- (void)getVoiceConnectorGroup:(AWSChimeGetVoiceConnectorGroupRequest *)request
     completionHandler:(void (^)(AWSChimeGetVoiceConnectorGroupResponse *response, NSError *error))completionHandler {
    [[self getVoiceConnectorGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetVoiceConnectorGroupResponse *> * _Nonnull task) {
        AWSChimeGetVoiceConnectorGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetVoiceConnectorLoggingConfigurationResponse *> *)getVoiceConnectorLoggingConfiguration:(AWSChimeGetVoiceConnectorLoggingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors/{voiceConnectorId}/logging-configuration"
                  targetPrefix:@""
                 operationName:@"GetVoiceConnectorLoggingConfiguration"
                   outputClass:[AWSChimeGetVoiceConnectorLoggingConfigurationResponse class]];
}

- (void)getVoiceConnectorLoggingConfiguration:(AWSChimeGetVoiceConnectorLoggingConfigurationRequest *)request
     completionHandler:(void (^)(AWSChimeGetVoiceConnectorLoggingConfigurationResponse *response, NSError *error))completionHandler {
    [[self getVoiceConnectorLoggingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetVoiceConnectorLoggingConfigurationResponse *> * _Nonnull task) {
        AWSChimeGetVoiceConnectorLoggingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetVoiceConnectorOriginationResponse *> *)getVoiceConnectorOrigination:(AWSChimeGetVoiceConnectorOriginationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors/{voiceConnectorId}/origination"
                  targetPrefix:@""
                 operationName:@"GetVoiceConnectorOrigination"
                   outputClass:[AWSChimeGetVoiceConnectorOriginationResponse class]];
}

- (void)getVoiceConnectorOrigination:(AWSChimeGetVoiceConnectorOriginationRequest *)request
     completionHandler:(void (^)(AWSChimeGetVoiceConnectorOriginationResponse *response, NSError *error))completionHandler {
    [[self getVoiceConnectorOrigination:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetVoiceConnectorOriginationResponse *> * _Nonnull task) {
        AWSChimeGetVoiceConnectorOriginationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetVoiceConnectorProxyResponse *> *)getVoiceConnectorProxy:(AWSChimeGetVoiceConnectorProxyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors/{voiceConnectorId}/programmable-numbers/proxy"
                  targetPrefix:@""
                 operationName:@"GetVoiceConnectorProxy"
                   outputClass:[AWSChimeGetVoiceConnectorProxyResponse class]];
}

- (void)getVoiceConnectorProxy:(AWSChimeGetVoiceConnectorProxyRequest *)request
     completionHandler:(void (^)(AWSChimeGetVoiceConnectorProxyResponse *response, NSError *error))completionHandler {
    [[self getVoiceConnectorProxy:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetVoiceConnectorProxyResponse *> * _Nonnull task) {
        AWSChimeGetVoiceConnectorProxyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetVoiceConnectorStreamingConfigurationResponse *> *)getVoiceConnectorStreamingConfiguration:(AWSChimeGetVoiceConnectorStreamingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors/{voiceConnectorId}/streaming-configuration"
                  targetPrefix:@""
                 operationName:@"GetVoiceConnectorStreamingConfiguration"
                   outputClass:[AWSChimeGetVoiceConnectorStreamingConfigurationResponse class]];
}

- (void)getVoiceConnectorStreamingConfiguration:(AWSChimeGetVoiceConnectorStreamingConfigurationRequest *)request
     completionHandler:(void (^)(AWSChimeGetVoiceConnectorStreamingConfigurationResponse *response, NSError *error))completionHandler {
    [[self getVoiceConnectorStreamingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetVoiceConnectorStreamingConfigurationResponse *> * _Nonnull task) {
        AWSChimeGetVoiceConnectorStreamingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetVoiceConnectorTerminationResponse *> *)getVoiceConnectorTermination:(AWSChimeGetVoiceConnectorTerminationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors/{voiceConnectorId}/termination"
                  targetPrefix:@""
                 operationName:@"GetVoiceConnectorTermination"
                   outputClass:[AWSChimeGetVoiceConnectorTerminationResponse class]];
}

- (void)getVoiceConnectorTermination:(AWSChimeGetVoiceConnectorTerminationRequest *)request
     completionHandler:(void (^)(AWSChimeGetVoiceConnectorTerminationResponse *response, NSError *error))completionHandler {
    [[self getVoiceConnectorTermination:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetVoiceConnectorTerminationResponse *> * _Nonnull task) {
        AWSChimeGetVoiceConnectorTerminationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeGetVoiceConnectorTerminationHealthResponse *> *)getVoiceConnectorTerminationHealth:(AWSChimeGetVoiceConnectorTerminationHealthRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors/{voiceConnectorId}/termination/health"
                  targetPrefix:@""
                 operationName:@"GetVoiceConnectorTerminationHealth"
                   outputClass:[AWSChimeGetVoiceConnectorTerminationHealthResponse class]];
}

- (void)getVoiceConnectorTerminationHealth:(AWSChimeGetVoiceConnectorTerminationHealthRequest *)request
     completionHandler:(void (^)(AWSChimeGetVoiceConnectorTerminationHealthResponse *response, NSError *error))completionHandler {
    [[self getVoiceConnectorTerminationHealth:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeGetVoiceConnectorTerminationHealthResponse *> * _Nonnull task) {
        AWSChimeGetVoiceConnectorTerminationHealthResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeInviteUsersResponse *> *)inviteUsers:(AWSChimeInviteUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/users?operation=add"
                  targetPrefix:@""
                 operationName:@"InviteUsers"
                   outputClass:[AWSChimeInviteUsersResponse class]];
}

- (void)inviteUsers:(AWSChimeInviteUsersRequest *)request
     completionHandler:(void (^)(AWSChimeInviteUsersResponse *response, NSError *error))completionHandler {
    [[self inviteUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeInviteUsersResponse *> * _Nonnull task) {
        AWSChimeInviteUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListAccountsResponse *> *)listAccounts:(AWSChimeListAccountsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts"
                  targetPrefix:@""
                 operationName:@"ListAccounts"
                   outputClass:[AWSChimeListAccountsResponse class]];
}

- (void)listAccounts:(AWSChimeListAccountsRequest *)request
     completionHandler:(void (^)(AWSChimeListAccountsResponse *response, NSError *error))completionHandler {
    [[self listAccounts:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListAccountsResponse *> * _Nonnull task) {
        AWSChimeListAccountsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListAttendeeTagsResponse *> *)listAttendeeTags:(AWSChimeListAttendeeTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/meetings/{meetingId}/attendees/{attendeeId}/tags"
                  targetPrefix:@""
                 operationName:@"ListAttendeeTags"
                   outputClass:[AWSChimeListAttendeeTagsResponse class]];
}

- (void)listAttendeeTags:(AWSChimeListAttendeeTagsRequest *)request
     completionHandler:(void (^)(AWSChimeListAttendeeTagsResponse *response, NSError *error))completionHandler {
    [[self listAttendeeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListAttendeeTagsResponse *> * _Nonnull task) {
        AWSChimeListAttendeeTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListAttendeesResponse *> *)listAttendees:(AWSChimeListAttendeesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/meetings/{meetingId}/attendees"
                  targetPrefix:@""
                 operationName:@"ListAttendees"
                   outputClass:[AWSChimeListAttendeesResponse class]];
}

- (void)listAttendees:(AWSChimeListAttendeesRequest *)request
     completionHandler:(void (^)(AWSChimeListAttendeesResponse *response, NSError *error))completionHandler {
    [[self listAttendees:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListAttendeesResponse *> * _Nonnull task) {
        AWSChimeListAttendeesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListBotsResponse *> *)listBots:(AWSChimeListBotsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/bots"
                  targetPrefix:@""
                 operationName:@"ListBots"
                   outputClass:[AWSChimeListBotsResponse class]];
}

- (void)listBots:(AWSChimeListBotsRequest *)request
     completionHandler:(void (^)(AWSChimeListBotsResponse *response, NSError *error))completionHandler {
    [[self listBots:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListBotsResponse *> * _Nonnull task) {
        AWSChimeListBotsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListMeetingTagsResponse *> *)listMeetingTags:(AWSChimeListMeetingTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/meetings/{meetingId}/tags"
                  targetPrefix:@""
                 operationName:@"ListMeetingTags"
                   outputClass:[AWSChimeListMeetingTagsResponse class]];
}

- (void)listMeetingTags:(AWSChimeListMeetingTagsRequest *)request
     completionHandler:(void (^)(AWSChimeListMeetingTagsResponse *response, NSError *error))completionHandler {
    [[self listMeetingTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListMeetingTagsResponse *> * _Nonnull task) {
        AWSChimeListMeetingTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListMeetingsResponse *> *)listMeetings:(AWSChimeListMeetingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/meetings"
                  targetPrefix:@""
                 operationName:@"ListMeetings"
                   outputClass:[AWSChimeListMeetingsResponse class]];
}

- (void)listMeetings:(AWSChimeListMeetingsRequest *)request
     completionHandler:(void (^)(AWSChimeListMeetingsResponse *response, NSError *error))completionHandler {
    [[self listMeetings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListMeetingsResponse *> * _Nonnull task) {
        AWSChimeListMeetingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListPhoneNumberOrdersResponse *> *)listPhoneNumberOrders:(AWSChimeListPhoneNumberOrdersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/phone-number-orders"
                  targetPrefix:@""
                 operationName:@"ListPhoneNumberOrders"
                   outputClass:[AWSChimeListPhoneNumberOrdersResponse class]];
}

- (void)listPhoneNumberOrders:(AWSChimeListPhoneNumberOrdersRequest *)request
     completionHandler:(void (^)(AWSChimeListPhoneNumberOrdersResponse *response, NSError *error))completionHandler {
    [[self listPhoneNumberOrders:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListPhoneNumberOrdersResponse *> * _Nonnull task) {
        AWSChimeListPhoneNumberOrdersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListPhoneNumbersResponse *> *)listPhoneNumbers:(AWSChimeListPhoneNumbersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/phone-numbers"
                  targetPrefix:@""
                 operationName:@"ListPhoneNumbers"
                   outputClass:[AWSChimeListPhoneNumbersResponse class]];
}

- (void)listPhoneNumbers:(AWSChimeListPhoneNumbersRequest *)request
     completionHandler:(void (^)(AWSChimeListPhoneNumbersResponse *response, NSError *error))completionHandler {
    [[self listPhoneNumbers:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListPhoneNumbersResponse *> * _Nonnull task) {
        AWSChimeListPhoneNumbersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListProxySessionsResponse *> *)listProxySessions:(AWSChimeListProxySessionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors/{voiceConnectorId}/proxy-sessions"
                  targetPrefix:@""
                 operationName:@"ListProxySessions"
                   outputClass:[AWSChimeListProxySessionsResponse class]];
}

- (void)listProxySessions:(AWSChimeListProxySessionsRequest *)request
     completionHandler:(void (^)(AWSChimeListProxySessionsResponse *response, NSError *error))completionHandler {
    [[self listProxySessions:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListProxySessionsResponse *> * _Nonnull task) {
        AWSChimeListProxySessionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListRoomMembershipsResponse *> *)listRoomMemberships:(AWSChimeListRoomMembershipsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/rooms/{roomId}/memberships"
                  targetPrefix:@""
                 operationName:@"ListRoomMemberships"
                   outputClass:[AWSChimeListRoomMembershipsResponse class]];
}

- (void)listRoomMemberships:(AWSChimeListRoomMembershipsRequest *)request
     completionHandler:(void (^)(AWSChimeListRoomMembershipsResponse *response, NSError *error))completionHandler {
    [[self listRoomMemberships:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListRoomMembershipsResponse *> * _Nonnull task) {
        AWSChimeListRoomMembershipsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListRoomsResponse *> *)listRooms:(AWSChimeListRoomsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/rooms"
                  targetPrefix:@""
                 operationName:@"ListRooms"
                   outputClass:[AWSChimeListRoomsResponse class]];
}

- (void)listRooms:(AWSChimeListRoomsRequest *)request
     completionHandler:(void (^)(AWSChimeListRoomsResponse *response, NSError *error))completionHandler {
    [[self listRooms:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListRoomsResponse *> * _Nonnull task) {
        AWSChimeListRoomsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListTagsForResourceResponse *> *)listTagsForResource:(AWSChimeListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSChimeListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSChimeListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSChimeListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListTagsForResourceResponse *> * _Nonnull task) {
        AWSChimeListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListUsersResponse *> *)listUsers:(AWSChimeListUsersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/accounts/{accountId}/users"
                  targetPrefix:@""
                 operationName:@"ListUsers"
                   outputClass:[AWSChimeListUsersResponse class]];
}

- (void)listUsers:(AWSChimeListUsersRequest *)request
     completionHandler:(void (^)(AWSChimeListUsersResponse *response, NSError *error))completionHandler {
    [[self listUsers:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListUsersResponse *> * _Nonnull task) {
        AWSChimeListUsersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListVoiceConnectorGroupsResponse *> *)listVoiceConnectorGroups:(AWSChimeListVoiceConnectorGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connector-groups"
                  targetPrefix:@""
                 operationName:@"ListVoiceConnectorGroups"
                   outputClass:[AWSChimeListVoiceConnectorGroupsResponse class]];
}

- (void)listVoiceConnectorGroups:(AWSChimeListVoiceConnectorGroupsRequest *)request
     completionHandler:(void (^)(AWSChimeListVoiceConnectorGroupsResponse *response, NSError *error))completionHandler {
    [[self listVoiceConnectorGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListVoiceConnectorGroupsResponse *> * _Nonnull task) {
        AWSChimeListVoiceConnectorGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListVoiceConnectorTerminationCredentialsResponse *> *)listVoiceConnectorTerminationCredentials:(AWSChimeListVoiceConnectorTerminationCredentialsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors/{voiceConnectorId}/termination/credentials"
                  targetPrefix:@""
                 operationName:@"ListVoiceConnectorTerminationCredentials"
                   outputClass:[AWSChimeListVoiceConnectorTerminationCredentialsResponse class]];
}

- (void)listVoiceConnectorTerminationCredentials:(AWSChimeListVoiceConnectorTerminationCredentialsRequest *)request
     completionHandler:(void (^)(AWSChimeListVoiceConnectorTerminationCredentialsResponse *response, NSError *error))completionHandler {
    [[self listVoiceConnectorTerminationCredentials:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListVoiceConnectorTerminationCredentialsResponse *> * _Nonnull task) {
        AWSChimeListVoiceConnectorTerminationCredentialsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeListVoiceConnectorsResponse *> *)listVoiceConnectors:(AWSChimeListVoiceConnectorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/voice-connectors"
                  targetPrefix:@""
                 operationName:@"ListVoiceConnectors"
                   outputClass:[AWSChimeListVoiceConnectorsResponse class]];
}

- (void)listVoiceConnectors:(AWSChimeListVoiceConnectorsRequest *)request
     completionHandler:(void (^)(AWSChimeListVoiceConnectorsResponse *response, NSError *error))completionHandler {
    [[self listVoiceConnectors:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeListVoiceConnectorsResponse *> * _Nonnull task) {
        AWSChimeListVoiceConnectorsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeLogoutUserResponse *> *)logoutUser:(AWSChimeLogoutUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/users/{userId}?operation=logout"
                  targetPrefix:@""
                 operationName:@"LogoutUser"
                   outputClass:[AWSChimeLogoutUserResponse class]];
}

- (void)logoutUser:(AWSChimeLogoutUserRequest *)request
     completionHandler:(void (^)(AWSChimeLogoutUserResponse *response, NSError *error))completionHandler {
    [[self logoutUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeLogoutUserResponse *> * _Nonnull task) {
        AWSChimeLogoutUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimePutEventsConfigurationResponse *> *)putEventsConfiguration:(AWSChimePutEventsConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{accountId}/bots/{botId}/events-configuration"
                  targetPrefix:@""
                 operationName:@"PutEventsConfiguration"
                   outputClass:[AWSChimePutEventsConfigurationResponse class]];
}

- (void)putEventsConfiguration:(AWSChimePutEventsConfigurationRequest *)request
     completionHandler:(void (^)(AWSChimePutEventsConfigurationResponse *response, NSError *error))completionHandler {
    [[self putEventsConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimePutEventsConfigurationResponse *> * _Nonnull task) {
        AWSChimePutEventsConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimePutRetentionSettingsResponse *> *)putRetentionSettings:(AWSChimePutRetentionSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{accountId}/retention-settings"
                  targetPrefix:@""
                 operationName:@"PutRetentionSettings"
                   outputClass:[AWSChimePutRetentionSettingsResponse class]];
}

- (void)putRetentionSettings:(AWSChimePutRetentionSettingsRequest *)request
     completionHandler:(void (^)(AWSChimePutRetentionSettingsResponse *response, NSError *error))completionHandler {
    [[self putRetentionSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimePutRetentionSettingsResponse *> * _Nonnull task) {
        AWSChimePutRetentionSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimePutVoiceConnectorLoggingConfigurationResponse *> *)putVoiceConnectorLoggingConfiguration:(AWSChimePutVoiceConnectorLoggingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/voice-connectors/{voiceConnectorId}/logging-configuration"
                  targetPrefix:@""
                 operationName:@"PutVoiceConnectorLoggingConfiguration"
                   outputClass:[AWSChimePutVoiceConnectorLoggingConfigurationResponse class]];
}

- (void)putVoiceConnectorLoggingConfiguration:(AWSChimePutVoiceConnectorLoggingConfigurationRequest *)request
     completionHandler:(void (^)(AWSChimePutVoiceConnectorLoggingConfigurationResponse *response, NSError *error))completionHandler {
    [[self putVoiceConnectorLoggingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimePutVoiceConnectorLoggingConfigurationResponse *> * _Nonnull task) {
        AWSChimePutVoiceConnectorLoggingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimePutVoiceConnectorOriginationResponse *> *)putVoiceConnectorOrigination:(AWSChimePutVoiceConnectorOriginationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/voice-connectors/{voiceConnectorId}/origination"
                  targetPrefix:@""
                 operationName:@"PutVoiceConnectorOrigination"
                   outputClass:[AWSChimePutVoiceConnectorOriginationResponse class]];
}

- (void)putVoiceConnectorOrigination:(AWSChimePutVoiceConnectorOriginationRequest *)request
     completionHandler:(void (^)(AWSChimePutVoiceConnectorOriginationResponse *response, NSError *error))completionHandler {
    [[self putVoiceConnectorOrigination:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimePutVoiceConnectorOriginationResponse *> * _Nonnull task) {
        AWSChimePutVoiceConnectorOriginationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimePutVoiceConnectorProxyResponse *> *)putVoiceConnectorProxy:(AWSChimePutVoiceConnectorProxyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/voice-connectors/{voiceConnectorId}/programmable-numbers/proxy"
                  targetPrefix:@""
                 operationName:@"PutVoiceConnectorProxy"
                   outputClass:[AWSChimePutVoiceConnectorProxyResponse class]];
}

- (void)putVoiceConnectorProxy:(AWSChimePutVoiceConnectorProxyRequest *)request
     completionHandler:(void (^)(AWSChimePutVoiceConnectorProxyResponse *response, NSError *error))completionHandler {
    [[self putVoiceConnectorProxy:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimePutVoiceConnectorProxyResponse *> * _Nonnull task) {
        AWSChimePutVoiceConnectorProxyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimePutVoiceConnectorStreamingConfigurationResponse *> *)putVoiceConnectorStreamingConfiguration:(AWSChimePutVoiceConnectorStreamingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/voice-connectors/{voiceConnectorId}/streaming-configuration"
                  targetPrefix:@""
                 operationName:@"PutVoiceConnectorStreamingConfiguration"
                   outputClass:[AWSChimePutVoiceConnectorStreamingConfigurationResponse class]];
}

- (void)putVoiceConnectorStreamingConfiguration:(AWSChimePutVoiceConnectorStreamingConfigurationRequest *)request
     completionHandler:(void (^)(AWSChimePutVoiceConnectorStreamingConfigurationResponse *response, NSError *error))completionHandler {
    [[self putVoiceConnectorStreamingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimePutVoiceConnectorStreamingConfigurationResponse *> * _Nonnull task) {
        AWSChimePutVoiceConnectorStreamingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimePutVoiceConnectorTerminationResponse *> *)putVoiceConnectorTermination:(AWSChimePutVoiceConnectorTerminationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/voice-connectors/{voiceConnectorId}/termination"
                  targetPrefix:@""
                 operationName:@"PutVoiceConnectorTermination"
                   outputClass:[AWSChimePutVoiceConnectorTerminationResponse class]];
}

- (void)putVoiceConnectorTermination:(AWSChimePutVoiceConnectorTerminationRequest *)request
     completionHandler:(void (^)(AWSChimePutVoiceConnectorTerminationResponse *response, NSError *error))completionHandler {
    [[self putVoiceConnectorTermination:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimePutVoiceConnectorTerminationResponse *> * _Nonnull task) {
        AWSChimePutVoiceConnectorTerminationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putVoiceConnectorTerminationCredentials:(AWSChimePutVoiceConnectorTerminationCredentialsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/voice-connectors/{voiceConnectorId}/termination/credentials?operation=put"
                  targetPrefix:@""
                 operationName:@"PutVoiceConnectorTerminationCredentials"
                   outputClass:nil];
}

- (void)putVoiceConnectorTerminationCredentials:(AWSChimePutVoiceConnectorTerminationCredentialsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putVoiceConnectorTerminationCredentials:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeRedactConversationMessageResponse *> *)redactConversationMessage:(AWSChimeRedactConversationMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/conversations/{conversationId}/messages/{messageId}?operation=redact"
                  targetPrefix:@""
                 operationName:@"RedactConversationMessage"
                   outputClass:[AWSChimeRedactConversationMessageResponse class]];
}

- (void)redactConversationMessage:(AWSChimeRedactConversationMessageRequest *)request
     completionHandler:(void (^)(AWSChimeRedactConversationMessageResponse *response, NSError *error))completionHandler {
    [[self redactConversationMessage:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeRedactConversationMessageResponse *> * _Nonnull task) {
        AWSChimeRedactConversationMessageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeRedactRoomMessageResponse *> *)redactRoomMessage:(AWSChimeRedactRoomMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/rooms/{roomId}/messages/{messageId}?operation=redact"
                  targetPrefix:@""
                 operationName:@"RedactRoomMessage"
                   outputClass:[AWSChimeRedactRoomMessageResponse class]];
}

- (void)redactRoomMessage:(AWSChimeRedactRoomMessageRequest *)request
     completionHandler:(void (^)(AWSChimeRedactRoomMessageResponse *response, NSError *error))completionHandler {
    [[self redactRoomMessage:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeRedactRoomMessageResponse *> * _Nonnull task) {
        AWSChimeRedactRoomMessageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeRegenerateSecurityTokenResponse *> *)regenerateSecurityToken:(AWSChimeRegenerateSecurityTokenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/bots/{botId}?operation=regenerate-security-token"
                  targetPrefix:@""
                 operationName:@"RegenerateSecurityToken"
                   outputClass:[AWSChimeRegenerateSecurityTokenResponse class]];
}

- (void)regenerateSecurityToken:(AWSChimeRegenerateSecurityTokenRequest *)request
     completionHandler:(void (^)(AWSChimeRegenerateSecurityTokenResponse *response, NSError *error))completionHandler {
    [[self regenerateSecurityToken:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeRegenerateSecurityTokenResponse *> * _Nonnull task) {
        AWSChimeRegenerateSecurityTokenResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeResetPersonalPINResponse *> *)resetPersonalPIN:(AWSChimeResetPersonalPINRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/users/{userId}?operation=reset-personal-pin"
                  targetPrefix:@""
                 operationName:@"ResetPersonalPIN"
                   outputClass:[AWSChimeResetPersonalPINResponse class]];
}

- (void)resetPersonalPIN:(AWSChimeResetPersonalPINRequest *)request
     completionHandler:(void (^)(AWSChimeResetPersonalPINResponse *response, NSError *error))completionHandler {
    [[self resetPersonalPIN:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeResetPersonalPINResponse *> * _Nonnull task) {
        AWSChimeResetPersonalPINResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeRestorePhoneNumberResponse *> *)restorePhoneNumber:(AWSChimeRestorePhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/phone-numbers/{phoneNumberId}?operation=restore"
                  targetPrefix:@""
                 operationName:@"RestorePhoneNumber"
                   outputClass:[AWSChimeRestorePhoneNumberResponse class]];
}

- (void)restorePhoneNumber:(AWSChimeRestorePhoneNumberRequest *)request
     completionHandler:(void (^)(AWSChimeRestorePhoneNumberResponse *response, NSError *error))completionHandler {
    [[self restorePhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeRestorePhoneNumberResponse *> * _Nonnull task) {
        AWSChimeRestorePhoneNumberResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSearchAvailablePhoneNumbersResponse *> *)searchAvailablePhoneNumbers:(AWSChimeSearchAvailablePhoneNumbersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/search?type=phone-numbers"
                  targetPrefix:@""
                 operationName:@"SearchAvailablePhoneNumbers"
                   outputClass:[AWSChimeSearchAvailablePhoneNumbersResponse class]];
}

- (void)searchAvailablePhoneNumbers:(AWSChimeSearchAvailablePhoneNumbersRequest *)request
     completionHandler:(void (^)(AWSChimeSearchAvailablePhoneNumbersResponse *response, NSError *error))completionHandler {
    [[self searchAvailablePhoneNumbers:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSearchAvailablePhoneNumbersResponse *> * _Nonnull task) {
        AWSChimeSearchAvailablePhoneNumbersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagAttendee:(AWSChimeTagAttendeeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/meetings/{meetingId}/attendees/{attendeeId}/tags?operation=add"
                  targetPrefix:@""
                 operationName:@"TagAttendee"
                   outputClass:nil];
}

- (void)tagAttendee:(AWSChimeTagAttendeeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagAttendee:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)tagMeeting:(AWSChimeTagMeetingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/meetings/{meetingId}/tags?operation=add"
                  targetPrefix:@""
                 operationName:@"TagMeeting"
                   outputClass:nil];
}

- (void)tagMeeting:(AWSChimeTagMeetingRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagMeeting:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSChimeTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags?operation=tag-resource"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSChimeTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagAttendee:(AWSChimeUntagAttendeeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/meetings/{meetingId}/attendees/{attendeeId}/tags?operation=delete"
                  targetPrefix:@""
                 operationName:@"UntagAttendee"
                   outputClass:nil];
}

- (void)untagAttendee:(AWSChimeUntagAttendeeRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagAttendee:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagMeeting:(AWSChimeUntagMeetingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/meetings/{meetingId}/tags?operation=delete"
                  targetPrefix:@""
                 operationName:@"UntagMeeting"
                   outputClass:nil];
}

- (void)untagMeeting:(AWSChimeUntagMeetingRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagMeeting:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSChimeUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags?operation=untag-resource"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSChimeUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeUpdateAccountResponse *> *)updateAccount:(AWSChimeUpdateAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}"
                  targetPrefix:@""
                 operationName:@"UpdateAccount"
                   outputClass:[AWSChimeUpdateAccountResponse class]];
}

- (void)updateAccount:(AWSChimeUpdateAccountRequest *)request
     completionHandler:(void (^)(AWSChimeUpdateAccountResponse *response, NSError *error))completionHandler {
    [[self updateAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeUpdateAccountResponse *> * _Nonnull task) {
        AWSChimeUpdateAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeUpdateAccountSettingsResponse *> *)updateAccountSettings:(AWSChimeUpdateAccountSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{accountId}/settings"
                  targetPrefix:@""
                 operationName:@"UpdateAccountSettings"
                   outputClass:[AWSChimeUpdateAccountSettingsResponse class]];
}

- (void)updateAccountSettings:(AWSChimeUpdateAccountSettingsRequest *)request
     completionHandler:(void (^)(AWSChimeUpdateAccountSettingsResponse *response, NSError *error))completionHandler {
    [[self updateAccountSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeUpdateAccountSettingsResponse *> * _Nonnull task) {
        AWSChimeUpdateAccountSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeUpdateBotResponse *> *)updateBot:(AWSChimeUpdateBotRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/bots/{botId}"
                  targetPrefix:@""
                 operationName:@"UpdateBot"
                   outputClass:[AWSChimeUpdateBotResponse class]];
}

- (void)updateBot:(AWSChimeUpdateBotRequest *)request
     completionHandler:(void (^)(AWSChimeUpdateBotResponse *response, NSError *error))completionHandler {
    [[self updateBot:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeUpdateBotResponse *> * _Nonnull task) {
        AWSChimeUpdateBotResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateGlobalSettings:(AWSChimeUpdateGlobalSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/settings"
                  targetPrefix:@""
                 operationName:@"UpdateGlobalSettings"
                   outputClass:nil];
}

- (void)updateGlobalSettings:(AWSChimeUpdateGlobalSettingsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateGlobalSettings:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeUpdatePhoneNumberResponse *> *)updatePhoneNumber:(AWSChimeUpdatePhoneNumberRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/phone-numbers/{phoneNumberId}"
                  targetPrefix:@""
                 operationName:@"UpdatePhoneNumber"
                   outputClass:[AWSChimeUpdatePhoneNumberResponse class]];
}

- (void)updatePhoneNumber:(AWSChimeUpdatePhoneNumberRequest *)request
     completionHandler:(void (^)(AWSChimeUpdatePhoneNumberResponse *response, NSError *error))completionHandler {
    [[self updatePhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeUpdatePhoneNumberResponse *> * _Nonnull task) {
        AWSChimeUpdatePhoneNumberResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updatePhoneNumberSettings:(AWSChimeUpdatePhoneNumberSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/settings/phone-number"
                  targetPrefix:@""
                 operationName:@"UpdatePhoneNumberSettings"
                   outputClass:nil];
}

- (void)updatePhoneNumberSettings:(AWSChimeUpdatePhoneNumberSettingsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updatePhoneNumberSettings:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeUpdateProxySessionResponse *> *)updateProxySession:(AWSChimeUpdateProxySessionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/voice-connectors/{voiceConnectorId}/proxy-sessions/{proxySessionId}"
                  targetPrefix:@""
                 operationName:@"UpdateProxySession"
                   outputClass:[AWSChimeUpdateProxySessionResponse class]];
}

- (void)updateProxySession:(AWSChimeUpdateProxySessionRequest *)request
     completionHandler:(void (^)(AWSChimeUpdateProxySessionResponse *response, NSError *error))completionHandler {
    [[self updateProxySession:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeUpdateProxySessionResponse *> * _Nonnull task) {
        AWSChimeUpdateProxySessionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeUpdateRoomResponse *> *)updateRoom:(AWSChimeUpdateRoomRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/rooms/{roomId}"
                  targetPrefix:@""
                 operationName:@"UpdateRoom"
                   outputClass:[AWSChimeUpdateRoomResponse class]];
}

- (void)updateRoom:(AWSChimeUpdateRoomRequest *)request
     completionHandler:(void (^)(AWSChimeUpdateRoomResponse *response, NSError *error))completionHandler {
    [[self updateRoom:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeUpdateRoomResponse *> * _Nonnull task) {
        AWSChimeUpdateRoomResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeUpdateRoomMembershipResponse *> *)updateRoomMembership:(AWSChimeUpdateRoomMembershipRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/rooms/{roomId}/memberships/{memberId}"
                  targetPrefix:@""
                 operationName:@"UpdateRoomMembership"
                   outputClass:[AWSChimeUpdateRoomMembershipResponse class]];
}

- (void)updateRoomMembership:(AWSChimeUpdateRoomMembershipRequest *)request
     completionHandler:(void (^)(AWSChimeUpdateRoomMembershipResponse *response, NSError *error))completionHandler {
    [[self updateRoomMembership:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeUpdateRoomMembershipResponse *> * _Nonnull task) {
        AWSChimeUpdateRoomMembershipResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeUpdateUserResponse *> *)updateUser:(AWSChimeUpdateUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/accounts/{accountId}/users/{userId}"
                  targetPrefix:@""
                 operationName:@"UpdateUser"
                   outputClass:[AWSChimeUpdateUserResponse class]];
}

- (void)updateUser:(AWSChimeUpdateUserRequest *)request
     completionHandler:(void (^)(AWSChimeUpdateUserResponse *response, NSError *error))completionHandler {
    [[self updateUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeUpdateUserResponse *> * _Nonnull task) {
        AWSChimeUpdateUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateUserSettings:(AWSChimeUpdateUserSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/accounts/{accountId}/users/{userId}/settings"
                  targetPrefix:@""
                 operationName:@"UpdateUserSettings"
                   outputClass:nil];
}

- (void)updateUserSettings:(AWSChimeUpdateUserSettingsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateUserSettings:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeUpdateVoiceConnectorResponse *> *)updateVoiceConnector:(AWSChimeUpdateVoiceConnectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/voice-connectors/{voiceConnectorId}"
                  targetPrefix:@""
                 operationName:@"UpdateVoiceConnector"
                   outputClass:[AWSChimeUpdateVoiceConnectorResponse class]];
}

- (void)updateVoiceConnector:(AWSChimeUpdateVoiceConnectorRequest *)request
     completionHandler:(void (^)(AWSChimeUpdateVoiceConnectorResponse *response, NSError *error))completionHandler {
    [[self updateVoiceConnector:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeUpdateVoiceConnectorResponse *> * _Nonnull task) {
        AWSChimeUpdateVoiceConnectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeUpdateVoiceConnectorGroupResponse *> *)updateVoiceConnectorGroup:(AWSChimeUpdateVoiceConnectorGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/voice-connector-groups/{voiceConnectorGroupId}"
                  targetPrefix:@""
                 operationName:@"UpdateVoiceConnectorGroup"
                   outputClass:[AWSChimeUpdateVoiceConnectorGroupResponse class]];
}

- (void)updateVoiceConnectorGroup:(AWSChimeUpdateVoiceConnectorGroupRequest *)request
     completionHandler:(void (^)(AWSChimeUpdateVoiceConnectorGroupResponse *response, NSError *error))completionHandler {
    [[self updateVoiceConnectorGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeUpdateVoiceConnectorGroupResponse *> * _Nonnull task) {
        AWSChimeUpdateVoiceConnectorGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
