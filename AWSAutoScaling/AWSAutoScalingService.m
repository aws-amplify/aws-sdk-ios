/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import "AWSAutoScaling.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSAutoScalingResources.h"

NSString *const AWSAutoScalingDefinitionFileName = @"autoscaling-2011-01-01";


@interface AWSAutoScalingResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSAutoScalingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSAutoScalingErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSAutoScalingErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSAutoScalingErrorMissingAuthenticationToken),
                            @"AlreadyExists" : @(AWSAutoScalingErrorAlreadyExists),
                            @"InvalidNextToken" : @(AWSAutoScalingErrorInvalidNextToken),
                            @"LimitExceeded" : @(AWSAutoScalingErrorLimitExceeded),
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

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && currentRetryCount < self.maxRetryCount) {
        if ([error.domain isEqualToString:AWSAutoScalingErrorDomain]) {
            switch (error.code) {
                case AWSAutoScalingErrorIncompleteSignature:
                case AWSAutoScalingErrorInvalidClientTokenId:
                case AWSAutoScalingErrorMissingAuthenticationToken:
                    retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                    break;

                default:
                    break;
            }
        } else if ([error.domain isEqualToString:AWSGeneralErrorDomain]) {
            switch (error.code) {
                case AWSGeneralErrorSignatureDoesNotMatch:
                    retryType = AWSNetworkingRetryTypeShouldCorrectClockSkewAndRetry;
                    break;

                default:
                    break;
            }
        }
    }

    return retryType;
}

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

@implementation AWSAutoScaling

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAutoScaling {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"`defaultServiceConfiguration` is `nil`. You need to set it before using this method."
                                     userInfo:nil];
    }

    static AWSAutoScaling *_defaultAutoScaling = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultAutoScaling = [[AWSAutoScaling alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultAutoScaling;
}

+ (void)registerAutoScalingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSAutoScaling alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)AutoScalingForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
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

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAutoScaling
                                                         useUnsafeURL:NO];

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

- (AWSTask *)completeLifecycleAction:(AWSAutoScalingCompleteLifecycleActionType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CompleteLifecycleAction"
                   outputClass:[AWSAutoScalingCompleteLifecycleActionAnswer class]];
}

- (AWSTask *)createAutoScalingGroup:(AWSAutoScalingCreateAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateAutoScalingGroup"
                   outputClass:nil];
}

- (AWSTask *)createLaunchConfiguration:(AWSAutoScalingCreateLaunchConfigurationType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLaunchConfiguration"
                   outputClass:nil];
}

- (AWSTask *)createOrUpdateTags:(AWSAutoScalingCreateOrUpdateTagsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateOrUpdateTags"
                   outputClass:nil];
}

- (AWSTask *)deleteAutoScalingGroup:(AWSAutoScalingDeleteAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteAutoScalingGroup"
                   outputClass:nil];
}

- (AWSTask *)deleteLaunchConfiguration:(AWSAutoScalingLaunchConfigurationNameType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLaunchConfiguration"
                   outputClass:nil];
}

- (AWSTask *)deleteLifecycleHook:(AWSAutoScalingDeleteLifecycleHookType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLifecycleHook"
                   outputClass:[AWSAutoScalingDeleteLifecycleHookAnswer class]];
}

- (AWSTask *)deleteNotificationConfiguration:(AWSAutoScalingDeleteNotificationConfigurationType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNotificationConfiguration"
                   outputClass:nil];
}

- (AWSTask *)deletePolicy:(AWSAutoScalingDeletePolicyType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePolicy"
                   outputClass:nil];
}

- (AWSTask *)deleteScheduledAction:(AWSAutoScalingDeleteScheduledActionType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteScheduledAction"
                   outputClass:nil];
}

- (AWSTask *)deleteTags:(AWSAutoScalingDeleteTagsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTags"
                   outputClass:nil];
}

- (AWSTask *)describeAccountLimits:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountLimits"
                   outputClass:[AWSAutoScalingDescribeAccountLimitsAnswer class]];
}

- (AWSTask *)describeAdjustmentTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAdjustmentTypes"
                   outputClass:[AWSAutoScalingDescribeAdjustmentTypesAnswer class]];
}

- (AWSTask *)describeAutoScalingGroups:(AWSAutoScalingAutoScalingGroupNamesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAutoScalingGroups"
                   outputClass:[AWSAutoScalingAutoScalingGroupsType class]];
}

- (AWSTask *)describeAutoScalingInstances:(AWSAutoScalingDescribeAutoScalingInstancesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAutoScalingInstances"
                   outputClass:[AWSAutoScalingAutoScalingInstancesType class]];
}

- (AWSTask *)describeAutoScalingNotificationTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAutoScalingNotificationTypes"
                   outputClass:[AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer class]];
}

- (AWSTask *)describeLaunchConfigurations:(AWSAutoScalingLaunchConfigurationNamesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLaunchConfigurations"
                   outputClass:[AWSAutoScalingLaunchConfigurationsType class]];
}

