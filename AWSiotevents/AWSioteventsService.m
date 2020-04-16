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

#import "AWSioteventsService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSioteventsResources.h"

static NSString *const AWSInfoiotevents = @"iotevents";
NSString *const AWSioteventsSDKVersion = @"2.13.2";


@interface AWSioteventsResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSioteventsResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"InternalFailureException" : @(AWSioteventsErrorInternalFailure),
                            @"InvalidRequestException" : @(AWSioteventsErrorInvalidRequest),
                            @"LimitExceededException" : @(AWSioteventsErrorLimitExceeded),
                            @"ResourceAlreadyExistsException" : @(AWSioteventsErrorResourceAlreadyExists),
                            @"ResourceInUseException" : @(AWSioteventsErrorResourceInUse),
                            @"ResourceNotFoundException" : @(AWSioteventsErrorResourceNotFound),
                            @"ServiceUnavailableException" : @(AWSioteventsErrorServiceUnavailable),
                            @"ThrottlingException" : @(AWSioteventsErrorThrottling),
                            @"UnsupportedOperationException" : @(AWSioteventsErrorUnsupportedOperation),
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
                    *error = [NSError errorWithDomain:AWSioteventsErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSioteventsErrorDomain
                                                 code:AWSioteventsErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSioteventsErrorDomain
                                     code:AWSioteventsErrorUnknown
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

@interface AWSioteventsRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSioteventsRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSiotevents()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSiotevents

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSioteventsSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSiotevents versions need to match. Check your SDK installation. AWSCore: %@ AWSiotevents: %@", AWSiOSSDKVersion, AWSioteventsSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultiotevents {
    static AWSiotevents *_defaultiotevents = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoiotevents];
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
        _defaultiotevents = [[AWSiotevents alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultiotevents;
}

+ (void)registerioteventsWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSiotevents alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)ioteventsForKey:(NSString *)key {
    @synchronized(self) {
        AWSiotevents *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoiotevents
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSiotevents registerioteventsWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeioteventsForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultiotevents` or `+ ioteventsForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceiotevents
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceiotevents];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSioteventsRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSioteventsResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSioteventsResponseSerializer alloc] initWithJSONDefinition:[[AWSioteventsResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSioteventsCreateDetectorModelResponse *> *)createDetectorModel:(AWSioteventsCreateDetectorModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector-models"
                  targetPrefix:@""
                 operationName:@"CreateDetectorModel"
                   outputClass:[AWSioteventsCreateDetectorModelResponse class]];
}

