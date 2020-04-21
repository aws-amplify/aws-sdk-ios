//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSroute53domainsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSroute53domainsResources.h"

static NSString *const AWSInforoute53domains = @"route53domains";
NSString *const AWSroute53domainsSDKVersion = @"2.13.2";


@interface AWSroute53domainsResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSroute53domainsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"DomainLimitExceeded" : @(AWSroute53domainsErrorDomainLimitExceeded),
                            @"DuplicateRequest" : @(AWSroute53domainsErrorDuplicateRequest),
                            @"InvalidInput" : @(AWSroute53domainsErrorInvalidInput),
                            @"OperationLimitExceeded" : @(AWSroute53domainsErrorOperationLimitExceeded),
                            @"TLDRulesViolation" : @(AWSroute53domainsErrorTLDRulesViolation),
                            @"UnsupportedTLD" : @(AWSroute53domainsErrorUnsupportedTLD),
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
	                *error = [NSError errorWithDomain:AWSroute53domainsErrorDomain
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
        *error = [NSError errorWithDomain:AWSroute53domainsErrorDomain
                                     code:AWSroute53domainsErrorUnknown
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

@interface AWSroute53domainsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSroute53domainsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSroute53domains()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSroute53domains

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSroute53domainsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSroute53domains versions need to match. Check your SDK installation. AWSCore: %@ AWSroute53domains: %@", AWSiOSSDKVersion, AWSroute53domainsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultroute53domains {
    static AWSroute53domains *_defaultroute53domains = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInforoute53domains];
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
        _defaultroute53domains = [[AWSroute53domains alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultroute53domains;
}

+ (void)registerroute53domainsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSroute53domains alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)route53domainsForKey:(NSString *)key {
    @synchronized(self) {
        AWSroute53domains *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInforoute53domains
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSroute53domains registerroute53domainsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeroute53domainsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultroute53domains` or `+ route53domainsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceroute53domains
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceroute53domains];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSroute53domainsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSroute53domainsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSroute53domainsResponseSerializer alloc] initWithJSONDefinition:[[AWSroute53domainsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse *> *)acceptDomainTransferFromAnotherAwsAccount:(AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"AcceptDomainTransferFromAnotherAwsAccount"
                   outputClass:[AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse class]];
}

- (void)acceptDomainTransferFromAnotherAwsAccount:(AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountRequest *)request
     completionHandler:(void (^)(AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse *response, NSError *error))completionHandler {
    [[self acceptDomainTransferFromAnotherAwsAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse *> * _Nonnull task) {
        AWSroute53domainsAcceptDomainTransferFromAnotherAwsAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse *> *)cancelDomainTransferToAnotherAwsAccount:(AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"CancelDomainTransferToAnotherAwsAccount"
                   outputClass:[AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse class]];
}

- (void)cancelDomainTransferToAnotherAwsAccount:(AWSroute53domainsCancelDomainTransferToAnotherAwsAccountRequest *)request
     completionHandler:(void (^)(AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse *response, NSError *error))completionHandler {
    [[self cancelDomainTransferToAnotherAwsAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse *> * _Nonnull task) {
        AWSroute53domainsCancelDomainTransferToAnotherAwsAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsCheckDomainAvailabilityResponse *> *)checkDomainAvailability:(AWSroute53domainsCheckDomainAvailabilityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"CheckDomainAvailability"
                   outputClass:[AWSroute53domainsCheckDomainAvailabilityResponse class]];
}

- (void)checkDomainAvailability:(AWSroute53domainsCheckDomainAvailabilityRequest *)request
     completionHandler:(void (^)(AWSroute53domainsCheckDomainAvailabilityResponse *response, NSError *error))completionHandler {
    [[self checkDomainAvailability:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsCheckDomainAvailabilityResponse *> * _Nonnull task) {
        AWSroute53domainsCheckDomainAvailabilityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsCheckDomainTransferabilityResponse *> *)checkDomainTransferability:(AWSroute53domainsCheckDomainTransferabilityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"CheckDomainTransferability"
                   outputClass:[AWSroute53domainsCheckDomainTransferabilityResponse class]];
}

- (void)checkDomainTransferability:(AWSroute53domainsCheckDomainTransferabilityRequest *)request
     completionHandler:(void (^)(AWSroute53domainsCheckDomainTransferabilityResponse *response, NSError *error))completionHandler {
    [[self checkDomainTransferability:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsCheckDomainTransferabilityResponse *> * _Nonnull task) {
        AWSroute53domainsCheckDomainTransferabilityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsDeleteTagsForDomainResponse *> *)deleteTagsForDomain:(AWSroute53domainsDeleteTagsForDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"DeleteTagsForDomain"
                   outputClass:[AWSroute53domainsDeleteTagsForDomainResponse class]];
}

- (void)deleteTagsForDomain:(AWSroute53domainsDeleteTagsForDomainRequest *)request
     completionHandler:(void (^)(AWSroute53domainsDeleteTagsForDomainResponse *response, NSError *error))completionHandler {
    [[self deleteTagsForDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsDeleteTagsForDomainResponse *> * _Nonnull task) {
        AWSroute53domainsDeleteTagsForDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsDisableDomainAutoRenewResponse *> *)disableDomainAutoRenew:(AWSroute53domainsDisableDomainAutoRenewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"DisableDomainAutoRenew"
                   outputClass:[AWSroute53domainsDisableDomainAutoRenewResponse class]];
}

- (void)disableDomainAutoRenew:(AWSroute53domainsDisableDomainAutoRenewRequest *)request
     completionHandler:(void (^)(AWSroute53domainsDisableDomainAutoRenewResponse *response, NSError *error))completionHandler {
    [[self disableDomainAutoRenew:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsDisableDomainAutoRenewResponse *> * _Nonnull task) {
        AWSroute53domainsDisableDomainAutoRenewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsDisableDomainTransferLockResponse *> *)disableDomainTransferLock:(AWSroute53domainsDisableDomainTransferLockRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"DisableDomainTransferLock"
                   outputClass:[AWSroute53domainsDisableDomainTransferLockResponse class]];
}

- (void)disableDomainTransferLock:(AWSroute53domainsDisableDomainTransferLockRequest *)request
     completionHandler:(void (^)(AWSroute53domainsDisableDomainTransferLockResponse *response, NSError *error))completionHandler {
    [[self disableDomainTransferLock:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsDisableDomainTransferLockResponse *> * _Nonnull task) {
        AWSroute53domainsDisableDomainTransferLockResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsEnableDomainAutoRenewResponse *> *)enableDomainAutoRenew:(AWSroute53domainsEnableDomainAutoRenewRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"EnableDomainAutoRenew"
                   outputClass:[AWSroute53domainsEnableDomainAutoRenewResponse class]];
}

- (void)enableDomainAutoRenew:(AWSroute53domainsEnableDomainAutoRenewRequest *)request
     completionHandler:(void (^)(AWSroute53domainsEnableDomainAutoRenewResponse *response, NSError *error))completionHandler {
    [[self enableDomainAutoRenew:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsEnableDomainAutoRenewResponse *> * _Nonnull task) {
        AWSroute53domainsEnableDomainAutoRenewResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsEnableDomainTransferLockResponse *> *)enableDomainTransferLock:(AWSroute53domainsEnableDomainTransferLockRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"EnableDomainTransferLock"
                   outputClass:[AWSroute53domainsEnableDomainTransferLockResponse class]];
}

- (void)enableDomainTransferLock:(AWSroute53domainsEnableDomainTransferLockRequest *)request
     completionHandler:(void (^)(AWSroute53domainsEnableDomainTransferLockResponse *response, NSError *error))completionHandler {
    [[self enableDomainTransferLock:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsEnableDomainTransferLockResponse *> * _Nonnull task) {
        AWSroute53domainsEnableDomainTransferLockResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsGetContactReachabilityStatusResponse *> *)getContactReachabilityStatus:(AWSroute53domainsGetContactReachabilityStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"GetContactReachabilityStatus"
                   outputClass:[AWSroute53domainsGetContactReachabilityStatusResponse class]];
}

- (void)getContactReachabilityStatus:(AWSroute53domainsGetContactReachabilityStatusRequest *)request
     completionHandler:(void (^)(AWSroute53domainsGetContactReachabilityStatusResponse *response, NSError *error))completionHandler {
    [[self getContactReachabilityStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsGetContactReachabilityStatusResponse *> * _Nonnull task) {
        AWSroute53domainsGetContactReachabilityStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsGetDomainDetailResponse *> *)getDomainDetail:(AWSroute53domainsGetDomainDetailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"GetDomainDetail"
                   outputClass:[AWSroute53domainsGetDomainDetailResponse class]];
}

- (void)getDomainDetail:(AWSroute53domainsGetDomainDetailRequest *)request
     completionHandler:(void (^)(AWSroute53domainsGetDomainDetailResponse *response, NSError *error))completionHandler {
    [[self getDomainDetail:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsGetDomainDetailResponse *> * _Nonnull task) {
        AWSroute53domainsGetDomainDetailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsGetDomainSuggestionsResponse *> *)getDomainSuggestions:(AWSroute53domainsGetDomainSuggestionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"GetDomainSuggestions"
                   outputClass:[AWSroute53domainsGetDomainSuggestionsResponse class]];
}

- (void)getDomainSuggestions:(AWSroute53domainsGetDomainSuggestionsRequest *)request
     completionHandler:(void (^)(AWSroute53domainsGetDomainSuggestionsResponse *response, NSError *error))completionHandler {
    [[self getDomainSuggestions:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsGetDomainSuggestionsResponse *> * _Nonnull task) {
        AWSroute53domainsGetDomainSuggestionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsGetOperationDetailResponse *> *)getOperationDetail:(AWSroute53domainsGetOperationDetailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"GetOperationDetail"
                   outputClass:[AWSroute53domainsGetOperationDetailResponse class]];
}

- (void)getOperationDetail:(AWSroute53domainsGetOperationDetailRequest *)request
     completionHandler:(void (^)(AWSroute53domainsGetOperationDetailResponse *response, NSError *error))completionHandler {
    [[self getOperationDetail:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsGetOperationDetailResponse *> * _Nonnull task) {
        AWSroute53domainsGetOperationDetailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsListDomainsResponse *> *)listDomains:(AWSroute53domainsListDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"ListDomains"
                   outputClass:[AWSroute53domainsListDomainsResponse class]];
}

- (void)listDomains:(AWSroute53domainsListDomainsRequest *)request
     completionHandler:(void (^)(AWSroute53domainsListDomainsResponse *response, NSError *error))completionHandler {
    [[self listDomains:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsListDomainsResponse *> * _Nonnull task) {
        AWSroute53domainsListDomainsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsListOperationsResponse *> *)listOperations:(AWSroute53domainsListOperationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"ListOperations"
                   outputClass:[AWSroute53domainsListOperationsResponse class]];
}

- (void)listOperations:(AWSroute53domainsListOperationsRequest *)request
     completionHandler:(void (^)(AWSroute53domainsListOperationsResponse *response, NSError *error))completionHandler {
    [[self listOperations:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsListOperationsResponse *> * _Nonnull task) {
        AWSroute53domainsListOperationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsListTagsForDomainResponse *> *)listTagsForDomain:(AWSroute53domainsListTagsForDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"ListTagsForDomain"
                   outputClass:[AWSroute53domainsListTagsForDomainResponse class]];
}

- (void)listTagsForDomain:(AWSroute53domainsListTagsForDomainRequest *)request
     completionHandler:(void (^)(AWSroute53domainsListTagsForDomainResponse *response, NSError *error))completionHandler {
    [[self listTagsForDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsListTagsForDomainResponse *> * _Nonnull task) {
        AWSroute53domainsListTagsForDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsRegisterDomainResponse *> *)registerDomain:(AWSroute53domainsRegisterDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"RegisterDomain"
                   outputClass:[AWSroute53domainsRegisterDomainResponse class]];
}

- (void)registerDomain:(AWSroute53domainsRegisterDomainRequest *)request
     completionHandler:(void (^)(AWSroute53domainsRegisterDomainResponse *response, NSError *error))completionHandler {
    [[self registerDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsRegisterDomainResponse *> * _Nonnull task) {
        AWSroute53domainsRegisterDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse *> *)rejectDomainTransferFromAnotherAwsAccount:(AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"RejectDomainTransferFromAnotherAwsAccount"
                   outputClass:[AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse class]];
}

- (void)rejectDomainTransferFromAnotherAwsAccount:(AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountRequest *)request
     completionHandler:(void (^)(AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse *response, NSError *error))completionHandler {
    [[self rejectDomainTransferFromAnotherAwsAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse *> * _Nonnull task) {
        AWSroute53domainsRejectDomainTransferFromAnotherAwsAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsRenewDomainResponse *> *)renewDomain:(AWSroute53domainsRenewDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"RenewDomain"
                   outputClass:[AWSroute53domainsRenewDomainResponse class]];
}

- (void)renewDomain:(AWSroute53domainsRenewDomainRequest *)request
     completionHandler:(void (^)(AWSroute53domainsRenewDomainResponse *response, NSError *error))completionHandler {
    [[self renewDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsRenewDomainResponse *> * _Nonnull task) {
        AWSroute53domainsRenewDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsResendContactReachabilityEmailResponse *> *)resendContactReachabilityEmail:(AWSroute53domainsResendContactReachabilityEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"ResendContactReachabilityEmail"
                   outputClass:[AWSroute53domainsResendContactReachabilityEmailResponse class]];
}

- (void)resendContactReachabilityEmail:(AWSroute53domainsResendContactReachabilityEmailRequest *)request
     completionHandler:(void (^)(AWSroute53domainsResendContactReachabilityEmailResponse *response, NSError *error))completionHandler {
    [[self resendContactReachabilityEmail:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsResendContactReachabilityEmailResponse *> * _Nonnull task) {
        AWSroute53domainsResendContactReachabilityEmailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsRetrieveDomainAuthCodeResponse *> *)retrieveDomainAuthCode:(AWSroute53domainsRetrieveDomainAuthCodeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"RetrieveDomainAuthCode"
                   outputClass:[AWSroute53domainsRetrieveDomainAuthCodeResponse class]];
}

- (void)retrieveDomainAuthCode:(AWSroute53domainsRetrieveDomainAuthCodeRequest *)request
     completionHandler:(void (^)(AWSroute53domainsRetrieveDomainAuthCodeResponse *response, NSError *error))completionHandler {
    [[self retrieveDomainAuthCode:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsRetrieveDomainAuthCodeResponse *> * _Nonnull task) {
        AWSroute53domainsRetrieveDomainAuthCodeResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsTransferDomainResponse *> *)transferDomain:(AWSroute53domainsTransferDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"TransferDomain"
                   outputClass:[AWSroute53domainsTransferDomainResponse class]];
}

- (void)transferDomain:(AWSroute53domainsTransferDomainRequest *)request
     completionHandler:(void (^)(AWSroute53domainsTransferDomainResponse *response, NSError *error))completionHandler {
    [[self transferDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsTransferDomainResponse *> * _Nonnull task) {
        AWSroute53domainsTransferDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsTransferDomainToAnotherAwsAccountResponse *> *)transferDomainToAnotherAwsAccount:(AWSroute53domainsTransferDomainToAnotherAwsAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"TransferDomainToAnotherAwsAccount"
                   outputClass:[AWSroute53domainsTransferDomainToAnotherAwsAccountResponse class]];
}

- (void)transferDomainToAnotherAwsAccount:(AWSroute53domainsTransferDomainToAnotherAwsAccountRequest *)request
     completionHandler:(void (^)(AWSroute53domainsTransferDomainToAnotherAwsAccountResponse *response, NSError *error))completionHandler {
    [[self transferDomainToAnotherAwsAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsTransferDomainToAnotherAwsAccountResponse *> * _Nonnull task) {
        AWSroute53domainsTransferDomainToAnotherAwsAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsUpdateDomainContactResponse *> *)updateDomainContact:(AWSroute53domainsUpdateDomainContactRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"UpdateDomainContact"
                   outputClass:[AWSroute53domainsUpdateDomainContactResponse class]];
}

- (void)updateDomainContact:(AWSroute53domainsUpdateDomainContactRequest *)request
     completionHandler:(void (^)(AWSroute53domainsUpdateDomainContactResponse *response, NSError *error))completionHandler {
    [[self updateDomainContact:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsUpdateDomainContactResponse *> * _Nonnull task) {
        AWSroute53domainsUpdateDomainContactResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsUpdateDomainContactPrivacyResponse *> *)updateDomainContactPrivacy:(AWSroute53domainsUpdateDomainContactPrivacyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"UpdateDomainContactPrivacy"
                   outputClass:[AWSroute53domainsUpdateDomainContactPrivacyResponse class]];
}

- (void)updateDomainContactPrivacy:(AWSroute53domainsUpdateDomainContactPrivacyRequest *)request
     completionHandler:(void (^)(AWSroute53domainsUpdateDomainContactPrivacyResponse *response, NSError *error))completionHandler {
    [[self updateDomainContactPrivacy:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsUpdateDomainContactPrivacyResponse *> * _Nonnull task) {
        AWSroute53domainsUpdateDomainContactPrivacyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsUpdateDomainNameserversResponse *> *)updateDomainNameservers:(AWSroute53domainsUpdateDomainNameserversRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"UpdateDomainNameservers"
                   outputClass:[AWSroute53domainsUpdateDomainNameserversResponse class]];
}

- (void)updateDomainNameservers:(AWSroute53domainsUpdateDomainNameserversRequest *)request
     completionHandler:(void (^)(AWSroute53domainsUpdateDomainNameserversResponse *response, NSError *error))completionHandler {
    [[self updateDomainNameservers:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsUpdateDomainNameserversResponse *> * _Nonnull task) {
        AWSroute53domainsUpdateDomainNameserversResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsUpdateTagsForDomainResponse *> *)updateTagsForDomain:(AWSroute53domainsUpdateTagsForDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"UpdateTagsForDomain"
                   outputClass:[AWSroute53domainsUpdateTagsForDomainResponse class]];
}

- (void)updateTagsForDomain:(AWSroute53domainsUpdateTagsForDomainRequest *)request
     completionHandler:(void (^)(AWSroute53domainsUpdateTagsForDomainResponse *response, NSError *error))completionHandler {
    [[self updateTagsForDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsUpdateTagsForDomainResponse *> * _Nonnull task) {
        AWSroute53domainsUpdateTagsForDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSroute53domainsViewBillingResponse *> *)viewBilling:(AWSroute53domainsViewBillingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Route53Domains_v20140515"
                 operationName:@"ViewBilling"
                   outputClass:[AWSroute53domainsViewBillingResponse class]];
}

- (void)viewBilling:(AWSroute53domainsViewBillingRequest *)request
     completionHandler:(void (^)(AWSroute53domainsViewBillingResponse *response, NSError *error))completionHandler {
    [[self viewBilling:request] continueWithBlock:^id _Nullable(AWSTask<AWSroute53domainsViewBillingResponse *> * _Nonnull task) {
        AWSroute53domainsViewBillingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
