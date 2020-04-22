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

#import "AWSesService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSesResources.h"

static NSString *const AWSInfoes = @"es";
NSString *const AWSesSDKVersion = @"2.13.2";


@interface AWSesResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSesResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSesErrorAccessDenied),
                            @"BaseException" : @(AWSesErrorBase),
                            @"ConflictException" : @(AWSesErrorConflict),
                            @"DisabledOperationException" : @(AWSesErrorDisabledOperation),
                            @"InternalException" : @(AWSesErrorInternal),
                            @"InvalidTypeException" : @(AWSesErrorInvalidType),
                            @"LimitExceededException" : @(AWSesErrorLimitExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSesErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSesErrorResourceNotFound),
                            @"ValidationException" : @(AWSesErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSesErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSesErrorDomain
                                                 code:AWSesErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSesErrorDomain
                                     code:AWSesErrorUnknown
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

@interface AWSesRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSesRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSes()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSes

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSesSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSes versions need to match. Check your SDK installation. AWSCore: %@ AWSes: %@", AWSiOSSDKVersion, AWSesSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultes {
    static AWSes *_defaultes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoes];
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
        _defaultes = [[AWSes alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultes;
}

+ (void)registeresWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSes alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)esForKey:(NSString *)key {
    @synchronized(self) {
        AWSes *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoes
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSes registeresWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeesForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultes` or `+ esForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicees
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicees];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSesRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSesResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSesResponseSerializer alloc] initWithJSONDefinition:[[AWSesResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask *)addTags:(AWSesAddTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/tags"
                  targetPrefix:@""
                 operationName:@"AddTags"
                   outputClass:nil];
}

- (void)addTags:(AWSesAddTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self addTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesAssociatePackageResponse *> *)associatePackage:(AWSesAssociatePackageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/packages/associate/{PackageID}/{DomainName}"
                  targetPrefix:@""
                 operationName:@"AssociatePackage"
                   outputClass:[AWSesAssociatePackageResponse class]];
}

