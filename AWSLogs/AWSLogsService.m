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

#import "AWSLogsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSLogsResources.h"

static NSString *const AWSInfoLogs = @"Logs";
NSString *const AWSLogsSDKVersion = @"2.13.2";


@interface AWSLogsResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSLogsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"DataAlreadyAcceptedException" : @(AWSLogsErrorDataAlreadyAccepted),
                            @"InvalidOperationException" : @(AWSLogsErrorInvalidOperation),
                            @"InvalidParameterException" : @(AWSLogsErrorInvalidParameter),
                            @"InvalidSequenceTokenException" : @(AWSLogsErrorInvalidSequenceToken),
                            @"LimitExceededException" : @(AWSLogsErrorLimitExceeded),
                            @"MalformedQueryException" : @(AWSLogsErrorMalformedQuery),
                            @"OperationAbortedException" : @(AWSLogsErrorOperationAborted),
                            @"ResourceAlreadyExistsException" : @(AWSLogsErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSLogsErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSLogsErrorServiceUnavailable),
                            @"UnrecognizedClientException" : @(AWSLogsErrorUnrecognizedClient),
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
	                *error = [NSError errorWithDomain:AWSLogsErrorDomain
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
        *error = [NSError errorWithDomain:AWSLogsErrorDomain
                                     code:AWSLogsErrorUnknown
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

@interface AWSLogsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSLogsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSLogs()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSLogs

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSLogsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSLogs versions need to match. Check your SDK installation. AWSCore: %@ AWSLogs: %@", AWSiOSSDKVersion, AWSLogsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultLogs {
    static AWSLogs *_defaultLogs = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoLogs];
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
        _defaultLogs = [[AWSLogs alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultLogs;
}

+ (void)registerLogsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSLogs alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)LogsForKey:(NSString *)key {
    @synchronized(self) {
        AWSLogs *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoLogs
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSLogs registerLogsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeLogsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultLogs` or `+ LogsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceLogs
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceLogs];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSLogsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSLogsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSLogsResponseSerializer alloc] initWithJSONDefinition:[[AWSLogsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)associateKmsKey:(AWSLogsAssociateKmsKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"AssociateKmsKey"
                   outputClass:nil];
}

- (void)associateKmsKey:(AWSLogsAssociateKmsKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self associateKmsKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)cancelExportTask:(AWSLogsCancelExportTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"CancelExportTask"
                   outputClass:nil];
}

- (void)cancelExportTask:(AWSLogsCancelExportTaskRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self cancelExportTask:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsCreateExportTaskResponse *> *)createExportTask:(AWSLogsCreateExportTaskRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"CreateExportTask"
                   outputClass:[AWSLogsCreateExportTaskResponse class]];
}

- (void)createExportTask:(AWSLogsCreateExportTaskRequest *)request
     completionHandler:(void (^)(AWSLogsCreateExportTaskResponse *response, NSError *error))completionHandler {
    [[self createExportTask:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsCreateExportTaskResponse *> * _Nonnull task) {
        AWSLogsCreateExportTaskResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createLogGroup:(AWSLogsCreateLogGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"CreateLogGroup"
                   outputClass:nil];
}

- (void)createLogGroup:(AWSLogsCreateLogGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createLogGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)createLogStream:(AWSLogsCreateLogStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"CreateLogStream"
                   outputClass:nil];
}

- (void)createLogStream:(AWSLogsCreateLogStreamRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createLogStream:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDestination:(AWSLogsDeleteDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DeleteDestination"
                   outputClass:nil];
}

- (void)deleteDestination:(AWSLogsDeleteDestinationRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDestination:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteLogGroup:(AWSLogsDeleteLogGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DeleteLogGroup"
                   outputClass:nil];
}

- (void)deleteLogGroup:(AWSLogsDeleteLogGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteLogGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteLogStream:(AWSLogsDeleteLogStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DeleteLogStream"
                   outputClass:nil];
}

- (void)deleteLogStream:(AWSLogsDeleteLogStreamRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteLogStream:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteMetricFilter:(AWSLogsDeleteMetricFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DeleteMetricFilter"
                   outputClass:nil];
}

- (void)deleteMetricFilter:(AWSLogsDeleteMetricFilterRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteMetricFilter:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteResourcePolicy:(AWSLogsDeleteResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DeleteResourcePolicy"
                   outputClass:nil];
}

- (void)deleteResourcePolicy:(AWSLogsDeleteResourcePolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRetentionPolicy:(AWSLogsDeleteRetentionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DeleteRetentionPolicy"
                   outputClass:nil];
}

- (void)deleteRetentionPolicy:(AWSLogsDeleteRetentionPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRetentionPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSubscriptionFilter:(AWSLogsDeleteSubscriptionFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DeleteSubscriptionFilter"
                   outputClass:nil];
}

- (void)deleteSubscriptionFilter:(AWSLogsDeleteSubscriptionFilterRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSubscriptionFilter:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsDescribeDestinationsResponse *> *)describeDestinations:(AWSLogsDescribeDestinationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DescribeDestinations"
                   outputClass:[AWSLogsDescribeDestinationsResponse class]];
}

