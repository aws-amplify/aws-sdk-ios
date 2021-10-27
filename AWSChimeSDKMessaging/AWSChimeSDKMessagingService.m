//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSChimeSDKMessagingService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSChimeSDKMessagingResources.h"

static NSString *const AWSInfoChimeSDKMessaging = @"ChimeSDKMessaging";
NSString *const AWSChimeSDKMessagingSDKVersion = @"2.26.3";


@interface AWSChimeSDKMessagingResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSChimeSDKMessagingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSChimeSDKMessagingErrorBadRequest),
                            @"ConflictException" : @(AWSChimeSDKMessagingErrorConflict),
                            @"ForbiddenException" : @(AWSChimeSDKMessagingErrorForbidden),
                            @"NotFoundException" : @(AWSChimeSDKMessagingErrorNotFound),
                            @"ResourceLimitExceededException" : @(AWSChimeSDKMessagingErrorResourceLimitExceeded),
                            @"ServiceFailureException" : @(AWSChimeSDKMessagingErrorServiceFailure),
                            @"ServiceUnavailableException" : @(AWSChimeSDKMessagingErrorServiceUnavailable),
                            @"ThrottledClientException" : @(AWSChimeSDKMessagingErrorThrottledClient),
                            @"UnauthorizedClientException" : @(AWSChimeSDKMessagingErrorUnauthorizedClient),
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
                    *error = [NSError errorWithDomain:AWSChimeSDKMessagingErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSChimeSDKMessagingErrorDomain
                                                 code:AWSChimeSDKMessagingErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSChimeSDKMessagingErrorDomain
                                     code:AWSChimeSDKMessagingErrorUnknown
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

@interface AWSChimeSDKMessagingRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSChimeSDKMessagingRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSChimeSDKMessaging()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSChimeSDKMessaging

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSChimeSDKMessagingSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSChimeSDKMessaging versions need to match. Check your SDK installation. AWSCore: %@ AWSChimeSDKMessaging: %@", AWSiOSSDKVersion, AWSChimeSDKMessagingSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultChimeSDKMessaging {
    static AWSChimeSDKMessaging *_defaultChimeSDKMessaging = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoChimeSDKMessaging];
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
        _defaultChimeSDKMessaging = [[AWSChimeSDKMessaging alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultChimeSDKMessaging;
}

+ (void)registerChimeSDKMessagingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSChimeSDKMessaging alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ChimeSDKMessagingForKey:(NSString *)key {
    @synchronized(self) {
        AWSChimeSDKMessaging *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoChimeSDKMessaging
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSChimeSDKMessaging registerChimeSDKMessagingWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeChimeSDKMessagingForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultChimeSDKMessaging` or `+ ChimeSDKMessagingForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceChimeSDKMessaging
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceChimeSDKMessaging];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSChimeSDKMessagingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSChimeSDKMessagingResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSChimeSDKMessagingResponseSerializer alloc] initWithJSONDefinition:[[AWSChimeSDKMessagingResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)associateChannelFlow:(AWSChimeSDKMessagingAssociateChannelFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/channels/{channelArn}/channel-flow"
                  targetPrefix:@""
                 operationName:@"AssociateChannelFlow"
                   outputClass:nil];
}

- (void)associateChannelFlow:(AWSChimeSDKMessagingAssociateChannelFlowRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateChannelFlow:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingBatchCreateChannelMembershipResponse *> *)batchCreateChannelMembership:(AWSChimeSDKMessagingBatchCreateChannelMembershipRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/channels/{channelArn}/memberships?operation=batch-create"
                  targetPrefix:@""
                 operationName:@"BatchCreateChannelMembership"
                   outputClass:[AWSChimeSDKMessagingBatchCreateChannelMembershipResponse class]];
}

