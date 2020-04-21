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

#import "AWSceService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSceResources.h"

static NSString *const AWSInfoce = @"ce";
NSString *const AWSceSDKVersion = @"2.13.2";


@interface AWSceResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSceResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BillExpirationException" : @(AWSceErrorBillExpiration),
                            @"DataUnavailableException" : @(AWSceErrorDataUnavailable),
                            @"InvalidNextTokenException" : @(AWSceErrorInvalidNextToken),
                            @"LimitExceededException" : @(AWSceErrorLimitExceeded),
                            @"RequestChangedException" : @(AWSceErrorRequestChanged),
                            @"ResourceNotFoundException" : @(AWSceErrorResourceNotFound),
                            @"ServiceQuotaExceededException" : @(AWSceErrorServiceQuotaExceeded),
                            @"UnresolvableUsageUnitException" : @(AWSceErrorUnresolvableUsageUnit),
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
	                *error = [NSError errorWithDomain:AWSceErrorDomain
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
        *error = [NSError errorWithDomain:AWSceErrorDomain
                                     code:AWSceErrorUnknown
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

@interface AWSceRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSceRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSce()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSce

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSceSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSce versions need to match. Check your SDK installation. AWSCore: %@ AWSce: %@", AWSiOSSDKVersion, AWSceSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultce {
    static AWSce *_defaultce = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoce];
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
        _defaultce = [[AWSce alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultce;
}

+ (void)registerceWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSce alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ceForKey:(NSString *)key {
    @synchronized(self) {
        AWSce *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoce
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSce registerceWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeceForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultce` or `+ ceForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicece
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicece];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSceRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSceResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSceResponseSerializer alloc] initWithJSONDefinition:[[AWSceResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSceCreateCostCategoryDefinitionResponse *> *)createCostCategoryDefinition:(AWSceCreateCostCategoryDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"CreateCostCategoryDefinition"
                   outputClass:[AWSceCreateCostCategoryDefinitionResponse class]];
}

- (void)createCostCategoryDefinition:(AWSceCreateCostCategoryDefinitionRequest *)request
     completionHandler:(void (^)(AWSceCreateCostCategoryDefinitionResponse *response, NSError *error))completionHandler {
    [[self createCostCategoryDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSceCreateCostCategoryDefinitionResponse *> * _Nonnull task) {
        AWSceCreateCostCategoryDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceDeleteCostCategoryDefinitionResponse *> *)deleteCostCategoryDefinition:(AWSceDeleteCostCategoryDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"DeleteCostCategoryDefinition"
                   outputClass:[AWSceDeleteCostCategoryDefinitionResponse class]];
}

- (void)deleteCostCategoryDefinition:(AWSceDeleteCostCategoryDefinitionRequest *)request
     completionHandler:(void (^)(AWSceDeleteCostCategoryDefinitionResponse *response, NSError *error))completionHandler {
    [[self deleteCostCategoryDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSceDeleteCostCategoryDefinitionResponse *> * _Nonnull task) {
        AWSceDeleteCostCategoryDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceDescribeCostCategoryDefinitionResponse *> *)describeCostCategoryDefinition:(AWSceDescribeCostCategoryDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"DescribeCostCategoryDefinition"
                   outputClass:[AWSceDescribeCostCategoryDefinitionResponse class]];
}

- (void)describeCostCategoryDefinition:(AWSceDescribeCostCategoryDefinitionRequest *)request
     completionHandler:(void (^)(AWSceDescribeCostCategoryDefinitionResponse *response, NSError *error))completionHandler {
    [[self describeCostCategoryDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSceDescribeCostCategoryDefinitionResponse *> * _Nonnull task) {
        AWSceDescribeCostCategoryDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetCostAndUsageResponse *> *)getCostAndUsage:(AWSceGetCostAndUsageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetCostAndUsage"
                   outputClass:[AWSceGetCostAndUsageResponse class]];
}

- (void)getCostAndUsage:(AWSceGetCostAndUsageRequest *)request
     completionHandler:(void (^)(AWSceGetCostAndUsageResponse *response, NSError *error))completionHandler {
    [[self getCostAndUsage:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetCostAndUsageResponse *> * _Nonnull task) {
        AWSceGetCostAndUsageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetCostAndUsageWithResourcesResponse *> *)getCostAndUsageWithResources:(AWSceGetCostAndUsageWithResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetCostAndUsageWithResources"
                   outputClass:[AWSceGetCostAndUsageWithResourcesResponse class]];
}

- (void)getCostAndUsageWithResources:(AWSceGetCostAndUsageWithResourcesRequest *)request
     completionHandler:(void (^)(AWSceGetCostAndUsageWithResourcesResponse *response, NSError *error))completionHandler {
    [[self getCostAndUsageWithResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetCostAndUsageWithResourcesResponse *> * _Nonnull task) {
        AWSceGetCostAndUsageWithResourcesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetCostForecastResponse *> *)getCostForecast:(AWSceGetCostForecastRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetCostForecast"
                   outputClass:[AWSceGetCostForecastResponse class]];
}

- (void)getCostForecast:(AWSceGetCostForecastRequest *)request
     completionHandler:(void (^)(AWSceGetCostForecastResponse *response, NSError *error))completionHandler {
    [[self getCostForecast:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetCostForecastResponse *> * _Nonnull task) {
        AWSceGetCostForecastResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetDimensionValuesResponse *> *)getDimensionValues:(AWSceGetDimensionValuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetDimensionValues"
                   outputClass:[AWSceGetDimensionValuesResponse class]];
}

- (void)getDimensionValues:(AWSceGetDimensionValuesRequest *)request
     completionHandler:(void (^)(AWSceGetDimensionValuesResponse *response, NSError *error))completionHandler {
    [[self getDimensionValues:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetDimensionValuesResponse *> * _Nonnull task) {
        AWSceGetDimensionValuesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetReservationCoverageResponse *> *)getReservationCoverage:(AWSceGetReservationCoverageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetReservationCoverage"
                   outputClass:[AWSceGetReservationCoverageResponse class]];
}

- (void)getReservationCoverage:(AWSceGetReservationCoverageRequest *)request
     completionHandler:(void (^)(AWSceGetReservationCoverageResponse *response, NSError *error))completionHandler {
    [[self getReservationCoverage:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetReservationCoverageResponse *> * _Nonnull task) {
        AWSceGetReservationCoverageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetReservationPurchaseRecommendationResponse *> *)getReservationPurchaseRecommendation:(AWSceGetReservationPurchaseRecommendationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetReservationPurchaseRecommendation"
                   outputClass:[AWSceGetReservationPurchaseRecommendationResponse class]];
}

- (void)getReservationPurchaseRecommendation:(AWSceGetReservationPurchaseRecommendationRequest *)request
     completionHandler:(void (^)(AWSceGetReservationPurchaseRecommendationResponse *response, NSError *error))completionHandler {
    [[self getReservationPurchaseRecommendation:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetReservationPurchaseRecommendationResponse *> * _Nonnull task) {
        AWSceGetReservationPurchaseRecommendationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetReservationUtilizationResponse *> *)getReservationUtilization:(AWSceGetReservationUtilizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetReservationUtilization"
                   outputClass:[AWSceGetReservationUtilizationResponse class]];
}

- (void)getReservationUtilization:(AWSceGetReservationUtilizationRequest *)request
     completionHandler:(void (^)(AWSceGetReservationUtilizationResponse *response, NSError *error))completionHandler {
    [[self getReservationUtilization:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetReservationUtilizationResponse *> * _Nonnull task) {
        AWSceGetReservationUtilizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetRightsizingRecommendationResponse *> *)getRightsizingRecommendation:(AWSceGetRightsizingRecommendationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetRightsizingRecommendation"
                   outputClass:[AWSceGetRightsizingRecommendationResponse class]];
}

- (void)getRightsizingRecommendation:(AWSceGetRightsizingRecommendationRequest *)request
     completionHandler:(void (^)(AWSceGetRightsizingRecommendationResponse *response, NSError *error))completionHandler {
    [[self getRightsizingRecommendation:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetRightsizingRecommendationResponse *> * _Nonnull task) {
        AWSceGetRightsizingRecommendationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetSavingsPlansCoverageResponse *> *)getSavingsPlansCoverage:(AWSceGetSavingsPlansCoverageRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetSavingsPlansCoverage"
                   outputClass:[AWSceGetSavingsPlansCoverageResponse class]];
}

- (void)getSavingsPlansCoverage:(AWSceGetSavingsPlansCoverageRequest *)request
     completionHandler:(void (^)(AWSceGetSavingsPlansCoverageResponse *response, NSError *error))completionHandler {
    [[self getSavingsPlansCoverage:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetSavingsPlansCoverageResponse *> * _Nonnull task) {
        AWSceGetSavingsPlansCoverageResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetSavingsPlansPurchaseRecommendationResponse *> *)getSavingsPlansPurchaseRecommendation:(AWSceGetSavingsPlansPurchaseRecommendationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetSavingsPlansPurchaseRecommendation"
                   outputClass:[AWSceGetSavingsPlansPurchaseRecommendationResponse class]];
}

- (void)getSavingsPlansPurchaseRecommendation:(AWSceGetSavingsPlansPurchaseRecommendationRequest *)request
     completionHandler:(void (^)(AWSceGetSavingsPlansPurchaseRecommendationResponse *response, NSError *error))completionHandler {
    [[self getSavingsPlansPurchaseRecommendation:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetSavingsPlansPurchaseRecommendationResponse *> * _Nonnull task) {
        AWSceGetSavingsPlansPurchaseRecommendationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetSavingsPlansUtilizationResponse *> *)getSavingsPlansUtilization:(AWSceGetSavingsPlansUtilizationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetSavingsPlansUtilization"
                   outputClass:[AWSceGetSavingsPlansUtilizationResponse class]];
}

- (void)getSavingsPlansUtilization:(AWSceGetSavingsPlansUtilizationRequest *)request
     completionHandler:(void (^)(AWSceGetSavingsPlansUtilizationResponse *response, NSError *error))completionHandler {
    [[self getSavingsPlansUtilization:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetSavingsPlansUtilizationResponse *> * _Nonnull task) {
        AWSceGetSavingsPlansUtilizationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetSavingsPlansUtilizationDetailsResponse *> *)getSavingsPlansUtilizationDetails:(AWSceGetSavingsPlansUtilizationDetailsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetSavingsPlansUtilizationDetails"
                   outputClass:[AWSceGetSavingsPlansUtilizationDetailsResponse class]];
}

- (void)getSavingsPlansUtilizationDetails:(AWSceGetSavingsPlansUtilizationDetailsRequest *)request
     completionHandler:(void (^)(AWSceGetSavingsPlansUtilizationDetailsResponse *response, NSError *error))completionHandler {
    [[self getSavingsPlansUtilizationDetails:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetSavingsPlansUtilizationDetailsResponse *> * _Nonnull task) {
        AWSceGetSavingsPlansUtilizationDetailsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetTagsResponse *> *)getTags:(AWSceGetTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetTags"
                   outputClass:[AWSceGetTagsResponse class]];
}

- (void)getTags:(AWSceGetTagsRequest *)request
     completionHandler:(void (^)(AWSceGetTagsResponse *response, NSError *error))completionHandler {
    [[self getTags:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetTagsResponse *> * _Nonnull task) {
        AWSceGetTagsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceGetUsageForecastResponse *> *)getUsageForecast:(AWSceGetUsageForecastRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"GetUsageForecast"
                   outputClass:[AWSceGetUsageForecastResponse class]];
}

- (void)getUsageForecast:(AWSceGetUsageForecastRequest *)request
     completionHandler:(void (^)(AWSceGetUsageForecastResponse *response, NSError *error))completionHandler {
    [[self getUsageForecast:request] continueWithBlock:^id _Nullable(AWSTask<AWSceGetUsageForecastResponse *> * _Nonnull task) {
        AWSceGetUsageForecastResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceListCostCategoryDefinitionsResponse *> *)listCostCategoryDefinitions:(AWSceListCostCategoryDefinitionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"ListCostCategoryDefinitions"
                   outputClass:[AWSceListCostCategoryDefinitionsResponse class]];
}

- (void)listCostCategoryDefinitions:(AWSceListCostCategoryDefinitionsRequest *)request
     completionHandler:(void (^)(AWSceListCostCategoryDefinitionsResponse *response, NSError *error))completionHandler {
    [[self listCostCategoryDefinitions:request] continueWithBlock:^id _Nullable(AWSTask<AWSceListCostCategoryDefinitionsResponse *> * _Nonnull task) {
        AWSceListCostCategoryDefinitionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSceUpdateCostCategoryDefinitionResponse *> *)updateCostCategoryDefinition:(AWSceUpdateCostCategoryDefinitionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSInsightsIndexService"
                 operationName:@"UpdateCostCategoryDefinition"
                   outputClass:[AWSceUpdateCostCategoryDefinitionResponse class]];
}

- (void)updateCostCategoryDefinition:(AWSceUpdateCostCategoryDefinitionRequest *)request
     completionHandler:(void (^)(AWSceUpdateCostCategoryDefinitionResponse *response, NSError *error))completionHandler {
    [[self updateCostCategoryDefinition:request] continueWithBlock:^id _Nullable(AWSTask<AWSceUpdateCostCategoryDefinitionResponse *> * _Nonnull task) {
        AWSceUpdateCostCategoryDefinitionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
