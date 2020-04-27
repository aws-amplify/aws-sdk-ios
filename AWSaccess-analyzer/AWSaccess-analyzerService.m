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

#import "AWSaccess-analyzerService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSaccess-analyzerResources.h"

static NSString *const AWSInfoaccess-analyzer = @"access-analyzer";
NSString *const AWSaccess-analyzerSDKVersion = @"2.13.2";


@interface AWSaccess-analyzerResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSaccess-analyzerResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSaccess-analyzerErrorAccessDenied),
                            @"ConflictException" : @(AWSaccess-analyzerErrorConflict),
                            @"InternalServerException" : @(AWSaccess-analyzerErrorInternalServer),
                            @"ResourceNotFoundException" : @(AWSaccess-analyzerErrorResourceNotFound),
                            @"ServiceQuotaExceededException" : @(AWSaccess-analyzerErrorServiceQuotaExceeded),
                            @"ThrottlingException" : @(AWSaccess-analyzerErrorThrottling),
                            @"ValidationException" : @(AWSaccess-analyzerErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSaccess-analyzerErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSaccess-analyzerErrorDomain
                                                 code:AWSaccess-analyzerErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSaccess-analyzerErrorDomain
                                     code:AWSaccess-analyzerErrorUnknown
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

@interface AWSaccess-analyzerRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSaccess-analyzerRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSaccess-analyzer()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSaccess-analyzer

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSaccess-analyzerSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSaccess-analyzer versions need to match. Check your SDK installation. AWSCore: %@ AWSaccess-analyzer: %@", AWSiOSSDKVersion, AWSaccess-analyzerSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultaccess-analyzer {
    static AWSaccess-analyzer *_defaultaccess-analyzer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoaccess-analyzer];
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
        _defaultaccess-analyzer = [[AWSaccess-analyzer alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultaccess-analyzer;
}

+ (void)registeraccess-analyzerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSaccess-analyzer alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)access-analyzerForKey:(NSString *)key {
    @synchronized(self) {
        AWSaccess-analyzer *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoaccess-analyzer
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSaccess-analyzer registeraccess-analyzerWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeaccess-analyzerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultaccess-analyzer` or `+ access-analyzerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceaccess-analyzer
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceaccess-analyzer];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSaccess-analyzerRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSaccess-analyzerResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSaccess-analyzerResponseSerializer alloc] initWithJSONDefinition:[[AWSaccess-analyzerResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSaccess-analyzerCreateAnalyzerResponse *> *)createAnalyzer:(AWSaccess-analyzerCreateAnalyzerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/analyzer"
                  targetPrefix:@""
                 operationName:@"CreateAnalyzer"
                   outputClass:[AWSaccess-analyzerCreateAnalyzerResponse class]];
}

