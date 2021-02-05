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

#import "AWSCognitoIdentityService.h"
#import "AWSCategory.h"
#import "AWSNetworking.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSCognitoIdentityResources.h"

static NSString *const AWSInfoCognitoIdentity = @"CognitoIdentity";


@interface AWSCognitoIdentityResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSCognitoIdentityResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConcurrentModificationException" : @(AWSCognitoIdentityErrorConcurrentModification),
                            @"DeveloperUserAlreadyRegisteredException" : @(AWSCognitoIdentityErrorDeveloperUserAlreadyRegistered),
                            @"ExternalServiceException" : @(AWSCognitoIdentityErrorExternalService),
                            @"InternalErrorException" : @(AWSCognitoIdentityErrorInternalError),
                            @"InvalidIdentityPoolConfigurationException" : @(AWSCognitoIdentityErrorInvalidIdentityPoolConfiguration),
                            @"InvalidParameterException" : @(AWSCognitoIdentityErrorInvalidParameter),
                            @"LimitExceededException" : @(AWSCognitoIdentityErrorLimitExceeded),
                            @"NotAuthorizedException" : @(AWSCognitoIdentityErrorNotAuthorized),
                            @"ResourceConflictException" : @(AWSCognitoIdentityErrorResourceConflict),
                            @"ResourceNotFoundException" : @(AWSCognitoIdentityErrorResourceNotFound),
                            @"TooManyRequestsException" : @(AWSCognitoIdentityErrorTooManyRequests),
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
    	if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
	        if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSCognitoIdentityErrorDomain
	                                             code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        } else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSCognitoIdentityErrorDomain
	                                             code:AWSCognitoIdentityErrorUnknown
	                                         userInfo:responseObject];
	            }
	            return responseObject;
	        }
    	}
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSCognitoIdentityErrorDomain
                                     code:AWSCognitoIdentityErrorUnknown
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

@interface AWSCognitoIdentityRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCognitoIdentityRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSCognitoIdentity()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSCognitoIdentity


#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCognitoIdentity {
    static AWSCognitoIdentity *_defaultCognitoIdentity = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCognitoIdentity];
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
        _defaultCognitoIdentity = [[AWSCognitoIdentity alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCognitoIdentity;
}

+ (void)registerCognitoIdentityWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCognitoIdentity alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CognitoIdentityForKey:(NSString *)key {
    @synchronized(self) {
        AWSCognitoIdentity *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCognitoIdentity
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCognitoIdentity registerCognitoIdentityWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeCognitoIdentityForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCognitoIdentity` or `+ CognitoIdentityForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCognitoIdentity
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceCognitoIdentity];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSCognitoIdentityRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.1"}; 
		
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

		NSMutableDictionary *headers = [NSMutableDictionary new];
        headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
        networkingRequest.headers = headers;
        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSCognitoIdentityResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSCognitoIdentityResponseSerializer alloc] initWithJSONDefinition:[[AWSCognitoIdentityResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSCognitoIdentityIdentityPool *> *)createIdentityPool:(AWSCognitoIdentityCreateIdentityPoolInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"CreateIdentityPool"
                   outputClass:[AWSCognitoIdentityIdentityPool class]];
}

- (void)createIdentityPool:(AWSCognitoIdentityCreateIdentityPoolInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityIdentityPool *response, NSError *error))completionHandler {
    [[self createIdentityPool:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityIdentityPool *> * _Nonnull task) {
        AWSCognitoIdentityIdentityPool *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityDeleteIdentitiesResponse *> *)deleteIdentities:(AWSCognitoIdentityDeleteIdentitiesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"DeleteIdentities"
                   outputClass:[AWSCognitoIdentityDeleteIdentitiesResponse class]];
}

- (void)deleteIdentities:(AWSCognitoIdentityDeleteIdentitiesInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityDeleteIdentitiesResponse *response, NSError *error))completionHandler {
    [[self deleteIdentities:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityDeleteIdentitiesResponse *> * _Nonnull task) {
        AWSCognitoIdentityDeleteIdentitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteIdentityPool:(AWSCognitoIdentityDeleteIdentityPoolInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"DeleteIdentityPool"
                   outputClass:nil];
}

- (void)deleteIdentityPool:(AWSCognitoIdentityDeleteIdentityPoolInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteIdentityPool:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityIdentityDescription *> *)describeIdentity:(AWSCognitoIdentityDescribeIdentityInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"DescribeIdentity"
                   outputClass:[AWSCognitoIdentityIdentityDescription class]];
}

- (void)describeIdentity:(AWSCognitoIdentityDescribeIdentityInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityIdentityDescription *response, NSError *error))completionHandler {
    [[self describeIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityIdentityDescription *> * _Nonnull task) {
        AWSCognitoIdentityIdentityDescription *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityIdentityPool *> *)describeIdentityPool:(AWSCognitoIdentityDescribeIdentityPoolInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"DescribeIdentityPool"
                   outputClass:[AWSCognitoIdentityIdentityPool class]];
}

- (void)describeIdentityPool:(AWSCognitoIdentityDescribeIdentityPoolInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityIdentityPool *response, NSError *error))completionHandler {
    [[self describeIdentityPool:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityIdentityPool *> * _Nonnull task) {
        AWSCognitoIdentityIdentityPool *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityGetCredentialsForIdentityResponse *> *)getCredentialsForIdentity:(AWSCognitoIdentityGetCredentialsForIdentityInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"GetCredentialsForIdentity"
                   outputClass:[AWSCognitoIdentityGetCredentialsForIdentityResponse class]];
}

- (void)getCredentialsForIdentity:(AWSCognitoIdentityGetCredentialsForIdentityInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityGetCredentialsForIdentityResponse *response, NSError *error))completionHandler {
    [[self getCredentialsForIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityGetCredentialsForIdentityResponse *> * _Nonnull task) {
        AWSCognitoIdentityGetCredentialsForIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityGetIdResponse *> *)getId:(AWSCognitoIdentityGetIdInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"GetId"
                   outputClass:[AWSCognitoIdentityGetIdResponse class]];
}

- (void)getId:(AWSCognitoIdentityGetIdInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityGetIdResponse *response, NSError *error))completionHandler {
    [[self getId:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityGetIdResponse *> * _Nonnull task) {
        AWSCognitoIdentityGetIdResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityGetIdentityPoolRolesResponse *> *)getIdentityPoolRoles:(AWSCognitoIdentityGetIdentityPoolRolesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"GetIdentityPoolRoles"
                   outputClass:[AWSCognitoIdentityGetIdentityPoolRolesResponse class]];
}

- (void)getIdentityPoolRoles:(AWSCognitoIdentityGetIdentityPoolRolesInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityGetIdentityPoolRolesResponse *response, NSError *error))completionHandler {
    [[self getIdentityPoolRoles:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityGetIdentityPoolRolesResponse *> * _Nonnull task) {
        AWSCognitoIdentityGetIdentityPoolRolesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityGetOpenIdTokenResponse *> *)getOpenIdToken:(AWSCognitoIdentityGetOpenIdTokenInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"GetOpenIdToken"
                   outputClass:[AWSCognitoIdentityGetOpenIdTokenResponse class]];
}

- (void)getOpenIdToken:(AWSCognitoIdentityGetOpenIdTokenInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityGetOpenIdTokenResponse *response, NSError *error))completionHandler {
    [[self getOpenIdToken:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityGetOpenIdTokenResponse *> * _Nonnull task) {
        AWSCognitoIdentityGetOpenIdTokenResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse *> *)getOpenIdTokenForDeveloperIdentity:(AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"GetOpenIdTokenForDeveloperIdentity"
                   outputClass:[AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse class]];
}

- (void)getOpenIdTokenForDeveloperIdentity:(AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse *response, NSError *error))completionHandler {
    [[self getOpenIdTokenForDeveloperIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse *> * _Nonnull task) {
        AWSCognitoIdentityGetOpenIdTokenForDeveloperIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityGetPrincipalTagAttributeMapResponse *> *)getPrincipalTagAttributeMap:(AWSCognitoIdentityGetPrincipalTagAttributeMapInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"GetPrincipalTagAttributeMap"
                   outputClass:[AWSCognitoIdentityGetPrincipalTagAttributeMapResponse class]];
}

- (void)getPrincipalTagAttributeMap:(AWSCognitoIdentityGetPrincipalTagAttributeMapInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityGetPrincipalTagAttributeMapResponse *response, NSError *error))completionHandler {
    [[self getPrincipalTagAttributeMap:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityGetPrincipalTagAttributeMapResponse *> * _Nonnull task) {
        AWSCognitoIdentityGetPrincipalTagAttributeMapResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityListIdentitiesResponse *> *)listIdentities:(AWSCognitoIdentityListIdentitiesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"ListIdentities"
                   outputClass:[AWSCognitoIdentityListIdentitiesResponse class]];
}

- (void)listIdentities:(AWSCognitoIdentityListIdentitiesInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityListIdentitiesResponse *response, NSError *error))completionHandler {
    [[self listIdentities:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityListIdentitiesResponse *> * _Nonnull task) {
        AWSCognitoIdentityListIdentitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityListIdentityPoolsResponse *> *)listIdentityPools:(AWSCognitoIdentityListIdentityPoolsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"ListIdentityPools"
                   outputClass:[AWSCognitoIdentityListIdentityPoolsResponse class]];
}

- (void)listIdentityPools:(AWSCognitoIdentityListIdentityPoolsInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityListIdentityPoolsResponse *response, NSError *error))completionHandler {
    [[self listIdentityPools:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityListIdentityPoolsResponse *> * _Nonnull task) {
        AWSCognitoIdentityListIdentityPoolsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityListTagsForResourceResponse *> *)listTagsForResource:(AWSCognitoIdentityListTagsForResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSCognitoIdentityListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSCognitoIdentityListTagsForResourceInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityListTagsForResourceResponse *> * _Nonnull task) {
        AWSCognitoIdentityListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityLookupDeveloperIdentityResponse *> *)lookupDeveloperIdentity:(AWSCognitoIdentityLookupDeveloperIdentityInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"LookupDeveloperIdentity"
                   outputClass:[AWSCognitoIdentityLookupDeveloperIdentityResponse class]];
}

- (void)lookupDeveloperIdentity:(AWSCognitoIdentityLookupDeveloperIdentityInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityLookupDeveloperIdentityResponse *response, NSError *error))completionHandler {
    [[self lookupDeveloperIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityLookupDeveloperIdentityResponse *> * _Nonnull task) {
        AWSCognitoIdentityLookupDeveloperIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityMergeDeveloperIdentitiesResponse *> *)mergeDeveloperIdentities:(AWSCognitoIdentityMergeDeveloperIdentitiesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"MergeDeveloperIdentities"
                   outputClass:[AWSCognitoIdentityMergeDeveloperIdentitiesResponse class]];
}

- (void)mergeDeveloperIdentities:(AWSCognitoIdentityMergeDeveloperIdentitiesInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityMergeDeveloperIdentitiesResponse *response, NSError *error))completionHandler {
    [[self mergeDeveloperIdentities:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityMergeDeveloperIdentitiesResponse *> * _Nonnull task) {
        AWSCognitoIdentityMergeDeveloperIdentitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)setIdentityPoolRoles:(AWSCognitoIdentitySetIdentityPoolRolesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"SetIdentityPoolRoles"
                   outputClass:nil];
}

- (void)setIdentityPoolRoles:(AWSCognitoIdentitySetIdentityPoolRolesInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setIdentityPoolRoles:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentitySetPrincipalTagAttributeMapResponse *> *)setPrincipalTagAttributeMap:(AWSCognitoIdentitySetPrincipalTagAttributeMapInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"SetPrincipalTagAttributeMap"
                   outputClass:[AWSCognitoIdentitySetPrincipalTagAttributeMapResponse class]];
}

