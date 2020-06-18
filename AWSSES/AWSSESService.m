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

#import "AWSSESService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSESResources.h"

static NSString *const AWSInfoSES = @"SES";
NSString *const AWSSESSDKVersion = @"2.13.4";


@interface AWSSESResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSSESResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccountSuspendedException" : @(AWSSESErrorAccountSuspended),
                            @"AlreadyExistsException" : @(AWSSESErrorAlreadyExists),
                            @"BadRequestException" : @(AWSSESErrorBadRequest),
                            @"ConcurrentModificationException" : @(AWSSESErrorConcurrentModification),
                            @"InvalidNextTokenException" : @(AWSSESErrorInvalidNextToken),
                            @"LimitExceededException" : @(AWSSESErrorLimitExceeded),
                            @"MailFromDomainNotVerifiedException" : @(AWSSESErrorMailFromDomainNotVerified),
                            @"MessageRejected" : @(AWSSESErrorMessageRejected),
                            @"NotFoundException" : @(AWSSESErrorNotFound),
                            @"SendingPausedException" : @(AWSSESErrorSendingPaused),
                            @"TooManyRequestsException" : @(AWSSESErrorTooManyRequests),
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
    	NSString *errorTypeString = [[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"];
        NSString *errorTypeHeader = [[errorTypeString componentsSeparatedByString:@":"] firstObject];

        if ([errorTypeString length] > 0 && errorTypeHeader) {
            if (errorCodeDictionary[errorTypeHeader]) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSSESErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSSESErrorDomain
                                                 code:AWSSESErrorUnknown
                                             userInfo:userInfo];
                }
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

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSES

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSESSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSES versions need to match. Check your SDK installation. AWSCore: %@ AWSSES: %@", AWSiOSSDKVersion, AWSSESSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSES {
    static AWSSES *_defaultSES = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSES];
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
        _defaultSES = [[AWSSES alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSES;
}

+ (void)registerSESWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSES alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SESForKey:(NSString *)key {
    @synchronized(self) {
        AWSSES *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSES
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSES registerSESWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
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

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSES
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSES];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSESRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSSESResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSESResponseSerializer alloc] initWithJSONDefinition:[[AWSSESResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSSESCreateConfigurationSetResponse *> *)createConfigurationSet:(AWSSESCreateConfigurationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/email/configuration-sets"
                  targetPrefix:@""
                 operationName:@"CreateConfigurationSet"
                   outputClass:[AWSSESCreateConfigurationSetResponse class]];
}

- (void)createConfigurationSet:(AWSSESCreateConfigurationSetRequest *)request
     completionHandler:(void (^)(AWSSESCreateConfigurationSetResponse *response, NSError *error))completionHandler {
    [[self createConfigurationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateConfigurationSetResponse *> * _Nonnull task) {
        AWSSESCreateConfigurationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateConfigurationSetEventDestinationResponse *> *)createConfigurationSetEventDestination:(AWSSESCreateConfigurationSetEventDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations"
                  targetPrefix:@""
                 operationName:@"CreateConfigurationSetEventDestination"
                   outputClass:[AWSSESCreateConfigurationSetEventDestinationResponse class]];
}

- (void)createConfigurationSetEventDestination:(AWSSESCreateConfigurationSetEventDestinationRequest *)request
     completionHandler:(void (^)(AWSSESCreateConfigurationSetEventDestinationResponse *response, NSError *error))completionHandler {
    [[self createConfigurationSetEventDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateConfigurationSetEventDestinationResponse *> * _Nonnull task) {
        AWSSESCreateConfigurationSetEventDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateDedicatedIpPoolResponse *> *)createDedicatedIpPool:(AWSSESCreateDedicatedIpPoolRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/email/dedicated-ip-pools"
                  targetPrefix:@""
                 operationName:@"CreateDedicatedIpPool"
                   outputClass:[AWSSESCreateDedicatedIpPoolResponse class]];
}

- (void)createDedicatedIpPool:(AWSSESCreateDedicatedIpPoolRequest *)request
     completionHandler:(void (^)(AWSSESCreateDedicatedIpPoolResponse *response, NSError *error))completionHandler {
    [[self createDedicatedIpPool:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateDedicatedIpPoolResponse *> * _Nonnull task) {
        AWSSESCreateDedicatedIpPoolResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateDeliverabilityTestReportResponse *> *)createDeliverabilityTestReport:(AWSSESCreateDeliverabilityTestReportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/email/deliverability-dashboard/test"
                  targetPrefix:@""
                 operationName:@"CreateDeliverabilityTestReport"
                   outputClass:[AWSSESCreateDeliverabilityTestReportResponse class]];
}

- (void)createDeliverabilityTestReport:(AWSSESCreateDeliverabilityTestReportRequest *)request
     completionHandler:(void (^)(AWSSESCreateDeliverabilityTestReportResponse *response, NSError *error))completionHandler {
    [[self createDeliverabilityTestReport:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateDeliverabilityTestReportResponse *> * _Nonnull task) {
        AWSSESCreateDeliverabilityTestReportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESCreateEmailIdentityResponse *> *)createEmailIdentity:(AWSSESCreateEmailIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/email/identities"
                  targetPrefix:@""
                 operationName:@"CreateEmailIdentity"
                   outputClass:[AWSSESCreateEmailIdentityResponse class]];
}

- (void)createEmailIdentity:(AWSSESCreateEmailIdentityRequest *)request
     completionHandler:(void (^)(AWSSESCreateEmailIdentityResponse *response, NSError *error))completionHandler {
    [[self createEmailIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESCreateEmailIdentityResponse *> * _Nonnull task) {
        AWSSESCreateEmailIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteConfigurationSetResponse *> *)deleteConfigurationSet:(AWSSESDeleteConfigurationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}"
                  targetPrefix:@""
                 operationName:@"DeleteConfigurationSet"
                   outputClass:[AWSSESDeleteConfigurationSetResponse class]];
}

- (void)deleteConfigurationSet:(AWSSESDeleteConfigurationSetRequest *)request
     completionHandler:(void (^)(AWSSESDeleteConfigurationSetResponse *response, NSError *error))completionHandler {
    [[self deleteConfigurationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteConfigurationSetResponse *> * _Nonnull task) {
        AWSSESDeleteConfigurationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteConfigurationSetEventDestinationResponse *> *)deleteConfigurationSetEventDestination:(AWSSESDeleteConfigurationSetEventDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations/{EventDestinationName}"
                  targetPrefix:@""
                 operationName:@"DeleteConfigurationSetEventDestination"
                   outputClass:[AWSSESDeleteConfigurationSetEventDestinationResponse class]];
}

- (void)deleteConfigurationSetEventDestination:(AWSSESDeleteConfigurationSetEventDestinationRequest *)request
     completionHandler:(void (^)(AWSSESDeleteConfigurationSetEventDestinationResponse *response, NSError *error))completionHandler {
    [[self deleteConfigurationSetEventDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteConfigurationSetEventDestinationResponse *> * _Nonnull task) {
        AWSSESDeleteConfigurationSetEventDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteDedicatedIpPoolResponse *> *)deleteDedicatedIpPool:(AWSSESDeleteDedicatedIpPoolRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/email/dedicated-ip-pools/{PoolName}"
                  targetPrefix:@""
                 operationName:@"DeleteDedicatedIpPool"
                   outputClass:[AWSSESDeleteDedicatedIpPoolResponse class]];
}

- (void)deleteDedicatedIpPool:(AWSSESDeleteDedicatedIpPoolRequest *)request
     completionHandler:(void (^)(AWSSESDeleteDedicatedIpPoolResponse *response, NSError *error))completionHandler {
    [[self deleteDedicatedIpPool:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteDedicatedIpPoolResponse *> * _Nonnull task) {
        AWSSESDeleteDedicatedIpPoolResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteEmailIdentityResponse *> *)deleteEmailIdentity:(AWSSESDeleteEmailIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/email/identities/{EmailIdentity}"
                  targetPrefix:@""
                 operationName:@"DeleteEmailIdentity"
                   outputClass:[AWSSESDeleteEmailIdentityResponse class]];
}

- (void)deleteEmailIdentity:(AWSSESDeleteEmailIdentityRequest *)request
     completionHandler:(void (^)(AWSSESDeleteEmailIdentityResponse *response, NSError *error))completionHandler {
    [[self deleteEmailIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteEmailIdentityResponse *> * _Nonnull task) {
        AWSSESDeleteEmailIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESDeleteSuppressedDestinationResponse *> *)deleteSuppressedDestination:(AWSSESDeleteSuppressedDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/email/suppression/addresses/{EmailAddress}"
                  targetPrefix:@""
                 operationName:@"DeleteSuppressedDestination"
                   outputClass:[AWSSESDeleteSuppressedDestinationResponse class]];
}

- (void)deleteSuppressedDestination:(AWSSESDeleteSuppressedDestinationRequest *)request
     completionHandler:(void (^)(AWSSESDeleteSuppressedDestinationResponse *response, NSError *error))completionHandler {
    [[self deleteSuppressedDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESDeleteSuppressedDestinationResponse *> * _Nonnull task) {
        AWSSESDeleteSuppressedDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetAccountResponse *> *)getAccount:(AWSSESGetAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/account"
                  targetPrefix:@""
                 operationName:@"GetAccount"
                   outputClass:[AWSSESGetAccountResponse class]];
}

- (void)getAccount:(AWSSESGetAccountRequest *)request
     completionHandler:(void (^)(AWSSESGetAccountResponse *response, NSError *error))completionHandler {
    [[self getAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetAccountResponse *> * _Nonnull task) {
        AWSSESGetAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetBlacklistReportsResponse *> *)getBlacklistReports:(AWSSESGetBlacklistReportsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/deliverability-dashboard/blacklist-report"
                  targetPrefix:@""
                 operationName:@"GetBlacklistReports"
                   outputClass:[AWSSESGetBlacklistReportsResponse class]];
}

- (void)getBlacklistReports:(AWSSESGetBlacklistReportsRequest *)request
     completionHandler:(void (^)(AWSSESGetBlacklistReportsResponse *response, NSError *error))completionHandler {
    [[self getBlacklistReports:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetBlacklistReportsResponse *> * _Nonnull task) {
        AWSSESGetBlacklistReportsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetConfigurationSetResponse *> *)getConfigurationSet:(AWSSESGetConfigurationSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}"
                  targetPrefix:@""
                 operationName:@"GetConfigurationSet"
                   outputClass:[AWSSESGetConfigurationSetResponse class]];
}

- (void)getConfigurationSet:(AWSSESGetConfigurationSetRequest *)request
     completionHandler:(void (^)(AWSSESGetConfigurationSetResponse *response, NSError *error))completionHandler {
    [[self getConfigurationSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetConfigurationSetResponse *> * _Nonnull task) {
        AWSSESGetConfigurationSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetConfigurationSetEventDestinationsResponse *> *)getConfigurationSetEventDestinations:(AWSSESGetConfigurationSetEventDestinationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations"
                  targetPrefix:@""
                 operationName:@"GetConfigurationSetEventDestinations"
                   outputClass:[AWSSESGetConfigurationSetEventDestinationsResponse class]];
}

- (void)getConfigurationSetEventDestinations:(AWSSESGetConfigurationSetEventDestinationsRequest *)request
     completionHandler:(void (^)(AWSSESGetConfigurationSetEventDestinationsResponse *response, NSError *error))completionHandler {
    [[self getConfigurationSetEventDestinations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetConfigurationSetEventDestinationsResponse *> * _Nonnull task) {
        AWSSESGetConfigurationSetEventDestinationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetDedicatedIpResponse *> *)getDedicatedIp:(AWSSESGetDedicatedIpRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/dedicated-ips/{IP}"
                  targetPrefix:@""
                 operationName:@"GetDedicatedIp"
                   outputClass:[AWSSESGetDedicatedIpResponse class]];
}

- (void)getDedicatedIp:(AWSSESGetDedicatedIpRequest *)request
     completionHandler:(void (^)(AWSSESGetDedicatedIpResponse *response, NSError *error))completionHandler {
    [[self getDedicatedIp:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetDedicatedIpResponse *> * _Nonnull task) {
        AWSSESGetDedicatedIpResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetDedicatedIpsResponse *> *)getDedicatedIps:(AWSSESGetDedicatedIpsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/dedicated-ips"
                  targetPrefix:@""
                 operationName:@"GetDedicatedIps"
                   outputClass:[AWSSESGetDedicatedIpsResponse class]];
}

- (void)getDedicatedIps:(AWSSESGetDedicatedIpsRequest *)request
     completionHandler:(void (^)(AWSSESGetDedicatedIpsResponse *response, NSError *error))completionHandler {
    [[self getDedicatedIps:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetDedicatedIpsResponse *> * _Nonnull task) {
        AWSSESGetDedicatedIpsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetDeliverabilityDashboardOptionsResponse *> *)getDeliverabilityDashboardOptions:(AWSSESGetDeliverabilityDashboardOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/deliverability-dashboard"
                  targetPrefix:@""
                 operationName:@"GetDeliverabilityDashboardOptions"
                   outputClass:[AWSSESGetDeliverabilityDashboardOptionsResponse class]];
}

- (void)getDeliverabilityDashboardOptions:(AWSSESGetDeliverabilityDashboardOptionsRequest *)request
     completionHandler:(void (^)(AWSSESGetDeliverabilityDashboardOptionsResponse *response, NSError *error))completionHandler {
    [[self getDeliverabilityDashboardOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetDeliverabilityDashboardOptionsResponse *> * _Nonnull task) {
        AWSSESGetDeliverabilityDashboardOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetDeliverabilityTestReportResponse *> *)getDeliverabilityTestReport:(AWSSESGetDeliverabilityTestReportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/deliverability-dashboard/test-reports/{ReportId}"
                  targetPrefix:@""
                 operationName:@"GetDeliverabilityTestReport"
                   outputClass:[AWSSESGetDeliverabilityTestReportResponse class]];
}

- (void)getDeliverabilityTestReport:(AWSSESGetDeliverabilityTestReportRequest *)request
     completionHandler:(void (^)(AWSSESGetDeliverabilityTestReportResponse *response, NSError *error))completionHandler {
    [[self getDeliverabilityTestReport:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetDeliverabilityTestReportResponse *> * _Nonnull task) {
        AWSSESGetDeliverabilityTestReportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetDomainDeliverabilityCampaignResponse *> *)getDomainDeliverabilityCampaign:(AWSSESGetDomainDeliverabilityCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/deliverability-dashboard/campaigns/{CampaignId}"
                  targetPrefix:@""
                 operationName:@"GetDomainDeliverabilityCampaign"
                   outputClass:[AWSSESGetDomainDeliverabilityCampaignResponse class]];
}

- (void)getDomainDeliverabilityCampaign:(AWSSESGetDomainDeliverabilityCampaignRequest *)request
     completionHandler:(void (^)(AWSSESGetDomainDeliverabilityCampaignResponse *response, NSError *error))completionHandler {
    [[self getDomainDeliverabilityCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetDomainDeliverabilityCampaignResponse *> * _Nonnull task) {
        AWSSESGetDomainDeliverabilityCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetDomainStatisticsReportResponse *> *)getDomainStatisticsReport:(AWSSESGetDomainStatisticsReportRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/deliverability-dashboard/statistics-report/{Domain}"
                  targetPrefix:@""
                 operationName:@"GetDomainStatisticsReport"
                   outputClass:[AWSSESGetDomainStatisticsReportResponse class]];
}

- (void)getDomainStatisticsReport:(AWSSESGetDomainStatisticsReportRequest *)request
     completionHandler:(void (^)(AWSSESGetDomainStatisticsReportResponse *response, NSError *error))completionHandler {
    [[self getDomainStatisticsReport:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetDomainStatisticsReportResponse *> * _Nonnull task) {
        AWSSESGetDomainStatisticsReportResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetEmailIdentityResponse *> *)getEmailIdentity:(AWSSESGetEmailIdentityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/identities/{EmailIdentity}"
                  targetPrefix:@""
                 operationName:@"GetEmailIdentity"
                   outputClass:[AWSSESGetEmailIdentityResponse class]];
}

- (void)getEmailIdentity:(AWSSESGetEmailIdentityRequest *)request
     completionHandler:(void (^)(AWSSESGetEmailIdentityResponse *response, NSError *error))completionHandler {
    [[self getEmailIdentity:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetEmailIdentityResponse *> * _Nonnull task) {
        AWSSESGetEmailIdentityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESGetSuppressedDestinationResponse *> *)getSuppressedDestination:(AWSSESGetSuppressedDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/suppression/addresses/{EmailAddress}"
                  targetPrefix:@""
                 operationName:@"GetSuppressedDestination"
                   outputClass:[AWSSESGetSuppressedDestinationResponse class]];
}

- (void)getSuppressedDestination:(AWSSESGetSuppressedDestinationRequest *)request
     completionHandler:(void (^)(AWSSESGetSuppressedDestinationResponse *response, NSError *error))completionHandler {
    [[self getSuppressedDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESGetSuppressedDestinationResponse *> * _Nonnull task) {
        AWSSESGetSuppressedDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListConfigurationSetsResponse *> *)listConfigurationSets:(AWSSESListConfigurationSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/configuration-sets"
                  targetPrefix:@""
                 operationName:@"ListConfigurationSets"
                   outputClass:[AWSSESListConfigurationSetsResponse class]];
}

- (void)listConfigurationSets:(AWSSESListConfigurationSetsRequest *)request
     completionHandler:(void (^)(AWSSESListConfigurationSetsResponse *response, NSError *error))completionHandler {
    [[self listConfigurationSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListConfigurationSetsResponse *> * _Nonnull task) {
        AWSSESListConfigurationSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListDedicatedIpPoolsResponse *> *)listDedicatedIpPools:(AWSSESListDedicatedIpPoolsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/dedicated-ip-pools"
                  targetPrefix:@""
                 operationName:@"ListDedicatedIpPools"
                   outputClass:[AWSSESListDedicatedIpPoolsResponse class]];
}

- (void)listDedicatedIpPools:(AWSSESListDedicatedIpPoolsRequest *)request
     completionHandler:(void (^)(AWSSESListDedicatedIpPoolsResponse *response, NSError *error))completionHandler {
    [[self listDedicatedIpPools:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListDedicatedIpPoolsResponse *> * _Nonnull task) {
        AWSSESListDedicatedIpPoolsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListDeliverabilityTestReportsResponse *> *)listDeliverabilityTestReports:(AWSSESListDeliverabilityTestReportsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/deliverability-dashboard/test-reports"
                  targetPrefix:@""
                 operationName:@"ListDeliverabilityTestReports"
                   outputClass:[AWSSESListDeliverabilityTestReportsResponse class]];
}

- (void)listDeliverabilityTestReports:(AWSSESListDeliverabilityTestReportsRequest *)request
     completionHandler:(void (^)(AWSSESListDeliverabilityTestReportsResponse *response, NSError *error))completionHandler {
    [[self listDeliverabilityTestReports:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListDeliverabilityTestReportsResponse *> * _Nonnull task) {
        AWSSESListDeliverabilityTestReportsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListDomainDeliverabilityCampaignsResponse *> *)listDomainDeliverabilityCampaigns:(AWSSESListDomainDeliverabilityCampaignsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/deliverability-dashboard/domains/{SubscribedDomain}/campaigns"
                  targetPrefix:@""
                 operationName:@"ListDomainDeliverabilityCampaigns"
                   outputClass:[AWSSESListDomainDeliverabilityCampaignsResponse class]];
}

- (void)listDomainDeliverabilityCampaigns:(AWSSESListDomainDeliverabilityCampaignsRequest *)request
     completionHandler:(void (^)(AWSSESListDomainDeliverabilityCampaignsResponse *response, NSError *error))completionHandler {
    [[self listDomainDeliverabilityCampaigns:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListDomainDeliverabilityCampaignsResponse *> * _Nonnull task) {
        AWSSESListDomainDeliverabilityCampaignsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListEmailIdentitiesResponse *> *)listEmailIdentities:(AWSSESListEmailIdentitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/identities"
                  targetPrefix:@""
                 operationName:@"ListEmailIdentities"
                   outputClass:[AWSSESListEmailIdentitiesResponse class]];
}

- (void)listEmailIdentities:(AWSSESListEmailIdentitiesRequest *)request
     completionHandler:(void (^)(AWSSESListEmailIdentitiesResponse *response, NSError *error))completionHandler {
    [[self listEmailIdentities:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListEmailIdentitiesResponse *> * _Nonnull task) {
        AWSSESListEmailIdentitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListSuppressedDestinationsResponse *> *)listSuppressedDestinations:(AWSSESListSuppressedDestinationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/suppression/addresses"
                  targetPrefix:@""
                 operationName:@"ListSuppressedDestinations"
                   outputClass:[AWSSESListSuppressedDestinationsResponse class]];
}

- (void)listSuppressedDestinations:(AWSSESListSuppressedDestinationsRequest *)request
     completionHandler:(void (^)(AWSSESListSuppressedDestinationsResponse *response, NSError *error))completionHandler {
    [[self listSuppressedDestinations:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListSuppressedDestinationsResponse *> * _Nonnull task) {
        AWSSESListSuppressedDestinationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESListTagsForResourceResponse *> *)listTagsForResource:(AWSSESListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v2/email/tags"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSSESListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSSESListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSSESListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESListTagsForResourceResponse *> * _Nonnull task) {
        AWSSESListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutAccountDedicatedIpWarmupAttributesResponse *> *)putAccountDedicatedIpWarmupAttributes:(AWSSESPutAccountDedicatedIpWarmupAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/account/dedicated-ips/warmup"
                  targetPrefix:@""
                 operationName:@"PutAccountDedicatedIpWarmupAttributes"
                   outputClass:[AWSSESPutAccountDedicatedIpWarmupAttributesResponse class]];
}

- (void)putAccountDedicatedIpWarmupAttributes:(AWSSESPutAccountDedicatedIpWarmupAttributesRequest *)request
     completionHandler:(void (^)(AWSSESPutAccountDedicatedIpWarmupAttributesResponse *response, NSError *error))completionHandler {
    [[self putAccountDedicatedIpWarmupAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutAccountDedicatedIpWarmupAttributesResponse *> * _Nonnull task) {
        AWSSESPutAccountDedicatedIpWarmupAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutAccountSendingAttributesResponse *> *)putAccountSendingAttributes:(AWSSESPutAccountSendingAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/account/sending"
                  targetPrefix:@""
                 operationName:@"PutAccountSendingAttributes"
                   outputClass:[AWSSESPutAccountSendingAttributesResponse class]];
}

- (void)putAccountSendingAttributes:(AWSSESPutAccountSendingAttributesRequest *)request
     completionHandler:(void (^)(AWSSESPutAccountSendingAttributesResponse *response, NSError *error))completionHandler {
    [[self putAccountSendingAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutAccountSendingAttributesResponse *> * _Nonnull task) {
        AWSSESPutAccountSendingAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutAccountSuppressionAttributesResponse *> *)putAccountSuppressionAttributes:(AWSSESPutAccountSuppressionAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/account/suppression"
                  targetPrefix:@""
                 operationName:@"PutAccountSuppressionAttributes"
                   outputClass:[AWSSESPutAccountSuppressionAttributesResponse class]];
}

- (void)putAccountSuppressionAttributes:(AWSSESPutAccountSuppressionAttributesRequest *)request
     completionHandler:(void (^)(AWSSESPutAccountSuppressionAttributesResponse *response, NSError *error))completionHandler {
    [[self putAccountSuppressionAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutAccountSuppressionAttributesResponse *> * _Nonnull task) {
        AWSSESPutAccountSuppressionAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutConfigurationSetDeliveryOptionsResponse *> *)putConfigurationSetDeliveryOptions:(AWSSESPutConfigurationSetDeliveryOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}/delivery-options"
                  targetPrefix:@""
                 operationName:@"PutConfigurationSetDeliveryOptions"
                   outputClass:[AWSSESPutConfigurationSetDeliveryOptionsResponse class]];
}

- (void)putConfigurationSetDeliveryOptions:(AWSSESPutConfigurationSetDeliveryOptionsRequest *)request
     completionHandler:(void (^)(AWSSESPutConfigurationSetDeliveryOptionsResponse *response, NSError *error))completionHandler {
    [[self putConfigurationSetDeliveryOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutConfigurationSetDeliveryOptionsResponse *> * _Nonnull task) {
        AWSSESPutConfigurationSetDeliveryOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutConfigurationSetReputationOptionsResponse *> *)putConfigurationSetReputationOptions:(AWSSESPutConfigurationSetReputationOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}/reputation-options"
                  targetPrefix:@""
                 operationName:@"PutConfigurationSetReputationOptions"
                   outputClass:[AWSSESPutConfigurationSetReputationOptionsResponse class]];
}

- (void)putConfigurationSetReputationOptions:(AWSSESPutConfigurationSetReputationOptionsRequest *)request
     completionHandler:(void (^)(AWSSESPutConfigurationSetReputationOptionsResponse *response, NSError *error))completionHandler {
    [[self putConfigurationSetReputationOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutConfigurationSetReputationOptionsResponse *> * _Nonnull task) {
        AWSSESPutConfigurationSetReputationOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutConfigurationSetSendingOptionsResponse *> *)putConfigurationSetSendingOptions:(AWSSESPutConfigurationSetSendingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}/sending"
                  targetPrefix:@""
                 operationName:@"PutConfigurationSetSendingOptions"
                   outputClass:[AWSSESPutConfigurationSetSendingOptionsResponse class]];
}

- (void)putConfigurationSetSendingOptions:(AWSSESPutConfigurationSetSendingOptionsRequest *)request
     completionHandler:(void (^)(AWSSESPutConfigurationSetSendingOptionsResponse *response, NSError *error))completionHandler {
    [[self putConfigurationSetSendingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutConfigurationSetSendingOptionsResponse *> * _Nonnull task) {
        AWSSESPutConfigurationSetSendingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutConfigurationSetSuppressionOptionsResponse *> *)putConfigurationSetSuppressionOptions:(AWSSESPutConfigurationSetSuppressionOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}/suppression-options"
                  targetPrefix:@""
                 operationName:@"PutConfigurationSetSuppressionOptions"
                   outputClass:[AWSSESPutConfigurationSetSuppressionOptionsResponse class]];
}

- (void)putConfigurationSetSuppressionOptions:(AWSSESPutConfigurationSetSuppressionOptionsRequest *)request
     completionHandler:(void (^)(AWSSESPutConfigurationSetSuppressionOptionsResponse *response, NSError *error))completionHandler {
    [[self putConfigurationSetSuppressionOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutConfigurationSetSuppressionOptionsResponse *> * _Nonnull task) {
        AWSSESPutConfigurationSetSuppressionOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutConfigurationSetTrackingOptionsResponse *> *)putConfigurationSetTrackingOptions:(AWSSESPutConfigurationSetTrackingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}/tracking-options"
                  targetPrefix:@""
                 operationName:@"PutConfigurationSetTrackingOptions"
                   outputClass:[AWSSESPutConfigurationSetTrackingOptionsResponse class]];
}

- (void)putConfigurationSetTrackingOptions:(AWSSESPutConfigurationSetTrackingOptionsRequest *)request
     completionHandler:(void (^)(AWSSESPutConfigurationSetTrackingOptionsResponse *response, NSError *error))completionHandler {
    [[self putConfigurationSetTrackingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutConfigurationSetTrackingOptionsResponse *> * _Nonnull task) {
        AWSSESPutConfigurationSetTrackingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutDedicatedIpInPoolResponse *> *)putDedicatedIpInPool:(AWSSESPutDedicatedIpInPoolRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/dedicated-ips/{IP}/pool"
                  targetPrefix:@""
                 operationName:@"PutDedicatedIpInPool"
                   outputClass:[AWSSESPutDedicatedIpInPoolResponse class]];
}

- (void)putDedicatedIpInPool:(AWSSESPutDedicatedIpInPoolRequest *)request
     completionHandler:(void (^)(AWSSESPutDedicatedIpInPoolResponse *response, NSError *error))completionHandler {
    [[self putDedicatedIpInPool:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutDedicatedIpInPoolResponse *> * _Nonnull task) {
        AWSSESPutDedicatedIpInPoolResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutDedicatedIpWarmupAttributesResponse *> *)putDedicatedIpWarmupAttributes:(AWSSESPutDedicatedIpWarmupAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/dedicated-ips/{IP}/warmup"
                  targetPrefix:@""
                 operationName:@"PutDedicatedIpWarmupAttributes"
                   outputClass:[AWSSESPutDedicatedIpWarmupAttributesResponse class]];
}

- (void)putDedicatedIpWarmupAttributes:(AWSSESPutDedicatedIpWarmupAttributesRequest *)request
     completionHandler:(void (^)(AWSSESPutDedicatedIpWarmupAttributesResponse *response, NSError *error))completionHandler {
    [[self putDedicatedIpWarmupAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutDedicatedIpWarmupAttributesResponse *> * _Nonnull task) {
        AWSSESPutDedicatedIpWarmupAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutDeliverabilityDashboardOptionResponse *> *)putDeliverabilityDashboardOption:(AWSSESPutDeliverabilityDashboardOptionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/deliverability-dashboard"
                  targetPrefix:@""
                 operationName:@"PutDeliverabilityDashboardOption"
                   outputClass:[AWSSESPutDeliverabilityDashboardOptionResponse class]];
}

- (void)putDeliverabilityDashboardOption:(AWSSESPutDeliverabilityDashboardOptionRequest *)request
     completionHandler:(void (^)(AWSSESPutDeliverabilityDashboardOptionResponse *response, NSError *error))completionHandler {
    [[self putDeliverabilityDashboardOption:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutDeliverabilityDashboardOptionResponse *> * _Nonnull task) {
        AWSSESPutDeliverabilityDashboardOptionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutEmailIdentityDkimAttributesResponse *> *)putEmailIdentityDkimAttributes:(AWSSESPutEmailIdentityDkimAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/identities/{EmailIdentity}/dkim"
                  targetPrefix:@""
                 operationName:@"PutEmailIdentityDkimAttributes"
                   outputClass:[AWSSESPutEmailIdentityDkimAttributesResponse class]];
}

- (void)putEmailIdentityDkimAttributes:(AWSSESPutEmailIdentityDkimAttributesRequest *)request
     completionHandler:(void (^)(AWSSESPutEmailIdentityDkimAttributesResponse *response, NSError *error))completionHandler {
    [[self putEmailIdentityDkimAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutEmailIdentityDkimAttributesResponse *> * _Nonnull task) {
        AWSSESPutEmailIdentityDkimAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutEmailIdentityDkimSigningAttributesResponse *> *)putEmailIdentityDkimSigningAttributes:(AWSSESPutEmailIdentityDkimSigningAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/email/identities/{EmailIdentity}/dkim/signing"
                  targetPrefix:@""
                 operationName:@"PutEmailIdentityDkimSigningAttributes"
                   outputClass:[AWSSESPutEmailIdentityDkimSigningAttributesResponse class]];
}

- (void)putEmailIdentityDkimSigningAttributes:(AWSSESPutEmailIdentityDkimSigningAttributesRequest *)request
     completionHandler:(void (^)(AWSSESPutEmailIdentityDkimSigningAttributesResponse *response, NSError *error))completionHandler {
    [[self putEmailIdentityDkimSigningAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutEmailIdentityDkimSigningAttributesResponse *> * _Nonnull task) {
        AWSSESPutEmailIdentityDkimSigningAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutEmailIdentityFeedbackAttributesResponse *> *)putEmailIdentityFeedbackAttributes:(AWSSESPutEmailIdentityFeedbackAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/identities/{EmailIdentity}/feedback"
                  targetPrefix:@""
                 operationName:@"PutEmailIdentityFeedbackAttributes"
                   outputClass:[AWSSESPutEmailIdentityFeedbackAttributesResponse class]];
}

- (void)putEmailIdentityFeedbackAttributes:(AWSSESPutEmailIdentityFeedbackAttributesRequest *)request
     completionHandler:(void (^)(AWSSESPutEmailIdentityFeedbackAttributesResponse *response, NSError *error))completionHandler {
    [[self putEmailIdentityFeedbackAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutEmailIdentityFeedbackAttributesResponse *> * _Nonnull task) {
        AWSSESPutEmailIdentityFeedbackAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutEmailIdentityMailFromAttributesResponse *> *)putEmailIdentityMailFromAttributes:(AWSSESPutEmailIdentityMailFromAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/identities/{EmailIdentity}/mail-from"
                  targetPrefix:@""
                 operationName:@"PutEmailIdentityMailFromAttributes"
                   outputClass:[AWSSESPutEmailIdentityMailFromAttributesResponse class]];
}

- (void)putEmailIdentityMailFromAttributes:(AWSSESPutEmailIdentityMailFromAttributesRequest *)request
     completionHandler:(void (^)(AWSSESPutEmailIdentityMailFromAttributesResponse *response, NSError *error))completionHandler {
    [[self putEmailIdentityMailFromAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutEmailIdentityMailFromAttributesResponse *> * _Nonnull task) {
        AWSSESPutEmailIdentityMailFromAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESPutSuppressedDestinationResponse *> *)putSuppressedDestination:(AWSSESPutSuppressedDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/suppression/addresses"
                  targetPrefix:@""
                 operationName:@"PutSuppressedDestination"
                   outputClass:[AWSSESPutSuppressedDestinationResponse class]];
}

- (void)putSuppressedDestination:(AWSSESPutSuppressedDestinationRequest *)request
     completionHandler:(void (^)(AWSSESPutSuppressedDestinationResponse *response, NSError *error))completionHandler {
    [[self putSuppressedDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESPutSuppressedDestinationResponse *> * _Nonnull task) {
        AWSSESPutSuppressedDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESSendEmailResponse *> *)sendEmail:(AWSSESSendEmailRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/email/outbound-emails"
                  targetPrefix:@""
                 operationName:@"SendEmail"
                   outputClass:[AWSSESSendEmailResponse class]];
}

- (void)sendEmail:(AWSSESSendEmailRequest *)request
     completionHandler:(void (^)(AWSSESSendEmailResponse *response, NSError *error))completionHandler {
    [[self sendEmail:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESSendEmailResponse *> * _Nonnull task) {
        AWSSESSendEmailResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESTagResourceResponse *> *)tagResource:(AWSSESTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v2/email/tags"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSSESTagResourceResponse class]];
}

- (void)tagResource:(AWSSESTagResourceRequest *)request
     completionHandler:(void (^)(AWSSESTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESTagResourceResponse *> * _Nonnull task) {
        AWSSESTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESUntagResourceResponse *> *)untagResource:(AWSSESUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v2/email/tags"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSSESUntagResourceResponse class]];
}

- (void)untagResource:(AWSSESUntagResourceRequest *)request
     completionHandler:(void (^)(AWSSESUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESUntagResourceResponse *> * _Nonnull task) {
        AWSSESUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSESUpdateConfigurationSetEventDestinationResponse *> *)updateConfigurationSetEventDestination:(AWSSESUpdateConfigurationSetEventDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v2/email/configuration-sets/{ConfigurationSetName}/event-destinations/{EventDestinationName}"
                  targetPrefix:@""
                 operationName:@"UpdateConfigurationSetEventDestination"
                   outputClass:[AWSSESUpdateConfigurationSetEventDestinationResponse class]];
}

- (void)updateConfigurationSetEventDestination:(AWSSESUpdateConfigurationSetEventDestinationRequest *)request
     completionHandler:(void (^)(AWSSESUpdateConfigurationSetEventDestinationResponse *response, NSError *error))completionHandler {
    [[self updateConfigurationSetEventDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSSESUpdateConfigurationSetEventDestinationResponse *> * _Nonnull task) {
        AWSSESUpdateConfigurationSetEventDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
