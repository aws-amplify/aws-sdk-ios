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

#import "AWSschemasService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSschemasResources.h"

static NSString *const AWSInfoschemas = @"schemas";
NSString *const AWSschemasSDKVersion = @"2.13.3";


@interface AWSschemasResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSschemasResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSschemasErrorBadRequest),
                            @"ConflictException" : @(AWSschemasErrorConflict),
                            @"ForbiddenException" : @(AWSschemasErrorForbidden),
                            @"GoneException" : @(AWSschemasErrorGone),
                            @"InternalServerErrorException" : @(AWSschemasErrorInternalServerError),
                            @"NotFoundException" : @(AWSschemasErrorNotFound),
                            @"PreconditionFailedException" : @(AWSschemasErrorPreconditionFailed),
                            @"ServiceUnavailableException" : @(AWSschemasErrorServiceUnavailable),
                            @"TooManyRequestsException" : @(AWSschemasErrorTooManyRequests),
                            @"UnauthorizedException" : @(AWSschemasErrorUnauthorized),
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
    	NSString *errorTypeString = [[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"];
        NSString *errorTypeHeader = [[errorTypeString componentsSeparatedByString:@":"] firstObject];

        if ([errorTypeString length] > 0 && errorTypeHeader) {
            if (errorCodeDictionary[errorTypeHeader]) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSschemasErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSschemasErrorDomain
                                                 code:AWSschemasErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSschemasErrorDomain
                                     code:AWSschemasErrorUnknown
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

@interface AWSschemasRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSschemasRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSschemas()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSschemas

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSschemasSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSschemas versions need to match. Check your SDK installation. AWSCore: %@ AWSschemas: %@", AWSiOSSDKVersion, AWSschemasSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultschemas {
    static AWSschemas *_defaultschemas = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoschemas];
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
        _defaultschemas = [[AWSschemas alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultschemas;
}

+ (void)registerschemasWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSschemas alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)schemasForKey:(NSString *)key {
    @synchronized(self) {
        AWSschemas *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoschemas
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSschemas registerschemasWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeschemasForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultschemas` or `+ schemasForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceschemas
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceschemas];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSschemasRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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

        networkingRequest.HTTPMethod = HTTPMethod;
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSschemasResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSschemasResponseSerializer alloc] initWithJSONDefinition:[[AWSschemasResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSschemasCreateDiscovererResponse *> *)createDiscoverer:(AWSschemasCreateDiscovererRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/discoverers"
                  targetPrefix:@""
                 operationName:@"CreateDiscoverer"
                   outputClass:[AWSschemasCreateDiscovererResponse class]];
}

- (void)createDiscoverer:(AWSschemasCreateDiscovererRequest *)request
     completionHandler:(void (^)(AWSschemasCreateDiscovererResponse *response, NSError *error))completionHandler {
    [[self createDiscoverer:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasCreateDiscovererResponse *> * _Nonnull task) {
        AWSschemasCreateDiscovererResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasCreateRegistryResponse *> *)createRegistry:(AWSschemasCreateRegistryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/registries/name/{registryName}"
                  targetPrefix:@""
                 operationName:@"CreateRegistry"
                   outputClass:[AWSschemasCreateRegistryResponse class]];
}

- (void)createRegistry:(AWSschemasCreateRegistryRequest *)request
     completionHandler:(void (^)(AWSschemasCreateRegistryResponse *response, NSError *error))completionHandler {
    [[self createRegistry:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasCreateRegistryResponse *> * _Nonnull task) {
        AWSschemasCreateRegistryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasCreateSchemaResponse *> *)createSchema:(AWSschemasCreateSchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/registries/name/{registryName}/schemas/name/{schemaName}"
                  targetPrefix:@""
                 operationName:@"CreateSchema"
                   outputClass:[AWSschemasCreateSchemaResponse class]];
}

- (void)createSchema:(AWSschemasCreateSchemaRequest *)request
     completionHandler:(void (^)(AWSschemasCreateSchemaResponse *response, NSError *error))completionHandler {
    [[self createSchema:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasCreateSchemaResponse *> * _Nonnull task) {
        AWSschemasCreateSchemaResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteDiscoverer:(AWSschemasDeleteDiscovererRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/discoverers/id/{discovererId}"
                  targetPrefix:@""
                 operationName:@"DeleteDiscoverer"
                   outputClass:nil];
}

- (void)deleteDiscoverer:(AWSschemasDeleteDiscovererRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteDiscoverer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteRegistry:(AWSschemasDeleteRegistryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/registries/name/{registryName}"
                  targetPrefix:@""
                 operationName:@"DeleteRegistry"
                   outputClass:nil];
}

- (void)deleteRegistry:(AWSschemasDeleteRegistryRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteRegistry:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteResourcePolicy:(AWSschemasDeleteResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/policy"
                  targetPrefix:@""
                 operationName:@"DeleteResourcePolicy"
                   outputClass:nil];
}

- (void)deleteResourcePolicy:(AWSschemasDeleteResourcePolicyRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSchema:(AWSschemasDeleteSchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/registries/name/{registryName}/schemas/name/{schemaName}"
                  targetPrefix:@""
                 operationName:@"DeleteSchema"
                   outputClass:nil];
}

- (void)deleteSchema:(AWSschemasDeleteSchemaRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSchema:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteSchemaVersion:(AWSschemasDeleteSchemaVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/registries/name/{registryName}/schemas/name/{schemaName}/version/{schemaVersion}"
                  targetPrefix:@""
                 operationName:@"DeleteSchemaVersion"
                   outputClass:nil];
}

- (void)deleteSchemaVersion:(AWSschemasDeleteSchemaVersionRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteSchemaVersion:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasDescribeCodeBindingResponse *> *)describeCodeBinding:(AWSschemasDescribeCodeBindingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/registries/name/{registryName}/schemas/name/{schemaName}/language/{language}"
                  targetPrefix:@""
                 operationName:@"DescribeCodeBinding"
                   outputClass:[AWSschemasDescribeCodeBindingResponse class]];
}

- (void)describeCodeBinding:(AWSschemasDescribeCodeBindingRequest *)request
     completionHandler:(void (^)(AWSschemasDescribeCodeBindingResponse *response, NSError *error))completionHandler {
    [[self describeCodeBinding:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasDescribeCodeBindingResponse *> * _Nonnull task) {
        AWSschemasDescribeCodeBindingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasDescribeDiscovererResponse *> *)describeDiscoverer:(AWSschemasDescribeDiscovererRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/discoverers/id/{discovererId}"
                  targetPrefix:@""
                 operationName:@"DescribeDiscoverer"
                   outputClass:[AWSschemasDescribeDiscovererResponse class]];
}

- (void)describeDiscoverer:(AWSschemasDescribeDiscovererRequest *)request
     completionHandler:(void (^)(AWSschemasDescribeDiscovererResponse *response, NSError *error))completionHandler {
    [[self describeDiscoverer:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasDescribeDiscovererResponse *> * _Nonnull task) {
        AWSschemasDescribeDiscovererResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasDescribeRegistryResponse *> *)describeRegistry:(AWSschemasDescribeRegistryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/registries/name/{registryName}"
                  targetPrefix:@""
                 operationName:@"DescribeRegistry"
                   outputClass:[AWSschemasDescribeRegistryResponse class]];
}

- (void)describeRegistry:(AWSschemasDescribeRegistryRequest *)request
     completionHandler:(void (^)(AWSschemasDescribeRegistryResponse *response, NSError *error))completionHandler {
    [[self describeRegistry:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasDescribeRegistryResponse *> * _Nonnull task) {
        AWSschemasDescribeRegistryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasDescribeSchemaResponse *> *)describeSchema:(AWSschemasDescribeSchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/registries/name/{registryName}/schemas/name/{schemaName}"
                  targetPrefix:@""
                 operationName:@"DescribeSchema"
                   outputClass:[AWSschemasDescribeSchemaResponse class]];
}

- (void)describeSchema:(AWSschemasDescribeSchemaRequest *)request
     completionHandler:(void (^)(AWSschemasDescribeSchemaResponse *response, NSError *error))completionHandler {
    [[self describeSchema:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasDescribeSchemaResponse *> * _Nonnull task) {
        AWSschemasDescribeSchemaResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasGetCodeBindingSourceResponse *> *)getCodeBindingSource:(AWSschemasGetCodeBindingSourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/registries/name/{registryName}/schemas/name/{schemaName}/language/{language}/source"
                  targetPrefix:@""
                 operationName:@"GetCodeBindingSource"
                   outputClass:[AWSschemasGetCodeBindingSourceResponse class]];
}

- (void)getCodeBindingSource:(AWSschemasGetCodeBindingSourceRequest *)request
     completionHandler:(void (^)(AWSschemasGetCodeBindingSourceResponse *response, NSError *error))completionHandler {
    [[self getCodeBindingSource:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasGetCodeBindingSourceResponse *> * _Nonnull task) {
        AWSschemasGetCodeBindingSourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasGetDiscoveredSchemaResponse *> *)getDiscoveredSchema:(AWSschemasGetDiscoveredSchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/discover"
                  targetPrefix:@""
                 operationName:@"GetDiscoveredSchema"
                   outputClass:[AWSschemasGetDiscoveredSchemaResponse class]];
}

- (void)getDiscoveredSchema:(AWSschemasGetDiscoveredSchemaRequest *)request
     completionHandler:(void (^)(AWSschemasGetDiscoveredSchemaResponse *response, NSError *error))completionHandler {
    [[self getDiscoveredSchema:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasGetDiscoveredSchemaResponse *> * _Nonnull task) {
        AWSschemasGetDiscoveredSchemaResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasGetResourcePolicyResponse *> *)getResourcePolicy:(AWSschemasGetResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/policy"
                  targetPrefix:@""
                 operationName:@"GetResourcePolicy"
                   outputClass:[AWSschemasGetResourcePolicyResponse class]];
}

- (void)getResourcePolicy:(AWSschemasGetResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSschemasGetResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self getResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasGetResourcePolicyResponse *> * _Nonnull task) {
        AWSschemasGetResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasListDiscoverersResponse *> *)listDiscoverers:(AWSschemasListDiscoverersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/discoverers"
                  targetPrefix:@""
                 operationName:@"ListDiscoverers"
                   outputClass:[AWSschemasListDiscoverersResponse class]];
}

- (void)listDiscoverers:(AWSschemasListDiscoverersRequest *)request
     completionHandler:(void (^)(AWSschemasListDiscoverersResponse *response, NSError *error))completionHandler {
    [[self listDiscoverers:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasListDiscoverersResponse *> * _Nonnull task) {
        AWSschemasListDiscoverersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasListRegistriesResponse *> *)listRegistries:(AWSschemasListRegistriesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/registries"
                  targetPrefix:@""
                 operationName:@"ListRegistries"
                   outputClass:[AWSschemasListRegistriesResponse class]];
}

- (void)listRegistries:(AWSschemasListRegistriesRequest *)request
     completionHandler:(void (^)(AWSschemasListRegistriesResponse *response, NSError *error))completionHandler {
    [[self listRegistries:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasListRegistriesResponse *> * _Nonnull task) {
        AWSschemasListRegistriesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasListSchemaVersionsResponse *> *)listSchemaVersions:(AWSschemasListSchemaVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/registries/name/{registryName}/schemas/name/{schemaName}/versions"
                  targetPrefix:@""
                 operationName:@"ListSchemaVersions"
                   outputClass:[AWSschemasListSchemaVersionsResponse class]];
}

- (void)listSchemaVersions:(AWSschemasListSchemaVersionsRequest *)request
     completionHandler:(void (^)(AWSschemasListSchemaVersionsResponse *response, NSError *error))completionHandler {
    [[self listSchemaVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasListSchemaVersionsResponse *> * _Nonnull task) {
        AWSschemasListSchemaVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasListSchemasResponse *> *)listSchemas:(AWSschemasListSchemasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/registries/name/{registryName}/schemas"
                  targetPrefix:@""
                 operationName:@"ListSchemas"
                   outputClass:[AWSschemasListSchemasResponse class]];
}

- (void)listSchemas:(AWSschemasListSchemasRequest *)request
     completionHandler:(void (^)(AWSschemasListSchemasResponse *response, NSError *error))completionHandler {
    [[self listSchemas:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasListSchemasResponse *> * _Nonnull task) {
        AWSschemasListSchemasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasListTagsForResourceResponse *> *)listTagsForResource:(AWSschemasListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSschemasListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSschemasListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSschemasListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasListTagsForResourceResponse *> * _Nonnull task) {
        AWSschemasListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasPutCodeBindingResponse *> *)putCodeBinding:(AWSschemasPutCodeBindingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/registries/name/{registryName}/schemas/name/{schemaName}/language/{language}"
                  targetPrefix:@""
                 operationName:@"PutCodeBinding"
                   outputClass:[AWSschemasPutCodeBindingResponse class]];
}

- (void)putCodeBinding:(AWSschemasPutCodeBindingRequest *)request
     completionHandler:(void (^)(AWSschemasPutCodeBindingResponse *response, NSError *error))completionHandler {
    [[self putCodeBinding:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasPutCodeBindingResponse *> * _Nonnull task) {
        AWSschemasPutCodeBindingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasPutResourcePolicyResponse *> *)putResourcePolicy:(AWSschemasPutResourcePolicyRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/policy"
                  targetPrefix:@""
                 operationName:@"PutResourcePolicy"
                   outputClass:[AWSschemasPutResourcePolicyResponse class]];
}

- (void)putResourcePolicy:(AWSschemasPutResourcePolicyRequest *)request
     completionHandler:(void (^)(AWSschemasPutResourcePolicyResponse *response, NSError *error))completionHandler {
    [[self putResourcePolicy:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasPutResourcePolicyResponse *> * _Nonnull task) {
        AWSschemasPutResourcePolicyResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasSearchSchemasResponse *> *)searchSchemas:(AWSschemasSearchSchemasRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/registries/name/{registryName}/schemas/search"
                  targetPrefix:@""
                 operationName:@"SearchSchemas"
                   outputClass:[AWSschemasSearchSchemasResponse class]];
}

- (void)searchSchemas:(AWSschemasSearchSchemasRequest *)request
     completionHandler:(void (^)(AWSschemasSearchSchemasResponse *response, NSError *error))completionHandler {
    [[self searchSchemas:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasSearchSchemasResponse *> * _Nonnull task) {
        AWSschemasSearchSchemasResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasStartDiscovererResponse *> *)startDiscoverer:(AWSschemasStartDiscovererRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/discoverers/id/{discovererId}/start"
                  targetPrefix:@""
                 operationName:@"StartDiscoverer"
                   outputClass:[AWSschemasStartDiscovererResponse class]];
}

- (void)startDiscoverer:(AWSschemasStartDiscovererRequest *)request
     completionHandler:(void (^)(AWSschemasStartDiscovererResponse *response, NSError *error))completionHandler {
    [[self startDiscoverer:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasStartDiscovererResponse *> * _Nonnull task) {
        AWSschemasStartDiscovererResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasStopDiscovererResponse *> *)stopDiscoverer:(AWSschemasStopDiscovererRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/discoverers/id/{discovererId}/stop"
                  targetPrefix:@""
                 operationName:@"StopDiscoverer"
                   outputClass:[AWSschemasStopDiscovererResponse class]];
}

- (void)stopDiscoverer:(AWSschemasStopDiscovererRequest *)request
     completionHandler:(void (^)(AWSschemasStopDiscovererResponse *response, NSError *error))completionHandler {
    [[self stopDiscoverer:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasStopDiscovererResponse *> * _Nonnull task) {
        AWSschemasStopDiscovererResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSschemasTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSschemasTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSschemasUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSschemasUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasUpdateDiscovererResponse *> *)updateDiscoverer:(AWSschemasUpdateDiscovererRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/discoverers/id/{discovererId}"
                  targetPrefix:@""
                 operationName:@"UpdateDiscoverer"
                   outputClass:[AWSschemasUpdateDiscovererResponse class]];
}

- (void)updateDiscoverer:(AWSschemasUpdateDiscovererRequest *)request
     completionHandler:(void (^)(AWSschemasUpdateDiscovererResponse *response, NSError *error))completionHandler {
    [[self updateDiscoverer:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasUpdateDiscovererResponse *> * _Nonnull task) {
        AWSschemasUpdateDiscovererResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasUpdateRegistryResponse *> *)updateRegistry:(AWSschemasUpdateRegistryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/registries/name/{registryName}"
                  targetPrefix:@""
                 operationName:@"UpdateRegistry"
                   outputClass:[AWSschemasUpdateRegistryResponse class]];
}

- (void)updateRegistry:(AWSschemasUpdateRegistryRequest *)request
     completionHandler:(void (^)(AWSschemasUpdateRegistryResponse *response, NSError *error))completionHandler {
    [[self updateRegistry:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasUpdateRegistryResponse *> * _Nonnull task) {
        AWSschemasUpdateRegistryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSschemasUpdateSchemaResponse *> *)updateSchema:(AWSschemasUpdateSchemaRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/registries/name/{registryName}/schemas/name/{schemaName}"
                  targetPrefix:@""
                 operationName:@"UpdateSchema"
                   outputClass:[AWSschemasUpdateSchemaResponse class]];
}

- (void)updateSchema:(AWSschemasUpdateSchemaRequest *)request
     completionHandler:(void (^)(AWSschemasUpdateSchemaResponse *response, NSError *error))completionHandler {
    [[self updateSchema:request] continueWithBlock:^id _Nullable(AWSTask<AWSschemasUpdateSchemaResponse *> * _Nonnull task) {
        AWSschemasUpdateSchemaResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
