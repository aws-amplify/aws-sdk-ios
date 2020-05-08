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

#import "AWSResourceGroupsTaggingAPIService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSResourceGroupsTaggingAPIResources.h"

static NSString *const AWSInfoResourceGroupsTaggingAPI = @"ResourceGroupsTaggingAPI";
NSString *const AWSResourceGroupsTaggingAPISDKVersion = @"2.13.3";


@interface AWSResourceGroupsTaggingAPIResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSResourceGroupsTaggingAPIResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConcurrentModificationException" : @(AWSResourceGroupsTaggingAPIErrorConcurrentModification),
                            @"ConstraintViolationException" : @(AWSResourceGroupsTaggingAPIErrorConstraintViolation),
                            @"InternalServiceException" : @(AWSResourceGroupsTaggingAPIErrorInternalService),
                            @"InvalidParameterException" : @(AWSResourceGroupsTaggingAPIErrorInvalidParameter),
                            @"PaginationTokenExpiredException" : @(AWSResourceGroupsTaggingAPIErrorPaginationTokenExpired),
                            @"ThrottledException" : @(AWSResourceGroupsTaggingAPIErrorThrottled),
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
	                *error = [NSError errorWithDomain:AWSResourceGroupsTaggingAPIErrorDomain
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
        *error = [NSError errorWithDomain:AWSResourceGroupsTaggingAPIErrorDomain
                                     code:AWSResourceGroupsTaggingAPIErrorUnknown
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

@interface AWSResourceGroupsTaggingAPIRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSResourceGroupsTaggingAPIRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSResourceGroupsTaggingAPI()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSResourceGroupsTaggingAPI

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSResourceGroupsTaggingAPISDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSResourceGroupsTaggingAPI versions need to match. Check your SDK installation. AWSCore: %@ AWSResourceGroupsTaggingAPI: %@", AWSiOSSDKVersion, AWSResourceGroupsTaggingAPISDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultResourceGroupsTaggingAPI {
    static AWSResourceGroupsTaggingAPI *_defaultResourceGroupsTaggingAPI = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoResourceGroupsTaggingAPI];
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
        _defaultResourceGroupsTaggingAPI = [[AWSResourceGroupsTaggingAPI alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultResourceGroupsTaggingAPI;
}

+ (void)registerResourceGroupsTaggingAPIWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSResourceGroupsTaggingAPI alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ResourceGroupsTaggingAPIForKey:(NSString *)key {
    @synchronized(self) {
        AWSResourceGroupsTaggingAPI *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoResourceGroupsTaggingAPI
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSResourceGroupsTaggingAPI registerResourceGroupsTaggingAPIWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeResourceGroupsTaggingAPIForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultResourceGroupsTaggingAPI` or `+ ResourceGroupsTaggingAPIForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceResourceGroupsTaggingAPI
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceResourceGroupsTaggingAPI];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSResourceGroupsTaggingAPIRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSResourceGroupsTaggingAPIResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSResourceGroupsTaggingAPIResponseSerializer alloc] initWithJSONDefinition:[[AWSResourceGroupsTaggingAPIResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSResourceGroupsTaggingAPIDescribeReportCreationOutput *> *)describeReportCreation:(AWSResourceGroupsTaggingAPIDescribeReportCreationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ResourceGroupsTaggingAPI_20170126"
                 operationName:@"DescribeReportCreation"
                   outputClass:[AWSResourceGroupsTaggingAPIDescribeReportCreationOutput class]];
}

- (void)describeReportCreation:(AWSResourceGroupsTaggingAPIDescribeReportCreationInput *)request
     completionHandler:(void (^)(AWSResourceGroupsTaggingAPIDescribeReportCreationOutput *response, NSError *error))completionHandler {
    [[self describeReportCreation:request] continueWithBlock:^id _Nullable(AWSTask<AWSResourceGroupsTaggingAPIDescribeReportCreationOutput *> * _Nonnull task) {
        AWSResourceGroupsTaggingAPIDescribeReportCreationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput *> *)getComplianceSummary:(AWSResourceGroupsTaggingAPIGetComplianceSummaryInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ResourceGroupsTaggingAPI_20170126"
                 operationName:@"GetComplianceSummary"
                   outputClass:[AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput class]];
}

- (void)getComplianceSummary:(AWSResourceGroupsTaggingAPIGetComplianceSummaryInput *)request
     completionHandler:(void (^)(AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput *response, NSError *error))completionHandler {
    [[self getComplianceSummary:request] continueWithBlock:^id _Nullable(AWSTask<AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput *> * _Nonnull task) {
        AWSResourceGroupsTaggingAPIGetComplianceSummaryOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSResourceGroupsTaggingAPIGetResourcesOutput *> *)getResources:(AWSResourceGroupsTaggingAPIGetResourcesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ResourceGroupsTaggingAPI_20170126"
                 operationName:@"GetResources"
                   outputClass:[AWSResourceGroupsTaggingAPIGetResourcesOutput class]];
}

- (void)getResources:(AWSResourceGroupsTaggingAPIGetResourcesInput *)request
     completionHandler:(void (^)(AWSResourceGroupsTaggingAPIGetResourcesOutput *response, NSError *error))completionHandler {
    [[self getResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSResourceGroupsTaggingAPIGetResourcesOutput *> * _Nonnull task) {
        AWSResourceGroupsTaggingAPIGetResourcesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSResourceGroupsTaggingAPIGetTagKeysOutput *> *)getTagKeys:(AWSResourceGroupsTaggingAPIGetTagKeysInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ResourceGroupsTaggingAPI_20170126"
                 operationName:@"GetTagKeys"
                   outputClass:[AWSResourceGroupsTaggingAPIGetTagKeysOutput class]];
}

- (void)getTagKeys:(AWSResourceGroupsTaggingAPIGetTagKeysInput *)request
     completionHandler:(void (^)(AWSResourceGroupsTaggingAPIGetTagKeysOutput *response, NSError *error))completionHandler {
    [[self getTagKeys:request] continueWithBlock:^id _Nullable(AWSTask<AWSResourceGroupsTaggingAPIGetTagKeysOutput *> * _Nonnull task) {
        AWSResourceGroupsTaggingAPIGetTagKeysOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSResourceGroupsTaggingAPIGetTagValuesOutput *> *)getTagValues:(AWSResourceGroupsTaggingAPIGetTagValuesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ResourceGroupsTaggingAPI_20170126"
                 operationName:@"GetTagValues"
                   outputClass:[AWSResourceGroupsTaggingAPIGetTagValuesOutput class]];
}

- (void)getTagValues:(AWSResourceGroupsTaggingAPIGetTagValuesInput *)request
     completionHandler:(void (^)(AWSResourceGroupsTaggingAPIGetTagValuesOutput *response, NSError *error))completionHandler {
    [[self getTagValues:request] continueWithBlock:^id _Nullable(AWSTask<AWSResourceGroupsTaggingAPIGetTagValuesOutput *> * _Nonnull task) {
        AWSResourceGroupsTaggingAPIGetTagValuesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSResourceGroupsTaggingAPIStartReportCreationOutput *> *)startReportCreation:(AWSResourceGroupsTaggingAPIStartReportCreationInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ResourceGroupsTaggingAPI_20170126"
                 operationName:@"StartReportCreation"
                   outputClass:[AWSResourceGroupsTaggingAPIStartReportCreationOutput class]];
}

- (void)startReportCreation:(AWSResourceGroupsTaggingAPIStartReportCreationInput *)request
     completionHandler:(void (^)(AWSResourceGroupsTaggingAPIStartReportCreationOutput *response, NSError *error))completionHandler {
    [[self startReportCreation:request] continueWithBlock:^id _Nullable(AWSTask<AWSResourceGroupsTaggingAPIStartReportCreationOutput *> * _Nonnull task) {
        AWSResourceGroupsTaggingAPIStartReportCreationOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSResourceGroupsTaggingAPITagResourcesOutput *> *)tagResources:(AWSResourceGroupsTaggingAPITagResourcesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ResourceGroupsTaggingAPI_20170126"
                 operationName:@"TagResources"
                   outputClass:[AWSResourceGroupsTaggingAPITagResourcesOutput class]];
}

- (void)tagResources:(AWSResourceGroupsTaggingAPITagResourcesInput *)request
     completionHandler:(void (^)(AWSResourceGroupsTaggingAPITagResourcesOutput *response, NSError *error))completionHandler {
    [[self tagResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSResourceGroupsTaggingAPITagResourcesOutput *> * _Nonnull task) {
        AWSResourceGroupsTaggingAPITagResourcesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSResourceGroupsTaggingAPIUntagResourcesOutput *> *)untagResources:(AWSResourceGroupsTaggingAPIUntagResourcesInput *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"ResourceGroupsTaggingAPI_20170126"
                 operationName:@"UntagResources"
                   outputClass:[AWSResourceGroupsTaggingAPIUntagResourcesOutput class]];
}

- (void)untagResources:(AWSResourceGroupsTaggingAPIUntagResourcesInput *)request
     completionHandler:(void (^)(AWSResourceGroupsTaggingAPIUntagResourcesOutput *response, NSError *error))completionHandler {
    [[self untagResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSResourceGroupsTaggingAPIUntagResourcesOutput *> * _Nonnull task) {
        AWSResourceGroupsTaggingAPIUntagResourcesOutput *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