- (void)batchCreateChannelMembership:(AWSChimeSDKMessagingBatchCreateChannelMembershipRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingBatchCreateChannelMembershipResponse *response, NSError *error))completionHandler {
    [[self batchCreateChannelMembership:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingBatchCreateChannelMembershipResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingBatchCreateChannelMembershipResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingChannelFlowCallbackResponse *> *)channelFlowCallback:(AWSChimeSDKMessagingChannelFlowCallbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/channels/{channelArn}?operation=channel-flow-callback"
                  targetPrefix:@""
                 operationName:@"ChannelFlowCallback"
                   outputClass:[AWSChimeSDKMessagingChannelFlowCallbackResponse class]];
}

- (void)channelFlowCallback:(AWSChimeSDKMessagingChannelFlowCallbackRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingChannelFlowCallbackResponse *response, NSError *error))completionHandler {
    [[self channelFlowCallback:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingChannelFlowCallbackResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingChannelFlowCallbackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingCreateChannelResponse *> *)createChannel:(AWSChimeSDKMessagingCreateChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/channels"
                  targetPrefix:@""
                 operationName:@"CreateChannel"
                   outputClass:[AWSChimeSDKMessagingCreateChannelResponse class]];
}

- (void)createChannel:(AWSChimeSDKMessagingCreateChannelRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingCreateChannelResponse *response, NSError *error))completionHandler {
    [[self createChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingCreateChannelResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingCreateChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingCreateChannelBanResponse *> *)createChannelBan:(AWSChimeSDKMessagingCreateChannelBanRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/channels/{channelArn}/bans"
                  targetPrefix:@""
                 operationName:@"CreateChannelBan"
                   outputClass:[AWSChimeSDKMessagingCreateChannelBanResponse class]];
}

- (void)createChannelBan:(AWSChimeSDKMessagingCreateChannelBanRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingCreateChannelBanResponse *response, NSError *error))completionHandler {
    [[self createChannelBan:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingCreateChannelBanResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingCreateChannelBanResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingCreateChannelFlowResponse *> *)createChannelFlow:(AWSChimeSDKMessagingCreateChannelFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/channel-flows"
                  targetPrefix:@""
                 operationName:@"CreateChannelFlow"
                   outputClass:[AWSChimeSDKMessagingCreateChannelFlowResponse class]];
}

- (void)createChannelFlow:(AWSChimeSDKMessagingCreateChannelFlowRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingCreateChannelFlowResponse *response, NSError *error))completionHandler {
    [[self createChannelFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingCreateChannelFlowResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingCreateChannelFlowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingCreateChannelMembershipResponse *> *)createChannelMembership:(AWSChimeSDKMessagingCreateChannelMembershipRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/channels/{channelArn}/memberships"
                  targetPrefix:@""
                 operationName:@"CreateChannelMembership"
                   outputClass:[AWSChimeSDKMessagingCreateChannelMembershipResponse class]];
}

- (void)createChannelMembership:(AWSChimeSDKMessagingCreateChannelMembershipRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingCreateChannelMembershipResponse *response, NSError *error))completionHandler {
    [[self createChannelMembership:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingCreateChannelMembershipResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingCreateChannelMembershipResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingCreateChannelModeratorResponse *> *)createChannelModerator:(AWSChimeSDKMessagingCreateChannelModeratorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/channels/{channelArn}/moderators"
                  targetPrefix:@""
                 operationName:@"CreateChannelModerator"
                   outputClass:[AWSChimeSDKMessagingCreateChannelModeratorResponse class]];
}

- (void)createChannelModerator:(AWSChimeSDKMessagingCreateChannelModeratorRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingCreateChannelModeratorResponse *response, NSError *error))completionHandler {
    [[self createChannelModerator:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingCreateChannelModeratorResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingCreateChannelModeratorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteChannel:(AWSChimeSDKMessagingDeleteChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/channels/{channelArn}"
                  targetPrefix:@""
                 operationName:@"DeleteChannel"
                   outputClass:nil];
}

- (void)deleteChannel:(AWSChimeSDKMessagingDeleteChannelRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteChannel:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteChannelBan:(AWSChimeSDKMessagingDeleteChannelBanRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/channels/{channelArn}/bans/{memberArn}"
                  targetPrefix:@""
                 operationName:@"DeleteChannelBan"
                   outputClass:nil];
}

- (void)deleteChannelBan:(AWSChimeSDKMessagingDeleteChannelBanRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteChannelBan:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteChannelFlow:(AWSChimeSDKMessagingDeleteChannelFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/channel-flows/{channelFlowArn}"
                  targetPrefix:@""
                 operationName:@"DeleteChannelFlow"
                   outputClass:nil];
}

- (void)deleteChannelFlow:(AWSChimeSDKMessagingDeleteChannelFlowRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteChannelFlow:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteChannelMembership:(AWSChimeSDKMessagingDeleteChannelMembershipRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/channels/{channelArn}/memberships/{memberArn}"
                  targetPrefix:@""
                 operationName:@"DeleteChannelMembership"
                   outputClass:nil];
}

- (void)deleteChannelMembership:(AWSChimeSDKMessagingDeleteChannelMembershipRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteChannelMembership:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteChannelMessage:(AWSChimeSDKMessagingDeleteChannelMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/channels/{channelArn}/messages/{messageId}"
                  targetPrefix:@""
                 operationName:@"DeleteChannelMessage"
                   outputClass:nil];
}

- (void)deleteChannelMessage:(AWSChimeSDKMessagingDeleteChannelMessageRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteChannelMessage:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteChannelModerator:(AWSChimeSDKMessagingDeleteChannelModeratorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/channels/{channelArn}/moderators/{channelModeratorArn}"
                  targetPrefix:@""
                 operationName:@"DeleteChannelModerator"
                   outputClass:nil];
}

- (void)deleteChannelModerator:(AWSChimeSDKMessagingDeleteChannelModeratorRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteChannelModerator:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingDescribeChannelResponse *> *)describeChannel:(AWSChimeSDKMessagingDescribeChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}"
                  targetPrefix:@""
                 operationName:@"DescribeChannel"
                   outputClass:[AWSChimeSDKMessagingDescribeChannelResponse class]];
}

