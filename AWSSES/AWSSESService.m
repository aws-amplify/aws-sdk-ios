//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSSES.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSSESResources.h"

@interface AWSSESResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSSESResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSSESErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSSESErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSSESErrorMissingAuthenticationToken),
                            @"MessageRejected" : @(AWSSESErrorMessageRejected),
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
        NSDictionary *errorInfo = responseObject[@"Error"];
        if (errorInfo[@"Code"] && errorCodeDictionary[errorInfo[@"Code"]]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSSESErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSSESErrorDomain
                                             code:AWSSESErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSSESErrorDomain
                                     code:AWSSESErrorUnknown
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

@interface AWSSESRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSESRequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && currentRetryCount < self.maxRetryCount) {
        if ([error.domain isEqualToString:AWSSESErrorDomain]) {
            switch (error.code) {
                case AWSSESErrorIncompleteSignature:
                case AWSSESErrorInvalidClientTokenId:
                case AWSSESErrorMissingAuthenticationToken:
                    retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                    break;

                default:
                    break;
            }
        } else if ([error.domain isEqualToString:AWSGeneralErrorDomain]) {
            switch (error.code) {
                case AWSGeneralErrorSignatureDoesNotMatch:
                    retryType = AWSNetworkingRetryTypeShouldCorrectClockSkewAndRetry;
                    break;

                default:
                    break;
            }
        }
    }

    return retryType;
}

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSES()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSSES

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSES {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    static AWSSES *_defaultSES = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultSES = [[AWSSES alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultSES;
}

+ (void)registerSESWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSSES alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)SESForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeSESForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSES` or `+ SESForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSES
                                                         useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSESRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];

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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSSESResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSESResponseSerializer alloc] initWithJSONDefinition:[[AWSSESResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSESDeleteIdentityResponse *> *)deleteIdentity:(AWSSESDeleteIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteIdentity"
                   outputClass:[AWSSESDeleteIdentityResponse class]];
}

- (void)deleteIdentity:(AWSSESDeleteIdentityRequest *)request
     completionHandler:(void (^)(AWSSESDeleteIdentityResponse *response, NSError *error))completionHandler {
    [[self deleteIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteIdentityResponse *> * _Nonnull task) {
        AWSSESDeleteIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteVerifiedEmailAddress:(AWSSESDeleteVerifiedEmailAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVerifiedEmailAddress"
                   outputClass:nil];
}

- (void)deleteVerifiedEmailAddress:(AWSSESDeleteVerifiedEmailAddressRequest *)request
                 completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteVerifiedEmailAddress:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetIdentityDkimAttributesResponse *> *)getIdentityDkimAttributes:(AWSSESGetIdentityDkimAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityDkimAttributes"
                   outputClass:[AWSSESGetIdentityDkimAttributesResponse class]];
}

