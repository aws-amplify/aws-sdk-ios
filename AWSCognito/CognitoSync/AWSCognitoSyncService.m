//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSCognitoSyncService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSCognitoSyncResources.h"

static NSString *const AWSInfoCognitoSync = @"CognitoSync";
static NSString *const AWSCognitoSyncSDKVersion = @"2.4.11";


@interface AWSCognitoSyncResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSCognitoSyncResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AlreadyStreamedException" : @(AWSCognitoSyncErrorAlreadyStreamed),
                            @"ConcurrentModificationException" : @(AWSCognitoSyncErrorConcurrentModification),
                            @"DuplicateRequestException" : @(AWSCognitoSyncErrorDuplicateRequest),
                            @"InternalErrorException" : @(AWSCognitoSyncErrorInternalError),
                            @"InvalidConfigurationException" : @(AWSCognitoSyncErrorInvalidConfiguration),
                            @"InvalidLambdaFunctionOutputException" : @(AWSCognitoSyncErrorInvalidLambdaFunctionOutput),
                            @"InvalidParameterException" : @(AWSCognitoSyncErrorInvalidParameter),
                            @"LambdaThrottledException" : @(AWSCognitoSyncErrorLambdaThrottled),
                            @"LimitExceededException" : @(AWSCognitoSyncErrorLimitExceeded),
                            @"NotAuthorizedException" : @(AWSCognitoSyncErrorNotAuthorized),
                            @"ResourceConflictException" : @(AWSCognitoSyncErrorResourceConflict),
                            @"ResourceNotFoundException" : @(AWSCognitoSyncErrorResourceNotFound),
                            @"TooManyRequestsException" : @(AWSCognitoSyncErrorTooManyRequests),
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
    	NSString *errorTypeString = [[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"];
        NSString *errorTypeHeader = [[errorTypeString componentsSeparatedByString:@":"] firstObject];

        if ([errorTypeString length] > 0 && errorTypeHeader) {
            if (errorCodeDictionary[errorTypeHeader]) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSCognitoSyncErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSCognitoSyncErrorDomain
                                                 code:AWSCognitoSyncErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSCognitoSyncErrorDomain
                                     code:AWSCognitoSyncErrorUnknown
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

@interface AWSCognitoSyncRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSCognitoSyncRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSCognitoSync()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSCognitoSync


#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultCognitoSync {
    static AWSCognitoSync *_defaultCognitoSync = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoCognitoSync];
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
        _defaultCognitoSync = [[AWSCognitoSync alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultCognitoSync;
}

+ (void)registerCognitoSyncWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSCognitoSync alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)CognitoSyncForKey:(NSString *)key {
    @synchronized(self) {
        AWSCognitoSync *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoCognitoSync
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSCognitoSync registerCognitoSyncWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeCognitoSyncForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultCognitoSync` or `+ CognitoSyncForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceCognitoSync
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceCognitoSync];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSCognitoSyncRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSCognitoSyncResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSCognitoSyncResponseSerializer alloc] initWithJSONDefinition:[[AWSCognitoSyncResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSCognitoSyncBulkPublishResponse *> *)bulkPublish:(AWSCognitoSyncBulkPublishRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/identitypools/{IdentityPoolId}/bulkpublish"
                  targetPrefix:@""
                 operationName:@"BulkPublish"
                   outputClass:[AWSCognitoSyncBulkPublishResponse class]];
}

- (void)bulkPublish:(AWSCognitoSyncBulkPublishRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncBulkPublishResponse *response, NSError *error))completionHandler {
    [[self bulkPublish:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncBulkPublishResponse *> * _Nonnull task) {
        AWSCognitoSyncBulkPublishResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncDeleteDatasetResponse *> *)deleteDataset:(AWSCognitoSyncDeleteDatasetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}"
                  targetPrefix:@""
                 operationName:@"DeleteDataset"
                   outputClass:[AWSCognitoSyncDeleteDatasetResponse class]];
}

- (void)deleteDataset:(AWSCognitoSyncDeleteDatasetRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncDeleteDatasetResponse *response, NSError *error))completionHandler {
    [[self deleteDataset:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncDeleteDatasetResponse *> * _Nonnull task) {
        AWSCognitoSyncDeleteDatasetResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncDescribeDatasetResponse *> *)describeDataset:(AWSCognitoSyncDescribeDatasetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}"
                  targetPrefix:@""
                 operationName:@"DescribeDataset"
                   outputClass:[AWSCognitoSyncDescribeDatasetResponse class]];
}

