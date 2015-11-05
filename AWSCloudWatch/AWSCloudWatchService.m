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

#import "AWSCloudWatch.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSCloudWatchResources.h"

NSString *const AWSCloudWatchDefinitionFileName = @"monitoring-2010-08-01";


@interface AWSCloudWatchResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSCloudWatchResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSCloudWatchErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSCloudWatchErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSCloudWatchErrorMissingAuthenticationToken),
                            @"InternalServiceError" : @(AWSCloudWatchErrorInternalService),
                            @"InvalidFormat" : @(AWSCloudWatchErrorInvalidFormat),
                            @"InvalidNextToken" : @(AWSCloudWatchErrorInvalidNextToken),
                            @"InvalidParameterCombination" : @(AWSCloudWatchErrorInvalidParameterCombination),
                            @"InvalidParameterValue" : @(AWSCloudWatchErrorInvalidParameterValue),
                            @"LimitExceeded" : @(AWSCloudWatchErrorLimitExceeded),
                            @"MissingParameter" : @(AWSCloudWatchErrorMissingRequiredParameter),
                            @"ResourceNotFound" : @(AWSCloudWatchErrorResourceNotFound),
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
                *error = [NSError errorWithDomain:AWSCloudWatchErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSCloudWatchErrorDomain
                                             code:AWSCloudWatchErrorUnknown
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

@interface AWSCloudWatchRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCloudWatchRequestRetryHandler

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
        if ([error.domain isEqualToString:AWSCloudWatchErrorDomain]) {
            switch (error.code) {
                case AWSCloudWatchErrorIncompleteSignature:
                case AWSCloudWatchErrorInvalidClientTokenId:
                case AWSCloudWatchErrorMissingAuthenticationToken:
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

@interface AWSCloudWatch()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSCloudWatch

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCloudWatch {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSCloudWatch *_defaultCloudWatch = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultCloudWatch = [[AWSCloudWatch alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultCloudWatch;
}

+ (void)registerCloudWatchWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSCloudWatch alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)CloudWatchForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeCloudWatchForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCloudWatch` or `+ CloudWatchForKey:` instead."
                                 userInfo:nil];
    return nil;
}


- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCloudWatch
                                                         useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSCloudWatchRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];

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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSCloudWatchResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSCloudWatchResponseSerializer alloc] initWithJSONDefinition:[[AWSCloudWatchResources sharedInstance] JSONObject]
                                                                                                    actionName:operationName
                                                                                                   outputClass:outputClass];
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)deleteAlarms:(AWSCloudWatchDeleteAlarmsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteAlarms"
                   outputClass:nil];
}

- (AWSTask *)describeAlarmHistory:(AWSCloudWatchDescribeAlarmHistoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAlarmHistory"
                   outputClass:[AWSCloudWatchDescribeAlarmHistoryOutput class]];
}

- (AWSTask *)describeAlarms:(AWSCloudWatchDescribeAlarmsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAlarms"
                   outputClass:[AWSCloudWatchDescribeAlarmsOutput class]];
}

- (AWSTask *)describeAlarmsForMetric:(AWSCloudWatchDescribeAlarmsForMetricInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAlarmsForMetric"
                   outputClass:[AWSCloudWatchDescribeAlarmsForMetricOutput class]];
}

- (AWSTask *)disableAlarmActions:(AWSCloudWatchDisableAlarmActionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableAlarmActions"
                   outputClass:nil];
}

- (AWSTask *)enableAlarmActions:(AWSCloudWatchEnableAlarmActionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableAlarmActions"
                   outputClass:nil];
}

- (AWSTask *)getMetricStatistics:(AWSCloudWatchGetMetricStatisticsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetMetricStatistics"
                   outputClass:[AWSCloudWatchGetMetricStatisticsOutput class]];
}

- (AWSTask *)listMetrics:(AWSCloudWatchListMetricsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListMetrics"
                   outputClass:[AWSCloudWatchListMetricsOutput class]];
}

- (AWSTask *)putMetricAlarm:(AWSCloudWatchPutMetricAlarmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutMetricAlarm"
                   outputClass:nil];
}

- (AWSTask *)putMetricData:(AWSCloudWatchPutMetricDataInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutMetricData"
                   outputClass:nil];
}

- (AWSTask *)setAlarmState:(AWSCloudWatchSetAlarmStateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetAlarmState"
                   outputClass:nil];
}

@end
