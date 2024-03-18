//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSTextractService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSTextractResources.h"

static NSString *const AWSInfoTextract = @"Textract";
NSString *const AWSTextractSDKVersion = @"2.34.1";


@interface AWSTextractResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSTextractResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSTextractErrorAccessDenied),
                            @"BadDocumentException" : @(AWSTextractErrorBadDocument),
                            @"ConflictException" : @(AWSTextractErrorConflict),
                            @"DocumentTooLargeException" : @(AWSTextractErrorDocumentTooLarge),
                            @"HumanLoopQuotaExceededException" : @(AWSTextractErrorHumanLoopQuotaExceeded),
                            @"IdempotentParameterMismatchException" : @(AWSTextractErrorIdempotentParameterMismatch),
                            @"InternalServerError" : @(AWSTextractErrorInternalServer),
                            @"InvalidJobIdException" : @(AWSTextractErrorInvalidJobId),
                            @"InvalidKMSKeyException" : @(AWSTextractErrorInvalidKMSKey),
                            @"InvalidParameterException" : @(AWSTextractErrorInvalidParameter),
                            @"InvalidS3ObjectException" : @(AWSTextractErrorInvalidS3Object),
                            @"LimitExceededException" : @(AWSTextractErrorLimitExceeded),
                            @"ProvisionedThroughputExceededException" : @(AWSTextractErrorProvisionedThroughputExceeded),
                            @"ResourceNotFoundException" : @(AWSTextractErrorResourceNotFound),
                            @"ServiceQuotaExceededException" : @(AWSTextractErrorServiceQuotaExceeded),
                            @"ThrottlingException" : @(AWSTextractErrorThrottling),
                            @"UnsupportedDocumentException" : @(AWSTextractErrorUnsupportedDocument),
                            @"ValidationException" : @(AWSTextractErrorValidation),
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
	                *error = [NSError errorWithDomain:AWSTextractErrorDomain
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
        *error = [NSError errorWithDomain:AWSTextractErrorDomain
                                     code:AWSTextractErrorUnknown
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

@interface AWSTextractRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSTextractRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSTextract()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSTextract

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSTextractSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSTextract versions need to match. Check your SDK installation. AWSCore: %@ AWSTextract: %@", AWSiOSSDKVersion, AWSTextractSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultTextract {
    static AWSTextract *_defaultTextract = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoTextract];
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
        _defaultTextract = [[AWSTextract alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultTextract;
}

+ (void)registerTextractWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSTextract alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)TextractForKey:(NSString *)key {
    @synchronized(self) {
        AWSTextract *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoTextract
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSTextract registerTextractWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeTextractForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultTextract` or `+ TextractForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceTextract
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceTextract];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSTextractRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSTextractResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSTextractResponseSerializer alloc] initWithJSONDefinition:[[AWSTextractResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSTextractAnalyzeDocumentResponse *> *)analyzeDocument:(AWSTextractAnalyzeDocumentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"AnalyzeDocument"
                   outputClass:[AWSTextractAnalyzeDocumentResponse class]];
}

- (void)analyzeDocument:(AWSTextractAnalyzeDocumentRequest *)request
     completionHandler:(void (^)(AWSTextractAnalyzeDocumentResponse *response, NSError *error))completionHandler {
    [[self analyzeDocument:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractAnalyzeDocumentResponse *> * _Nonnull task) {
        AWSTextractAnalyzeDocumentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractAnalyzeExpenseResponse *> *)analyzeExpense:(AWSTextractAnalyzeExpenseRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"AnalyzeExpense"
                   outputClass:[AWSTextractAnalyzeExpenseResponse class]];
}

- (void)analyzeExpense:(AWSTextractAnalyzeExpenseRequest *)request
     completionHandler:(void (^)(AWSTextractAnalyzeExpenseResponse *response, NSError *error))completionHandler {
    [[self analyzeExpense:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractAnalyzeExpenseResponse *> * _Nonnull task) {
        AWSTextractAnalyzeExpenseResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractAnalyzeIDResponse *> *)analyzeID:(AWSTextractAnalyzeIDRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"AnalyzeID"
                   outputClass:[AWSTextractAnalyzeIDResponse class]];
}

- (void)analyzeID:(AWSTextractAnalyzeIDRequest *)request
     completionHandler:(void (^)(AWSTextractAnalyzeIDResponse *response, NSError *error))completionHandler {
    [[self analyzeID:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractAnalyzeIDResponse *> * _Nonnull task) {
        AWSTextractAnalyzeIDResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractCreateAdapterResponse *> *)createAdapter:(AWSTextractCreateAdapterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"CreateAdapter"
                   outputClass:[AWSTextractCreateAdapterResponse class]];
}

- (void)createAdapter:(AWSTextractCreateAdapterRequest *)request
     completionHandler:(void (^)(AWSTextractCreateAdapterResponse *response, NSError *error))completionHandler {
    [[self createAdapter:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractCreateAdapterResponse *> * _Nonnull task) {
        AWSTextractCreateAdapterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractCreateAdapterVersionResponse *> *)createAdapterVersion:(AWSTextractCreateAdapterVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"CreateAdapterVersion"
                   outputClass:[AWSTextractCreateAdapterVersionResponse class]];
}

- (void)createAdapterVersion:(AWSTextractCreateAdapterVersionRequest *)request
     completionHandler:(void (^)(AWSTextractCreateAdapterVersionResponse *response, NSError *error))completionHandler {
    [[self createAdapterVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractCreateAdapterVersionResponse *> * _Nonnull task) {
        AWSTextractCreateAdapterVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractDeleteAdapterResponse *> *)deleteAdapter:(AWSTextractDeleteAdapterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"DeleteAdapter"
                   outputClass:[AWSTextractDeleteAdapterResponse class]];
}

- (void)deleteAdapter:(AWSTextractDeleteAdapterRequest *)request
     completionHandler:(void (^)(AWSTextractDeleteAdapterResponse *response, NSError *error))completionHandler {
    [[self deleteAdapter:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractDeleteAdapterResponse *> * _Nonnull task) {
        AWSTextractDeleteAdapterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractDeleteAdapterVersionResponse *> *)deleteAdapterVersion:(AWSTextractDeleteAdapterVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"DeleteAdapterVersion"
                   outputClass:[AWSTextractDeleteAdapterVersionResponse class]];
}

- (void)deleteAdapterVersion:(AWSTextractDeleteAdapterVersionRequest *)request
     completionHandler:(void (^)(AWSTextractDeleteAdapterVersionResponse *response, NSError *error))completionHandler {
    [[self deleteAdapterVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractDeleteAdapterVersionResponse *> * _Nonnull task) {
        AWSTextractDeleteAdapterVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractDetectDocumentTextResponse *> *)detectDocumentText:(AWSTextractDetectDocumentTextRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"DetectDocumentText"
                   outputClass:[AWSTextractDetectDocumentTextResponse class]];
}

- (void)detectDocumentText:(AWSTextractDetectDocumentTextRequest *)request
     completionHandler:(void (^)(AWSTextractDetectDocumentTextResponse *response, NSError *error))completionHandler {
    [[self detectDocumentText:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractDetectDocumentTextResponse *> * _Nonnull task) {
        AWSTextractDetectDocumentTextResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractGetAdapterResponse *> *)getAdapter:(AWSTextractGetAdapterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"GetAdapter"
                   outputClass:[AWSTextractGetAdapterResponse class]];
}

- (void)getAdapter:(AWSTextractGetAdapterRequest *)request
     completionHandler:(void (^)(AWSTextractGetAdapterResponse *response, NSError *error))completionHandler {
    [[self getAdapter:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractGetAdapterResponse *> * _Nonnull task) {
        AWSTextractGetAdapterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractGetAdapterVersionResponse *> *)getAdapterVersion:(AWSTextractGetAdapterVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"GetAdapterVersion"
                   outputClass:[AWSTextractGetAdapterVersionResponse class]];
}

- (void)getAdapterVersion:(AWSTextractGetAdapterVersionRequest *)request
     completionHandler:(void (^)(AWSTextractGetAdapterVersionResponse *response, NSError *error))completionHandler {
    [[self getAdapterVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractGetAdapterVersionResponse *> * _Nonnull task) {
        AWSTextractGetAdapterVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractGetDocumentAnalysisResponse *> *)getDocumentAnalysis:(AWSTextractGetDocumentAnalysisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"GetDocumentAnalysis"
                   outputClass:[AWSTextractGetDocumentAnalysisResponse class]];
}

- (void)getDocumentAnalysis:(AWSTextractGetDocumentAnalysisRequest *)request
     completionHandler:(void (^)(AWSTextractGetDocumentAnalysisResponse *response, NSError *error))completionHandler {
    [[self getDocumentAnalysis:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractGetDocumentAnalysisResponse *> * _Nonnull task) {
        AWSTextractGetDocumentAnalysisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractGetDocumentTextDetectionResponse *> *)getDocumentTextDetection:(AWSTextractGetDocumentTextDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"GetDocumentTextDetection"
                   outputClass:[AWSTextractGetDocumentTextDetectionResponse class]];
}

- (void)getDocumentTextDetection:(AWSTextractGetDocumentTextDetectionRequest *)request
     completionHandler:(void (^)(AWSTextractGetDocumentTextDetectionResponse *response, NSError *error))completionHandler {
    [[self getDocumentTextDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractGetDocumentTextDetectionResponse *> * _Nonnull task) {
        AWSTextractGetDocumentTextDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractGetExpenseAnalysisResponse *> *)getExpenseAnalysis:(AWSTextractGetExpenseAnalysisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"GetExpenseAnalysis"
                   outputClass:[AWSTextractGetExpenseAnalysisResponse class]];
}

- (void)getExpenseAnalysis:(AWSTextractGetExpenseAnalysisRequest *)request
     completionHandler:(void (^)(AWSTextractGetExpenseAnalysisResponse *response, NSError *error))completionHandler {
    [[self getExpenseAnalysis:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractGetExpenseAnalysisResponse *> * _Nonnull task) {
        AWSTextractGetExpenseAnalysisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractGetLendingAnalysisResponse *> *)getLendingAnalysis:(AWSTextractGetLendingAnalysisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"GetLendingAnalysis"
                   outputClass:[AWSTextractGetLendingAnalysisResponse class]];
}

- (void)getLendingAnalysis:(AWSTextractGetLendingAnalysisRequest *)request
     completionHandler:(void (^)(AWSTextractGetLendingAnalysisResponse *response, NSError *error))completionHandler {
    [[self getLendingAnalysis:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractGetLendingAnalysisResponse *> * _Nonnull task) {
        AWSTextractGetLendingAnalysisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractGetLendingAnalysisSummaryResponse *> *)getLendingAnalysisSummary:(AWSTextractGetLendingAnalysisSummaryRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"GetLendingAnalysisSummary"
                   outputClass:[AWSTextractGetLendingAnalysisSummaryResponse class]];
}

- (void)getLendingAnalysisSummary:(AWSTextractGetLendingAnalysisSummaryRequest *)request
     completionHandler:(void (^)(AWSTextractGetLendingAnalysisSummaryResponse *response, NSError *error))completionHandler {
    [[self getLendingAnalysisSummary:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractGetLendingAnalysisSummaryResponse *> * _Nonnull task) {
        AWSTextractGetLendingAnalysisSummaryResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractListAdapterVersionsResponse *> *)listAdapterVersions:(AWSTextractListAdapterVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"ListAdapterVersions"
                   outputClass:[AWSTextractListAdapterVersionsResponse class]];
}

- (void)listAdapterVersions:(AWSTextractListAdapterVersionsRequest *)request
     completionHandler:(void (^)(AWSTextractListAdapterVersionsResponse *response, NSError *error))completionHandler {
    [[self listAdapterVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractListAdapterVersionsResponse *> * _Nonnull task) {
        AWSTextractListAdapterVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractListAdaptersResponse *> *)listAdapters:(AWSTextractListAdaptersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"ListAdapters"
                   outputClass:[AWSTextractListAdaptersResponse class]];
}

- (void)listAdapters:(AWSTextractListAdaptersRequest *)request
     completionHandler:(void (^)(AWSTextractListAdaptersResponse *response, NSError *error))completionHandler {
    [[self listAdapters:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractListAdaptersResponse *> * _Nonnull task) {
        AWSTextractListAdaptersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractListTagsForResourceResponse *> *)listTagsForResource:(AWSTextractListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSTextractListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSTextractListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSTextractListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractListTagsForResourceResponse *> * _Nonnull task) {
        AWSTextractListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractStartDocumentAnalysisResponse *> *)startDocumentAnalysis:(AWSTextractStartDocumentAnalysisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"StartDocumentAnalysis"
                   outputClass:[AWSTextractStartDocumentAnalysisResponse class]];
}

- (void)startDocumentAnalysis:(AWSTextractStartDocumentAnalysisRequest *)request
     completionHandler:(void (^)(AWSTextractStartDocumentAnalysisResponse *response, NSError *error))completionHandler {
    [[self startDocumentAnalysis:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractStartDocumentAnalysisResponse *> * _Nonnull task) {
        AWSTextractStartDocumentAnalysisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractStartDocumentTextDetectionResponse *> *)startDocumentTextDetection:(AWSTextractStartDocumentTextDetectionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"StartDocumentTextDetection"
                   outputClass:[AWSTextractStartDocumentTextDetectionResponse class]];
}

- (void)startDocumentTextDetection:(AWSTextractStartDocumentTextDetectionRequest *)request
     completionHandler:(void (^)(AWSTextractStartDocumentTextDetectionResponse *response, NSError *error))completionHandler {
    [[self startDocumentTextDetection:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractStartDocumentTextDetectionResponse *> * _Nonnull task) {
        AWSTextractStartDocumentTextDetectionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractStartExpenseAnalysisResponse *> *)startExpenseAnalysis:(AWSTextractStartExpenseAnalysisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"StartExpenseAnalysis"
                   outputClass:[AWSTextractStartExpenseAnalysisResponse class]];
}

- (void)startExpenseAnalysis:(AWSTextractStartExpenseAnalysisRequest *)request
     completionHandler:(void (^)(AWSTextractStartExpenseAnalysisResponse *response, NSError *error))completionHandler {
    [[self startExpenseAnalysis:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractStartExpenseAnalysisResponse *> * _Nonnull task) {
        AWSTextractStartExpenseAnalysisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractStartLendingAnalysisResponse *> *)startLendingAnalysis:(AWSTextractStartLendingAnalysisRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"StartLendingAnalysis"
                   outputClass:[AWSTextractStartLendingAnalysisResponse class]];
}

- (void)startLendingAnalysis:(AWSTextractStartLendingAnalysisRequest *)request
     completionHandler:(void (^)(AWSTextractStartLendingAnalysisResponse *response, NSError *error))completionHandler {
    [[self startLendingAnalysis:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractStartLendingAnalysisResponse *> * _Nonnull task) {
        AWSTextractStartLendingAnalysisResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractTagResourceResponse *> *)tagResource:(AWSTextractTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"TagResource"
                   outputClass:[AWSTextractTagResourceResponse class]];
}

- (void)tagResource:(AWSTextractTagResourceRequest *)request
     completionHandler:(void (^)(AWSTextractTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractTagResourceResponse *> * _Nonnull task) {
        AWSTextractTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractUntagResourceResponse *> *)untagResource:(AWSTextractUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"UntagResource"
                   outputClass:[AWSTextractUntagResourceResponse class]];
}

- (void)untagResource:(AWSTextractUntagResourceRequest *)request
     completionHandler:(void (^)(AWSTextractUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractUntagResourceResponse *> * _Nonnull task) {
        AWSTextractUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSTextractUpdateAdapterResponse *> *)updateAdapter:(AWSTextractUpdateAdapterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"Textract"
                 operationName:@"UpdateAdapter"
                   outputClass:[AWSTextractUpdateAdapterResponse class]];
}

- (void)updateAdapter:(AWSTextractUpdateAdapterRequest *)request
     completionHandler:(void (^)(AWSTextractUpdateAdapterResponse *response, NSError *error))completionHandler {
    [[self updateAdapter:request] continueWithBlock:^id _Nullable(AWSTask<AWSTextractUpdateAdapterResponse *> * _Nonnull task) {
        AWSTextractUpdateAdapterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
