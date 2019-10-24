//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSDynamoDBService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSDynamoDBResources.h"
#import "AWSDynamoDBRequestRetryHandler.h"

static NSString *const AWSInfoDynamoDB = @"DynamoDB";
NSString *const AWSDynamoDBSDKVersion = @"2.12.1";


@interface AWSDynamoDBResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSDynamoDBResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BackupInUseException" : @(AWSDynamoDBErrorBackupInUse),
                            @"BackupNotFoundException" : @(AWSDynamoDBErrorBackupNotFound),
                            @"ConditionalCheckFailedException" : @(AWSDynamoDBErrorConditionalCheckFailed),
                            @"ContinuousBackupsUnavailableException" : @(AWSDynamoDBErrorContinuousBackupsUnavailable),
                            @"GlobalTableAlreadyExistsException" : @(AWSDynamoDBErrorGlobalTableAlreadyExists),
                            @"GlobalTableNotFoundException" : @(AWSDynamoDBErrorGlobalTableNotFound),
                            @"IdempotentParameterMismatchException" : @(AWSDynamoDBErrorIdempotentParameterMismatch),
                            @"IndexNotFoundException" : @(AWSDynamoDBErrorIndexNotFound),
                            @"InternalServerError" : @(AWSDynamoDBErrorInternalServer),
                            @"InvalidRestoreTimeException" : @(AWSDynamoDBErrorInvalidRestoreTime),
                            @"ItemCollectionSizeLimitExceededException" : @(AWSDynamoDBErrorItemCollectionSizeLimitExceeded),
                            @"LimitExceededException" : @(AWSDynamoDBErrorLimitExceeded),
                            @"PointInTimeRecoveryUnavailableException" : @(AWSDynamoDBErrorPointInTimeRecoveryUnavailable),
                            @"ProvisionedThroughputExceededException" : @(AWSDynamoDBErrorProvisionedThroughputExceeded),
                            @"ReplicaAlreadyExistsException" : @(AWSDynamoDBErrorReplicaAlreadyExists),
                            @"ReplicaNotFoundException" : @(AWSDynamoDBErrorReplicaNotFound),
                            @"RequestLimitExceeded" : @(AWSDynamoDBErrorRequestLimitExceeded),
                            @"ResourceInUseException" : @(AWSDynamoDBErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSDynamoDBErrorResourceNotFound),
                            @"TableAlreadyExistsException" : @(AWSDynamoDBErrorTableAlreadyExists),
                            @"TableInUseException" : @(AWSDynamoDBErrorTableInUse),
                            @"TableNotFoundException" : @(AWSDynamoDBErrorTableNotFound),
                            @"TransactionCanceledException" : @(AWSDynamoDBErrorTransactionCanceled),
                            @"TransactionConflictException" : @(AWSDynamoDBErrorTransactionConflict),
                            @"TransactionInProgressException" : @(AWSDynamoDBErrorTransactionInProgress),
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
	                *error = [NSError errorWithDomain:AWSDynamoDBErrorDomain
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
        *error = [NSError errorWithDomain:AWSDynamoDBErrorDomain
                                     code:AWSDynamoDBErrorUnknown
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


@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSDynamoDB()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSDynamoDB

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSDynamoDBSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSDynamoDB versions need to match. Check your SDK installation. AWSCore: %@ AWSDynamoDB: %@", AWSiOSSDKVersion, AWSDynamoDBSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultDynamoDB {
    static AWSDynamoDB *_defaultDynamoDB = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoDynamoDB];
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
        _defaultDynamoDB = [[AWSDynamoDB alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultDynamoDB;
}

+ (void)registerDynamoDBWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSDynamoDB alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)DynamoDBForKey:(NSString *)key {
    @synchronized(self) {
        AWSDynamoDB *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoDynamoDB
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSDynamoDB registerDynamoDBWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeDynamoDBForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultDynamoDB` or `+ DynamoDBForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceDynamoDB
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceDynamoDB];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSDynamoDBRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.0"}; 
		
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSDynamoDBResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSDynamoDBResponseSerializer alloc] initWithJSONDefinition:[[AWSDynamoDBResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSDynamoDBBatchGetItemOutput *> *)batchGetItem:(AWSDynamoDBBatchGetItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"BatchGetItem"
                   outputClass:[AWSDynamoDBBatchGetItemOutput class]];
}

- (void)batchGetItem:(AWSDynamoDBBatchGetItemInput *)request
     completionHandler:(void (^)(AWSDynamoDBBatchGetItemOutput *response, NSError *error))completionHandler {
    [[self batchGetItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBBatchGetItemOutput *> * _Nonnull task) {
        AWSDynamoDBBatchGetItemOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBBatchWriteItemOutput *> *)batchWriteItem:(AWSDynamoDBBatchWriteItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"BatchWriteItem"
                   outputClass:[AWSDynamoDBBatchWriteItemOutput class]];
}

- (void)batchWriteItem:(AWSDynamoDBBatchWriteItemInput *)request
     completionHandler:(void (^)(AWSDynamoDBBatchWriteItemOutput *response, NSError *error))completionHandler {
    [[self batchWriteItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBBatchWriteItemOutput *> * _Nonnull task) {
        AWSDynamoDBBatchWriteItemOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBCreateBackupOutput *> *)createBackup:(AWSDynamoDBCreateBackupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"CreateBackup"
                   outputClass:[AWSDynamoDBCreateBackupOutput class]];
}

- (void)createBackup:(AWSDynamoDBCreateBackupInput *)request
     completionHandler:(void (^)(AWSDynamoDBCreateBackupOutput *response, NSError *error))completionHandler {
    [[self createBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBCreateBackupOutput *> * _Nonnull task) {
        AWSDynamoDBCreateBackupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBCreateGlobalTableOutput *> *)createGlobalTable:(AWSDynamoDBCreateGlobalTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"CreateGlobalTable"
                   outputClass:[AWSDynamoDBCreateGlobalTableOutput class]];
}

- (void)createGlobalTable:(AWSDynamoDBCreateGlobalTableInput *)request
     completionHandler:(void (^)(AWSDynamoDBCreateGlobalTableOutput *response, NSError *error))completionHandler {
    [[self createGlobalTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBCreateGlobalTableOutput *> * _Nonnull task) {
        AWSDynamoDBCreateGlobalTableOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBCreateTableOutput *> *)createTable:(AWSDynamoDBCreateTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"CreateTable"
                   outputClass:[AWSDynamoDBCreateTableOutput class]];
}

- (void)createTable:(AWSDynamoDBCreateTableInput *)request
     completionHandler:(void (^)(AWSDynamoDBCreateTableOutput *response, NSError *error))completionHandler {
    [[self createTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBCreateTableOutput *> * _Nonnull task) {
        AWSDynamoDBCreateTableOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDeleteBackupOutput *> *)deleteBackup:(AWSDynamoDBDeleteBackupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DeleteBackup"
                   outputClass:[AWSDynamoDBDeleteBackupOutput class]];
}

- (void)deleteBackup:(AWSDynamoDBDeleteBackupInput *)request
     completionHandler:(void (^)(AWSDynamoDBDeleteBackupOutput *response, NSError *error))completionHandler {
    [[self deleteBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDeleteBackupOutput *> * _Nonnull task) {
        AWSDynamoDBDeleteBackupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDeleteItemOutput *> *)deleteItem:(AWSDynamoDBDeleteItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DeleteItem"
                   outputClass:[AWSDynamoDBDeleteItemOutput class]];
}

- (void)deleteItem:(AWSDynamoDBDeleteItemInput *)request
     completionHandler:(void (^)(AWSDynamoDBDeleteItemOutput *response, NSError *error))completionHandler {
    [[self deleteItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDeleteItemOutput *> * _Nonnull task) {
        AWSDynamoDBDeleteItemOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDeleteTableOutput *> *)deleteTable:(AWSDynamoDBDeleteTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DeleteTable"
                   outputClass:[AWSDynamoDBDeleteTableOutput class]];
}

- (void)deleteTable:(AWSDynamoDBDeleteTableInput *)request
     completionHandler:(void (^)(AWSDynamoDBDeleteTableOutput *response, NSError *error))completionHandler {
    [[self deleteTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDeleteTableOutput *> * _Nonnull task) {
        AWSDynamoDBDeleteTableOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDescribeBackupOutput *> *)describeBackup:(AWSDynamoDBDescribeBackupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DescribeBackup"
                   outputClass:[AWSDynamoDBDescribeBackupOutput class]];
}

- (void)describeBackup:(AWSDynamoDBDescribeBackupInput *)request
     completionHandler:(void (^)(AWSDynamoDBDescribeBackupOutput *response, NSError *error))completionHandler {
    [[self describeBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDescribeBackupOutput *> * _Nonnull task) {
        AWSDynamoDBDescribeBackupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDescribeContinuousBackupsOutput *> *)describeContinuousBackups:(AWSDynamoDBDescribeContinuousBackupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DescribeContinuousBackups"
                   outputClass:[AWSDynamoDBDescribeContinuousBackupsOutput class]];
}

- (void)describeContinuousBackups:(AWSDynamoDBDescribeContinuousBackupsInput *)request
     completionHandler:(void (^)(AWSDynamoDBDescribeContinuousBackupsOutput *response, NSError *error))completionHandler {
    [[self describeContinuousBackups:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDescribeContinuousBackupsOutput *> * _Nonnull task) {
        AWSDynamoDBDescribeContinuousBackupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDescribeEndpointsResponse *> *)describeEndpoints:(AWSDynamoDBDescribeEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DescribeEndpoints"
                   outputClass:[AWSDynamoDBDescribeEndpointsResponse class]];
}

- (void)describeEndpoints:(AWSDynamoDBDescribeEndpointsRequest *)request
     completionHandler:(void (^)(AWSDynamoDBDescribeEndpointsResponse *response, NSError *error))completionHandler {
    [[self describeEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDescribeEndpointsResponse *> * _Nonnull task) {
        AWSDynamoDBDescribeEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDescribeGlobalTableOutput *> *)describeGlobalTable:(AWSDynamoDBDescribeGlobalTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DescribeGlobalTable"
                   outputClass:[AWSDynamoDBDescribeGlobalTableOutput class]];
}

- (void)describeGlobalTable:(AWSDynamoDBDescribeGlobalTableInput *)request
     completionHandler:(void (^)(AWSDynamoDBDescribeGlobalTableOutput *response, NSError *error))completionHandler {
    [[self describeGlobalTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDescribeGlobalTableOutput *> * _Nonnull task) {
        AWSDynamoDBDescribeGlobalTableOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDescribeGlobalTableSettingsOutput *> *)describeGlobalTableSettings:(AWSDynamoDBDescribeGlobalTableSettingsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DescribeGlobalTableSettings"
                   outputClass:[AWSDynamoDBDescribeGlobalTableSettingsOutput class]];
}

- (void)describeGlobalTableSettings:(AWSDynamoDBDescribeGlobalTableSettingsInput *)request
     completionHandler:(void (^)(AWSDynamoDBDescribeGlobalTableSettingsOutput *response, NSError *error))completionHandler {
    [[self describeGlobalTableSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDescribeGlobalTableSettingsOutput *> * _Nonnull task) {
        AWSDynamoDBDescribeGlobalTableSettingsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDescribeLimitsOutput *> *)describeLimits:(AWSDynamoDBDescribeLimitsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DescribeLimits"
                   outputClass:[AWSDynamoDBDescribeLimitsOutput class]];
}

- (void)describeLimits:(AWSDynamoDBDescribeLimitsInput *)request
     completionHandler:(void (^)(AWSDynamoDBDescribeLimitsOutput *response, NSError *error))completionHandler {
    [[self describeLimits:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDescribeLimitsOutput *> * _Nonnull task) {
        AWSDynamoDBDescribeLimitsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDescribeTableOutput *> *)describeTable:(AWSDynamoDBDescribeTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DescribeTable"
                   outputClass:[AWSDynamoDBDescribeTableOutput class]];
}

- (void)describeTable:(AWSDynamoDBDescribeTableInput *)request
     completionHandler:(void (^)(AWSDynamoDBDescribeTableOutput *response, NSError *error))completionHandler {
    [[self describeTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDescribeTableOutput *> * _Nonnull task) {
        AWSDynamoDBDescribeTableOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBDescribeTimeToLiveOutput *> *)describeTimeToLive:(AWSDynamoDBDescribeTimeToLiveInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DescribeTimeToLive"
                   outputClass:[AWSDynamoDBDescribeTimeToLiveOutput class]];
}

- (void)describeTimeToLive:(AWSDynamoDBDescribeTimeToLiveInput *)request
     completionHandler:(void (^)(AWSDynamoDBDescribeTimeToLiveOutput *response, NSError *error))completionHandler {
    [[self describeTimeToLive:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBDescribeTimeToLiveOutput *> * _Nonnull task) {
        AWSDynamoDBDescribeTimeToLiveOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBGetItemOutput *> *)getItem:(AWSDynamoDBGetItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"GetItem"
                   outputClass:[AWSDynamoDBGetItemOutput class]];
}

- (void)getItem:(AWSDynamoDBGetItemInput *)request
     completionHandler:(void (^)(AWSDynamoDBGetItemOutput *response, NSError *error))completionHandler {
    [[self getItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBGetItemOutput *> * _Nonnull task) {
        AWSDynamoDBGetItemOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBListBackupsOutput *> *)listBackups:(AWSDynamoDBListBackupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"ListBackups"
                   outputClass:[AWSDynamoDBListBackupsOutput class]];
}

- (void)listBackups:(AWSDynamoDBListBackupsInput *)request
     completionHandler:(void (^)(AWSDynamoDBListBackupsOutput *response, NSError *error))completionHandler {
    [[self listBackups:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBListBackupsOutput *> * _Nonnull task) {
        AWSDynamoDBListBackupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBListGlobalTablesOutput *> *)listGlobalTables:(AWSDynamoDBListGlobalTablesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"ListGlobalTables"
                   outputClass:[AWSDynamoDBListGlobalTablesOutput class]];
}

- (void)listGlobalTables:(AWSDynamoDBListGlobalTablesInput *)request
     completionHandler:(void (^)(AWSDynamoDBListGlobalTablesOutput *response, NSError *error))completionHandler {
    [[self listGlobalTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBListGlobalTablesOutput *> * _Nonnull task) {
        AWSDynamoDBListGlobalTablesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBListTablesOutput *> *)listTables:(AWSDynamoDBListTablesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"ListTables"
                   outputClass:[AWSDynamoDBListTablesOutput class]];
}

- (void)listTables:(AWSDynamoDBListTablesInput *)request
     completionHandler:(void (^)(AWSDynamoDBListTablesOutput *response, NSError *error))completionHandler {
    [[self listTables:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBListTablesOutput *> * _Nonnull task) {
        AWSDynamoDBListTablesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBListTagsOfResourceOutput *> *)listTagsOfResource:(AWSDynamoDBListTagsOfResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"ListTagsOfResource"
                   outputClass:[AWSDynamoDBListTagsOfResourceOutput class]];
}

- (void)listTagsOfResource:(AWSDynamoDBListTagsOfResourceInput *)request
     completionHandler:(void (^)(AWSDynamoDBListTagsOfResourceOutput *response, NSError *error))completionHandler {
    [[self listTagsOfResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBListTagsOfResourceOutput *> * _Nonnull task) {
        AWSDynamoDBListTagsOfResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBPutItemOutput *> *)putItem:(AWSDynamoDBPutItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"PutItem"
                   outputClass:[AWSDynamoDBPutItemOutput class]];
}

- (void)putItem:(AWSDynamoDBPutItemInput *)request
     completionHandler:(void (^)(AWSDynamoDBPutItemOutput *response, NSError *error))completionHandler {
    [[self putItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBPutItemOutput *> * _Nonnull task) {
        AWSDynamoDBPutItemOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBQueryOutput *> *)query:(AWSDynamoDBQueryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"Query"
                   outputClass:[AWSDynamoDBQueryOutput class]];
}

- (void)query:(AWSDynamoDBQueryInput *)request
     completionHandler:(void (^)(AWSDynamoDBQueryOutput *response, NSError *error))completionHandler {
    [[self query:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBQueryOutput *> * _Nonnull task) {
        AWSDynamoDBQueryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBRestoreTableFromBackupOutput *> *)restoreTableFromBackup:(AWSDynamoDBRestoreTableFromBackupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"RestoreTableFromBackup"
                   outputClass:[AWSDynamoDBRestoreTableFromBackupOutput class]];
}

- (void)restoreTableFromBackup:(AWSDynamoDBRestoreTableFromBackupInput *)request
     completionHandler:(void (^)(AWSDynamoDBRestoreTableFromBackupOutput *response, NSError *error))completionHandler {
    [[self restoreTableFromBackup:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBRestoreTableFromBackupOutput *> * _Nonnull task) {
        AWSDynamoDBRestoreTableFromBackupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBRestoreTableToPointInTimeOutput *> *)restoreTableToPointInTime:(AWSDynamoDBRestoreTableToPointInTimeInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"RestoreTableToPointInTime"
                   outputClass:[AWSDynamoDBRestoreTableToPointInTimeOutput class]];
}

- (void)restoreTableToPointInTime:(AWSDynamoDBRestoreTableToPointInTimeInput *)request
     completionHandler:(void (^)(AWSDynamoDBRestoreTableToPointInTimeOutput *response, NSError *error))completionHandler {
    [[self restoreTableToPointInTime:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBRestoreTableToPointInTimeOutput *> * _Nonnull task) {
        AWSDynamoDBRestoreTableToPointInTimeOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBScanOutput *> *)scan:(AWSDynamoDBScanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"Scan"
                   outputClass:[AWSDynamoDBScanOutput class]];
}

- (void)scan:(AWSDynamoDBScanInput *)request
     completionHandler:(void (^)(AWSDynamoDBScanOutput *response, NSError *error))completionHandler {
    [[self scan:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBScanOutput *> * _Nonnull task) {
        AWSDynamoDBScanOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSDynamoDBTagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSDynamoDBTagResourceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBTransactGetItemsOutput *> *)transactGetItems:(AWSDynamoDBTransactGetItemsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"TransactGetItems"
                   outputClass:[AWSDynamoDBTransactGetItemsOutput class]];
}

- (void)transactGetItems:(AWSDynamoDBTransactGetItemsInput *)request
     completionHandler:(void (^)(AWSDynamoDBTransactGetItemsOutput *response, NSError *error))completionHandler {
    [[self transactGetItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBTransactGetItemsOutput *> * _Nonnull task) {
        AWSDynamoDBTransactGetItemsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBTransactWriteItemsOutput *> *)transactWriteItems:(AWSDynamoDBTransactWriteItemsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"TransactWriteItems"
                   outputClass:[AWSDynamoDBTransactWriteItemsOutput class]];
}

- (void)transactWriteItems:(AWSDynamoDBTransactWriteItemsInput *)request
     completionHandler:(void (^)(AWSDynamoDBTransactWriteItemsOutput *response, NSError *error))completionHandler {
    [[self transactWriteItems:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBTransactWriteItemsOutput *> * _Nonnull task) {
        AWSDynamoDBTransactWriteItemsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSDynamoDBUntagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSDynamoDBUntagResourceInput *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBUpdateContinuousBackupsOutput *> *)updateContinuousBackups:(AWSDynamoDBUpdateContinuousBackupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UpdateContinuousBackups"
                   outputClass:[AWSDynamoDBUpdateContinuousBackupsOutput class]];
}

- (void)updateContinuousBackups:(AWSDynamoDBUpdateContinuousBackupsInput *)request
     completionHandler:(void (^)(AWSDynamoDBUpdateContinuousBackupsOutput *response, NSError *error))completionHandler {
    [[self updateContinuousBackups:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBUpdateContinuousBackupsOutput *> * _Nonnull task) {
        AWSDynamoDBUpdateContinuousBackupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBUpdateGlobalTableOutput *> *)updateGlobalTable:(AWSDynamoDBUpdateGlobalTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UpdateGlobalTable"
                   outputClass:[AWSDynamoDBUpdateGlobalTableOutput class]];
}

- (void)updateGlobalTable:(AWSDynamoDBUpdateGlobalTableInput *)request
     completionHandler:(void (^)(AWSDynamoDBUpdateGlobalTableOutput *response, NSError *error))completionHandler {
    [[self updateGlobalTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBUpdateGlobalTableOutput *> * _Nonnull task) {
        AWSDynamoDBUpdateGlobalTableOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBUpdateGlobalTableSettingsOutput *> *)updateGlobalTableSettings:(AWSDynamoDBUpdateGlobalTableSettingsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UpdateGlobalTableSettings"
                   outputClass:[AWSDynamoDBUpdateGlobalTableSettingsOutput class]];
}

- (void)updateGlobalTableSettings:(AWSDynamoDBUpdateGlobalTableSettingsInput *)request
     completionHandler:(void (^)(AWSDynamoDBUpdateGlobalTableSettingsOutput *response, NSError *error))completionHandler {
    [[self updateGlobalTableSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBUpdateGlobalTableSettingsOutput *> * _Nonnull task) {
        AWSDynamoDBUpdateGlobalTableSettingsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBUpdateItemOutput *> *)updateItem:(AWSDynamoDBUpdateItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UpdateItem"
                   outputClass:[AWSDynamoDBUpdateItemOutput class]];
}

- (void)updateItem:(AWSDynamoDBUpdateItemInput *)request
     completionHandler:(void (^)(AWSDynamoDBUpdateItemOutput *response, NSError *error))completionHandler {
    [[self updateItem:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBUpdateItemOutput *> * _Nonnull task) {
        AWSDynamoDBUpdateItemOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBUpdateTableOutput *> *)updateTable:(AWSDynamoDBUpdateTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UpdateTable"
                   outputClass:[AWSDynamoDBUpdateTableOutput class]];
}

- (void)updateTable:(AWSDynamoDBUpdateTableInput *)request
     completionHandler:(void (^)(AWSDynamoDBUpdateTableOutput *response, NSError *error))completionHandler {
    [[self updateTable:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBUpdateTableOutput *> * _Nonnull task) {
        AWSDynamoDBUpdateTableOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSDynamoDBUpdateTimeToLiveOutput *> *)updateTimeToLive:(AWSDynamoDBUpdateTimeToLiveInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UpdateTimeToLive"
                   outputClass:[AWSDynamoDBUpdateTimeToLiveOutput class]];
}

- (void)updateTimeToLive:(AWSDynamoDBUpdateTimeToLiveInput *)request
     completionHandler:(void (^)(AWSDynamoDBUpdateTimeToLiveOutput *response, NSError *error))completionHandler {
    [[self updateTimeToLive:request] continueWithBlock:^id _Nullable(AWSTask<AWSDynamoDBUpdateTimeToLiveOutput *> * _Nonnull task) {
        AWSDynamoDBUpdateTimeToLiveOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
