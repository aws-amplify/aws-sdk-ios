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

#import "AWSDynamoDB.h"

#import "AWSNetworking.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSCategory.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSDynamoDBResources.h"

NSString *const AWSDynamoDBDefinitionFileName = @"dynamodb-2012-08-10";

@interface AWSDynamoDBResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSDynamoDBResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSDynamoDBErrorAccessDenied),
                            @"UnrecognizedClientException" : @(AWSDynamoDBErrorUnrecognizedClient),
                            @"IncompleteSignature" : @(AWSDynamoDBErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSDynamoDBErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSDynamoDBErrorMissingAuthenticationToken),
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
        if ([errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSDynamoDBErrorDomain
                                             code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
                                         userInfo:responseObject];
            }
            return responseObject;
        } else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSDynamoDBErrorDomain
                                             code:AWSDynamoDBErrorUnknown
                                         userInfo:responseObject];
            }
            return responseObject;
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

@interface AWSDynamoDBRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSDynamoDBRequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSDynamoDBErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        switch (error.code) {
            case AWSDynamoDBErrorProvisionedThroughputExceeded:
                retryType = AWSNetworkingRetryTypeShouldRetry;
                break;

            case AWSDynamoDBErrorAccessDenied:
            case AWSDynamoDBErrorUnrecognizedClient:
            case AWSDynamoDBErrorIncompleteSignature:
            case AWSDynamoDBErrorInvalidClientTokenId:
            case AWSDynamoDBErrorMissingAuthenticationToken:
                retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                break;

            default:
                break;
        }
    }

    return retryType;
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

@implementation AWSDynamoDB

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultDynamoDB {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSDynamoDB *_defaultDynamoDB = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultDynamoDB = [[AWSDynamoDB alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultDynamoDB;
}

+ (void)registerDynamoDBWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSDynamoDB alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)DynamoDBForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
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

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceDynamoDB
                                                         useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestSerializer = [AWSJSONRequestSerializer new];
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
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

- (AWSTask *)batchGetItem:(AWSDynamoDBBatchGetItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"BatchGetItem"
                   outputClass:[AWSDynamoDBBatchGetItemOutput class]];
}

- (AWSTask *)batchWriteItem:(AWSDynamoDBBatchWriteItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"BatchWriteItem"
                   outputClass:[AWSDynamoDBBatchWriteItemOutput class]];
}

- (AWSTask *)createTable:(AWSDynamoDBCreateTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"CreateTable"
                   outputClass:[AWSDynamoDBCreateTableOutput class]];
}

- (AWSTask *)deleteItem:(AWSDynamoDBDeleteItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DeleteItem"
                   outputClass:[AWSDynamoDBDeleteItemOutput class]];
}

- (AWSTask *)deleteTable:(AWSDynamoDBDeleteTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DeleteTable"
                   outputClass:[AWSDynamoDBDeleteTableOutput class]];
}

- (AWSTask *)describeTable:(AWSDynamoDBDescribeTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DescribeTable"
                   outputClass:[AWSDynamoDBDescribeTableOutput class]];
}

- (AWSTask *)getItem:(AWSDynamoDBGetItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"GetItem"
                   outputClass:[AWSDynamoDBGetItemOutput class]];
}

- (AWSTask *)listTables:(AWSDynamoDBListTablesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"ListTables"
                   outputClass:[AWSDynamoDBListTablesOutput class]];
}

- (AWSTask *)putItem:(AWSDynamoDBPutItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"PutItem"
                   outputClass:[AWSDynamoDBPutItemOutput class]];
}

- (AWSTask *)query:(AWSDynamoDBQueryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"Query"
                   outputClass:[AWSDynamoDBQueryOutput class]];
}

- (AWSTask *)scan:(AWSDynamoDBScanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"Scan"
                   outputClass:[AWSDynamoDBScanOutput class]];
}

- (AWSTask *)updateItem:(AWSDynamoDBUpdateItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UpdateItem"
                   outputClass:[AWSDynamoDBUpdateItemOutput class]];
}

- (AWSTask *)updateTable:(AWSDynamoDBUpdateTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UpdateTable"
                   outputClass:[AWSDynamoDBUpdateTableOutput class]];
}

@end
