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

#import "AWSElasticsearchserviceService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSElasticsearchserviceResources.h"

static NSString *const AWSInfoElasticsearchservice = @"Elasticsearchservice";
NSString *const AWSElasticsearchserviceSDKVersion = @"2.13.4";


@interface AWSElasticsearchserviceResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSElasticsearchserviceResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSElasticsearchserviceErrorAccessDenied),
                            @"BaseException" : @(AWSElasticsearchserviceErrorBase),
                            @"ConflictException" : @(AWSElasticsearchserviceErrorConflict),
                            @"DisabledOperationException" : @(AWSElasticsearchserviceErrorDisabledOperation),
                            @"InternalException" : @(AWSElasticsearchserviceErrorInternal),
                            @"InvalidPaginationTokenException" : @(AWSElasticsearchserviceErrorInvalidPaginationToken),
                            @"InvalidTypeException" : @(AWSElasticsearchserviceErrorInvalidType),
                            @"LimitExceededException" : @(AWSElasticsearchserviceErrorLimitExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSElasticsearchserviceErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSElasticsearchserviceErrorResourceNotFound),
                            @"ValidationException" : @(AWSElasticsearchserviceErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSElasticsearchserviceErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSElasticsearchserviceErrorDomain
                                                 code:AWSElasticsearchserviceErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSElasticsearchserviceErrorDomain
                                     code:AWSElasticsearchserviceErrorUnknown
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

@interface AWSElasticsearchserviceRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSElasticsearchserviceRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSElasticsearchservice()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSElasticsearchservice

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSElasticsearchserviceSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSElasticsearchservice versions need to match. Check your SDK installation. AWSCore: %@ AWSElasticsearchservice: %@", AWSiOSSDKVersion, AWSElasticsearchserviceSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultElasticsearchservice {
    static AWSElasticsearchservice *_defaultElasticsearchservice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoElasticsearchservice];
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
        _defaultElasticsearchservice = [[AWSElasticsearchservice alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultElasticsearchservice;
}

+ (void)registerElasticsearchserviceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSElasticsearchservice alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ElasticsearchserviceForKey:(NSString *)key {
    @synchronized(self) {
        AWSElasticsearchservice *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoElasticsearchservice
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSElasticsearchservice registerElasticsearchserviceWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeElasticsearchserviceForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultElasticsearchservice` or `+ ElasticsearchserviceForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceElasticsearchservice
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceElasticsearchservice];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSElasticsearchserviceRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
        _configuration.headers = @{@"Content-Type" : @"application/x-amz-json-1.0"}; 
		
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSElasticsearchserviceResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSElasticsearchserviceResponseSerializer alloc] initWithJSONDefinition:[[AWSElasticsearchserviceResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse *> *)acceptInboundCrossClusterSearchConnection:(AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2015-01-01/es/ccs/inboundConnection/{ConnectionId}/accept"
                  targetPrefix:@""
                 operationName:@"AcceptInboundCrossClusterSearchConnection"
                   outputClass:[AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse class]];
}

- (void)acceptInboundCrossClusterSearchConnection:(AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse *response, NSError *error))completionHandler {
    [[self acceptInboundCrossClusterSearchConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse *> * _Nonnull task) {
        AWSElasticsearchserviceAcceptInboundCrossClusterSearchConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)addTags:(AWSElasticsearchserviceAddTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/tags"
                  targetPrefix:@""
                 operationName:@"AddTags"
                   outputClass:nil];
}

- (void)addTags:(AWSElasticsearchserviceAddTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceAssociatePackageResponse *> *)associatePackage:(AWSElasticsearchserviceAssociatePackageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/packages/associate/{PackageID}/{DomainName}"
                  targetPrefix:@""
                 operationName:@"AssociatePackage"
                   outputClass:[AWSElasticsearchserviceAssociatePackageResponse class]];
}

