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

#import "AWSWorklinkService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSWorklinkResources.h"

static NSString *const AWSInfoWorklink = @"Worklink";
NSString *const AWSWorklinkSDKVersion = @"2.13.4";


@interface AWSWorklinkResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSWorklinkResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalServerErrorException" : @(AWSWorklinkErrorInternalServerError),
                            @"InvalidRequestException" : @(AWSWorklinkErrorInvalidRequest),
                            @"ResourceAlreadyExistsException" : @(AWSWorklinkErrorResourceAlreadyExists),
                            @"ResourceNotFoundException" : @(AWSWorklinkErrorResourceNotFound),
                            @"TooManyRequestsException" : @(AWSWorklinkErrorTooManyRequests),
                            @"UnauthorizedException" : @(AWSWorklinkErrorUnauthorized),
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
                    *error = [NSError errorWithDomain:AWSWorklinkErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSWorklinkErrorDomain
                                                 code:AWSWorklinkErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSWorklinkErrorDomain
                                     code:AWSWorklinkErrorUnknown
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

@interface AWSWorklinkRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSWorklinkRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSWorklink()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSWorklink

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSWorklinkSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSWorklink versions need to match. Check your SDK installation. AWSCore: %@ AWSWorklink: %@", AWSiOSSDKVersion, AWSWorklinkSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultWorklink {
    static AWSWorklink *_defaultWorklink = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoWorklink];
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
        _defaultWorklink = [[AWSWorklink alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultWorklink;
}

+ (void)registerWorklinkWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSWorklink alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)WorklinkForKey:(NSString *)key {
    @synchronized(self) {
        AWSWorklink *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoWorklink
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSWorklink registerWorklinkWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeWorklinkForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultWorklink` or `+ WorklinkForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceWorklink
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceWorklink];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSWorklinkRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSWorklinkResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSWorklinkResponseSerializer alloc] initWithJSONDefinition:[[AWSWorklinkResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSWorklinkAssociateDomainResponse *> *)associateDomain:(AWSWorklinkAssociateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/associateDomain"
                  targetPrefix:@""
                 operationName:@"AssociateDomain"
                   outputClass:[AWSWorklinkAssociateDomainResponse class]];
}