- (void)describeDataset:(AWSCognitoSyncDescribeDatasetRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncDescribeDatasetResponse *response, NSError *error))completionHandler {
    [[self describeDataset:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncDescribeDatasetResponse *> * _Nonnull task) {
        AWSCognitoSyncDescribeDatasetResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncDescribeIdentityPoolUsageResponse *> *)describeIdentityPoolUsage:(AWSCognitoSyncDescribeIdentityPoolUsageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/identitypools/{IdentityPoolId}"
                  targetPrefix:@""
                 operationName:@"DescribeIdentityPoolUsage"
                   outputClass:[AWSCognitoSyncDescribeIdentityPoolUsageResponse class]];
}

- (void)describeIdentityPoolUsage:(AWSCognitoSyncDescribeIdentityPoolUsageRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncDescribeIdentityPoolUsageResponse *response, NSError *error))completionHandler {
    [[self describeIdentityPoolUsage:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncDescribeIdentityPoolUsageResponse *> * _Nonnull task) {
        AWSCognitoSyncDescribeIdentityPoolUsageResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncDescribeIdentityUsageResponse *> *)describeIdentityUsage:(AWSCognitoSyncDescribeIdentityUsageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/identitypools/{IdentityPoolId}/identities/{IdentityId}"
                  targetPrefix:@""
                 operationName:@"DescribeIdentityUsage"
                   outputClass:[AWSCognitoSyncDescribeIdentityUsageResponse class]];
}

- (void)describeIdentityUsage:(AWSCognitoSyncDescribeIdentityUsageRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncDescribeIdentityUsageResponse *response, NSError *error))completionHandler {
    [[self describeIdentityUsage:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncDescribeIdentityUsageResponse *> * _Nonnull task) {
        AWSCognitoSyncDescribeIdentityUsageResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncGetBulkPublishDetailsResponse *> *)getBulkPublishDetails:(AWSCognitoSyncGetBulkPublishDetailsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/identitypools/{IdentityPoolId}/getBulkPublishDetails"
                  targetPrefix:@""
                 operationName:@"GetBulkPublishDetails"
                   outputClass:[AWSCognitoSyncGetBulkPublishDetailsResponse class]];
}

- (void)getBulkPublishDetails:(AWSCognitoSyncGetBulkPublishDetailsRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncGetBulkPublishDetailsResponse *response, NSError *error))completionHandler {
    [[self getBulkPublishDetails:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncGetBulkPublishDetailsResponse *> * _Nonnull task) {
        AWSCognitoSyncGetBulkPublishDetailsResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncGetCognitoEventsResponse *> *)getCognitoEvents:(AWSCognitoSyncGetCognitoEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/identitypools/{IdentityPoolId}/events"
                  targetPrefix:@""
                 operationName:@"GetCognitoEvents"
                   outputClass:[AWSCognitoSyncGetCognitoEventsResponse class]];
}

- (void)getCognitoEvents:(AWSCognitoSyncGetCognitoEventsRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncGetCognitoEventsResponse *response, NSError *error))completionHandler {
    [[self getCognitoEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncGetCognitoEventsResponse *> * _Nonnull task) {
        AWSCognitoSyncGetCognitoEventsResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncGetIdentityPoolConfigurationResponse *> *)getIdentityPoolConfiguration:(AWSCognitoSyncGetIdentityPoolConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/identitypools/{IdentityPoolId}/configuration"
                  targetPrefix:@""
                 operationName:@"GetIdentityPoolConfiguration"
                   outputClass:[AWSCognitoSyncGetIdentityPoolConfigurationResponse class]];
}

- (void)getIdentityPoolConfiguration:(AWSCognitoSyncGetIdentityPoolConfigurationRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncGetIdentityPoolConfigurationResponse *response, NSError *error))completionHandler {
    [[self getIdentityPoolConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncGetIdentityPoolConfigurationResponse *> * _Nonnull task) {
        AWSCognitoSyncGetIdentityPoolConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncListDatasetsResponse *> *)listDatasets:(AWSCognitoSyncListDatasetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets"
                  targetPrefix:@""
                 operationName:@"ListDatasets"
                   outputClass:[AWSCognitoSyncListDatasetsResponse class]];
}

- (void)listDatasets:(AWSCognitoSyncListDatasetsRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncListDatasetsResponse *response, NSError *error))completionHandler {
    [[self listDatasets:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncListDatasetsResponse *> * _Nonnull task) {
        AWSCognitoSyncListDatasetsResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncListIdentityPoolUsageResponse *> *)listIdentityPoolUsage:(AWSCognitoSyncListIdentityPoolUsageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/identitypools"
                  targetPrefix:@""
                 operationName:@"ListIdentityPoolUsage"
                   outputClass:[AWSCognitoSyncListIdentityPoolUsageResponse class]];
}

- (void)listIdentityPoolUsage:(AWSCognitoSyncListIdentityPoolUsageRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncListIdentityPoolUsageResponse *response, NSError *error))completionHandler {
    [[self listIdentityPoolUsage:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncListIdentityPoolUsageResponse *> * _Nonnull task) {
        AWSCognitoSyncListIdentityPoolUsageResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncListRecordsResponse *> *)listRecords:(AWSCognitoSyncListRecordsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}/records"
                  targetPrefix:@""
                 operationName:@"ListRecords"
                   outputClass:[AWSCognitoSyncListRecordsResponse class]];
}

