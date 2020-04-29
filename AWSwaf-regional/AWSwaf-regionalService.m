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

#import "AWSwaf-regionalService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSwaf-regionalResources.h"

static NSString *const AWSInfowaf-regional = @"waf-regional";
NSString *const AWSwaf-regionalSDKVersion = @"2.13.2";


@interface AWSwaf-regionalResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSwaf-regionalResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"WAFBadRequestException" : @(AWSwaf-regionalErrorWAFBadRequest),
                            @"WAFDisallowedNameException" : @(AWSwaf-regionalErrorWAFDisallowedName),
                            @"WAFEntityMigrationException" : @(AWSwaf-regionalErrorWAFEntityMigration),
                            @"WAFInternalErrorException" : @(AWSwaf-regionalErrorWAFInternalError),
                            @"WAFInvalidAccountException" : @(AWSwaf-regionalErrorWAFInvalidAccount),
                            @"WAFInvalidOperationException" : @(AWSwaf-regionalErrorWAFInvalidOperation),
                            @"WAFInvalidParameterException" : @(AWSwaf-regionalErrorWAFInvalidParameter),
                            @"WAFInvalidPermissionPolicyException" : @(AWSwaf-regionalErrorWAFInvalidPermissionPolicy),
                            @"WAFInvalidRegexPatternException" : @(AWSwaf-regionalErrorWAFInvalidRegexPattern),
                            @"WAFLimitsExceededException" : @(AWSwaf-regionalErrorWAFLimitsExceeded),
                            @"WAFNonEmptyEntityException" : @(AWSwaf-regionalErrorWAFNonEmptyEntity),
                            @"WAFNonexistentContainerException" : @(AWSwaf-regionalErrorWAFNonexistentContainer),
                            @"WAFNonexistentItemException" : @(AWSwaf-regionalErrorWAFNonexistentItem),
                            @"WAFReferencedItemException" : @(AWSwaf-regionalErrorWAFReferencedItem),
                            @"WAFServiceLinkedRoleErrorException" : @(AWSwaf-regionalErrorWAFServiceLinkedRoleError),
                            @"WAFStaleDataException" : @(AWSwaf-regionalErrorWAFStaleData),
                            @"WAFSubscriptionNotFoundException" : @(AWSwaf-regionalErrorWAFSubscriptionNotFound),
                            @"WAFTagOperationException" : @(AWSwaf-regionalErrorWAFTagOperation),
                            @"WAFTagOperationInternalErrorException" : @(AWSwaf-regionalErrorWAFTagOperationInternalError),
                            @"WAFUnavailableEntityException" : @(AWSwaf-regionalErrorWAFUnavailableEntity),
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
	                *error = [NSError errorWithDomain:AWSwaf-regionalErrorDomain
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
        *error = [NSError errorWithDomain:AWSwaf-regionalErrorDomain
                                     code:AWSwaf-regionalErrorUnknown
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

@interface AWSwaf-regionalRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSwaf-regionalRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSwaf-regional()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSwaf-regional

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSwaf-regionalSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSwaf-regional versions need to match. Check your SDK installation. AWSCore: %@ AWSwaf-regional: %@", AWSiOSSDKVersion, AWSwaf-regionalSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultwaf-regional {
    static AWSwaf-regional *_defaultwaf-regional = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfowaf-regional];
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
        _defaultwaf-regional = [[AWSwaf-regional alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultwaf-regional;
}

+ (void)registerwaf-regionalWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSwaf-regional alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)waf-regionalForKey:(NSString *)key {
    @synchronized(self) {
        AWSwaf-regional *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfowaf-regional
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSwaf-regional registerwaf-regionalWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removewaf-regionalForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultwaf-regional` or `+ waf-regionalForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicewaf-regional
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicewaf-regional];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSwaf-regionalRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSwaf-regionalResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSwaf-regionalResponseSerializer alloc] initWithJSONDefinition:[[AWSwaf-regionalResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSwaf-regionalAssociateWebACLResponse *> *)associateWebACL:(AWSwaf-regionalAssociateWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"AssociateWebACL"
                   outputClass:[AWSwaf-regionalAssociateWebACLResponse class]];
}

- (void)associateWebACL:(AWSwaf-regionalAssociateWebACLRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalAssociateWebACLResponse *response, NSError *error))completionHandler {
    [[self associateWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalAssociateWebACLResponse *> * _Nonnull task) {
        AWSwaf-regionalAssociateWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateByteMatchSetResponse *> *)createByteMatchSet:(AWSwaf-regionalCreateByteMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateByteMatchSet"
                   outputClass:[AWSwaf-regionalCreateByteMatchSetResponse class]];
}

- (void)createByteMatchSet:(AWSwaf-regionalCreateByteMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateByteMatchSetResponse *response, NSError *error))completionHandler {
    [[self createByteMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateByteMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateByteMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateGeoMatchSetResponse *> *)createGeoMatchSet:(AWSwaf-regionalCreateGeoMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateGeoMatchSet"
                   outputClass:[AWSwaf-regionalCreateGeoMatchSetResponse class]];
}

- (void)createGeoMatchSet:(AWSwaf-regionalCreateGeoMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateGeoMatchSetResponse *response, NSError *error))completionHandler {
    [[self createGeoMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateGeoMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateGeoMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateIPSetResponse *> *)createIPSet:(AWSwaf-regionalCreateIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateIPSet"
                   outputClass:[AWSwaf-regionalCreateIPSetResponse class]];
}

- (void)createIPSet:(AWSwaf-regionalCreateIPSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateIPSetResponse *response, NSError *error))completionHandler {
    [[self createIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateIPSetResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateRateBasedRuleResponse *> *)createRateBasedRule:(AWSwaf-regionalCreateRateBasedRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateRateBasedRule"
                   outputClass:[AWSwaf-regionalCreateRateBasedRuleResponse class]];
}

- (void)createRateBasedRule:(AWSwaf-regionalCreateRateBasedRuleRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateRateBasedRuleResponse *response, NSError *error))completionHandler {
    [[self createRateBasedRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateRateBasedRuleResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateRateBasedRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateRegexMatchSetResponse *> *)createRegexMatchSet:(AWSwaf-regionalCreateRegexMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateRegexMatchSet"
                   outputClass:[AWSwaf-regionalCreateRegexMatchSetResponse class]];
}

- (void)createRegexMatchSet:(AWSwaf-regionalCreateRegexMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateRegexMatchSetResponse *response, NSError *error))completionHandler {
    [[self createRegexMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateRegexMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateRegexMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateRegexPatternSetResponse *> *)createRegexPatternSet:(AWSwaf-regionalCreateRegexPatternSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateRegexPatternSet"
                   outputClass:[AWSwaf-regionalCreateRegexPatternSetResponse class]];
}

- (void)createRegexPatternSet:(AWSwaf-regionalCreateRegexPatternSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateRegexPatternSetResponse *response, NSError *error))completionHandler {
    [[self createRegexPatternSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateRegexPatternSetResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateRegexPatternSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateRuleResponse *> *)createRule:(AWSwaf-regionalCreateRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateRule"
                   outputClass:[AWSwaf-regionalCreateRuleResponse class]];
}

- (void)createRule:(AWSwaf-regionalCreateRuleRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateRuleResponse *response, NSError *error))completionHandler {
    [[self createRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateRuleResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateRuleGroupResponse *> *)createRuleGroup:(AWSwaf-regionalCreateRuleGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateRuleGroup"
                   outputClass:[AWSwaf-regionalCreateRuleGroupResponse class]];
}

- (void)createRuleGroup:(AWSwaf-regionalCreateRuleGroupRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateRuleGroupResponse *response, NSError *error))completionHandler {
    [[self createRuleGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateRuleGroupResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateRuleGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateSizeConstraintSetResponse *> *)createSizeConstraintSet:(AWSwaf-regionalCreateSizeConstraintSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateSizeConstraintSet"
                   outputClass:[AWSwaf-regionalCreateSizeConstraintSetResponse class]];
}

- (void)createSizeConstraintSet:(AWSwaf-regionalCreateSizeConstraintSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateSizeConstraintSetResponse *response, NSError *error))completionHandler {
    [[self createSizeConstraintSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateSizeConstraintSetResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateSizeConstraintSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateSqlInjectionMatchSetResponse *> *)createSqlInjectionMatchSet:(AWSwaf-regionalCreateSqlInjectionMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateSqlInjectionMatchSet"
                   outputClass:[AWSwaf-regionalCreateSqlInjectionMatchSetResponse class]];
}

- (void)createSqlInjectionMatchSet:(AWSwaf-regionalCreateSqlInjectionMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateSqlInjectionMatchSetResponse *response, NSError *error))completionHandler {
    [[self createSqlInjectionMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateSqlInjectionMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateSqlInjectionMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateWebACLResponse *> *)createWebACL:(AWSwaf-regionalCreateWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateWebACL"
                   outputClass:[AWSwaf-regionalCreateWebACLResponse class]];
}

- (void)createWebACL:(AWSwaf-regionalCreateWebACLRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateWebACLResponse *response, NSError *error))completionHandler {
    [[self createWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateWebACLResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateWebACLMigrationStackResponse *> *)createWebACLMigrationStack:(AWSwaf-regionalCreateWebACLMigrationStackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateWebACLMigrationStack"
                   outputClass:[AWSwaf-regionalCreateWebACLMigrationStackResponse class]];
}

- (void)createWebACLMigrationStack:(AWSwaf-regionalCreateWebACLMigrationStackRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateWebACLMigrationStackResponse *response, NSError *error))completionHandler {
    [[self createWebACLMigrationStack:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateWebACLMigrationStackResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateWebACLMigrationStackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalCreateXssMatchSetResponse *> *)createXssMatchSet:(AWSwaf-regionalCreateXssMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"CreateXssMatchSet"
                   outputClass:[AWSwaf-regionalCreateXssMatchSetResponse class]];
}

- (void)createXssMatchSet:(AWSwaf-regionalCreateXssMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalCreateXssMatchSetResponse *response, NSError *error))completionHandler {
    [[self createXssMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalCreateXssMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalCreateXssMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteByteMatchSetResponse *> *)deleteByteMatchSet:(AWSwaf-regionalDeleteByteMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteByteMatchSet"
                   outputClass:[AWSwaf-regionalDeleteByteMatchSetResponse class]];
}

- (void)deleteByteMatchSet:(AWSwaf-regionalDeleteByteMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteByteMatchSetResponse *response, NSError *error))completionHandler {
    [[self deleteByteMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteByteMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteByteMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteGeoMatchSetResponse *> *)deleteGeoMatchSet:(AWSwaf-regionalDeleteGeoMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteGeoMatchSet"
                   outputClass:[AWSwaf-regionalDeleteGeoMatchSetResponse class]];
}

- (void)deleteGeoMatchSet:(AWSwaf-regionalDeleteGeoMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteGeoMatchSetResponse *response, NSError *error))completionHandler {
    [[self deleteGeoMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteGeoMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteGeoMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteIPSetResponse *> *)deleteIPSet:(AWSwaf-regionalDeleteIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteIPSet"
                   outputClass:[AWSwaf-regionalDeleteIPSetResponse class]];
}

- (void)deleteIPSet:(AWSwaf-regionalDeleteIPSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteIPSetResponse *response, NSError *error))completionHandler {
    [[self deleteIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteIPSetResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteLoggingConfigurationResponse *> *)deleteLoggingConfiguration:(AWSwaf-regionalDeleteLoggingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteLoggingConfiguration"
                   outputClass:[AWSwaf-regionalDeleteLoggingConfigurationResponse class]];
}

- (void)deleteLoggingConfiguration:(AWSwaf-regionalDeleteLoggingConfigurationRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteLoggingConfigurationResponse *response, NSError *error))completionHandler {
    [[self deleteLoggingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteLoggingConfigurationResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteLoggingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeletePermissionPolicyResponse *> *)deletePermissionPolicy:(AWSwaf-regionalDeletePermissionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeletePermissionPolicy"
                   outputClass:[AWSwaf-regionalDeletePermissionPolicyResponse class]];
}

- (void)deletePermissionPolicy:(AWSwaf-regionalDeletePermissionPolicyRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeletePermissionPolicyResponse *response, NSError *error))completionHandler {
    [[self deletePermissionPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeletePermissionPolicyResponse *> * _Nonnull task) {
        AWSwaf-regionalDeletePermissionPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteRateBasedRuleResponse *> *)deleteRateBasedRule:(AWSwaf-regionalDeleteRateBasedRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteRateBasedRule"
                   outputClass:[AWSwaf-regionalDeleteRateBasedRuleResponse class]];
}

- (void)deleteRateBasedRule:(AWSwaf-regionalDeleteRateBasedRuleRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteRateBasedRuleResponse *response, NSError *error))completionHandler {
    [[self deleteRateBasedRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteRateBasedRuleResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteRateBasedRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteRegexMatchSetResponse *> *)deleteRegexMatchSet:(AWSwaf-regionalDeleteRegexMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteRegexMatchSet"
                   outputClass:[AWSwaf-regionalDeleteRegexMatchSetResponse class]];
}

- (void)deleteRegexMatchSet:(AWSwaf-regionalDeleteRegexMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteRegexMatchSetResponse *response, NSError *error))completionHandler {
    [[self deleteRegexMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteRegexMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteRegexMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteRegexPatternSetResponse *> *)deleteRegexPatternSet:(AWSwaf-regionalDeleteRegexPatternSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteRegexPatternSet"
                   outputClass:[AWSwaf-regionalDeleteRegexPatternSetResponse class]];
}

- (void)deleteRegexPatternSet:(AWSwaf-regionalDeleteRegexPatternSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteRegexPatternSetResponse *response, NSError *error))completionHandler {
    [[self deleteRegexPatternSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteRegexPatternSetResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteRegexPatternSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteRuleResponse *> *)deleteRule:(AWSwaf-regionalDeleteRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteRule"
                   outputClass:[AWSwaf-regionalDeleteRuleResponse class]];
}

- (void)deleteRule:(AWSwaf-regionalDeleteRuleRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteRuleResponse *response, NSError *error))completionHandler {
    [[self deleteRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteRuleResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteRuleGroupResponse *> *)deleteRuleGroup:(AWSwaf-regionalDeleteRuleGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteRuleGroup"
                   outputClass:[AWSwaf-regionalDeleteRuleGroupResponse class]];
}

- (void)deleteRuleGroup:(AWSwaf-regionalDeleteRuleGroupRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteRuleGroupResponse *response, NSError *error))completionHandler {
    [[self deleteRuleGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteRuleGroupResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteRuleGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteSizeConstraintSetResponse *> *)deleteSizeConstraintSet:(AWSwaf-regionalDeleteSizeConstraintSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteSizeConstraintSet"
                   outputClass:[AWSwaf-regionalDeleteSizeConstraintSetResponse class]];
}

- (void)deleteSizeConstraintSet:(AWSwaf-regionalDeleteSizeConstraintSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteSizeConstraintSetResponse *response, NSError *error))completionHandler {
    [[self deleteSizeConstraintSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteSizeConstraintSetResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteSizeConstraintSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteSqlInjectionMatchSetResponse *> *)deleteSqlInjectionMatchSet:(AWSwaf-regionalDeleteSqlInjectionMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteSqlInjectionMatchSet"
                   outputClass:[AWSwaf-regionalDeleteSqlInjectionMatchSetResponse class]];
}

- (void)deleteSqlInjectionMatchSet:(AWSwaf-regionalDeleteSqlInjectionMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteSqlInjectionMatchSetResponse *response, NSError *error))completionHandler {
    [[self deleteSqlInjectionMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteSqlInjectionMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteSqlInjectionMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteWebACLResponse *> *)deleteWebACL:(AWSwaf-regionalDeleteWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteWebACL"
                   outputClass:[AWSwaf-regionalDeleteWebACLResponse class]];
}

- (void)deleteWebACL:(AWSwaf-regionalDeleteWebACLRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteWebACLResponse *response, NSError *error))completionHandler {
    [[self deleteWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteWebACLResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDeleteXssMatchSetResponse *> *)deleteXssMatchSet:(AWSwaf-regionalDeleteXssMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DeleteXssMatchSet"
                   outputClass:[AWSwaf-regionalDeleteXssMatchSetResponse class]];
}

- (void)deleteXssMatchSet:(AWSwaf-regionalDeleteXssMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDeleteXssMatchSetResponse *response, NSError *error))completionHandler {
    [[self deleteXssMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDeleteXssMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalDeleteXssMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalDisassociateWebACLResponse *> *)disassociateWebACL:(AWSwaf-regionalDisassociateWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"DisassociateWebACL"
                   outputClass:[AWSwaf-regionalDisassociateWebACLResponse class]];
}

- (void)disassociateWebACL:(AWSwaf-regionalDisassociateWebACLRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalDisassociateWebACLResponse *response, NSError *error))completionHandler {
    [[self disassociateWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalDisassociateWebACLResponse *> * _Nonnull task) {
        AWSwaf-regionalDisassociateWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetByteMatchSetResponse *> *)getByteMatchSet:(AWSwaf-regionalGetByteMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetByteMatchSet"
                   outputClass:[AWSwaf-regionalGetByteMatchSetResponse class]];
}

- (void)getByteMatchSet:(AWSwaf-regionalGetByteMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetByteMatchSetResponse *response, NSError *error))completionHandler {
    [[self getByteMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetByteMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalGetByteMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetChangeTokenResponse *> *)getChangeToken:(AWSwaf-regionalGetChangeTokenRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetChangeToken"
                   outputClass:[AWSwaf-regionalGetChangeTokenResponse class]];
}

- (void)getChangeToken:(AWSwaf-regionalGetChangeTokenRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetChangeTokenResponse *response, NSError *error))completionHandler {
    [[self getChangeToken:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetChangeTokenResponse *> * _Nonnull task) {
        AWSwaf-regionalGetChangeTokenResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetChangeTokenStatusResponse *> *)getChangeTokenStatus:(AWSwaf-regionalGetChangeTokenStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetChangeTokenStatus"
                   outputClass:[AWSwaf-regionalGetChangeTokenStatusResponse class]];
}

- (void)getChangeTokenStatus:(AWSwaf-regionalGetChangeTokenStatusRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetChangeTokenStatusResponse *response, NSError *error))completionHandler {
    [[self getChangeTokenStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetChangeTokenStatusResponse *> * _Nonnull task) {
        AWSwaf-regionalGetChangeTokenStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetGeoMatchSetResponse *> *)getGeoMatchSet:(AWSwaf-regionalGetGeoMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetGeoMatchSet"
                   outputClass:[AWSwaf-regionalGetGeoMatchSetResponse class]];
}

- (void)getGeoMatchSet:(AWSwaf-regionalGetGeoMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetGeoMatchSetResponse *response, NSError *error))completionHandler {
    [[self getGeoMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetGeoMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalGetGeoMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetIPSetResponse *> *)getIPSet:(AWSwaf-regionalGetIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetIPSet"
                   outputClass:[AWSwaf-regionalGetIPSetResponse class]];
}

- (void)getIPSet:(AWSwaf-regionalGetIPSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetIPSetResponse *response, NSError *error))completionHandler {
    [[self getIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetIPSetResponse *> * _Nonnull task) {
        AWSwaf-regionalGetIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetLoggingConfigurationResponse *> *)getLoggingConfiguration:(AWSwaf-regionalGetLoggingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetLoggingConfiguration"
                   outputClass:[AWSwaf-regionalGetLoggingConfigurationResponse class]];
}

- (void)getLoggingConfiguration:(AWSwaf-regionalGetLoggingConfigurationRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetLoggingConfigurationResponse *response, NSError *error))completionHandler {
    [[self getLoggingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetLoggingConfigurationResponse *> * _Nonnull task) {
        AWSwaf-regionalGetLoggingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetPermissionPolicyResponse *> *)getPermissionPolicy:(AWSwaf-regionalGetPermissionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetPermissionPolicy"
                   outputClass:[AWSwaf-regionalGetPermissionPolicyResponse class]];
}

- (void)getPermissionPolicy:(AWSwaf-regionalGetPermissionPolicyRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetPermissionPolicyResponse *response, NSError *error))completionHandler {
    [[self getPermissionPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetPermissionPolicyResponse *> * _Nonnull task) {
        AWSwaf-regionalGetPermissionPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetRateBasedRuleResponse *> *)getRateBasedRule:(AWSwaf-regionalGetRateBasedRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetRateBasedRule"
                   outputClass:[AWSwaf-regionalGetRateBasedRuleResponse class]];
}

- (void)getRateBasedRule:(AWSwaf-regionalGetRateBasedRuleRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetRateBasedRuleResponse *response, NSError *error))completionHandler {
    [[self getRateBasedRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetRateBasedRuleResponse *> * _Nonnull task) {
        AWSwaf-regionalGetRateBasedRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetRateBasedRuleManagedKeysResponse *> *)getRateBasedRuleManagedKeys:(AWSwaf-regionalGetRateBasedRuleManagedKeysRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetRateBasedRuleManagedKeys"
                   outputClass:[AWSwaf-regionalGetRateBasedRuleManagedKeysResponse class]];
}

- (void)getRateBasedRuleManagedKeys:(AWSwaf-regionalGetRateBasedRuleManagedKeysRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetRateBasedRuleManagedKeysResponse *response, NSError *error))completionHandler {
    [[self getRateBasedRuleManagedKeys:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetRateBasedRuleManagedKeysResponse *> * _Nonnull task) {
        AWSwaf-regionalGetRateBasedRuleManagedKeysResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetRegexMatchSetResponse *> *)getRegexMatchSet:(AWSwaf-regionalGetRegexMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetRegexMatchSet"
                   outputClass:[AWSwaf-regionalGetRegexMatchSetResponse class]];
}

- (void)getRegexMatchSet:(AWSwaf-regionalGetRegexMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetRegexMatchSetResponse *response, NSError *error))completionHandler {
    [[self getRegexMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetRegexMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalGetRegexMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetRegexPatternSetResponse *> *)getRegexPatternSet:(AWSwaf-regionalGetRegexPatternSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetRegexPatternSet"
                   outputClass:[AWSwaf-regionalGetRegexPatternSetResponse class]];
}

- (void)getRegexPatternSet:(AWSwaf-regionalGetRegexPatternSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetRegexPatternSetResponse *response, NSError *error))completionHandler {
    [[self getRegexPatternSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetRegexPatternSetResponse *> * _Nonnull task) {
        AWSwaf-regionalGetRegexPatternSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetRuleResponse *> *)getRule:(AWSwaf-regionalGetRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetRule"
                   outputClass:[AWSwaf-regionalGetRuleResponse class]];
}

- (void)getRule:(AWSwaf-regionalGetRuleRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetRuleResponse *response, NSError *error))completionHandler {
    [[self getRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetRuleResponse *> * _Nonnull task) {
        AWSwaf-regionalGetRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetRuleGroupResponse *> *)getRuleGroup:(AWSwaf-regionalGetRuleGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetRuleGroup"
                   outputClass:[AWSwaf-regionalGetRuleGroupResponse class]];
}

- (void)getRuleGroup:(AWSwaf-regionalGetRuleGroupRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetRuleGroupResponse *response, NSError *error))completionHandler {
    [[self getRuleGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetRuleGroupResponse *> * _Nonnull task) {
        AWSwaf-regionalGetRuleGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetSampledRequestsResponse *> *)getSampledRequests:(AWSwaf-regionalGetSampledRequestsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetSampledRequests"
                   outputClass:[AWSwaf-regionalGetSampledRequestsResponse class]];
}

- (void)getSampledRequests:(AWSwaf-regionalGetSampledRequestsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetSampledRequestsResponse *response, NSError *error))completionHandler {
    [[self getSampledRequests:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetSampledRequestsResponse *> * _Nonnull task) {
        AWSwaf-regionalGetSampledRequestsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetSizeConstraintSetResponse *> *)getSizeConstraintSet:(AWSwaf-regionalGetSizeConstraintSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetSizeConstraintSet"
                   outputClass:[AWSwaf-regionalGetSizeConstraintSetResponse class]];
}

- (void)getSizeConstraintSet:(AWSwaf-regionalGetSizeConstraintSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetSizeConstraintSetResponse *response, NSError *error))completionHandler {
    [[self getSizeConstraintSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetSizeConstraintSetResponse *> * _Nonnull task) {
        AWSwaf-regionalGetSizeConstraintSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetSqlInjectionMatchSetResponse *> *)getSqlInjectionMatchSet:(AWSwaf-regionalGetSqlInjectionMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetSqlInjectionMatchSet"
                   outputClass:[AWSwaf-regionalGetSqlInjectionMatchSetResponse class]];
}

- (void)getSqlInjectionMatchSet:(AWSwaf-regionalGetSqlInjectionMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetSqlInjectionMatchSetResponse *response, NSError *error))completionHandler {
    [[self getSqlInjectionMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetSqlInjectionMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalGetSqlInjectionMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetWebACLResponse *> *)getWebACL:(AWSwaf-regionalGetWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetWebACL"
                   outputClass:[AWSwaf-regionalGetWebACLResponse class]];
}

- (void)getWebACL:(AWSwaf-regionalGetWebACLRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetWebACLResponse *response, NSError *error))completionHandler {
    [[self getWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetWebACLResponse *> * _Nonnull task) {
        AWSwaf-regionalGetWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetWebACLForResourceResponse *> *)getWebACLForResource:(AWSwaf-regionalGetWebACLForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetWebACLForResource"
                   outputClass:[AWSwaf-regionalGetWebACLForResourceResponse class]];
}

- (void)getWebACLForResource:(AWSwaf-regionalGetWebACLForResourceRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetWebACLForResourceResponse *response, NSError *error))completionHandler {
    [[self getWebACLForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetWebACLForResourceResponse *> * _Nonnull task) {
        AWSwaf-regionalGetWebACLForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalGetXssMatchSetResponse *> *)getXssMatchSet:(AWSwaf-regionalGetXssMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"GetXssMatchSet"
                   outputClass:[AWSwaf-regionalGetXssMatchSetResponse class]];
}

- (void)getXssMatchSet:(AWSwaf-regionalGetXssMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalGetXssMatchSetResponse *response, NSError *error))completionHandler {
    [[self getXssMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalGetXssMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalGetXssMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListActivatedRulesInRuleGroupResponse *> *)listActivatedRulesInRuleGroup:(AWSwaf-regionalListActivatedRulesInRuleGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListActivatedRulesInRuleGroup"
                   outputClass:[AWSwaf-regionalListActivatedRulesInRuleGroupResponse class]];
}

- (void)listActivatedRulesInRuleGroup:(AWSwaf-regionalListActivatedRulesInRuleGroupRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListActivatedRulesInRuleGroupResponse *response, NSError *error))completionHandler {
    [[self listActivatedRulesInRuleGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListActivatedRulesInRuleGroupResponse *> * _Nonnull task) {
        AWSwaf-regionalListActivatedRulesInRuleGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListByteMatchSetsResponse *> *)listByteMatchSets:(AWSwaf-regionalListByteMatchSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListByteMatchSets"
                   outputClass:[AWSwaf-regionalListByteMatchSetsResponse class]];
}

- (void)listByteMatchSets:(AWSwaf-regionalListByteMatchSetsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListByteMatchSetsResponse *response, NSError *error))completionHandler {
    [[self listByteMatchSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListByteMatchSetsResponse *> * _Nonnull task) {
        AWSwaf-regionalListByteMatchSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListGeoMatchSetsResponse *> *)listGeoMatchSets:(AWSwaf-regionalListGeoMatchSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListGeoMatchSets"
                   outputClass:[AWSwaf-regionalListGeoMatchSetsResponse class]];
}

- (void)listGeoMatchSets:(AWSwaf-regionalListGeoMatchSetsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListGeoMatchSetsResponse *response, NSError *error))completionHandler {
    [[self listGeoMatchSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListGeoMatchSetsResponse *> * _Nonnull task) {
        AWSwaf-regionalListGeoMatchSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListIPSetsResponse *> *)listIPSets:(AWSwaf-regionalListIPSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListIPSets"
                   outputClass:[AWSwaf-regionalListIPSetsResponse class]];
}

- (void)listIPSets:(AWSwaf-regionalListIPSetsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListIPSetsResponse *response, NSError *error))completionHandler {
    [[self listIPSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListIPSetsResponse *> * _Nonnull task) {
        AWSwaf-regionalListIPSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListLoggingConfigurationsResponse *> *)listLoggingConfigurations:(AWSwaf-regionalListLoggingConfigurationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListLoggingConfigurations"
                   outputClass:[AWSwaf-regionalListLoggingConfigurationsResponse class]];
}

- (void)listLoggingConfigurations:(AWSwaf-regionalListLoggingConfigurationsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListLoggingConfigurationsResponse *response, NSError *error))completionHandler {
    [[self listLoggingConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListLoggingConfigurationsResponse *> * _Nonnull task) {
        AWSwaf-regionalListLoggingConfigurationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListRateBasedRulesResponse *> *)listRateBasedRules:(AWSwaf-regionalListRateBasedRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListRateBasedRules"
                   outputClass:[AWSwaf-regionalListRateBasedRulesResponse class]];
}

- (void)listRateBasedRules:(AWSwaf-regionalListRateBasedRulesRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListRateBasedRulesResponse *response, NSError *error))completionHandler {
    [[self listRateBasedRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListRateBasedRulesResponse *> * _Nonnull task) {
        AWSwaf-regionalListRateBasedRulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListRegexMatchSetsResponse *> *)listRegexMatchSets:(AWSwaf-regionalListRegexMatchSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListRegexMatchSets"
                   outputClass:[AWSwaf-regionalListRegexMatchSetsResponse class]];
}

- (void)listRegexMatchSets:(AWSwaf-regionalListRegexMatchSetsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListRegexMatchSetsResponse *response, NSError *error))completionHandler {
    [[self listRegexMatchSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListRegexMatchSetsResponse *> * _Nonnull task) {
        AWSwaf-regionalListRegexMatchSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListRegexPatternSetsResponse *> *)listRegexPatternSets:(AWSwaf-regionalListRegexPatternSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListRegexPatternSets"
                   outputClass:[AWSwaf-regionalListRegexPatternSetsResponse class]];
}

- (void)listRegexPatternSets:(AWSwaf-regionalListRegexPatternSetsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListRegexPatternSetsResponse *response, NSError *error))completionHandler {
    [[self listRegexPatternSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListRegexPatternSetsResponse *> * _Nonnull task) {
        AWSwaf-regionalListRegexPatternSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListResourcesForWebACLResponse *> *)listResourcesForWebACL:(AWSwaf-regionalListResourcesForWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListResourcesForWebACL"
                   outputClass:[AWSwaf-regionalListResourcesForWebACLResponse class]];
}

- (void)listResourcesForWebACL:(AWSwaf-regionalListResourcesForWebACLRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListResourcesForWebACLResponse *response, NSError *error))completionHandler {
    [[self listResourcesForWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListResourcesForWebACLResponse *> * _Nonnull task) {
        AWSwaf-regionalListResourcesForWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListRuleGroupsResponse *> *)listRuleGroups:(AWSwaf-regionalListRuleGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListRuleGroups"
                   outputClass:[AWSwaf-regionalListRuleGroupsResponse class]];
}

- (void)listRuleGroups:(AWSwaf-regionalListRuleGroupsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListRuleGroupsResponse *response, NSError *error))completionHandler {
    [[self listRuleGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListRuleGroupsResponse *> * _Nonnull task) {
        AWSwaf-regionalListRuleGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListRulesResponse *> *)listRules:(AWSwaf-regionalListRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListRules"
                   outputClass:[AWSwaf-regionalListRulesResponse class]];
}

- (void)listRules:(AWSwaf-regionalListRulesRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListRulesResponse *response, NSError *error))completionHandler {
    [[self listRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListRulesResponse *> * _Nonnull task) {
        AWSwaf-regionalListRulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListSizeConstraintSetsResponse *> *)listSizeConstraintSets:(AWSwaf-regionalListSizeConstraintSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListSizeConstraintSets"
                   outputClass:[AWSwaf-regionalListSizeConstraintSetsResponse class]];
}

- (void)listSizeConstraintSets:(AWSwaf-regionalListSizeConstraintSetsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListSizeConstraintSetsResponse *response, NSError *error))completionHandler {
    [[self listSizeConstraintSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListSizeConstraintSetsResponse *> * _Nonnull task) {
        AWSwaf-regionalListSizeConstraintSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListSqlInjectionMatchSetsResponse *> *)listSqlInjectionMatchSets:(AWSwaf-regionalListSqlInjectionMatchSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListSqlInjectionMatchSets"
                   outputClass:[AWSwaf-regionalListSqlInjectionMatchSetsResponse class]];
}

- (void)listSqlInjectionMatchSets:(AWSwaf-regionalListSqlInjectionMatchSetsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListSqlInjectionMatchSetsResponse *response, NSError *error))completionHandler {
    [[self listSqlInjectionMatchSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListSqlInjectionMatchSetsResponse *> * _Nonnull task) {
        AWSwaf-regionalListSqlInjectionMatchSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListSubscribedRuleGroupsResponse *> *)listSubscribedRuleGroups:(AWSwaf-regionalListSubscribedRuleGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListSubscribedRuleGroups"
                   outputClass:[AWSwaf-regionalListSubscribedRuleGroupsResponse class]];
}

- (void)listSubscribedRuleGroups:(AWSwaf-regionalListSubscribedRuleGroupsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListSubscribedRuleGroupsResponse *response, NSError *error))completionHandler {
    [[self listSubscribedRuleGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListSubscribedRuleGroupsResponse *> * _Nonnull task) {
        AWSwaf-regionalListSubscribedRuleGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListTagsForResourceResponse *> *)listTagsForResource:(AWSwaf-regionalListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSwaf-regionalListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSwaf-regionalListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListTagsForResourceResponse *> * _Nonnull task) {
        AWSwaf-regionalListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListWebACLsResponse *> *)listWebACLs:(AWSwaf-regionalListWebACLsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListWebACLs"
                   outputClass:[AWSwaf-regionalListWebACLsResponse class]];
}

- (void)listWebACLs:(AWSwaf-regionalListWebACLsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListWebACLsResponse *response, NSError *error))completionHandler {
    [[self listWebACLs:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListWebACLsResponse *> * _Nonnull task) {
        AWSwaf-regionalListWebACLsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalListXssMatchSetsResponse *> *)listXssMatchSets:(AWSwaf-regionalListXssMatchSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"ListXssMatchSets"
                   outputClass:[AWSwaf-regionalListXssMatchSetsResponse class]];
}

- (void)listXssMatchSets:(AWSwaf-regionalListXssMatchSetsRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalListXssMatchSetsResponse *response, NSError *error))completionHandler {
    [[self listXssMatchSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalListXssMatchSetsResponse *> * _Nonnull task) {
        AWSwaf-regionalListXssMatchSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalPutLoggingConfigurationResponse *> *)putLoggingConfiguration:(AWSwaf-regionalPutLoggingConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"PutLoggingConfiguration"
                   outputClass:[AWSwaf-regionalPutLoggingConfigurationResponse class]];
}

- (void)putLoggingConfiguration:(AWSwaf-regionalPutLoggingConfigurationRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalPutLoggingConfigurationResponse *response, NSError *error))completionHandler {
    [[self putLoggingConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalPutLoggingConfigurationResponse *> * _Nonnull task) {
        AWSwaf-regionalPutLoggingConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalPutPermissionPolicyResponse *> *)putPermissionPolicy:(AWSwaf-regionalPutPermissionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"PutPermissionPolicy"
                   outputClass:[AWSwaf-regionalPutPermissionPolicyResponse class]];
}

- (void)putPermissionPolicy:(AWSwaf-regionalPutPermissionPolicyRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalPutPermissionPolicyResponse *response, NSError *error))completionHandler {
    [[self putPermissionPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalPutPermissionPolicyResponse *> * _Nonnull task) {
        AWSwaf-regionalPutPermissionPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalTagResourceResponse *> *)tagResource:(AWSwaf-regionalTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"TagResource"
                   outputClass:[AWSwaf-regionalTagResourceResponse class]];
}

- (void)tagResource:(AWSwaf-regionalTagResourceRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalTagResourceResponse *> * _Nonnull task) {
        AWSwaf-regionalTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUntagResourceResponse *> *)untagResource:(AWSwaf-regionalUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UntagResource"
                   outputClass:[AWSwaf-regionalUntagResourceResponse class]];
}

