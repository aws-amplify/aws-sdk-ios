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

#import "AWSwafService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSwafResources.h"

static NSString *const AWSInfowaf = @"waf";
NSString *const AWSwafSDKVersion = @"2.13.2";


@interface AWSwafResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSwafResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"WAFBadRequestException" : @(AWSwafErrorWAFBadRequest),
                            @"WAFDisallowedNameException" : @(AWSwafErrorWAFDisallowedName),
                            @"WAFEntityMigrationException" : @(AWSwafErrorWAFEntityMigration),
                            @"WAFInternalErrorException" : @(AWSwafErrorWAFInternalError),
                            @"WAFInvalidAccountException" : @(AWSwafErrorWAFInvalidAccount),
                            @"WAFInvalidOperationException" : @(AWSwafErrorWAFInvalidOperation),
                            @"WAFInvalidParameterException" : @(AWSwafErrorWAFInvalidParameter),
                            @"WAFInvalidPermissionPolicyException" : @(AWSwafErrorWAFInvalidPermissionPolicy),
                            @"WAFInvalidRegexPatternException" : @(AWSwafErrorWAFInvalidRegexPattern),
                            @"WAFLimitsExceededException" : @(AWSwafErrorWAFLimitsExceeded),
                            @"WAFNonEmptyEntityException" : @(AWSwafErrorWAFNonEmptyEntity),
                            @"WAFNonexistentContainerException" : @(AWSwafErrorWAFNonexistentContainer),
                            @"WAFNonexistentItemException" : @(AWSwafErrorWAFNonexistentItem),
                            @"WAFReferencedItemException" : @(AWSwafErrorWAFReferencedItem),
                            @"WAFServiceLinkedRoleErrorException" : @(AWSwafErrorWAFServiceLinkedRoleError),
                            @"WAFStaleDataException" : @(AWSwafErrorWAFStaleData),
                            @"WAFSubscriptionNotFoundException" : @(AWSwafErrorWAFSubscriptionNotFound),
                            @"WAFTagOperationException" : @(AWSwafErrorWAFTagOperation),
                            @"WAFTagOperationInternalErrorException" : @(AWSwafErrorWAFTagOperationInternalError),
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
	                *error = [NSError errorWithDomain:AWSwafErrorDomain
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
        *error = [NSError errorWithDomain:AWSwafErrorDomain
                                     code:AWSwafErrorUnknown
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

@interface AWSwafRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSwafRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSwaf()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSwaf

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSwafSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSwaf versions need to match. Check your SDK installation. AWSCore: %@ AWSwaf: %@", AWSiOSSDKVersion, AWSwafSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultwaf {
    static AWSwaf *_defaultwaf = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfowaf];
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
        _defaultwaf = [[AWSwaf alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultwaf;
}

+ (void)registerwafWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSwaf alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)wafForKey:(NSString *)key {
    @synchronized(self) {
        AWSwaf *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfowaf
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSwaf registerwafWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removewafForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultwaf` or `+ wafForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicewaf
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicewaf];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSwafRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSwafResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSwafResponseSerializer alloc] initWithJSONDefinition:[[AWSwafResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSwafCreateByteMatchSetResponse *> *)createByteMatchSet:(AWSwafCreateByteMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateByteMatchSet"
                   outputClass:[AWSwafCreateByteMatchSetResponse class]];
}

- (void)createByteMatchSet:(AWSwafCreateByteMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafCreateByteMatchSetResponse *response, NSError *error))completionHandler {
    [[self createByteMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateByteMatchSetResponse *> * _Nonnull task) {
        AWSwafCreateByteMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateGeoMatchSetResponse *> *)createGeoMatchSet:(AWSwafCreateGeoMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateGeoMatchSet"
                   outputClass:[AWSwafCreateGeoMatchSetResponse class]];
}

- (void)createGeoMatchSet:(AWSwafCreateGeoMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafCreateGeoMatchSetResponse *response, NSError *error))completionHandler {
    [[self createGeoMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateGeoMatchSetResponse *> * _Nonnull task) {
        AWSwafCreateGeoMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateIPSetResponse *> *)createIPSet:(AWSwafCreateIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateIPSet"
                   outputClass:[AWSwafCreateIPSetResponse class]];
}

- (void)createIPSet:(AWSwafCreateIPSetRequest *)request
     completionHandler:(void (^)(AWSwafCreateIPSetResponse *response, NSError *error))completionHandler {
    [[self createIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateIPSetResponse *> * _Nonnull task) {
        AWSwafCreateIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateRateBasedRuleResponse *> *)createRateBasedRule:(AWSwafCreateRateBasedRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateRateBasedRule"
                   outputClass:[AWSwafCreateRateBasedRuleResponse class]];
}

- (void)createRateBasedRule:(AWSwafCreateRateBasedRuleRequest *)request
     completionHandler:(void (^)(AWSwafCreateRateBasedRuleResponse *response, NSError *error))completionHandler {
    [[self createRateBasedRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateRateBasedRuleResponse *> * _Nonnull task) {
        AWSwafCreateRateBasedRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateRegexMatchSetResponse *> *)createRegexMatchSet:(AWSwafCreateRegexMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateRegexMatchSet"
                   outputClass:[AWSwafCreateRegexMatchSetResponse class]];
}

- (void)createRegexMatchSet:(AWSwafCreateRegexMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafCreateRegexMatchSetResponse *response, NSError *error))completionHandler {
    [[self createRegexMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateRegexMatchSetResponse *> * _Nonnull task) {
        AWSwafCreateRegexMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateRegexPatternSetResponse *> *)createRegexPatternSet:(AWSwafCreateRegexPatternSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateRegexPatternSet"
                   outputClass:[AWSwafCreateRegexPatternSetResponse class]];
}

- (void)createRegexPatternSet:(AWSwafCreateRegexPatternSetRequest *)request
     completionHandler:(void (^)(AWSwafCreateRegexPatternSetResponse *response, NSError *error))completionHandler {
    [[self createRegexPatternSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateRegexPatternSetResponse *> * _Nonnull task) {
        AWSwafCreateRegexPatternSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateRuleResponse *> *)createRule:(AWSwafCreateRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateRule"
                   outputClass:[AWSwafCreateRuleResponse class]];
}

- (void)createRule:(AWSwafCreateRuleRequest *)request
     completionHandler:(void (^)(AWSwafCreateRuleResponse *response, NSError *error))completionHandler {
    [[self createRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateRuleResponse *> * _Nonnull task) {
        AWSwafCreateRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateRuleGroupResponse *> *)createRuleGroup:(AWSwafCreateRuleGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateRuleGroup"
                   outputClass:[AWSwafCreateRuleGroupResponse class]];
}

- (void)createRuleGroup:(AWSwafCreateRuleGroupRequest *)request
     completionHandler:(void (^)(AWSwafCreateRuleGroupResponse *response, NSError *error))completionHandler {
    [[self createRuleGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateRuleGroupResponse *> * _Nonnull task) {
        AWSwafCreateRuleGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateSizeConstraintSetResponse *> *)createSizeConstraintSet:(AWSwafCreateSizeConstraintSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateSizeConstraintSet"
                   outputClass:[AWSwafCreateSizeConstraintSetResponse class]];
}

- (void)createSizeConstraintSet:(AWSwafCreateSizeConstraintSetRequest *)request
     completionHandler:(void (^)(AWSwafCreateSizeConstraintSetResponse *response, NSError *error))completionHandler {
    [[self createSizeConstraintSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateSizeConstraintSetResponse *> * _Nonnull task) {
        AWSwafCreateSizeConstraintSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateSqlInjectionMatchSetResponse *> *)createSqlInjectionMatchSet:(AWSwafCreateSqlInjectionMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateSqlInjectionMatchSet"
                   outputClass:[AWSwafCreateSqlInjectionMatchSetResponse class]];
}

- (void)createSqlInjectionMatchSet:(AWSwafCreateSqlInjectionMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafCreateSqlInjectionMatchSetResponse *response, NSError *error))completionHandler {
    [[self createSqlInjectionMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateSqlInjectionMatchSetResponse *> * _Nonnull task) {
        AWSwafCreateSqlInjectionMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateWebACLResponse *> *)createWebACL:(AWSwafCreateWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateWebACL"
                   outputClass:[AWSwafCreateWebACLResponse class]];
}

- (void)createWebACL:(AWSwafCreateWebACLRequest *)request
     completionHandler:(void (^)(AWSwafCreateWebACLResponse *response, NSError *error))completionHandler {
    [[self createWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateWebACLResponse *> * _Nonnull task) {
        AWSwafCreateWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateWebACLMigrationStackResponse *> *)createWebACLMigrationStack:(AWSwafCreateWebACLMigrationStackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateWebACLMigrationStack"
                   outputClass:[AWSwafCreateWebACLMigrationStackResponse class]];
}

- (void)createWebACLMigrationStack:(AWSwafCreateWebACLMigrationStackRequest *)request
     completionHandler:(void (^)(AWSwafCreateWebACLMigrationStackResponse *response, NSError *error))completionHandler {
    [[self createWebACLMigrationStack:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateWebACLMigrationStackResponse *> * _Nonnull task) {
        AWSwafCreateWebACLMigrationStackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafCreateXssMatchSetResponse *> *)createXssMatchSet:(AWSwafCreateXssMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"CreateXssMatchSet"
                   outputClass:[AWSwafCreateXssMatchSetResponse class]];
}

- (void)createXssMatchSet:(AWSwafCreateXssMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafCreateXssMatchSetResponse *response, NSError *error))completionHandler {
    [[self createXssMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafCreateXssMatchSetResponse *> * _Nonnull task) {
        AWSwafCreateXssMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteByteMatchSetResponse *> *)deleteByteMatchSet:(AWSwafDeleteByteMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteByteMatchSet"
                   outputClass:[AWSwafDeleteByteMatchSetResponse class]];
}

- (void)deleteByteMatchSet:(AWSwafDeleteByteMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafDeleteByteMatchSetResponse *response, NSError *error))completionHandler {
    [[self deleteByteMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteByteMatchSetResponse *> * _Nonnull task) {
        AWSwafDeleteByteMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteGeoMatchSetResponse *> *)deleteGeoMatchSet:(AWSwafDeleteGeoMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteGeoMatchSet"
                   outputClass:[AWSwafDeleteGeoMatchSetResponse class]];
}

- (void)deleteGeoMatchSet:(AWSwafDeleteGeoMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafDeleteGeoMatchSetResponse *response, NSError *error))completionHandler {
    [[self deleteGeoMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteGeoMatchSetResponse *> * _Nonnull task) {
        AWSwafDeleteGeoMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteIPSetResponse *> *)deleteIPSet:(AWSwafDeleteIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteIPSet"
                   outputClass:[AWSwafDeleteIPSetResponse class]];
}

- (void)deleteIPSet:(AWSwafDeleteIPSetRequest *)request
     completionHandler:(void (^)(AWSwafDeleteIPSetResponse *response, NSError *error))completionHandler {
    [[self deleteIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteIPSetResponse *> * _Nonnull task) {
        AWSwafDeleteIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteLoggingConfigurationResponse *> *)deleteLoggingConfiguration:(AWSwafDeleteLoggingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteLoggingConfiguration"
                   outputClass:[AWSwafDeleteLoggingConfigurationResponse class]];
}

- (void)deleteLoggingConfiguration:(AWSwafDeleteLoggingConfigurationRequest *)request
     completionHandler:(void (^)(AWSwafDeleteLoggingConfigurationResponse *response, NSError *error))completionHandler {
    [[self deleteLoggingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteLoggingConfigurationResponse *> * _Nonnull task) {
        AWSwafDeleteLoggingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeletePermissionPolicyResponse *> *)deletePermissionPolicy:(AWSwafDeletePermissionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeletePermissionPolicy"
                   outputClass:[AWSwafDeletePermissionPolicyResponse class]];
}

- (void)deletePermissionPolicy:(AWSwafDeletePermissionPolicyRequest *)request
     completionHandler:(void (^)(AWSwafDeletePermissionPolicyResponse *response, NSError *error))completionHandler {
    [[self deletePermissionPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeletePermissionPolicyResponse *> * _Nonnull task) {
        AWSwafDeletePermissionPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteRateBasedRuleResponse *> *)deleteRateBasedRule:(AWSwafDeleteRateBasedRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteRateBasedRule"
                   outputClass:[AWSwafDeleteRateBasedRuleResponse class]];
}

- (void)deleteRateBasedRule:(AWSwafDeleteRateBasedRuleRequest *)request
     completionHandler:(void (^)(AWSwafDeleteRateBasedRuleResponse *response, NSError *error))completionHandler {
    [[self deleteRateBasedRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteRateBasedRuleResponse *> * _Nonnull task) {
        AWSwafDeleteRateBasedRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteRegexMatchSetResponse *> *)deleteRegexMatchSet:(AWSwafDeleteRegexMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteRegexMatchSet"
                   outputClass:[AWSwafDeleteRegexMatchSetResponse class]];
}

- (void)deleteRegexMatchSet:(AWSwafDeleteRegexMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafDeleteRegexMatchSetResponse *response, NSError *error))completionHandler {
    [[self deleteRegexMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteRegexMatchSetResponse *> * _Nonnull task) {
        AWSwafDeleteRegexMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteRegexPatternSetResponse *> *)deleteRegexPatternSet:(AWSwafDeleteRegexPatternSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteRegexPatternSet"
                   outputClass:[AWSwafDeleteRegexPatternSetResponse class]];
}

- (void)deleteRegexPatternSet:(AWSwafDeleteRegexPatternSetRequest *)request
     completionHandler:(void (^)(AWSwafDeleteRegexPatternSetResponse *response, NSError *error))completionHandler {
    [[self deleteRegexPatternSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteRegexPatternSetResponse *> * _Nonnull task) {
        AWSwafDeleteRegexPatternSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteRuleResponse *> *)deleteRule:(AWSwafDeleteRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteRule"
                   outputClass:[AWSwafDeleteRuleResponse class]];
}

- (void)deleteRule:(AWSwafDeleteRuleRequest *)request
     completionHandler:(void (^)(AWSwafDeleteRuleResponse *response, NSError *error))completionHandler {
    [[self deleteRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteRuleResponse *> * _Nonnull task) {
        AWSwafDeleteRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteRuleGroupResponse *> *)deleteRuleGroup:(AWSwafDeleteRuleGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteRuleGroup"
                   outputClass:[AWSwafDeleteRuleGroupResponse class]];
}

- (void)deleteRuleGroup:(AWSwafDeleteRuleGroupRequest *)request
     completionHandler:(void (^)(AWSwafDeleteRuleGroupResponse *response, NSError *error))completionHandler {
    [[self deleteRuleGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteRuleGroupResponse *> * _Nonnull task) {
        AWSwafDeleteRuleGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteSizeConstraintSetResponse *> *)deleteSizeConstraintSet:(AWSwafDeleteSizeConstraintSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteSizeConstraintSet"
                   outputClass:[AWSwafDeleteSizeConstraintSetResponse class]];
}

- (void)deleteSizeConstraintSet:(AWSwafDeleteSizeConstraintSetRequest *)request
     completionHandler:(void (^)(AWSwafDeleteSizeConstraintSetResponse *response, NSError *error))completionHandler {
    [[self deleteSizeConstraintSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteSizeConstraintSetResponse *> * _Nonnull task) {
        AWSwafDeleteSizeConstraintSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteSqlInjectionMatchSetResponse *> *)deleteSqlInjectionMatchSet:(AWSwafDeleteSqlInjectionMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteSqlInjectionMatchSet"
                   outputClass:[AWSwafDeleteSqlInjectionMatchSetResponse class]];
}

- (void)deleteSqlInjectionMatchSet:(AWSwafDeleteSqlInjectionMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafDeleteSqlInjectionMatchSetResponse *response, NSError *error))completionHandler {
    [[self deleteSqlInjectionMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteSqlInjectionMatchSetResponse *> * _Nonnull task) {
        AWSwafDeleteSqlInjectionMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteWebACLResponse *> *)deleteWebACL:(AWSwafDeleteWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteWebACL"
                   outputClass:[AWSwafDeleteWebACLResponse class]];
}

- (void)deleteWebACL:(AWSwafDeleteWebACLRequest *)request
     completionHandler:(void (^)(AWSwafDeleteWebACLResponse *response, NSError *error))completionHandler {
    [[self deleteWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteWebACLResponse *> * _Nonnull task) {
        AWSwafDeleteWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafDeleteXssMatchSetResponse *> *)deleteXssMatchSet:(AWSwafDeleteXssMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"DeleteXssMatchSet"
                   outputClass:[AWSwafDeleteXssMatchSetResponse class]];
}

- (void)deleteXssMatchSet:(AWSwafDeleteXssMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafDeleteXssMatchSetResponse *response, NSError *error))completionHandler {
    [[self deleteXssMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafDeleteXssMatchSetResponse *> * _Nonnull task) {
        AWSwafDeleteXssMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetByteMatchSetResponse *> *)getByteMatchSet:(AWSwafGetByteMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetByteMatchSet"
                   outputClass:[AWSwafGetByteMatchSetResponse class]];
}

- (void)getByteMatchSet:(AWSwafGetByteMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafGetByteMatchSetResponse *response, NSError *error))completionHandler {
    [[self getByteMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetByteMatchSetResponse *> * _Nonnull task) {
        AWSwafGetByteMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetChangeTokenResponse *> *)getChangeToken:(AWSwafGetChangeTokenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetChangeToken"
                   outputClass:[AWSwafGetChangeTokenResponse class]];
}

- (void)getChangeToken:(AWSwafGetChangeTokenRequest *)request
     completionHandler:(void (^)(AWSwafGetChangeTokenResponse *response, NSError *error))completionHandler {
    [[self getChangeToken:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetChangeTokenResponse *> * _Nonnull task) {
        AWSwafGetChangeTokenResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetChangeTokenStatusResponse *> *)getChangeTokenStatus:(AWSwafGetChangeTokenStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetChangeTokenStatus"
                   outputClass:[AWSwafGetChangeTokenStatusResponse class]];
}

- (void)getChangeTokenStatus:(AWSwafGetChangeTokenStatusRequest *)request
     completionHandler:(void (^)(AWSwafGetChangeTokenStatusResponse *response, NSError *error))completionHandler {
    [[self getChangeTokenStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetChangeTokenStatusResponse *> * _Nonnull task) {
        AWSwafGetChangeTokenStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetGeoMatchSetResponse *> *)getGeoMatchSet:(AWSwafGetGeoMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetGeoMatchSet"
                   outputClass:[AWSwafGetGeoMatchSetResponse class]];
}

- (void)getGeoMatchSet:(AWSwafGetGeoMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafGetGeoMatchSetResponse *response, NSError *error))completionHandler {
    [[self getGeoMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetGeoMatchSetResponse *> * _Nonnull task) {
        AWSwafGetGeoMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetIPSetResponse *> *)getIPSet:(AWSwafGetIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetIPSet"
                   outputClass:[AWSwafGetIPSetResponse class]];
}

- (void)getIPSet:(AWSwafGetIPSetRequest *)request
     completionHandler:(void (^)(AWSwafGetIPSetResponse *response, NSError *error))completionHandler {
    [[self getIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetIPSetResponse *> * _Nonnull task) {
        AWSwafGetIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetLoggingConfigurationResponse *> *)getLoggingConfiguration:(AWSwafGetLoggingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetLoggingConfiguration"
                   outputClass:[AWSwafGetLoggingConfigurationResponse class]];
}

- (void)getLoggingConfiguration:(AWSwafGetLoggingConfigurationRequest *)request
     completionHandler:(void (^)(AWSwafGetLoggingConfigurationResponse *response, NSError *error))completionHandler {
    [[self getLoggingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetLoggingConfigurationResponse *> * _Nonnull task) {
        AWSwafGetLoggingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetPermissionPolicyResponse *> *)getPermissionPolicy:(AWSwafGetPermissionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetPermissionPolicy"
                   outputClass:[AWSwafGetPermissionPolicyResponse class]];
}

- (void)getPermissionPolicy:(AWSwafGetPermissionPolicyRequest *)request
     completionHandler:(void (^)(AWSwafGetPermissionPolicyResponse *response, NSError *error))completionHandler {
    [[self getPermissionPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetPermissionPolicyResponse *> * _Nonnull task) {
        AWSwafGetPermissionPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetRateBasedRuleResponse *> *)getRateBasedRule:(AWSwafGetRateBasedRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetRateBasedRule"
                   outputClass:[AWSwafGetRateBasedRuleResponse class]];
}

- (void)getRateBasedRule:(AWSwafGetRateBasedRuleRequest *)request
     completionHandler:(void (^)(AWSwafGetRateBasedRuleResponse *response, NSError *error))completionHandler {
    [[self getRateBasedRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetRateBasedRuleResponse *> * _Nonnull task) {
        AWSwafGetRateBasedRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetRateBasedRuleManagedKeysResponse *> *)getRateBasedRuleManagedKeys:(AWSwafGetRateBasedRuleManagedKeysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetRateBasedRuleManagedKeys"
                   outputClass:[AWSwafGetRateBasedRuleManagedKeysResponse class]];
}

- (void)getRateBasedRuleManagedKeys:(AWSwafGetRateBasedRuleManagedKeysRequest *)request
     completionHandler:(void (^)(AWSwafGetRateBasedRuleManagedKeysResponse *response, NSError *error))completionHandler {
    [[self getRateBasedRuleManagedKeys:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetRateBasedRuleManagedKeysResponse *> * _Nonnull task) {
        AWSwafGetRateBasedRuleManagedKeysResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetRegexMatchSetResponse *> *)getRegexMatchSet:(AWSwafGetRegexMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetRegexMatchSet"
                   outputClass:[AWSwafGetRegexMatchSetResponse class]];
}

- (void)getRegexMatchSet:(AWSwafGetRegexMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafGetRegexMatchSetResponse *response, NSError *error))completionHandler {
    [[self getRegexMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetRegexMatchSetResponse *> * _Nonnull task) {
        AWSwafGetRegexMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetRegexPatternSetResponse *> *)getRegexPatternSet:(AWSwafGetRegexPatternSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetRegexPatternSet"
                   outputClass:[AWSwafGetRegexPatternSetResponse class]];
}

- (void)getRegexPatternSet:(AWSwafGetRegexPatternSetRequest *)request
     completionHandler:(void (^)(AWSwafGetRegexPatternSetResponse *response, NSError *error))completionHandler {
    [[self getRegexPatternSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetRegexPatternSetResponse *> * _Nonnull task) {
        AWSwafGetRegexPatternSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetRuleResponse *> *)getRule:(AWSwafGetRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetRule"
                   outputClass:[AWSwafGetRuleResponse class]];
}

- (void)getRule:(AWSwafGetRuleRequest *)request
     completionHandler:(void (^)(AWSwafGetRuleResponse *response, NSError *error))completionHandler {
    [[self getRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetRuleResponse *> * _Nonnull task) {
        AWSwafGetRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetRuleGroupResponse *> *)getRuleGroup:(AWSwafGetRuleGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetRuleGroup"
                   outputClass:[AWSwafGetRuleGroupResponse class]];
}

- (void)getRuleGroup:(AWSwafGetRuleGroupRequest *)request
     completionHandler:(void (^)(AWSwafGetRuleGroupResponse *response, NSError *error))completionHandler {
    [[self getRuleGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetRuleGroupResponse *> * _Nonnull task) {
        AWSwafGetRuleGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetSampledRequestsResponse *> *)getSampledRequests:(AWSwafGetSampledRequestsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetSampledRequests"
                   outputClass:[AWSwafGetSampledRequestsResponse class]];
}

- (void)getSampledRequests:(AWSwafGetSampledRequestsRequest *)request
     completionHandler:(void (^)(AWSwafGetSampledRequestsResponse *response, NSError *error))completionHandler {
    [[self getSampledRequests:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetSampledRequestsResponse *> * _Nonnull task) {
        AWSwafGetSampledRequestsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetSizeConstraintSetResponse *> *)getSizeConstraintSet:(AWSwafGetSizeConstraintSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetSizeConstraintSet"
                   outputClass:[AWSwafGetSizeConstraintSetResponse class]];
}

- (void)getSizeConstraintSet:(AWSwafGetSizeConstraintSetRequest *)request
     completionHandler:(void (^)(AWSwafGetSizeConstraintSetResponse *response, NSError *error))completionHandler {
    [[self getSizeConstraintSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetSizeConstraintSetResponse *> * _Nonnull task) {
        AWSwafGetSizeConstraintSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetSqlInjectionMatchSetResponse *> *)getSqlInjectionMatchSet:(AWSwafGetSqlInjectionMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetSqlInjectionMatchSet"
                   outputClass:[AWSwafGetSqlInjectionMatchSetResponse class]];
}

- (void)getSqlInjectionMatchSet:(AWSwafGetSqlInjectionMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafGetSqlInjectionMatchSetResponse *response, NSError *error))completionHandler {
    [[self getSqlInjectionMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetSqlInjectionMatchSetResponse *> * _Nonnull task) {
        AWSwafGetSqlInjectionMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetWebACLResponse *> *)getWebACL:(AWSwafGetWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetWebACL"
                   outputClass:[AWSwafGetWebACLResponse class]];
}

- (void)getWebACL:(AWSwafGetWebACLRequest *)request
     completionHandler:(void (^)(AWSwafGetWebACLResponse *response, NSError *error))completionHandler {
    [[self getWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetWebACLResponse *> * _Nonnull task) {
        AWSwafGetWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafGetXssMatchSetResponse *> *)getXssMatchSet:(AWSwafGetXssMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"GetXssMatchSet"
                   outputClass:[AWSwafGetXssMatchSetResponse class]];
}

- (void)getXssMatchSet:(AWSwafGetXssMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafGetXssMatchSetResponse *response, NSError *error))completionHandler {
    [[self getXssMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafGetXssMatchSetResponse *> * _Nonnull task) {
        AWSwafGetXssMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListActivatedRulesInRuleGroupResponse *> *)listActivatedRulesInRuleGroup:(AWSwafListActivatedRulesInRuleGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListActivatedRulesInRuleGroup"
                   outputClass:[AWSwafListActivatedRulesInRuleGroupResponse class]];
}

- (void)listActivatedRulesInRuleGroup:(AWSwafListActivatedRulesInRuleGroupRequest *)request
     completionHandler:(void (^)(AWSwafListActivatedRulesInRuleGroupResponse *response, NSError *error))completionHandler {
    [[self listActivatedRulesInRuleGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListActivatedRulesInRuleGroupResponse *> * _Nonnull task) {
        AWSwafListActivatedRulesInRuleGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListByteMatchSetsResponse *> *)listByteMatchSets:(AWSwafListByteMatchSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListByteMatchSets"
                   outputClass:[AWSwafListByteMatchSetsResponse class]];
}

- (void)listByteMatchSets:(AWSwafListByteMatchSetsRequest *)request
     completionHandler:(void (^)(AWSwafListByteMatchSetsResponse *response, NSError *error))completionHandler {
    [[self listByteMatchSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListByteMatchSetsResponse *> * _Nonnull task) {
        AWSwafListByteMatchSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListGeoMatchSetsResponse *> *)listGeoMatchSets:(AWSwafListGeoMatchSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListGeoMatchSets"
                   outputClass:[AWSwafListGeoMatchSetsResponse class]];
}

- (void)listGeoMatchSets:(AWSwafListGeoMatchSetsRequest *)request
     completionHandler:(void (^)(AWSwafListGeoMatchSetsResponse *response, NSError *error))completionHandler {
    [[self listGeoMatchSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListGeoMatchSetsResponse *> * _Nonnull task) {
        AWSwafListGeoMatchSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListIPSetsResponse *> *)listIPSets:(AWSwafListIPSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListIPSets"
                   outputClass:[AWSwafListIPSetsResponse class]];
}

- (void)listIPSets:(AWSwafListIPSetsRequest *)request
     completionHandler:(void (^)(AWSwafListIPSetsResponse *response, NSError *error))completionHandler {
    [[self listIPSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListIPSetsResponse *> * _Nonnull task) {
        AWSwafListIPSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListLoggingConfigurationsResponse *> *)listLoggingConfigurations:(AWSwafListLoggingConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListLoggingConfigurations"
                   outputClass:[AWSwafListLoggingConfigurationsResponse class]];
}

- (void)listLoggingConfigurations:(AWSwafListLoggingConfigurationsRequest *)request
     completionHandler:(void (^)(AWSwafListLoggingConfigurationsResponse *response, NSError *error))completionHandler {
    [[self listLoggingConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListLoggingConfigurationsResponse *> * _Nonnull task) {
        AWSwafListLoggingConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListRateBasedRulesResponse *> *)listRateBasedRules:(AWSwafListRateBasedRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListRateBasedRules"
                   outputClass:[AWSwafListRateBasedRulesResponse class]];
}

- (void)listRateBasedRules:(AWSwafListRateBasedRulesRequest *)request
     completionHandler:(void (^)(AWSwafListRateBasedRulesResponse *response, NSError *error))completionHandler {
    [[self listRateBasedRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListRateBasedRulesResponse *> * _Nonnull task) {
        AWSwafListRateBasedRulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListRegexMatchSetsResponse *> *)listRegexMatchSets:(AWSwafListRegexMatchSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListRegexMatchSets"
                   outputClass:[AWSwafListRegexMatchSetsResponse class]];
}

- (void)listRegexMatchSets:(AWSwafListRegexMatchSetsRequest *)request
     completionHandler:(void (^)(AWSwafListRegexMatchSetsResponse *response, NSError *error))completionHandler {
    [[self listRegexMatchSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListRegexMatchSetsResponse *> * _Nonnull task) {
        AWSwafListRegexMatchSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListRegexPatternSetsResponse *> *)listRegexPatternSets:(AWSwafListRegexPatternSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListRegexPatternSets"
                   outputClass:[AWSwafListRegexPatternSetsResponse class]];
}

- (void)listRegexPatternSets:(AWSwafListRegexPatternSetsRequest *)request
     completionHandler:(void (^)(AWSwafListRegexPatternSetsResponse *response, NSError *error))completionHandler {
    [[self listRegexPatternSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListRegexPatternSetsResponse *> * _Nonnull task) {
        AWSwafListRegexPatternSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListRuleGroupsResponse *> *)listRuleGroups:(AWSwafListRuleGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListRuleGroups"
                   outputClass:[AWSwafListRuleGroupsResponse class]];
}

- (void)listRuleGroups:(AWSwafListRuleGroupsRequest *)request
     completionHandler:(void (^)(AWSwafListRuleGroupsResponse *response, NSError *error))completionHandler {
    [[self listRuleGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListRuleGroupsResponse *> * _Nonnull task) {
        AWSwafListRuleGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListRulesResponse *> *)listRules:(AWSwafListRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListRules"
                   outputClass:[AWSwafListRulesResponse class]];
}

- (void)listRules:(AWSwafListRulesRequest *)request
     completionHandler:(void (^)(AWSwafListRulesResponse *response, NSError *error))completionHandler {
    [[self listRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListRulesResponse *> * _Nonnull task) {
        AWSwafListRulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListSizeConstraintSetsResponse *> *)listSizeConstraintSets:(AWSwafListSizeConstraintSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListSizeConstraintSets"
                   outputClass:[AWSwafListSizeConstraintSetsResponse class]];
}

- (void)listSizeConstraintSets:(AWSwafListSizeConstraintSetsRequest *)request
     completionHandler:(void (^)(AWSwafListSizeConstraintSetsResponse *response, NSError *error))completionHandler {
    [[self listSizeConstraintSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListSizeConstraintSetsResponse *> * _Nonnull task) {
        AWSwafListSizeConstraintSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListSqlInjectionMatchSetsResponse *> *)listSqlInjectionMatchSets:(AWSwafListSqlInjectionMatchSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListSqlInjectionMatchSets"
                   outputClass:[AWSwafListSqlInjectionMatchSetsResponse class]];
}

- (void)listSqlInjectionMatchSets:(AWSwafListSqlInjectionMatchSetsRequest *)request
     completionHandler:(void (^)(AWSwafListSqlInjectionMatchSetsResponse *response, NSError *error))completionHandler {
    [[self listSqlInjectionMatchSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListSqlInjectionMatchSetsResponse *> * _Nonnull task) {
        AWSwafListSqlInjectionMatchSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListSubscribedRuleGroupsResponse *> *)listSubscribedRuleGroups:(AWSwafListSubscribedRuleGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListSubscribedRuleGroups"
                   outputClass:[AWSwafListSubscribedRuleGroupsResponse class]];
}

- (void)listSubscribedRuleGroups:(AWSwafListSubscribedRuleGroupsRequest *)request
     completionHandler:(void (^)(AWSwafListSubscribedRuleGroupsResponse *response, NSError *error))completionHandler {
    [[self listSubscribedRuleGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListSubscribedRuleGroupsResponse *> * _Nonnull task) {
        AWSwafListSubscribedRuleGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListTagsForResourceResponse *> *)listTagsForResource:(AWSwafListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSwafListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSwafListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSwafListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListTagsForResourceResponse *> * _Nonnull task) {
        AWSwafListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListWebACLsResponse *> *)listWebACLs:(AWSwafListWebACLsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListWebACLs"
                   outputClass:[AWSwafListWebACLsResponse class]];
}

- (void)listWebACLs:(AWSwafListWebACLsRequest *)request
     completionHandler:(void (^)(AWSwafListWebACLsResponse *response, NSError *error))completionHandler {
    [[self listWebACLs:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListWebACLsResponse *> * _Nonnull task) {
        AWSwafListWebACLsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafListXssMatchSetsResponse *> *)listXssMatchSets:(AWSwafListXssMatchSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"ListXssMatchSets"
                   outputClass:[AWSwafListXssMatchSetsResponse class]];
}

- (void)listXssMatchSets:(AWSwafListXssMatchSetsRequest *)request
     completionHandler:(void (^)(AWSwafListXssMatchSetsResponse *response, NSError *error))completionHandler {
    [[self listXssMatchSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafListXssMatchSetsResponse *> * _Nonnull task) {
        AWSwafListXssMatchSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafPutLoggingConfigurationResponse *> *)putLoggingConfiguration:(AWSwafPutLoggingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"PutLoggingConfiguration"
                   outputClass:[AWSwafPutLoggingConfigurationResponse class]];
}

- (void)putLoggingConfiguration:(AWSwafPutLoggingConfigurationRequest *)request
     completionHandler:(void (^)(AWSwafPutLoggingConfigurationResponse *response, NSError *error))completionHandler {
    [[self putLoggingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafPutLoggingConfigurationResponse *> * _Nonnull task) {
        AWSwafPutLoggingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafPutPermissionPolicyResponse *> *)putPermissionPolicy:(AWSwafPutPermissionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"PutPermissionPolicy"
                   outputClass:[AWSwafPutPermissionPolicyResponse class]];
}

- (void)putPermissionPolicy:(AWSwafPutPermissionPolicyRequest *)request
     completionHandler:(void (^)(AWSwafPutPermissionPolicyResponse *response, NSError *error))completionHandler {
    [[self putPermissionPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafPutPermissionPolicyResponse *> * _Nonnull task) {
        AWSwafPutPermissionPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafTagResourceResponse *> *)tagResource:(AWSwafTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"TagResource"
                   outputClass:[AWSwafTagResourceResponse class]];
}

- (void)tagResource:(AWSwafTagResourceRequest *)request
     completionHandler:(void (^)(AWSwafTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafTagResourceResponse *> * _Nonnull task) {
        AWSwafTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUntagResourceResponse *> *)untagResource:(AWSwafUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UntagResource"
                   outputClass:[AWSwafUntagResourceResponse class]];
}

- (void)untagResource:(AWSwafUntagResourceRequest *)request
     completionHandler:(void (^)(AWSwafUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUntagResourceResponse *> * _Nonnull task) {
        AWSwafUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateByteMatchSetResponse *> *)updateByteMatchSet:(AWSwafUpdateByteMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateByteMatchSet"
                   outputClass:[AWSwafUpdateByteMatchSetResponse class]];
}

- (void)updateByteMatchSet:(AWSwafUpdateByteMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafUpdateByteMatchSetResponse *response, NSError *error))completionHandler {
    [[self updateByteMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateByteMatchSetResponse *> * _Nonnull task) {
        AWSwafUpdateByteMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateGeoMatchSetResponse *> *)updateGeoMatchSet:(AWSwafUpdateGeoMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateGeoMatchSet"
                   outputClass:[AWSwafUpdateGeoMatchSetResponse class]];
}

- (void)updateGeoMatchSet:(AWSwafUpdateGeoMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafUpdateGeoMatchSetResponse *response, NSError *error))completionHandler {
    [[self updateGeoMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateGeoMatchSetResponse *> * _Nonnull task) {
        AWSwafUpdateGeoMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateIPSetResponse *> *)updateIPSet:(AWSwafUpdateIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateIPSet"
                   outputClass:[AWSwafUpdateIPSetResponse class]];
}

- (void)updateIPSet:(AWSwafUpdateIPSetRequest *)request
     completionHandler:(void (^)(AWSwafUpdateIPSetResponse *response, NSError *error))completionHandler {
    [[self updateIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateIPSetResponse *> * _Nonnull task) {
        AWSwafUpdateIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateRateBasedRuleResponse *> *)updateRateBasedRule:(AWSwafUpdateRateBasedRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateRateBasedRule"
                   outputClass:[AWSwafUpdateRateBasedRuleResponse class]];
}

- (void)updateRateBasedRule:(AWSwafUpdateRateBasedRuleRequest *)request
     completionHandler:(void (^)(AWSwafUpdateRateBasedRuleResponse *response, NSError *error))completionHandler {
    [[self updateRateBasedRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateRateBasedRuleResponse *> * _Nonnull task) {
        AWSwafUpdateRateBasedRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateRegexMatchSetResponse *> *)updateRegexMatchSet:(AWSwafUpdateRegexMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateRegexMatchSet"
                   outputClass:[AWSwafUpdateRegexMatchSetResponse class]];
}

- (void)updateRegexMatchSet:(AWSwafUpdateRegexMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafUpdateRegexMatchSetResponse *response, NSError *error))completionHandler {
    [[self updateRegexMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateRegexMatchSetResponse *> * _Nonnull task) {
        AWSwafUpdateRegexMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateRegexPatternSetResponse *> *)updateRegexPatternSet:(AWSwafUpdateRegexPatternSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateRegexPatternSet"
                   outputClass:[AWSwafUpdateRegexPatternSetResponse class]];
}

- (void)updateRegexPatternSet:(AWSwafUpdateRegexPatternSetRequest *)request
     completionHandler:(void (^)(AWSwafUpdateRegexPatternSetResponse *response, NSError *error))completionHandler {
    [[self updateRegexPatternSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateRegexPatternSetResponse *> * _Nonnull task) {
        AWSwafUpdateRegexPatternSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateRuleResponse *> *)updateRule:(AWSwafUpdateRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateRule"
                   outputClass:[AWSwafUpdateRuleResponse class]];
}

- (void)updateRule:(AWSwafUpdateRuleRequest *)request
     completionHandler:(void (^)(AWSwafUpdateRuleResponse *response, NSError *error))completionHandler {
    [[self updateRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateRuleResponse *> * _Nonnull task) {
        AWSwafUpdateRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateRuleGroupResponse *> *)updateRuleGroup:(AWSwafUpdateRuleGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateRuleGroup"
                   outputClass:[AWSwafUpdateRuleGroupResponse class]];
}

- (void)updateRuleGroup:(AWSwafUpdateRuleGroupRequest *)request
     completionHandler:(void (^)(AWSwafUpdateRuleGroupResponse *response, NSError *error))completionHandler {
    [[self updateRuleGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateRuleGroupResponse *> * _Nonnull task) {
        AWSwafUpdateRuleGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateSizeConstraintSetResponse *> *)updateSizeConstraintSet:(AWSwafUpdateSizeConstraintSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateSizeConstraintSet"
                   outputClass:[AWSwafUpdateSizeConstraintSetResponse class]];
}

- (void)updateSizeConstraintSet:(AWSwafUpdateSizeConstraintSetRequest *)request
     completionHandler:(void (^)(AWSwafUpdateSizeConstraintSetResponse *response, NSError *error))completionHandler {
    [[self updateSizeConstraintSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateSizeConstraintSetResponse *> * _Nonnull task) {
        AWSwafUpdateSizeConstraintSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateSqlInjectionMatchSetResponse *> *)updateSqlInjectionMatchSet:(AWSwafUpdateSqlInjectionMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateSqlInjectionMatchSet"
                   outputClass:[AWSwafUpdateSqlInjectionMatchSetResponse class]];
}

- (void)updateSqlInjectionMatchSet:(AWSwafUpdateSqlInjectionMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafUpdateSqlInjectionMatchSetResponse *response, NSError *error))completionHandler {
    [[self updateSqlInjectionMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateSqlInjectionMatchSetResponse *> * _Nonnull task) {
        AWSwafUpdateSqlInjectionMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateWebACLResponse *> *)updateWebACL:(AWSwafUpdateWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateWebACL"
                   outputClass:[AWSwafUpdateWebACLResponse class]];
}

- (void)updateWebACL:(AWSwafUpdateWebACLRequest *)request
     completionHandler:(void (^)(AWSwafUpdateWebACLResponse *response, NSError *error))completionHandler {
    [[self updateWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateWebACLResponse *> * _Nonnull task) {
        AWSwafUpdateWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwafUpdateXssMatchSetResponse *> *)updateXssMatchSet:(AWSwafUpdateXssMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_20150824"
                 operationName:@"UpdateXssMatchSet"
                   outputClass:[AWSwafUpdateXssMatchSetResponse class]];
}

- (void)updateXssMatchSet:(AWSwafUpdateXssMatchSetRequest *)request
     completionHandler:(void (^)(AWSwafUpdateXssMatchSetResponse *response, NSError *error))completionHandler {
    [[self updateXssMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwafUpdateXssMatchSetResponse *> * _Nonnull task) {
        AWSwafUpdateXssMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
