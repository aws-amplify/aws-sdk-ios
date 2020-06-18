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

#import "AWSMediaconvertService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSMediaconvertResources.h"

static NSString *const AWSInfoMediaconvert = @"Mediaconvert";
NSString *const AWSMediaconvertSDKVersion = @"2.13.4";


@interface AWSMediaconvertResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSMediaconvertResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSMediaconvertErrorBadRequest),
                            @"ConflictException" : @(AWSMediaconvertErrorConflict),
                            @"ForbiddenException" : @(AWSMediaconvertErrorForbidden),
                            @"InternalServerErrorException" : @(AWSMediaconvertErrorInternalServerError),
                            @"NotFoundException" : @(AWSMediaconvertErrorNotFound),
                            @"TooManyRequestsException" : @(AWSMediaconvertErrorTooManyRequests),
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
                    *error = [NSError errorWithDomain:AWSMediaconvertErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSMediaconvertErrorDomain
                                                 code:AWSMediaconvertErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSMediaconvertErrorDomain
                                     code:AWSMediaconvertErrorUnknown
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

@interface AWSMediaconvertRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSMediaconvertRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSMediaconvert()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSMediaconvert

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSMediaconvertSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSMediaconvert versions need to match. Check your SDK installation. AWSCore: %@ AWSMediaconvert: %@", AWSiOSSDKVersion, AWSMediaconvertSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultMediaconvert {
    static AWSMediaconvert *_defaultMediaconvert = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoMediaconvert];
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
        _defaultMediaconvert = [[AWSMediaconvert alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultMediaconvert;
}

+ (void)registerMediaconvertWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSMediaconvert alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)MediaconvertForKey:(NSString *)key {
    @synchronized(self) {
        AWSMediaconvert *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoMediaconvert
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSMediaconvert registerMediaconvertWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeMediaconvertForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultMediaconvert` or `+ MediaconvertForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceMediaconvert
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceMediaconvert];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSMediaconvertRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSMediaconvertResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSMediaconvertResponseSerializer alloc] initWithJSONDefinition:[[AWSMediaconvertResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSMediaconvertAssociateCertificateResponse *> *)associateCertificate:(AWSMediaconvertAssociateCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/certificates"
                  targetPrefix:@""
                 operationName:@"AssociateCertificate"
                   outputClass:[AWSMediaconvertAssociateCertificateResponse class]];
}

