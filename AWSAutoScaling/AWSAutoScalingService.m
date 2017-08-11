//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSAutoScalingService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAutoScalingResources.h"

static NSString *const AWSInfoAutoScaling = @"AutoScaling";
static NSString *const AWSAutoScalingSDKVersion = @"2.5.10";


@interface AWSAutoScalingResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSAutoScalingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AlreadyExists" : @(AWSAutoScalingErrorAlreadyExists),
                            @"InvalidNextToken" : @(AWSAutoScalingErrorInvalidNextToken),
                            @"LimitExceeded" : @(AWSAutoScalingErrorLimitExceeded),
                            @"ResourceContention" : @(AWSAutoScalingErrorResourceContention),
                            @"ResourceInUse" : @(AWSAutoScalingErrorResourceInUse),
                            @"ScalingActivityInProgress" : @(AWSAutoScalingErrorScalingActivityInProgress),
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
                *error = [NSError errorWithDomain:AWSAutoScalingErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                         ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSAutoScalingErrorDomain
                                             code:AWSAutoScalingErrorUnknown
                                         userInfo:errorInfo];
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSAutoScalingErrorDomain
                                     code:AWSAutoScalingErrorUnknown
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

@interface AWSAutoScalingRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAutoScalingRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAutoScaling()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAutoScaling

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAutoScalingSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAutoScaling versions need to match. Check your SDK installation. AWSCore: %@ AWSAutoScaling: %@", AWSiOSSDKVersion, AWSAutoScalingSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAutoScaling {
    static AWSAutoScaling *_defaultAutoScaling = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAutoScaling];
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
        _defaultAutoScaling = [[AWSAutoScaling alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAutoScaling;
}

+ (void)registerAutoScalingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAutoScaling alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AutoScalingForKey:(NSString *)key {
    @synchronized(self) {
        AWSAutoScaling *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAutoScaling
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAutoScaling registerAutoScalingWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAutoScalingForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAutoScaling` or `+ AutoScalingForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAutoScaling
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAutoScaling];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAutoScalingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSAutoScalingResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAutoScalingResponseSerializer alloc] initWithJSONDefinition:[[AWSAutoScalingResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)attachInstances:(AWSAutoScalingAttachInstancesQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachInstances"
                   outputClass:nil];
}

- (void)attachInstances:(AWSAutoScalingAttachInstancesQuery *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self attachInstances:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingAttachLoadBalancerTargetGroupsResultType *> *)attachLoadBalancerTargetGroups:(AWSAutoScalingAttachLoadBalancerTargetGroupsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachLoadBalancerTargetGroups"
                   outputClass:[AWSAutoScalingAttachLoadBalancerTargetGroupsResultType class]];
}

