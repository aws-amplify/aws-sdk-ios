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

#import "AWSSTS.h"

#import "AZNetworking.h"
#import "AZCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"

@interface AWSSTSResponseSerializer : AWSXMLResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

@end

@implementation AWSSTSResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ExpiredTokenException" : @(AWSSTSErrorExpiredToken),
                            @"IDPCommunicationErrorException" : @(AWSSTSErrorIDPCommunicationError),
                            @"IDPRejectedClaimException" : @(AWSSTSErrorIDPRejectedClaim),
                            @"InvalidAuthorizationMessageException" : @(AWSSTSErrorInvalidAuthorizationMessage),
                            @"InvalidIdentityTokenException" : @(AWSSTSErrorInvalidIdentityToken),
                            @"MalformedPolicyDocumentException" : @(AWSSTSErrorMalformedPolicyDocument),
                            @"PackedPolicyTooLargeException" : @(AWSSTSErrorPackedPolicyTooLarge),
                            };
}

#pragma mark -

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSSTSResponseSerializer *serializer = [AWSSTSResponseSerializer serializerWithResource:resource actionName:actionName];
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
        if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSSTSErrorDomain
                                             code:AWSSTSErrorUnknown
                                         userInfo:@{NSLocalizedDescriptionKey : [NSString stringWithFormat:@"%@ -- %@",[errorInfo objectForKey:@"Code"], [errorInfo objectForKey:@"Message"]]
                                                    }];
            }
        } else if (self.outputClass) {
            responseObject = [MTLJSONAdapter modelOfClass:self.outputClass
                                       fromJSONDictionary:responseObject
                                                    error:error];
        }
    }

    return responseObject;
}

@end

@interface AWSSTSRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSTSRequestRetryHandler

- (AZNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                            response:(NSHTTPURLResponse *)response
                                data:(NSData *)data
                               error:(NSError *)error {
    AZNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                response:response
                                                    data:data
                                                   error:error];
    if(retryType == AZNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSSTSErrorDomain]) {
        switch (error.code) {
            case AWSSTSErrorIncompleteSignature:
            case AWSSTSErrorInvalidClientTokenId:
            case AWSSTSErrorMissingAuthenticationToken:
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

@interface AWSSTS()

@property (nonatomic, strong) AZNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSSTS

+ (instancetype)defaultSTS {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSSTS *_defaultSTS = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultSTS = [[AWSSTS alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultSTS;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                            service:AWSServiceSTS];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_endpoint];

        _configuration.baseURL = _endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSSTSRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

    AWSQueryStringRequestSerializer *requestSerializer = [AWSQueryStringRequestSerializer new];
    requestSerializer.additionalParameters = @{@"Action" : operationName,
                                               @"Version" : @"2011-06-15"};
    networkingRequest.requestSerializer = requestSerializer;

    networkingRequest.responseSerializer = [AWSSTSResponseSerializer serializerWithOutputClass:outputClass
                                                                                      resource:@"sts-2011-06-15"
                                                                                    actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)assumeRole:(AWSSTSAssumeRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssumeRole"
                   outputClass:[AWSSTSAssumeRoleResponse class]];
}

- (BFTask *)assumeRoleWithSAML:(AWSSTSAssumeRoleWithSAMLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssumeRoleWithSAML"
                   outputClass:[AWSSTSAssumeRoleWithSAMLResponse class]];
}

- (BFTask *)assumeRoleWithWebIdentity:(AWSSTSAssumeRoleWithWebIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssumeRoleWithWebIdentity"
                   outputClass:[AWSSTSAssumeRoleWithWebIdentityResponse class]];
}

- (BFTask *)decodeAuthorizationMessage:(AWSSTSDecodeAuthorizationMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DecodeAuthorizationMessage"
                   outputClass:[AWSSTSDecodeAuthorizationMessageResponse class]];
}

- (BFTask *)getFederationToken:(AWSSTSGetFederationTokenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetFederationToken"
                   outputClass:[AWSSTSGetFederationTokenResponse class]];
}

- (BFTask *)getSessionToken:(AWSSTSGetSessionTokenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSessionToken"
                   outputClass:[AWSSTSGetSessionTokenResponse class]];
}

@end