- (void)createAnalyzer:(AWSaccess-analyzerCreateAnalyzerRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerCreateAnalyzerResponse *response, NSError *error))completionHandler {
    [[self createAnalyzer:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerCreateAnalyzerResponse *> * _Nonnull task) {
        AWSaccess-analyzerCreateAnalyzerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createArchiveRule:(AWSaccess-analyzerCreateArchiveRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/analyzer/{analyzerName}/archive-rule"
                  targetPrefix:@""
                 operationName:@"CreateArchiveRule"
                   outputClass:nil];
}

- (void)createArchiveRule:(AWSaccess-analyzerCreateArchiveRuleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createArchiveRule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteAnalyzer:(AWSaccess-analyzerDeleteAnalyzerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/analyzer/{analyzerName}"
                  targetPrefix:@""
                 operationName:@"DeleteAnalyzer"
                   outputClass:nil];
}

- (void)deleteAnalyzer:(AWSaccess-analyzerDeleteAnalyzerRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteAnalyzer:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteArchiveRule:(AWSaccess-analyzerDeleteArchiveRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/analyzer/{analyzerName}/archive-rule/{ruleName}"
                  targetPrefix:@""
                 operationName:@"DeleteArchiveRule"
                   outputClass:nil];
}

- (void)deleteArchiveRule:(AWSaccess-analyzerDeleteArchiveRuleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteArchiveRule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerGetAnalyzedResourceResponse *> *)getAnalyzedResource:(AWSaccess-analyzerGetAnalyzedResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/analyzed-resource"
                  targetPrefix:@""
                 operationName:@"GetAnalyzedResource"
                   outputClass:[AWSaccess-analyzerGetAnalyzedResourceResponse class]];
}

- (void)getAnalyzedResource:(AWSaccess-analyzerGetAnalyzedResourceRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerGetAnalyzedResourceResponse *response, NSError *error))completionHandler {
    [[self getAnalyzedResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerGetAnalyzedResourceResponse *> * _Nonnull task) {
        AWSaccess-analyzerGetAnalyzedResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerGetAnalyzerResponse *> *)getAnalyzer:(AWSaccess-analyzerGetAnalyzerRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/analyzer/{analyzerName}"
                  targetPrefix:@""
                 operationName:@"GetAnalyzer"
                   outputClass:[AWSaccess-analyzerGetAnalyzerResponse class]];
}

- (void)getAnalyzer:(AWSaccess-analyzerGetAnalyzerRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerGetAnalyzerResponse *response, NSError *error))completionHandler {
    [[self getAnalyzer:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerGetAnalyzerResponse *> * _Nonnull task) {
        AWSaccess-analyzerGetAnalyzerResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerGetArchiveRuleResponse *> *)getArchiveRule:(AWSaccess-analyzerGetArchiveRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/analyzer/{analyzerName}/archive-rule/{ruleName}"
                  targetPrefix:@""
                 operationName:@"GetArchiveRule"
                   outputClass:[AWSaccess-analyzerGetArchiveRuleResponse class]];
}

- (void)getArchiveRule:(AWSaccess-analyzerGetArchiveRuleRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerGetArchiveRuleResponse *response, NSError *error))completionHandler {
    [[self getArchiveRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerGetArchiveRuleResponse *> * _Nonnull task) {
        AWSaccess-analyzerGetArchiveRuleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerGetFindingResponse *> *)getFinding:(AWSaccess-analyzerGetFindingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/finding/{id}"
                  targetPrefix:@""
                 operationName:@"GetFinding"
                   outputClass:[AWSaccess-analyzerGetFindingResponse class]];
}

- (void)getFinding:(AWSaccess-analyzerGetFindingRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerGetFindingResponse *response, NSError *error))completionHandler {
    [[self getFinding:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerGetFindingResponse *> * _Nonnull task) {
        AWSaccess-analyzerGetFindingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerListAnalyzedResourcesResponse *> *)listAnalyzedResources:(AWSaccess-analyzerListAnalyzedResourcesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/analyzed-resource"
                  targetPrefix:@""
                 operationName:@"ListAnalyzedResources"
                   outputClass:[AWSaccess-analyzerListAnalyzedResourcesResponse class]];
}

- (void)listAnalyzedResources:(AWSaccess-analyzerListAnalyzedResourcesRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerListAnalyzedResourcesResponse *response, NSError *error))completionHandler {
    [[self listAnalyzedResources:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerListAnalyzedResourcesResponse *> * _Nonnull task) {
        AWSaccess-analyzerListAnalyzedResourcesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerListAnalyzersResponse *> *)listAnalyzers:(AWSaccess-analyzerListAnalyzersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/analyzer"
                  targetPrefix:@""
                 operationName:@"ListAnalyzers"
                   outputClass:[AWSaccess-analyzerListAnalyzersResponse class]];
}

- (void)listAnalyzers:(AWSaccess-analyzerListAnalyzersRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerListAnalyzersResponse *response, NSError *error))completionHandler {
    [[self listAnalyzers:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerListAnalyzersResponse *> * _Nonnull task) {
        AWSaccess-analyzerListAnalyzersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerListArchiveRulesResponse *> *)listArchiveRules:(AWSaccess-analyzerListArchiveRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/analyzer/{analyzerName}/archive-rule"
                  targetPrefix:@""
                 operationName:@"ListArchiveRules"
                   outputClass:[AWSaccess-analyzerListArchiveRulesResponse class]];
}

- (void)listArchiveRules:(AWSaccess-analyzerListArchiveRulesRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerListArchiveRulesResponse *response, NSError *error))completionHandler {
    [[self listArchiveRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerListArchiveRulesResponse *> * _Nonnull task) {
        AWSaccess-analyzerListArchiveRulesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerListFindingsResponse *> *)listFindings:(AWSaccess-analyzerListFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/finding"
                  targetPrefix:@""
                 operationName:@"ListFindings"
                   outputClass:[AWSaccess-analyzerListFindingsResponse class]];
}

- (void)listFindings:(AWSaccess-analyzerListFindingsRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerListFindingsResponse *response, NSError *error))completionHandler {
    [[self listFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerListFindingsResponse *> * _Nonnull task) {
        AWSaccess-analyzerListFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerListTagsForResourceResponse *> *)listTagsForResource:(AWSaccess-analyzerListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSaccess-analyzerListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSaccess-analyzerListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerListTagsForResourceResponse *> * _Nonnull task) {
        AWSaccess-analyzerListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)startResourceScan:(AWSaccess-analyzerStartResourceScanRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/resource/scan"
                  targetPrefix:@""
                 operationName:@"StartResourceScan"
                   outputClass:nil];
}

- (void)startResourceScan:(AWSaccess-analyzerStartResourceScanRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self startResourceScan:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerTagResourceResponse *> *)tagResource:(AWSaccess-analyzerTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSaccess-analyzerTagResourceResponse class]];
}

- (void)tagResource:(AWSaccess-analyzerTagResourceRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerTagResourceResponse *> * _Nonnull task) {
        AWSaccess-analyzerTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSaccess-analyzerUntagResourceResponse *> *)untagResource:(AWSaccess-analyzerUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSaccess-analyzerUntagResourceResponse class]];
}

- (void)untagResource:(AWSaccess-analyzerUntagResourceRequest *)request
     completionHandler:(void (^)(AWSaccess-analyzerUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSaccess-analyzerUntagResourceResponse *> * _Nonnull task) {
        AWSaccess-analyzerUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)updateArchiveRule:(AWSaccess-analyzerUpdateArchiveRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/analyzer/{analyzerName}/archive-rule/{ruleName}"
                  targetPrefix:@""
                 operationName:@"UpdateArchiveRule"
                   outputClass:nil];
}

- (void)updateArchiveRule:(AWSaccess-analyzerUpdateArchiveRuleRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateArchiveRule:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)updateFindings:(AWSaccess-analyzerUpdateFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/finding"
                  targetPrefix:@""
                 operationName:@"UpdateFindings"
                   outputClass:nil];
}

- (void)updateFindings:(AWSaccess-analyzerUpdateFindingsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self updateFindings:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

#pragma mark -

@end