- (void)describeDestinations:(AWSLogsDescribeDestinationsRequest *)request
     completionHandler:(void (^)(AWSLogsDescribeDestinationsResponse *response, NSError *error))completionHandler {
    [[self describeDestinations:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsDescribeDestinationsResponse *> * _Nonnull task) {
        AWSLogsDescribeDestinationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsDescribeExportTasksResponse *> *)describeExportTasks:(AWSLogsDescribeExportTasksRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DescribeExportTasks"
                   outputClass:[AWSLogsDescribeExportTasksResponse class]];
}

- (void)describeExportTasks:(AWSLogsDescribeExportTasksRequest *)request
     completionHandler:(void (^)(AWSLogsDescribeExportTasksResponse *response, NSError *error))completionHandler {
    [[self describeExportTasks:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsDescribeExportTasksResponse *> * _Nonnull task) {
        AWSLogsDescribeExportTasksResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsDescribeLogGroupsResponse *> *)describeLogGroups:(AWSLogsDescribeLogGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DescribeLogGroups"
                   outputClass:[AWSLogsDescribeLogGroupsResponse class]];
}

- (void)describeLogGroups:(AWSLogsDescribeLogGroupsRequest *)request
     completionHandler:(void (^)(AWSLogsDescribeLogGroupsResponse *response, NSError *error))completionHandler {
    [[self describeLogGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsDescribeLogGroupsResponse *> * _Nonnull task) {
        AWSLogsDescribeLogGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsDescribeLogStreamsResponse *> *)describeLogStreams:(AWSLogsDescribeLogStreamsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DescribeLogStreams"
                   outputClass:[AWSLogsDescribeLogStreamsResponse class]];
}

- (void)describeLogStreams:(AWSLogsDescribeLogStreamsRequest *)request
     completionHandler:(void (^)(AWSLogsDescribeLogStreamsResponse *response, NSError *error))completionHandler {
    [[self describeLogStreams:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsDescribeLogStreamsResponse *> * _Nonnull task) {
        AWSLogsDescribeLogStreamsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsDescribeMetricFiltersResponse *> *)describeMetricFilters:(AWSLogsDescribeMetricFiltersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DescribeMetricFilters"
                   outputClass:[AWSLogsDescribeMetricFiltersResponse class]];
}

- (void)describeMetricFilters:(AWSLogsDescribeMetricFiltersRequest *)request
     completionHandler:(void (^)(AWSLogsDescribeMetricFiltersResponse *response, NSError *error))completionHandler {
    [[self describeMetricFilters:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsDescribeMetricFiltersResponse *> * _Nonnull task) {
        AWSLogsDescribeMetricFiltersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsDescribeQueriesResponse *> *)describeQueries:(AWSLogsDescribeQueriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DescribeQueries"
                   outputClass:[AWSLogsDescribeQueriesResponse class]];
}

- (void)describeQueries:(AWSLogsDescribeQueriesRequest *)request
     completionHandler:(void (^)(AWSLogsDescribeQueriesResponse *response, NSError *error))completionHandler {
    [[self describeQueries:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsDescribeQueriesResponse *> * _Nonnull task) {
        AWSLogsDescribeQueriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsDescribeResourcePoliciesResponse *> *)describeResourcePolicies:(AWSLogsDescribeResourcePoliciesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DescribeResourcePolicies"
                   outputClass:[AWSLogsDescribeResourcePoliciesResponse class]];
}

- (void)describeResourcePolicies:(AWSLogsDescribeResourcePoliciesRequest *)request
     completionHandler:(void (^)(AWSLogsDescribeResourcePoliciesResponse *response, NSError *error))completionHandler {
    [[self describeResourcePolicies:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsDescribeResourcePoliciesResponse *> * _Nonnull task) {
        AWSLogsDescribeResourcePoliciesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsDescribeSubscriptionFiltersResponse *> *)describeSubscriptionFilters:(AWSLogsDescribeSubscriptionFiltersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DescribeSubscriptionFilters"
                   outputClass:[AWSLogsDescribeSubscriptionFiltersResponse class]];
}

- (void)describeSubscriptionFilters:(AWSLogsDescribeSubscriptionFiltersRequest *)request
     completionHandler:(void (^)(AWSLogsDescribeSubscriptionFiltersResponse *response, NSError *error))completionHandler {
    [[self describeSubscriptionFilters:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsDescribeSubscriptionFiltersResponse *> * _Nonnull task) {
        AWSLogsDescribeSubscriptionFiltersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)disassociateKmsKey:(AWSLogsDisassociateKmsKeyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"DisassociateKmsKey"
                   outputClass:nil];
}

- (void)disassociateKmsKey:(AWSLogsDisassociateKmsKeyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self disassociateKmsKey:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsFilterLogEventsResponse *> *)filterLogEvents:(AWSLogsFilterLogEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"FilterLogEvents"
                   outputClass:[AWSLogsFilterLogEventsResponse class]];
}

- (void)filterLogEvents:(AWSLogsFilterLogEventsRequest *)request
     completionHandler:(void (^)(AWSLogsFilterLogEventsResponse *response, NSError *error))completionHandler {
    [[self filterLogEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsFilterLogEventsResponse *> * _Nonnull task) {
        AWSLogsFilterLogEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsGetLogEventsResponse *> *)getLogEvents:(AWSLogsGetLogEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"GetLogEvents"
                   outputClass:[AWSLogsGetLogEventsResponse class]];
}

- (void)getLogEvents:(AWSLogsGetLogEventsRequest *)request
     completionHandler:(void (^)(AWSLogsGetLogEventsResponse *response, NSError *error))completionHandler {
    [[self getLogEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsGetLogEventsResponse *> * _Nonnull task) {
        AWSLogsGetLogEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsGetLogGroupFieldsResponse *> *)getLogGroupFields:(AWSLogsGetLogGroupFieldsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"GetLogGroupFields"
                   outputClass:[AWSLogsGetLogGroupFieldsResponse class]];
}

- (void)getLogGroupFields:(AWSLogsGetLogGroupFieldsRequest *)request
     completionHandler:(void (^)(AWSLogsGetLogGroupFieldsResponse *response, NSError *error))completionHandler {
    [[self getLogGroupFields:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsGetLogGroupFieldsResponse *> * _Nonnull task) {
        AWSLogsGetLogGroupFieldsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsGetLogRecordResponse *> *)getLogRecord:(AWSLogsGetLogRecordRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"GetLogRecord"
                   outputClass:[AWSLogsGetLogRecordResponse class]];
}

- (void)getLogRecord:(AWSLogsGetLogRecordRequest *)request
     completionHandler:(void (^)(AWSLogsGetLogRecordResponse *response, NSError *error))completionHandler {
    [[self getLogRecord:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsGetLogRecordResponse *> * _Nonnull task) {
        AWSLogsGetLogRecordResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsGetQueryResultsResponse *> *)getQueryResults:(AWSLogsGetQueryResultsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"GetQueryResults"
                   outputClass:[AWSLogsGetQueryResultsResponse class]];
}

- (void)getQueryResults:(AWSLogsGetQueryResultsRequest *)request
     completionHandler:(void (^)(AWSLogsGetQueryResultsResponse *response, NSError *error))completionHandler {
    [[self getQueryResults:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsGetQueryResultsResponse *> * _Nonnull task) {
        AWSLogsGetQueryResultsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsListTagsLogGroupResponse *> *)listTagsLogGroup:(AWSLogsListTagsLogGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"ListTagsLogGroup"
                   outputClass:[AWSLogsListTagsLogGroupResponse class]];
}

- (void)listTagsLogGroup:(AWSLogsListTagsLogGroupRequest *)request
     completionHandler:(void (^)(AWSLogsListTagsLogGroupResponse *response, NSError *error))completionHandler {
    [[self listTagsLogGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsListTagsLogGroupResponse *> * _Nonnull task) {
        AWSLogsListTagsLogGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsPutDestinationResponse *> *)putDestination:(AWSLogsPutDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"PutDestination"
                   outputClass:[AWSLogsPutDestinationResponse class]];
}

- (void)putDestination:(AWSLogsPutDestinationRequest *)request
     completionHandler:(void (^)(AWSLogsPutDestinationResponse *response, NSError *error))completionHandler {
    [[self putDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsPutDestinationResponse *> * _Nonnull task) {
        AWSLogsPutDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putDestinationPolicy:(AWSLogsPutDestinationPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"PutDestinationPolicy"
                   outputClass:nil];
}

- (void)putDestinationPolicy:(AWSLogsPutDestinationPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putDestinationPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsPutLogEventsResponse *> *)putLogEvents:(AWSLogsPutLogEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"PutLogEvents"
                   outputClass:[AWSLogsPutLogEventsResponse class]];
}

- (void)putLogEvents:(AWSLogsPutLogEventsRequest *)request
     completionHandler:(void (^)(AWSLogsPutLogEventsResponse *response, NSError *error))completionHandler {
    [[self putLogEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsPutLogEventsResponse *> * _Nonnull task) {
        AWSLogsPutLogEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putMetricFilter:(AWSLogsPutMetricFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"PutMetricFilter"
                   outputClass:nil];
}

- (void)putMetricFilter:(AWSLogsPutMetricFilterRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putMetricFilter:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsPutResourcePolicyResponse *> *)putResourcePolicy:(AWSLogsPutResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"PutResourcePolicy"
                   outputClass:[AWSLogsPutResourcePolicyResponse class]];
}

- (void)putResourcePolicy:(AWSLogsPutResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSLogsPutResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self putResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsPutResourcePolicyResponse *> * _Nonnull task) {
        AWSLogsPutResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putRetentionPolicy:(AWSLogsPutRetentionPolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"PutRetentionPolicy"
                   outputClass:nil];
}

- (void)putRetentionPolicy:(AWSLogsPutRetentionPolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putRetentionPolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)putSubscriptionFilter:(AWSLogsPutSubscriptionFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"PutSubscriptionFilter"
                   outputClass:nil];
}

- (void)putSubscriptionFilter:(AWSLogsPutSubscriptionFilterRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putSubscriptionFilter:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsStartQueryResponse *> *)startQuery:(AWSLogsStartQueryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"StartQuery"
                   outputClass:[AWSLogsStartQueryResponse class]];
}

- (void)startQuery:(AWSLogsStartQueryRequest *)request
     completionHandler:(void (^)(AWSLogsStartQueryResponse *response, NSError *error))completionHandler {
    [[self startQuery:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsStartQueryResponse *> * _Nonnull task) {
        AWSLogsStartQueryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsStopQueryResponse *> *)stopQuery:(AWSLogsStopQueryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"StopQuery"
                   outputClass:[AWSLogsStopQueryResponse class]];
}

- (void)stopQuery:(AWSLogsStopQueryRequest *)request
     completionHandler:(void (^)(AWSLogsStopQueryResponse *response, NSError *error))completionHandler {
    [[self stopQuery:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsStopQueryResponse *> * _Nonnull task) {
        AWSLogsStopQueryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagLogGroup:(AWSLogsTagLogGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"TagLogGroup"
                   outputClass:nil];
}

- (void)tagLogGroup:(AWSLogsTagLogGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagLogGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSLogsTestMetricFilterResponse *> *)testMetricFilter:(AWSLogsTestMetricFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"TestMetricFilter"
                   outputClass:[AWSLogsTestMetricFilterResponse class]];
}

- (void)testMetricFilter:(AWSLogsTestMetricFilterRequest *)request
     completionHandler:(void (^)(AWSLogsTestMetricFilterResponse *response, NSError *error))completionHandler {
    [[self testMetricFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSLogsTestMetricFilterResponse *> * _Nonnull task) {
        AWSLogsTestMetricFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)untagLogGroup:(AWSLogsUntagLogGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Logs_20140328"
                 operationName:@"UntagLogGroup"
                   outputClass:nil];
}

- (void)untagLogGroup:(AWSLogsUntagLogGroupRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagLogGroup:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
