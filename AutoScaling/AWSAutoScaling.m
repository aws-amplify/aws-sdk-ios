/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "AWSAutoScaling.h"

#import "AZNetworking.h"
#import "AZCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"

NSString *const AWSAutoScalingDefinitionFileName = @"autoscaling-2011-01-01";


@interface AWSAutoScalingResponseSerializer : AWSXMLResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

@end

@implementation AWSAutoScalingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSAutoScalingErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSAutoScalingErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSAutoScalingErrorMissingAuthenticationToken),
                            @"AlreadyExistsFault" : @(AWSAutoScalingErrorAlreadyExists),
                            @"InvalidNextToken" : @(AWSAutoScalingErrorInvalidNextToken),
                            @"LimitExceededFault" : @(AWSAutoScalingErrorLimitExceeded),
                            @"ResourceInUseFault" : @(AWSAutoScalingErrorResourceInUse),
                            @"ScalingActivityInProgressFault" : @(AWSAutoScalingErrorScalingActivityInProgress),
                            };
}

#pragma mark -

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSAutoScalingResponseSerializer *serializer = [AWSAutoScalingResponseSerializer serializerWithResource:resource
                                                                                                 actionName:actionName];
    serializer.outputClass = outputClass;

    return serializer;
}

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
                                         userInfo:@{NSLocalizedDescriptionKey :[errorInfo objectForKey:@"Message"]?[errorInfo objectForKey:@"Message"]:[NSNull null]}
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSAutoScalingErrorDomain
                                             code:AWSAutoScalingErrorUnknown
                                         userInfo:@{NSLocalizedDescriptionKey : [NSString stringWithFormat:@"%@ -- %@",[errorInfo objectForKey:@"Code"],[errorInfo objectForKey:@"Message"]?[errorInfo objectForKey:@"Message"]:[NSNull null]]
                                                    }];
                return responseObject;
            }
        }
        

        if (self.outputClass) {
            responseObject = [MTLJSONAdapter modelOfClass:self.outputClass
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

- (AZNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                            response:(NSHTTPURLResponse *)response
                                data:(NSData *)data
                               error:(NSError *)error {
    AZNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                response:response
                                                    data:data
                                                   error:error];
    if(retryType == AZNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSAutoScalingErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        switch (error.code) {
            case AWSAutoScalingErrorIncompleteSignature:
            case AWSAutoScalingErrorInvalidClientTokenId:
            case AWSAutoScalingErrorMissingAuthenticationToken:
                retryType = AZNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                break;

            default:
                break;
        }
    }

    return retryType;
}

@end

@interface AWSRequest()

@property (nonatomic, strong) AZNetworkingRequest *internalRequest;

@end

@interface AWSAutoScaling()

@property (nonatomic, strong) AZNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSAutoScaling

+ (instancetype)defaultAutoScaling {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSAutoScaling *_defaultAutoScaling = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultAutoScaling = [[AWSAutoScaling alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultAutoScaling;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                            service:AWSServiceAutoScaling];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_endpoint];

        _configuration.baseURL = _endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSAutoScalingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Host" : _endpoint.hostName};

        _networking = [AZNetworking networking:_configuration];
    }

    return self;
}

- (BFTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AZHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    if (!request) {
        request = [AWSRequest new];
    }

    AZNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[MTLJSONAdapter JSONDictionaryFromModel:request] az_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }
    networkingRequest.HTTPMethod = HTTPMethod;

    AWSQueryStringRequestSerializer *requestSerializer = [AWSQueryStringRequestSerializer serializerWithResource:AWSAutoScalingDefinitionFileName actionName:operationName];
    
    networkingRequest.requestSerializer = requestSerializer;

    networkingRequest.responseSerializer = [AWSAutoScalingResponseSerializer serializerWithOutputClass:outputClass
                                                                                              resource:AWSAutoScalingDefinitionFileName
                                                                                            actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)attachInstances:(AWSAutoScalingAttachInstancesQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AttachInstances"
                   outputClass:nil];
}

- (BFTask *)createAutoScalingGroup:(AWSAutoScalingCreateAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateAutoScalingGroup"
                   outputClass:nil];
}

- (BFTask *)createLaunchConfiguration:(AWSAutoScalingCreateLaunchConfigurationType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateLaunchConfiguration"
                   outputClass:nil];
}

- (BFTask *)createOrUpdateTags:(AWSAutoScalingCreateOrUpdateTagsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateOrUpdateTags"
                   outputClass:nil];
}

- (BFTask *)deleteAutoScalingGroup:(AWSAutoScalingDeleteAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteAutoScalingGroup"
                   outputClass:nil];
}

- (BFTask *)deleteLaunchConfiguration:(AWSAutoScalingLaunchConfigurationNameType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteLaunchConfiguration"
                   outputClass:nil];
}

- (BFTask *)deleteNotificationConfiguration:(AWSAutoScalingDeleteNotificationConfigurationType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteNotificationConfiguration"
                   outputClass:nil];
}

- (BFTask *)deletePolicy:(AWSAutoScalingDeletePolicyType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeletePolicy"
                   outputClass:nil];
}

