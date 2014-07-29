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

#import "AWSSES.h"

#import "AZNetworking.h"
#import "AZCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"

NSString *const AWSSESDefinitionFileName = @"email-2010-12-01";

@interface AWSSESResponseSerializer : AWSXMLResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

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

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSSESResponseSerializer *serializer = [AWSSESResponseSerializer serializerWithResource:resource
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
                *error = [NSError errorWithDomain:AWSSESErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:@{NSLocalizedDescriptionKey :[errorInfo objectForKey:@"Message"]?[errorInfo objectForKey:@"Message"]:[NSNull null]}
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSSESErrorDomain
                                             code:AWSSESErrorUnknown
                                         userInfo:@{NSLocalizedDescriptionKey : [NSString stringWithFormat:@"%@ -- %@",[errorInfo objectForKey:@"Code"],[errorInfo objectForKey:@"Message"]?[errorInfo objectForKey:@"Message"]:[NSNull null]]
                                                    }];
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

@interface AWSSESRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSESRequestRetryHandler

- (AZNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                            response:(NSHTTPURLResponse *)response
                                data:(NSData *)data
                               error:(NSError *)error {
    AZNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                response:response
                                                    data:data
                                                   error:error];
    if(retryType == AZNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSSESErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        switch (error.code) {
            case AWSSESErrorIncompleteSignature:
            case AWSSESErrorInvalidClientTokenId:
            case AWSSESErrorMissingAuthenticationToken:
                retryType = AZNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                break;

            default:
                break;
        }
    }

    return retryType;
}

@end

@interface AWSRequest()

@property (nonatomic, strong) AZNetworkingRequest *internalRequest;

@end

@interface AWSSES()

@property (nonatomic, strong) AZNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSSES

+ (instancetype)defaultSES {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSSES *_defaultSES = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultSES = [[AWSSES alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultSES;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                            service:AWSServiceSES];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_endpoint];

        _configuration.baseURL = _endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSSESRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Host" : _endpoint.hostName};

        _networking = [AZNetworking networking:_configuration];
    }

    return self;
}

- (BFTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AZHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    if (!request) {
        request = [AWSRequest new];
    }

    AZNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[MTLJSONAdapter JSONDictionaryFromModel:request] az_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }
    networkingRequest.HTTPMethod = HTTPMethod;

    AWSQueryStringRequestSerializer *requestSerializer = [AWSQueryStringRequestSerializer serializerWithResource:AWSSESDefinitionFileName actionName:operationName];
    networkingRequest.requestSerializer = requestSerializer;

    networkingRequest.responseSerializer = [AWSSESResponseSerializer serializerWithOutputClass:outputClass
                                                                                      resource:AWSSESDefinitionFileName
                                                                                    actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)deleteIdentity:(AWSSESDeleteIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteIdentity"
                   outputClass:[AWSSESDeleteIdentityResponse class]];
}

- (BFTask *)deleteVerifiedEmailAddress:(AWSSESDeleteVerifiedEmailAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteVerifiedEmailAddress"
                   outputClass:nil];
}

- (BFTask *)getIdentityDkimAttributes:(AWSSESGetIdentityDkimAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityDkimAttributes"
                   outputClass:[AWSSESGetIdentityDkimAttributesResponse class]];
}

- (BFTask *)getIdentityNotificationAttributes:(AWSSESGetIdentityNotificationAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityNotificationAttributes"
                   outputClass:[AWSSESGetIdentityNotificationAttributesResponse class]];
}

- (BFTask *)getIdentityVerificationAttributes:(AWSSESGetIdentityVerificationAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetIdentityVerificationAttributes"
                   outputClass:[AWSSESGetIdentityVerificationAttributesResponse class]];
}

- (BFTask *)getSendQuota:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSendQuota"
                   outputClass:[AWSSESGetSendQuotaResponse class]];
}

- (BFTask *)getSendStatistics:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSendStatistics"
                   outputClass:[AWSSESGetSendStatisticsResponse class]];
}

- (BFTask *)listIdentities:(AWSSESListIdentitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListIdentities"
                   outputClass:[AWSSESListIdentitiesResponse class]];
}

- (BFTask *)listVerifiedEmailAddresses:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListVerifiedEmailAddresses"
                   outputClass:[AWSSESListVerifiedEmailAddressesResponse class]];
}

- (BFTask *)sendEmail:(AWSSESSendEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendEmail"
                   outputClass:[AWSSESSendEmailResponse class]];
}

- (BFTask *)sendRawEmail:(AWSSESSendRawEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendRawEmail"
                   outputClass:[AWSSESSendRawEmailResponse class]];
}

- (BFTask *)setIdentityDkimEnabled:(AWSSESSetIdentityDkimEnabledRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityDkimEnabled"
                   outputClass:[AWSSESSetIdentityDkimEnabledResponse class]];
}

- (BFTask *)setIdentityFeedbackForwardingEnabled:(AWSSESSetIdentityFeedbackForwardingEnabledRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityFeedbackForwardingEnabled"
                   outputClass:[AWSSESSetIdentityFeedbackForwardingEnabledResponse class]];
}

- (BFTask *)setIdentityNotificationTopic:(AWSSESSetIdentityNotificationTopicRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetIdentityNotificationTopic"
                   outputClass:[AWSSESSetIdentityNotificationTopicResponse class]];
}

- (BFTask *)verifyDomainDkim:(AWSSESVerifyDomainDkimRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyDomainDkim"
                   outputClass:[AWSSESVerifyDomainDkimResponse class]];
}

- (BFTask *)verifyDomainIdentity:(AWSSESVerifyDomainIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyDomainIdentity"
                   outputClass:[AWSSESVerifyDomainIdentityResponse class]];
}

- (BFTask *)verifyEmailAddress:(AWSSESVerifyEmailAddressRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyEmailAddress"
                   outputClass:nil];
}

- (BFTask *)verifyEmailIdentity:(AWSSESVerifyEmailIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"VerifyEmailIdentity"
                   outputClass:[AWSSESVerifyEmailIdentityResponse class]];
}

@end