- (AWSTask *)describeLifecycleHookTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLifecycleHookTypes"
                   outputClass:[AWSAutoScalingDescribeLifecycleHookTypesAnswer class]];
}

- (AWSTask *)describeLifecycleHooks:(AWSAutoScalingDescribeLifecycleHooksType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLifecycleHooks"
                   outputClass:[AWSAutoScalingDescribeLifecycleHooksAnswer class]];
}

- (AWSTask *)describeMetricCollectionTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeMetricCollectionTypes"
                   outputClass:[AWSAutoScalingDescribeMetricCollectionTypesAnswer class]];
}

- (AWSTask *)describeNotificationConfigurations:(AWSAutoScalingDescribeNotificationConfigurationsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNotificationConfigurations"
                   outputClass:[AWSAutoScalingDescribeNotificationConfigurationsAnswer class]];
}

- (AWSTask *)describePolicies:(AWSAutoScalingDescribePoliciesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePolicies"
                   outputClass:[AWSAutoScalingPoliciesType class]];
}

- (AWSTask *)describeScalingActivities:(AWSAutoScalingDescribeScalingActivitiesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScalingActivities"
                   outputClass:[AWSAutoScalingActivitiesType class]];
}

- (AWSTask *)describeScalingProcessTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScalingProcessTypes"
                   outputClass:[AWSAutoScalingProcessesType class]];
}

- (AWSTask *)describeScheduledActions:(AWSAutoScalingDescribeScheduledActionsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScheduledActions"
                   outputClass:[AWSAutoScalingScheduledActionsType class]];
}

- (AWSTask *)describeTags:(AWSAutoScalingDescribeTagsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSAutoScalingTagsType class]];
}

- (AWSTask *)describeTerminationPolicyTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTerminationPolicyTypes"
                   outputClass:[AWSAutoScalingDescribeTerminationPolicyTypesAnswer class]];
}

- (AWSTask *)detachInstances:(AWSAutoScalingDetachInstancesQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DetachInstances"
                   outputClass:[AWSAutoScalingDetachInstancesAnswer class]];
}

- (AWSTask *)disableMetricsCollection:(AWSAutoScalingDisableMetricsCollectionQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableMetricsCollection"
                   outputClass:nil];
}

- (AWSTask *)enableMetricsCollection:(AWSAutoScalingEnableMetricsCollectionQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableMetricsCollection"
                   outputClass:nil];
}

- (AWSTask *)enterStandby:(AWSAutoScalingEnterStandbyQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnterStandby"
                   outputClass:[AWSAutoScalingEnterStandbyAnswer class]];
}

- (AWSTask *)executePolicy:(AWSAutoScalingExecutePolicyType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ExecutePolicy"
                   outputClass:nil];
}

- (AWSTask *)exitStandby:(AWSAutoScalingExitStandbyQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ExitStandby"
                   outputClass:[AWSAutoScalingExitStandbyAnswer class]];
}

- (AWSTask *)putLifecycleHook:(AWSAutoScalingPutLifecycleHookType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutLifecycleHook"
                   outputClass:[AWSAutoScalingPutLifecycleHookAnswer class]];
}

- (AWSTask *)putNotificationConfiguration:(AWSAutoScalingPutNotificationConfigurationType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutNotificationConfiguration"
                   outputClass:nil];
}

- (AWSTask *)putScalingPolicy:(AWSAutoScalingPutScalingPolicyType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutScalingPolicy"
                   outputClass:[AWSAutoScalingPolicyARNType class]];
}

- (AWSTask *)putScheduledUpdateGroupAction:(AWSAutoScalingPutScheduledUpdateGroupActionType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutScheduledUpdateGroupAction"
                   outputClass:nil];
}

- (AWSTask *)recordLifecycleActionHeartbeat:(AWSAutoScalingRecordLifecycleActionHeartbeatType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RecordLifecycleActionHeartbeat"
                   outputClass:[AWSAutoScalingRecordLifecycleActionHeartbeatAnswer class]];
}

- (AWSTask *)resumeProcesses:(AWSAutoScalingScalingProcessQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResumeProcesses"
                   outputClass:nil];
}

- (AWSTask *)setDesiredCapacity:(AWSAutoScalingSetDesiredCapacityType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetDesiredCapacity"
                   outputClass:nil];
}

- (AWSTask *)setInstanceHealth:(AWSAutoScalingSetInstanceHealthQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetInstanceHealth"
                   outputClass:nil];
}

- (AWSTask *)suspendProcesses:(AWSAutoScalingScalingProcessQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SuspendProcesses"
                   outputClass:nil];
}

- (AWSTask *)terminateInstanceInAutoScalingGroup:(AWSAutoScalingTerminateInstanceInAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TerminateInstanceInAutoScalingGroup"
                   outputClass:[AWSAutoScalingActivityType class]];
}

- (AWSTask *)updateAutoScalingGroup:(AWSAutoScalingUpdateAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateAutoScalingGroup"
                   outputClass:nil];
}

@end