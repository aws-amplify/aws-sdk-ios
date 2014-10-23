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

#import "AWSSQS.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"

NSString *const AWSSQSDefinitionFileName = @"sqs-2012-11-05";

@interface AWSSQSResponseSerializer : AWSXMLResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

@end

@implementation AWSSQSResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"IncompleteSignature" : @(AWSSQSErrorIncompleteSignature),
                            @"InvalidClientTokenId" : @(AWSSQSErrorInvalidClientTokenId),
                            @"MissingAuthenticationToken" : @(AWSSQSErrorMissingAuthenticationToken),
                            @"AWS.SimpleQueueService.BatchEntryIdsNotDistinct" : @(AWSSQSErrorBatchEntryIdsNotDistinct),
                            @"AWS.SimpleQueueService.BatchRequestTooLong" : @(AWSSQSErrorBatchRequestTooLong),
                            @"AWS.SimpleQueueService.EmptyBatchRequest" : @(AWSSQSErrorEmptyBatchRequest),
                            @"InvalidAttributeName" : @(AWSSQSErrorInvalidAttributeName),
                            @"AWS.SimpleQueueService.InvalidBatchEntryId" : @(AWSSQSErrorInvalidBatchEntryId),
                            @"InvalidIdFormat" : @(AWSSQSErrorInvalidIdFormat),
                            @"InvalidMessageContents" : @(AWSSQSErrorInvalidMessageContents),
                            @"AWS.SimpleQueueService.MessageNotInflight" : @(AWSSQSErrorMessageNotInflight),
                            @"OverLimit" : @(AWSSQSErrorOverLimit),
                            @"AWS.SimpleQueueService.QueueDeletedRecently" : @(AWSSQSErrorQueueDeletedRecently),
                            @"AWS.SimpleQueueService.NonExistentQueue" : @(AWSSQSErrorQueueDoesNotExist),
                            @"QueueAlreadyExists" : @(AWSSQSErrorQueueNameExists),
                            @"ReceiptHandleIsInvalid" : @(AWSSQSErrorReceiptHandleIsInvalid),
                            @"AWS.SimpleQueueService.TooManyEntriesInBatchRequest" : @(AWSSQSErrorTooManyEntriesInBatchRequest),
                            @"AWS.SimpleQueueService.UnsupportedOperation" : @(AWSSQSErrorUnsupportedOperation),
                            };
}

#pragma mark -

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSSQSResponseSerializer *serializer = [AWSSQSResponseSerializer serializerWithResource:resource
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
                *error = [NSError errorWithDomain:AWSSQSErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSSQSErrorDomain
                                             code:AWSSQSErrorUnknown
                                         userInfo:errorInfo];
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

@interface AWSSQSRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSQSRequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                             response:(NSHTTPURLResponse *)response
                                 data:(NSData *)data
                                error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                 response:response
                                                     data:data
                                                    error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && currentRetryCount < self.maxRetryCount) {
        if ([error.domain isEqualToString:AWSSQSErrorDomain]) {
            switch (error.code) {
                case AWSSQSErrorIncompleteSignature:
                case AWSSQSErrorInvalidClientTokenId:
                case AWSSQSErrorMissingAuthenticationToken:
                    retryType = AWSNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                    break;

                default:
                    break;
            }
        } else if ([error.domain isEqualToString:AWSGeneralErrorDomain]) {
            switch (error.code) {
                case AWSGeneralErrorSignatureDoesNotMatch:
                    retryType = AWSNetworkingRetryTypeShouldCorrectClockSkewAndRetry;
                    break;

                default:
                    break;
            }
        }
    }

    return retryType;
}

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSSQS()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSSQS

+ (instancetype)defaultSQS {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSSQS *_defaultSQS = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultSQS = [[AWSSQS alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultSQS;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                                          service:AWSServiceSQS];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSSQSRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Host" : _configuration.endpoint.hostName};

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
    networkingRequest.HTTPMethod = HTTPMethod;

    AWSQueryStringRequestSerializer *requestSerializer = [AWSQueryStringRequestSerializer serializerWithResource:AWSSQSDefinitionFileName actionName:operationName];
    networkingRequest.requestSerializer = requestSerializer;

    networkingRequest.responseSerializer = [AWSSQSResponseSerializer serializerWithOutputClass:outputClass
                                                                                      resource:AWSSQSDefinitionFileName
                                                                                    actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)addPermission:(AWSSQSAddPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddPermission"
                   outputClass:nil];
}

- (BFTask *)changeMessageVisibility:(AWSSQSChangeMessageVisibilityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ChangeMessageVisibility"
                   outputClass:nil];
}

- (BFTask *)changeMessageVisibilityBatch:(AWSSQSChangeMessageVisibilityBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ChangeMessageVisibilityBatch"
                   outputClass:[AWSSQSChangeMessageVisibilityBatchResult class]];
}

- (BFTask *)createQueue:(AWSSQSCreateQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateQueue"
                   outputClass:[AWSSQSCreateQueueResult class]];
}

- (BFTask *)deleteMessage:(AWSSQSDeleteMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteMessage"
                   outputClass:nil];
}

- (BFTask *)deleteMessageBatch:(AWSSQSDeleteMessageBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteMessageBatch"
                   outputClass:[AWSSQSDeleteMessageBatchResult class]];
}

- (BFTask *)deleteQueue:(AWSSQSDeleteQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteQueue"
                   outputClass:nil];
}

- (BFTask *)getQueueAttributes:(AWSSQSGetQueueAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetQueueAttributes"
                   outputClass:[AWSSQSGetQueueAttributesResult class]];
}

- (BFTask *)getQueueUrl:(AWSSQSGetQueueUrlRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetQueueUrl"
                   outputClass:[AWSSQSGetQueueUrlResult class]];
}

- (BFTask *)listDeadLetterSourceQueues:(AWSSQSListDeadLetterSourceQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListDeadLetterSourceQueues"
                   outputClass:[AWSSQSListDeadLetterSourceQueuesResult class]];
}

- (BFTask *)listQueues:(AWSSQSListQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListQueues"
                   outputClass:[AWSSQSListQueuesResult class]];
}

- (BFTask *)receiveMessage:(AWSSQSReceiveMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReceiveMessage"
                   outputClass:[AWSSQSReceiveMessageResult class]];
}

- (BFTask *)removePermission:(AWSSQSRemovePermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemovePermission"
                   outputClass:nil];
}

- (BFTask *)sendMessage:(AWSSQSSendMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendMessage"
                   outputClass:[AWSSQSSendMessageResult class]];
}

- (BFTask *)sendMessageBatch:(AWSSQSSendMessageBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendMessageBatch"
                   outputClass:[AWSSQSSendMessageBatchResult class]];
}

- (BFTask *)setQueueAttributes:(AWSSQSSetQueueAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetQueueAttributes"
                   outputClass:nil];
}

@end