- (void)attachLoadBalancerTargetGroups:(AWSAutoScalingAttachLoadBalancerTargetGroupsType *)request
     completionHandler:(void (^)(AWSAutoScalingAttachLoadBalancerTargetGroupsResultType *response, NSError *error))completionHandler {
    [[self attachLoadBalancerTargetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingAttachLoadBalancerTargetGroupsResultType *> * _Nonnull task) {
        AWSAutoScalingAttachLoadBalancerTargetGroupsResultType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingAttachLoadBalancersResultType *> *)attachLoadBalancers:(AWSAutoScalingAttachLoadBalancersType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachLoadBalancers"
                   outputClass:[AWSAutoScalingAttachLoadBalancersResultType class]];
}

- (void)attachLoadBalancers:(AWSAutoScalingAttachLoadBalancersType *)request
     completionHandler:(void (^)(AWSAutoScalingAttachLoadBalancersResultType *response, NSError *error))completionHandler {
    [[self attachLoadBalancers:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingAttachLoadBalancersResultType *> * _Nonnull task) {
        AWSAutoScalingAttachLoadBalancersResultType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingCompleteLifecycleActionAnswer *> *)completeLifecycleAction:(AWSAutoScalingCompleteLifecycleActionType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CompleteLifecycleAction"
                   outputClass:[AWSAutoScalingCompleteLifecycleActionAnswer class]];
}

- (void)completeLifecycleAction:(AWSAutoScalingCompleteLifecycleActionType *)request
     completionHandler:(void (^)(AWSAutoScalingCompleteLifecycleActionAnswer *response, NSError *error))completionHandler {
    [[self completeLifecycleAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingCompleteLifecycleActionAnswer *> * _Nonnull task) {
        AWSAutoScalingCompleteLifecycleActionAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createAutoScalingGroup:(AWSAutoScalingCreateAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateAutoScalingGroup"
                   outputClass:nil];
}

- (void)createAutoScalingGroup:(AWSAutoScalingCreateAutoScalingGroupType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createAutoScalingGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)createLaunchConfiguration:(AWSAutoScalingCreateLaunchConfigurationType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLaunchConfiguration"
                   outputClass:nil];
}

- (void)createLaunchConfiguration:(AWSAutoScalingCreateLaunchConfigurationType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createLaunchConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)createOrUpdateTags:(AWSAutoScalingCreateOrUpdateTagsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateOrUpdateTags"
                   outputClass:nil];
}

- (void)createOrUpdateTags:(AWSAutoScalingCreateOrUpdateTagsType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createOrUpdateTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAutoScalingGroup:(AWSAutoScalingDeleteAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteAutoScalingGroup"
                   outputClass:nil];
}

- (void)deleteAutoScalingGroup:(AWSAutoScalingDeleteAutoScalingGroupType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAutoScalingGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteLaunchConfiguration:(AWSAutoScalingLaunchConfigurationNameType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLaunchConfiguration"
                   outputClass:nil];
}

- (void)deleteLaunchConfiguration:(AWSAutoScalingLaunchConfigurationNameType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteLaunchConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDeleteLifecycleHookAnswer *> *)deleteLifecycleHook:(AWSAutoScalingDeleteLifecycleHookType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLifecycleHook"
                   outputClass:[AWSAutoScalingDeleteLifecycleHookAnswer class]];
}

- (void)deleteLifecycleHook:(AWSAutoScalingDeleteLifecycleHookType *)request
     completionHandler:(void (^)(AWSAutoScalingDeleteLifecycleHookAnswer *response, NSError *error))completionHandler {
    [[self deleteLifecycleHook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDeleteLifecycleHookAnswer *> * _Nonnull task) {
        AWSAutoScalingDeleteLifecycleHookAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteNotificationConfiguration:(AWSAutoScalingDeleteNotificationConfigurationType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNotificationConfiguration"
                   outputClass:nil];
}

- (void)deleteNotificationConfiguration:(AWSAutoScalingDeleteNotificationConfigurationType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteNotificationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deletePolicy:(AWSAutoScalingDeletePolicyType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePolicy"
                   outputClass:nil];
}

- (void)deletePolicy:(AWSAutoScalingDeletePolicyType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deletePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteScheduledAction:(AWSAutoScalingDeleteScheduledActionType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteScheduledAction"
                   outputClass:nil];
}

- (void)deleteScheduledAction:(AWSAutoScalingDeleteScheduledActionType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteScheduledAction:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteTags:(AWSAutoScalingDeleteTagsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTags"
                   outputClass:nil];
}

- (void)deleteTags:(AWSAutoScalingDeleteTagsType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDescribeAccountLimitsAnswer *> *)describeAccountLimits:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountLimits"
                   outputClass:[AWSAutoScalingDescribeAccountLimitsAnswer class]];
}

- (void)describeAccountLimits:(AWSRequest *)request
     completionHandler:(void (^)(AWSAutoScalingDescribeAccountLimitsAnswer *response, NSError *error))completionHandler {
    [[self describeAccountLimits:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDescribeAccountLimitsAnswer *> * _Nonnull task) {
        AWSAutoScalingDescribeAccountLimitsAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDescribeAdjustmentTypesAnswer *> *)describeAdjustmentTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAdjustmentTypes"
                   outputClass:[AWSAutoScalingDescribeAdjustmentTypesAnswer class]];
}

- (void)describeAdjustmentTypes:(AWSRequest *)request
     completionHandler:(void (^)(AWSAutoScalingDescribeAdjustmentTypesAnswer *response, NSError *error))completionHandler {
    [[self describeAdjustmentTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDescribeAdjustmentTypesAnswer *> * _Nonnull task) {
        AWSAutoScalingDescribeAdjustmentTypesAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingAutoScalingGroupsType *> *)describeAutoScalingGroups:(AWSAutoScalingAutoScalingGroupNamesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAutoScalingGroups"
                   outputClass:[AWSAutoScalingAutoScalingGroupsType class]];
}

- (void)describeAutoScalingGroups:(AWSAutoScalingAutoScalingGroupNamesType *)request
     completionHandler:(void (^)(AWSAutoScalingAutoScalingGroupsType *response, NSError *error))completionHandler {
    [[self describeAutoScalingGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingAutoScalingGroupsType *> * _Nonnull task) {
        AWSAutoScalingAutoScalingGroupsType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingAutoScalingInstancesType *> *)describeAutoScalingInstances:(AWSAutoScalingDescribeAutoScalingInstancesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAutoScalingInstances"
                   outputClass:[AWSAutoScalingAutoScalingInstancesType class]];
}

- (void)describeAutoScalingInstances:(AWSAutoScalingDescribeAutoScalingInstancesType *)request
     completionHandler:(void (^)(AWSAutoScalingAutoScalingInstancesType *response, NSError *error))completionHandler {
    [[self describeAutoScalingInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingAutoScalingInstancesType *> * _Nonnull task) {
        AWSAutoScalingAutoScalingInstancesType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer *> *)describeAutoScalingNotificationTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAutoScalingNotificationTypes"
                   outputClass:[AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer class]];
}

- (void)describeAutoScalingNotificationTypes:(AWSRequest *)request
     completionHandler:(void (^)(AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer *response, NSError *error))completionHandler {
    [[self describeAutoScalingNotificationTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer *> * _Nonnull task) {
        AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingLaunchConfigurationsType *> *)describeLaunchConfigurations:(AWSAutoScalingLaunchConfigurationNamesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLaunchConfigurations"
                   outputClass:[AWSAutoScalingLaunchConfigurationsType class]];
}

- (void)describeLaunchConfigurations:(AWSAutoScalingLaunchConfigurationNamesType *)request
     completionHandler:(void (^)(AWSAutoScalingLaunchConfigurationsType *response, NSError *error))completionHandler {
    [[self describeLaunchConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingLaunchConfigurationsType *> * _Nonnull task) {
        AWSAutoScalingLaunchConfigurationsType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDescribeLifecycleHookTypesAnswer *> *)describeLifecycleHookTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLifecycleHookTypes"
                   outputClass:[AWSAutoScalingDescribeLifecycleHookTypesAnswer class]];
}

- (void)describeLifecycleHookTypes:(AWSRequest *)request
     completionHandler:(void (^)(AWSAutoScalingDescribeLifecycleHookTypesAnswer *response, NSError *error))completionHandler {
    [[self describeLifecycleHookTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDescribeLifecycleHookTypesAnswer *> * _Nonnull task) {
        AWSAutoScalingDescribeLifecycleHookTypesAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDescribeLifecycleHooksAnswer *> *)describeLifecycleHooks:(AWSAutoScalingDescribeLifecycleHooksType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLifecycleHooks"
                   outputClass:[AWSAutoScalingDescribeLifecycleHooksAnswer class]];
}

- (void)describeLifecycleHooks:(AWSAutoScalingDescribeLifecycleHooksType *)request
     completionHandler:(void (^)(AWSAutoScalingDescribeLifecycleHooksAnswer *response, NSError *error))completionHandler {
    [[self describeLifecycleHooks:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDescribeLifecycleHooksAnswer *> * _Nonnull task) {
        AWSAutoScalingDescribeLifecycleHooksAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse *> *)describeLoadBalancerTargetGroups:(AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancerTargetGroups"
                   outputClass:[AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse class]];
}

- (void)describeLoadBalancerTargetGroups:(AWSAutoScalingDescribeLoadBalancerTargetGroupsRequest *)request
     completionHandler:(void (^)(AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse *response, NSError *error))completionHandler {
    [[self describeLoadBalancerTargetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse *> * _Nonnull task) {
        AWSAutoScalingDescribeLoadBalancerTargetGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDescribeLoadBalancersResponse *> *)describeLoadBalancers:(AWSAutoScalingDescribeLoadBalancersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLoadBalancers"
                   outputClass:[AWSAutoScalingDescribeLoadBalancersResponse class]];
}

- (void)describeLoadBalancers:(AWSAutoScalingDescribeLoadBalancersRequest *)request
     completionHandler:(void (^)(AWSAutoScalingDescribeLoadBalancersResponse *response, NSError *error))completionHandler {
    [[self describeLoadBalancers:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDescribeLoadBalancersResponse *> * _Nonnull task) {
        AWSAutoScalingDescribeLoadBalancersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDescribeMetricCollectionTypesAnswer *> *)describeMetricCollectionTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeMetricCollectionTypes"
                   outputClass:[AWSAutoScalingDescribeMetricCollectionTypesAnswer class]];
}

- (void)describeMetricCollectionTypes:(AWSRequest *)request
     completionHandler:(void (^)(AWSAutoScalingDescribeMetricCollectionTypesAnswer *response, NSError *error))completionHandler {
    [[self describeMetricCollectionTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDescribeMetricCollectionTypesAnswer *> * _Nonnull task) {
        AWSAutoScalingDescribeMetricCollectionTypesAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDescribeNotificationConfigurationsAnswer *> *)describeNotificationConfigurations:(AWSAutoScalingDescribeNotificationConfigurationsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNotificationConfigurations"
                   outputClass:[AWSAutoScalingDescribeNotificationConfigurationsAnswer class]];
}

- (void)describeNotificationConfigurations:(AWSAutoScalingDescribeNotificationConfigurationsType *)request
     completionHandler:(void (^)(AWSAutoScalingDescribeNotificationConfigurationsAnswer *response, NSError *error))completionHandler {
    [[self describeNotificationConfigurations:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDescribeNotificationConfigurationsAnswer *> * _Nonnull task) {
        AWSAutoScalingDescribeNotificationConfigurationsAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingPoliciesType *> *)describePolicies:(AWSAutoScalingDescribePoliciesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePolicies"
                   outputClass:[AWSAutoScalingPoliciesType class]];
}

- (void)describePolicies:(AWSAutoScalingDescribePoliciesType *)request
     completionHandler:(void (^)(AWSAutoScalingPoliciesType *response, NSError *error))completionHandler {
    [[self describePolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingPoliciesType *> * _Nonnull task) {
        AWSAutoScalingPoliciesType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingActivitiesType *> *)describeScalingActivities:(AWSAutoScalingDescribeScalingActivitiesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScalingActivities"
                   outputClass:[AWSAutoScalingActivitiesType class]];
}

- (void)describeScalingActivities:(AWSAutoScalingDescribeScalingActivitiesType *)request
     completionHandler:(void (^)(AWSAutoScalingActivitiesType *response, NSError *error))completionHandler {
    [[self describeScalingActivities:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingActivitiesType *> * _Nonnull task) {
        AWSAutoScalingActivitiesType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingProcessesType *> *)describeScalingProcessTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScalingProcessTypes"
                   outputClass:[AWSAutoScalingProcessesType class]];
}

- (void)describeScalingProcessTypes:(AWSRequest *)request
     completionHandler:(void (^)(AWSAutoScalingProcessesType *response, NSError *error))completionHandler {
    [[self describeScalingProcessTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingProcessesType *> * _Nonnull task) {
        AWSAutoScalingProcessesType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingScheduledActionsType *> *)describeScheduledActions:(AWSAutoScalingDescribeScheduledActionsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScheduledActions"
                   outputClass:[AWSAutoScalingScheduledActionsType class]];
}

- (void)describeScheduledActions:(AWSAutoScalingDescribeScheduledActionsType *)request
     completionHandler:(void (^)(AWSAutoScalingScheduledActionsType *response, NSError *error))completionHandler {
    [[self describeScheduledActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingScheduledActionsType *> * _Nonnull task) {
        AWSAutoScalingScheduledActionsType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingTagsType *> *)describeTags:(AWSAutoScalingDescribeTagsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSAutoScalingTagsType class]];
}

- (void)describeTags:(AWSAutoScalingDescribeTagsType *)request
     completionHandler:(void (^)(AWSAutoScalingTagsType *response, NSError *error))completionHandler {
    [[self describeTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingTagsType *> * _Nonnull task) {
        AWSAutoScalingTagsType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDescribeTerminationPolicyTypesAnswer *> *)describeTerminationPolicyTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTerminationPolicyTypes"
                   outputClass:[AWSAutoScalingDescribeTerminationPolicyTypesAnswer class]];
}

- (void)describeTerminationPolicyTypes:(AWSRequest *)request
     completionHandler:(void (^)(AWSAutoScalingDescribeTerminationPolicyTypesAnswer *response, NSError *error))completionHandler {
    [[self describeTerminationPolicyTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDescribeTerminationPolicyTypesAnswer *> * _Nonnull task) {
        AWSAutoScalingDescribeTerminationPolicyTypesAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDetachInstancesAnswer *> *)detachInstances:(AWSAutoScalingDetachInstancesQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachInstances"
                   outputClass:[AWSAutoScalingDetachInstancesAnswer class]];
}

- (void)detachInstances:(AWSAutoScalingDetachInstancesQuery *)request
     completionHandler:(void (^)(AWSAutoScalingDetachInstancesAnswer *response, NSError *error))completionHandler {
    [[self detachInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDetachInstancesAnswer *> * _Nonnull task) {
        AWSAutoScalingDetachInstancesAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDetachLoadBalancerTargetGroupsResultType *> *)detachLoadBalancerTargetGroups:(AWSAutoScalingDetachLoadBalancerTargetGroupsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachLoadBalancerTargetGroups"
                   outputClass:[AWSAutoScalingDetachLoadBalancerTargetGroupsResultType class]];
}

- (void)detachLoadBalancerTargetGroups:(AWSAutoScalingDetachLoadBalancerTargetGroupsType *)request
     completionHandler:(void (^)(AWSAutoScalingDetachLoadBalancerTargetGroupsResultType *response, NSError *error))completionHandler {
    [[self detachLoadBalancerTargetGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDetachLoadBalancerTargetGroupsResultType *> * _Nonnull task) {
        AWSAutoScalingDetachLoadBalancerTargetGroupsResultType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingDetachLoadBalancersResultType *> *)detachLoadBalancers:(AWSAutoScalingDetachLoadBalancersType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachLoadBalancers"
                   outputClass:[AWSAutoScalingDetachLoadBalancersResultType class]];
}

- (void)detachLoadBalancers:(AWSAutoScalingDetachLoadBalancersType *)request
     completionHandler:(void (^)(AWSAutoScalingDetachLoadBalancersResultType *response, NSError *error))completionHandler {
    [[self detachLoadBalancers:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingDetachLoadBalancersResultType *> * _Nonnull task) {
        AWSAutoScalingDetachLoadBalancersResultType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disableMetricsCollection:(AWSAutoScalingDisableMetricsCollectionQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableMetricsCollection"
                   outputClass:nil];
}

- (void)disableMetricsCollection:(AWSAutoScalingDisableMetricsCollectionQuery *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disableMetricsCollection:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)enableMetricsCollection:(AWSAutoScalingEnableMetricsCollectionQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableMetricsCollection"
                   outputClass:nil];
}

- (void)enableMetricsCollection:(AWSAutoScalingEnableMetricsCollectionQuery *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self enableMetricsCollection:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingEnterStandbyAnswer *> *)enterStandby:(AWSAutoScalingEnterStandbyQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnterStandby"
                   outputClass:[AWSAutoScalingEnterStandbyAnswer class]];
}

- (void)enterStandby:(AWSAutoScalingEnterStandbyQuery *)request
     completionHandler:(void (^)(AWSAutoScalingEnterStandbyAnswer *response, NSError *error))completionHandler {
    [[self enterStandby:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingEnterStandbyAnswer *> * _Nonnull task) {
        AWSAutoScalingEnterStandbyAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)executePolicy:(AWSAutoScalingExecutePolicyType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ExecutePolicy"
                   outputClass:nil];
}

- (void)executePolicy:(AWSAutoScalingExecutePolicyType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self executePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingExitStandbyAnswer *> *)exitStandby:(AWSAutoScalingExitStandbyQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ExitStandby"
                   outputClass:[AWSAutoScalingExitStandbyAnswer class]];
}

- (void)exitStandby:(AWSAutoScalingExitStandbyQuery *)request
     completionHandler:(void (^)(AWSAutoScalingExitStandbyAnswer *response, NSError *error))completionHandler {
    [[self exitStandby:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingExitStandbyAnswer *> * _Nonnull task) {
        AWSAutoScalingExitStandbyAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingPutLifecycleHookAnswer *> *)putLifecycleHook:(AWSAutoScalingPutLifecycleHookType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutLifecycleHook"
                   outputClass:[AWSAutoScalingPutLifecycleHookAnswer class]];
}

- (void)putLifecycleHook:(AWSAutoScalingPutLifecycleHookType *)request
     completionHandler:(void (^)(AWSAutoScalingPutLifecycleHookAnswer *response, NSError *error))completionHandler {
    [[self putLifecycleHook:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingPutLifecycleHookAnswer *> * _Nonnull task) {
        AWSAutoScalingPutLifecycleHookAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putNotificationConfiguration:(AWSAutoScalingPutNotificationConfigurationType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutNotificationConfiguration"
                   outputClass:nil];
}

- (void)putNotificationConfiguration:(AWSAutoScalingPutNotificationConfigurationType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putNotificationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingPolicyARNType *> *)putScalingPolicy:(AWSAutoScalingPutScalingPolicyType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutScalingPolicy"
                   outputClass:[AWSAutoScalingPolicyARNType class]];
}

- (void)putScalingPolicy:(AWSAutoScalingPutScalingPolicyType *)request
     completionHandler:(void (^)(AWSAutoScalingPolicyARNType *response, NSError *error))completionHandler {
    [[self putScalingPolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingPolicyARNType *> * _Nonnull task) {
        AWSAutoScalingPolicyARNType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putScheduledUpdateGroupAction:(AWSAutoScalingPutScheduledUpdateGroupActionType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutScheduledUpdateGroupAction"
                   outputClass:nil];
}

- (void)putScheduledUpdateGroupAction:(AWSAutoScalingPutScheduledUpdateGroupActionType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putScheduledUpdateGroupAction:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingRecordLifecycleActionHeartbeatAnswer *> *)recordLifecycleActionHeartbeat:(AWSAutoScalingRecordLifecycleActionHeartbeatType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RecordLifecycleActionHeartbeat"
                   outputClass:[AWSAutoScalingRecordLifecycleActionHeartbeatAnswer class]];
}

- (void)recordLifecycleActionHeartbeat:(AWSAutoScalingRecordLifecycleActionHeartbeatType *)request
     completionHandler:(void (^)(AWSAutoScalingRecordLifecycleActionHeartbeatAnswer *response, NSError *error))completionHandler {
    [[self recordLifecycleActionHeartbeat:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingRecordLifecycleActionHeartbeatAnswer *> * _Nonnull task) {
        AWSAutoScalingRecordLifecycleActionHeartbeatAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)resumeProcesses:(AWSAutoScalingScalingProcessQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResumeProcesses"
                   outputClass:nil];
}

- (void)resumeProcesses:(AWSAutoScalingScalingProcessQuery *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self resumeProcesses:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)setDesiredCapacity:(AWSAutoScalingSetDesiredCapacityType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetDesiredCapacity"
                   outputClass:nil];
}

- (void)setDesiredCapacity:(AWSAutoScalingSetDesiredCapacityType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setDesiredCapacity:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)setInstanceHealth:(AWSAutoScalingSetInstanceHealthQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetInstanceHealth"
                   outputClass:nil];
}

- (void)setInstanceHealth:(AWSAutoScalingSetInstanceHealthQuery *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setInstanceHealth:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingSetInstanceProtectionAnswer *> *)setInstanceProtection:(AWSAutoScalingSetInstanceProtectionQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetInstanceProtection"
                   outputClass:[AWSAutoScalingSetInstanceProtectionAnswer class]];
}

- (void)setInstanceProtection:(AWSAutoScalingSetInstanceProtectionQuery *)request
     completionHandler:(void (^)(AWSAutoScalingSetInstanceProtectionAnswer *response, NSError *error))completionHandler {
    [[self setInstanceProtection:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingSetInstanceProtectionAnswer *> * _Nonnull task) {
        AWSAutoScalingSetInstanceProtectionAnswer *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)suspendProcesses:(AWSAutoScalingScalingProcessQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SuspendProcesses"
                   outputClass:nil];
}

- (void)suspendProcesses:(AWSAutoScalingScalingProcessQuery *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self suspendProcesses:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAutoScalingActivityType *> *)terminateInstanceInAutoScalingGroup:(AWSAutoScalingTerminateInstanceInAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TerminateInstanceInAutoScalingGroup"
                   outputClass:[AWSAutoScalingActivityType class]];
}

- (void)terminateInstanceInAutoScalingGroup:(AWSAutoScalingTerminateInstanceInAutoScalingGroupType *)request
     completionHandler:(void (^)(AWSAutoScalingActivityType *response, NSError *error))completionHandler {
    [[self terminateInstanceInAutoScalingGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAutoScalingActivityType *> * _Nonnull task) {
        AWSAutoScalingActivityType *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateAutoScalingGroup:(AWSAutoScalingUpdateAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateAutoScalingGroup"
                   outputClass:nil];
}

- (void)updateAutoScalingGroup:(AWSAutoScalingUpdateAutoScalingGroupType *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateAutoScalingGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
