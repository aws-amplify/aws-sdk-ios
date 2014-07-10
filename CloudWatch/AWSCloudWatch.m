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

#import "AWSCloudWatch.h"

#import "AZNetworking.h"
#import "AZCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"

@interface AWSCloudWatchResponseSerializer : AWSXMLResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

@end

@implementation AWSCloudWatchResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSCloudWatchErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSCloudWatchErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSCloudWatchErrorMissingAuthenticationToken),
                            @"InternalServiceFault" : @(AWSCloudWatchErrorInternalService),
                            @"InvalidFormatFault" : @(AWSCloudWatchErrorInvalidFormat),
                            @"InvalidNextToken" : @(AWSCloudWatchErrorInvalidNextToken),
                            @"InvalidParameterCombinationException" : @(AWSCloudWatchErrorInvalidParameterCombination),
                            @"InvalidParameterValueException" : @(AWSCloudWatchErrorInvalidParameterValue),
                            @"LimitExceededFault" : @(AWSCloudWatchErrorLimitExceeded),
                            @"MissingRequiredParameterException" : @(AWSCloudWatchErrorMissingRequiredParameter),
                            @"ResourceNotFound" : @(AWSCloudWatchErrorResourceNotFound),
                            };
}

#pragma mark -

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSCloudWatchResponseSerializer *serializer = [AWSCloudWatchResponseSerializer serializerWithResource:resource
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
                *error = [NSError errorWithDomain:AWSCloudWatchErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:@{NSLocalizedDescriptionKey :[errorInfo objectForKey:@"Message"]?[errorInfo objectForKey:@"Message"]:[NSNull null]}
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSCloudWatchErrorDomain
                                             code:AWSCloudWatchErrorUnknown
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

@interface AWSCloudWatchRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCloudWatchRequestRetryHandler

- (AZNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                            response:(NSHTTPURLResponse *)response
                                data:(NSData *)data
                               error:(NSError *)error {
    AZNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                response:response
                                                    data:data
                                                   error:error];
    if(retryType == AZNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSCloudWatchErrorDomain]) {
        switch (error.code) {
            case AWSCloudWatchErrorIncompleteSignature:
            case AWSCloudWatchErrorInvalidClientTokenId:
            case AWSCloudWatchErrorMissingAuthenticationToken:
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

@interface AWSCloudWatch()

@property (nonatomic, strong) AZNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSCloudWatch

+ (instancetype)defaultCloudWatch {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSCloudWatch *_defaultCloudWatch = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultCloudWatch = [[AWSCloudWatch alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultCloudWatch;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                            service:AWSServiceCloudWatch];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_endpoint];

        _configuration.baseURL = _endpoint.URL;
        _configuration.requestSerializer = [AWSJSONRequestSerializer new];
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSURLRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

    AWSQueryStringRequestSerializer *requestSerializer = [AWSQueryStringRequestSerializer new];
    requestSerializer.additionalParameters = @{@"Action" : operationName,
                                               @"Version" : @"2010-08-01"};
    networkingRequest.requestSerializer = requestSerializer;

    networkingRequest.responseSerializer = [AWSCloudWatchResponseSerializer serializerWithOutputClass:outputClass
                                                                                             resource:@"monitoring-2010-08-01"
                                                                                           actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)deleteAlarms:(AWSCloudWatchDeleteAlarmsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteAlarms"
                   outputClass:nil];
}

- (BFTask *)describeAlarmHistory:(AWSCloudWatchDescribeAlarmHistoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAlarmHistory"
                   outputClass:[AWSCloudWatchDescribeAlarmHistoryOutput class]];
}

- (BFTask *)describeAlarms:(AWSCloudWatchDescribeAlarmsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAlarms"
                   outputClass:[AWSCloudWatchDescribeAlarmsOutput class]];
}

- (BFTask *)describeAlarmsForMetric:(AWSCloudWatchDescribeAlarmsForMetricInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAlarmsForMetric"
                   outputClass:[AWSCloudWatchDescribeAlarmsForMetricOutput class]];
}

- (BFTask *)disableAlarmActions:(AWSCloudWatchDisableAlarmActionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableAlarmActions"
                   outputClass:nil];
}

- (BFTask *)enableAlarmActions:(AWSCloudWatchEnableAlarmActionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableAlarmActions"
                   outputClass:nil];
}

- (BFTask *)getMetricStatistics:(AWSCloudWatchGetMetricStatisticsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetMetricStatistics"
                   outputClass:[AWSCloudWatchGetMetricStatisticsOutput class]];
}

- (BFTask *)listMetrics:(AWSCloudWatchListMetricsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListMetrics"
                   outputClass:[AWSCloudWatchListMetricsOutput class]];
}

- (BFTask *)putMetricAlarm:(AWSCloudWatchPutMetricAlarmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutMetricAlarm"
                   outputClass:nil];
}

- (BFTask *)putMetricData:(AWSCloudWatchPutMetricDataInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutMetricData"
                   outputClass:nil];
}

- (BFTask *)setAlarmState:(AWSCloudWatchSetAlarmStateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetAlarmState"
                   outputClass:nil];
}

@end
