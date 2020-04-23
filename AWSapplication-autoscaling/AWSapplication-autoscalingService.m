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

#import "AWSapplication-autoscalingService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSapplication-autoscalingResources.h"

static NSString *const AWSInfoapplication-autoscaling = @"application-autoscaling";
NSString *const AWSapplication-autoscalingSDKVersion = @"2.13.2";


@interface AWSapplication-autoscalingResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSapplication-autoscalingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConcurrentUpdateException" : @(AWSapplication-autoscalingErrorConcurrentUpdate),
                            @"FailedResourceAccessException" : @(AWSapplication-autoscalingErrorFailedResourceAccess),
                            @"InternalServiceException" : @(AWSapplication-autoscalingErrorInternalService),
                            @"InvalidNextTokenException" : @(AWSapplication-autoscalingErrorInvalidNextToken),
                            @"LimitExceededException" : @(AWSapplication-autoscalingErrorLimitExceeded),
                            @"ObjectNotFoundException" : @(AWSapplication-autoscalingErrorObjectNotFound),
                            @"ValidationException" : @(AWSapplication-autoscalingErrorValidation),
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
	                *error = [NSError errorWithDomain:AWSapplication-autoscalingErrorDomain
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
        *error = [NSError errorWithDomain:AWSapplication-autoscalingErrorDomain
                                     code:AWSapplication-autoscalingErrorUnknown
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

@interface AWSapplication-autoscalingRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSapplication-autoscalingRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSapplication-autoscaling()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSapplication-autoscaling

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSapplication-autoscalingSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSapplication-autoscaling versions need to match. Check your SDK installation. AWSCore: %@ AWSapplication-autoscaling: %@", AWSiOSSDKVersion, AWSapplication-autoscalingSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultapplication-autoscaling {
    static AWSapplication-autoscaling *_defaultapplication-autoscaling = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoapplication-autoscaling];
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
        _defaultapplication-autoscaling = [[AWSapplication-autoscaling alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultapplication-autoscaling;
}

+ (void)registerapplication-autoscalingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSapplication-autoscaling alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)application-autoscalingForKey:(NSString *)key {
    @synchronized(self) {
        AWSapplication-autoscaling *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoapplication-autoscaling
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSapplication-autoscaling registerapplication-autoscalingWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeapplication-autoscalingForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultapplication-autoscaling` or `+ application-autoscalingForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceapplication-autoscaling
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceapplication-autoscaling];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSapplication-autoscalingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSapplication-autoscalingResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSapplication-autoscalingResponseSerializer alloc] initWithJSONDefinition:[[AWSapplication-autoscalingResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSapplication-autoscalingDeleteScalingPolicyResponse *> *)deleteScalingPolicy:(AWSapplication-autoscalingDeleteScalingPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DeleteScalingPolicy"
                   outputClass:[AWSapplication-autoscalingDeleteScalingPolicyResponse class]];
}

- (void)deleteScalingPolicy:(AWSapplication-autoscalingDeleteScalingPolicyRequest *)request
     completionHandler:(void (^)(AWSapplication-autoscalingDeleteScalingPolicyResponse *response, NSError *error))completionHandler {
    [[self deleteScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSapplication-autoscalingDeleteScalingPolicyResponse *> * _Nonnull task) {
        AWSapplication-autoscalingDeleteScalingPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapplication-autoscalingDeleteScheduledActionResponse *> *)deleteScheduledAction:(AWSapplication-autoscalingDeleteScheduledActionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DeleteScheduledAction"
                   outputClass:[AWSapplication-autoscalingDeleteScheduledActionResponse class]];
}

- (void)deleteScheduledAction:(AWSapplication-autoscalingDeleteScheduledActionRequest *)request
     completionHandler:(void (^)(AWSapplication-autoscalingDeleteScheduledActionResponse *response, NSError *error))completionHandler {
    [[self deleteScheduledAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSapplication-autoscalingDeleteScheduledActionResponse *> * _Nonnull task) {
        AWSapplication-autoscalingDeleteScheduledActionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapplication-autoscalingDeregisterScalableTargetResponse *> *)deregisterScalableTarget:(AWSapplication-autoscalingDeregisterScalableTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DeregisterScalableTarget"
                   outputClass:[AWSapplication-autoscalingDeregisterScalableTargetResponse class]];
}

- (void)deregisterScalableTarget:(AWSapplication-autoscalingDeregisterScalableTargetRequest *)request
     completionHandler:(void (^)(AWSapplication-autoscalingDeregisterScalableTargetResponse *response, NSError *error))completionHandler {
    [[self deregisterScalableTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSapplication-autoscalingDeregisterScalableTargetResponse *> * _Nonnull task) {
        AWSapplication-autoscalingDeregisterScalableTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapplication-autoscalingDescribeScalableTargetsResponse *> *)describeScalableTargets:(AWSapplication-autoscalingDescribeScalableTargetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DescribeScalableTargets"
                   outputClass:[AWSapplication-autoscalingDescribeScalableTargetsResponse class]];
}

- (void)describeScalableTargets:(AWSapplication-autoscalingDescribeScalableTargetsRequest *)request
     completionHandler:(void (^)(AWSapplication-autoscalingDescribeScalableTargetsResponse *response, NSError *error))completionHandler {
    [[self describeScalableTargets:request] continueWithBlock:^id _Nullable(AWSTask<AWSapplication-autoscalingDescribeScalableTargetsResponse *> * _Nonnull task) {
        AWSapplication-autoscalingDescribeScalableTargetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapplication-autoscalingDescribeScalingActivitiesResponse *> *)describeScalingActivities:(AWSapplication-autoscalingDescribeScalingActivitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DescribeScalingActivities"
                   outputClass:[AWSapplication-autoscalingDescribeScalingActivitiesResponse class]];
}

- (void)describeScalingActivities:(AWSapplication-autoscalingDescribeScalingActivitiesRequest *)request
     completionHandler:(void (^)(AWSapplication-autoscalingDescribeScalingActivitiesResponse *response, NSError *error))completionHandler {
    [[self describeScalingActivities:request] continueWithBlock:^id _Nullable(AWSTask<AWSapplication-autoscalingDescribeScalingActivitiesResponse *> * _Nonnull task) {
        AWSapplication-autoscalingDescribeScalingActivitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapplication-autoscalingDescribeScalingPoliciesResponse *> *)describeScalingPolicies:(AWSapplication-autoscalingDescribeScalingPoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DescribeScalingPolicies"
                   outputClass:[AWSapplication-autoscalingDescribeScalingPoliciesResponse class]];
}

- (void)describeScalingPolicies:(AWSapplication-autoscalingDescribeScalingPoliciesRequest *)request
     completionHandler:(void (^)(AWSapplication-autoscalingDescribeScalingPoliciesResponse *response, NSError *error))completionHandler {
    [[self describeScalingPolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSapplication-autoscalingDescribeScalingPoliciesResponse *> * _Nonnull task) {
        AWSapplication-autoscalingDescribeScalingPoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapplication-autoscalingDescribeScheduledActionsResponse *> *)describeScheduledActions:(AWSapplication-autoscalingDescribeScheduledActionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"DescribeScheduledActions"
                   outputClass:[AWSapplication-autoscalingDescribeScheduledActionsResponse class]];
}

- (void)describeScheduledActions:(AWSapplication-autoscalingDescribeScheduledActionsRequest *)request
     completionHandler:(void (^)(AWSapplication-autoscalingDescribeScheduledActionsResponse *response, NSError *error))completionHandler {
    [[self describeScheduledActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSapplication-autoscalingDescribeScheduledActionsResponse *> * _Nonnull task) {
        AWSapplication-autoscalingDescribeScheduledActionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapplication-autoscalingPutScalingPolicyResponse *> *)putScalingPolicy:(AWSapplication-autoscalingPutScalingPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"PutScalingPolicy"
                   outputClass:[AWSapplication-autoscalingPutScalingPolicyResponse class]];
}

- (void)putScalingPolicy:(AWSapplication-autoscalingPutScalingPolicyRequest *)request
     completionHandler:(void (^)(AWSapplication-autoscalingPutScalingPolicyResponse *response, NSError *error))completionHandler {
    [[self putScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSapplication-autoscalingPutScalingPolicyResponse *> * _Nonnull task) {
        AWSapplication-autoscalingPutScalingPolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapplication-autoscalingPutScheduledActionResponse *> *)putScheduledAction:(AWSapplication-autoscalingPutScheduledActionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"PutScheduledAction"
                   outputClass:[AWSapplication-autoscalingPutScheduledActionResponse class]];
}

- (void)putScheduledAction:(AWSapplication-autoscalingPutScheduledActionRequest *)request
     completionHandler:(void (^)(AWSapplication-autoscalingPutScheduledActionResponse *response, NSError *error))completionHandler {
    [[self putScheduledAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSapplication-autoscalingPutScheduledActionResponse *> * _Nonnull task) {
        AWSapplication-autoscalingPutScheduledActionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSapplication-autoscalingRegisterScalableTargetResponse *> *)registerScalableTarget:(AWSapplication-autoscalingRegisterScalableTargetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AnyScaleFrontendService"
                 operationName:@"RegisterScalableTarget"
                   outputClass:[AWSapplication-autoscalingRegisterScalableTargetResponse class]];
}

- (void)registerScalableTarget:(AWSapplication-autoscalingRegisterScalableTargetRequest *)request
     completionHandler:(void (^)(AWSapplication-autoscalingRegisterScalableTargetResponse *response, NSError *error))completionHandler {
    [[self registerScalableTarget:request] continueWithBlock:^id _Nullable(AWSTask<AWSapplication-autoscalingRegisterScalableTargetResponse *> * _Nonnull task) {
        AWSapplication-autoscalingRegisterScalableTargetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
