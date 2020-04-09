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

#import "AWSCloudWatchService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSCloudWatchResources.h"

static NSString *const AWSInfoCloudWatch = @"CloudWatch";
NSString *const AWSCloudWatchSDKVersion = @"2.13.2";


@interface AWSCloudWatchResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSCloudWatchResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InvalidParameterInput" : @(AWSCloudWatchErrorDashboardInvalidInput),
                            @"ResourceNotFound" : @(AWSCloudWatchErrorDashboardNotFound),
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
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSCloudWatchErrorDomain
                                     code:AWSCloudWatchErrorUnknown
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

@interface AWSCloudWatchRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCloudWatchRequestRetryHandler

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

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSCloudWatch

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSCloudWatchSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSCloudWatch versions need to match. Check your SDK installation. AWSCore: %@ AWSCloudWatch: %@", AWSiOSSDKVersion, AWSCloudWatchSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCloudWatch {
    static AWSCloudWatch *_defaultCloudWatch = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCloudWatch];
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
        _defaultCloudWatch = [[AWSCloudWatch alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCloudWatch;
}

+ (void)registerCloudWatchWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCloudWatch alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CloudWatchForKey:(NSString *)key {
    @synchronized(self) {
        AWSCloudWatch *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCloudWatch
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCloudWatch registerCloudWatchWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
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

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCloudWatch
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceCloudWatch];
        }
       	
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

- (void)deleteAlarms:(AWSCloudWatchDeleteAlarmsInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAlarms:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchDeleteDashboardsOutput *> *)deleteDashboards:(AWSCloudWatchDeleteDashboardsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDashboards"
                   outputClass:[AWSCloudWatchDeleteDashboardsOutput class]];
}

