/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSSNS.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSSNSResources.h"

NSString *const AWSSNSDefinitionFileName = @"sns-2010-03-31";


@interface AWSSNSResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSSNSResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSSNSErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSSNSErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSSNSErrorMissingAuthenticationToken),
                            @"AuthorizationError" : @(AWSSNSErrorAuthorizationError),
                            @"EndpointDisabled" : @(AWSSNSErrorEndpointDisabled),
                            @"InternalError" : @(AWSSNSErrorInternalError),
                            @"InvalidParameter" : @(AWSSNSErrorInvalidParameter),
                            @"ParameterValueInvalid" : @(AWSSNSErrorInvalidParameterValue),
                            @"NotFound" : @(AWSSNSErrorNotFound),
                            @"PlatformApplicationDisabled" : @(AWSSNSErrorPlatformApplicationDisabled),
                            @"SubscriptionLimitExceeded" : @(AWSSNSErrorSubscriptionLimitExceeded),
                            @"TopicLimitExceeded" : @(AWSSNSErrorTopicLimitExceeded),
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
                *error = [NSError errorWithDomain:AWSSNSErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSSNSErrorDomain
                                             code:AWSSNSErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }

        if (self.outputClass) {
            responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
                                          fromJSONDictionary:responseObject
                                                       error:error];
        }
    }

    return responseObject;
}

@end

@interface AWSSNSRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSNSRequestRetryHandler

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
        if ([error.domain isEqualToString:AWSSNSErrorDomain]) {
            switch (error.code) {
                case AWSSNSErrorIncompleteSignature:
                case AWSSNSErrorInvalidClientTokenId:
                case AWSSNSErrorMissingAuthenticationToken:
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

@interface AWSSNS()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSSNS

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSNS {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    static AWSSNS *_defaultSNS = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultSNS = [[AWSSNS alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultSNS;
}

+ (void)registerSNSWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSSNS alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)SNSForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeSNSForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSNS` or `+ SNSForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSNS
                                                         useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSNSRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];

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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSSNSResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSNSResponseSerializer alloc] initWithJSONDefinition:[[AWSSNSResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)addPermission:(AWSSNSAddPermissionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddPermission"
                   outputClass:nil];
}

- (AWSTask *)confirmSubscription:(AWSSNSConfirmSubscriptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ConfirmSubscription"
                   outputClass:[AWSSNSConfirmSubscriptionResponse class]];
}

- (AWSTask *)createPlatformApplication:(AWSSNSCreatePlatformApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePlatformApplication"
                   outputClass:[AWSSNSCreatePlatformApplicationResponse class]];
}

- (AWSTask *)createPlatformEndpoint:(AWSSNSCreatePlatformEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePlatformEndpoint"
                   outputClass:[AWSSNSCreateEndpointResponse class]];
}

- (AWSTask *)createTopic:(AWSSNSCreateTopicInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTopic"
                   outputClass:[AWSSNSCreateTopicResponse class]];
}

- (AWSTask *)deleteEndpoint:(AWSSNSDeleteEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteEndpoint"
                   outputClass:nil];
}

- (AWSTask *)deletePlatformApplication:(AWSSNSDeletePlatformApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePlatformApplication"
                   outputClass:nil];
}

- (AWSTask *)deleteTopic:(AWSSNSDeleteTopicInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTopic"
                   outputClass:nil];
}

- (AWSTask *)getEndpointAttributes:(AWSSNSGetEndpointAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetEndpointAttributes"
                   outputClass:[AWSSNSGetEndpointAttributesResponse class]];
}

- (AWSTask *)getPlatformApplicationAttributes:(AWSSNSGetPlatformApplicationAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetPlatformApplicationAttributes"
                   outputClass:[AWSSNSGetPlatformApplicationAttributesResponse class]];
}

- (AWSTask *)getSubscriptionAttributes:(AWSSNSGetSubscriptionAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSubscriptionAttributes"
                   outputClass:[AWSSNSGetSubscriptionAttributesResponse class]];
}

- (AWSTask *)getTopicAttributes:(AWSSNSGetTopicAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetTopicAttributes"
                   outputClass:[AWSSNSGetTopicAttributesResponse class]];
}

- (AWSTask *)listEndpointsByPlatformApplication:(AWSSNSListEndpointsByPlatformApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListEndpointsByPlatformApplication"
                   outputClass:[AWSSNSListEndpointsByPlatformApplicationResponse class]];
}

- (AWSTask *)listPlatformApplications:(AWSSNSListPlatformApplicationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListPlatformApplications"
                   outputClass:[AWSSNSListPlatformApplicationsResponse class]];
}

- (AWSTask *)listSubscriptions:(AWSSNSListSubscriptionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListSubscriptions"
                   outputClass:[AWSSNSListSubscriptionsResponse class]];
}

- (AWSTask *)listSubscriptionsByTopic:(AWSSNSListSubscriptionsByTopicInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListSubscriptionsByTopic"
                   outputClass:[AWSSNSListSubscriptionsByTopicResponse class]];
}

- (AWSTask *)listTopics:(AWSSNSListTopicsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTopics"
                   outputClass:[AWSSNSListTopicsResponse class]];
}

- (AWSTask *)publish:(AWSSNSPublishInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Publish"
                   outputClass:[AWSSNSPublishResponse class]];
}

- (AWSTask *)removePermission:(AWSSNSRemovePermissionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemovePermission"
                   outputClass:nil];
}

- (AWSTask *)setEndpointAttributes:(AWSSNSSetEndpointAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetEndpointAttributes"
                   outputClass:nil];
}

- (AWSTask *)setPlatformApplicationAttributes:(AWSSNSSetPlatformApplicationAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetPlatformApplicationAttributes"
                   outputClass:nil];
}

- (AWSTask *)setSubscriptionAttributes:(AWSSNSSetSubscriptionAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetSubscriptionAttributes"
                   outputClass:nil];
}

- (AWSTask *)setTopicAttributes:(AWSSNSSetTopicAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetTopicAttributes"
                   outputClass:nil];
}

- (AWSTask *)subscribe:(AWSSNSSubscribeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Subscribe"
                   outputClass:[AWSSNSSubscribeResponse class]];
}

- (AWSTask *)unsubscribe:(AWSSNSUnsubscribeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Unsubscribe"
                   outputClass:nil];
}

@end