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

#import "AWSSimpleDB.h"

#import "AWSNetworking.h"
#import "AWSCategory.h"
#import "AWSSignature.h"
#import "AWSService.h"
#import "AWSNetworking.h"
#import "AWSURLRequestSerialization.h"
#import "AWSURLResponseSerialization.h"
#import "AWSURLRequestRetryHandler.h"

NSString *const AWSSimpleDBDefinitionFileName = @"sdb-2009-04-15";

@interface AWSSimpleDBResponseSerializer : AWSXMLResponseSerializer

@property (nonatomic, assign) Class outputClass;

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName;

@end

@implementation AWSSimpleDBResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessFailure" : @(AWSSimpleDBErrorAccessFailure),
                            @"AuthFailure" : @(AWSSimpleDBErrorAuthFailure),
                            @"AuthMissingFailure" : @(AWSSimpleDBErrorAuthMissingFailure),
                            @"AttributeDoesNotExist" : @(AWSSimpleDBErrorAttributeDoesNotExist),
                            @"DuplicateItemName" : @(AWSSimpleDBErrorDuplicateItemName),
                            @"InvalidNextToken" : @(AWSSimpleDBErrorInvalidNextToken),
                            @"InvalidNumberPredicates" : @(AWSSimpleDBErrorInvalidNumberPredicates),
                            @"InvalidNumberValueTests" : @(AWSSimpleDBErrorInvalidNumberValueTests),
                            @"InvalidParameterValue" : @(AWSSimpleDBErrorInvalidParameterValue),
                            @"InvalidQueryExpression" : @(AWSSimpleDBErrorInvalidQueryExpression),
                            @"MissingParameter" : @(AWSSimpleDBErrorMissingParameter),
                            @"NoSuchDomain" : @(AWSSimpleDBErrorNoSuchDomain),
                            @"NumberDomainAttributesExceeded" : @(AWSSimpleDBErrorNumberDomainAttributesExceeded),
                            @"NumberDomainBytesExceeded" : @(AWSSimpleDBErrorNumberDomainBytesExceeded),
                            @"NumberDomainsExceeded" : @(AWSSimpleDBErrorNumberDomainsExceeded),
                            @"NumberItemAttributesExceeded" : @(AWSSimpleDBErrorNumberItemAttributesExceeded),
                            @"NumberSubmittedAttributesExceeded" : @(AWSSimpleDBErrorNumberSubmittedAttributesExceeded),
                            @"NumberSubmittedItemsExceeded" : @(AWSSimpleDBErrorNumberSubmittedItemsExceeded),
                            @"RequestTimeout" : @(AWSSimpleDBErrorRequestTimeout),
                            @"TooManyRequestedAttributes" : @(AWSSimpleDBErrorTooManyRequestedAttributes),
                            };
}

#pragma mark -

+ (instancetype)serializerWithOutputClass:(Class)outputClass
                                 resource:(NSString *)resource
                               actionName:(NSString *)actionName {
    AWSSimpleDBResponseSerializer *serializer = [AWSSimpleDBResponseSerializer serializerWithResource:resource
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
                *error = [NSError errorWithDomain:AWSSimpleDBErrorDomain
                                             code:[errorCodeDictionary[errorInfo[@"Code"]] integerValue]
                                         userInfo:errorInfo
                          ];
                return responseObject;
            }
        } else if (errorInfo) {
            if (error) {
                *error = [NSError errorWithDomain:AWSSimpleDBErrorDomain
                                             code:AWSSimpleDBErrorUnknown
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

@interface AWSSimpleDBRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSimpleDBRequestRetryHandler

- (AWSNetworkingRetryType)shouldRetry:(uint32_t)currentRetryCount
                            response:(NSHTTPURLResponse *)response
                                data:(NSData *)data
                               error:(NSError *)error {
    AWSNetworkingRetryType retryType = [super shouldRetry:currentRetryCount
                                                response:response
                                                    data:data
                                                   error:error];
    if(retryType == AWSNetworkingRetryTypeShouldNotRetry
       && [error.domain isEqualToString:AWSSimpleDBErrorDomain]
       && currentRetryCount < self.maxRetryCount) {
        switch (error.code) {
            case AWSSimpleDBErrorAccessFailure:
            case AWSSimpleDBErrorAuthFailure:
            case AWSSimpleDBErrorAuthMissingFailure:
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

@interface AWSSimpleDB()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation AWSSimpleDB

+ (instancetype)defaultSimpleDB {
    if (![AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        return nil;
    }

    static AWSSimpleDB *_defaultSimpleDB = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultSimpleDB = [[AWSSimpleDB alloc] initWithConfiguration:[AWSServiceManager defaultServiceManager].defaultServiceConfiguration];
    });

    return _defaultSimpleDB;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        _configuration.endpoint = [AWSEndpoint endpointWithRegion:_configuration.regionType
                                                          service:AWSServiceSimpleDB];

        AWSSignatureV2Signer *signer = [AWSSignatureV2Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
        _configuration.retryHandler = [[AWSSimpleDBRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

    AWSQueryStringRequestSerializer *requestSerializer = [AWSQueryStringRequestSerializer serializerWithResource:AWSSimpleDBDefinitionFileName
                                                                                                      actionName:operationName];
    //    requestSerializer.additionalParameters = @{@"Action" : operationName,
    //                                               @"Version" : @"2009-04-15"};
    networkingRequest.requestSerializer = requestSerializer;

    networkingRequest.responseSerializer = [AWSSimpleDBResponseSerializer serializerWithOutputClass:outputClass
                                                                                           resource:AWSSimpleDBDefinitionFileName
                                                                                         actionName:operationName];

    return [self.networking sendRequest:networkingRequest];
}

#pragma mark - Service method

- (BFTask *)batchDeleteAttributes:(AWSSimpleDBBatchDeleteAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BatchDeleteAttributes"
                   outputClass:nil];
}

- (BFTask *)batchPutAttributes:(AWSSimpleDBBatchPutAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BatchPutAttributes"
                   outputClass:nil];
}

- (BFTask *)createDomain:(AWSSimpleDBCreateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDomain"
                   outputClass:nil];
}

- (BFTask *)deleteAttributes:(AWSSimpleDBDeleteAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteAttributes"
                   outputClass:nil];
}

- (BFTask *)deleteDomain:(AWSSimpleDBDeleteDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDomain"
                   outputClass:nil];
}

- (BFTask *)domainMetadata:(AWSSimpleDBDomainMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DomainMetadata"
                   outputClass:[AWSSimpleDBDomainMetadataResult class]];
}

- (BFTask *)getAttributes:(AWSSimpleDBGetAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetAttributes"
                   outputClass:[AWSSimpleDBGetAttributesResult class]];
}

- (BFTask *)listDomains:(AWSSimpleDBListDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListDomains"
                   outputClass:[AWSSimpleDBListDomainsResult class]];
}

- (BFTask *)putAttributes:(AWSSimpleDBPutAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutAttributes"
                   outputClass:nil];
}

- (BFTask *)select:(AWSSimpleDBSelectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Select"
                   outputClass:[AWSSimpleDBSelectResult class]];
}

@end