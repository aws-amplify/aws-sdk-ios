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

#import "AWSApplicationautoscalingService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSApplicationautoscalingResources.h"

static NSString *const AWSInfoApplicationautoscaling = @"Applicationautoscaling";
NSString *const AWSApplicationautoscalingSDKVersion = @"2.13.3";


@interface AWSApplicationautoscalingResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSApplicationautoscalingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConcurrentUpdateException" : @(AWSApplicationautoscalingErrorConcurrentUpdate),
                            @"FailedResourceAccessException" : @(AWSApplicationautoscalingErrorFailedResourceAccess),
                            @"InternalServiceException" : @(AWSApplicationautoscalingErrorInternalService),
                            @"InvalidNextTokenException" : @(AWSApplicationautoscalingErrorInvalidNextToken),
                            @"LimitExceededException" : @(AWSApplicationautoscalingErrorLimitExceeded),
                            @"ObjectNotFoundException" : @(AWSApplicationautoscalingErrorObjectNotFound),
                            @"ValidationException" : @(AWSApplicationautoscalingErrorValidation),
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
	                *error = [NSError errorWithDomain:AWSApplicationautoscalingErrorDomain
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
        *error = [NSError errorWithDomain:AWSApplicationautoscalingErrorDomain
                                     code:AWSApplicationautoscalingErrorUnknown
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

@interface AWSApplicationautoscalingRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSApplicationautoscalingRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSApplicationautoscaling()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSApplicationautoscaling

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSApplicationautoscalingSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSApplicationautoscaling versions need to match. Check your SDK installation. AWSCore: %@ AWSApplicationautoscaling: %@", AWSiOSSDKVersion, AWSApplicationautoscalingSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultApplicationautoscaling {
    static AWSApplicationautoscaling *_defaultApplicationautoscaling = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoApplicationautoscaling];
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
        _defaultApplicationautoscaling = [[AWSApplicationautoscaling alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultApplicationautoscaling;
}

+ (void)registerApplicationautoscalingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSApplicationautoscaling alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ApplicationautoscalingForKey:(NSString *)key {
    @synchronized(self) {
        AWSApplicationautoscaling *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoApplicationautoscaling
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSApplicationautoscaling registerApplicationautoscalingWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeApplicationautoscalingForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultApplicationautoscaling` or `+ ApplicationautoscalingForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceApplicationautoscaling
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceApplicationautoscaling];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSApplicationautoscalingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSApplicationautoscalingResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSApplicationautoscalingResponseSerializer alloc] initWithJSONDefinition:[[AWSApplicationautoscalingResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSApplicationautoscalingDeleteScalingPolicyResponse *> *)deleteScalingPolicy:(AWSApplicationautoscalingDeleteScalingPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DeleteScalingPolicy"
                   outputClass:[AWSApplicationautoscalingDeleteScalingPolicyResponse class]];
}

- (void)deleteScalingPolicy:(AWSApplicationautoscalingDeleteScalingPolicyRequest *)request
     completionHandler:(void (^)(AWSApplicationautoscalingDeleteScalingPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSApplicationautoscalingDeleteScalingPolicyResponse *> * _Nonnull task) {
        AWSApplicationautoscalingDeleteScalingPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSApplicationautoscalingDeleteScheduledActionResponse *> *)deleteScheduledAction:(AWSApplicationautoscalingDeleteScheduledActionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DeleteScheduledAction"
                   outputClass:[AWSApplicationautoscalingDeleteScheduledActionResponse class]];
}

- (void)deleteScheduledAction:(AWSApplicationautoscalingDeleteScheduledActionRequest *)request
     completionHandler:(void (^)(AWSApplicationautoscalingDeleteScheduledActionResponse *response, NSError *error))completionHandler {
    [[self deleteScheduledAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSApplicationautoscalingDeleteScheduledActionResponse *> * _Nonnull task) {
        AWSApplicationautoscalingDeleteScheduledActionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSApplicationautoscalingDeregisterScalableTargetResponse *> *)deregisterScalableTarget:(AWSApplicationautoscalingDeregisterScalableTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DeregisterScalableTarget"
                   outputClass:[AWSApplicationautoscalingDeregisterScalableTargetResponse class]];
}

- (void)deregisterScalableTarget:(AWSApplicationautoscalingDeregisterScalableTargetRequest *)request
     completionHandler:(void (^)(AWSApplicationautoscalingDeregisterScalableTargetResponse *response, NSError *error))completionHandler {
    [[self deregisterScalableTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSApplicationautoscalingDeregisterScalableTargetResponse *> * _Nonnull task) {
        AWSApplicationautoscalingDeregisterScalableTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSApplicationautoscalingDescribeScalableTargetsResponse *> *)describeScalableTargets:(AWSApplicationautoscalingDescribeScalableTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DescribeScalableTargets"
                   outputClass:[AWSApplicationautoscalingDescribeScalableTargetsResponse class]];
}

- (void)describeScalableTargets:(AWSApplicationautoscalingDescribeScalableTargetsRequest *)request
     completionHandler:(void (^)(AWSApplicationautoscalingDescribeScalableTargetsResponse *response, NSError *error))completionHandler {
    [[self describeScalableTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSApplicationautoscalingDescribeScalableTargetsResponse *> * _Nonnull task) {
        AWSApplicationautoscalingDescribeScalableTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSApplicationautoscalingDescribeScalingActivitiesResponse *> *)describeScalingActivities:(AWSApplicationautoscalingDescribeScalingActivitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DescribeScalingActivities"
                   outputClass:[AWSApplicationautoscalingDescribeScalingActivitiesResponse class]];
}

- (void)describeScalingActivities:(AWSApplicationautoscalingDescribeScalingActivitiesRequest *)request
     completionHandler:(void (^)(AWSApplicationautoscalingDescribeScalingActivitiesResponse *response, NSError *error))completionHandler {
    [[self describeScalingActivities:request] continueWithBlock:^id _Nullable(AWSTask<AWSApplicationautoscalingDescribeScalingActivitiesResponse *> * _Nonnull task) {
        AWSApplicationautoscalingDescribeScalingActivitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSApplicationautoscalingDescribeScalingPoliciesResponse *> *)describeScalingPolicies:(AWSApplicationautoscalingDescribeScalingPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DescribeScalingPolicies"
                   outputClass:[AWSApplicationautoscalingDescribeScalingPoliciesResponse class]];
}

- (void)describeScalingPolicies:(AWSApplicationautoscalingDescribeScalingPoliciesRequest *)request
     completionHandler:(void (^)(AWSApplicationautoscalingDescribeScalingPoliciesResponse *response, NSError *error))completionHandler {
    [[self describeScalingPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSApplicationautoscalingDescribeScalingPoliciesResponse *> * _Nonnull task) {
        AWSApplicationautoscalingDescribeScalingPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSApplicationautoscalingDescribeScheduledActionsResponse *> *)describeScheduledActions:(AWSApplicationautoscalingDescribeScheduledActionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DescribeScheduledActions"
                   outputClass:[AWSApplicationautoscalingDescribeScheduledActionsResponse class]];
}

- (void)describeScheduledActions:(AWSApplicationautoscalingDescribeScheduledActionsRequest *)request
     completionHandler:(void (^)(AWSApplicationautoscalingDescribeScheduledActionsResponse *response, NSError *error))completionHandler {
    [[self describeScheduledActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSApplicationautoscalingDescribeScheduledActionsResponse *> * _Nonnull task) {
        AWSApplicationautoscalingDescribeScheduledActionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSApplicationautoscalingPutScalingPolicyResponse *> *)putScalingPolicy:(AWSApplicationautoscalingPutScalingPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"PutScalingPolicy"
                   outputClass:[AWSApplicationautoscalingPutScalingPolicyResponse class]];
}

- (void)putScalingPolicy:(AWSApplicationautoscalingPutScalingPolicyRequest *)request
     completionHandler:(void (^)(AWSApplicationautoscalingPutScalingPolicyResponse *response, NSError *error))completionHandler {
    [[self putScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSApplicationautoscalingPutScalingPolicyResponse *> * _Nonnull task) {
        AWSApplicationautoscalingPutScalingPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSApplicationautoscalingPutScheduledActionResponse *> *)putScheduledAction:(AWSApplicationautoscalingPutScheduledActionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"PutScheduledAction"
                   outputClass:[AWSApplicationautoscalingPutScheduledActionResponse class]];
}

- (void)putScheduledAction:(AWSApplicationautoscalingPutScheduledActionRequest *)request
     completionHandler:(void (^)(AWSApplicationautoscalingPutScheduledActionResponse *response, NSError *error))completionHandler {
    [[self putScheduledAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSApplicationautoscalingPutScheduledActionResponse *> * _Nonnull task) {
        AWSApplicationautoscalingPutScheduledActionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSApplicationautoscalingRegisterScalableTargetResponse *> *)registerScalableTarget:(AWSApplicationautoscalingRegisterScalableTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"RegisterScalableTarget"
                   outputClass:[AWSApplicationautoscalingRegisterScalableTargetResponse class]];
}

- (void)registerScalableTarget:(AWSApplicationautoscalingRegisterScalableTargetRequest *)request
     completionHandler:(void (^)(AWSApplicationautoscalingRegisterScalableTargetResponse *response, NSError *error))completionHandler {
    [[self registerScalableTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSApplicationautoscalingRegisterScalableTargetResponse *> * _Nonnull task) {
        AWSApplicationautoscalingRegisterScalableTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