- (void)describeChannel:(AWSChimeSDKMessagingDescribeChannelRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingDescribeChannelResponse *response, NSError *error))completionHandler {
    [[self describeChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingDescribeChannelResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingDescribeChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingDescribeChannelBanResponse *> *)describeChannelBan:(AWSChimeSDKMessagingDescribeChannelBanRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}/bans/{memberArn}"
                  targetPrefix:@""
                 operationName:@"DescribeChannelBan"
                   outputClass:[AWSChimeSDKMessagingDescribeChannelBanResponse class]];
}

- (void)describeChannelBan:(AWSChimeSDKMessagingDescribeChannelBanRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingDescribeChannelBanResponse *response, NSError *error))completionHandler {
    [[self describeChannelBan:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingDescribeChannelBanResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingDescribeChannelBanResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingDescribeChannelFlowResponse *> *)describeChannelFlow:(AWSChimeSDKMessagingDescribeChannelFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channel-flows/{channelFlowArn}"
                  targetPrefix:@""
                 operationName:@"DescribeChannelFlow"
                   outputClass:[AWSChimeSDKMessagingDescribeChannelFlowResponse class]];
}

- (void)describeChannelFlow:(AWSChimeSDKMessagingDescribeChannelFlowRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingDescribeChannelFlowResponse *response, NSError *error))completionHandler {
    [[self describeChannelFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingDescribeChannelFlowResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingDescribeChannelFlowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingDescribeChannelMembershipResponse *> *)describeChannelMembership:(AWSChimeSDKMessagingDescribeChannelMembershipRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}/memberships/{memberArn}"
                  targetPrefix:@""
                 operationName:@"DescribeChannelMembership"
                   outputClass:[AWSChimeSDKMessagingDescribeChannelMembershipResponse class]];
}

- (void)describeChannelMembership:(AWSChimeSDKMessagingDescribeChannelMembershipRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingDescribeChannelMembershipResponse *response, NSError *error))completionHandler {
    [[self describeChannelMembership:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingDescribeChannelMembershipResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingDescribeChannelMembershipResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse *> *)describeChannelMembershipForAppInstanceUser:(AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}?scope=app-instance-user-membership"
                  targetPrefix:@""
                 operationName:@"DescribeChannelMembershipForAppInstanceUser"
                   outputClass:[AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse class]];
}

- (void)describeChannelMembershipForAppInstanceUser:(AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse *response, NSError *error))completionHandler {
    [[self describeChannelMembershipForAppInstanceUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingDescribeChannelMembershipForAppInstanceUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse *> *)describeChannelModeratedByAppInstanceUser:(AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}?scope=app-instance-user-moderated-channel"
                  targetPrefix:@""
                 operationName:@"DescribeChannelModeratedByAppInstanceUser"
                   outputClass:[AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse class]];
}