- (void)associateCertificate:(AWSMediaconvertAssociateCertificateRequest *)request
     completionHandler:(void (^)(AWSMediaconvertAssociateCertificateResponse *response, NSError *error))completionHandler {
    [[self associateCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertAssociateCertificateResponse *> * _Nonnull task) {
        AWSMediaconvertAssociateCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertCancelJobResponse *> *)cancelJob:(AWSMediaconvertCancelJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-08-29/jobs/{id}"
                  targetPrefix:@""
                 operationName:@"CancelJob"
                   outputClass:[AWSMediaconvertCancelJobResponse class]];
}

- (void)cancelJob:(AWSMediaconvertCancelJobRequest *)request
     completionHandler:(void (^)(AWSMediaconvertCancelJobResponse *response, NSError *error))completionHandler {
    [[self cancelJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertCancelJobResponse *> * _Nonnull task) {
        AWSMediaconvertCancelJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertCreateJobResponse *> *)createJob:(AWSMediaconvertCreateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/jobs"
                  targetPrefix:@""
                 operationName:@"CreateJob"
                   outputClass:[AWSMediaconvertCreateJobResponse class]];
}

- (void)createJob:(AWSMediaconvertCreateJobRequest *)request
     completionHandler:(void (^)(AWSMediaconvertCreateJobResponse *response, NSError *error))completionHandler {
    [[self createJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertCreateJobResponse *> * _Nonnull task) {
        AWSMediaconvertCreateJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertCreateJobTemplateResponse *> *)createJobTemplate:(AWSMediaconvertCreateJobTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/jobTemplates"
                  targetPrefix:@""
                 operationName:@"CreateJobTemplate"
                   outputClass:[AWSMediaconvertCreateJobTemplateResponse class]];
}

- (void)createJobTemplate:(AWSMediaconvertCreateJobTemplateRequest *)request
     completionHandler:(void (^)(AWSMediaconvertCreateJobTemplateResponse *response, NSError *error))completionHandler {
    [[self createJobTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertCreateJobTemplateResponse *> * _Nonnull task) {
        AWSMediaconvertCreateJobTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertCreatePresetResponse *> *)createPreset:(AWSMediaconvertCreatePresetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/presets"
                  targetPrefix:@""
                 operationName:@"CreatePreset"
                   outputClass:[AWSMediaconvertCreatePresetResponse class]];
}

- (void)createPreset:(AWSMediaconvertCreatePresetRequest *)request
     completionHandler:(void (^)(AWSMediaconvertCreatePresetResponse *response, NSError *error))completionHandler {
    [[self createPreset:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertCreatePresetResponse *> * _Nonnull task) {
        AWSMediaconvertCreatePresetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertCreateQueueResponse *> *)createQueue:(AWSMediaconvertCreateQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/queues"
                  targetPrefix:@""
                 operationName:@"CreateQueue"
                   outputClass:[AWSMediaconvertCreateQueueResponse class]];
}

- (void)createQueue:(AWSMediaconvertCreateQueueRequest *)request
     completionHandler:(void (^)(AWSMediaconvertCreateQueueResponse *response, NSError *error))completionHandler {
    [[self createQueue:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertCreateQueueResponse *> * _Nonnull task) {
        AWSMediaconvertCreateQueueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertDeleteJobTemplateResponse *> *)deleteJobTemplate:(AWSMediaconvertDeleteJobTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-08-29/jobTemplates/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteJobTemplate"
                   outputClass:[AWSMediaconvertDeleteJobTemplateResponse class]];
}

- (void)deleteJobTemplate:(AWSMediaconvertDeleteJobTemplateRequest *)request
     completionHandler:(void (^)(AWSMediaconvertDeleteJobTemplateResponse *response, NSError *error))completionHandler {
    [[self deleteJobTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertDeleteJobTemplateResponse *> * _Nonnull task) {
        AWSMediaconvertDeleteJobTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertDeletePresetResponse *> *)deletePreset:(AWSMediaconvertDeletePresetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-08-29/presets/{name}"
                  targetPrefix:@""
                 operationName:@"DeletePreset"
                   outputClass:[AWSMediaconvertDeletePresetResponse class]];
}

- (void)deletePreset:(AWSMediaconvertDeletePresetRequest *)request
     completionHandler:(void (^)(AWSMediaconvertDeletePresetResponse *response, NSError *error))completionHandler {
    [[self deletePreset:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertDeletePresetResponse *> * _Nonnull task) {
        AWSMediaconvertDeletePresetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertDeleteQueueResponse *> *)deleteQueue:(AWSMediaconvertDeleteQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-08-29/queues/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteQueue"
                   outputClass:[AWSMediaconvertDeleteQueueResponse class]];
}

- (void)deleteQueue:(AWSMediaconvertDeleteQueueRequest *)request
     completionHandler:(void (^)(AWSMediaconvertDeleteQueueResponse *response, NSError *error))completionHandler {
    [[self deleteQueue:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertDeleteQueueResponse *> * _Nonnull task) {
        AWSMediaconvertDeleteQueueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertDescribeEndpointsResponse *> *)describeEndpoints:(AWSMediaconvertDescribeEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/endpoints"
                  targetPrefix:@""
                 operationName:@"DescribeEndpoints"
                   outputClass:[AWSMediaconvertDescribeEndpointsResponse class]];
}

- (void)describeEndpoints:(AWSMediaconvertDescribeEndpointsRequest *)request
     completionHandler:(void (^)(AWSMediaconvertDescribeEndpointsResponse *response, NSError *error))completionHandler {
    [[self describeEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertDescribeEndpointsResponse *> * _Nonnull task) {
        AWSMediaconvertDescribeEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertDisassociateCertificateResponse *> *)disassociateCertificate:(AWSMediaconvertDisassociateCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-08-29/certificates/{arn}"
                  targetPrefix:@""
                 operationName:@"DisassociateCertificate"
                   outputClass:[AWSMediaconvertDisassociateCertificateResponse class]];
}

- (void)disassociateCertificate:(AWSMediaconvertDisassociateCertificateRequest *)request
     completionHandler:(void (^)(AWSMediaconvertDisassociateCertificateResponse *response, NSError *error))completionHandler {
    [[self disassociateCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertDisassociateCertificateResponse *> * _Nonnull task) {
        AWSMediaconvertDisassociateCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertGetJobResponse *> *)getJob:(AWSMediaconvertGetJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/jobs/{id}"
                  targetPrefix:@""
                 operationName:@"GetJob"
                   outputClass:[AWSMediaconvertGetJobResponse class]];
}

- (void)getJob:(AWSMediaconvertGetJobRequest *)request
     completionHandler:(void (^)(AWSMediaconvertGetJobResponse *response, NSError *error))completionHandler {
    [[self getJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertGetJobResponse *> * _Nonnull task) {
        AWSMediaconvertGetJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertGetJobTemplateResponse *> *)getJobTemplate:(AWSMediaconvertGetJobTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/jobTemplates/{name}"
                  targetPrefix:@""
                 operationName:@"GetJobTemplate"
                   outputClass:[AWSMediaconvertGetJobTemplateResponse class]];
}

- (void)getJobTemplate:(AWSMediaconvertGetJobTemplateRequest *)request
     completionHandler:(void (^)(AWSMediaconvertGetJobTemplateResponse *response, NSError *error))completionHandler {
    [[self getJobTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertGetJobTemplateResponse *> * _Nonnull task) {
        AWSMediaconvertGetJobTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertGetPresetResponse *> *)getPreset:(AWSMediaconvertGetPresetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/presets/{name}"
                  targetPrefix:@""
                 operationName:@"GetPreset"
                   outputClass:[AWSMediaconvertGetPresetResponse class]];
}

- (void)getPreset:(AWSMediaconvertGetPresetRequest *)request
     completionHandler:(void (^)(AWSMediaconvertGetPresetResponse *response, NSError *error))completionHandler {
    [[self getPreset:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertGetPresetResponse *> * _Nonnull task) {
        AWSMediaconvertGetPresetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertGetQueueResponse *> *)getQueue:(AWSMediaconvertGetQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/queues/{name}"
                  targetPrefix:@""
                 operationName:@"GetQueue"
                   outputClass:[AWSMediaconvertGetQueueResponse class]];
}

- (void)getQueue:(AWSMediaconvertGetQueueRequest *)request
     completionHandler:(void (^)(AWSMediaconvertGetQueueResponse *response, NSError *error))completionHandler {
    [[self getQueue:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertGetQueueResponse *> * _Nonnull task) {
        AWSMediaconvertGetQueueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertListJobTemplatesResponse *> *)listJobTemplates:(AWSMediaconvertListJobTemplatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/jobTemplates"
                  targetPrefix:@""
                 operationName:@"ListJobTemplates"
                   outputClass:[AWSMediaconvertListJobTemplatesResponse class]];
}

- (void)listJobTemplates:(AWSMediaconvertListJobTemplatesRequest *)request
     completionHandler:(void (^)(AWSMediaconvertListJobTemplatesResponse *response, NSError *error))completionHandler {
    [[self listJobTemplates:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertListJobTemplatesResponse *> * _Nonnull task) {
        AWSMediaconvertListJobTemplatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertListJobsResponse *> *)listJobs:(AWSMediaconvertListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/jobs"
                  targetPrefix:@""
                 operationName:@"ListJobs"
                   outputClass:[AWSMediaconvertListJobsResponse class]];
}

- (void)listJobs:(AWSMediaconvertListJobsRequest *)request
     completionHandler:(void (^)(AWSMediaconvertListJobsResponse *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertListJobsResponse *> * _Nonnull task) {
        AWSMediaconvertListJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertListPresetsResponse *> *)listPresets:(AWSMediaconvertListPresetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/presets"
                  targetPrefix:@""
                 operationName:@"ListPresets"
                   outputClass:[AWSMediaconvertListPresetsResponse class]];
}

- (void)listPresets:(AWSMediaconvertListPresetsRequest *)request
     completionHandler:(void (^)(AWSMediaconvertListPresetsResponse *response, NSError *error))completionHandler {
    [[self listPresets:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertListPresetsResponse *> * _Nonnull task) {
        AWSMediaconvertListPresetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertListQueuesResponse *> *)listQueues:(AWSMediaconvertListQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/queues"
                  targetPrefix:@""
                 operationName:@"ListQueues"
                   outputClass:[AWSMediaconvertListQueuesResponse class]];
}

- (void)listQueues:(AWSMediaconvertListQueuesRequest *)request
     completionHandler:(void (^)(AWSMediaconvertListQueuesResponse *response, NSError *error))completionHandler {
    [[self listQueues:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertListQueuesResponse *> * _Nonnull task) {
        AWSMediaconvertListQueuesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertListTagsForResourceResponse *> *)listTagsForResource:(AWSMediaconvertListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/tags/{arn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSMediaconvertListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSMediaconvertListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSMediaconvertListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertListTagsForResourceResponse *> * _Nonnull task) {
        AWSMediaconvertListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertTagResourceResponse *> *)tagResource:(AWSMediaconvertTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/tags"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSMediaconvertTagResourceResponse class]];
}

- (void)tagResource:(AWSMediaconvertTagResourceRequest *)request
     completionHandler:(void (^)(AWSMediaconvertTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertTagResourceResponse *> * _Nonnull task) {
        AWSMediaconvertTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertUntagResourceResponse *> *)untagResource:(AWSMediaconvertUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2017-08-29/tags/{arn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSMediaconvertUntagResourceResponse class]];
}

- (void)untagResource:(AWSMediaconvertUntagResourceRequest *)request
     completionHandler:(void (^)(AWSMediaconvertUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertUntagResourceResponse *> * _Nonnull task) {
        AWSMediaconvertUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertUpdateJobTemplateResponse *> *)updateJobTemplate:(AWSMediaconvertUpdateJobTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2017-08-29/jobTemplates/{name}"
                  targetPrefix:@""
                 operationName:@"UpdateJobTemplate"
                   outputClass:[AWSMediaconvertUpdateJobTemplateResponse class]];
}

- (void)updateJobTemplate:(AWSMediaconvertUpdateJobTemplateRequest *)request
     completionHandler:(void (^)(AWSMediaconvertUpdateJobTemplateResponse *response, NSError *error))completionHandler {
    [[self updateJobTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertUpdateJobTemplateResponse *> * _Nonnull task) {
        AWSMediaconvertUpdateJobTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertUpdatePresetResponse *> *)updatePreset:(AWSMediaconvertUpdatePresetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2017-08-29/presets/{name}"
                  targetPrefix:@""
                 operationName:@"UpdatePreset"
                   outputClass:[AWSMediaconvertUpdatePresetResponse class]];
}

- (void)updatePreset:(AWSMediaconvertUpdatePresetRequest *)request
     completionHandler:(void (^)(AWSMediaconvertUpdatePresetResponse *response, NSError *error))completionHandler {
    [[self updatePreset:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertUpdatePresetResponse *> * _Nonnull task) {
        AWSMediaconvertUpdatePresetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMediaconvertUpdateQueueResponse *> *)updateQueue:(AWSMediaconvertUpdateQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2017-08-29/queues/{name}"
                  targetPrefix:@""
                 operationName:@"UpdateQueue"
                   outputClass:[AWSMediaconvertUpdateQueueResponse class]];
}

- (void)updateQueue:(AWSMediaconvertUpdateQueueRequest *)request
     completionHandler:(void (^)(AWSMediaconvertUpdateQueueResponse *response, NSError *error))completionHandler {
    [[self updateQueue:request] continueWithBlock:^id _Nullable(AWSTask<AWSMediaconvertUpdateQueueResponse *> * _Nonnull task) {
        AWSMediaconvertUpdateQueueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
