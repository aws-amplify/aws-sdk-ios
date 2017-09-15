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

#import "AWSDynamoDBService.h"
#import <AWSCore/AWSNetworking.h>
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
static NSString *const AWSDynamoDBSDKVersion = @"2.6.1";


@interface AWSDynamoDBResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSDynamoDBResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConditionalCheckFailedException" : @(AWSDynamoDBErrorConditionalCheckFailed),
                            @"InternalServerError" : @(AWSDynamoDBErrorInternalServer),
                            @"ItemCollectionSizeLimitExceededException" : @(AWSDynamoDBErrorItemCollectionSizeLimitExceeded),
                            @"LimitExceededException" : @(AWSDynamoDBErrorLimitExceeded),
                            @"ProvisionedThroughputExceededException" : @(AWSDynamoDBErrorProvisionedThroughputExceeded),
                            @"ResourceInUseException" : @(AWSDynamoDBErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSDynamoDBErrorResourceNotFound),
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

#pragma mark -

@end
