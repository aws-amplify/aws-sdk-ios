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

#import "AWSa2i-runtime.sagemakerService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSa2i-runtime.sagemakerResources.h"

static NSString *const AWSInfoa2i-runtime.sagemaker = @"a2i-runtime.sagemaker";
NSString *const AWSa2i-runtime.sagemakerSDKVersion = @"2.13.2";


@interface AWSa2i-runtime.sagemakerResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSa2i-runtime.sagemakerResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"ConflictException" : @(AWSa2i-runtime.sagemakerErrorConflict),
                            @"InternalServerException" : @(AWSa2i-runtime.sagemakerErrorInternalServer),
                            @"ResourceNotFoundException" : @(AWSa2i-runtime.sagemakerErrorResourceNotFound),
                            @"ServiceQuotaExceededException" : @(AWSa2i-runtime.sagemakerErrorServiceQuotaExceeded),
                            @"ThrottlingException" : @(AWSa2i-runtime.sagemakerErrorThrottling),
                            @"ValidationException" : @(AWSa2i-runtime.sagemakerErrorValidation),
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
                    *error = [NSError errorWithDomain:AWSa2i-runtime.sagemakerErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSa2i-runtime.sagemakerErrorDomain
                                                 code:AWSa2i-runtime.sagemakerErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSa2i-runtime.sagemakerErrorDomain
                                     code:AWSa2i-runtime.sagemakerErrorUnknown
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

@interface AWSa2i-runtime.sagemakerRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSa2i-runtime.sagemakerRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSa2i-runtime.sagemaker()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSa2i-runtime.sagemaker

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSa2i-runtime.sagemakerSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSa2i-runtime.sagemaker versions need to match. Check your SDK installation. AWSCore: %@ AWSa2i-runtime.sagemaker: %@", AWSiOSSDKVersion, AWSa2i-runtime.sagemakerSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaulta2i-runtime.sagemaker {
    static AWSa2i-runtime.sagemaker *_defaulta2i-runtime.sagemaker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoa2i-runtime.sagemaker];
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
        _defaulta2i-runtime.sagemaker = [[AWSa2i-runtime.sagemaker alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaulta2i-runtime.sagemaker;
}

+ (void)registera2i-runtime.sagemakerWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSa2i-runtime.sagemaker alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)a2i-runtime.sagemakerForKey:(NSString *)key {
    @synchronized(self) {
        AWSa2i-runtime.sagemaker *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoa2i-runtime.sagemaker
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSa2i-runtime.sagemaker registera2i-runtime.sagemakerWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removea2i-runtime.sagemakerForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaulta2i-runtime.sagemaker` or `+ a2i-runtime.sagemakerForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicea2i-runtime.sagemaker
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicea2i-runtime.sagemaker];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSa2i-runtime.sagemakerRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSa2i-runtime.sagemakerResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSa2i-runtime.sagemakerResponseSerializer alloc] initWithJSONDefinition:[[AWSa2i-runtime.sagemakerResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSa2i-runtime.sagemakerDeleteHumanLoopResponse *> *)deleteHumanLoop:(AWSa2i-runtime.sagemakerDeleteHumanLoopRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/human-loops/{HumanLoopName}"
                  targetPrefix:@""
                 operationName:@"DeleteHumanLoop"
                   outputClass:[AWSa2i-runtime.sagemakerDeleteHumanLoopResponse class]];
}

- (void)deleteHumanLoop:(AWSa2i-runtime.sagemakerDeleteHumanLoopRequest *)request
     completionHandler:(void (^)(AWSa2i-runtime.sagemakerDeleteHumanLoopResponse *response, NSError *error))completionHandler {
    [[self deleteHumanLoop:request] continueWithBlock:^id _Nullable(AWSTask<AWSa2i-runtime.sagemakerDeleteHumanLoopResponse *> * _Nonnull task) {
        AWSa2i-runtime.sagemakerDeleteHumanLoopResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSa2i-runtime.sagemakerDescribeHumanLoopResponse *> *)describeHumanLoop:(AWSa2i-runtime.sagemakerDescribeHumanLoopRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/human-loops/{HumanLoopName}"
                  targetPrefix:@""
                 operationName:@"DescribeHumanLoop"
                   outputClass:[AWSa2i-runtime.sagemakerDescribeHumanLoopResponse class]];
}

- (void)describeHumanLoop:(AWSa2i-runtime.sagemakerDescribeHumanLoopRequest *)request
     completionHandler:(void (^)(AWSa2i-runtime.sagemakerDescribeHumanLoopResponse *response, NSError *error))completionHandler {
    [[self describeHumanLoop:request] continueWithBlock:^id _Nullable(AWSTask<AWSa2i-runtime.sagemakerDescribeHumanLoopResponse *> * _Nonnull task) {
        AWSa2i-runtime.sagemakerDescribeHumanLoopResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSa2i-runtime.sagemakerListHumanLoopsResponse *> *)listHumanLoops:(AWSa2i-runtime.sagemakerListHumanLoopsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/human-loops"
                  targetPrefix:@""
                 operationName:@"ListHumanLoops"
                   outputClass:[AWSa2i-runtime.sagemakerListHumanLoopsResponse class]];
}

- (void)listHumanLoops:(AWSa2i-runtime.sagemakerListHumanLoopsRequest *)request
     completionHandler:(void (^)(AWSa2i-runtime.sagemakerListHumanLoopsResponse *response, NSError *error))completionHandler {
    [[self listHumanLoops:request] continueWithBlock:^id _Nullable(AWSTask<AWSa2i-runtime.sagemakerListHumanLoopsResponse *> * _Nonnull task) {
        AWSa2i-runtime.sagemakerListHumanLoopsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSa2i-runtime.sagemakerStartHumanLoopResponse *> *)startHumanLoop:(AWSa2i-runtime.sagemakerStartHumanLoopRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/human-loops"
                  targetPrefix:@""
                 operationName:@"StartHumanLoop"
                   outputClass:[AWSa2i-runtime.sagemakerStartHumanLoopResponse class]];
}

- (void)startHumanLoop:(AWSa2i-runtime.sagemakerStartHumanLoopRequest *)request
     completionHandler:(void (^)(AWSa2i-runtime.sagemakerStartHumanLoopResponse *response, NSError *error))completionHandler {
    [[self startHumanLoop:request] continueWithBlock:^id _Nullable(AWSTask<AWSa2i-runtime.sagemakerStartHumanLoopResponse *> * _Nonnull task) {
        AWSa2i-runtime.sagemakerStartHumanLoopResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSa2i-runtime.sagemakerStopHumanLoopResponse *> *)stopHumanLoop:(AWSa2i-runtime.sagemakerStopHumanLoopRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/human-loops/stop"
                  targetPrefix:@""
                 operationName:@"StopHumanLoop"
                   outputClass:[AWSa2i-runtime.sagemakerStopHumanLoopResponse class]];
}

- (void)stopHumanLoop:(AWSa2i-runtime.sagemakerStopHumanLoopRequest *)request
     completionHandler:(void (^)(AWSa2i-runtime.sagemakerStopHumanLoopResponse *response, NSError *error))completionHandler {
    [[self stopHumanLoop:request] continueWithBlock:^id _Nullable(AWSTask<AWSa2i-runtime.sagemakerStopHumanLoopResponse *> * _Nonnull task) {
        AWSa2i-runtime.sagemakerStopHumanLoopResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