- (void)associatePackage:(AWSesAssociatePackageRequest *)request
     completionHandler:(void (^)(AWSesAssociatePackageResponse *response, NSError *error))completionHandler {
    [[self associatePackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSesAssociatePackageResponse *> * _Nonnull task) {
        AWSesAssociatePackageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesCancelElasticsearchServiceSoftwareUpdateResponse *> *)cancelElasticsearchServiceSoftwareUpdate:(AWSesCancelElasticsearchServiceSoftwareUpdateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/serviceSoftwareUpdate/cancel"
                  targetPrefix:@""
                 operationName:@"CancelElasticsearchServiceSoftwareUpdate"
                   outputClass:[AWSesCancelElasticsearchServiceSoftwareUpdateResponse class]];
}

- (void)cancelElasticsearchServiceSoftwareUpdate:(AWSesCancelElasticsearchServiceSoftwareUpdateRequest *)request
     completionHandler:(void (^)(AWSesCancelElasticsearchServiceSoftwareUpdateResponse *response, NSError *error))completionHandler {
    [[self cancelElasticsearchServiceSoftwareUpdate:request] continueWithBlock:^id _Nullable(AWSTask<AWSesCancelElasticsearchServiceSoftwareUpdateResponse *> * _Nonnull task) {
        AWSesCancelElasticsearchServiceSoftwareUpdateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesCreateElasticsearchDomainResponse *> *)createElasticsearchDomain:(AWSesCreateElasticsearchDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/domain"
                  targetPrefix:@""
                 operationName:@"CreateElasticsearchDomain"
                   outputClass:[AWSesCreateElasticsearchDomainResponse class]];
}

- (void)createElasticsearchDomain:(AWSesCreateElasticsearchDomainRequest *)request
     completionHandler:(void (^)(AWSesCreateElasticsearchDomainResponse *response, NSError *error))completionHandler {
    [[self createElasticsearchDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSesCreateElasticsearchDomainResponse *> * _Nonnull task) {
        AWSesCreateElasticsearchDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesCreatePackageResponse *> *)createPackage:(AWSesCreatePackageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/packages"
                  targetPrefix:@""
                 operationName:@"CreatePackage"
                   outputClass:[AWSesCreatePackageResponse class]];
}

- (void)createPackage:(AWSesCreatePackageRequest *)request
     completionHandler:(void (^)(AWSesCreatePackageResponse *response, NSError *error))completionHandler {
    [[self createPackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSesCreatePackageResponse *> * _Nonnull task) {
        AWSesCreatePackageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesDeleteElasticsearchDomainResponse *> *)deleteElasticsearchDomain:(AWSesDeleteElasticsearchDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-01-01/es/domain/{DomainName}"
                  targetPrefix:@""
                 operationName:@"DeleteElasticsearchDomain"
                   outputClass:[AWSesDeleteElasticsearchDomainResponse class]];
}

- (void)deleteElasticsearchDomain:(AWSesDeleteElasticsearchDomainRequest *)request
     completionHandler:(void (^)(AWSesDeleteElasticsearchDomainResponse *response, NSError *error))completionHandler {
    [[self deleteElasticsearchDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSesDeleteElasticsearchDomainResponse *> * _Nonnull task) {
        AWSesDeleteElasticsearchDomainResponse *result = task.result;
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

- (AWSTask<AWSesDeletePackageResponse *> *)deletePackage:(AWSesDeletePackageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2015-01-01/packages/{PackageID}"
                  targetPrefix:@""
                 operationName:@"DeletePackage"
                   outputClass:[AWSesDeletePackageResponse class]];
}

- (void)deletePackage:(AWSesDeletePackageRequest *)request
     completionHandler:(void (^)(AWSesDeletePackageResponse *response, NSError *error))completionHandler {
    [[self deletePackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSesDeletePackageResponse *> * _Nonnull task) {
        AWSesDeletePackageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesDescribeElasticsearchDomainResponse *> *)describeElasticsearchDomain:(AWSesDescribeElasticsearchDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/domain/{DomainName}"
                  targetPrefix:@""
                 operationName:@"DescribeElasticsearchDomain"
                   outputClass:[AWSesDescribeElasticsearchDomainResponse class]];
}

- (void)describeElasticsearchDomain:(AWSesDescribeElasticsearchDomainRequest *)request
     completionHandler:(void (^)(AWSesDescribeElasticsearchDomainResponse *response, NSError *error))completionHandler {
    [[self describeElasticsearchDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSesDescribeElasticsearchDomainResponse *> * _Nonnull task) {
        AWSesDescribeElasticsearchDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesDescribeElasticsearchDomainConfigResponse *> *)describeElasticsearchDomainConfig:(AWSesDescribeElasticsearchDomainConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/domain/{DomainName}/config"
                  targetPrefix:@""
                 operationName:@"DescribeElasticsearchDomainConfig"
                   outputClass:[AWSesDescribeElasticsearchDomainConfigResponse class]];
}

- (void)describeElasticsearchDomainConfig:(AWSesDescribeElasticsearchDomainConfigRequest *)request
     completionHandler:(void (^)(AWSesDescribeElasticsearchDomainConfigResponse *response, NSError *error))completionHandler {
    [[self describeElasticsearchDomainConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSesDescribeElasticsearchDomainConfigResponse *> * _Nonnull task) {
        AWSesDescribeElasticsearchDomainConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesDescribeElasticsearchDomainsResponse *> *)describeElasticsearchDomains:(AWSesDescribeElasticsearchDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/domain-info"
                  targetPrefix:@""
                 operationName:@"DescribeElasticsearchDomains"
                   outputClass:[AWSesDescribeElasticsearchDomainsResponse class]];
}

- (void)describeElasticsearchDomains:(AWSesDescribeElasticsearchDomainsRequest *)request
     completionHandler:(void (^)(AWSesDescribeElasticsearchDomainsResponse *response, NSError *error))completionHandler {
    [[self describeElasticsearchDomains:request] continueWithBlock:^id _Nullable(AWSTask<AWSesDescribeElasticsearchDomainsResponse *> * _Nonnull task) {
        AWSesDescribeElasticsearchDomainsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesDescribeElasticsearchInstanceTypeLimitsResponse *> *)describeElasticsearchInstanceTypeLimits:(AWSesDescribeElasticsearchInstanceTypeLimitsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/instanceTypeLimits/{ElasticsearchVersion}/{InstanceType}"
                  targetPrefix:@""
                 operationName:@"DescribeElasticsearchInstanceTypeLimits"
                   outputClass:[AWSesDescribeElasticsearchInstanceTypeLimitsResponse class]];
}

- (void)describeElasticsearchInstanceTypeLimits:(AWSesDescribeElasticsearchInstanceTypeLimitsRequest *)request
     completionHandler:(void (^)(AWSesDescribeElasticsearchInstanceTypeLimitsResponse *response, NSError *error))completionHandler {
    [[self describeElasticsearchInstanceTypeLimits:request] continueWithBlock:^id _Nullable(AWSTask<AWSesDescribeElasticsearchInstanceTypeLimitsResponse *> * _Nonnull task) {
        AWSesDescribeElasticsearchInstanceTypeLimitsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesDescribePackagesResponse *> *)describePackages:(AWSesDescribePackagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/packages/describe"
                  targetPrefix:@""
                 operationName:@"DescribePackages"
                   outputClass:[AWSesDescribePackagesResponse class]];
}

- (void)describePackages:(AWSesDescribePackagesRequest *)request
     completionHandler:(void (^)(AWSesDescribePackagesResponse *response, NSError *error))completionHandler {
    [[self describePackages:request] continueWithBlock:^id _Nullable(AWSTask<AWSesDescribePackagesResponse *> * _Nonnull task) {
        AWSesDescribePackagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesDescribeReservedElasticsearchInstanceOfferingsResponse *> *)describeReservedElasticsearchInstanceOfferings:(AWSesDescribeReservedElasticsearchInstanceOfferingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/reservedInstanceOfferings"
                  targetPrefix:@""
                 operationName:@"DescribeReservedElasticsearchInstanceOfferings"
                   outputClass:[AWSesDescribeReservedElasticsearchInstanceOfferingsResponse class]];
}

- (void)describeReservedElasticsearchInstanceOfferings:(AWSesDescribeReservedElasticsearchInstanceOfferingsRequest *)request
     completionHandler:(void (^)(AWSesDescribeReservedElasticsearchInstanceOfferingsResponse *response, NSError *error))completionHandler {
    [[self describeReservedElasticsearchInstanceOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSesDescribeReservedElasticsearchInstanceOfferingsResponse *> * _Nonnull task) {
        AWSesDescribeReservedElasticsearchInstanceOfferingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesDescribeReservedElasticsearchInstancesResponse *> *)describeReservedElasticsearchInstances:(AWSesDescribeReservedElasticsearchInstancesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/reservedInstances"
                  targetPrefix:@""
                 operationName:@"DescribeReservedElasticsearchInstances"
                   outputClass:[AWSesDescribeReservedElasticsearchInstancesResponse class]];
}

- (void)describeReservedElasticsearchInstances:(AWSesDescribeReservedElasticsearchInstancesRequest *)request
     completionHandler:(void (^)(AWSesDescribeReservedElasticsearchInstancesResponse *response, NSError *error))completionHandler {
    [[self describeReservedElasticsearchInstances:request] continueWithBlock:^id _Nullable(AWSTask<AWSesDescribeReservedElasticsearchInstancesResponse *> * _Nonnull task) {
        AWSesDescribeReservedElasticsearchInstancesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesDissociatePackageResponse *> *)dissociatePackage:(AWSesDissociatePackageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/packages/dissociate/{PackageID}/{DomainName}"
                  targetPrefix:@""
                 operationName:@"DissociatePackage"
                   outputClass:[AWSesDissociatePackageResponse class]];
}

- (void)dissociatePackage:(AWSesDissociatePackageRequest *)request
     completionHandler:(void (^)(AWSesDissociatePackageResponse *response, NSError *error))completionHandler {
    [[self dissociatePackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSesDissociatePackageResponse *> * _Nonnull task) {
        AWSesDissociatePackageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesGetCompatibleElasticsearchVersionsResponse *> *)getCompatibleElasticsearchVersions:(AWSesGetCompatibleElasticsearchVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/compatibleVersions"
                  targetPrefix:@""
                 operationName:@"GetCompatibleElasticsearchVersions"
                   outputClass:[AWSesGetCompatibleElasticsearchVersionsResponse class]];
}

- (void)getCompatibleElasticsearchVersions:(AWSesGetCompatibleElasticsearchVersionsRequest *)request
     completionHandler:(void (^)(AWSesGetCompatibleElasticsearchVersionsResponse *response, NSError *error))completionHandler {
    [[self getCompatibleElasticsearchVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSesGetCompatibleElasticsearchVersionsResponse *> * _Nonnull task) {
        AWSesGetCompatibleElasticsearchVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesGetUpgradeHistoryResponse *> *)getUpgradeHistory:(AWSesGetUpgradeHistoryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/upgradeDomain/{DomainName}/history"
                  targetPrefix:@""
                 operationName:@"GetUpgradeHistory"
                   outputClass:[AWSesGetUpgradeHistoryResponse class]];
}

- (void)getUpgradeHistory:(AWSesGetUpgradeHistoryRequest *)request
     completionHandler:(void (^)(AWSesGetUpgradeHistoryResponse *response, NSError *error))completionHandler {
    [[self getUpgradeHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSesGetUpgradeHistoryResponse *> * _Nonnull task) {
        AWSesGetUpgradeHistoryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesGetUpgradeStatusResponse *> *)getUpgradeStatus:(AWSesGetUpgradeStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/upgradeDomain/{DomainName}/status"
                  targetPrefix:@""
                 operationName:@"GetUpgradeStatus"
                   outputClass:[AWSesGetUpgradeStatusResponse class]];
}

- (void)getUpgradeStatus:(AWSesGetUpgradeStatusRequest *)request
     completionHandler:(void (^)(AWSesGetUpgradeStatusResponse *response, NSError *error))completionHandler {
    [[self getUpgradeStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSesGetUpgradeStatusResponse *> * _Nonnull task) {
        AWSesGetUpgradeStatusResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesListDomainNamesResponse *> *)listDomainNames:(AWSRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/domain"
                  targetPrefix:@""
                 operationName:@"ListDomainNames"
                   outputClass:[AWSesListDomainNamesResponse class]];
}

- (void)listDomainNames:(AWSRequest *)request
     completionHandler:(void (^)(AWSesListDomainNamesResponse *response, NSError *error))completionHandler {
    [[self listDomainNames:request] continueWithBlock:^id _Nullable(AWSTask<AWSesListDomainNamesResponse *> * _Nonnull task) {
        AWSesListDomainNamesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesListDomainsForPackageResponse *> *)listDomainsForPackage:(AWSesListDomainsForPackageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/packages/{PackageID}/domains"
                  targetPrefix:@""
                 operationName:@"ListDomainsForPackage"
                   outputClass:[AWSesListDomainsForPackageResponse class]];
}

- (void)listDomainsForPackage:(AWSesListDomainsForPackageRequest *)request
     completionHandler:(void (^)(AWSesListDomainsForPackageResponse *response, NSError *error))completionHandler {
    [[self listDomainsForPackage:request] continueWithBlock:^id _Nullable(AWSTask<AWSesListDomainsForPackageResponse *> * _Nonnull task) {
        AWSesListDomainsForPackageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesListElasticsearchInstanceTypesResponse *> *)listElasticsearchInstanceTypes:(AWSesListElasticsearchInstanceTypesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/instanceTypes/{ElasticsearchVersion}"
                  targetPrefix:@""
                 operationName:@"ListElasticsearchInstanceTypes"
                   outputClass:[AWSesListElasticsearchInstanceTypesResponse class]];
}

- (void)listElasticsearchInstanceTypes:(AWSesListElasticsearchInstanceTypesRequest *)request
     completionHandler:(void (^)(AWSesListElasticsearchInstanceTypesResponse *response, NSError *error))completionHandler {
    [[self listElasticsearchInstanceTypes:request] continueWithBlock:^id _Nullable(AWSTask<AWSesListElasticsearchInstanceTypesResponse *> * _Nonnull task) {
        AWSesListElasticsearchInstanceTypesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesListElasticsearchVersionsResponse *> *)listElasticsearchVersions:(AWSesListElasticsearchVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/es/versions"
                  targetPrefix:@""
                 operationName:@"ListElasticsearchVersions"
                   outputClass:[AWSesListElasticsearchVersionsResponse class]];
}

- (void)listElasticsearchVersions:(AWSesListElasticsearchVersionsRequest *)request
     completionHandler:(void (^)(AWSesListElasticsearchVersionsResponse *response, NSError *error))completionHandler {
    [[self listElasticsearchVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSesListElasticsearchVersionsResponse *> * _Nonnull task) {
        AWSesListElasticsearchVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesListPackagesForDomainResponse *> *)listPackagesForDomain:(AWSesListPackagesForDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/domain/{DomainName}/packages"
                  targetPrefix:@""
                 operationName:@"ListPackagesForDomain"
                   outputClass:[AWSesListPackagesForDomainResponse class]];
}

- (void)listPackagesForDomain:(AWSesListPackagesForDomainRequest *)request
     completionHandler:(void (^)(AWSesListPackagesForDomainResponse *response, NSError *error))completionHandler {
    [[self listPackagesForDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSesListPackagesForDomainResponse *> * _Nonnull task) {
        AWSesListPackagesForDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesListTagsResponse *> *)listTags:(AWSesListTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2015-01-01/tags/"
                  targetPrefix:@""
                 operationName:@"ListTags"
                   outputClass:[AWSesListTagsResponse class]];
}

- (void)listTags:(AWSesListTagsRequest *)request
     completionHandler:(void (^)(AWSesListTagsResponse *response, NSError *error))completionHandler {
    [[self listTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSesListTagsResponse *> * _Nonnull task) {
        AWSesListTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesPurchaseReservedElasticsearchInstanceOfferingResponse *> *)purchaseReservedElasticsearchInstanceOffering:(AWSesPurchaseReservedElasticsearchInstanceOfferingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/purchaseReservedInstanceOffering"
                  targetPrefix:@""
                 operationName:@"PurchaseReservedElasticsearchInstanceOffering"
                   outputClass:[AWSesPurchaseReservedElasticsearchInstanceOfferingResponse class]];
}

- (void)purchaseReservedElasticsearchInstanceOffering:(AWSesPurchaseReservedElasticsearchInstanceOfferingRequest *)request
     completionHandler:(void (^)(AWSesPurchaseReservedElasticsearchInstanceOfferingResponse *response, NSError *error))completionHandler {
    [[self purchaseReservedElasticsearchInstanceOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSesPurchaseReservedElasticsearchInstanceOfferingResponse *> * _Nonnull task) {
        AWSesPurchaseReservedElasticsearchInstanceOfferingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)removeTags:(AWSesRemoveTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/tags-removal"
                  targetPrefix:@""
                 operationName:@"RemoveTags"
                   outputClass:nil];
}

- (void)removeTags:(AWSesRemoveTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self removeTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesStartElasticsearchServiceSoftwareUpdateResponse *> *)startElasticsearchServiceSoftwareUpdate:(AWSesStartElasticsearchServiceSoftwareUpdateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/serviceSoftwareUpdate/start"
                  targetPrefix:@""
                 operationName:@"StartElasticsearchServiceSoftwareUpdate"
                   outputClass:[AWSesStartElasticsearchServiceSoftwareUpdateResponse class]];
}

- (void)startElasticsearchServiceSoftwareUpdate:(AWSesStartElasticsearchServiceSoftwareUpdateRequest *)request
     completionHandler:(void (^)(AWSesStartElasticsearchServiceSoftwareUpdateResponse *response, NSError *error))completionHandler {
    [[self startElasticsearchServiceSoftwareUpdate:request] continueWithBlock:^id _Nullable(AWSTask<AWSesStartElasticsearchServiceSoftwareUpdateResponse *> * _Nonnull task) {
        AWSesStartElasticsearchServiceSoftwareUpdateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesUpdateElasticsearchDomainConfigResponse *> *)updateElasticsearchDomainConfig:(AWSesUpdateElasticsearchDomainConfigRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/domain/{DomainName}/config"
                  targetPrefix:@""
                 operationName:@"UpdateElasticsearchDomainConfig"
                   outputClass:[AWSesUpdateElasticsearchDomainConfigResponse class]];
}

- (void)updateElasticsearchDomainConfig:(AWSesUpdateElasticsearchDomainConfigRequest *)request
     completionHandler:(void (^)(AWSesUpdateElasticsearchDomainConfigResponse *response, NSError *error))completionHandler {
    [[self updateElasticsearchDomainConfig:request] continueWithBlock:^id _Nullable(AWSTask<AWSesUpdateElasticsearchDomainConfigResponse *> * _Nonnull task) {
        AWSesUpdateElasticsearchDomainConfigResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSesUpgradeElasticsearchDomainResponse *> *)upgradeElasticsearchDomain:(AWSesUpgradeElasticsearchDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2015-01-01/es/upgradeDomain"
                  targetPrefix:@""
                 operationName:@"UpgradeElasticsearchDomain"
                   outputClass:[AWSesUpgradeElasticsearchDomainResponse class]];
}

- (void)upgradeElasticsearchDomain:(AWSesUpgradeElasticsearchDomainRequest *)request
     completionHandler:(void (^)(AWSesUpgradeElasticsearchDomainResponse *response, NSError *error))completionHandler {
    [[self upgradeElasticsearchDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSesUpgradeElasticsearchDomainResponse *> * _Nonnull task) {
        AWSesUpgradeElasticsearchDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
