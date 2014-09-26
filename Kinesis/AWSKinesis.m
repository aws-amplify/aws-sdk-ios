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

#import "AWSKinesis.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"

NSString *const AWSKinesisDefinitionFileName = @"kinesis-2013-12-02";

@interface AWSKinesisResponseSerializer : AWSJSONResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

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

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSKinesisResponseSerializer *serializer = [AWSKinesisResponseSerializer serializerWithResource:resource actionName:actionName];
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
            responseObject = [MTLJSONAdapter modelOfClass:self.outputClass
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

+ (instancetype)defaultKinesis {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSKinesis *_defaultKinesis = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultKinesis = [[AWSKinesis alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultKinesis;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                                          service:AWSServiceKinesis];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSKinesisRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{
                                   @"Host" : _configuration.endpoint.hostName,
                                   @"Content-Type" : @"application/x-amz-json-1.1"
                                   };

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
    networkingRequest.responseSerializer = [AWSKinesisResponseSerializer serializerWithOutputClass:outputClass resource:AWSKinesisDefinitionFileName actionName:operationName];
    networkingRequest.requestSerializer = [AWSJSONRequestSerializer serializerWithResource:AWSKinesisDefinitionFileName actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)createStream:(AWSKinesisCreateStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"CreateStream"
                   outputClass:nil];
}

- (BFTask *)deleteStream:(AWSKinesisDeleteStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"DeleteStream"
                   outputClass:nil];
}

- (BFTask *)describeStream:(AWSKinesisDescribeStreamInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"DescribeStream"
                   outputClass:[AWSKinesisDescribeStreamOutput class]];
}

- (BFTask *)getRecords:(AWSKinesisGetRecordsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"GetRecords"
                   outputClass:[AWSKinesisGetRecordsOutput class]];
}

- (BFTask *)getShardIterator:(AWSKinesisGetShardIteratorInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"GetShardIterator"
                   outputClass:[AWSKinesisGetShardIteratorOutput class]];
}

- (BFTask *)listStreams:(AWSKinesisListStreamsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"ListStreams"
                   outputClass:[AWSKinesisListStreamsOutput class]];
}

- (BFTask *)mergeShards:(AWSKinesisMergeShardsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"MergeShards"
                   outputClass:nil];
}

- (BFTask *)putRecord:(AWSKinesisPutRecordInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"PutRecord"
                   outputClass:[AWSKinesisPutRecordOutput class]];
}

- (BFTask *)splitShard:(AWSKinesisSplitShardInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Kinesis_20131202"
                 operationName:@"SplitShard"
                   outputClass:nil];
}

@end