- (void)getIdentityDkimAttributes:(AWSSESGetIdentityDkimAttributesRequest *)request
                completionHandler:(void (^)(AWSSESGetIdentityDkimAttributesResponse *response, NSError *error))completionHandler {
    [[self getIdentityDkimAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetIdentityDkimAttributesResponse *> * _Nonnull task) {
        AWSSESGetIdentityDkimAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetIdentityNotificationAttributesResponse *> *)getIdentityNotificationAttributes:(AWSSESGetIdentityNotificationAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityNotificationAttributes"
                   outputClass:[AWSSESGetIdentityNotificationAttributesResponse class]];
}

- (void)getIdentityNotificationAttributes:(AWSSESGetIdentityNotificationAttributesRequest *)request
                        completionHandler:(void (^)(AWSSESGetIdentityNotificationAttributesResponse *response, NSError *error))completionHandler {
    [[self getIdentityNotificationAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetIdentityNotificationAttributesResponse *> * _Nonnull task) {
        AWSSESGetIdentityNotificationAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetIdentityVerificationAttributesResponse *> *)getIdentityVerificationAttributes:(AWSSESGetIdentityVerificationAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityVerificationAttributes"
                   outputClass:[AWSSESGetIdentityVerificationAttributesResponse class]];
}

- (void)getIdentityVerificationAttributes:(AWSSESGetIdentityVerificationAttributesRequest *)request
                        completionHandler:(void (^)(AWSSESGetIdentityVerificationAttributesResponse *response, NSError *error))completionHandler {
    [[self getIdentityVerificationAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetIdentityVerificationAttributesResponse *> * _Nonnull task) {
        AWSSESGetIdentityVerificationAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetSendQuotaResponse *> *)getSendQuota:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSendQuota"
                   outputClass:[AWSSESGetSendQuotaResponse class]];
}

- (void)getSendQuota:(AWSRequest *)request
   completionHandler:(void (^)(AWSSESGetSendQuotaResponse *response, NSError *error))completionHandler {
    [[self getSendQuota:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetSendQuotaResponse *> * _Nonnull task) {
        AWSSESGetSendQuotaResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetSendStatisticsResponse *> *)getSendStatistics:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSendStatistics"
                   outputClass:[AWSSESGetSendStatisticsResponse class]];
}

- (void)getSendStatistics:(AWSRequest *)request
        completionHandler:(void (^)(AWSSESGetSendStatisticsResponse *response, NSError *error))completionHandler {
    [[self getSendStatistics:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetSendStatisticsResponse *> * _Nonnull task) {
        AWSSESGetSendStatisticsResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListIdentitiesResponse *> *)listIdentities:(AWSSESListIdentitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListIdentities"
                   outputClass:[AWSSESListIdentitiesResponse class]];
}

- (void)listIdentities:(AWSSESListIdentitiesRequest *)request
     completionHandler:(void (^)(AWSSESListIdentitiesResponse *response, NSError *error))completionHandler {
    [[self listIdentities:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListIdentitiesResponse *> * _Nonnull task) {
        AWSSESListIdentitiesResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListVerifiedEmailAddressesResponse *> *)listVerifiedEmailAddresses:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListVerifiedEmailAddresses"
                   outputClass:[AWSSESListVerifiedEmailAddressesResponse class]];
}

- (void)listVerifiedEmailAddresses:(AWSRequest *)request
                 completionHandler:(void (^)(AWSSESListVerifiedEmailAddressesResponse *response, NSError *error))completionHandler {
    [[self listVerifiedEmailAddresses:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListVerifiedEmailAddressesResponse *> * _Nonnull task) {
        AWSSESListVerifiedEmailAddressesResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSendEmailResponse *> *)sendEmail:(AWSSESSendEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendEmail"
                   outputClass:[AWSSESSendEmailResponse class]];
}

- (void)sendEmail:(AWSSESSendEmailRequest *)request
completionHandler:(void (^)(AWSSESSendEmailResponse *response, NSError *error))completionHandler {
    [[self sendEmail:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSendEmailResponse *> * _Nonnull task) {
        AWSSESSendEmailResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSendRawEmailResponse *> *)sendRawEmail:(AWSSESSendRawEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendRawEmail"
                   outputClass:[AWSSESSendRawEmailResponse class]];
}

- (void)sendRawEmail:(AWSSESSendRawEmailRequest *)request
   completionHandler:(void (^)(AWSSESSendRawEmailResponse *response, NSError *error))completionHandler {
    [[self sendRawEmail:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSendRawEmailResponse *> * _Nonnull task) {
        AWSSESSendRawEmailResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSetIdentityDkimEnabledResponse *> *)setIdentityDkimEnabled:(AWSSESSetIdentityDkimEnabledRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityDkimEnabled"
                   outputClass:[AWSSESSetIdentityDkimEnabledResponse class]];
}

- (void)setIdentityDkimEnabled:(AWSSESSetIdentityDkimEnabledRequest *)request
             completionHandler:(void (^)(AWSSESSetIdentityDkimEnabledResponse *response, NSError *error))completionHandler {
    [[self setIdentityDkimEnabled:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSetIdentityDkimEnabledResponse *> * _Nonnull task) {
        AWSSESSetIdentityDkimEnabledResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSetIdentityFeedbackForwardingEnabledResponse *> *)setIdentityFeedbackForwardingEnabled:(AWSSESSetIdentityFeedbackForwardingEnabledRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityFeedbackForwardingEnabled"
                   outputClass:[AWSSESSetIdentityFeedbackForwardingEnabledResponse class]];
}

- (void)setIdentityFeedbackForwardingEnabled:(AWSSESSetIdentityFeedbackForwardingEnabledRequest *)request
                           completionHandler:(void (^)(AWSSESSetIdentityFeedbackForwardingEnabledResponse *response, NSError *error))completionHandler {
    [[self setIdentityFeedbackForwardingEnabled:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSetIdentityFeedbackForwardingEnabledResponse *> * _Nonnull task) {
        AWSSESSetIdentityFeedbackForwardingEnabledResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSetIdentityNotificationTopicResponse *> *)setIdentityNotificationTopic:(AWSSESSetIdentityNotificationTopicRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityNotificationTopic"
                   outputClass:[AWSSESSetIdentityNotificationTopicResponse class]];
}

- (void)setIdentityNotificationTopic:(AWSSESSetIdentityNotificationTopicRequest *)request
                   completionHandler:(void (^)(AWSSESSetIdentityNotificationTopicResponse *response, NSError *error))completionHandler {
    [[self setIdentityNotificationTopic:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSetIdentityNotificationTopicResponse *> * _Nonnull task) {
        AWSSESSetIdentityNotificationTopicResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESVerifyDomainDkimResponse *> *)verifyDomainDkim:(AWSSESVerifyDomainDkimRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyDomainDkim"
                   outputClass:[AWSSESVerifyDomainDkimResponse class]];
}

- (void)verifyDomainDkim:(AWSSESVerifyDomainDkimRequest *)request
       completionHandler:(void (^)(AWSSESVerifyDomainDkimResponse *response, NSError *error))completionHandler {
    [[self verifyDomainDkim:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESVerifyDomainDkimResponse *> * _Nonnull task) {
        AWSSESVerifyDomainDkimResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESVerifyDomainIdentityResponse *> *)verifyDomainIdentity:(AWSSESVerifyDomainIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyDomainIdentity"
                   outputClass:[AWSSESVerifyDomainIdentityResponse class]];
}

- (void)verifyDomainIdentity:(AWSSESVerifyDomainIdentityRequest *)request
           completionHandler:(void (^)(AWSSESVerifyDomainIdentityResponse *response, NSError *error))completionHandler {
    [[self verifyDomainIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESVerifyDomainIdentityResponse *> * _Nonnull task) {
        AWSSESVerifyDomainIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)verifyEmailAddress:(AWSSESVerifyEmailAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyEmailAddress"
                   outputClass:nil];
}

- (void)verifyEmailAddress:(AWSSESVerifyEmailAddressRequest *)request
         completionHandler:(void (^)(NSError *error))completionHandler {
    [[self verifyEmailAddress:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESVerifyEmailIdentityResponse *> *)verifyEmailIdentity:(AWSSESVerifyEmailIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyEmailIdentity"
                   outputClass:[AWSSESVerifyEmailIdentityResponse class]];
}

- (void)verifyEmailIdentity:(AWSSESVerifyEmailIdentityRequest *)request
          completionHandler:(void (^)(AWSSESVerifyEmailIdentityResponse *response, NSError *error))completionHandler {
    [[self verifyEmailIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESVerifyEmailIdentityResponse *> * _Nonnull task) {
        AWSSESVerifyEmailIdentityResponse *result = task.result;
        NSError *error = task.error;
        
        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }
        
        if (completionHandler) {
            completionHandler(result, error);
        }
        
        return nil;
    }];
}

@end