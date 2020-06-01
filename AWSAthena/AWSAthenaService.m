//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSAthenaService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSAthenaResources.h"

static NSString *const AWSInfoAthena = @"Athena";
NSString *const AWSAthenaSDKVersion = @"2.13.4";


@interface AWSAthenaResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSAthenaResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalServerException" : @(AWSAthenaErrorInternalServer),
                            @"InvalidRequestException" : @(AWSAthenaErrorInvalidRequest),
                            @"MetadataException" : @(AWSAthenaErrorMetadata),
                            @"ResourceNotFoundException" : @(AWSAthenaErrorResourceNotFound),
                            @"TooManyRequestsException" : @(AWSAthenaErrorTooManyRequests),
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
	                *error = [NSError errorWithDomain:AWSAthenaErrorDomain
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
        *error = [NSError errorWithDomain:AWSAthenaErrorDomain
                                     code:AWSAthenaErrorUnknown
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

@interface AWSAthenaRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSAthenaRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSAthena()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSAthena

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSAthenaSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSAthena versions need to match. Check your SDK installation. AWSCore: %@ AWSAthena: %@", AWSiOSSDKVersion, AWSAthenaSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultAthena {
    static AWSAthena *_defaultAthena = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoAthena];
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
        _defaultAthena = [[AWSAthena alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultAthena;
}

+ (void)registerAthenaWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSAthena alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)AthenaForKey:(NSString *)key {
    @synchronized(self) {
        AWSAthena *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoAthena
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSAthena registerAthenaWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeAthenaForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultAthena` or `+ AthenaForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAthena
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceAthena];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSAthenaRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSAthenaResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSAthenaResponseSerializer alloc] initWithJSONDefinition:[[AWSAthenaResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSAthenaBatchGetNamedQueryOutput *> *)batchGetNamedQuery:(AWSAthenaBatchGetNamedQueryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"BatchGetNamedQuery"
                   outputClass:[AWSAthenaBatchGetNamedQueryOutput class]];
}

- (void)batchGetNamedQuery:(AWSAthenaBatchGetNamedQueryInput *)request
     completionHandler:(void (^)(AWSAthenaBatchGetNamedQueryOutput *response, NSError *error))completionHandler {
    [[self batchGetNamedQuery:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaBatchGetNamedQueryOutput *> * _Nonnull task) {
        AWSAthenaBatchGetNamedQueryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaBatchGetQueryExecutionOutput *> *)batchGetQueryExecution:(AWSAthenaBatchGetQueryExecutionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"BatchGetQueryExecution"
                   outputClass:[AWSAthenaBatchGetQueryExecutionOutput class]];
}

- (void)batchGetQueryExecution:(AWSAthenaBatchGetQueryExecutionInput *)request
     completionHandler:(void (^)(AWSAthenaBatchGetQueryExecutionOutput *response, NSError *error))completionHandler {
    [[self batchGetQueryExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaBatchGetQueryExecutionOutput *> * _Nonnull task) {
        AWSAthenaBatchGetQueryExecutionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaCreateDataCatalogOutput *> *)createDataCatalog:(AWSAthenaCreateDataCatalogInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"CreateDataCatalog"
                   outputClass:[AWSAthenaCreateDataCatalogOutput class]];
}

- (void)createDataCatalog:(AWSAthenaCreateDataCatalogInput *)request
     completionHandler:(void (^)(AWSAthenaCreateDataCatalogOutput *response, NSError *error))completionHandler {
    [[self createDataCatalog:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaCreateDataCatalogOutput *> * _Nonnull task) {
        AWSAthenaCreateDataCatalogOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaCreateNamedQueryOutput *> *)createNamedQuery:(AWSAthenaCreateNamedQueryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"CreateNamedQuery"
                   outputClass:[AWSAthenaCreateNamedQueryOutput class]];
}

- (void)createNamedQuery:(AWSAthenaCreateNamedQueryInput *)request
     completionHandler:(void (^)(AWSAthenaCreateNamedQueryOutput *response, NSError *error))completionHandler {
    [[self createNamedQuery:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaCreateNamedQueryOutput *> * _Nonnull task) {
        AWSAthenaCreateNamedQueryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaCreateWorkGroupOutput *> *)createWorkGroup:(AWSAthenaCreateWorkGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"CreateWorkGroup"
                   outputClass:[AWSAthenaCreateWorkGroupOutput class]];
}

- (void)createWorkGroup:(AWSAthenaCreateWorkGroupInput *)request
     completionHandler:(void (^)(AWSAthenaCreateWorkGroupOutput *response, NSError *error))completionHandler {
    [[self createWorkGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaCreateWorkGroupOutput *> * _Nonnull task) {
        AWSAthenaCreateWorkGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaDeleteDataCatalogOutput *> *)deleteDataCatalog:(AWSAthenaDeleteDataCatalogInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"DeleteDataCatalog"
                   outputClass:[AWSAthenaDeleteDataCatalogOutput class]];
}

- (void)deleteDataCatalog:(AWSAthenaDeleteDataCatalogInput *)request
     completionHandler:(void (^)(AWSAthenaDeleteDataCatalogOutput *response, NSError *error))completionHandler {
    [[self deleteDataCatalog:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaDeleteDataCatalogOutput *> * _Nonnull task) {
        AWSAthenaDeleteDataCatalogOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaDeleteNamedQueryOutput *> *)deleteNamedQuery:(AWSAthenaDeleteNamedQueryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"DeleteNamedQuery"
                   outputClass:[AWSAthenaDeleteNamedQueryOutput class]];
}

- (void)deleteNamedQuery:(AWSAthenaDeleteNamedQueryInput *)request
     completionHandler:(void (^)(AWSAthenaDeleteNamedQueryOutput *response, NSError *error))completionHandler {
    [[self deleteNamedQuery:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaDeleteNamedQueryOutput *> * _Nonnull task) {
        AWSAthenaDeleteNamedQueryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaDeleteWorkGroupOutput *> *)deleteWorkGroup:(AWSAthenaDeleteWorkGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"DeleteWorkGroup"
                   outputClass:[AWSAthenaDeleteWorkGroupOutput class]];
}

- (void)deleteWorkGroup:(AWSAthenaDeleteWorkGroupInput *)request
     completionHandler:(void (^)(AWSAthenaDeleteWorkGroupOutput *response, NSError *error))completionHandler {
    [[self deleteWorkGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaDeleteWorkGroupOutput *> * _Nonnull task) {
        AWSAthenaDeleteWorkGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaGetDataCatalogOutput *> *)getDataCatalog:(AWSAthenaGetDataCatalogInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"GetDataCatalog"
                   outputClass:[AWSAthenaGetDataCatalogOutput class]];
}

- (void)getDataCatalog:(AWSAthenaGetDataCatalogInput *)request
     completionHandler:(void (^)(AWSAthenaGetDataCatalogOutput *response, NSError *error))completionHandler {
    [[self getDataCatalog:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaGetDataCatalogOutput *> * _Nonnull task) {
        AWSAthenaGetDataCatalogOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaGetDatabaseOutput *> *)getDatabase:(AWSAthenaGetDatabaseInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"GetDatabase"
                   outputClass:[AWSAthenaGetDatabaseOutput class]];
}

- (void)getDatabase:(AWSAthenaGetDatabaseInput *)request
     completionHandler:(void (^)(AWSAthenaGetDatabaseOutput *response, NSError *error))completionHandler {
    [[self getDatabase:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaGetDatabaseOutput *> * _Nonnull task) {
        AWSAthenaGetDatabaseOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaGetNamedQueryOutput *> *)getNamedQuery:(AWSAthenaGetNamedQueryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"GetNamedQuery"
                   outputClass:[AWSAthenaGetNamedQueryOutput class]];
}

- (void)getNamedQuery:(AWSAthenaGetNamedQueryInput *)request
     completionHandler:(void (^)(AWSAthenaGetNamedQueryOutput *response, NSError *error))completionHandler {
    [[self getNamedQuery:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaGetNamedQueryOutput *> * _Nonnull task) {
        AWSAthenaGetNamedQueryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaGetQueryExecutionOutput *> *)getQueryExecution:(AWSAthenaGetQueryExecutionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"GetQueryExecution"
                   outputClass:[AWSAthenaGetQueryExecutionOutput class]];
}

- (void)getQueryExecution:(AWSAthenaGetQueryExecutionInput *)request
     completionHandler:(void (^)(AWSAthenaGetQueryExecutionOutput *response, NSError *error))completionHandler {
    [[self getQueryExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaGetQueryExecutionOutput *> * _Nonnull task) {
        AWSAthenaGetQueryExecutionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaGetQueryResultsOutput *> *)getQueryResults:(AWSAthenaGetQueryResultsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"GetQueryResults"
                   outputClass:[AWSAthenaGetQueryResultsOutput class]];
}

- (void)getQueryResults:(AWSAthenaGetQueryResultsInput *)request
     completionHandler:(void (^)(AWSAthenaGetQueryResultsOutput *response, NSError *error))completionHandler {
    [[self getQueryResults:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaGetQueryResultsOutput *> * _Nonnull task) {
        AWSAthenaGetQueryResultsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaGetTableMetadataOutput *> *)getTableMetadata:(AWSAthenaGetTableMetadataInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"GetTableMetadata"
                   outputClass:[AWSAthenaGetTableMetadataOutput class]];
}

- (void)getTableMetadata:(AWSAthenaGetTableMetadataInput *)request
     completionHandler:(void (^)(AWSAthenaGetTableMetadataOutput *response, NSError *error))completionHandler {
    [[self getTableMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaGetTableMetadataOutput *> * _Nonnull task) {
        AWSAthenaGetTableMetadataOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaGetWorkGroupOutput *> *)getWorkGroup:(AWSAthenaGetWorkGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"GetWorkGroup"
                   outputClass:[AWSAthenaGetWorkGroupOutput class]];
}

- (void)getWorkGroup:(AWSAthenaGetWorkGroupInput *)request
     completionHandler:(void (^)(AWSAthenaGetWorkGroupOutput *response, NSError *error))completionHandler {
    [[self getWorkGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaGetWorkGroupOutput *> * _Nonnull task) {
        AWSAthenaGetWorkGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaListDataCatalogsOutput *> *)listDataCatalogs:(AWSAthenaListDataCatalogsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"ListDataCatalogs"
                   outputClass:[AWSAthenaListDataCatalogsOutput class]];
}

- (void)listDataCatalogs:(AWSAthenaListDataCatalogsInput *)request
     completionHandler:(void (^)(AWSAthenaListDataCatalogsOutput *response, NSError *error))completionHandler {
    [[self listDataCatalogs:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaListDataCatalogsOutput *> * _Nonnull task) {
        AWSAthenaListDataCatalogsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaListDatabasesOutput *> *)listDatabases:(AWSAthenaListDatabasesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"ListDatabases"
                   outputClass:[AWSAthenaListDatabasesOutput class]];
}

- (void)listDatabases:(AWSAthenaListDatabasesInput *)request
     completionHandler:(void (^)(AWSAthenaListDatabasesOutput *response, NSError *error))completionHandler {
    [[self listDatabases:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaListDatabasesOutput *> * _Nonnull task) {
        AWSAthenaListDatabasesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaListNamedQueriesOutput *> *)listNamedQueries:(AWSAthenaListNamedQueriesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"ListNamedQueries"
                   outputClass:[AWSAthenaListNamedQueriesOutput class]];
}

- (void)listNamedQueries:(AWSAthenaListNamedQueriesInput *)request
     completionHandler:(void (^)(AWSAthenaListNamedQueriesOutput *response, NSError *error))completionHandler {
    [[self listNamedQueries:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaListNamedQueriesOutput *> * _Nonnull task) {
        AWSAthenaListNamedQueriesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaListQueryExecutionsOutput *> *)listQueryExecutions:(AWSAthenaListQueryExecutionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"ListQueryExecutions"
                   outputClass:[AWSAthenaListQueryExecutionsOutput class]];
}

- (void)listQueryExecutions:(AWSAthenaListQueryExecutionsInput *)request
     completionHandler:(void (^)(AWSAthenaListQueryExecutionsOutput *response, NSError *error))completionHandler {
    [[self listQueryExecutions:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaListQueryExecutionsOutput *> * _Nonnull task) {
        AWSAthenaListQueryExecutionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaListTableMetadataOutput *> *)listTableMetadata:(AWSAthenaListTableMetadataInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"ListTableMetadata"
                   outputClass:[AWSAthenaListTableMetadataOutput class]];
}

- (void)listTableMetadata:(AWSAthenaListTableMetadataInput *)request
     completionHandler:(void (^)(AWSAthenaListTableMetadataOutput *response, NSError *error))completionHandler {
    [[self listTableMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaListTableMetadataOutput *> * _Nonnull task) {
        AWSAthenaListTableMetadataOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaListTagsForResourceOutput *> *)listTagsForResource:(AWSAthenaListTagsForResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSAthenaListTagsForResourceOutput class]];
}

- (void)listTagsForResource:(AWSAthenaListTagsForResourceInput *)request
     completionHandler:(void (^)(AWSAthenaListTagsForResourceOutput *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaListTagsForResourceOutput *> * _Nonnull task) {
        AWSAthenaListTagsForResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaListWorkGroupsOutput *> *)listWorkGroups:(AWSAthenaListWorkGroupsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"ListWorkGroups"
                   outputClass:[AWSAthenaListWorkGroupsOutput class]];
}

- (void)listWorkGroups:(AWSAthenaListWorkGroupsInput *)request
     completionHandler:(void (^)(AWSAthenaListWorkGroupsOutput *response, NSError *error))completionHandler {
    [[self listWorkGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaListWorkGroupsOutput *> * _Nonnull task) {
        AWSAthenaListWorkGroupsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaStartQueryExecutionOutput *> *)startQueryExecution:(AWSAthenaStartQueryExecutionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"StartQueryExecution"
                   outputClass:[AWSAthenaStartQueryExecutionOutput class]];
}

- (void)startQueryExecution:(AWSAthenaStartQueryExecutionInput *)request
     completionHandler:(void (^)(AWSAthenaStartQueryExecutionOutput *response, NSError *error))completionHandler {
    [[self startQueryExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaStartQueryExecutionOutput *> * _Nonnull task) {
        AWSAthenaStartQueryExecutionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaStopQueryExecutionOutput *> *)stopQueryExecution:(AWSAthenaStopQueryExecutionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"StopQueryExecution"
                   outputClass:[AWSAthenaStopQueryExecutionOutput class]];
}

- (void)stopQueryExecution:(AWSAthenaStopQueryExecutionInput *)request
     completionHandler:(void (^)(AWSAthenaStopQueryExecutionOutput *response, NSError *error))completionHandler {
    [[self stopQueryExecution:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaStopQueryExecutionOutput *> * _Nonnull task) {
        AWSAthenaStopQueryExecutionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaTagResourceOutput *> *)tagResource:(AWSAthenaTagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"TagResource"
                   outputClass:[AWSAthenaTagResourceOutput class]];
}

- (void)tagResource:(AWSAthenaTagResourceInput *)request
     completionHandler:(void (^)(AWSAthenaTagResourceOutput *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaTagResourceOutput *> * _Nonnull task) {
        AWSAthenaTagResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaUntagResourceOutput *> *)untagResource:(AWSAthenaUntagResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"UntagResource"
                   outputClass:[AWSAthenaUntagResourceOutput class]];
}

- (void)untagResource:(AWSAthenaUntagResourceInput *)request
     completionHandler:(void (^)(AWSAthenaUntagResourceOutput *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaUntagResourceOutput *> * _Nonnull task) {
        AWSAthenaUntagResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaUpdateDataCatalogOutput *> *)updateDataCatalog:(AWSAthenaUpdateDataCatalogInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"UpdateDataCatalog"
                   outputClass:[AWSAthenaUpdateDataCatalogOutput class]];
}

- (void)updateDataCatalog:(AWSAthenaUpdateDataCatalogInput *)request
     completionHandler:(void (^)(AWSAthenaUpdateDataCatalogOutput *response, NSError *error))completionHandler {
    [[self updateDataCatalog:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaUpdateDataCatalogOutput *> * _Nonnull task) {
        AWSAthenaUpdateDataCatalogOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSAthenaUpdateWorkGroupOutput *> *)updateWorkGroup:(AWSAthenaUpdateWorkGroupInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AmazonAthena"
                 operationName:@"UpdateWorkGroup"
                   outputClass:[AWSAthenaUpdateWorkGroupOutput class]];
}

- (void)updateWorkGroup:(AWSAthenaUpdateWorkGroupInput *)request
     completionHandler:(void (^)(AWSAthenaUpdateWorkGroupOutput *response, NSError *error))completionHandler {
    [[self updateWorkGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSAthenaUpdateWorkGroupOutput *> * _Nonnull task) {
        AWSAthenaUpdateWorkGroupOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
