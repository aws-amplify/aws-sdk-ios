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

#import "AWSSNSService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSNSResources.h"

static NSString *const AWSInfoSNS = @"SNS";
static NSString *const AWSSNSSDKVersion = @"2.4.10";


@interface AWSSNSResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSSNSResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AuthorizationError" : @(AWSSNSErrorAuthorizationError),
                            @"EndpointDisabled" : @(AWSSNSErrorEndpointDisabled),
                            @"InternalError" : @(AWSSNSErrorInternalError),
                            @"InvalidParameter" : @(AWSSNSErrorInvalidParameter),
                            @"ParameterValueInvalid" : @(AWSSNSErrorInvalidParameterValue),
                            @"NotFound" : @(AWSSNSErrorNotFound),
                            @"PlatformApplicationDisabled" : @(AWSSNSErrorPlatformApplicationDisabled),
                            @"SubscriptionLimitExceeded" : @(AWSSNSErrorSubscriptionLimitExceeded),
                            @"Throttled" : @(AWSSNSErrorThrottled),
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
    	if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
	        if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
	            if (error) {
	                *error = [NSError errorWithDomain:AWSSNSErrorDomain
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
        *error = [NSError errorWithDomain:AWSSNSErrorDomain
                                     code:AWSSNSErrorUnknown
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

@interface AWSSNSRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSNSRequestRetryHandler

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

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSNS

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSNSSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSNS versions need to match. Check your SDK installation. AWSCore: %@ AWSSNS: %@", AWSiOSSDKVersion, AWSSNSSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSNS {
    static AWSSNS *_defaultSNS = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSNS];
        if (serviceInfo) {
            serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                               credentialsProvider:serviceInfo.cognitoCredentialsProvider];
        }

        if (!serviceConfiguration) {
            serviceConfiguration = [AWSServiceManager defaultServiceManager].defaultServiceConfiguration;
        }

        if (!serviceConfiguration) {
            @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
                                         userInfo:nil];
        }
        _defaultSNS = [[AWSSNS alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSNS;
}

+ (void)registerSNSWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSNS alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SNSForKey:(NSString *)key {
    @synchronized(self) {
        AWSSNS *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSNS
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSNS registerSNSWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
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

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSNS
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSNS];
        }
       	
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

- (void)addPermission:(AWSSNSAddPermissionInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addPermission:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSSNSCheckIfPhoneNumberIsOptedOutResponse *> *)checkIfPhoneNumberIsOptedOut:(AWSSNSCheckIfPhoneNumberIsOptedOutInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CheckIfPhoneNumberIsOptedOut"
                   outputClass:[AWSSNSCheckIfPhoneNumberIsOptedOutResponse class]];
}