- (void)deleteDashboards:(AWSCloudWatchDeleteDashboardsInput *)request
     completionHandler:(void (^)(AWSCloudWatchDeleteDashboardsOutput *response, NSError *error))completionHandler {
    [[self deleteDashboards:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchDeleteDashboardsOutput *> * _Nonnull task) {
        AWSCloudWatchDeleteDashboardsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchDescribeAlarmHistoryOutput *> *)describeAlarmHistory:(AWSCloudWatchDescribeAlarmHistoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAlarmHistory"
                   outputClass:[AWSCloudWatchDescribeAlarmHistoryOutput class]];
}

- (void)describeAlarmHistory:(AWSCloudWatchDescribeAlarmHistoryInput *)request
     completionHandler:(void (^)(AWSCloudWatchDescribeAlarmHistoryOutput *response, NSError *error))completionHandler {
    [[self describeAlarmHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchDescribeAlarmHistoryOutput *> * _Nonnull task) {
        AWSCloudWatchDescribeAlarmHistoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchDescribeAlarmsOutput *> *)describeAlarms:(AWSCloudWatchDescribeAlarmsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAlarms"
                   outputClass:[AWSCloudWatchDescribeAlarmsOutput class]];
}

- (void)describeAlarms:(AWSCloudWatchDescribeAlarmsInput *)request
     completionHandler:(void (^)(AWSCloudWatchDescribeAlarmsOutput *response, NSError *error))completionHandler {
    [[self describeAlarms:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchDescribeAlarmsOutput *> * _Nonnull task) {
        AWSCloudWatchDescribeAlarmsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchDescribeAlarmsForMetricOutput *> *)describeAlarmsForMetric:(AWSCloudWatchDescribeAlarmsForMetricInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DescribeAlarmsForMetric"
                   outputClass:[AWSCloudWatchDescribeAlarmsForMetricOutput class]];
}

- (void)describeAlarmsForMetric:(AWSCloudWatchDescribeAlarmsForMetricInput *)request
     completionHandler:(void (^)(AWSCloudWatchDescribeAlarmsForMetricOutput *response, NSError *error))completionHandler {
    [[self describeAlarmsForMetric:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchDescribeAlarmsForMetricOutput *> * _Nonnull task) {
        AWSCloudWatchDescribeAlarmsForMetricOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disableAlarmActions:(AWSCloudWatchDisableAlarmActionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DisableAlarmActions"
                   outputClass:nil];
}

- (void)disableAlarmActions:(AWSCloudWatchDisableAlarmActionsInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disableAlarmActions:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)enableAlarmActions:(AWSCloudWatchEnableAlarmActionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"EnableAlarmActions"
                   outputClass:nil];
}

- (void)enableAlarmActions:(AWSCloudWatchEnableAlarmActionsInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self enableAlarmActions:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchGetDashboardOutput *> *)getDashboard:(AWSCloudWatchGetDashboardInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetDashboard"
                   outputClass:[AWSCloudWatchGetDashboardOutput class]];
}

- (void)getDashboard:(AWSCloudWatchGetDashboardInput *)request
     completionHandler:(void (^)(AWSCloudWatchGetDashboardOutput *response, NSError *error))completionHandler {
    [[self getDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchGetDashboardOutput *> * _Nonnull task) {
        AWSCloudWatchGetDashboardOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchGetMetricDataOutput *> *)getMetricData:(AWSCloudWatchGetMetricDataInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetMetricData"
                   outputClass:[AWSCloudWatchGetMetricDataOutput class]];
}

- (void)getMetricData:(AWSCloudWatchGetMetricDataInput *)request
     completionHandler:(void (^)(AWSCloudWatchGetMetricDataOutput *response, NSError *error))completionHandler {
    [[self getMetricData:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchGetMetricDataOutput *> * _Nonnull task) {
        AWSCloudWatchGetMetricDataOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchGetMetricStatisticsOutput *> *)getMetricStatistics:(AWSCloudWatchGetMetricStatisticsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetMetricStatistics"
                   outputClass:[AWSCloudWatchGetMetricStatisticsOutput class]];
}

- (void)getMetricStatistics:(AWSCloudWatchGetMetricStatisticsInput *)request
     completionHandler:(void (^)(AWSCloudWatchGetMetricStatisticsOutput *response, NSError *error))completionHandler {
    [[self getMetricStatistics:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchGetMetricStatisticsOutput *> * _Nonnull task) {
        AWSCloudWatchGetMetricStatisticsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchGetMetricWidgetImageOutput *> *)getMetricWidgetImage:(AWSCloudWatchGetMetricWidgetImageInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetMetricWidgetImage"
                   outputClass:[AWSCloudWatchGetMetricWidgetImageOutput class]];
}

- (void)getMetricWidgetImage:(AWSCloudWatchGetMetricWidgetImageInput *)request
     completionHandler:(void (^)(AWSCloudWatchGetMetricWidgetImageOutput *response, NSError *error))completionHandler {
    [[self getMetricWidgetImage:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchGetMetricWidgetImageOutput *> * _Nonnull task) {
        AWSCloudWatchGetMetricWidgetImageOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchListDashboardsOutput *> *)listDashboards:(AWSCloudWatchListDashboardsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListDashboards"
                   outputClass:[AWSCloudWatchListDashboardsOutput class]];
}

- (void)listDashboards:(AWSCloudWatchListDashboardsInput *)request
     completionHandler:(void (^)(AWSCloudWatchListDashboardsOutput *response, NSError *error))completionHandler {
    [[self listDashboards:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchListDashboardsOutput *> * _Nonnull task) {
        AWSCloudWatchListDashboardsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchListMetricsOutput *> *)listMetrics:(AWSCloudWatchListMetricsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListMetrics"
                   outputClass:[AWSCloudWatchListMetricsOutput class]];
}

- (void)listMetrics:(AWSCloudWatchListMetricsInput *)request
     completionHandler:(void (^)(AWSCloudWatchListMetricsOutput *response, NSError *error))completionHandler {
    [[self listMetrics:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchListMetricsOutput *> * _Nonnull task) {
        AWSCloudWatchListMetricsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCloudWatchPutDashboardOutput *> *)putDashboard:(AWSCloudWatchPutDashboardInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutDashboard"
                   outputClass:[AWSCloudWatchPutDashboardOutput class]];
}

- (void)putDashboard:(AWSCloudWatchPutDashboardInput *)request
     completionHandler:(void (^)(AWSCloudWatchPutDashboardOutput *response, NSError *error))completionHandler {
    [[self putDashboard:request] continueWithBlock:^id _Nullable(AWSTask<AWSCloudWatchPutDashboardOutput *> * _Nonnull task) {
        AWSCloudWatchPutDashboardOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putMetricAlarm:(AWSCloudWatchPutMetricAlarmInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutMetricAlarm"
                   outputClass:nil];
}

- (void)putMetricAlarm:(AWSCloudWatchPutMetricAlarmInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putMetricAlarm:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putMetricData:(AWSCloudWatchPutMetricDataInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutMetricData"
                   outputClass:nil];
}

- (void)putMetricData:(AWSCloudWatchPutMetricDataInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putMetricData:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)setAlarmState:(AWSCloudWatchSetAlarmStateInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetAlarmState"
                   outputClass:nil];
}

- (void)setAlarmState:(AWSCloudWatchSetAlarmStateInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setAlarmState:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