- (void)associatePackage:(AWSElasticsearchserviceAssociatePackageRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceAssociatePackageResponse *response, NSError *error))completionHandler {
    [[self associatePackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceAssociatePackageResponse *> * _Nonnull task) {
        AWSElasticsearchserviceAssociatePackageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse *> *)cancelElasticsearchServiceSoftwareUpdate:(AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/serviceSoftwareUpdate/cancel"
                  targetPrefix:@""
                 operationName:@"CancelElasticsearchServiceSoftwareUpdate"
                   outputClass:[AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse class]];
}

- (void)cancelElasticsearchServiceSoftwareUpdate:(AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse *response, NSError *error))completionHandler {
    [[self cancelElasticsearchServiceSoftwareUpdate:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse *> * _Nonnull task) {
        AWSElasticsearchserviceCancelElasticsearchServiceSoftwareUpdateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceCreateElasticsearchDomainResponse *> *)createElasticsearchDomain:(AWSElasticsearchserviceCreateElasticsearchDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/domain"
                  targetPrefix:@""
                 operationName:@"CreateElasticsearchDomain"
                   outputClass:[AWSElasticsearchserviceCreateElasticsearchDomainResponse class]];
}

- (void)createElasticsearchDomain:(AWSElasticsearchserviceCreateElasticsearchDomainRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceCreateElasticsearchDomainResponse *response, NSError *error))completionHandler {
    [[self createElasticsearchDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceCreateElasticsearchDomainResponse *> * _Nonnull task) {
        AWSElasticsearchserviceCreateElasticsearchDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse *> *)createOutboundCrossClusterSearchConnection:(AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/ccs/outboundConnection"
                  targetPrefix:@""
                 operationName:@"CreateOutboundCrossClusterSearchConnection"
                   outputClass:[AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse class]];
}

- (void)createOutboundCrossClusterSearchConnection:(AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse *response, NSError *error))completionHandler {
    [[self createOutboundCrossClusterSearchConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse *> * _Nonnull task) {
        AWSElasticsearchserviceCreateOutboundCrossClusterSearchConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceCreatePackageResponse *> *)createPackage:(AWSElasticsearchserviceCreatePackageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/packages"
                  targetPrefix:@""
                 operationName:@"CreatePackage"
                   outputClass:[AWSElasticsearchserviceCreatePackageResponse class]];
}

- (void)createPackage:(AWSElasticsearchserviceCreatePackageRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceCreatePackageResponse *response, NSError *error))completionHandler {
    [[self createPackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceCreatePackageResponse *> * _Nonnull task) {
        AWSElasticsearchserviceCreatePackageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDeleteElasticsearchDomainResponse *> *)deleteElasticsearchDomain:(AWSElasticsearchserviceDeleteElasticsearchDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-01-01/es/domain/{DomainName}"
                  targetPrefix:@""
                 operationName:@"DeleteElasticsearchDomain"
                   outputClass:[AWSElasticsearchserviceDeleteElasticsearchDomainResponse class]];
}

- (void)deleteElasticsearchDomain:(AWSElasticsearchserviceDeleteElasticsearchDomainRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDeleteElasticsearchDomainResponse *response, NSError *error))completionHandler {
    [[self deleteElasticsearchDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDeleteElasticsearchDomainResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDeleteElasticsearchDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteElasticsearchServiceRole:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-01-01/es/role"
                  targetPrefix:@""
                 operationName:@"DeleteElasticsearchServiceRole"
                   outputClass:nil];
}

- (void)deleteElasticsearchServiceRole:(AWSRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteElasticsearchServiceRole:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse *> *)deleteInboundCrossClusterSearchConnection:(AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-01-01/es/ccs/inboundConnection/{ConnectionId}"
                  targetPrefix:@""
                 operationName:@"DeleteInboundCrossClusterSearchConnection"
                   outputClass:[AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse class]];
}