- (void)checkIfPhoneNumberIsOptedOut:(AWSSNSCheckIfPhoneNumberIsOptedOutInput *)request
     completionHandler:(void (^)(AWSSNSCheckIfPhoneNumberIsOptedOutResponse *response, NSError *error))completionHandler {
    [[self checkIfPhoneNumberIsOptedOut:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSCheckIfPhoneNumberIsOptedOutResponse *> * _Nonnull task) {
        AWSSNSCheckIfPhoneNumberIsOptedOutResponse *result = task.result;
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

- (AWSTask<AWSSNSConfirmSubscriptionResponse *> *)confirmSubscription:(AWSSNSConfirmSubscriptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ConfirmSubscription"
                   outputClass:[AWSSNSConfirmSubscriptionResponse class]];
}

- (void)confirmSubscription:(AWSSNSConfirmSubscriptionInput *)request
     completionHandler:(void (^)(AWSSNSConfirmSubscriptionResponse *response, NSError *error))completionHandler {
    [[self confirmSubscription:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSConfirmSubscriptionResponse *> * _Nonnull task) {
        AWSSNSConfirmSubscriptionResponse *result = task.result;
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

- (AWSTask<AWSSNSCreatePlatformApplicationResponse *> *)createPlatformApplication:(AWSSNSCreatePlatformApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePlatformApplication"
                   outputClass:[AWSSNSCreatePlatformApplicationResponse class]];
}

- (void)createPlatformApplication:(AWSSNSCreatePlatformApplicationInput *)request
     completionHandler:(void (^)(AWSSNSCreatePlatformApplicationResponse *response, NSError *error))completionHandler {
    [[self createPlatformApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSCreatePlatformApplicationResponse *> * _Nonnull task) {
        AWSSNSCreatePlatformApplicationResponse *result = task.result;
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

- (AWSTask<AWSSNSCreateEndpointResponse *> *)createPlatformEndpoint:(AWSSNSCreatePlatformEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreatePlatformEndpoint"
                   outputClass:[AWSSNSCreateEndpointResponse class]];
}

- (void)createPlatformEndpoint:(AWSSNSCreatePlatformEndpointInput *)request
     completionHandler:(void (^)(AWSSNSCreateEndpointResponse *response, NSError *error))completionHandler {
    [[self createPlatformEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSCreateEndpointResponse *> * _Nonnull task) {
        AWSSNSCreateEndpointResponse *result = task.result;
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

- (AWSTask<AWSSNSCreateTopicResponse *> *)createTopic:(AWSSNSCreateTopicInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateTopic"
                   outputClass:[AWSSNSCreateTopicResponse class]];
}

- (void)createTopic:(AWSSNSCreateTopicInput *)request
     completionHandler:(void (^)(AWSSNSCreateTopicResponse *response, NSError *error))completionHandler {
    [[self createTopic:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSCreateTopicResponse *> * _Nonnull task) {
        AWSSNSCreateTopicResponse *result = task.result;
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

- (AWSTask *)deleteEndpoint:(AWSSNSDeleteEndpointInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteEndpoint"
                   outputClass:nil];
}

- (void)deleteEndpoint:(AWSSNSDeleteEndpointInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteEndpoint:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)deletePlatformApplication:(AWSSNSDeletePlatformApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePlatformApplication"
                   outputClass:nil];
}

- (void)deletePlatformApplication:(AWSSNSDeletePlatformApplicationInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePlatformApplication:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)deleteTopic:(AWSSNSDeleteTopicInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTopic"
                   outputClass:nil];
}

- (void)deleteTopic:(AWSSNSDeleteTopicInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteTopic:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSSNSGetEndpointAttributesResponse *> *)getEndpointAttributes:(AWSSNSGetEndpointAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetEndpointAttributes"
                   outputClass:[AWSSNSGetEndpointAttributesResponse class]];
}

- (void)getEndpointAttributes:(AWSSNSGetEndpointAttributesInput *)request
     completionHandler:(void (^)(AWSSNSGetEndpointAttributesResponse *response, NSError *error))completionHandler {
    [[self getEndpointAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSGetEndpointAttributesResponse *> * _Nonnull task) {
        AWSSNSGetEndpointAttributesResponse *result = task.result;
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

- (AWSTask<AWSSNSGetPlatformApplicationAttributesResponse *> *)getPlatformApplicationAttributes:(AWSSNSGetPlatformApplicationAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetPlatformApplicationAttributes"
                   outputClass:[AWSSNSGetPlatformApplicationAttributesResponse class]];
}

- (void)getPlatformApplicationAttributes:(AWSSNSGetPlatformApplicationAttributesInput *)request
     completionHandler:(void (^)(AWSSNSGetPlatformApplicationAttributesResponse *response, NSError *error))completionHandler {
    [[self getPlatformApplicationAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSGetPlatformApplicationAttributesResponse *> * _Nonnull task) {
        AWSSNSGetPlatformApplicationAttributesResponse *result = task.result;
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

- (AWSTask<AWSSNSGetSMSAttributesResponse *> *)getSMSAttributes:(AWSSNSGetSMSAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSMSAttributes"
                   outputClass:[AWSSNSGetSMSAttributesResponse class]];
}

- (void)getSMSAttributes:(AWSSNSGetSMSAttributesInput *)request
     completionHandler:(void (^)(AWSSNSGetSMSAttributesResponse *response, NSError *error))completionHandler {
    [[self getSMSAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSGetSMSAttributesResponse *> * _Nonnull task) {
        AWSSNSGetSMSAttributesResponse *result = task.result;
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

- (AWSTask<AWSSNSGetSubscriptionAttributesResponse *> *)getSubscriptionAttributes:(AWSSNSGetSubscriptionAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetSubscriptionAttributes"
                   outputClass:[AWSSNSGetSubscriptionAttributesResponse class]];
}

- (void)getSubscriptionAttributes:(AWSSNSGetSubscriptionAttributesInput *)request
     completionHandler:(void (^)(AWSSNSGetSubscriptionAttributesResponse *response, NSError *error))completionHandler {
    [[self getSubscriptionAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSGetSubscriptionAttributesResponse *> * _Nonnull task) {
        AWSSNSGetSubscriptionAttributesResponse *result = task.result;
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

- (AWSTask<AWSSNSGetTopicAttributesResponse *> *)getTopicAttributes:(AWSSNSGetTopicAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetTopicAttributes"
                   outputClass:[AWSSNSGetTopicAttributesResponse class]];
}

- (void)getTopicAttributes:(AWSSNSGetTopicAttributesInput *)request
     completionHandler:(void (^)(AWSSNSGetTopicAttributesResponse *response, NSError *error))completionHandler {
    [[self getTopicAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSGetTopicAttributesResponse *> * _Nonnull task) {
        AWSSNSGetTopicAttributesResponse *result = task.result;
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

- (AWSTask<AWSSNSListEndpointsByPlatformApplicationResponse *> *)listEndpointsByPlatformApplication:(AWSSNSListEndpointsByPlatformApplicationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListEndpointsByPlatformApplication"
                   outputClass:[AWSSNSListEndpointsByPlatformApplicationResponse class]];
}

- (void)listEndpointsByPlatformApplication:(AWSSNSListEndpointsByPlatformApplicationInput *)request
     completionHandler:(void (^)(AWSSNSListEndpointsByPlatformApplicationResponse *response, NSError *error))completionHandler {
    [[self listEndpointsByPlatformApplication:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSListEndpointsByPlatformApplicationResponse *> * _Nonnull task) {
        AWSSNSListEndpointsByPlatformApplicationResponse *result = task.result;
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

- (AWSTask<AWSSNSListPhoneNumbersOptedOutResponse *> *)listPhoneNumbersOptedOut:(AWSSNSListPhoneNumbersOptedOutInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListPhoneNumbersOptedOut"
                   outputClass:[AWSSNSListPhoneNumbersOptedOutResponse class]];
}

- (void)listPhoneNumbersOptedOut:(AWSSNSListPhoneNumbersOptedOutInput *)request
     completionHandler:(void (^)(AWSSNSListPhoneNumbersOptedOutResponse *response, NSError *error))completionHandler {
    [[self listPhoneNumbersOptedOut:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSListPhoneNumbersOptedOutResponse *> * _Nonnull task) {
        AWSSNSListPhoneNumbersOptedOutResponse *result = task.result;
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

- (AWSTask<AWSSNSListPlatformApplicationsResponse *> *)listPlatformApplications:(AWSSNSListPlatformApplicationsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListPlatformApplications"
                   outputClass:[AWSSNSListPlatformApplicationsResponse class]];
}

- (void)listPlatformApplications:(AWSSNSListPlatformApplicationsInput *)request
     completionHandler:(void (^)(AWSSNSListPlatformApplicationsResponse *response, NSError *error))completionHandler {
    [[self listPlatformApplications:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSListPlatformApplicationsResponse *> * _Nonnull task) {
        AWSSNSListPlatformApplicationsResponse *result = task.result;
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

- (AWSTask<AWSSNSListSubscriptionsResponse *> *)listSubscriptions:(AWSSNSListSubscriptionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListSubscriptions"
                   outputClass:[AWSSNSListSubscriptionsResponse class]];
}

- (void)listSubscriptions:(AWSSNSListSubscriptionsInput *)request
     completionHandler:(void (^)(AWSSNSListSubscriptionsResponse *response, NSError *error))completionHandler {
    [[self listSubscriptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSListSubscriptionsResponse *> * _Nonnull task) {
        AWSSNSListSubscriptionsResponse *result = task.result;
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

- (AWSTask<AWSSNSListSubscriptionsByTopicResponse *> *)listSubscriptionsByTopic:(AWSSNSListSubscriptionsByTopicInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListSubscriptionsByTopic"
                   outputClass:[AWSSNSListSubscriptionsByTopicResponse class]];
}

- (void)listSubscriptionsByTopic:(AWSSNSListSubscriptionsByTopicInput *)request
     completionHandler:(void (^)(AWSSNSListSubscriptionsByTopicResponse *response, NSError *error))completionHandler {
    [[self listSubscriptionsByTopic:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSListSubscriptionsByTopicResponse *> * _Nonnull task) {
        AWSSNSListSubscriptionsByTopicResponse *result = task.result;
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

- (AWSTask<AWSSNSListTopicsResponse *> *)listTopics:(AWSSNSListTopicsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListTopics"
                   outputClass:[AWSSNSListTopicsResponse class]];
}

- (void)listTopics:(AWSSNSListTopicsInput *)request
     completionHandler:(void (^)(AWSSNSListTopicsResponse *response, NSError *error))completionHandler {
    [[self listTopics:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSListTopicsResponse *> * _Nonnull task) {
        AWSSNSListTopicsResponse *result = task.result;
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

- (AWSTask<AWSSNSOptInPhoneNumberResponse *> *)optInPhoneNumber:(AWSSNSOptInPhoneNumberInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"OptInPhoneNumber"
                   outputClass:[AWSSNSOptInPhoneNumberResponse class]];
}

- (void)optInPhoneNumber:(AWSSNSOptInPhoneNumberInput *)request
     completionHandler:(void (^)(AWSSNSOptInPhoneNumberResponse *response, NSError *error))completionHandler {
    [[self optInPhoneNumber:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSOptInPhoneNumberResponse *> * _Nonnull task) {
        AWSSNSOptInPhoneNumberResponse *result = task.result;
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

- (AWSTask<AWSSNSPublishResponse *> *)publish:(AWSSNSPublishInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Publish"
                   outputClass:[AWSSNSPublishResponse class]];
}

- (void)publish:(AWSSNSPublishInput *)request
     completionHandler:(void (^)(AWSSNSPublishResponse *response, NSError *error))completionHandler {
    [[self publish:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSPublishResponse *> * _Nonnull task) {
        AWSSNSPublishResponse *result = task.result;
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

- (AWSTask *)removePermission:(AWSSNSRemovePermissionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemovePermission"
                   outputClass:nil];
}

- (void)removePermission:(AWSSNSRemovePermissionInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removePermission:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)setEndpointAttributes:(AWSSNSSetEndpointAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetEndpointAttributes"
                   outputClass:nil];
}

- (void)setEndpointAttributes:(AWSSNSSetEndpointAttributesInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setEndpointAttributes:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)setPlatformApplicationAttributes:(AWSSNSSetPlatformApplicationAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetPlatformApplicationAttributes"
                   outputClass:nil];
}

- (void)setPlatformApplicationAttributes:(AWSSNSSetPlatformApplicationAttributesInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setPlatformApplicationAttributes:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSSNSSetSMSAttributesResponse *> *)setSMSAttributes:(AWSSNSSetSMSAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetSMSAttributes"
                   outputClass:[AWSSNSSetSMSAttributesResponse class]];
}

- (void)setSMSAttributes:(AWSSNSSetSMSAttributesInput *)request
     completionHandler:(void (^)(AWSSNSSetSMSAttributesResponse *response, NSError *error))completionHandler {
    [[self setSMSAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSSetSMSAttributesResponse *> * _Nonnull task) {
        AWSSNSSetSMSAttributesResponse *result = task.result;
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

- (AWSTask *)setSubscriptionAttributes:(AWSSNSSetSubscriptionAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetSubscriptionAttributes"
                   outputClass:nil];
}

- (void)setSubscriptionAttributes:(AWSSNSSetSubscriptionAttributesInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setSubscriptionAttributes:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask *)setTopicAttributes:(AWSSNSSetTopicAttributesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetTopicAttributes"
                   outputClass:nil];
}

- (void)setTopicAttributes:(AWSSNSSetTopicAttributesInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setTopicAttributes:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

- (AWSTask<AWSSNSSubscribeResponse *> *)subscribe:(AWSSNSSubscribeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Subscribe"
                   outputClass:[AWSSNSSubscribeResponse class]];
}

- (void)subscribe:(AWSSNSSubscribeInput *)request
     completionHandler:(void (^)(AWSSNSSubscribeResponse *response, NSError *error))completionHandler {
    [[self subscribe:request] continueWithBlock:^id _Nullable(AWSTask<AWSSNSSubscribeResponse *> * _Nonnull task) {
        AWSSNSSubscribeResponse *result = task.result;
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

- (AWSTask *)unsubscribe:(AWSSNSUnsubscribeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Unsubscribe"
                   outputClass:nil];
}

- (void)unsubscribe:(AWSSNSUnsubscribeInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self unsubscribe:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
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

#pragma mark -

@end
