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

#import "AWSEventRecorderService.h"

#import "AZNetworking.h"
#import "AZCategory.h"
#import "AWSNetworking.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"




@interface AWSEventRecorderServiceResponseSerializer : AWSJSONResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass;
@end


@implementation AWSEventRecorderServiceResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                             @"com.amazonaws.glers.v20140630#IncompleteSignature" : @(AWSEventRecorderServiceErrorIncompleteSignature),
                             @"com.amazonaws.glers.v20140630#InvalidClientTokenId" : @(AWSEventRecorderServiceErrorInvalidClientTokenId),
                             @"com.amazonaws.glers.v20140630#MissingAuthenticationToken" : @(AWSEventRecorderServiceErrorMissingAuthenticationToken),
                             @"com.amazonaws.glers.v20140630#BadRequestException" : @(AWSEventRecorderServiceErrorBadRequest),
                             };
}

+ (instancetype)serializerWithOutputClass:(Class)outputClass {
    AWSEventRecorderServiceResponseSerializer *serializer = [AWSEventRecorderServiceResponseSerializer new];
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
    if (*error) {
        NSMutableDictionary *richUserInfo = [NSMutableDictionary dictionaryWithDictionary:(*error).userInfo];
        [richUserInfo setObject:@"responseStatusCode" forKey:@([response statusCode])];
        [richUserInfo setObject:@"responseHeaders" forKey:[response allHeaderFields]];
        [richUserInfo setObject:@"responseDataSize" forKey:@(data?[data length]:0)];
        *error = [NSError errorWithDomain:(*error).domain
                                     code:(*error).code
                                 userInfo:richUserInfo];
        
    }
    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
        NSString *errorTypeStr = [[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"];
        NSString *errorTypeHeader = [[errorTypeStr componentsSeparatedByString:@":"] firstObject];
        
        if ([errorTypeStr length] > 0 && errorTypeHeader) {
            if (errorCodeDictionary[errorTypeHeader]) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null],
                                               NSLocalizedFailureReasonErrorKey : errorTypeStr,
                                               @"responseStatusCode" : @([response statusCode]),
                                               @"responseHeaders" : [response allHeaderFields],
                                               @"responseDataSize" : @(data?[data length]:0),
                                               };
                    *error = [NSError errorWithDomain:AWSEventRecorderServiceErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null],
                                               NSLocalizedFailureReasonErrorKey : errorTypeStr,
                                               @"responseStatusCode" : @([response statusCode]),
                                               @"responseHeaders" : [response allHeaderFields],
                                               @"responseDataSize" : @(data?[data length]:0),
                                               };
                    *error = [NSError errorWithDomain:AWSEventRecorderServiceErrorDomain
                                                 code:AWSEventRecorderServiceErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
        
        if (self.outputClass) {
            responseObject = [MTLJSONAdapter modelOfClass:self.outputClass
                                       fromJSONDictionary:responseObject
                                                    error:error];
        }
    }
    
    if (responseObject == nil) {
        return @{@"responseStatusCode" : @([response statusCode]),
                 @"responseHeaders" : [response allHeaderFields],
                 @"responseDataSize" : @(data?[data length]:0),
                 };
    } 
    
    return responseObject;
}


@end

@interface AWSEventRecorderServiceRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSEventRecorderServiceRequestRetryHandler

- (AZNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                            response:(NSHTTPURLResponse *)response
                                data:(NSData *)data
                               error:(NSError *)error {
    AZNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                response:response
                                                    data:data
                                                   error:error];
    if(retryType == AZNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSEventRecorderServiceErrorDomain]) {
        switch (error.code) {
            case AWSEventRecorderServiceErrorIncompleteSignature:
            case AWSEventRecorderServiceErrorInvalidClientTokenId:
            case AWSEventRecorderServiceErrorMissingAuthenticationToken:
                retryType = AZNetworkingRetryTypeShouldRefreshCredentialsAndRetry;
                break;
                
            default:
                break;
        }
    }
    
    return retryType;
}

@end



@interface AWSRequest()

@property (nonatomic, strong) AZNetworkingRequest *internalRequest;

@end

@interface AWSEventRecorderService()

@property (nonatomic, strong) AZNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;
@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSEventRecorderService

+ (instancetype)defaultEventRecorderService {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }
    
    static AWSEventRecorderService *_defaultAWSGameLabEventRecorderService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultAWSGameLabEventRecorderService = [[AWSEventRecorderService alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });
    
    return _defaultAWSGameLabEventRecorderService;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = configuration;
        
        _endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                            service:AWSServiceGameLabEventRecorder];
        
        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_endpoint];
        
        _configuration.baseURL = _endpoint.URL;
        _configuration.requestSerializer = [AWSJSONRequestSerializer new];
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSEventRecorderServiceRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Host" : _endpoint.hostName,
                                   @"Content-Type" : @"application/x-amz-json-1.1",
                                   @"Accept-Encoding" : @"",
                                   @"Content-Encoding": @"gzip"
                                   };
        
        _networking = [AZNetworking networking:_configuration];
    }
    return self;
}

- (BFTask *)invokeRequest:(AWSRequest *)request
               HTTPMethod:(AZHTTPMethod)HTTPMethod
                URLString:(NSString *) URLString
             targetPrefix:(NSString *)targetPrefix
            operationName:(NSString *)operationName
              outputClass:(Class)outputClass {
    if (!request) {
        request = [AWSRequest new];
    }
    
    AZNetworkingRequest *networkingRequest = request.internalRequest;
    if (request) {
        networkingRequest.parameters = [[MTLJSONAdapter JSONDictionaryFromModel:request] az_removeNullValues];
    } else {
        networkingRequest.parameters = @{};
    }
    
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    __block NSString *blockSafeURLString = [URLString copy];
    [networkingRequest.parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *stringToFind = [NSString stringWithFormat:@"{%@}", key];
        if ([blockSafeURLString rangeOfString:stringToFind].location == NSNotFound) {
            [parameters setObject:obj forKey:key];
        } else {
            blockSafeURLString = [blockSafeURLString stringByReplacingOccurrencesOfString:stringToFind
                                                                               withString:[obj az_stringWithURLEncoding]];
        }
    }];
    networkingRequest.parameters = parameters;
    
    NSMutableDictionary *headers = [NSMutableDictionary new];
    headers[@"X-Amz-Target"] = [NSString stringWithFormat:@"%@.%@", targetPrefix, operationName];
    
    networkingRequest.headers = headers;
    networkingRequest.URLString = blockSafeURLString;
    networkingRequest.HTTPMethod = HTTPMethod;
    networkingRequest.responseSerializer = [AWSEventRecorderServiceResponseSerializer serializerWithOutputClass:outputClass];
    
    return [self.networking sendRequest:networkingRequest];
}

    
#pragma mark - Service method
    
- (BFTask *)putEvents:(AWSEventRecorderServicePutEventsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AZHTTPMethodPOST
                     URLString:@"/2014-06-05/events"
                  targetPrefix:@"AWSEventRecorderService"
                 operationName:@"PutEvents"
                   outputClass:nil];
}    
    
@end
