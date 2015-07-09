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

#import "AWSKinesis.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSKinesisResources.h"

NSString *const AWSKinesisDefinitionFileName = @"kinesis-2013-12-02";

@interface AWSKinesisResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSKinesisResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSKinesisErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSKinesisErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSKinesisErrorMissingAuthenticationToken),
                            @"ExpiredIteratorException" : @(AWSKinesisErrorExpiredIterator),
                            @"InvalidArgumentException" : @(AWSKinesisErrorInvalidArgument),
                            @"LimitExceededException" : @(AWSKinesisErrorLimitExceeded),
                            @"ProvisionedThroughputExceededException" : @(AWSKinesisErrorProvisionedThroughputExceeded),
                            @"ResourceInUseException" : @(AWSKinesisErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSKinesisErrorResourceNotFound),
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
                *error = [NSError errorWithDomain:AWSKinesisErrorDomain
                                             code:[[errorCodeDictionary objectForKey:[[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]] integerValue]
                                         userInfo:responseObject];
            }
            return responseObject;
        } else if ([[[responseObject objectForKey:@"__type"] componentsSeparatedByString:@"#"] lastObject]) {
            if (error) {
                *error = [NSError errorWithDomain:AWSKinesisErrorDomain
                                             code:AWSKinesisErrorUnknown
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

@interface AWSKinesisRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSKinesisRequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSKinesisErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        switch (error.code) {
            case AWSKinesisErrorIncompleteSignature:
            case AWSKinesisErrorInvalidClientTokenId:
            case AWSKinesisErrorMissingAuthenticationToken:
                retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                break;

            case AWSKinesisErrorProvisionedThroughputExceeded:
                retryType = AWSNetworkingRetryTypeShouldRetry;
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

@interface AWSKinesis()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSKinesis

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultKinesis {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSKinesis *_defaultKinesis = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultKinesis = [[AWSKinesis alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultKinesis;
}

+ (void)registerKinesisWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSKinesis alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)KinesisForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeKinesisForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultKinesis` or `+ KinesisForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceKinesis
                                                         useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSKinesisRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSKinesisResources sharedInstance] JSONObject]
                                                                                            actionName:operationName];
        networkingRequest.responseSerializer = [[AWSKinesisResponseSerializer alloc] initWithJSONDefinition:[[AWSKinesisResources sharedInstance] JSONObject]
                                                                                                 actionName:operationName
                                                                                                outputClass:outputClass];
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)addTagsToStream:(AWSKinesisAddTagsToStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"AddTagsToStream"
                   outputClass:nil];
}

- (AWSTask *)createStream:(AWSKinesisCreateStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"CreateStream"
                   outputClass:nil];
}

- (AWSTask *)deleteStream:(AWSKinesisDeleteStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"DeleteStream"
                   outputClass:nil];
}

- (AWSTask *)describeStream:(AWSKinesisDescribeStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"DescribeStream"
                   outputClass:[AWSKinesisDescribeStreamOutput class]];
}

- (AWSTask *)getRecords:(AWSKinesisGetRecordsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"GetRecords"
                   outputClass:[AWSKinesisGetRecordsOutput class]];
}

- (AWSTask *)getShardIterator:(AWSKinesisGetShardIteratorInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"GetShardIterator"
                   outputClass:[AWSKinesisGetShardIteratorOutput class]];
}

- (AWSTask *)listStreams:(AWSKinesisListStreamsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"ListStreams"
                   outputClass:[AWSKinesisListStreamsOutput class]];
}

- (AWSTask *)listTagsForStream:(AWSKinesisListTagsForStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"ListTagsForStream"
                   outputClass:[AWSKinesisListTagsForStreamOutput class]];
}

- (AWSTask *)mergeShards:(AWSKinesisMergeShardsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"MergeShards"
                   outputClass:nil];
}

- (AWSTask *)putRecord:(AWSKinesisPutRecordInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"PutRecord"
                   outputClass:[AWSKinesisPutRecordOutput class]];
}

- (AWSTask *)putRecords:(AWSKinesisPutRecordsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"PutRecords"
                   outputClass:[AWSKinesisPutRecordsOutput class]];
}

- (AWSTask *)removeTagsFromStream:(AWSKinesisRemoveTagsFromStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"RemoveTagsFromStream"
                   outputClass:nil];
}

- (AWSTask *)splitShard:(AWSKinesisSplitShardInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"SplitShard"
                   outputClass:nil];
}

@end