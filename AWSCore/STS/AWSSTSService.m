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

#import "AWSSTS.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSSTSResources.h"

@interface AWSSTSResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSSTSResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSSTSErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSSTSErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSSTSErrorMissingAuthenticationToken),
                            @"ExpiredTokenException" : @(AWSSTSErrorExpiredToken),
                            @"IDPCommunicationError" : @(AWSSTSErrorIDPCommunicationError),
                            @"IDPRejectedClaim" : @(AWSSTSErrorIDPRejectedClaim),
                            @"InvalidAuthorizationMessageException" : @(AWSSTSErrorInvalidAuthorizationMessage),
                            @"InvalidIdentityToken" : @(AWSSTSErrorInvalidIdentityToken),
                            @"MalformedPolicyDocument" : @(AWSSTSErrorMalformedPolicyDocument),
                            @"PackedPolicyTooLarge" : @(AWSSTSErrorPackedPolicyTooLarge),
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
                *error = [NSError errorWithDomain:AWSSTSErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSSTSErrorDomain
                                             code:AWSSTSErrorUnknown
                                         userInfo:errorInfo];
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSSTSErrorDomain
                                     code:AWSSTSErrorUnknown
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

@interface AWSSTSRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSTSRequestRetryHandler

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
        if ([error.domain isEqualToString:AWSSTSErrorDomain]) {
            switch (error.code) {
                case AWSSTSErrorIncompleteSignature:
                case AWSSTSErrorInvalidClientTokenId:
                case AWSSTSErrorMissingAuthenticationToken:
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

@interface AWSSTS()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSSTS

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSTS {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    static AWSSTS *_defaultSTS = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultSTS = [[AWSSTS alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultSTS;
}

+ (void)registerSTSWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSSTS alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)STSForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeSTSForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSTS` or `+ STSForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSTS
                                                         useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSTSRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];

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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSSTSResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSTSResponseSerializer alloc] initWithJSONDefinition:[[AWSSTSResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSTSAssumeRoleResponse *> *)assumeRole:(AWSSTSAssumeRoleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssumeRole"
                   outputClass:[AWSSTSAssumeRoleResponse class]];
}

- (void)assumeRole:(AWSSTSAssumeRoleRequest *)request
 completionHandler:(void (^)(AWSSTSAssumeRoleResponse *response, NSError *error))completionHandler {
    [[self assumeRole:request] continueWithBlock:^id _Nullable(AWSTask<AWSSTSAssumeRoleResponse *> * _Nonnull task) {
        AWSSTSAssumeRoleResponse *result = task.result;
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

- (AWSTask<AWSSTSAssumeRoleWithSAMLResponse *> *)assumeRoleWithSAML:(AWSSTSAssumeRoleWithSAMLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssumeRoleWithSAML"
                   outputClass:[AWSSTSAssumeRoleWithSAMLResponse class]];
}

- (void)assumeRoleWithSAML:(AWSSTSAssumeRoleWithSAMLRequest *)request
         completionHandler:(void (^)(AWSSTSAssumeRoleWithSAMLResponse *response, NSError *error))completionHandler {
    [[self assumeRoleWithSAML:request] continueWithBlock:^id _Nullable(AWSTask<AWSSTSAssumeRoleWithSAMLResponse *> * _Nonnull task) {
        AWSSTSAssumeRoleWithSAMLResponse *result = task.result;
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

- (AWSTask<AWSSTSAssumeRoleWithWebIdentityResponse *> *)assumeRoleWithWebIdentity:(AWSSTSAssumeRoleWithWebIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AssumeRoleWithWebIdentity"
                   outputClass:[AWSSTSAssumeRoleWithWebIdentityResponse class]];
}

- (void)assumeRoleWithWebIdentity:(AWSSTSAssumeRoleWithWebIdentityRequest *)request
                completionHandler:(void (^)(AWSSTSAssumeRoleWithWebIdentityResponse *response, NSError *error))completionHandler {
    [[self assumeRoleWithWebIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSTSAssumeRoleWithWebIdentityResponse *> * _Nonnull task) {
        AWSSTSAssumeRoleWithWebIdentityResponse *result = task.result;
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

- (AWSTask<AWSSTSDecodeAuthorizationMessageResponse *> *)decodeAuthorizationMessage:(AWSSTSDecodeAuthorizationMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DecodeAuthorizationMessage"
                   outputClass:[AWSSTSDecodeAuthorizationMessageResponse class]];
}

- (void)decodeAuthorizationMessage:(AWSSTSDecodeAuthorizationMessageRequest *)request
                 completionHandler:(void (^)(AWSSTSDecodeAuthorizationMessageResponse *response, NSError *error))completionHandler {
    [[self decodeAuthorizationMessage:request] continueWithBlock:^id _Nullable(AWSTask<AWSSTSDecodeAuthorizationMessageResponse *> * _Nonnull task) {
        AWSSTSDecodeAuthorizationMessageResponse *result = task.result;
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

- (AWSTask<AWSSTSGetFederationTokenResponse *> *)getFederationToken:(AWSSTSGetFederationTokenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetFederationToken"
                   outputClass:[AWSSTSGetFederationTokenResponse class]];
}

- (void)getFederationToken:(AWSSTSGetFederationTokenRequest *)request
         completionHandler:(void (^)(AWSSTSGetFederationTokenResponse *response, NSError *error))completionHandler {
    [[self getFederationToken:request] continueWithBlock:^id _Nullable(AWSTask<AWSSTSGetFederationTokenResponse *> * _Nonnull task) {
        AWSSTSGetFederationTokenResponse *result = task.result;
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

- (AWSTask<AWSSTSGetSessionTokenResponse *> *)getSessionToken:(AWSSTSGetSessionTokenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSessionToken"
                   outputClass:[AWSSTSGetSessionTokenResponse class]];
}

- (void)getSessionToken:(AWSSTSGetSessionTokenRequest *)request
      completionHandler:(void (^)(AWSSTSGetSessionTokenResponse *response, NSError *error))completionHandler {
    [[self getSessionToken:request] continueWithBlock:^id _Nullable(AWSTask<AWSSTSGetSessionTokenResponse *> * _Nonnull task) {
        AWSSTSGetSessionTokenResponse *result = task.result;
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
