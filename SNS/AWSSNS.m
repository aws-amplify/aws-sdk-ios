/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
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

NSString *const AWSSNSDefinitionFileName = @"sns-2010-03-31";


@interface AWSSNSResponseSerializer : AWSXMLResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

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

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSSNSResponseSerializer *serializer = [AWSSNSResponseSerializer serializerWithResource:resource
                                                                                 actionName:actionName];
    serializer.outputClass = outputClass;

    return serializer;
}

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
            responseObject = [MTLJSONAdapter modelOfClass:self.outputClass
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

+ (instancetype)defaultSNS {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSSNS *_defaultSNS = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultSNS = [[AWSSNS alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultSNS;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                                          service:AWSServiceSNS];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSSNSRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Host" : _configuration.endpoint.hostName};

        _networking = [AWSNetworking networking:_configuration];
    }

    return self;
}

- (BFTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AWSHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    if (!request) {
        request = [AWSRequest new];
    }

    AWSNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[MTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }
    networkingRequest.HTTPMethod = HTTPMethod;

    AWSQueryStringRequestSerializer *requestSerializer = [AWSQueryStringRequestSerializer serializerWithResource:AWSSNSDefinitionFileName actionName:operationName];
    networkingRequest.requestSerializer = requestSerializer;

    networkingRequest.responseSerializer = [AWSSNSResponseSerializer serializerWithOutputClass:outputClass
                                                                                      resource:AWSSNSDefinitionFileName
                                                                                    actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)addPermission:(AWSSNSAddPermissionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddPermission"
                   outputClass:nil];
}

- (BFTask *)confirmSubscription:(AWSSNSConfirmSubscriptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ConfirmSubscription"
                   outputClass:[AWSSNSConfirmSubscriptionResponse class]];
}

- (BFTask *)createPlatformApplication:(AWSSNSCreatePlatformApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePlatformApplication"
                   outputClass:[AWSSNSCreatePlatformApplicationResponse class]];
}

- (BFTask *)createPlatformEndpoint:(AWSSNSCreatePlatformEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePlatformEndpoint"
                   outputClass:[AWSSNSCreateEndpointResponse class]];
}

- (BFTask *)createTopic:(AWSSNSCreateTopicInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTopic"
                   outputClass:[AWSSNSCreateTopicResponse class]];
}

- (BFTask *)deleteEndpoint:(AWSSNSDeleteEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteEndpoint"
                   outputClass:nil];
}

- (BFTask *)deletePlatformApplication:(AWSSNSDeletePlatformApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePlatformApplication"
                   outputClass:nil];
}

- (BFTask *)deleteTopic:(AWSSNSDeleteTopicInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTopic"
                   outputClass:nil];
}

- (BFTask *)getEndpointAttributes:(AWSSNSGetEndpointAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetEndpointAttributes"
                   outputClass:[AWSSNSGetEndpointAttributesResponse class]];
}

- (BFTask *)getPlatformApplicationAttributes:(AWSSNSGetPlatformApplicationAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetPlatformApplicationAttributes"
                   outputClass:[AWSSNSGetPlatformApplicationAttributesResponse class]];
}

- (BFTask *)getSubscriptionAttributes:(AWSSNSGetSubscriptionAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSubscriptionAttributes"
                   outputClass:[AWSSNSGetSubscriptionAttributesResponse class]];
}

- (BFTask *)getTopicAttributes:(AWSSNSGetTopicAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetTopicAttributes"
                   outputClass:[AWSSNSGetTopicAttributesResponse class]];
}

- (BFTask *)listEndpointsByPlatformApplication:(AWSSNSListEndpointsByPlatformApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListEndpointsByPlatformApplication"
                   outputClass:[AWSSNSListEndpointsByPlatformApplicationResponse class]];
}

- (BFTask *)listPlatformApplications:(AWSSNSListPlatformApplicationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListPlatformApplications"
                   outputClass:[AWSSNSListPlatformApplicationsResponse class]];
}

- (BFTask *)listSubscriptions:(AWSSNSListSubscriptionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListSubscriptions"
                   outputClass:[AWSSNSListSubscriptionsResponse class]];
}

- (BFTask *)listSubscriptionsByTopic:(AWSSNSListSubscriptionsByTopicInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListSubscriptionsByTopic"
                   outputClass:[AWSSNSListSubscriptionsByTopicResponse class]];
}

- (BFTask *)listTopics:(AWSSNSListTopicsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTopics"
                   outputClass:[AWSSNSListTopicsResponse class]];
}

- (BFTask *)publish:(AWSSNSPublishInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Publish"
                   outputClass:[AWSSNSPublishResponse class]];
}

- (BFTask *)removePermission:(AWSSNSRemovePermissionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemovePermission"
                   outputClass:nil];
}

- (BFTask *)setEndpointAttributes:(AWSSNSSetEndpointAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetEndpointAttributes"
                   outputClass:nil];
}

- (BFTask *)setPlatformApplicationAttributes:(AWSSNSSetPlatformApplicationAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetPlatformApplicationAttributes"
                   outputClass:nil];
}

- (BFTask *)setSubscriptionAttributes:(AWSSNSSetSubscriptionAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetSubscriptionAttributes"
                   outputClass:nil];
}

- (BFTask *)setTopicAttributes:(AWSSNSSetTopicAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetTopicAttributes"
                   outputClass:nil];
}

- (BFTask *)subscribe:(AWSSNSSubscribeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Subscribe"
                   outputClass:[AWSSNSSubscribeResponse class]];
}

- (BFTask *)unsubscribe:(AWSSNSUnsubscribeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Unsubscribe"
                   outputClass:nil];
}

@end