- (BFTask *)deleteScheduledAction:(AWSAutoScalingDeleteScheduledActionType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteScheduledAction"
                   outputClass:nil];
}

- (BFTask *)deleteTags:(AWSAutoScalingDeleteTagsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteTags"
                   outputClass:nil];
}

- (BFTask *)describeAccountLimits:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAccountLimits"
                   outputClass:[AWSAutoScalingDescribeAccountLimitsAnswer class]];
}

- (BFTask *)describeAdjustmentTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAdjustmentTypes"
                   outputClass:[AWSAutoScalingDescribeAdjustmentTypesAnswer class]];
}

- (BFTask *)describeAutoScalingGroups:(AWSAutoScalingAutoScalingGroupNamesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAutoScalingGroups"
                   outputClass:[AWSAutoScalingAutoScalingGroupsType class]];
}

- (BFTask *)describeAutoScalingInstances:(AWSAutoScalingDescribeAutoScalingInstancesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAutoScalingInstances"
                   outputClass:[AWSAutoScalingAutoScalingInstancesType class]];
}

- (BFTask *)describeAutoScalingNotificationTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAutoScalingNotificationTypes"
                   outputClass:[AWSAutoScalingDescribeAutoScalingNotificationTypesAnswer class]];
}

- (BFTask *)describeLaunchConfigurations:(AWSAutoScalingLaunchConfigurationNamesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeLaunchConfigurations"
                   outputClass:[AWSAutoScalingLaunchConfigurationsType class]];
}

- (BFTask *)describeMetricCollectionTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeMetricCollectionTypes"
                   outputClass:[AWSAutoScalingDescribeMetricCollectionTypesAnswer class]];
}

- (BFTask *)describeNotificationConfigurations:(AWSAutoScalingDescribeNotificationConfigurationsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeNotificationConfigurations"
                   outputClass:[AWSAutoScalingDescribeNotificationConfigurationsAnswer class]];
}

- (BFTask *)describePolicies:(AWSAutoScalingDescribePoliciesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribePolicies"
                   outputClass:[AWSAutoScalingPoliciesType class]];
}

- (BFTask *)describeScalingActivities:(AWSAutoScalingDescribeScalingActivitiesType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScalingActivities"
                   outputClass:[AWSAutoScalingActivitiesType class]];
}

- (BFTask *)describeScalingProcessTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScalingProcessTypes"
                   outputClass:[AWSAutoScalingProcessesType class]];
}

- (BFTask *)describeScheduledActions:(AWSAutoScalingDescribeScheduledActionsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeScheduledActions"
                   outputClass:[AWSAutoScalingScheduledActionsType class]];
}

- (BFTask *)describeTags:(AWSAutoScalingDescribeTagsType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTags"
                   outputClass:[AWSAutoScalingTagsType class]];
}

- (BFTask *)describeTerminationPolicyTypes:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeTerminationPolicyTypes"
                   outputClass:[AWSAutoScalingDescribeTerminationPolicyTypesAnswer class]];
}

- (BFTask *)disableMetricsCollection:(AWSAutoScalingDisableMetricsCollectionQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableMetricsCollection"
                   outputClass:nil];
}

- (BFTask *)enableMetricsCollection:(AWSAutoScalingEnableMetricsCollectionQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableMetricsCollection"
                   outputClass:nil];
}

- (BFTask *)executePolicy:(AWSAutoScalingExecutePolicyType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ExecutePolicy"
                   outputClass:nil];
}

- (BFTask *)putNotificationConfiguration:(AWSAutoScalingPutNotificationConfigurationType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutNotificationConfiguration"
                   outputClass:nil];
}

- (BFTask *)putScalingPolicy:(AWSAutoScalingPutScalingPolicyType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutScalingPolicy"
                   outputClass:[AWSAutoScalingPolicyARNType class]];
}

- (BFTask *)putScheduledUpdateGroupAction:(AWSAutoScalingPutScheduledUpdateGroupActionType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutScheduledUpdateGroupAction"
                   outputClass:nil];
}

- (BFTask *)resumeProcesses:(AWSAutoScalingScalingProcessQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ResumeProcesses"
                   outputClass:nil];
}

- (BFTask *)setDesiredCapacity:(AWSAutoScalingSetDesiredCapacityType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetDesiredCapacity"
                   outputClass:nil];
}

- (BFTask *)setInstanceHealth:(AWSAutoScalingSetInstanceHealthQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetInstanceHealth"
                   outputClass:nil];
}

- (BFTask *)suspendProcesses:(AWSAutoScalingScalingProcessQuery *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SuspendProcesses"
                   outputClass:nil];
}

- (BFTask *)terminateInstanceInAutoScalingGroup:(AWSAutoScalingTerminateInstanceInAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"TerminateInstanceInAutoScalingGroup"
                   outputClass:[AWSAutoScalingActivityType class]];
}

- (BFTask *)updateAutoScalingGroup:(AWSAutoScalingUpdateAutoScalingGroupType *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"UpdateAutoScalingGroup"
                   outputClass:nil];
}

@end