- (void)createDetectorModel:(AWSioteventsCreateDetectorModelRequest *)request
     completionHandler:(void (^)(AWSioteventsCreateDetectorModelResponse *response, NSError *error))completionHandler {
    [[self createDetectorModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsCreateDetectorModelResponse *> * _Nonnull task) {
        AWSioteventsCreateDetectorModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsCreateInputResponse *> *)createInput:(AWSioteventsCreateInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/inputs"
                  targetPrefix:@""
                 operationName:@"CreateInput"
                   outputClass:[AWSioteventsCreateInputResponse class]];
}

- (void)createInput:(AWSioteventsCreateInputRequest *)request
     completionHandler:(void (^)(AWSioteventsCreateInputResponse *response, NSError *error))completionHandler {
    [[self createInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsCreateInputResponse *> * _Nonnull task) {
        AWSioteventsCreateInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsDeleteDetectorModelResponse *> *)deleteDetectorModel:(AWSioteventsDeleteDetectorModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector-models/{detectorModelName}"
                  targetPrefix:@""
                 operationName:@"DeleteDetectorModel"
                   outputClass:[AWSioteventsDeleteDetectorModelResponse class]];
}

- (void)deleteDetectorModel:(AWSioteventsDeleteDetectorModelRequest *)request
     completionHandler:(void (^)(AWSioteventsDeleteDetectorModelResponse *response, NSError *error))completionHandler {
    [[self deleteDetectorModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsDeleteDetectorModelResponse *> * _Nonnull task) {
        AWSioteventsDeleteDetectorModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsDeleteInputResponse *> *)deleteInput:(AWSioteventsDeleteInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/inputs/{inputName}"
                  targetPrefix:@""
                 operationName:@"DeleteInput"
                   outputClass:[AWSioteventsDeleteInputResponse class]];
}

- (void)deleteInput:(AWSioteventsDeleteInputRequest *)request
     completionHandler:(void (^)(AWSioteventsDeleteInputResponse *response, NSError *error))completionHandler {
    [[self deleteInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsDeleteInputResponse *> * _Nonnull task) {
        AWSioteventsDeleteInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsDescribeDetectorModelResponse *> *)describeDetectorModel:(AWSioteventsDescribeDetectorModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector-models/{detectorModelName}"
                  targetPrefix:@""
                 operationName:@"DescribeDetectorModel"
                   outputClass:[AWSioteventsDescribeDetectorModelResponse class]];
}

- (void)describeDetectorModel:(AWSioteventsDescribeDetectorModelRequest *)request
     completionHandler:(void (^)(AWSioteventsDescribeDetectorModelResponse *response, NSError *error))completionHandler {
    [[self describeDetectorModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsDescribeDetectorModelResponse *> * _Nonnull task) {
        AWSioteventsDescribeDetectorModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsDescribeInputResponse *> *)describeInput:(AWSioteventsDescribeInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/inputs/{inputName}"
                  targetPrefix:@""
                 operationName:@"DescribeInput"
                   outputClass:[AWSioteventsDescribeInputResponse class]];
}

- (void)describeInput:(AWSioteventsDescribeInputRequest *)request
     completionHandler:(void (^)(AWSioteventsDescribeInputResponse *response, NSError *error))completionHandler {
    [[self describeInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsDescribeInputResponse *> * _Nonnull task) {
        AWSioteventsDescribeInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsDescribeLoggingOptionsResponse *> *)describeLoggingOptions:(AWSioteventsDescribeLoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/logging"
                  targetPrefix:@""
                 operationName:@"DescribeLoggingOptions"
                   outputClass:[AWSioteventsDescribeLoggingOptionsResponse class]];
}

- (void)describeLoggingOptions:(AWSioteventsDescribeLoggingOptionsRequest *)request
     completionHandler:(void (^)(AWSioteventsDescribeLoggingOptionsResponse *response, NSError *error))completionHandler {
    [[self describeLoggingOptions:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsDescribeLoggingOptionsResponse *> * _Nonnull task) {
        AWSioteventsDescribeLoggingOptionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsListDetectorModelVersionsResponse *> *)listDetectorModelVersions:(AWSioteventsListDetectorModelVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector-models/{detectorModelName}/versions"
                  targetPrefix:@""
                 operationName:@"ListDetectorModelVersions"
                   outputClass:[AWSioteventsListDetectorModelVersionsResponse class]];
}

- (void)listDetectorModelVersions:(AWSioteventsListDetectorModelVersionsRequest *)request
     completionHandler:(void (^)(AWSioteventsListDetectorModelVersionsResponse *response, NSError *error))completionHandler {
    [[self listDetectorModelVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsListDetectorModelVersionsResponse *> * _Nonnull task) {
        AWSioteventsListDetectorModelVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsListDetectorModelsResponse *> *)listDetectorModels:(AWSioteventsListDetectorModelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector-models"
                  targetPrefix:@""
                 operationName:@"ListDetectorModels"
                   outputClass:[AWSioteventsListDetectorModelsResponse class]];
}

- (void)listDetectorModels:(AWSioteventsListDetectorModelsRequest *)request
     completionHandler:(void (^)(AWSioteventsListDetectorModelsResponse *response, NSError *error))completionHandler {
    [[self listDetectorModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsListDetectorModelsResponse *> * _Nonnull task) {
        AWSioteventsListDetectorModelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsListInputsResponse *> *)listInputs:(AWSioteventsListInputsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/inputs"
                  targetPrefix:@""
                 operationName:@"ListInputs"
                   outputClass:[AWSioteventsListInputsResponse class]];
}

- (void)listInputs:(AWSioteventsListInputsRequest *)request
     completionHandler:(void (^)(AWSioteventsListInputsResponse *response, NSError *error))completionHandler {
    [[self listInputs:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsListInputsResponse *> * _Nonnull task) {
        AWSioteventsListInputsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsListTagsForResourceResponse *> *)listTagsForResource:(AWSioteventsListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSioteventsListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSioteventsListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSioteventsListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsListTagsForResourceResponse *> * _Nonnull task) {
        AWSioteventsListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)putLoggingOptions:(AWSioteventsPutLoggingOptionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/logging"
                  targetPrefix:@""
                 operationName:@"PutLoggingOptions"
                   outputClass:nil];
}

- (void)putLoggingOptions:(AWSioteventsPutLoggingOptionsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self putLoggingOptions:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsTagResourceResponse *> *)tagResource:(AWSioteventsTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSioteventsTagResourceResponse class]];
}

- (void)tagResource:(AWSioteventsTagResourceRequest *)request
     completionHandler:(void (^)(AWSioteventsTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsTagResourceResponse *> * _Nonnull task) {
        AWSioteventsTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsUntagResourceResponse *> *)untagResource:(AWSioteventsUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSioteventsUntagResourceResponse class]];
}

- (void)untagResource:(AWSioteventsUntagResourceRequest *)request
     completionHandler:(void (^)(AWSioteventsUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsUntagResourceResponse *> * _Nonnull task) {
        AWSioteventsUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsUpdateDetectorModelResponse *> *)updateDetectorModel:(AWSioteventsUpdateDetectorModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector-models/{detectorModelName}"
                  targetPrefix:@""
                 operationName:@"UpdateDetectorModel"
                   outputClass:[AWSioteventsUpdateDetectorModelResponse class]];
}

- (void)updateDetectorModel:(AWSioteventsUpdateDetectorModelRequest *)request
     completionHandler:(void (^)(AWSioteventsUpdateDetectorModelResponse *response, NSError *error))completionHandler {
    [[self updateDetectorModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsUpdateDetectorModelResponse *> * _Nonnull task) {
        AWSioteventsUpdateDetectorModelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSioteventsUpdateInputResponse *> *)updateInput:(AWSioteventsUpdateInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/inputs/{inputName}"
                  targetPrefix:@""
                 operationName:@"UpdateInput"
                   outputClass:[AWSioteventsUpdateInputResponse class]];
}

- (void)updateInput:(AWSioteventsUpdateInputRequest *)request
     completionHandler:(void (^)(AWSioteventsUpdateInputResponse *response, NSError *error))completionHandler {
    [[self updateInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSioteventsUpdateInputResponse *> * _Nonnull task) {
        AWSioteventsUpdateInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
