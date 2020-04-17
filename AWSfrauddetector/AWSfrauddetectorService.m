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

#import "AWSfrauddetectorService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSfrauddetectorResources.h"

static NSString *const AWSInfofrauddetector = @"frauddetector";
NSString *const AWSfrauddetectorSDKVersion = @"2.13.2";


@interface AWSfrauddetectorResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSfrauddetectorResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConflictException" : @(AWSfrauddetectorErrorConflict),
                            @"InternalServerException" : @(AWSfrauddetectorErrorInternalServer),
                            @"ResourceNotFoundException" : @(AWSfrauddetectorErrorResourceNotFound),
                            @"ThrottlingException" : @(AWSfrauddetectorErrorThrottling),
                            @"ValidationException" : @(AWSfrauddetectorErrorValidation),
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
	                *error = [NSError errorWithDomain:AWSfrauddetectorErrorDomain
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
        *error = [NSError errorWithDomain:AWSfrauddetectorErrorDomain
                                     code:AWSfrauddetectorErrorUnknown
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

@interface AWSfrauddetectorRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSfrauddetectorRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSfrauddetector()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSfrauddetector

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSfrauddetectorSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSfrauddetector versions need to match. Check your SDK installation. AWSCore: %@ AWSfrauddetector: %@", AWSiOSSDKVersion, AWSfrauddetectorSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultfrauddetector {
    static AWSfrauddetector *_defaultfrauddetector = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfofrauddetector];
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
        _defaultfrauddetector = [[AWSfrauddetector alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultfrauddetector;
}

+ (void)registerfrauddetectorWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSfrauddetector alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)frauddetectorForKey:(NSString *)key {
    @synchronized(self) {
        AWSfrauddetector *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfofrauddetector
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSfrauddetector registerfrauddetectorWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removefrauddetectorForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultfrauddetector` or `+ frauddetectorForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicefrauddetector
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicefrauddetector];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSfrauddetectorRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSfrauddetectorResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSfrauddetectorResponseSerializer alloc] initWithJSONDefinition:[[AWSfrauddetectorResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSfrauddetectorBatchCreateVariableResult *> *)batchCreateVariable:(AWSfrauddetectorBatchCreateVariableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"BatchCreateVariable"
                   outputClass:[AWSfrauddetectorBatchCreateVariableResult class]];
}

- (void)batchCreateVariable:(AWSfrauddetectorBatchCreateVariableRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorBatchCreateVariableResult *response, NSError *error))completionHandler {
    [[self batchCreateVariable:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorBatchCreateVariableResult *> * _Nonnull task) {
        AWSfrauddetectorBatchCreateVariableResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorBatchGetVariableResult *> *)batchGetVariable:(AWSfrauddetectorBatchGetVariableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"BatchGetVariable"
                   outputClass:[AWSfrauddetectorBatchGetVariableResult class]];
}

- (void)batchGetVariable:(AWSfrauddetectorBatchGetVariableRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorBatchGetVariableResult *response, NSError *error))completionHandler {
    [[self batchGetVariable:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorBatchGetVariableResult *> * _Nonnull task) {
        AWSfrauddetectorBatchGetVariableResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorCreateDetectorVersionResult *> *)createDetectorVersion:(AWSfrauddetectorCreateDetectorVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"CreateDetectorVersion"
                   outputClass:[AWSfrauddetectorCreateDetectorVersionResult class]];
}

- (void)createDetectorVersion:(AWSfrauddetectorCreateDetectorVersionRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorCreateDetectorVersionResult *response, NSError *error))completionHandler {
    [[self createDetectorVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorCreateDetectorVersionResult *> * _Nonnull task) {
        AWSfrauddetectorCreateDetectorVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorCreateModelVersionResult *> *)createModelVersion:(AWSfrauddetectorCreateModelVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"CreateModelVersion"
                   outputClass:[AWSfrauddetectorCreateModelVersionResult class]];
}

- (void)createModelVersion:(AWSfrauddetectorCreateModelVersionRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorCreateModelVersionResult *response, NSError *error))completionHandler {
    [[self createModelVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorCreateModelVersionResult *> * _Nonnull task) {
        AWSfrauddetectorCreateModelVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorCreateRuleResult *> *)createRule:(AWSfrauddetectorCreateRuleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"CreateRule"
                   outputClass:[AWSfrauddetectorCreateRuleResult class]];
}

- (void)createRule:(AWSfrauddetectorCreateRuleRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorCreateRuleResult *response, NSError *error))completionHandler {
    [[self createRule:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorCreateRuleResult *> * _Nonnull task) {
        AWSfrauddetectorCreateRuleResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorCreateVariableResult *> *)createVariable:(AWSfrauddetectorCreateVariableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"CreateVariable"
                   outputClass:[AWSfrauddetectorCreateVariableResult class]];
}

- (void)createVariable:(AWSfrauddetectorCreateVariableRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorCreateVariableResult *response, NSError *error))completionHandler {
    [[self createVariable:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorCreateVariableResult *> * _Nonnull task) {
        AWSfrauddetectorCreateVariableResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorDeleteDetectorResult *> *)deleteDetector:(AWSfrauddetectorDeleteDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"DeleteDetector"
                   outputClass:[AWSfrauddetectorDeleteDetectorResult class]];
}

- (void)deleteDetector:(AWSfrauddetectorDeleteDetectorRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorDeleteDetectorResult *response, NSError *error))completionHandler {
    [[self deleteDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorDeleteDetectorResult *> * _Nonnull task) {
        AWSfrauddetectorDeleteDetectorResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorDeleteDetectorVersionResult *> *)deleteDetectorVersion:(AWSfrauddetectorDeleteDetectorVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"DeleteDetectorVersion"
                   outputClass:[AWSfrauddetectorDeleteDetectorVersionResult class]];
}

- (void)deleteDetectorVersion:(AWSfrauddetectorDeleteDetectorVersionRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorDeleteDetectorVersionResult *response, NSError *error))completionHandler {
    [[self deleteDetectorVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorDeleteDetectorVersionResult *> * _Nonnull task) {
        AWSfrauddetectorDeleteDetectorVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorDeleteEventResult *> *)deleteEvent:(AWSfrauddetectorDeleteEventRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"DeleteEvent"
                   outputClass:[AWSfrauddetectorDeleteEventResult class]];
}

- (void)deleteEvent:(AWSfrauddetectorDeleteEventRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorDeleteEventResult *response, NSError *error))completionHandler {
    [[self deleteEvent:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorDeleteEventResult *> * _Nonnull task) {
        AWSfrauddetectorDeleteEventResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorDeleteRuleVersionResult *> *)deleteRuleVersion:(AWSfrauddetectorDeleteRuleVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"DeleteRuleVersion"
                   outputClass:[AWSfrauddetectorDeleteRuleVersionResult class]];
}

- (void)deleteRuleVersion:(AWSfrauddetectorDeleteRuleVersionRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorDeleteRuleVersionResult *response, NSError *error))completionHandler {
    [[self deleteRuleVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorDeleteRuleVersionResult *> * _Nonnull task) {
        AWSfrauddetectorDeleteRuleVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorDescribeDetectorResult *> *)describeDetector:(AWSfrauddetectorDescribeDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"DescribeDetector"
                   outputClass:[AWSfrauddetectorDescribeDetectorResult class]];
}

- (void)describeDetector:(AWSfrauddetectorDescribeDetectorRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorDescribeDetectorResult *response, NSError *error))completionHandler {
    [[self describeDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorDescribeDetectorResult *> * _Nonnull task) {
        AWSfrauddetectorDescribeDetectorResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorDescribeModelVersionsResult *> *)describeModelVersions:(AWSfrauddetectorDescribeModelVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"DescribeModelVersions"
                   outputClass:[AWSfrauddetectorDescribeModelVersionsResult class]];
}

- (void)describeModelVersions:(AWSfrauddetectorDescribeModelVersionsRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorDescribeModelVersionsResult *response, NSError *error))completionHandler {
    [[self describeModelVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorDescribeModelVersionsResult *> * _Nonnull task) {
        AWSfrauddetectorDescribeModelVersionsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorGetDetectorVersionResult *> *)getDetectorVersion:(AWSfrauddetectorGetDetectorVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"GetDetectorVersion"
                   outputClass:[AWSfrauddetectorGetDetectorVersionResult class]];
}

- (void)getDetectorVersion:(AWSfrauddetectorGetDetectorVersionRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorGetDetectorVersionResult *response, NSError *error))completionHandler {
    [[self getDetectorVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorGetDetectorVersionResult *> * _Nonnull task) {
        AWSfrauddetectorGetDetectorVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorGetDetectorsResult *> *)getDetectors:(AWSfrauddetectorGetDetectorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"GetDetectors"
                   outputClass:[AWSfrauddetectorGetDetectorsResult class]];
}

- (void)getDetectors:(AWSfrauddetectorGetDetectorsRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorGetDetectorsResult *response, NSError *error))completionHandler {
    [[self getDetectors:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorGetDetectorsResult *> * _Nonnull task) {
        AWSfrauddetectorGetDetectorsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorGetExternalModelsResult *> *)getExternalModels:(AWSfrauddetectorGetExternalModelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"GetExternalModels"
                   outputClass:[AWSfrauddetectorGetExternalModelsResult class]];
}

- (void)getExternalModels:(AWSfrauddetectorGetExternalModelsRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorGetExternalModelsResult *response, NSError *error))completionHandler {
    [[self getExternalModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorGetExternalModelsResult *> * _Nonnull task) {
        AWSfrauddetectorGetExternalModelsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorGetModelVersionResult *> *)getModelVersion:(AWSfrauddetectorGetModelVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"GetModelVersion"
                   outputClass:[AWSfrauddetectorGetModelVersionResult class]];
}

- (void)getModelVersion:(AWSfrauddetectorGetModelVersionRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorGetModelVersionResult *response, NSError *error))completionHandler {
    [[self getModelVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorGetModelVersionResult *> * _Nonnull task) {
        AWSfrauddetectorGetModelVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorGetModelsResult *> *)getModels:(AWSfrauddetectorGetModelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"GetModels"
                   outputClass:[AWSfrauddetectorGetModelsResult class]];
}

- (void)getModels:(AWSfrauddetectorGetModelsRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorGetModelsResult *response, NSError *error))completionHandler {
    [[self getModels:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorGetModelsResult *> * _Nonnull task) {
        AWSfrauddetectorGetModelsResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorGetOutcomesResult *> *)getOutcomes:(AWSfrauddetectorGetOutcomesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"GetOutcomes"
                   outputClass:[AWSfrauddetectorGetOutcomesResult class]];
}

- (void)getOutcomes:(AWSfrauddetectorGetOutcomesRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorGetOutcomesResult *response, NSError *error))completionHandler {
    [[self getOutcomes:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorGetOutcomesResult *> * _Nonnull task) {
        AWSfrauddetectorGetOutcomesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorGetPredictionResult *> *)getPrediction:(AWSfrauddetectorGetPredictionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"GetPrediction"
                   outputClass:[AWSfrauddetectorGetPredictionResult class]];
}

- (void)getPrediction:(AWSfrauddetectorGetPredictionRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorGetPredictionResult *response, NSError *error))completionHandler {
    [[self getPrediction:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorGetPredictionResult *> * _Nonnull task) {
        AWSfrauddetectorGetPredictionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorGetRulesResult *> *)getRules:(AWSfrauddetectorGetRulesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"GetRules"
                   outputClass:[AWSfrauddetectorGetRulesResult class]];
}

- (void)getRules:(AWSfrauddetectorGetRulesRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorGetRulesResult *response, NSError *error))completionHandler {
    [[self getRules:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorGetRulesResult *> * _Nonnull task) {
        AWSfrauddetectorGetRulesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorGetVariablesResult *> *)getVariables:(AWSfrauddetectorGetVariablesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"GetVariables"
                   outputClass:[AWSfrauddetectorGetVariablesResult class]];
}

- (void)getVariables:(AWSfrauddetectorGetVariablesRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorGetVariablesResult *response, NSError *error))completionHandler {
    [[self getVariables:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorGetVariablesResult *> * _Nonnull task) {
        AWSfrauddetectorGetVariablesResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorPutDetectorResult *> *)putDetector:(AWSfrauddetectorPutDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"PutDetector"
                   outputClass:[AWSfrauddetectorPutDetectorResult class]];
}

- (void)putDetector:(AWSfrauddetectorPutDetectorRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorPutDetectorResult *response, NSError *error))completionHandler {
    [[self putDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorPutDetectorResult *> * _Nonnull task) {
        AWSfrauddetectorPutDetectorResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorPutExternalModelResult *> *)putExternalModel:(AWSfrauddetectorPutExternalModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"PutExternalModel"
                   outputClass:[AWSfrauddetectorPutExternalModelResult class]];
}

- (void)putExternalModel:(AWSfrauddetectorPutExternalModelRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorPutExternalModelResult *response, NSError *error))completionHandler {
    [[self putExternalModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorPutExternalModelResult *> * _Nonnull task) {
        AWSfrauddetectorPutExternalModelResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorPutModelResult *> *)putModel:(AWSfrauddetectorPutModelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"PutModel"
                   outputClass:[AWSfrauddetectorPutModelResult class]];
}

- (void)putModel:(AWSfrauddetectorPutModelRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorPutModelResult *response, NSError *error))completionHandler {
    [[self putModel:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorPutModelResult *> * _Nonnull task) {
        AWSfrauddetectorPutModelResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorPutOutcomeResult *> *)putOutcome:(AWSfrauddetectorPutOutcomeRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"PutOutcome"
                   outputClass:[AWSfrauddetectorPutOutcomeResult class]];
}

- (void)putOutcome:(AWSfrauddetectorPutOutcomeRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorPutOutcomeResult *response, NSError *error))completionHandler {
    [[self putOutcome:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorPutOutcomeResult *> * _Nonnull task) {
        AWSfrauddetectorPutOutcomeResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorUpdateDetectorVersionResult *> *)updateDetectorVersion:(AWSfrauddetectorUpdateDetectorVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"UpdateDetectorVersion"
                   outputClass:[AWSfrauddetectorUpdateDetectorVersionResult class]];
}

- (void)updateDetectorVersion:(AWSfrauddetectorUpdateDetectorVersionRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorUpdateDetectorVersionResult *response, NSError *error))completionHandler {
    [[self updateDetectorVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorUpdateDetectorVersionResult *> * _Nonnull task) {
        AWSfrauddetectorUpdateDetectorVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorUpdateDetectorVersionMetadataResult *> *)updateDetectorVersionMetadata:(AWSfrauddetectorUpdateDetectorVersionMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"UpdateDetectorVersionMetadata"
                   outputClass:[AWSfrauddetectorUpdateDetectorVersionMetadataResult class]];
}

- (void)updateDetectorVersionMetadata:(AWSfrauddetectorUpdateDetectorVersionMetadataRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorUpdateDetectorVersionMetadataResult *response, NSError *error))completionHandler {
    [[self updateDetectorVersionMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorUpdateDetectorVersionMetadataResult *> * _Nonnull task) {
        AWSfrauddetectorUpdateDetectorVersionMetadataResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorUpdateDetectorVersionStatusResult *> *)updateDetectorVersionStatus:(AWSfrauddetectorUpdateDetectorVersionStatusRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"UpdateDetectorVersionStatus"
                   outputClass:[AWSfrauddetectorUpdateDetectorVersionStatusResult class]];
}

- (void)updateDetectorVersionStatus:(AWSfrauddetectorUpdateDetectorVersionStatusRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorUpdateDetectorVersionStatusResult *response, NSError *error))completionHandler {
    [[self updateDetectorVersionStatus:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorUpdateDetectorVersionStatusResult *> * _Nonnull task) {
        AWSfrauddetectorUpdateDetectorVersionStatusResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorUpdateModelVersionResult *> *)updateModelVersion:(AWSfrauddetectorUpdateModelVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"UpdateModelVersion"
                   outputClass:[AWSfrauddetectorUpdateModelVersionResult class]];
}

- (void)updateModelVersion:(AWSfrauddetectorUpdateModelVersionRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorUpdateModelVersionResult *response, NSError *error))completionHandler {
    [[self updateModelVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorUpdateModelVersionResult *> * _Nonnull task) {
        AWSfrauddetectorUpdateModelVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorUpdateRuleMetadataResult *> *)updateRuleMetadata:(AWSfrauddetectorUpdateRuleMetadataRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"UpdateRuleMetadata"
                   outputClass:[AWSfrauddetectorUpdateRuleMetadataResult class]];
}

- (void)updateRuleMetadata:(AWSfrauddetectorUpdateRuleMetadataRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorUpdateRuleMetadataResult *response, NSError *error))completionHandler {
    [[self updateRuleMetadata:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorUpdateRuleMetadataResult *> * _Nonnull task) {
        AWSfrauddetectorUpdateRuleMetadataResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorUpdateRuleVersionResult *> *)updateRuleVersion:(AWSfrauddetectorUpdateRuleVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"UpdateRuleVersion"
                   outputClass:[AWSfrauddetectorUpdateRuleVersionResult class]];
}

- (void)updateRuleVersion:(AWSfrauddetectorUpdateRuleVersionRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorUpdateRuleVersionResult *response, NSError *error))completionHandler {
    [[self updateRuleVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorUpdateRuleVersionResult *> * _Nonnull task) {
        AWSfrauddetectorUpdateRuleVersionResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSfrauddetectorUpdateVariableResult *> *)updateVariable:(AWSfrauddetectorUpdateVariableRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@""
                  targetPrefix:@"AWSHawksNestServiceFacade"
                 operationName:@"UpdateVariable"
                   outputClass:[AWSfrauddetectorUpdateVariableResult class]];
}

- (void)updateVariable:(AWSfrauddetectorUpdateVariableRequest *)request
     completionHandler:(void (^)(AWSfrauddetectorUpdateVariableResult *response, NSError *error))completionHandler {
    [[self updateVariable:request] continueWithBlock:^id _Nullable(AWSTask<AWSfrauddetectorUpdateVariableResult *> * _Nonnull task) {
        AWSfrauddetectorUpdateVariableResult *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