- (void)setPrincipalTagAttributeMap:(AWSCognitoIdentitySetPrincipalTagAttributeMapInput *)request
     completionHandler:(void (^)(AWSCognitoIdentitySetPrincipalTagAttributeMapResponse *response, NSError *error))completionHandler {
    [[self setPrincipalTagAttributeMap:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentitySetPrincipalTagAttributeMapResponse *> * _Nonnull task) {
        AWSCognitoIdentitySetPrincipalTagAttributeMapResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityTagResourceResponse *> *)tagResource:(AWSCognitoIdentityTagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"TagResource"
                   outputClass:[AWSCognitoIdentityTagResourceResponse class]];
}

- (void)tagResource:(AWSCognitoIdentityTagResourceInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityTagResourceResponse *> * _Nonnull task) {
        AWSCognitoIdentityTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)unlinkDeveloperIdentity:(AWSCognitoIdentityUnlinkDeveloperIdentityInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"UnlinkDeveloperIdentity"
                   outputClass:nil];
}

- (void)unlinkDeveloperIdentity:(AWSCognitoIdentityUnlinkDeveloperIdentityInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self unlinkDeveloperIdentity:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)unlinkIdentity:(AWSCognitoIdentityUnlinkIdentityInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"UnlinkIdentity"
                   outputClass:nil];
}

- (void)unlinkIdentity:(AWSCognitoIdentityUnlinkIdentityInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self unlinkIdentity:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityUntagResourceResponse *> *)untagResource:(AWSCognitoIdentityUntagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"UntagResource"
                   outputClass:[AWSCognitoIdentityUntagResourceResponse class]];
}

- (void)untagResource:(AWSCognitoIdentityUntagResourceInput *)request
     completionHandler:(void (^)(AWSCognitoIdentityUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityUntagResourceResponse *> * _Nonnull task) {
        AWSCognitoIdentityUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoIdentityIdentityPool *> *)updateIdentityPool:(AWSCognitoIdentityIdentityPool *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSCognitoIdentityService"
                 operationName:@"UpdateIdentityPool"
                   outputClass:[AWSCognitoIdentityIdentityPool class]];
}

- (void)updateIdentityPool:(AWSCognitoIdentityIdentityPool *)request
     completionHandler:(void (^)(AWSCognitoIdentityIdentityPool *response, NSError *error))completionHandler {
    [[self updateIdentityPool:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoIdentityIdentityPool *> * _Nonnull task) {
        AWSCognitoIdentityIdentityPool *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