- (void)deleteInboundCrossClusterSearchConnection:(AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse *response, NSError *error))completionHandler {
    [[self deleteInboundCrossClusterSearchConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDeleteInboundCrossClusterSearchConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse *> *)deleteOutboundCrossClusterSearchConnection:(AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-01-01/es/ccs/outboundConnection/{ConnectionId}"
                  targetPrefix:@""
                 operationName:@"DeleteOutboundCrossClusterSearchConnection"
                   outputClass:[AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse class]];
}

- (void)deleteOutboundCrossClusterSearchConnection:(AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse *response, NSError *error))completionHandler {
    [[self deleteOutboundCrossClusterSearchConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDeleteOutboundCrossClusterSearchConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDeletePackageResponse *> *)deletePackage:(AWSElasticsearchserviceDeletePackageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-01-01/packages/{PackageID}"
                  targetPrefix:@""
                 operationName:@"DeletePackage"
                   outputClass:[AWSElasticsearchserviceDeletePackageResponse class]];
}

- (void)deletePackage:(AWSElasticsearchserviceDeletePackageRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDeletePackageResponse *response, NSError *error))completionHandler {
    [[self deletePackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDeletePackageResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDeletePackageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDescribeElasticsearchDomainResponse *> *)describeElasticsearchDomain:(AWSElasticsearchserviceDescribeElasticsearchDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/domain/{DomainName}"
                  targetPrefix:@""
                 operationName:@"DescribeElasticsearchDomain"
                   outputClass:[AWSElasticsearchserviceDescribeElasticsearchDomainResponse class]];
}

- (void)describeElasticsearchDomain:(AWSElasticsearchserviceDescribeElasticsearchDomainRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDescribeElasticsearchDomainResponse *response, NSError *error))completionHandler {
    [[self describeElasticsearchDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDescribeElasticsearchDomainResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDescribeElasticsearchDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse *> *)describeElasticsearchDomainConfig:(AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/domain/{DomainName}/config"
                  targetPrefix:@""
                 operationName:@"DescribeElasticsearchDomainConfig"
                   outputClass:[AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse class]];
}

- (void)describeElasticsearchDomainConfig:(AWSElasticsearchserviceDescribeElasticsearchDomainConfigRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse *response, NSError *error))completionHandler {
    [[self describeElasticsearchDomainConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDescribeElasticsearchDomainConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDescribeElasticsearchDomainsResponse *> *)describeElasticsearchDomains:(AWSElasticsearchserviceDescribeElasticsearchDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/domain-info"
                  targetPrefix:@""
                 operationName:@"DescribeElasticsearchDomains"
                   outputClass:[AWSElasticsearchserviceDescribeElasticsearchDomainsResponse class]];
}

- (void)describeElasticsearchDomains:(AWSElasticsearchserviceDescribeElasticsearchDomainsRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDescribeElasticsearchDomainsResponse *response, NSError *error))completionHandler {
    [[self describeElasticsearchDomains:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDescribeElasticsearchDomainsResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDescribeElasticsearchDomainsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse *> *)describeElasticsearchInstanceTypeLimits:(AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/instanceTypeLimits/{ElasticsearchVersion}/{InstanceType}"
                  targetPrefix:@""
                 operationName:@"DescribeElasticsearchInstanceTypeLimits"
                   outputClass:[AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse class]];
}

- (void)describeElasticsearchInstanceTypeLimits:(AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse *response, NSError *error))completionHandler {
    [[self describeElasticsearchInstanceTypeLimits:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDescribeElasticsearchInstanceTypeLimitsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse *> *)describeInboundCrossClusterSearchConnections:(AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/ccs/inboundConnection/search"
                  targetPrefix:@""
                 operationName:@"DescribeInboundCrossClusterSearchConnections"
                   outputClass:[AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse class]];
}

- (void)describeInboundCrossClusterSearchConnections:(AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse *response, NSError *error))completionHandler {
    [[self describeInboundCrossClusterSearchConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDescribeInboundCrossClusterSearchConnectionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse *> *)describeOutboundCrossClusterSearchConnections:(AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/ccs/outboundConnection/search"
                  targetPrefix:@""
                 operationName:@"DescribeOutboundCrossClusterSearchConnections"
                   outputClass:[AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse class]];
}

- (void)describeOutboundCrossClusterSearchConnections:(AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse *response, NSError *error))completionHandler {
    [[self describeOutboundCrossClusterSearchConnections:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDescribeOutboundCrossClusterSearchConnectionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDescribePackagesResponse *> *)describePackages:(AWSElasticsearchserviceDescribePackagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/packages/describe"
                  targetPrefix:@""
                 operationName:@"DescribePackages"
                   outputClass:[AWSElasticsearchserviceDescribePackagesResponse class]];
}

- (void)describePackages:(AWSElasticsearchserviceDescribePackagesRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDescribePackagesResponse *response, NSError *error))completionHandler {
    [[self describePackages:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDescribePackagesResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDescribePackagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse *> *)describeReservedElasticsearchInstanceOfferings:(AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/reservedInstanceOfferings"
                  targetPrefix:@""
                 operationName:@"DescribeReservedElasticsearchInstanceOfferings"
                   outputClass:[AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse class]];
}

- (void)describeReservedElasticsearchInstanceOfferings:(AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse *response, NSError *error))completionHandler {
    [[self describeReservedElasticsearchInstanceOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDescribeReservedElasticsearchInstanceOfferingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse *> *)describeReservedElasticsearchInstances:(AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/reservedInstances"
                  targetPrefix:@""
                 operationName:@"DescribeReservedElasticsearchInstances"
                   outputClass:[AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse class]];
}

- (void)describeReservedElasticsearchInstances:(AWSElasticsearchserviceDescribeReservedElasticsearchInstancesRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse *response, NSError *error))completionHandler {
    [[self describeReservedElasticsearchInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDescribeReservedElasticsearchInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceDissociatePackageResponse *> *)dissociatePackage:(AWSElasticsearchserviceDissociatePackageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/packages/dissociate/{PackageID}/{DomainName}"
                  targetPrefix:@""
                 operationName:@"DissociatePackage"
                   outputClass:[AWSElasticsearchserviceDissociatePackageResponse class]];
}

- (void)dissociatePackage:(AWSElasticsearchserviceDissociatePackageRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceDissociatePackageResponse *response, NSError *error))completionHandler {
    [[self dissociatePackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceDissociatePackageResponse *> * _Nonnull task) {
        AWSElasticsearchserviceDissociatePackageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse *> *)getCompatibleElasticsearchVersions:(AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/compatibleVersions"
                  targetPrefix:@""
                 operationName:@"GetCompatibleElasticsearchVersions"
                   outputClass:[AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse class]];
}

- (void)getCompatibleElasticsearchVersions:(AWSElasticsearchserviceGetCompatibleElasticsearchVersionsRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse *response, NSError *error))completionHandler {
    [[self getCompatibleElasticsearchVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse *> * _Nonnull task) {
        AWSElasticsearchserviceGetCompatibleElasticsearchVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceGetUpgradeHistoryResponse *> *)getUpgradeHistory:(AWSElasticsearchserviceGetUpgradeHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/upgradeDomain/{DomainName}/history"
                  targetPrefix:@""
                 operationName:@"GetUpgradeHistory"
                   outputClass:[AWSElasticsearchserviceGetUpgradeHistoryResponse class]];
}

- (void)getUpgradeHistory:(AWSElasticsearchserviceGetUpgradeHistoryRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceGetUpgradeHistoryResponse *response, NSError *error))completionHandler {
    [[self getUpgradeHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceGetUpgradeHistoryResponse *> * _Nonnull task) {
        AWSElasticsearchserviceGetUpgradeHistoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceGetUpgradeStatusResponse *> *)getUpgradeStatus:(AWSElasticsearchserviceGetUpgradeStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/upgradeDomain/{DomainName}/status"
                  targetPrefix:@""
                 operationName:@"GetUpgradeStatus"
                   outputClass:[AWSElasticsearchserviceGetUpgradeStatusResponse class]];
}

- (void)getUpgradeStatus:(AWSElasticsearchserviceGetUpgradeStatusRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceGetUpgradeStatusResponse *response, NSError *error))completionHandler {
    [[self getUpgradeStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceGetUpgradeStatusResponse *> * _Nonnull task) {
        AWSElasticsearchserviceGetUpgradeStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceListDomainNamesResponse *> *)listDomainNames:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/domain"
                  targetPrefix:@""
                 operationName:@"ListDomainNames"
                   outputClass:[AWSElasticsearchserviceListDomainNamesResponse class]];
}