- (void)listRecords:(AWSCognitoSyncListRecordsRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncListRecordsResponse *response, NSError *error))completionHandler {
    [[self listRecords:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncListRecordsResponse *> * _Nonnull task) {
        AWSCognitoSyncListRecordsResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncRegisterDeviceResponse *> *)registerDevice:(AWSCognitoSyncRegisterDeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/identitypools/{IdentityPoolId}/identity/{IdentityId}/device"
                  targetPrefix:@""
                 operationName:@"RegisterDevice"
                   outputClass:[AWSCognitoSyncRegisterDeviceResponse class]];
}

- (void)registerDevice:(AWSCognitoSyncRegisterDeviceRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncRegisterDeviceResponse *response, NSError *error))completionHandler {
    [[self registerDevice:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncRegisterDeviceResponse *> * _Nonnull task) {
        AWSCognitoSyncRegisterDeviceResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)setCognitoEvents:(AWSCognitoSyncSetCognitoEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/identitypools/{IdentityPoolId}/events"
                  targetPrefix:@""
                 operationName:@"SetCognitoEvents"
                   outputClass:nil];
}

- (void)setCognitoEvents:(AWSCognitoSyncSetCognitoEventsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self setCognitoEvents:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncSetIdentityPoolConfigurationResponse *> *)setIdentityPoolConfiguration:(AWSCognitoSyncSetIdentityPoolConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/identitypools/{IdentityPoolId}/configuration"
                  targetPrefix:@""
                 operationName:@"SetIdentityPoolConfiguration"
                   outputClass:[AWSCognitoSyncSetIdentityPoolConfigurationResponse class]];
}

- (void)setIdentityPoolConfiguration:(AWSCognitoSyncSetIdentityPoolConfigurationRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncSetIdentityPoolConfigurationResponse *response, NSError *error))completionHandler {
    [[self setIdentityPoolConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncSetIdentityPoolConfigurationResponse *> * _Nonnull task) {
        AWSCognitoSyncSetIdentityPoolConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncSubscribeToDatasetResponse *> *)subscribeToDataset:(AWSCognitoSyncSubscribeToDatasetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}/subscriptions/{DeviceId}"
                  targetPrefix:@""
                 operationName:@"SubscribeToDataset"
                   outputClass:[AWSCognitoSyncSubscribeToDatasetResponse class]];
}

- (void)subscribeToDataset:(AWSCognitoSyncSubscribeToDatasetRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncSubscribeToDatasetResponse *response, NSError *error))completionHandler {
    [[self subscribeToDataset:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncSubscribeToDatasetResponse *> * _Nonnull task) {
        AWSCognitoSyncSubscribeToDatasetResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncUnsubscribeFromDatasetResponse *> *)unsubscribeFromDataset:(AWSCognitoSyncUnsubscribeFromDatasetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}/subscriptions/{DeviceId}"
                  targetPrefix:@""
                 operationName:@"UnsubscribeFromDataset"
                   outputClass:[AWSCognitoSyncUnsubscribeFromDatasetResponse class]];
}

- (void)unsubscribeFromDataset:(AWSCognitoSyncUnsubscribeFromDatasetRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncUnsubscribeFromDatasetResponse *response, NSError *error))completionHandler {
    [[self unsubscribeFromDataset:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncUnsubscribeFromDatasetResponse *> * _Nonnull task) {
        AWSCognitoSyncUnsubscribeFromDatasetResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSCognitoSyncUpdateRecordsResponse *> *)updateRecords:(AWSCognitoSyncUpdateRecordsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/identitypools/{IdentityPoolId}/identities/{IdentityId}/datasets/{DatasetName}"
                  targetPrefix:@""
                 operationName:@"UpdateRecords"
                   outputClass:[AWSCognitoSyncUpdateRecordsResponse class]];
}

- (void)updateRecords:(AWSCognitoSyncUpdateRecordsRequest *)request
     completionHandler:(void (^)(AWSCognitoSyncUpdateRecordsResponse *response, NSError *error))completionHandler {
    [[self updateRecords:request] continueWithBlock:^id _Nullable(AWSTask<AWSCognitoSyncUpdateRecordsResponse *> * _Nonnull task) {
        AWSCognitoSyncUpdateRecordsResponse *result = task.result;
        NSError *error = task.error;

        if (task.exception) {
            AWSLogError(@"Fatal exception: [%@]", task.exception);
            kill(getpid(), SIGKILL);
        }

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