- (void)describeChannelModeratedByAppInstanceUser:(AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse *response, NSError *error))completionHandler {
    [[self describeChannelModeratedByAppInstanceUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingDescribeChannelModeratedByAppInstanceUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingDescribeChannelModeratorResponse *> *)describeChannelModerator:(AWSChimeSDKMessagingDescribeChannelModeratorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}/moderators/{channelModeratorArn}"
                  targetPrefix:@""
                 operationName:@"DescribeChannelModerator"
                   outputClass:[AWSChimeSDKMessagingDescribeChannelModeratorResponse class]];
}

- (void)describeChannelModerator:(AWSChimeSDKMessagingDescribeChannelModeratorRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingDescribeChannelModeratorResponse *response, NSError *error))completionHandler {
    [[self describeChannelModerator:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingDescribeChannelModeratorResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingDescribeChannelModeratorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateChannelFlow:(AWSChimeSDKMessagingDisassociateChannelFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/channels/{channelArn}/channel-flow/{channelFlowArn}"
                  targetPrefix:@""
                 operationName:@"DisassociateChannelFlow"
                   outputClass:nil];
}

- (void)disassociateChannelFlow:(AWSChimeSDKMessagingDisassociateChannelFlowRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateChannelFlow:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse *> *)getChannelMembershipPreferences:(AWSChimeSDKMessagingGetChannelMembershipPreferencesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}/memberships/{memberArn}/preferences"
                  targetPrefix:@""
                 operationName:@"GetChannelMembershipPreferences"
                   outputClass:[AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse class]];
}

- (void)getChannelMembershipPreferences:(AWSChimeSDKMessagingGetChannelMembershipPreferencesRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse *response, NSError *error))completionHandler {
    [[self getChannelMembershipPreferences:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingGetChannelMembershipPreferencesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingGetChannelMessageResponse *> *)getChannelMessage:(AWSChimeSDKMessagingGetChannelMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}/messages/{messageId}"
                  targetPrefix:@""
                 operationName:@"GetChannelMessage"
                   outputClass:[AWSChimeSDKMessagingGetChannelMessageResponse class]];
}

- (void)getChannelMessage:(AWSChimeSDKMessagingGetChannelMessageRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingGetChannelMessageResponse *response, NSError *error))completionHandler {
    [[self getChannelMessage:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingGetChannelMessageResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingGetChannelMessageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingGetChannelMessageStatusResponse *> *)getChannelMessageStatus:(AWSChimeSDKMessagingGetChannelMessageStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}/messages/{messageId}?scope=message-status"
                  targetPrefix:@""
                 operationName:@"GetChannelMessageStatus"
                   outputClass:[AWSChimeSDKMessagingGetChannelMessageStatusResponse class]];
}

- (void)getChannelMessageStatus:(AWSChimeSDKMessagingGetChannelMessageStatusRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingGetChannelMessageStatusResponse *response, NSError *error))completionHandler {
    [[self getChannelMessageStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingGetChannelMessageStatusResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingGetChannelMessageStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingGetMessagingSessionEndpointResponse *> *)getMessagingSessionEndpoint:(AWSChimeSDKMessagingGetMessagingSessionEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/endpoints/messaging-session"
                  targetPrefix:@""
                 operationName:@"GetMessagingSessionEndpoint"
                   outputClass:[AWSChimeSDKMessagingGetMessagingSessionEndpointResponse class]];
}

- (void)getMessagingSessionEndpoint:(AWSChimeSDKMessagingGetMessagingSessionEndpointRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingGetMessagingSessionEndpointResponse *response, NSError *error))completionHandler {
    [[self getMessagingSessionEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingGetMessagingSessionEndpointResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingGetMessagingSessionEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingListChannelBansResponse *> *)listChannelBans:(AWSChimeSDKMessagingListChannelBansRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}/bans"
                  targetPrefix:@""
                 operationName:@"ListChannelBans"
                   outputClass:[AWSChimeSDKMessagingListChannelBansResponse class]];
}

- (void)listChannelBans:(AWSChimeSDKMessagingListChannelBansRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingListChannelBansResponse *response, NSError *error))completionHandler {
    [[self listChannelBans:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingListChannelBansResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingListChannelBansResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingListChannelFlowsResponse *> *)listChannelFlows:(AWSChimeSDKMessagingListChannelFlowsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channel-flows"
                  targetPrefix:@""
                 operationName:@"ListChannelFlows"
                   outputClass:[AWSChimeSDKMessagingListChannelFlowsResponse class]];
}

- (void)listChannelFlows:(AWSChimeSDKMessagingListChannelFlowsRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingListChannelFlowsResponse *response, NSError *error))completionHandler {
    [[self listChannelFlows:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingListChannelFlowsResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingListChannelFlowsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingListChannelMembershipsResponse *> *)listChannelMemberships:(AWSChimeSDKMessagingListChannelMembershipsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}/memberships"
                  targetPrefix:@""
                 operationName:@"ListChannelMemberships"
                   outputClass:[AWSChimeSDKMessagingListChannelMembershipsResponse class]];
}

