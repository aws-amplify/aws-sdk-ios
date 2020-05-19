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

#import "AWSHealthService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSHealthResources.h"

static NSString *const AWSInfoHealth = @"Health";
NSString *const AWSHealthSDKVersion = @"2.13.3";


@interface AWSHealthResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSHealthResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConcurrentModificationException" : @(AWSHealthErrorConcurrentModification),
                            @"InvalidPaginationToken" : @(AWSHealthErrorInvalidPaginationToken),
                            @"UnsupportedLocale" : @(AWSHealthErrorUnsupportedLocale),
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
	                *error = [NSError errorWithDomain:AWSHealthErrorDomain
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
        *error = [NSError errorWithDomain:AWSHealthErrorDomain
                                     code:AWSHealthErrorUnknown
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

@interface AWSHealthRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSHealthRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSHealth()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSHealth

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSHealthSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSHealth versions need to match. Check your SDK installation. AWSCore: %@ AWSHealth: %@", AWSiOSSDKVersion, AWSHealthSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultHealth {
    static AWSHealth *_defaultHealth = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoHealth];
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
        _defaultHealth = [[AWSHealth alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultHealth;
}

+ (void)registerHealthWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSHealth alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)HealthForKey:(NSString *)key {
    @synchronized(self) {
        AWSHealth *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoHealth
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSHealth registerHealthWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeHealthForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultHealth` or `+ HealthForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceHealth
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceHealth];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSHealthRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSHealthResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSHealthResponseSerializer alloc] initWithJSONDefinition:[[AWSHealthResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSHealthDescribeAffectedAccountsForOrganizationResponse *> *)describeAffectedAccountsForOrganization:(AWSHealthDescribeAffectedAccountsForOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeAffectedAccountsForOrganization"
                   outputClass:[AWSHealthDescribeAffectedAccountsForOrganizationResponse class]];
}

- (void)describeAffectedAccountsForOrganization:(AWSHealthDescribeAffectedAccountsForOrganizationRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeAffectedAccountsForOrganizationResponse *response, NSError *error))completionHandler {
    [[self describeAffectedAccountsForOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeAffectedAccountsForOrganizationResponse *> * _Nonnull task) {
        AWSHealthDescribeAffectedAccountsForOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSHealthDescribeAffectedEntitiesResponse *> *)describeAffectedEntities:(AWSHealthDescribeAffectedEntitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeAffectedEntities"
                   outputClass:[AWSHealthDescribeAffectedEntitiesResponse class]];
}

- (void)describeAffectedEntities:(AWSHealthDescribeAffectedEntitiesRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeAffectedEntitiesResponse *response, NSError *error))completionHandler {
    [[self describeAffectedEntities:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeAffectedEntitiesResponse *> * _Nonnull task) {
        AWSHealthDescribeAffectedEntitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSHealthDescribeAffectedEntitiesForOrganizationResponse *> *)describeAffectedEntitiesForOrganization:(AWSHealthDescribeAffectedEntitiesForOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeAffectedEntitiesForOrganization"
                   outputClass:[AWSHealthDescribeAffectedEntitiesForOrganizationResponse class]];
}

- (void)describeAffectedEntitiesForOrganization:(AWSHealthDescribeAffectedEntitiesForOrganizationRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeAffectedEntitiesForOrganizationResponse *response, NSError *error))completionHandler {
    [[self describeAffectedEntitiesForOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeAffectedEntitiesForOrganizationResponse *> * _Nonnull task) {
        AWSHealthDescribeAffectedEntitiesForOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSHealthDescribeEntityAggregatesResponse *> *)describeEntityAggregates:(AWSHealthDescribeEntityAggregatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeEntityAggregates"
                   outputClass:[AWSHealthDescribeEntityAggregatesResponse class]];
}

- (void)describeEntityAggregates:(AWSHealthDescribeEntityAggregatesRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeEntityAggregatesResponse *response, NSError *error))completionHandler {
    [[self describeEntityAggregates:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeEntityAggregatesResponse *> * _Nonnull task) {
        AWSHealthDescribeEntityAggregatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSHealthDescribeEventAggregatesResponse *> *)describeEventAggregates:(AWSHealthDescribeEventAggregatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeEventAggregates"
                   outputClass:[AWSHealthDescribeEventAggregatesResponse class]];
}

- (void)describeEventAggregates:(AWSHealthDescribeEventAggregatesRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeEventAggregatesResponse *response, NSError *error))completionHandler {
    [[self describeEventAggregates:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeEventAggregatesResponse *> * _Nonnull task) {
        AWSHealthDescribeEventAggregatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSHealthDescribeEventDetailsResponse *> *)describeEventDetails:(AWSHealthDescribeEventDetailsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeEventDetails"
                   outputClass:[AWSHealthDescribeEventDetailsResponse class]];
}

- (void)describeEventDetails:(AWSHealthDescribeEventDetailsRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeEventDetailsResponse *response, NSError *error))completionHandler {
    [[self describeEventDetails:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeEventDetailsResponse *> * _Nonnull task) {
        AWSHealthDescribeEventDetailsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSHealthDescribeEventDetailsForOrganizationResponse *> *)describeEventDetailsForOrganization:(AWSHealthDescribeEventDetailsForOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeEventDetailsForOrganization"
                   outputClass:[AWSHealthDescribeEventDetailsForOrganizationResponse class]];
}

- (void)describeEventDetailsForOrganization:(AWSHealthDescribeEventDetailsForOrganizationRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeEventDetailsForOrganizationResponse *response, NSError *error))completionHandler {
    [[self describeEventDetailsForOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeEventDetailsForOrganizationResponse *> * _Nonnull task) {
        AWSHealthDescribeEventDetailsForOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSHealthDescribeEventTypesResponse *> *)describeEventTypes:(AWSHealthDescribeEventTypesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeEventTypes"
                   outputClass:[AWSHealthDescribeEventTypesResponse class]];
}

- (void)describeEventTypes:(AWSHealthDescribeEventTypesRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeEventTypesResponse *response, NSError *error))completionHandler {
    [[self describeEventTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeEventTypesResponse *> * _Nonnull task) {
        AWSHealthDescribeEventTypesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSHealthDescribeEventsResponse *> *)describeEvents:(AWSHealthDescribeEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeEvents"
                   outputClass:[AWSHealthDescribeEventsResponse class]];
}

- (void)describeEvents:(AWSHealthDescribeEventsRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeEventsResponse *response, NSError *error))completionHandler {
    [[self describeEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeEventsResponse *> * _Nonnull task) {
        AWSHealthDescribeEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSHealthDescribeEventsForOrganizationResponse *> *)describeEventsForOrganization:(AWSHealthDescribeEventsForOrganizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeEventsForOrganization"
                   outputClass:[AWSHealthDescribeEventsForOrganizationResponse class]];
}

- (void)describeEventsForOrganization:(AWSHealthDescribeEventsForOrganizationRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeEventsForOrganizationResponse *response, NSError *error))completionHandler {
    [[self describeEventsForOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeEventsForOrganizationResponse *> * _Nonnull task) {
        AWSHealthDescribeEventsForOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSHealthDescribeHealthServiceStatusForOrganizationResponse *> *)describeHealthServiceStatusForOrganization:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DescribeHealthServiceStatusForOrganization"
                   outputClass:[AWSHealthDescribeHealthServiceStatusForOrganizationResponse class]];
}

- (void)describeHealthServiceStatusForOrganization:(AWSRequest *)request
     completionHandler:(void (^)(AWSHealthDescribeHealthServiceStatusForOrganizationResponse *response, NSError *error))completionHandler {
    [[self describeHealthServiceStatusForOrganization:request] continueWithBlock:^id _Nullable(AWSTask<AWSHealthDescribeHealthServiceStatusForOrganizationResponse *> * _Nonnull task) {
        AWSHealthDescribeHealthServiceStatusForOrganizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disableHealthServiceAccessForOrganization:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"DisableHealthServiceAccessForOrganization"
                   outputClass:nil];
}

- (void)disableHealthServiceAccessForOrganization:(AWSRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disableHealthServiceAccessForOrganization:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)enableHealthServiceAccessForOrganization:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHealth_20160804"
                 operationName:@"EnableHealthServiceAccessForOrganization"
                   outputClass:nil];
}

- (void)enableHealthServiceAccessForOrganization:(AWSRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self enableHealthServiceAccessForOrganization:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
