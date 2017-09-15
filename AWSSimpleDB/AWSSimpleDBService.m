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

#import "AWSSimpleDBService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSSimpleDBResources.h"

static NSString *const AWSInfoSimpleDB = @"SimpleDB";
static NSString *const AWSSimpleDBSDKVersion = @"2.6.1";


@interface AWSSimpleDBResponseSerializer : AWSXMLResponseSerializer

@end

@implementation AWSSimpleDBResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
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
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSSimpleDBErrorDomain
                                     code:AWSSimpleDBErrorUnknown
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

@interface AWSSimpleDBRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSSimpleDBRequestRetryHandler

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

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSSimpleDB

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSSimpleDBSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSSimpleDB versions need to match. Check your SDK installation. AWSCore: %@ AWSSimpleDB: %@", AWSiOSSDKVersion, AWSSimpleDBSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultSimpleDB {
    static AWSSimpleDB *_defaultSimpleDB = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoSimpleDB];
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
        _defaultSimpleDB = [[AWSSimpleDB alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultSimpleDB;
}

+ (void)registerSimpleDBWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSSimpleDB alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)SimpleDBForKey:(NSString *)key {
    @synchronized(self) {
        AWSSimpleDB *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoSimpleDB
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSSimpleDB registerSimpleDBWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeSimpleDBForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultSimpleDB` or `+ SimpleDBForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceSimpleDB
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceSimpleDB];
        }
       	
          
        AWSSignatureV2Signer *signer = [AWSSignatureV2Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSSimpleDBRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
         
		
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
        networkingRequest.requestSerializer = [[AWSQueryStringRequestSerializer alloc] initWithJSONDefinition:[[AWSSimpleDBResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSSimpleDBResponseSerializer alloc] initWithJSONDefinition:[[AWSSimpleDBResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)batchDeleteAttributes:(AWSSimpleDBBatchDeleteAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BatchDeleteAttributes"
                   outputClass:nil];
}

- (void)batchDeleteAttributes:(AWSSimpleDBBatchDeleteAttributesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self batchDeleteAttributes:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)batchPutAttributes:(AWSSimpleDBBatchPutAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"BatchPutAttributes"
                   outputClass:nil];
}

- (void)batchPutAttributes:(AWSSimpleDBBatchPutAttributesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self batchPutAttributes:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)createDomain:(AWSSimpleDBCreateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"CreateDomain"
                   outputClass:nil];
}

- (void)createDomain:(AWSSimpleDBCreateDomainRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createDomain:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAttributes:(AWSSimpleDBDeleteAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteAttributes"
                   outputClass:nil];
}

- (void)deleteAttributes:(AWSSimpleDBDeleteAttributesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAttributes:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDomain:(AWSSimpleDBDeleteDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DeleteDomain"
                   outputClass:nil];
}

- (void)deleteDomain:(AWSSimpleDBDeleteDomainRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDomain:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleDBDomainMetadataResult *> *)domainMetadata:(AWSSimpleDBDomainMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"DomainMetadata"
                   outputClass:[AWSSimpleDBDomainMetadataResult class]];
}

- (void)domainMetadata:(AWSSimpleDBDomainMetadataRequest *)request
     completionHandler:(void (^)(AWSSimpleDBDomainMetadataResult *response, NSError *error))completionHandler {
    [[self domainMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleDBDomainMetadataResult *> * _Nonnull task) {
        AWSSimpleDBDomainMetadataResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleDBGetAttributesResult *> *)getAttributes:(AWSSimpleDBGetAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"GetAttributes"
                   outputClass:[AWSSimpleDBGetAttributesResult class]];
}

- (void)getAttributes:(AWSSimpleDBGetAttributesRequest *)request
     completionHandler:(void (^)(AWSSimpleDBGetAttributesResult *response, NSError *error))completionHandler {
    [[self getAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleDBGetAttributesResult *> * _Nonnull task) {
        AWSSimpleDBGetAttributesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleDBListDomainsResult *> *)listDomains:(AWSSimpleDBListDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"ListDomains"
                   outputClass:[AWSSimpleDBListDomainsResult class]];
}

- (void)listDomains:(AWSSimpleDBListDomainsRequest *)request
     completionHandler:(void (^)(AWSSimpleDBListDomainsResult *response, NSError *error))completionHandler {
    [[self listDomains:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleDBListDomainsResult *> * _Nonnull task) {
        AWSSimpleDBListDomainsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putAttributes:(AWSSimpleDBPutAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"PutAttributes"
                   outputClass:nil];
}

- (void)putAttributes:(AWSSimpleDBPutAttributesRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putAttributes:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSSimpleDBSelectResult *> *)select:(AWSSimpleDBSelectRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@""
                 operationName:@"Select"
                   outputClass:[AWSSimpleDBSelectResult class]];
}

- (void)select:(AWSSimpleDBSelectRequest *)request
     completionHandler:(void (^)(AWSSimpleDBSelectResult *response, NSError *error))completionHandler {
    [[self select:request] continueWithBlock:^id _Nullable(AWSTask<AWSSimpleDBSelectResult *> * _Nonnull task) {
        AWSSimpleDBSelectResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
