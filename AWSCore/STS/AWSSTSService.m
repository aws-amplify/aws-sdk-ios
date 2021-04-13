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

#import "AWSSTSService.h"
#import "AWSCategory.h"
#import "AWSNetworking.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSSTSResources.h"

static NSString *const AWSInfoSTS = @"STS";


@interface AWSSTSResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSSTSResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ExpiredTokenException" : @(AWSSTSErrorExpiredToken),
                            @"IDPCommunicationError" : @(AWSSTSErrorIDPCommunicationError),
                            @"IDPRejectedClaim" : @(AWSSTSErrorIDPRejectedClaim),
                            @"InvalidAuthorizationMessageException" : @(AWSSTSErrorInvalidAuthorizationMessage),
                            @"InvalidIdentityToken" : @(AWSSTSErrorInvalidIdentityToken),
                            @"MalformedPolicyDocument" : @(AWSSTSErrorMalformedPolicyDocument),
                            @"PackedPolicyTooLarge" : @(AWSSTSErrorPackedPolicyTooLarge),
                            @"RegionDisabledException" : @(AWSSTSErrorRegionDisabled),
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
                return responseObject;
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

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSTS


#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSTS {
    static AWSSTS *_defaultSTS = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSTS];
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
        _defaultSTS = [[AWSSTS alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSTS;
}

+ (void)registerSTSWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSTS alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)STSForKey:(NSString *)key {
    @synchronized(self) {
        AWSSTS *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSTS
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSTS registerSTSWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
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

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSTS
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSTS];
        }
       	
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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSTSGetAccessKeyInfoResponse *> *)getAccessKeyInfo:(AWSSTSGetAccessKeyInfoRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetAccessKeyInfo"
                   outputClass:[AWSSTSGetAccessKeyInfoResponse class]];
}

- (void)getAccessKeyInfo:(AWSSTSGetAccessKeyInfoRequest *)request
     completionHandler:(void (^)(AWSSTSGetAccessKeyInfoResponse *response, NSError *error))completionHandler {
    [[self getAccessKeyInfo:request] continueWithBlock:^id _Nullable(AWSTask<AWSSTSGetAccessKeyInfoResponse *> * _Nonnull task) {
        AWSSTSGetAccessKeyInfoResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSTSGetCallerIdentityResponse *> *)getCallerIdentity:(AWSSTSGetCallerIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetCallerIdentity"
                   outputClass:[AWSSTSGetCallerIdentityResponse class]];
}

- (void)getCallerIdentity:(AWSSTSGetCallerIdentityRequest *)request
     completionHandler:(void (^)(AWSSTSGetCallerIdentityResponse *response, NSError *error))completionHandler {
    [[self getCallerIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSTSGetCallerIdentityResponse *> * _Nonnull task) {
        AWSSTSGetCallerIdentityResponse *result = task.result;
        NSError *error = task.error;

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

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
