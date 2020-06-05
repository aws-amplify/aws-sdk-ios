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

#import "AWSServicecatalogService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSServicecatalogResources.h"

static NSString *const AWSInfoServicecatalog = @"Servicecatalog";
NSString *const AWSServicecatalogSDKVersion = @"2.13.4";


@interface AWSServicecatalogResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSServicecatalogResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"DuplicateResourceException" : @(AWSServicecatalogErrorDuplicateResource),
                            @"InvalidParametersException" : @(AWSServicecatalogErrorInvalidParameters),
                            @"InvalidStateException" : @(AWSServicecatalogErrorInvalidState),
                            @"LimitExceededException" : @(AWSServicecatalogErrorLimitExceeded),
                            @"OperationNotSupportedException" : @(AWSServicecatalogErrorOperationNotSupported),
                            @"ResourceInUseException" : @(AWSServicecatalogErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSServicecatalogErrorResourceNotFound),
                            @"TagOptionNotMigratedException" : @(AWSServicecatalogErrorTagOptionNotMigrated),
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
	                *error = [NSError errorWithDomain:AWSServicecatalogErrorDomain
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
        *error = [NSError errorWithDomain:AWSServicecatalogErrorDomain
                                     code:AWSServicecatalogErrorUnknown
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

@interface AWSServicecatalogRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSServicecatalogRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSServicecatalog()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSServicecatalog

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSServicecatalogSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSServicecatalog versions need to match. Check your SDK installation. AWSCore: %@ AWSServicecatalog: %@", AWSiOSSDKVersion, AWSServicecatalogSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultServicecatalog {
    static AWSServicecatalog *_defaultServicecatalog = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoServicecatalog];
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
        _defaultServicecatalog = [[AWSServicecatalog alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultServicecatalog;
}

+ (void)registerServicecatalogWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSServicecatalog alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ServicecatalogForKey:(NSString *)key {
    @synchronized(self) {
        AWSServicecatalog *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoServicecatalog
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSServicecatalog registerServicecatalogWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeServicecatalogForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultServicecatalog` or `+ ServicecatalogForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceServicecatalog
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceServicecatalog];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSServicecatalogRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSServicecatalogResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSServicecatalogResponseSerializer alloc] initWithJSONDefinition:[[AWSServicecatalogResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSServicecatalogAcceptPortfolioShareOutput *> *)acceptPortfolioShare:(AWSServicecatalogAcceptPortfolioShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"AcceptPortfolioShare"
                   outputClass:[AWSServicecatalogAcceptPortfolioShareOutput class]];
}

- (void)acceptPortfolioShare:(AWSServicecatalogAcceptPortfolioShareInput *)request
     completionHandler:(void (^)(AWSServicecatalogAcceptPortfolioShareOutput *response, NSError *error))completionHandler {
    [[self acceptPortfolioShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogAcceptPortfolioShareOutput *> * _Nonnull task) {
        AWSServicecatalogAcceptPortfolioShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogAssociateBudgetWithResourceOutput *> *)associateBudgetWithResource:(AWSServicecatalogAssociateBudgetWithResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"AssociateBudgetWithResource"
                   outputClass:[AWSServicecatalogAssociateBudgetWithResourceOutput class]];
}

- (void)associateBudgetWithResource:(AWSServicecatalogAssociateBudgetWithResourceInput *)request
     completionHandler:(void (^)(AWSServicecatalogAssociateBudgetWithResourceOutput *response, NSError *error))completionHandler {
    [[self associateBudgetWithResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogAssociateBudgetWithResourceOutput *> * _Nonnull task) {
        AWSServicecatalogAssociateBudgetWithResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogAssociatePrincipalWithPortfolioOutput *> *)associatePrincipalWithPortfolio:(AWSServicecatalogAssociatePrincipalWithPortfolioInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"AssociatePrincipalWithPortfolio"
                   outputClass:[AWSServicecatalogAssociatePrincipalWithPortfolioOutput class]];
}

- (void)associatePrincipalWithPortfolio:(AWSServicecatalogAssociatePrincipalWithPortfolioInput *)request
     completionHandler:(void (^)(AWSServicecatalogAssociatePrincipalWithPortfolioOutput *response, NSError *error))completionHandler {
    [[self associatePrincipalWithPortfolio:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogAssociatePrincipalWithPortfolioOutput *> * _Nonnull task) {
        AWSServicecatalogAssociatePrincipalWithPortfolioOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogAssociateProductWithPortfolioOutput *> *)associateProductWithPortfolio:(AWSServicecatalogAssociateProductWithPortfolioInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"AssociateProductWithPortfolio"
                   outputClass:[AWSServicecatalogAssociateProductWithPortfolioOutput class]];
}

- (void)associateProductWithPortfolio:(AWSServicecatalogAssociateProductWithPortfolioInput *)request
     completionHandler:(void (^)(AWSServicecatalogAssociateProductWithPortfolioOutput *response, NSError *error))completionHandler {
    [[self associateProductWithPortfolio:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogAssociateProductWithPortfolioOutput *> * _Nonnull task) {
        AWSServicecatalogAssociateProductWithPortfolioOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput *> *)associateServiceActionWithProvisioningArtifact:(AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"AssociateServiceActionWithProvisioningArtifact"
                   outputClass:[AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput class]];
}

- (void)associateServiceActionWithProvisioningArtifact:(AWSServicecatalogAssociateServiceActionWithProvisioningArtifactInput *)request
     completionHandler:(void (^)(AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput *response, NSError *error))completionHandler {
    [[self associateServiceActionWithProvisioningArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput *> * _Nonnull task) {
        AWSServicecatalogAssociateServiceActionWithProvisioningArtifactOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogAssociateTagOptionWithResourceOutput *> *)associateTagOptionWithResource:(AWSServicecatalogAssociateTagOptionWithResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"AssociateTagOptionWithResource"
                   outputClass:[AWSServicecatalogAssociateTagOptionWithResourceOutput class]];
}

- (void)associateTagOptionWithResource:(AWSServicecatalogAssociateTagOptionWithResourceInput *)request
     completionHandler:(void (^)(AWSServicecatalogAssociateTagOptionWithResourceOutput *response, NSError *error))completionHandler {
    [[self associateTagOptionWithResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogAssociateTagOptionWithResourceOutput *> * _Nonnull task) {
        AWSServicecatalogAssociateTagOptionWithResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput *> *)batchAssociateServiceActionWithProvisioningArtifact:(AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"BatchAssociateServiceActionWithProvisioningArtifact"
                   outputClass:[AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput class]];
}

- (void)batchAssociateServiceActionWithProvisioningArtifact:(AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactInput *)request
     completionHandler:(void (^)(AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput *response, NSError *error))completionHandler {
    [[self batchAssociateServiceActionWithProvisioningArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput *> * _Nonnull task) {
        AWSServicecatalogBatchAssociateServiceActionWithProvisioningArtifactOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput *> *)batchDisassociateServiceActionFromProvisioningArtifact:(AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"BatchDisassociateServiceActionFromProvisioningArtifact"
                   outputClass:[AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput class]];
}

- (void)batchDisassociateServiceActionFromProvisioningArtifact:(AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactInput *)request
     completionHandler:(void (^)(AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput *response, NSError *error))completionHandler {
    [[self batchDisassociateServiceActionFromProvisioningArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput *> * _Nonnull task) {
        AWSServicecatalogBatchDisassociateServiceActionFromProvisioningArtifactOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogReplicateProductOutput *> *)replicateProduct:(AWSServicecatalogReplicateProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"CopyProduct"
                   outputClass:[AWSServicecatalogReplicateProductOutput class]];
}

- (void)replicateProduct:(AWSServicecatalogReplicateProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogReplicateProductOutput *response, NSError *error))completionHandler {
    [[self replicateProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogReplicateProductOutput *> * _Nonnull task) {
        AWSServicecatalogReplicateProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogCreateConstraintOutput *> *)createConstraint:(AWSServicecatalogCreateConstraintInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"CreateConstraint"
                   outputClass:[AWSServicecatalogCreateConstraintOutput class]];
}

- (void)createConstraint:(AWSServicecatalogCreateConstraintInput *)request
     completionHandler:(void (^)(AWSServicecatalogCreateConstraintOutput *response, NSError *error))completionHandler {
    [[self createConstraint:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogCreateConstraintOutput *> * _Nonnull task) {
        AWSServicecatalogCreateConstraintOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogCreatePortfolioOutput *> *)createPortfolio:(AWSServicecatalogCreatePortfolioInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"CreatePortfolio"
                   outputClass:[AWSServicecatalogCreatePortfolioOutput class]];
}

- (void)createPortfolio:(AWSServicecatalogCreatePortfolioInput *)request
     completionHandler:(void (^)(AWSServicecatalogCreatePortfolioOutput *response, NSError *error))completionHandler {
    [[self createPortfolio:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogCreatePortfolioOutput *> * _Nonnull task) {
        AWSServicecatalogCreatePortfolioOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogCreatePortfolioShareOutput *> *)createPortfolioShare:(AWSServicecatalogCreatePortfolioShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"CreatePortfolioShare"
                   outputClass:[AWSServicecatalogCreatePortfolioShareOutput class]];
}

- (void)createPortfolioShare:(AWSServicecatalogCreatePortfolioShareInput *)request
     completionHandler:(void (^)(AWSServicecatalogCreatePortfolioShareOutput *response, NSError *error))completionHandler {
    [[self createPortfolioShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogCreatePortfolioShareOutput *> * _Nonnull task) {
        AWSServicecatalogCreatePortfolioShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogCreateProductOutput *> *)createProduct:(AWSServicecatalogCreateProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"CreateProduct"
                   outputClass:[AWSServicecatalogCreateProductOutput class]];
}

- (void)createProduct:(AWSServicecatalogCreateProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogCreateProductOutput *response, NSError *error))completionHandler {
    [[self createProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogCreateProductOutput *> * _Nonnull task) {
        AWSServicecatalogCreateProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogCreateProvisionedProductPlanOutput *> *)createProvisionedProductPlan:(AWSServicecatalogCreateProvisionedProductPlanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"CreateProvisionedProductPlan"
                   outputClass:[AWSServicecatalogCreateProvisionedProductPlanOutput class]];
}

- (void)createProvisionedProductPlan:(AWSServicecatalogCreateProvisionedProductPlanInput *)request
     completionHandler:(void (^)(AWSServicecatalogCreateProvisionedProductPlanOutput *response, NSError *error))completionHandler {
    [[self createProvisionedProductPlan:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogCreateProvisionedProductPlanOutput *> * _Nonnull task) {
        AWSServicecatalogCreateProvisionedProductPlanOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogCreateProvisioningArtifactOutput *> *)createProvisioningArtifact:(AWSServicecatalogCreateProvisioningArtifactInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"CreateProvisioningArtifact"
                   outputClass:[AWSServicecatalogCreateProvisioningArtifactOutput class]];
}

- (void)createProvisioningArtifact:(AWSServicecatalogCreateProvisioningArtifactInput *)request
     completionHandler:(void (^)(AWSServicecatalogCreateProvisioningArtifactOutput *response, NSError *error))completionHandler {
    [[self createProvisioningArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogCreateProvisioningArtifactOutput *> * _Nonnull task) {
        AWSServicecatalogCreateProvisioningArtifactOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogCreateServiceActionOutput *> *)createServiceAction:(AWSServicecatalogCreateServiceActionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"CreateServiceAction"
                   outputClass:[AWSServicecatalogCreateServiceActionOutput class]];
}

- (void)createServiceAction:(AWSServicecatalogCreateServiceActionInput *)request
     completionHandler:(void (^)(AWSServicecatalogCreateServiceActionOutput *response, NSError *error))completionHandler {
    [[self createServiceAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogCreateServiceActionOutput *> * _Nonnull task) {
        AWSServicecatalogCreateServiceActionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogCreateTagOptionOutput *> *)createTagOption:(AWSServicecatalogCreateTagOptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"CreateTagOption"
                   outputClass:[AWSServicecatalogCreateTagOptionOutput class]];
}

- (void)createTagOption:(AWSServicecatalogCreateTagOptionInput *)request
     completionHandler:(void (^)(AWSServicecatalogCreateTagOptionOutput *response, NSError *error))completionHandler {
    [[self createTagOption:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogCreateTagOptionOutput *> * _Nonnull task) {
        AWSServicecatalogCreateTagOptionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDeleteConstraintOutput *> *)deleteConstraint:(AWSServicecatalogDeleteConstraintInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DeleteConstraint"
                   outputClass:[AWSServicecatalogDeleteConstraintOutput class]];
}

- (void)deleteConstraint:(AWSServicecatalogDeleteConstraintInput *)request
     completionHandler:(void (^)(AWSServicecatalogDeleteConstraintOutput *response, NSError *error))completionHandler {
    [[self deleteConstraint:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDeleteConstraintOutput *> * _Nonnull task) {
        AWSServicecatalogDeleteConstraintOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDeletePortfolioOutput *> *)deletePortfolio:(AWSServicecatalogDeletePortfolioInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DeletePortfolio"
                   outputClass:[AWSServicecatalogDeletePortfolioOutput class]];
}

- (void)deletePortfolio:(AWSServicecatalogDeletePortfolioInput *)request
     completionHandler:(void (^)(AWSServicecatalogDeletePortfolioOutput *response, NSError *error))completionHandler {
    [[self deletePortfolio:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDeletePortfolioOutput *> * _Nonnull task) {
        AWSServicecatalogDeletePortfolioOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDeletePortfolioShareOutput *> *)deletePortfolioShare:(AWSServicecatalogDeletePortfolioShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DeletePortfolioShare"
                   outputClass:[AWSServicecatalogDeletePortfolioShareOutput class]];
}

- (void)deletePortfolioShare:(AWSServicecatalogDeletePortfolioShareInput *)request
     completionHandler:(void (^)(AWSServicecatalogDeletePortfolioShareOutput *response, NSError *error))completionHandler {
    [[self deletePortfolioShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDeletePortfolioShareOutput *> * _Nonnull task) {
        AWSServicecatalogDeletePortfolioShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDeleteProductOutput *> *)deleteProduct:(AWSServicecatalogDeleteProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DeleteProduct"
                   outputClass:[AWSServicecatalogDeleteProductOutput class]];
}

- (void)deleteProduct:(AWSServicecatalogDeleteProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogDeleteProductOutput *response, NSError *error))completionHandler {
    [[self deleteProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDeleteProductOutput *> * _Nonnull task) {
        AWSServicecatalogDeleteProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDeleteProvisionedProductPlanOutput *> *)deleteProvisionedProductPlan:(AWSServicecatalogDeleteProvisionedProductPlanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DeleteProvisionedProductPlan"
                   outputClass:[AWSServicecatalogDeleteProvisionedProductPlanOutput class]];
}

- (void)deleteProvisionedProductPlan:(AWSServicecatalogDeleteProvisionedProductPlanInput *)request
     completionHandler:(void (^)(AWSServicecatalogDeleteProvisionedProductPlanOutput *response, NSError *error))completionHandler {
    [[self deleteProvisionedProductPlan:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDeleteProvisionedProductPlanOutput *> * _Nonnull task) {
        AWSServicecatalogDeleteProvisionedProductPlanOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDeleteProvisioningArtifactOutput *> *)deleteProvisioningArtifact:(AWSServicecatalogDeleteProvisioningArtifactInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DeleteProvisioningArtifact"
                   outputClass:[AWSServicecatalogDeleteProvisioningArtifactOutput class]];
}

- (void)deleteProvisioningArtifact:(AWSServicecatalogDeleteProvisioningArtifactInput *)request
     completionHandler:(void (^)(AWSServicecatalogDeleteProvisioningArtifactOutput *response, NSError *error))completionHandler {
    [[self deleteProvisioningArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDeleteProvisioningArtifactOutput *> * _Nonnull task) {
        AWSServicecatalogDeleteProvisioningArtifactOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDeleteServiceActionOutput *> *)deleteServiceAction:(AWSServicecatalogDeleteServiceActionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DeleteServiceAction"
                   outputClass:[AWSServicecatalogDeleteServiceActionOutput class]];
}

- (void)deleteServiceAction:(AWSServicecatalogDeleteServiceActionInput *)request
     completionHandler:(void (^)(AWSServicecatalogDeleteServiceActionOutput *response, NSError *error))completionHandler {
    [[self deleteServiceAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDeleteServiceActionOutput *> * _Nonnull task) {
        AWSServicecatalogDeleteServiceActionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDeleteTagOptionOutput *> *)deleteTagOption:(AWSServicecatalogDeleteTagOptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DeleteTagOption"
                   outputClass:[AWSServicecatalogDeleteTagOptionOutput class]];
}

- (void)deleteTagOption:(AWSServicecatalogDeleteTagOptionInput *)request
     completionHandler:(void (^)(AWSServicecatalogDeleteTagOptionOutput *response, NSError *error))completionHandler {
    [[self deleteTagOption:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDeleteTagOptionOutput *> * _Nonnull task) {
        AWSServicecatalogDeleteTagOptionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeConstraintOutput *> *)describeConstraint:(AWSServicecatalogDescribeConstraintInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeConstraint"
                   outputClass:[AWSServicecatalogDescribeConstraintOutput class]];
}

- (void)describeConstraint:(AWSServicecatalogDescribeConstraintInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeConstraintOutput *response, NSError *error))completionHandler {
    [[self describeConstraint:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeConstraintOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeConstraintOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeCopyProductStatusOutput *> *)describeCopyProductStatus:(AWSServicecatalogDescribeCopyProductStatusInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeCopyProductStatus"
                   outputClass:[AWSServicecatalogDescribeCopyProductStatusOutput class]];
}

- (void)describeCopyProductStatus:(AWSServicecatalogDescribeCopyProductStatusInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeCopyProductStatusOutput *response, NSError *error))completionHandler {
    [[self describeCopyProductStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeCopyProductStatusOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeCopyProductStatusOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribePortfolioOutput *> *)describePortfolio:(AWSServicecatalogDescribePortfolioInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribePortfolio"
                   outputClass:[AWSServicecatalogDescribePortfolioOutput class]];
}

- (void)describePortfolio:(AWSServicecatalogDescribePortfolioInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribePortfolioOutput *response, NSError *error))completionHandler {
    [[self describePortfolio:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribePortfolioOutput *> * _Nonnull task) {
        AWSServicecatalogDescribePortfolioOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribePortfolioShareStatusOutput *> *)describePortfolioShareStatus:(AWSServicecatalogDescribePortfolioShareStatusInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribePortfolioShareStatus"
                   outputClass:[AWSServicecatalogDescribePortfolioShareStatusOutput class]];
}

- (void)describePortfolioShareStatus:(AWSServicecatalogDescribePortfolioShareStatusInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribePortfolioShareStatusOutput *response, NSError *error))completionHandler {
    [[self describePortfolioShareStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribePortfolioShareStatusOutput *> * _Nonnull task) {
        AWSServicecatalogDescribePortfolioShareStatusOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeProductOutput *> *)describeProduct:(AWSServicecatalogDescribeProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeProduct"
                   outputClass:[AWSServicecatalogDescribeProductOutput class]];
}

- (void)describeProduct:(AWSServicecatalogDescribeProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeProductOutput *response, NSError *error))completionHandler {
    [[self describeProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeProductOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeProductAsAdminOutput *> *)describeProductAsAdmin:(AWSServicecatalogDescribeProductAsAdminInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeProductAsAdmin"
                   outputClass:[AWSServicecatalogDescribeProductAsAdminOutput class]];
}

- (void)describeProductAsAdmin:(AWSServicecatalogDescribeProductAsAdminInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeProductAsAdminOutput *response, NSError *error))completionHandler {
    [[self describeProductAsAdmin:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeProductAsAdminOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeProductAsAdminOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeProductViewOutput *> *)describeProductView:(AWSServicecatalogDescribeProductViewInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeProductView"
                   outputClass:[AWSServicecatalogDescribeProductViewOutput class]];
}

- (void)describeProductView:(AWSServicecatalogDescribeProductViewInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeProductViewOutput *response, NSError *error))completionHandler {
    [[self describeProductView:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeProductViewOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeProductViewOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeProvisionedProductOutput *> *)describeProvisionedProduct:(AWSServicecatalogDescribeProvisionedProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeProvisionedProduct"
                   outputClass:[AWSServicecatalogDescribeProvisionedProductOutput class]];
}

- (void)describeProvisionedProduct:(AWSServicecatalogDescribeProvisionedProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeProvisionedProductOutput *response, NSError *error))completionHandler {
    [[self describeProvisionedProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeProvisionedProductOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeProvisionedProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeProvisionedProductPlanOutput *> *)describeProvisionedProductPlan:(AWSServicecatalogDescribeProvisionedProductPlanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeProvisionedProductPlan"
                   outputClass:[AWSServicecatalogDescribeProvisionedProductPlanOutput class]];
}

- (void)describeProvisionedProductPlan:(AWSServicecatalogDescribeProvisionedProductPlanInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeProvisionedProductPlanOutput *response, NSError *error))completionHandler {
    [[self describeProvisionedProductPlan:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeProvisionedProductPlanOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeProvisionedProductPlanOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeProvisioningArtifactOutput *> *)describeProvisioningArtifact:(AWSServicecatalogDescribeProvisioningArtifactInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeProvisioningArtifact"
                   outputClass:[AWSServicecatalogDescribeProvisioningArtifactOutput class]];
}

- (void)describeProvisioningArtifact:(AWSServicecatalogDescribeProvisioningArtifactInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeProvisioningArtifactOutput *response, NSError *error))completionHandler {
    [[self describeProvisioningArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeProvisioningArtifactOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeProvisioningArtifactOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeProvisioningParametersOutput *> *)describeProvisioningParameters:(AWSServicecatalogDescribeProvisioningParametersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeProvisioningParameters"
                   outputClass:[AWSServicecatalogDescribeProvisioningParametersOutput class]];
}

- (void)describeProvisioningParameters:(AWSServicecatalogDescribeProvisioningParametersInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeProvisioningParametersOutput *response, NSError *error))completionHandler {
    [[self describeProvisioningParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeProvisioningParametersOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeProvisioningParametersOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeRecordOutput *> *)describeRecord:(AWSServicecatalogDescribeRecordInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeRecord"
                   outputClass:[AWSServicecatalogDescribeRecordOutput class]];
}

- (void)describeRecord:(AWSServicecatalogDescribeRecordInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeRecordOutput *response, NSError *error))completionHandler {
    [[self describeRecord:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeRecordOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeRecordOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeServiceActionOutput *> *)describeServiceAction:(AWSServicecatalogDescribeServiceActionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeServiceAction"
                   outputClass:[AWSServicecatalogDescribeServiceActionOutput class]];
}

- (void)describeServiceAction:(AWSServicecatalogDescribeServiceActionInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeServiceActionOutput *response, NSError *error))completionHandler {
    [[self describeServiceAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeServiceActionOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeServiceActionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeServiceActionExecutionParametersOutput *> *)describeServiceActionExecutionParameters:(AWSServicecatalogDescribeServiceActionExecutionParametersInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeServiceActionExecutionParameters"
                   outputClass:[AWSServicecatalogDescribeServiceActionExecutionParametersOutput class]];
}

- (void)describeServiceActionExecutionParameters:(AWSServicecatalogDescribeServiceActionExecutionParametersInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeServiceActionExecutionParametersOutput *response, NSError *error))completionHandler {
    [[self describeServiceActionExecutionParameters:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeServiceActionExecutionParametersOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeServiceActionExecutionParametersOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDescribeTagOptionOutput *> *)describeTagOption:(AWSServicecatalogDescribeTagOptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DescribeTagOption"
                   outputClass:[AWSServicecatalogDescribeTagOptionOutput class]];
}

- (void)describeTagOption:(AWSServicecatalogDescribeTagOptionInput *)request
     completionHandler:(void (^)(AWSServicecatalogDescribeTagOptionOutput *response, NSError *error))completionHandler {
    [[self describeTagOption:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDescribeTagOptionOutput *> * _Nonnull task) {
        AWSServicecatalogDescribeTagOptionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDisableAWSOrganizationsAccessOutput *> *)disableAWSOrganizationsAccess:(AWSServicecatalogDisableAWSOrganizationsAccessInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DisableAWSOrganizationsAccess"
                   outputClass:[AWSServicecatalogDisableAWSOrganizationsAccessOutput class]];
}

- (void)disableAWSOrganizationsAccess:(AWSServicecatalogDisableAWSOrganizationsAccessInput *)request
     completionHandler:(void (^)(AWSServicecatalogDisableAWSOrganizationsAccessOutput *response, NSError *error))completionHandler {
    [[self disableAWSOrganizationsAccess:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDisableAWSOrganizationsAccessOutput *> * _Nonnull task) {
        AWSServicecatalogDisableAWSOrganizationsAccessOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDisassociateBudgetFromResourceOutput *> *)disassociateBudgetFromResource:(AWSServicecatalogDisassociateBudgetFromResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DisassociateBudgetFromResource"
                   outputClass:[AWSServicecatalogDisassociateBudgetFromResourceOutput class]];
}

- (void)disassociateBudgetFromResource:(AWSServicecatalogDisassociateBudgetFromResourceInput *)request
     completionHandler:(void (^)(AWSServicecatalogDisassociateBudgetFromResourceOutput *response, NSError *error))completionHandler {
    [[self disassociateBudgetFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDisassociateBudgetFromResourceOutput *> * _Nonnull task) {
        AWSServicecatalogDisassociateBudgetFromResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDisassociatePrincipalFromPortfolioOutput *> *)disassociatePrincipalFromPortfolio:(AWSServicecatalogDisassociatePrincipalFromPortfolioInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DisassociatePrincipalFromPortfolio"
                   outputClass:[AWSServicecatalogDisassociatePrincipalFromPortfolioOutput class]];
}

- (void)disassociatePrincipalFromPortfolio:(AWSServicecatalogDisassociatePrincipalFromPortfolioInput *)request
     completionHandler:(void (^)(AWSServicecatalogDisassociatePrincipalFromPortfolioOutput *response, NSError *error))completionHandler {
    [[self disassociatePrincipalFromPortfolio:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDisassociatePrincipalFromPortfolioOutput *> * _Nonnull task) {
        AWSServicecatalogDisassociatePrincipalFromPortfolioOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDisassociateProductFromPortfolioOutput *> *)disassociateProductFromPortfolio:(AWSServicecatalogDisassociateProductFromPortfolioInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DisassociateProductFromPortfolio"
                   outputClass:[AWSServicecatalogDisassociateProductFromPortfolioOutput class]];
}

- (void)disassociateProductFromPortfolio:(AWSServicecatalogDisassociateProductFromPortfolioInput *)request
     completionHandler:(void (^)(AWSServicecatalogDisassociateProductFromPortfolioOutput *response, NSError *error))completionHandler {
    [[self disassociateProductFromPortfolio:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDisassociateProductFromPortfolioOutput *> * _Nonnull task) {
        AWSServicecatalogDisassociateProductFromPortfolioOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput *> *)disassociateServiceActionFromProvisioningArtifact:(AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DisassociateServiceActionFromProvisioningArtifact"
                   outputClass:[AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput class]];
}

- (void)disassociateServiceActionFromProvisioningArtifact:(AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactInput *)request
     completionHandler:(void (^)(AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput *response, NSError *error))completionHandler {
    [[self disassociateServiceActionFromProvisioningArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput *> * _Nonnull task) {
        AWSServicecatalogDisassociateServiceActionFromProvisioningArtifactOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogDisassociateTagOptionFromResourceOutput *> *)disassociateTagOptionFromResource:(AWSServicecatalogDisassociateTagOptionFromResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"DisassociateTagOptionFromResource"
                   outputClass:[AWSServicecatalogDisassociateTagOptionFromResourceOutput class]];
}

- (void)disassociateTagOptionFromResource:(AWSServicecatalogDisassociateTagOptionFromResourceInput *)request
     completionHandler:(void (^)(AWSServicecatalogDisassociateTagOptionFromResourceOutput *response, NSError *error))completionHandler {
    [[self disassociateTagOptionFromResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogDisassociateTagOptionFromResourceOutput *> * _Nonnull task) {
        AWSServicecatalogDisassociateTagOptionFromResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogEnableAWSOrganizationsAccessOutput *> *)enableAWSOrganizationsAccess:(AWSServicecatalogEnableAWSOrganizationsAccessInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"EnableAWSOrganizationsAccess"
                   outputClass:[AWSServicecatalogEnableAWSOrganizationsAccessOutput class]];
}

- (void)enableAWSOrganizationsAccess:(AWSServicecatalogEnableAWSOrganizationsAccessInput *)request
     completionHandler:(void (^)(AWSServicecatalogEnableAWSOrganizationsAccessOutput *response, NSError *error))completionHandler {
    [[self enableAWSOrganizationsAccess:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogEnableAWSOrganizationsAccessOutput *> * _Nonnull task) {
        AWSServicecatalogEnableAWSOrganizationsAccessOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogExecuteProvisionedProductPlanOutput *> *)executeProvisionedProductPlan:(AWSServicecatalogExecuteProvisionedProductPlanInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ExecuteProvisionedProductPlan"
                   outputClass:[AWSServicecatalogExecuteProvisionedProductPlanOutput class]];
}

- (void)executeProvisionedProductPlan:(AWSServicecatalogExecuteProvisionedProductPlanInput *)request
     completionHandler:(void (^)(AWSServicecatalogExecuteProvisionedProductPlanOutput *response, NSError *error))completionHandler {
    [[self executeProvisionedProductPlan:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogExecuteProvisionedProductPlanOutput *> * _Nonnull task) {
        AWSServicecatalogExecuteProvisionedProductPlanOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogExecuteProvisionedProductServiceActionOutput *> *)executeProvisionedProductServiceAction:(AWSServicecatalogExecuteProvisionedProductServiceActionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ExecuteProvisionedProductServiceAction"
                   outputClass:[AWSServicecatalogExecuteProvisionedProductServiceActionOutput class]];
}

- (void)executeProvisionedProductServiceAction:(AWSServicecatalogExecuteProvisionedProductServiceActionInput *)request
     completionHandler:(void (^)(AWSServicecatalogExecuteProvisionedProductServiceActionOutput *response, NSError *error))completionHandler {
    [[self executeProvisionedProductServiceAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogExecuteProvisionedProductServiceActionOutput *> * _Nonnull task) {
        AWSServicecatalogExecuteProvisionedProductServiceActionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogGetAWSOrganizationsAccessStatusOutput *> *)getAWSOrganizationsAccessStatus:(AWSServicecatalogGetAWSOrganizationsAccessStatusInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"GetAWSOrganizationsAccessStatus"
                   outputClass:[AWSServicecatalogGetAWSOrganizationsAccessStatusOutput class]];
}

- (void)getAWSOrganizationsAccessStatus:(AWSServicecatalogGetAWSOrganizationsAccessStatusInput *)request
     completionHandler:(void (^)(AWSServicecatalogGetAWSOrganizationsAccessStatusOutput *response, NSError *error))completionHandler {
    [[self getAWSOrganizationsAccessStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogGetAWSOrganizationsAccessStatusOutput *> * _Nonnull task) {
        AWSServicecatalogGetAWSOrganizationsAccessStatusOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListAcceptedPortfolioSharesOutput *> *)listAcceptedPortfolioShares:(AWSServicecatalogListAcceptedPortfolioSharesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListAcceptedPortfolioShares"
                   outputClass:[AWSServicecatalogListAcceptedPortfolioSharesOutput class]];
}

- (void)listAcceptedPortfolioShares:(AWSServicecatalogListAcceptedPortfolioSharesInput *)request
     completionHandler:(void (^)(AWSServicecatalogListAcceptedPortfolioSharesOutput *response, NSError *error))completionHandler {
    [[self listAcceptedPortfolioShares:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListAcceptedPortfolioSharesOutput *> * _Nonnull task) {
        AWSServicecatalogListAcceptedPortfolioSharesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListBudgetsForResourceOutput *> *)listBudgetsForResource:(AWSServicecatalogListBudgetsForResourceInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListBudgetsForResource"
                   outputClass:[AWSServicecatalogListBudgetsForResourceOutput class]];
}

- (void)listBudgetsForResource:(AWSServicecatalogListBudgetsForResourceInput *)request
     completionHandler:(void (^)(AWSServicecatalogListBudgetsForResourceOutput *response, NSError *error))completionHandler {
    [[self listBudgetsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListBudgetsForResourceOutput *> * _Nonnull task) {
        AWSServicecatalogListBudgetsForResourceOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListConstraintsForPortfolioOutput *> *)listConstraintsForPortfolio:(AWSServicecatalogListConstraintsForPortfolioInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListConstraintsForPortfolio"
                   outputClass:[AWSServicecatalogListConstraintsForPortfolioOutput class]];
}

- (void)listConstraintsForPortfolio:(AWSServicecatalogListConstraintsForPortfolioInput *)request
     completionHandler:(void (^)(AWSServicecatalogListConstraintsForPortfolioOutput *response, NSError *error))completionHandler {
    [[self listConstraintsForPortfolio:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListConstraintsForPortfolioOutput *> * _Nonnull task) {
        AWSServicecatalogListConstraintsForPortfolioOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListLaunchPathsOutput *> *)listLaunchPaths:(AWSServicecatalogListLaunchPathsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListLaunchPaths"
                   outputClass:[AWSServicecatalogListLaunchPathsOutput class]];
}

- (void)listLaunchPaths:(AWSServicecatalogListLaunchPathsInput *)request
     completionHandler:(void (^)(AWSServicecatalogListLaunchPathsOutput *response, NSError *error))completionHandler {
    [[self listLaunchPaths:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListLaunchPathsOutput *> * _Nonnull task) {
        AWSServicecatalogListLaunchPathsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListOrganizationPortfolioAccessOutput *> *)listOrganizationPortfolioAccess:(AWSServicecatalogListOrganizationPortfolioAccessInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListOrganizationPortfolioAccess"
                   outputClass:[AWSServicecatalogListOrganizationPortfolioAccessOutput class]];
}

- (void)listOrganizationPortfolioAccess:(AWSServicecatalogListOrganizationPortfolioAccessInput *)request
     completionHandler:(void (^)(AWSServicecatalogListOrganizationPortfolioAccessOutput *response, NSError *error))completionHandler {
    [[self listOrganizationPortfolioAccess:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListOrganizationPortfolioAccessOutput *> * _Nonnull task) {
        AWSServicecatalogListOrganizationPortfolioAccessOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListPortfolioAccessOutput *> *)listPortfolioAccess:(AWSServicecatalogListPortfolioAccessInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListPortfolioAccess"
                   outputClass:[AWSServicecatalogListPortfolioAccessOutput class]];
}

- (void)listPortfolioAccess:(AWSServicecatalogListPortfolioAccessInput *)request
     completionHandler:(void (^)(AWSServicecatalogListPortfolioAccessOutput *response, NSError *error))completionHandler {
    [[self listPortfolioAccess:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListPortfolioAccessOutput *> * _Nonnull task) {
        AWSServicecatalogListPortfolioAccessOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListPortfoliosOutput *> *)listPortfolios:(AWSServicecatalogListPortfoliosInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListPortfolios"
                   outputClass:[AWSServicecatalogListPortfoliosOutput class]];
}

- (void)listPortfolios:(AWSServicecatalogListPortfoliosInput *)request
     completionHandler:(void (^)(AWSServicecatalogListPortfoliosOutput *response, NSError *error))completionHandler {
    [[self listPortfolios:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListPortfoliosOutput *> * _Nonnull task) {
        AWSServicecatalogListPortfoliosOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListPortfoliosForProductOutput *> *)listPortfoliosForProduct:(AWSServicecatalogListPortfoliosForProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListPortfoliosForProduct"
                   outputClass:[AWSServicecatalogListPortfoliosForProductOutput class]];
}

- (void)listPortfoliosForProduct:(AWSServicecatalogListPortfoliosForProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogListPortfoliosForProductOutput *response, NSError *error))completionHandler {
    [[self listPortfoliosForProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListPortfoliosForProductOutput *> * _Nonnull task) {
        AWSServicecatalogListPortfoliosForProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListPrincipalsForPortfolioOutput *> *)listPrincipalsForPortfolio:(AWSServicecatalogListPrincipalsForPortfolioInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListPrincipalsForPortfolio"
                   outputClass:[AWSServicecatalogListPrincipalsForPortfolioOutput class]];
}

- (void)listPrincipalsForPortfolio:(AWSServicecatalogListPrincipalsForPortfolioInput *)request
     completionHandler:(void (^)(AWSServicecatalogListPrincipalsForPortfolioOutput *response, NSError *error))completionHandler {
    [[self listPrincipalsForPortfolio:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListPrincipalsForPortfolioOutput *> * _Nonnull task) {
        AWSServicecatalogListPrincipalsForPortfolioOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListProvisionedProductPlansOutput *> *)listProvisionedProductPlans:(AWSServicecatalogListProvisionedProductPlansInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListProvisionedProductPlans"
                   outputClass:[AWSServicecatalogListProvisionedProductPlansOutput class]];
}

- (void)listProvisionedProductPlans:(AWSServicecatalogListProvisionedProductPlansInput *)request
     completionHandler:(void (^)(AWSServicecatalogListProvisionedProductPlansOutput *response, NSError *error))completionHandler {
    [[self listProvisionedProductPlans:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListProvisionedProductPlansOutput *> * _Nonnull task) {
        AWSServicecatalogListProvisionedProductPlansOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListProvisioningArtifactsOutput *> *)listProvisioningArtifacts:(AWSServicecatalogListProvisioningArtifactsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListProvisioningArtifacts"
                   outputClass:[AWSServicecatalogListProvisioningArtifactsOutput class]];
}

- (void)listProvisioningArtifacts:(AWSServicecatalogListProvisioningArtifactsInput *)request
     completionHandler:(void (^)(AWSServicecatalogListProvisioningArtifactsOutput *response, NSError *error))completionHandler {
    [[self listProvisioningArtifacts:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListProvisioningArtifactsOutput *> * _Nonnull task) {
        AWSServicecatalogListProvisioningArtifactsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListProvisioningArtifactsForServiceActionOutput *> *)listProvisioningArtifactsForServiceAction:(AWSServicecatalogListProvisioningArtifactsForServiceActionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListProvisioningArtifactsForServiceAction"
                   outputClass:[AWSServicecatalogListProvisioningArtifactsForServiceActionOutput class]];
}

- (void)listProvisioningArtifactsForServiceAction:(AWSServicecatalogListProvisioningArtifactsForServiceActionInput *)request
     completionHandler:(void (^)(AWSServicecatalogListProvisioningArtifactsForServiceActionOutput *response, NSError *error))completionHandler {
    [[self listProvisioningArtifactsForServiceAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListProvisioningArtifactsForServiceActionOutput *> * _Nonnull task) {
        AWSServicecatalogListProvisioningArtifactsForServiceActionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListRecordHistoryOutput *> *)listRecordHistory:(AWSServicecatalogListRecordHistoryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListRecordHistory"
                   outputClass:[AWSServicecatalogListRecordHistoryOutput class]];
}

- (void)listRecordHistory:(AWSServicecatalogListRecordHistoryInput *)request
     completionHandler:(void (^)(AWSServicecatalogListRecordHistoryOutput *response, NSError *error))completionHandler {
    [[self listRecordHistory:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListRecordHistoryOutput *> * _Nonnull task) {
        AWSServicecatalogListRecordHistoryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListResourcesForTagOptionOutput *> *)listResourcesForTagOption:(AWSServicecatalogListResourcesForTagOptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListResourcesForTagOption"
                   outputClass:[AWSServicecatalogListResourcesForTagOptionOutput class]];
}

- (void)listResourcesForTagOption:(AWSServicecatalogListResourcesForTagOptionInput *)request
     completionHandler:(void (^)(AWSServicecatalogListResourcesForTagOptionOutput *response, NSError *error))completionHandler {
    [[self listResourcesForTagOption:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListResourcesForTagOptionOutput *> * _Nonnull task) {
        AWSServicecatalogListResourcesForTagOptionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListServiceActionsOutput *> *)listServiceActions:(AWSServicecatalogListServiceActionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListServiceActions"
                   outputClass:[AWSServicecatalogListServiceActionsOutput class]];
}

- (void)listServiceActions:(AWSServicecatalogListServiceActionsInput *)request
     completionHandler:(void (^)(AWSServicecatalogListServiceActionsOutput *response, NSError *error))completionHandler {
    [[self listServiceActions:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListServiceActionsOutput *> * _Nonnull task) {
        AWSServicecatalogListServiceActionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListServiceActionsForProvisioningArtifactOutput *> *)listServiceActionsForProvisioningArtifact:(AWSServicecatalogListServiceActionsForProvisioningArtifactInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListServiceActionsForProvisioningArtifact"
                   outputClass:[AWSServicecatalogListServiceActionsForProvisioningArtifactOutput class]];
}

- (void)listServiceActionsForProvisioningArtifact:(AWSServicecatalogListServiceActionsForProvisioningArtifactInput *)request
     completionHandler:(void (^)(AWSServicecatalogListServiceActionsForProvisioningArtifactOutput *response, NSError *error))completionHandler {
    [[self listServiceActionsForProvisioningArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListServiceActionsForProvisioningArtifactOutput *> * _Nonnull task) {
        AWSServicecatalogListServiceActionsForProvisioningArtifactOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListStackInstancesForProvisionedProductOutput *> *)listStackInstancesForProvisionedProduct:(AWSServicecatalogListStackInstancesForProvisionedProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListStackInstancesForProvisionedProduct"
                   outputClass:[AWSServicecatalogListStackInstancesForProvisionedProductOutput class]];
}

- (void)listStackInstancesForProvisionedProduct:(AWSServicecatalogListStackInstancesForProvisionedProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogListStackInstancesForProvisionedProductOutput *response, NSError *error))completionHandler {
    [[self listStackInstancesForProvisionedProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListStackInstancesForProvisionedProductOutput *> * _Nonnull task) {
        AWSServicecatalogListStackInstancesForProvisionedProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogListTagOptionsOutput *> *)listTagOptions:(AWSServicecatalogListTagOptionsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ListTagOptions"
                   outputClass:[AWSServicecatalogListTagOptionsOutput class]];
}

- (void)listTagOptions:(AWSServicecatalogListTagOptionsInput *)request
     completionHandler:(void (^)(AWSServicecatalogListTagOptionsOutput *response, NSError *error))completionHandler {
    [[self listTagOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogListTagOptionsOutput *> * _Nonnull task) {
        AWSServicecatalogListTagOptionsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogProvisionProductOutput *> *)provisionProduct:(AWSServicecatalogProvisionProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ProvisionProduct"
                   outputClass:[AWSServicecatalogProvisionProductOutput class]];
}

- (void)provisionProduct:(AWSServicecatalogProvisionProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogProvisionProductOutput *response, NSError *error))completionHandler {
    [[self provisionProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogProvisionProductOutput *> * _Nonnull task) {
        AWSServicecatalogProvisionProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogRejectPortfolioShareOutput *> *)rejectPortfolioShare:(AWSServicecatalogRejectPortfolioShareInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"RejectPortfolioShare"
                   outputClass:[AWSServicecatalogRejectPortfolioShareOutput class]];
}

- (void)rejectPortfolioShare:(AWSServicecatalogRejectPortfolioShareInput *)request
     completionHandler:(void (^)(AWSServicecatalogRejectPortfolioShareOutput *response, NSError *error))completionHandler {
    [[self rejectPortfolioShare:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogRejectPortfolioShareOutput *> * _Nonnull task) {
        AWSServicecatalogRejectPortfolioShareOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogScanProvisionedProductsOutput *> *)scanProvisionedProducts:(AWSServicecatalogScanProvisionedProductsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"ScanProvisionedProducts"
                   outputClass:[AWSServicecatalogScanProvisionedProductsOutput class]];
}

- (void)scanProvisionedProducts:(AWSServicecatalogScanProvisionedProductsInput *)request
     completionHandler:(void (^)(AWSServicecatalogScanProvisionedProductsOutput *response, NSError *error))completionHandler {
    [[self scanProvisionedProducts:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogScanProvisionedProductsOutput *> * _Nonnull task) {
        AWSServicecatalogScanProvisionedProductsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogSearchProductsOutput *> *)searchProducts:(AWSServicecatalogSearchProductsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"SearchProducts"
                   outputClass:[AWSServicecatalogSearchProductsOutput class]];
}

- (void)searchProducts:(AWSServicecatalogSearchProductsInput *)request
     completionHandler:(void (^)(AWSServicecatalogSearchProductsOutput *response, NSError *error))completionHandler {
    [[self searchProducts:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogSearchProductsOutput *> * _Nonnull task) {
        AWSServicecatalogSearchProductsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogSearchProductsAsAdminOutput *> *)searchProductsAsAdmin:(AWSServicecatalogSearchProductsAsAdminInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"SearchProductsAsAdmin"
                   outputClass:[AWSServicecatalogSearchProductsAsAdminOutput class]];
}

- (void)searchProductsAsAdmin:(AWSServicecatalogSearchProductsAsAdminInput *)request
     completionHandler:(void (^)(AWSServicecatalogSearchProductsAsAdminOutput *response, NSError *error))completionHandler {
    [[self searchProductsAsAdmin:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogSearchProductsAsAdminOutput *> * _Nonnull task) {
        AWSServicecatalogSearchProductsAsAdminOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogSearchProvisionedProductsOutput *> *)searchProvisionedProducts:(AWSServicecatalogSearchProvisionedProductsInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"SearchProvisionedProducts"
                   outputClass:[AWSServicecatalogSearchProvisionedProductsOutput class]];
}

- (void)searchProvisionedProducts:(AWSServicecatalogSearchProvisionedProductsInput *)request
     completionHandler:(void (^)(AWSServicecatalogSearchProvisionedProductsOutput *response, NSError *error))completionHandler {
    [[self searchProvisionedProducts:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogSearchProvisionedProductsOutput *> * _Nonnull task) {
        AWSServicecatalogSearchProvisionedProductsOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogTerminateProvisionedProductOutput *> *)terminateProvisionedProduct:(AWSServicecatalogTerminateProvisionedProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"TerminateProvisionedProduct"
                   outputClass:[AWSServicecatalogTerminateProvisionedProductOutput class]];
}

- (void)terminateProvisionedProduct:(AWSServicecatalogTerminateProvisionedProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogTerminateProvisionedProductOutput *response, NSError *error))completionHandler {
    [[self terminateProvisionedProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogTerminateProvisionedProductOutput *> * _Nonnull task) {
        AWSServicecatalogTerminateProvisionedProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogUpdateConstraintOutput *> *)updateConstraint:(AWSServicecatalogUpdateConstraintInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"UpdateConstraint"
                   outputClass:[AWSServicecatalogUpdateConstraintOutput class]];
}

- (void)updateConstraint:(AWSServicecatalogUpdateConstraintInput *)request
     completionHandler:(void (^)(AWSServicecatalogUpdateConstraintOutput *response, NSError *error))completionHandler {
    [[self updateConstraint:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogUpdateConstraintOutput *> * _Nonnull task) {
        AWSServicecatalogUpdateConstraintOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogUpdatePortfolioOutput *> *)updatePortfolio:(AWSServicecatalogUpdatePortfolioInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"UpdatePortfolio"
                   outputClass:[AWSServicecatalogUpdatePortfolioOutput class]];
}

- (void)updatePortfolio:(AWSServicecatalogUpdatePortfolioInput *)request
     completionHandler:(void (^)(AWSServicecatalogUpdatePortfolioOutput *response, NSError *error))completionHandler {
    [[self updatePortfolio:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogUpdatePortfolioOutput *> * _Nonnull task) {
        AWSServicecatalogUpdatePortfolioOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogUpdateProductOutput *> *)updateProduct:(AWSServicecatalogUpdateProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"UpdateProduct"
                   outputClass:[AWSServicecatalogUpdateProductOutput class]];
}

- (void)updateProduct:(AWSServicecatalogUpdateProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogUpdateProductOutput *response, NSError *error))completionHandler {
    [[self updateProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogUpdateProductOutput *> * _Nonnull task) {
        AWSServicecatalogUpdateProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogUpdateProvisionedProductOutput *> *)updateProvisionedProduct:(AWSServicecatalogUpdateProvisionedProductInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"UpdateProvisionedProduct"
                   outputClass:[AWSServicecatalogUpdateProvisionedProductOutput class]];
}

- (void)updateProvisionedProduct:(AWSServicecatalogUpdateProvisionedProductInput *)request
     completionHandler:(void (^)(AWSServicecatalogUpdateProvisionedProductOutput *response, NSError *error))completionHandler {
    [[self updateProvisionedProduct:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogUpdateProvisionedProductOutput *> * _Nonnull task) {
        AWSServicecatalogUpdateProvisionedProductOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogUpdateProvisionedProductPropertiesOutput *> *)updateProvisionedProductProperties:(AWSServicecatalogUpdateProvisionedProductPropertiesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"UpdateProvisionedProductProperties"
                   outputClass:[AWSServicecatalogUpdateProvisionedProductPropertiesOutput class]];
}

- (void)updateProvisionedProductProperties:(AWSServicecatalogUpdateProvisionedProductPropertiesInput *)request
     completionHandler:(void (^)(AWSServicecatalogUpdateProvisionedProductPropertiesOutput *response, NSError *error))completionHandler {
    [[self updateProvisionedProductProperties:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogUpdateProvisionedProductPropertiesOutput *> * _Nonnull task) {
        AWSServicecatalogUpdateProvisionedProductPropertiesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogUpdateProvisioningArtifactOutput *> *)updateProvisioningArtifact:(AWSServicecatalogUpdateProvisioningArtifactInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"UpdateProvisioningArtifact"
                   outputClass:[AWSServicecatalogUpdateProvisioningArtifactOutput class]];
}

- (void)updateProvisioningArtifact:(AWSServicecatalogUpdateProvisioningArtifactInput *)request
     completionHandler:(void (^)(AWSServicecatalogUpdateProvisioningArtifactOutput *response, NSError *error))completionHandler {
    [[self updateProvisioningArtifact:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogUpdateProvisioningArtifactOutput *> * _Nonnull task) {
        AWSServicecatalogUpdateProvisioningArtifactOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogUpdateServiceActionOutput *> *)updateServiceAction:(AWSServicecatalogUpdateServiceActionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"UpdateServiceAction"
                   outputClass:[AWSServicecatalogUpdateServiceActionOutput class]];
}

- (void)updateServiceAction:(AWSServicecatalogUpdateServiceActionInput *)request
     completionHandler:(void (^)(AWSServicecatalogUpdateServiceActionOutput *response, NSError *error))completionHandler {
    [[self updateServiceAction:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogUpdateServiceActionOutput *> * _Nonnull task) {
        AWSServicecatalogUpdateServiceActionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSServicecatalogUpdateTagOptionOutput *> *)updateTagOption:(AWSServicecatalogUpdateTagOptionInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWS242ServiceCatalogService"
                 operationName:@"UpdateTagOption"
                   outputClass:[AWSServicecatalogUpdateTagOptionOutput class]];
}

- (void)updateTagOption:(AWSServicecatalogUpdateTagOptionInput *)request
     completionHandler:(void (^)(AWSServicecatalogUpdateTagOptionOutput *response, NSError *error))completionHandler {
    [[self updateTagOption:request] continueWithBlock:^id _Nullable(AWSTask<AWSServicecatalogUpdateTagOptionOutput *> * _Nonnull task) {
        AWSServicecatalogUpdateTagOptionOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
