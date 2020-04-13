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

#import "AWSTextractService.h"
#import <AWSCore/AWSNetworking.h>
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
NSString *const AWSTextractSDKVersion = @"2.13.2";


@interface AWSTextractResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSTextractResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"AccessDeniedException" : @(AWSTextractErrorAccessDenied),
                            @"BadDocumentException" : @(AWSTextractErrorBadDocument),
                            @"DocumentTooLargeException" : @(AWSTextractErrorDocumentTooLarge),
                            @"IdempotentParameterMismatchException" : @(AWSTextractErrorIdempotentParameterMismatch),
                            @"InternalServerError" : @(AWSTextractErrorInternalServer),
                            @"InvalidJobIdException" : @(AWSTextractErrorInvalidJobId),
                            @"InvalidParameterException" : @(AWSTextractErrorInvalidParameter),
                            @"InvalidS3ObjectException" : @(AWSTextractErrorInvalidS3Object),
                            @"LimitExceededException" : @(AWSTextractErrorLimitExceeded),
                            @"ProvisionedThroughputExceededException" : @(AWSTextractErrorProvisionedThroughputExceeded),
                            @"ThrottlingException" : @(AWSTextractErrorThrottling),
                            @"UnsupportedDocumentException" : @(AWSTextractErrorUnsupportedDocument),
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

#pragma mark -

@end
