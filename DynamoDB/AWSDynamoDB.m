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

#import "AWSDynamoDB.h"

#import "AWSNetworking.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSCategory.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"

NSString *const AWSDynamoDBDefinitionFileName = @"dynamodb-2012-08-10";

@interface AWSDynamoDBResponseSerializer : AWSJSONResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;


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

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName
{
    AWSDynamoDBResponseSerializer *serializer = [AWSDynamoDBResponseSerializer serializerWithResource:resource actionName:actionName];
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
            responseObject = [MTLJSONAdapter modelOfClass:self.outputClass
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

+ (instancetype)defaultDynamoDB {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSDynamoDB *_defaultDynamoDB = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultDynamoDB = [[AWSDynamoDB alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultDynamoDB;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                                          service:AWSServiceDynamoDB];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestSerializer = [AWSJSONRequestSerializer new];
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSDynamoDBRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Host" : _configuration.endpoint.hostName,
                                   @"Content-Type" : @"application/x-amz-json-1.0",
                                   @"Accept-Encoding" : @""};

        _networking = [AWSNetworking networking:_configuration];
    }

    return self;
}

- (BFTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AWSHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    if (!request) {
        request = [AWSRequest new];
    }

    AWSNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[MTLJSONAdapter JSONDictionaryFromModel:request] aws_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }
    NSMutableDictionary *headers = [NSMutableDictionary new];
    headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
    networkingRequest.headers = headers;
    networkingRequest.HTTPMethod = HTTPMethod;
    networkingRequest.responseSerializer = [AWSDynamoDBResponseSerializer serializerWithOutputClass:outputClass resource:AWSDynamoDBDefinitionFileName actionName:operationName];
    networkingRequest.requestSerializer = [AWSJSONRequestSerializer serializerWithResource:AWSDynamoDBDefinitionFileName actionName:operationName];
    
    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)batchGetItem:(AWSDynamoDBBatchGetItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"BatchGetItem"
                   outputClass:[AWSDynamoDBBatchGetItemOutput class]];
}

- (BFTask *)batchWriteItem:(AWSDynamoDBBatchWriteItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"BatchWriteItem"
                   outputClass:[AWSDynamoDBBatchWriteItemOutput class]];
}

- (BFTask *)createTable:(AWSDynamoDBCreateTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"CreateTable"
                   outputClass:[AWSDynamoDBCreateTableOutput class]];
}

- (BFTask *)deleteItem:(AWSDynamoDBDeleteItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DeleteItem"
                   outputClass:[AWSDynamoDBDeleteItemOutput class]];
}

- (BFTask *)deleteTable:(AWSDynamoDBDeleteTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DeleteTable"
                   outputClass:[AWSDynamoDBDeleteTableOutput class]];
}

- (BFTask *)describeTable:(AWSDynamoDBDescribeTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"DescribeTable"
                   outputClass:[AWSDynamoDBDescribeTableOutput class]];
}

- (BFTask *)getItem:(AWSDynamoDBGetItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"GetItem"
                   outputClass:[AWSDynamoDBGetItemOutput class]];
}

- (BFTask *)listTables:(AWSDynamoDBListTablesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"ListTables"
                   outputClass:[AWSDynamoDBListTablesOutput class]];
}

- (BFTask *)putItem:(AWSDynamoDBPutItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"PutItem"
                   outputClass:[AWSDynamoDBPutItemOutput class]];
}

- (BFTask *)query:(AWSDynamoDBQueryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"Query"
                   outputClass:[AWSDynamoDBQueryOutput class]];
}

- (BFTask *)scan:(AWSDynamoDBScanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"Scan"
                   outputClass:[AWSDynamoDBScanOutput class]];
}

- (BFTask *)updateItem:(AWSDynamoDBUpdateItemInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UpdateItem"
                   outputClass:[AWSDynamoDBUpdateItemOutput class]];
}

- (BFTask *)updateTable:(AWSDynamoDBUpdateTableInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"DynamoDB_20120810"
                 operationName:@"UpdateTable"
                   outputClass:[AWSDynamoDBUpdateTableOutput class]];
}

@end