- (void)associateDomain:(AWSWorklinkAssociateDomainRequest *)request
     completionHandler:(void (^)(AWSWorklinkAssociateDomainResponse *response, NSError *error))completionHandler {
    [[self associateDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkAssociateDomainResponse *> * _Nonnull task) {
        AWSWorklinkAssociateDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkAssociateWebsiteAuthorizationProviderResponse *> *)associateWebsiteAuthorizationProvider:(AWSWorklinkAssociateWebsiteAuthorizationProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/associateWebsiteAuthorizationProvider"
                  targetPrefix:@""
                 operationName:@"AssociateWebsiteAuthorizationProvider"
                   outputClass:[AWSWorklinkAssociateWebsiteAuthorizationProviderResponse class]];
}

- (void)associateWebsiteAuthorizationProvider:(AWSWorklinkAssociateWebsiteAuthorizationProviderRequest *)request
     completionHandler:(void (^)(AWSWorklinkAssociateWebsiteAuthorizationProviderResponse *response, NSError *error))completionHandler {
    [[self associateWebsiteAuthorizationProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkAssociateWebsiteAuthorizationProviderResponse *> * _Nonnull task) {
        AWSWorklinkAssociateWebsiteAuthorizationProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkAssociateWebsiteCertificateAuthorityResponse *> *)associateWebsiteCertificateAuthority:(AWSWorklinkAssociateWebsiteCertificateAuthorityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/associateWebsiteCertificateAuthority"
                  targetPrefix:@""
                 operationName:@"AssociateWebsiteCertificateAuthority"
                   outputClass:[AWSWorklinkAssociateWebsiteCertificateAuthorityResponse class]];
}

- (void)associateWebsiteCertificateAuthority:(AWSWorklinkAssociateWebsiteCertificateAuthorityRequest *)request
     completionHandler:(void (^)(AWSWorklinkAssociateWebsiteCertificateAuthorityResponse *response, NSError *error))completionHandler {
    [[self associateWebsiteCertificateAuthority:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkAssociateWebsiteCertificateAuthorityResponse *> * _Nonnull task) {
        AWSWorklinkAssociateWebsiteCertificateAuthorityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkCreateFleetResponse *> *)createFleet:(AWSWorklinkCreateFleetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/createFleet"
                  targetPrefix:@""
                 operationName:@"CreateFleet"
                   outputClass:[AWSWorklinkCreateFleetResponse class]];
}

- (void)createFleet:(AWSWorklinkCreateFleetRequest *)request
     completionHandler:(void (^)(AWSWorklinkCreateFleetResponse *response, NSError *error))completionHandler {
    [[self createFleet:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkCreateFleetResponse *> * _Nonnull task) {
        AWSWorklinkCreateFleetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDeleteFleetResponse *> *)deleteFleet:(AWSWorklinkDeleteFleetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/deleteFleet"
                  targetPrefix:@""
                 operationName:@"DeleteFleet"
                   outputClass:[AWSWorklinkDeleteFleetResponse class]];
}

- (void)deleteFleet:(AWSWorklinkDeleteFleetRequest *)request
     completionHandler:(void (^)(AWSWorklinkDeleteFleetResponse *response, NSError *error))completionHandler {
    [[self deleteFleet:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDeleteFleetResponse *> * _Nonnull task) {
        AWSWorklinkDeleteFleetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDescribeAuditStreamConfigurationResponse *> *)describeAuditStreamConfiguration:(AWSWorklinkDescribeAuditStreamConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describeAuditStreamConfiguration"
                  targetPrefix:@""
                 operationName:@"DescribeAuditStreamConfiguration"
                   outputClass:[AWSWorklinkDescribeAuditStreamConfigurationResponse class]];
}

- (void)describeAuditStreamConfiguration:(AWSWorklinkDescribeAuditStreamConfigurationRequest *)request
     completionHandler:(void (^)(AWSWorklinkDescribeAuditStreamConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeAuditStreamConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDescribeAuditStreamConfigurationResponse *> * _Nonnull task) {
        AWSWorklinkDescribeAuditStreamConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDescribeCompanyNetworkConfigurationResponse *> *)describeCompanyNetworkConfiguration:(AWSWorklinkDescribeCompanyNetworkConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describeCompanyNetworkConfiguration"
                  targetPrefix:@""
                 operationName:@"DescribeCompanyNetworkConfiguration"
                   outputClass:[AWSWorklinkDescribeCompanyNetworkConfigurationResponse class]];
}

- (void)describeCompanyNetworkConfiguration:(AWSWorklinkDescribeCompanyNetworkConfigurationRequest *)request
     completionHandler:(void (^)(AWSWorklinkDescribeCompanyNetworkConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeCompanyNetworkConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDescribeCompanyNetworkConfigurationResponse *> * _Nonnull task) {
        AWSWorklinkDescribeCompanyNetworkConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDescribeDeviceResponse *> *)describeDevice:(AWSWorklinkDescribeDeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describeDevice"
                  targetPrefix:@""
                 operationName:@"DescribeDevice"
                   outputClass:[AWSWorklinkDescribeDeviceResponse class]];
}

- (void)describeDevice:(AWSWorklinkDescribeDeviceRequest *)request
     completionHandler:(void (^)(AWSWorklinkDescribeDeviceResponse *response, NSError *error))completionHandler {
    [[self describeDevice:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDescribeDeviceResponse *> * _Nonnull task) {
        AWSWorklinkDescribeDeviceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDescribeDevicePolicyConfigurationResponse *> *)describeDevicePolicyConfiguration:(AWSWorklinkDescribeDevicePolicyConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describeDevicePolicyConfiguration"
                  targetPrefix:@""
                 operationName:@"DescribeDevicePolicyConfiguration"
                   outputClass:[AWSWorklinkDescribeDevicePolicyConfigurationResponse class]];
}

- (void)describeDevicePolicyConfiguration:(AWSWorklinkDescribeDevicePolicyConfigurationRequest *)request
     completionHandler:(void (^)(AWSWorklinkDescribeDevicePolicyConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeDevicePolicyConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDescribeDevicePolicyConfigurationResponse *> * _Nonnull task) {
        AWSWorklinkDescribeDevicePolicyConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDescribeDomainResponse *> *)describeDomain:(AWSWorklinkDescribeDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describeDomain"
                  targetPrefix:@""
                 operationName:@"DescribeDomain"
                   outputClass:[AWSWorklinkDescribeDomainResponse class]];
}

- (void)describeDomain:(AWSWorklinkDescribeDomainRequest *)request
     completionHandler:(void (^)(AWSWorklinkDescribeDomainResponse *response, NSError *error))completionHandler {
    [[self describeDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDescribeDomainResponse *> * _Nonnull task) {
        AWSWorklinkDescribeDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDescribeFleetMetadataResponse *> *)describeFleetMetadata:(AWSWorklinkDescribeFleetMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describeFleetMetadata"
                  targetPrefix:@""
                 operationName:@"DescribeFleetMetadata"
                   outputClass:[AWSWorklinkDescribeFleetMetadataResponse class]];
}

- (void)describeFleetMetadata:(AWSWorklinkDescribeFleetMetadataRequest *)request
     completionHandler:(void (^)(AWSWorklinkDescribeFleetMetadataResponse *response, NSError *error))completionHandler {
    [[self describeFleetMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDescribeFleetMetadataResponse *> * _Nonnull task) {
        AWSWorklinkDescribeFleetMetadataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDescribeIdentityProviderConfigurationResponse *> *)describeIdentityProviderConfiguration:(AWSWorklinkDescribeIdentityProviderConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describeIdentityProviderConfiguration"
                  targetPrefix:@""
                 operationName:@"DescribeIdentityProviderConfiguration"
                   outputClass:[AWSWorklinkDescribeIdentityProviderConfigurationResponse class]];
}

- (void)describeIdentityProviderConfiguration:(AWSWorklinkDescribeIdentityProviderConfigurationRequest *)request
     completionHandler:(void (^)(AWSWorklinkDescribeIdentityProviderConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeIdentityProviderConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDescribeIdentityProviderConfigurationResponse *> * _Nonnull task) {
        AWSWorklinkDescribeIdentityProviderConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDescribeWebsiteCertificateAuthorityResponse *> *)describeWebsiteCertificateAuthority:(AWSWorklinkDescribeWebsiteCertificateAuthorityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/describeWebsiteCertificateAuthority"
                  targetPrefix:@""
                 operationName:@"DescribeWebsiteCertificateAuthority"
                   outputClass:[AWSWorklinkDescribeWebsiteCertificateAuthorityResponse class]];
}

- (void)describeWebsiteCertificateAuthority:(AWSWorklinkDescribeWebsiteCertificateAuthorityRequest *)request
     completionHandler:(void (^)(AWSWorklinkDescribeWebsiteCertificateAuthorityResponse *response, NSError *error))completionHandler {
    [[self describeWebsiteCertificateAuthority:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDescribeWebsiteCertificateAuthorityResponse *> * _Nonnull task) {
        AWSWorklinkDescribeWebsiteCertificateAuthorityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDisassociateDomainResponse *> *)disassociateDomain:(AWSWorklinkDisassociateDomainRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/disassociateDomain"
                  targetPrefix:@""
                 operationName:@"DisassociateDomain"
                   outputClass:[AWSWorklinkDisassociateDomainResponse class]];
}

- (void)disassociateDomain:(AWSWorklinkDisassociateDomainRequest *)request
     completionHandler:(void (^)(AWSWorklinkDisassociateDomainResponse *response, NSError *error))completionHandler {
    [[self disassociateDomain:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDisassociateDomainResponse *> * _Nonnull task) {
        AWSWorklinkDisassociateDomainResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse *> *)disassociateWebsiteAuthorizationProvider:(AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/disassociateWebsiteAuthorizationProvider"
                  targetPrefix:@""
                 operationName:@"DisassociateWebsiteAuthorizationProvider"
                   outputClass:[AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse class]];
}

- (void)disassociateWebsiteAuthorizationProvider:(AWSWorklinkDisassociateWebsiteAuthorizationProviderRequest *)request
     completionHandler:(void (^)(AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse *response, NSError *error))completionHandler {
    [[self disassociateWebsiteAuthorizationProvider:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse *> * _Nonnull task) {
        AWSWorklinkDisassociateWebsiteAuthorizationProviderResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse *> *)disassociateWebsiteCertificateAuthority:(AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/disassociateWebsiteCertificateAuthority"
                  targetPrefix:@""
                 operationName:@"DisassociateWebsiteCertificateAuthority"
                   outputClass:[AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse class]];
}

- (void)disassociateWebsiteCertificateAuthority:(AWSWorklinkDisassociateWebsiteCertificateAuthorityRequest *)request
     completionHandler:(void (^)(AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse *response, NSError *error))completionHandler {
    [[self disassociateWebsiteCertificateAuthority:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse *> * _Nonnull task) {
        AWSWorklinkDisassociateWebsiteCertificateAuthorityResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkListDevicesResponse *> *)listDevices:(AWSWorklinkListDevicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listDevices"
                  targetPrefix:@""
                 operationName:@"ListDevices"
                   outputClass:[AWSWorklinkListDevicesResponse class]];
}

- (void)listDevices:(AWSWorklinkListDevicesRequest *)request
     completionHandler:(void (^)(AWSWorklinkListDevicesResponse *response, NSError *error))completionHandler {
    [[self listDevices:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkListDevicesResponse *> * _Nonnull task) {
        AWSWorklinkListDevicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkListDomainsResponse *> *)listDomains:(AWSWorklinkListDomainsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listDomains"
                  targetPrefix:@""
                 operationName:@"ListDomains"
                   outputClass:[AWSWorklinkListDomainsResponse class]];
}

- (void)listDomains:(AWSWorklinkListDomainsRequest *)request
     completionHandler:(void (^)(AWSWorklinkListDomainsResponse *response, NSError *error))completionHandler {
    [[self listDomains:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkListDomainsResponse *> * _Nonnull task) {
        AWSWorklinkListDomainsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkListFleetsResponse *> *)listFleets:(AWSWorklinkListFleetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listFleets"
                  targetPrefix:@""
                 operationName:@"ListFleets"
                   outputClass:[AWSWorklinkListFleetsResponse class]];
}

- (void)listFleets:(AWSWorklinkListFleetsRequest *)request
     completionHandler:(void (^)(AWSWorklinkListFleetsResponse *response, NSError *error))completionHandler {
    [[self listFleets:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkListFleetsResponse *> * _Nonnull task) {
        AWSWorklinkListFleetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkListTagsForResourceResponse *> *)listTagsForResource:(AWSWorklinkListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSWorklinkListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSWorklinkListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSWorklinkListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkListTagsForResourceResponse *> * _Nonnull task) {
        AWSWorklinkListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkListWebsiteAuthorizationProvidersResponse *> *)listWebsiteAuthorizationProviders:(AWSWorklinkListWebsiteAuthorizationProvidersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listWebsiteAuthorizationProviders"
                  targetPrefix:@""
                 operationName:@"ListWebsiteAuthorizationProviders"
                   outputClass:[AWSWorklinkListWebsiteAuthorizationProvidersResponse class]];
}

- (void)listWebsiteAuthorizationProviders:(AWSWorklinkListWebsiteAuthorizationProvidersRequest *)request
     completionHandler:(void (^)(AWSWorklinkListWebsiteAuthorizationProvidersResponse *response, NSError *error))completionHandler {
    [[self listWebsiteAuthorizationProviders:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkListWebsiteAuthorizationProvidersResponse *> * _Nonnull task) {
        AWSWorklinkListWebsiteAuthorizationProvidersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkListWebsiteCertificateAuthoritiesResponse *> *)listWebsiteCertificateAuthorities:(AWSWorklinkListWebsiteCertificateAuthoritiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/listWebsiteCertificateAuthorities"
                  targetPrefix:@""
                 operationName:@"ListWebsiteCertificateAuthorities"
                   outputClass:[AWSWorklinkListWebsiteCertificateAuthoritiesResponse class]];
}

- (void)listWebsiteCertificateAuthorities:(AWSWorklinkListWebsiteCertificateAuthoritiesRequest *)request
     completionHandler:(void (^)(AWSWorklinkListWebsiteCertificateAuthoritiesResponse *response, NSError *error))completionHandler {
    [[self listWebsiteCertificateAuthorities:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkListWebsiteCertificateAuthoritiesResponse *> * _Nonnull task) {
        AWSWorklinkListWebsiteCertificateAuthoritiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkRestoreDomainAccessResponse *> *)restoreDomainAccess:(AWSWorklinkRestoreDomainAccessRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/restoreDomainAccess"
                  targetPrefix:@""
                 operationName:@"RestoreDomainAccess"
                   outputClass:[AWSWorklinkRestoreDomainAccessResponse class]];
}

- (void)restoreDomainAccess:(AWSWorklinkRestoreDomainAccessRequest *)request
     completionHandler:(void (^)(AWSWorklinkRestoreDomainAccessResponse *response, NSError *error))completionHandler {
    [[self restoreDomainAccess:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkRestoreDomainAccessResponse *> * _Nonnull task) {
        AWSWorklinkRestoreDomainAccessResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkRevokeDomainAccessResponse *> *)revokeDomainAccess:(AWSWorklinkRevokeDomainAccessRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/revokeDomainAccess"
                  targetPrefix:@""
                 operationName:@"RevokeDomainAccess"
                   outputClass:[AWSWorklinkRevokeDomainAccessResponse class]];
}

- (void)revokeDomainAccess:(AWSWorklinkRevokeDomainAccessRequest *)request
     completionHandler:(void (^)(AWSWorklinkRevokeDomainAccessResponse *response, NSError *error))completionHandler {
    [[self revokeDomainAccess:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkRevokeDomainAccessResponse *> * _Nonnull task) {
        AWSWorklinkRevokeDomainAccessResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkSignOutUserResponse *> *)signOutUser:(AWSWorklinkSignOutUserRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/signOutUser"
                  targetPrefix:@""
                 operationName:@"SignOutUser"
                   outputClass:[AWSWorklinkSignOutUserResponse class]];
}

- (void)signOutUser:(AWSWorklinkSignOutUserRequest *)request
     completionHandler:(void (^)(AWSWorklinkSignOutUserResponse *response, NSError *error))completionHandler {
    [[self signOutUser:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkSignOutUserResponse *> * _Nonnull task) {
        AWSWorklinkSignOutUserResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkTagResourceResponse *> *)tagResource:(AWSWorklinkTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSWorklinkTagResourceResponse class]];
}

- (void)tagResource:(AWSWorklinkTagResourceRequest *)request
     completionHandler:(void (^)(AWSWorklinkTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkTagResourceResponse *> * _Nonnull task) {
        AWSWorklinkTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkUntagResourceResponse *> *)untagResource:(AWSWorklinkUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{ResourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSWorklinkUntagResourceResponse class]];
}

- (void)untagResource:(AWSWorklinkUntagResourceRequest *)request
     completionHandler:(void (^)(AWSWorklinkUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkUntagResourceResponse *> * _Nonnull task) {
        AWSWorklinkUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkUpdateAuditStreamConfigurationResponse *> *)updateAuditStreamConfiguration:(AWSWorklinkUpdateAuditStreamConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/updateAuditStreamConfiguration"
                  targetPrefix:@""
                 operationName:@"UpdateAuditStreamConfiguration"
                   outputClass:[AWSWorklinkUpdateAuditStreamConfigurationResponse class]];
}

- (void)updateAuditStreamConfiguration:(AWSWorklinkUpdateAuditStreamConfigurationRequest *)request
     completionHandler:(void (^)(AWSWorklinkUpdateAuditStreamConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateAuditStreamConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkUpdateAuditStreamConfigurationResponse *> * _Nonnull task) {
        AWSWorklinkUpdateAuditStreamConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkUpdateCompanyNetworkConfigurationResponse *> *)updateCompanyNetworkConfiguration:(AWSWorklinkUpdateCompanyNetworkConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/updateCompanyNetworkConfiguration"
                  targetPrefix:@""
                 operationName:@"UpdateCompanyNetworkConfiguration"
                   outputClass:[AWSWorklinkUpdateCompanyNetworkConfigurationResponse class]];
}

- (void)updateCompanyNetworkConfiguration:(AWSWorklinkUpdateCompanyNetworkConfigurationRequest *)request
     completionHandler:(void (^)(AWSWorklinkUpdateCompanyNetworkConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateCompanyNetworkConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkUpdateCompanyNetworkConfigurationResponse *> * _Nonnull task) {
        AWSWorklinkUpdateCompanyNetworkConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkUpdateDevicePolicyConfigurationResponse *> *)updateDevicePolicyConfiguration:(AWSWorklinkUpdateDevicePolicyConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/updateDevicePolicyConfiguration"
                  targetPrefix:@""
                 operationName:@"UpdateDevicePolicyConfiguration"
                   outputClass:[AWSWorklinkUpdateDevicePolicyConfigurationResponse class]];
}

- (void)updateDevicePolicyConfiguration:(AWSWorklinkUpdateDevicePolicyConfigurationRequest *)request
     completionHandler:(void (^)(AWSWorklinkUpdateDevicePolicyConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateDevicePolicyConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkUpdateDevicePolicyConfigurationResponse *> * _Nonnull task) {
        AWSWorklinkUpdateDevicePolicyConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkUpdateDomainMetadataResponse *> *)updateDomainMetadata:(AWSWorklinkUpdateDomainMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/updateDomainMetadata"
                  targetPrefix:@""
                 operationName:@"UpdateDomainMetadata"
                   outputClass:[AWSWorklinkUpdateDomainMetadataResponse class]];
}

- (void)updateDomainMetadata:(AWSWorklinkUpdateDomainMetadataRequest *)request
     completionHandler:(void (^)(AWSWorklinkUpdateDomainMetadataResponse *response, NSError *error))completionHandler {
    [[self updateDomainMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkUpdateDomainMetadataResponse *> * _Nonnull task) {
        AWSWorklinkUpdateDomainMetadataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkUpdateFleetMetadataResponse *> *)updateFleetMetadata:(AWSWorklinkUpdateFleetMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/UpdateFleetMetadata"
                  targetPrefix:@""
                 operationName:@"UpdateFleetMetadata"
                   outputClass:[AWSWorklinkUpdateFleetMetadataResponse class]];
}

- (void)updateFleetMetadata:(AWSWorklinkUpdateFleetMetadataRequest *)request
     completionHandler:(void (^)(AWSWorklinkUpdateFleetMetadataResponse *response, NSError *error))completionHandler {
    [[self updateFleetMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkUpdateFleetMetadataResponse *> * _Nonnull task) {
        AWSWorklinkUpdateFleetMetadataResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSWorklinkUpdateIdentityProviderConfigurationResponse *> *)updateIdentityProviderConfiguration:(AWSWorklinkUpdateIdentityProviderConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/updateIdentityProviderConfiguration"
                  targetPrefix:@""
                 operationName:@"UpdateIdentityProviderConfiguration"
                   outputClass:[AWSWorklinkUpdateIdentityProviderConfigurationResponse class]];
}

- (void)updateIdentityProviderConfiguration:(AWSWorklinkUpdateIdentityProviderConfigurationRequest *)request
     completionHandler:(void (^)(AWSWorklinkUpdateIdentityProviderConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateIdentityProviderConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSWorklinkUpdateIdentityProviderConfigurationResponse *> * _Nonnull task) {
        AWSWorklinkUpdateIdentityProviderConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