- (void)listChannelMemberships:(AWSChimeSDKMessagingListChannelMembershipsRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingListChannelMembershipsResponse *response, NSError *error))completionHandler {
    [[self listChannelMemberships:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingListChannelMembershipsResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingListChannelMembershipsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse *> *)listChannelMembershipsForAppInstanceUser:(AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels?scope=app-instance-user-memberships"
                  targetPrefix:@""
                 operationName:@"ListChannelMembershipsForAppInstanceUser"
                   outputClass:[AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse class]];
}

- (void)listChannelMembershipsForAppInstanceUser:(AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse *response, NSError *error))completionHandler {
    [[self listChannelMembershipsForAppInstanceUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingListChannelMembershipsForAppInstanceUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingListChannelMessagesResponse *> *)listChannelMessages:(AWSChimeSDKMessagingListChannelMessagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}/messages"
                  targetPrefix:@""
                 operationName:@"ListChannelMessages"
                   outputClass:[AWSChimeSDKMessagingListChannelMessagesResponse class]];
}

- (void)listChannelMessages:(AWSChimeSDKMessagingListChannelMessagesRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingListChannelMessagesResponse *response, NSError *error))completionHandler {
    [[self listChannelMessages:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingListChannelMessagesResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingListChannelMessagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingListChannelModeratorsResponse *> *)listChannelModerators:(AWSChimeSDKMessagingListChannelModeratorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels/{channelArn}/moderators"
                  targetPrefix:@""
                 operationName:@"ListChannelModerators"
                   outputClass:[AWSChimeSDKMessagingListChannelModeratorsResponse class]];
}

- (void)listChannelModerators:(AWSChimeSDKMessagingListChannelModeratorsRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingListChannelModeratorsResponse *response, NSError *error))completionHandler {
    [[self listChannelModerators:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingListChannelModeratorsResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingListChannelModeratorsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingListChannelsResponse *> *)listChannels:(AWSChimeSDKMessagingListChannelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels"
                  targetPrefix:@""
                 operationName:@"ListChannels"
                   outputClass:[AWSChimeSDKMessagingListChannelsResponse class]];
}

- (void)listChannels:(AWSChimeSDKMessagingListChannelsRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingListChannelsResponse *response, NSError *error))completionHandler {
    [[self listChannels:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingListChannelsResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingListChannelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse *> *)listChannelsAssociatedWithChannelFlow:(AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels?scope=channel-flow-associations"
                  targetPrefix:@""
                 operationName:@"ListChannelsAssociatedWithChannelFlow"
                   outputClass:[AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse class]];
}

- (void)listChannelsAssociatedWithChannelFlow:(AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse *response, NSError *error))completionHandler {
    [[self listChannelsAssociatedWithChannelFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingListChannelsAssociatedWithChannelFlowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse *> *)listChannelsModeratedByAppInstanceUser:(AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/channels?scope=app-instance-user-moderated-channels"
                  targetPrefix:@""
                 operationName:@"ListChannelsModeratedByAppInstanceUser"
                   outputClass:[AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse class]];
}

- (void)listChannelsModeratedByAppInstanceUser:(AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse *response, NSError *error))completionHandler {
    [[self listChannelsModeratedByAppInstanceUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingListChannelsModeratedByAppInstanceUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingListTagsForResourceResponse *> *)listTagsForResource:(AWSChimeSDKMessagingListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSChimeSDKMessagingListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSChimeSDKMessagingListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingListTagsForResourceResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse *> *)putChannelMembershipPreferences:(AWSChimeSDKMessagingPutChannelMembershipPreferencesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/channels/{channelArn}/memberships/{memberArn}/preferences"
                  targetPrefix:@""
                 operationName:@"PutChannelMembershipPreferences"
                   outputClass:[AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse class]];
}

- (void)putChannelMembershipPreferences:(AWSChimeSDKMessagingPutChannelMembershipPreferencesRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse *response, NSError *error))completionHandler {
    [[self putChannelMembershipPreferences:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingPutChannelMembershipPreferencesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingRedactChannelMessageResponse *> *)redactChannelMessage:(AWSChimeSDKMessagingRedactChannelMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/channels/{channelArn}/messages/{messageId}?operation=redact"
                  targetPrefix:@""
                 operationName:@"RedactChannelMessage"
                   outputClass:[AWSChimeSDKMessagingRedactChannelMessageResponse class]];
}

- (void)redactChannelMessage:(AWSChimeSDKMessagingRedactChannelMessageRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingRedactChannelMessageResponse *response, NSError *error))completionHandler {
    [[self redactChannelMessage:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingRedactChannelMessageResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingRedactChannelMessageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingSendChannelMessageResponse *> *)sendChannelMessage:(AWSChimeSDKMessagingSendChannelMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/channels/{channelArn}/messages"
                  targetPrefix:@""
                 operationName:@"SendChannelMessage"
                   outputClass:[AWSChimeSDKMessagingSendChannelMessageResponse class]];
}

- (void)sendChannelMessage:(AWSChimeSDKMessagingSendChannelMessageRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingSendChannelMessageResponse *response, NSError *error))completionHandler {
    [[self sendChannelMessage:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingSendChannelMessageResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingSendChannelMessageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSChimeSDKMessagingTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags?operation=tag-resource"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSChimeSDKMessagingTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSChimeSDKMessagingUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags?operation=untag-resource"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSChimeSDKMessagingUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingUpdateChannelResponse *> *)updateChannel:(AWSChimeSDKMessagingUpdateChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/channels/{channelArn}"
                  targetPrefix:@""
                 operationName:@"UpdateChannel"
                   outputClass:[AWSChimeSDKMessagingUpdateChannelResponse class]];
}

- (void)updateChannel:(AWSChimeSDKMessagingUpdateChannelRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingUpdateChannelResponse *response, NSError *error))completionHandler {
    [[self updateChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingUpdateChannelResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingUpdateChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingUpdateChannelFlowResponse *> *)updateChannelFlow:(AWSChimeSDKMessagingUpdateChannelFlowRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/channel-flows/{channelFlowArn}"
                  targetPrefix:@""
                 operationName:@"UpdateChannelFlow"
                   outputClass:[AWSChimeSDKMessagingUpdateChannelFlowResponse class]];
}

- (void)updateChannelFlow:(AWSChimeSDKMessagingUpdateChannelFlowRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingUpdateChannelFlowResponse *response, NSError *error))completionHandler {
    [[self updateChannelFlow:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingUpdateChannelFlowResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingUpdateChannelFlowResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingUpdateChannelMessageResponse *> *)updateChannelMessage:(AWSChimeSDKMessagingUpdateChannelMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/channels/{channelArn}/messages/{messageId}"
                  targetPrefix:@""
                 operationName:@"UpdateChannelMessage"
                   outputClass:[AWSChimeSDKMessagingUpdateChannelMessageResponse class]];
}

- (void)updateChannelMessage:(AWSChimeSDKMessagingUpdateChannelMessageRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingUpdateChannelMessageResponse *response, NSError *error))completionHandler {
    [[self updateChannelMessage:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingUpdateChannelMessageResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingUpdateChannelMessageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSChimeSDKMessagingUpdateChannelReadMarkerResponse *> *)updateChannelReadMarker:(AWSChimeSDKMessagingUpdateChannelReadMarkerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/channels/{channelArn}/readMarker"
                  targetPrefix:@""
                 operationName:@"UpdateChannelReadMarker"
                   outputClass:[AWSChimeSDKMessagingUpdateChannelReadMarkerResponse class]];
}

- (void)updateChannelReadMarker:(AWSChimeSDKMessagingUpdateChannelReadMarkerRequest *)request
     completionHandler:(void (^)(AWSChimeSDKMessagingUpdateChannelReadMarkerResponse *response, NSError *error))completionHandler {
    [[self updateChannelReadMarker:request] continueWithBlock:^id _Nullable(AWSTask<AWSChimeSDKMessagingUpdateChannelReadMarkerResponse *> * _Nonnull task) {
        AWSChimeSDKMessagingUpdateChannelReadMarkerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