- (void)untagResource:(AWSwaf-regionalUntagResourceRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUntagResourceResponse *> * _Nonnull task) {
        AWSwaf-regionalUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateByteMatchSetResponse *> *)updateByteMatchSet:(AWSwaf-regionalUpdateByteMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateByteMatchSet"
                   outputClass:[AWSwaf-regionalUpdateByteMatchSetResponse class]];
}

- (void)updateByteMatchSet:(AWSwaf-regionalUpdateByteMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateByteMatchSetResponse *response, NSError *error))completionHandler {
    [[self updateByteMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateByteMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateByteMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateGeoMatchSetResponse *> *)updateGeoMatchSet:(AWSwaf-regionalUpdateGeoMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateGeoMatchSet"
                   outputClass:[AWSwaf-regionalUpdateGeoMatchSetResponse class]];
}

- (void)updateGeoMatchSet:(AWSwaf-regionalUpdateGeoMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateGeoMatchSetResponse *response, NSError *error))completionHandler {
    [[self updateGeoMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateGeoMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateGeoMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateIPSetResponse *> *)updateIPSet:(AWSwaf-regionalUpdateIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateIPSet"
                   outputClass:[AWSwaf-regionalUpdateIPSetResponse class]];
}

- (void)updateIPSet:(AWSwaf-regionalUpdateIPSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateIPSetResponse *response, NSError *error))completionHandler {
    [[self updateIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateIPSetResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateRateBasedRuleResponse *> *)updateRateBasedRule:(AWSwaf-regionalUpdateRateBasedRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateRateBasedRule"
                   outputClass:[AWSwaf-regionalUpdateRateBasedRuleResponse class]];
}

- (void)updateRateBasedRule:(AWSwaf-regionalUpdateRateBasedRuleRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateRateBasedRuleResponse *response, NSError *error))completionHandler {
    [[self updateRateBasedRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateRateBasedRuleResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateRateBasedRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateRegexMatchSetResponse *> *)updateRegexMatchSet:(AWSwaf-regionalUpdateRegexMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateRegexMatchSet"
                   outputClass:[AWSwaf-regionalUpdateRegexMatchSetResponse class]];
}

- (void)updateRegexMatchSet:(AWSwaf-regionalUpdateRegexMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateRegexMatchSetResponse *response, NSError *error))completionHandler {
    [[self updateRegexMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateRegexMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateRegexMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateRegexPatternSetResponse *> *)updateRegexPatternSet:(AWSwaf-regionalUpdateRegexPatternSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateRegexPatternSet"
                   outputClass:[AWSwaf-regionalUpdateRegexPatternSetResponse class]];
}

- (void)updateRegexPatternSet:(AWSwaf-regionalUpdateRegexPatternSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateRegexPatternSetResponse *response, NSError *error))completionHandler {
    [[self updateRegexPatternSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateRegexPatternSetResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateRegexPatternSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateRuleResponse *> *)updateRule:(AWSwaf-regionalUpdateRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateRule"
                   outputClass:[AWSwaf-regionalUpdateRuleResponse class]];
}

- (void)updateRule:(AWSwaf-regionalUpdateRuleRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateRuleResponse *response, NSError *error))completionHandler {
    [[self updateRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateRuleResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateRuleGroupResponse *> *)updateRuleGroup:(AWSwaf-regionalUpdateRuleGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateRuleGroup"
                   outputClass:[AWSwaf-regionalUpdateRuleGroupResponse class]];
}

- (void)updateRuleGroup:(AWSwaf-regionalUpdateRuleGroupRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateRuleGroupResponse *response, NSError *error))completionHandler {
    [[self updateRuleGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateRuleGroupResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateRuleGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateSizeConstraintSetResponse *> *)updateSizeConstraintSet:(AWSwaf-regionalUpdateSizeConstraintSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateSizeConstraintSet"
                   outputClass:[AWSwaf-regionalUpdateSizeConstraintSetResponse class]];
}

- (void)updateSizeConstraintSet:(AWSwaf-regionalUpdateSizeConstraintSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateSizeConstraintSetResponse *response, NSError *error))completionHandler {
    [[self updateSizeConstraintSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateSizeConstraintSetResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateSizeConstraintSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateSqlInjectionMatchSetResponse *> *)updateSqlInjectionMatchSet:(AWSwaf-regionalUpdateSqlInjectionMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateSqlInjectionMatchSet"
                   outputClass:[AWSwaf-regionalUpdateSqlInjectionMatchSetResponse class]];
}

- (void)updateSqlInjectionMatchSet:(AWSwaf-regionalUpdateSqlInjectionMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateSqlInjectionMatchSetResponse *response, NSError *error))completionHandler {
    [[self updateSqlInjectionMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateSqlInjectionMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateSqlInjectionMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateWebACLResponse *> *)updateWebACL:(AWSwaf-regionalUpdateWebACLRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateWebACL"
                   outputClass:[AWSwaf-regionalUpdateWebACLResponse class]];
}

- (void)updateWebACL:(AWSwaf-regionalUpdateWebACLRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateWebACLResponse *response, NSError *error))completionHandler {
    [[self updateWebACL:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateWebACLResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateWebACLResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSwaf-regionalUpdateXssMatchSetResponse *> *)updateXssMatchSet:(AWSwaf-regionalUpdateXssMatchSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSWAF_Regional_20161128"
                 operationName:@"UpdateXssMatchSet"
                   outputClass:[AWSwaf-regionalUpdateXssMatchSetResponse class]];
}

- (void)updateXssMatchSet:(AWSwaf-regionalUpdateXssMatchSetRequest *)request
     completionHandler:(void (^)(AWSwaf-regionalUpdateXssMatchSetResponse *response, NSError *error))completionHandler {
    [[self updateXssMatchSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSwaf-regionalUpdateXssMatchSetResponse *> * _Nonnull task) {
        AWSwaf-regionalUpdateXssMatchSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
