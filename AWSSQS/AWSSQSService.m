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

#import "AWSSQS.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"
#import "AWSSynchronizedMutableDictionary.h"
#import "AWSSQSResources.h"

NSString *const AWSSQSDefinitionFileName = @"sqs-2012-11-05";

@interface AWSSQSResponseSerializer : AWSXMLResponseSerializer

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
            responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
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

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSQS {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSSQS *_defaultSQS = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        _defaultSQS = [[AWSSQS alloc] initWithConfiguration:AWSServiceManager.defaultServiceManager.defaultServiceConfiguration];
#pragma clang diagnostic pop
    });

    return _defaultSQS;
}

+ (void)registerSQSWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [_serviceClients setObject:[[AWSSQS alloc] initWithConfiguration:configuration]
                        forKey:key];
#pragma clang diagnostic pop
}

+ (instancetype)SQSForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeSQSForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSQS` or `+ SQSForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSQS
                                                         useUnsafeURL:NO];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSSQSRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];

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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSSQSResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSQSResponseSerializer alloc] initWithJSONDefinition:[[AWSSQSResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)addPermission:(AWSSQSAddPermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"AddPermission"
                   outputClass:nil];
}

- (AWSTask *)changeMessageVisibility:(AWSSQSChangeMessageVisibilityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ChangeMessageVisibility"
                   outputClass:nil];
}

- (AWSTask *)changeMessageVisibilityBatch:(AWSSQSChangeMessageVisibilityBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ChangeMessageVisibilityBatch"
                   outputClass:[AWSSQSChangeMessageVisibilityBatchResult class]];
}

- (AWSTask *)createQueue:(AWSSQSCreateQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateQueue"
                   outputClass:[AWSSQSCreateQueueResult class]];
}

- (AWSTask *)deleteMessage:(AWSSQSDeleteMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteMessage"
                   outputClass:nil];
}

- (AWSTask *)deleteMessageBatch:(AWSSQSDeleteMessageBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteMessageBatch"
                   outputClass:[AWSSQSDeleteMessageBatchResult class]];
}

- (AWSTask *)deleteQueue:(AWSSQSDeleteQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteQueue"
                   outputClass:nil];
}

- (AWSTask *)getQueueAttributes:(AWSSQSGetQueueAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetQueueAttributes"
                   outputClass:[AWSSQSGetQueueAttributesResult class]];
}

- (AWSTask *)getQueueUrl:(AWSSQSGetQueueUrlRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetQueueUrl"
                   outputClass:[AWSSQSGetQueueUrlResult class]];
}

- (AWSTask *)listDeadLetterSourceQueues:(AWSSQSListDeadLetterSourceQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListDeadLetterSourceQueues"
                   outputClass:[AWSSQSListDeadLetterSourceQueuesResult class]];
}

- (AWSTask *)listQueues:(AWSSQSListQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListQueues"
                   outputClass:[AWSSQSListQueuesResult class]];
}

- (AWSTask *)receiveMessage:(AWSSQSReceiveMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ReceiveMessage"
                   outputClass:[AWSSQSReceiveMessageResult class]];
}

- (AWSTask *)removePermission:(AWSSQSRemovePermissionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"RemovePermission"
                   outputClass:nil];
}

- (AWSTask *)sendMessage:(AWSSQSSendMessageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendMessage"
                   outputClass:[AWSSQSSendMessageResult class]];
}

- (AWSTask *)sendMessageBatch:(AWSSQSSendMessageBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SendMessageBatch"
                   outputClass:[AWSSQSSendMessageBatchResult class]];
}

- (AWSTask *)setQueueAttributes:(AWSSQSSetQueueAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"SetQueueAttributes"
                   outputClass:nil];
}

@end