- (void)listDomainNames:(AWSRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceListDomainNamesResponse *response, NSError *error))completionHandler {
    [[self listDomainNames:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceListDomainNamesResponse *> * _Nonnull task) {
        AWSElasticsearchserviceListDomainNamesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceListDomainsForPackageResponse *> *)listDomainsForPackage:(AWSElasticsearchserviceListDomainsForPackageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/packages/{PackageID}/domains"
                  targetPrefix:@""
                 operationName:@"ListDomainsForPackage"
                   outputClass:[AWSElasticsearchserviceListDomainsForPackageResponse class]];
}

- (void)listDomainsForPackage:(AWSElasticsearchserviceListDomainsForPackageRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceListDomainsForPackageResponse *response, NSError *error))completionHandler {
    [[self listDomainsForPackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceListDomainsForPackageResponse *> * _Nonnull task) {
        AWSElasticsearchserviceListDomainsForPackageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceListElasticsearchInstanceTypesResponse *> *)listElasticsearchInstanceTypes:(AWSElasticsearchserviceListElasticsearchInstanceTypesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/instanceTypes/{ElasticsearchVersion}"
                  targetPrefix:@""
                 operationName:@"ListElasticsearchInstanceTypes"
                   outputClass:[AWSElasticsearchserviceListElasticsearchInstanceTypesResponse class]];
}

- (void)listElasticsearchInstanceTypes:(AWSElasticsearchserviceListElasticsearchInstanceTypesRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceListElasticsearchInstanceTypesResponse *response, NSError *error))completionHandler {
    [[self listElasticsearchInstanceTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceListElasticsearchInstanceTypesResponse *> * _Nonnull task) {
        AWSElasticsearchserviceListElasticsearchInstanceTypesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceListElasticsearchVersionsResponse *> *)listElasticsearchVersions:(AWSElasticsearchserviceListElasticsearchVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/versions"
                  targetPrefix:@""
                 operationName:@"ListElasticsearchVersions"
                   outputClass:[AWSElasticsearchserviceListElasticsearchVersionsResponse class]];
}

- (void)listElasticsearchVersions:(AWSElasticsearchserviceListElasticsearchVersionsRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceListElasticsearchVersionsResponse *response, NSError *error))completionHandler {
    [[self listElasticsearchVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceListElasticsearchVersionsResponse *> * _Nonnull task) {
        AWSElasticsearchserviceListElasticsearchVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceListPackagesForDomainResponse *> *)listPackagesForDomain:(AWSElasticsearchserviceListPackagesForDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/domain/{DomainName}/packages"
                  targetPrefix:@""
                 operationName:@"ListPackagesForDomain"
                   outputClass:[AWSElasticsearchserviceListPackagesForDomainResponse class]];
}

- (void)listPackagesForDomain:(AWSElasticsearchserviceListPackagesForDomainRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceListPackagesForDomainResponse *response, NSError *error))completionHandler {
    [[self listPackagesForDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceListPackagesForDomainResponse *> * _Nonnull task) {
        AWSElasticsearchserviceListPackagesForDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceListTagsResponse *> *)listTags:(AWSElasticsearchserviceListTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/tags/"
                  targetPrefix:@""
                 operationName:@"ListTags"
                   outputClass:[AWSElasticsearchserviceListTagsResponse class]];
}

- (void)listTags:(AWSElasticsearchserviceListTagsRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceListTagsResponse *response, NSError *error))completionHandler {
    [[self listTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceListTagsResponse *> * _Nonnull task) {
        AWSElasticsearchserviceListTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse *> *)purchaseReservedElasticsearchInstanceOffering:(AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/purchaseReservedInstanceOffering"
                  targetPrefix:@""
                 operationName:@"PurchaseReservedElasticsearchInstanceOffering"
                   outputClass:[AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse class]];
}

- (void)purchaseReservedElasticsearchInstanceOffering:(AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingRequest *)request
     completionHandler:(void (^)(AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse *response, NSError *error))completionHandler {
    [[self purchaseReservedElasticsearchInstanceOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse *> * _Nonnull task) {
        AWSElasticsearchservicePurchaseReservedElasticsearchInstanceOfferingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse *> *)rejectInboundCrossClusterSearchConnection:(AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2015-01-01/es/ccs/inboundConnection/{ConnectionId}/reject"
                  targetPrefix:@""
                 operationName:@"RejectInboundCrossClusterSearchConnection"
                   outputClass:[AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse class]];
}

- (void)rejectInboundCrossClusterSearchConnection:(AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse *response, NSError *error))completionHandler {
    [[self rejectInboundCrossClusterSearchConnection:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse *> * _Nonnull task) {
        AWSElasticsearchserviceRejectInboundCrossClusterSearchConnectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)removeTags:(AWSElasticsearchserviceRemoveTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/tags-removal"
                  targetPrefix:@""
                 operationName:@"RemoveTags"
                   outputClass:nil];
}

- (void)removeTags:(AWSElasticsearchserviceRemoveTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse *> *)startElasticsearchServiceSoftwareUpdate:(AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/serviceSoftwareUpdate/start"
                  targetPrefix:@""
                 operationName:@"StartElasticsearchServiceSoftwareUpdate"
                   outputClass:[AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse class]];
}

- (void)startElasticsearchServiceSoftwareUpdate:(AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse *response, NSError *error))completionHandler {
    [[self startElasticsearchServiceSoftwareUpdate:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse *> * _Nonnull task) {
        AWSElasticsearchserviceStartElasticsearchServiceSoftwareUpdateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse *> *)updateElasticsearchDomainConfig:(AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/domain/{DomainName}/config"
                  targetPrefix:@""
                 operationName:@"UpdateElasticsearchDomainConfig"
                   outputClass:[AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse class]];
}

- (void)updateElasticsearchDomainConfig:(AWSElasticsearchserviceUpdateElasticsearchDomainConfigRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse *response, NSError *error))completionHandler {
    [[self updateElasticsearchDomainConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse *> * _Nonnull task) {
        AWSElasticsearchserviceUpdateElasticsearchDomainConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSElasticsearchserviceUpgradeElasticsearchDomainResponse *> *)upgradeElasticsearchDomain:(AWSElasticsearchserviceUpgradeElasticsearchDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/upgradeDomain"
                  targetPrefix:@""
                 operationName:@"UpgradeElasticsearchDomain"
                   outputClass:[AWSElasticsearchserviceUpgradeElasticsearchDomainResponse class]];
}

- (void)upgradeElasticsearchDomain:(AWSElasticsearchserviceUpgradeElasticsearchDomainRequest *)request
     completionHandler:(void (^)(AWSElasticsearchserviceUpgradeElasticsearchDomainResponse *response, NSError *error))completionHandler {
    [[self upgradeElasticsearchDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSElasticsearchserviceUpgradeElasticsearchDomainResponse *> * _Nonnull task) {
        AWSElasticsearchserviceUpgradeElasticsearchDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
