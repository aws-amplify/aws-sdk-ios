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

#import "AWSmediaconvertService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSmediaconvertResources.h"

static NSString *const AWSInfomediaconvert = @"mediaconvert";
NSString *const AWSmediaconvertSDKVersion = @"2.13.2";


@interface AWSmediaconvertResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSmediaconvertResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSmediaconvertErrorBadRequest),
                            @"ConflictException" : @(AWSmediaconvertErrorConflict),
                            @"ForbiddenException" : @(AWSmediaconvertErrorForbidden),
                            @"InternalServerErrorException" : @(AWSmediaconvertErrorInternalServerError),
                            @"NotFoundException" : @(AWSmediaconvertErrorNotFound),
                            @"TooManyRequestsException" : @(AWSmediaconvertErrorTooManyRequests),
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
                    *error = [NSError errorWithDomain:AWSmediaconvertErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSmediaconvertErrorDomain
                                                 code:AWSmediaconvertErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSmediaconvertErrorDomain
                                     code:AWSmediaconvertErrorUnknown
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

@interface AWSmediaconvertRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSmediaconvertRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSmediaconvert()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSmediaconvert

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSmediaconvertSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSmediaconvert versions need to match. Check your SDK installation. AWSCore: %@ AWSmediaconvert: %@", AWSiOSSDKVersion, AWSmediaconvertSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultmediaconvert {
    static AWSmediaconvert *_defaultmediaconvert = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfomediaconvert];
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
        _defaultmediaconvert = [[AWSmediaconvert alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultmediaconvert;
}

+ (void)registermediaconvertWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSmediaconvert alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)mediaconvertForKey:(NSString *)key {
    @synchronized(self) {
        AWSmediaconvert *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfomediaconvert
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSmediaconvert registermediaconvertWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removemediaconvertForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultmediaconvert` or `+ mediaconvertForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicemediaconvert
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicemediaconvert];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSmediaconvertRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSmediaconvertResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSmediaconvertResponseSerializer alloc] initWithJSONDefinition:[[AWSmediaconvertResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSmediaconvertAssociateCertificateResponse *> *)associateCertificate:(AWSmediaconvertAssociateCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/certificates"
                  targetPrefix:@""
                 operationName:@"AssociateCertificate"
                   outputClass:[AWSmediaconvertAssociateCertificateResponse class]];
}

- (void)associateCertificate:(AWSmediaconvertAssociateCertificateRequest *)request
     completionHandler:(void (^)(AWSmediaconvertAssociateCertificateResponse *response, NSError *error))completionHandler {
    [[self associateCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertAssociateCertificateResponse *> * _Nonnull task) {
        AWSmediaconvertAssociateCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertCancelJobResponse *> *)cancelJob:(AWSmediaconvertCancelJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-08-29/jobs/{id}"
                  targetPrefix:@""
                 operationName:@"CancelJob"
                   outputClass:[AWSmediaconvertCancelJobResponse class]];
}

- (void)cancelJob:(AWSmediaconvertCancelJobRequest *)request
     completionHandler:(void (^)(AWSmediaconvertCancelJobResponse *response, NSError *error))completionHandler {
    [[self cancelJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertCancelJobResponse *> * _Nonnull task) {
        AWSmediaconvertCancelJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertCreateJobResponse *> *)createJob:(AWSmediaconvertCreateJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/jobs"
                  targetPrefix:@""
                 operationName:@"CreateJob"
                   outputClass:[AWSmediaconvertCreateJobResponse class]];
}

- (void)createJob:(AWSmediaconvertCreateJobRequest *)request
     completionHandler:(void (^)(AWSmediaconvertCreateJobResponse *response, NSError *error))completionHandler {
    [[self createJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertCreateJobResponse *> * _Nonnull task) {
        AWSmediaconvertCreateJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertCreateJobTemplateResponse *> *)createJobTemplate:(AWSmediaconvertCreateJobTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/jobTemplates"
                  targetPrefix:@""
                 operationName:@"CreateJobTemplate"
                   outputClass:[AWSmediaconvertCreateJobTemplateResponse class]];
}

- (void)createJobTemplate:(AWSmediaconvertCreateJobTemplateRequest *)request
     completionHandler:(void (^)(AWSmediaconvertCreateJobTemplateResponse *response, NSError *error))completionHandler {
    [[self createJobTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertCreateJobTemplateResponse *> * _Nonnull task) {
        AWSmediaconvertCreateJobTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertCreatePresetResponse *> *)createPreset:(AWSmediaconvertCreatePresetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/presets"
                  targetPrefix:@""
                 operationName:@"CreatePreset"
                   outputClass:[AWSmediaconvertCreatePresetResponse class]];
}

- (void)createPreset:(AWSmediaconvertCreatePresetRequest *)request
     completionHandler:(void (^)(AWSmediaconvertCreatePresetResponse *response, NSError *error))completionHandler {
    [[self createPreset:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertCreatePresetResponse *> * _Nonnull task) {
        AWSmediaconvertCreatePresetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertCreateQueueResponse *> *)createQueue:(AWSmediaconvertCreateQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/queues"
                  targetPrefix:@""
                 operationName:@"CreateQueue"
                   outputClass:[AWSmediaconvertCreateQueueResponse class]];
}

- (void)createQueue:(AWSmediaconvertCreateQueueRequest *)request
     completionHandler:(void (^)(AWSmediaconvertCreateQueueResponse *response, NSError *error))completionHandler {
    [[self createQueue:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertCreateQueueResponse *> * _Nonnull task) {
        AWSmediaconvertCreateQueueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertDeleteJobTemplateResponse *> *)deleteJobTemplate:(AWSmediaconvertDeleteJobTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-08-29/jobTemplates/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteJobTemplate"
                   outputClass:[AWSmediaconvertDeleteJobTemplateResponse class]];
}

- (void)deleteJobTemplate:(AWSmediaconvertDeleteJobTemplateRequest *)request
     completionHandler:(void (^)(AWSmediaconvertDeleteJobTemplateResponse *response, NSError *error))completionHandler {
    [[self deleteJobTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertDeleteJobTemplateResponse *> * _Nonnull task) {
        AWSmediaconvertDeleteJobTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertDeletePresetResponse *> *)deletePreset:(AWSmediaconvertDeletePresetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-08-29/presets/{name}"
                  targetPrefix:@""
                 operationName:@"DeletePreset"
                   outputClass:[AWSmediaconvertDeletePresetResponse class]];
}

- (void)deletePreset:(AWSmediaconvertDeletePresetRequest *)request
     completionHandler:(void (^)(AWSmediaconvertDeletePresetResponse *response, NSError *error))completionHandler {
    [[self deletePreset:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertDeletePresetResponse *> * _Nonnull task) {
        AWSmediaconvertDeletePresetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertDeleteQueueResponse *> *)deleteQueue:(AWSmediaconvertDeleteQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-08-29/queues/{name}"
                  targetPrefix:@""
                 operationName:@"DeleteQueue"
                   outputClass:[AWSmediaconvertDeleteQueueResponse class]];
}

- (void)deleteQueue:(AWSmediaconvertDeleteQueueRequest *)request
     completionHandler:(void (^)(AWSmediaconvertDeleteQueueResponse *response, NSError *error))completionHandler {
    [[self deleteQueue:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertDeleteQueueResponse *> * _Nonnull task) {
        AWSmediaconvertDeleteQueueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertDescribeEndpointsResponse *> *)describeEndpoints:(AWSmediaconvertDescribeEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/endpoints"
                  targetPrefix:@""
                 operationName:@"DescribeEndpoints"
                   outputClass:[AWSmediaconvertDescribeEndpointsResponse class]];
}

- (void)describeEndpoints:(AWSmediaconvertDescribeEndpointsRequest *)request
     completionHandler:(void (^)(AWSmediaconvertDescribeEndpointsResponse *response, NSError *error))completionHandler {
    [[self describeEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertDescribeEndpointsResponse *> * _Nonnull task) {
        AWSmediaconvertDescribeEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertDisassociateCertificateResponse *> *)disassociateCertificate:(AWSmediaconvertDisassociateCertificateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/2017-08-29/certificates/{arn}"
                  targetPrefix:@""
                 operationName:@"DisassociateCertificate"
                   outputClass:[AWSmediaconvertDisassociateCertificateResponse class]];
}

- (void)disassociateCertificate:(AWSmediaconvertDisassociateCertificateRequest *)request
     completionHandler:(void (^)(AWSmediaconvertDisassociateCertificateResponse *response, NSError *error))completionHandler {
    [[self disassociateCertificate:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertDisassociateCertificateResponse *> * _Nonnull task) {
        AWSmediaconvertDisassociateCertificateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertGetJobResponse *> *)getJob:(AWSmediaconvertGetJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/jobs/{id}"
                  targetPrefix:@""
                 operationName:@"GetJob"
                   outputClass:[AWSmediaconvertGetJobResponse class]];
}

- (void)getJob:(AWSmediaconvertGetJobRequest *)request
     completionHandler:(void (^)(AWSmediaconvertGetJobResponse *response, NSError *error))completionHandler {
    [[self getJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertGetJobResponse *> * _Nonnull task) {
        AWSmediaconvertGetJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertGetJobTemplateResponse *> *)getJobTemplate:(AWSmediaconvertGetJobTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/jobTemplates/{name}"
                  targetPrefix:@""
                 operationName:@"GetJobTemplate"
                   outputClass:[AWSmediaconvertGetJobTemplateResponse class]];
}

- (void)getJobTemplate:(AWSmediaconvertGetJobTemplateRequest *)request
     completionHandler:(void (^)(AWSmediaconvertGetJobTemplateResponse *response, NSError *error))completionHandler {
    [[self getJobTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertGetJobTemplateResponse *> * _Nonnull task) {
        AWSmediaconvertGetJobTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertGetPresetResponse *> *)getPreset:(AWSmediaconvertGetPresetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/presets/{name}"
                  targetPrefix:@""
                 operationName:@"GetPreset"
                   outputClass:[AWSmediaconvertGetPresetResponse class]];
}

- (void)getPreset:(AWSmediaconvertGetPresetRequest *)request
     completionHandler:(void (^)(AWSmediaconvertGetPresetResponse *response, NSError *error))completionHandler {
    [[self getPreset:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertGetPresetResponse *> * _Nonnull task) {
        AWSmediaconvertGetPresetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertGetQueueResponse *> *)getQueue:(AWSmediaconvertGetQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/queues/{name}"
                  targetPrefix:@""
                 operationName:@"GetQueue"
                   outputClass:[AWSmediaconvertGetQueueResponse class]];
}

- (void)getQueue:(AWSmediaconvertGetQueueRequest *)request
     completionHandler:(void (^)(AWSmediaconvertGetQueueResponse *response, NSError *error))completionHandler {
    [[self getQueue:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertGetQueueResponse *> * _Nonnull task) {
        AWSmediaconvertGetQueueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertListJobTemplatesResponse *> *)listJobTemplates:(AWSmediaconvertListJobTemplatesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/jobTemplates"
                  targetPrefix:@""
                 operationName:@"ListJobTemplates"
                   outputClass:[AWSmediaconvertListJobTemplatesResponse class]];
}

- (void)listJobTemplates:(AWSmediaconvertListJobTemplatesRequest *)request
     completionHandler:(void (^)(AWSmediaconvertListJobTemplatesResponse *response, NSError *error))completionHandler {
    [[self listJobTemplates:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertListJobTemplatesResponse *> * _Nonnull task) {
        AWSmediaconvertListJobTemplatesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertListJobsResponse *> *)listJobs:(AWSmediaconvertListJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/jobs"
                  targetPrefix:@""
                 operationName:@"ListJobs"
                   outputClass:[AWSmediaconvertListJobsResponse class]];
}

- (void)listJobs:(AWSmediaconvertListJobsRequest *)request
     completionHandler:(void (^)(AWSmediaconvertListJobsResponse *response, NSError *error))completionHandler {
    [[self listJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertListJobsResponse *> * _Nonnull task) {
        AWSmediaconvertListJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertListPresetsResponse *> *)listPresets:(AWSmediaconvertListPresetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/presets"
                  targetPrefix:@""
                 operationName:@"ListPresets"
                   outputClass:[AWSmediaconvertListPresetsResponse class]];
}

- (void)listPresets:(AWSmediaconvertListPresetsRequest *)request
     completionHandler:(void (^)(AWSmediaconvertListPresetsResponse *response, NSError *error))completionHandler {
    [[self listPresets:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertListPresetsResponse *> * _Nonnull task) {
        AWSmediaconvertListPresetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertListQueuesResponse *> *)listQueues:(AWSmediaconvertListQueuesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/queues"
                  targetPrefix:@""
                 operationName:@"ListQueues"
                   outputClass:[AWSmediaconvertListQueuesResponse class]];
}

- (void)listQueues:(AWSmediaconvertListQueuesRequest *)request
     completionHandler:(void (^)(AWSmediaconvertListQueuesResponse *response, NSError *error))completionHandler {
    [[self listQueues:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertListQueuesResponse *> * _Nonnull task) {
        AWSmediaconvertListQueuesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertListTagsForResourceResponse *> *)listTagsForResource:(AWSmediaconvertListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/2017-08-29/tags/{arn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSmediaconvertListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSmediaconvertListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSmediaconvertListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertListTagsForResourceResponse *> * _Nonnull task) {
        AWSmediaconvertListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertTagResourceResponse *> *)tagResource:(AWSmediaconvertTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/2017-08-29/tags"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSmediaconvertTagResourceResponse class]];
}

- (void)tagResource:(AWSmediaconvertTagResourceRequest *)request
     completionHandler:(void (^)(AWSmediaconvertTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertTagResourceResponse *> * _Nonnull task) {
        AWSmediaconvertTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertUntagResourceResponse *> *)untagResource:(AWSmediaconvertUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2017-08-29/tags/{arn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSmediaconvertUntagResourceResponse class]];
}

- (void)untagResource:(AWSmediaconvertUntagResourceRequest *)request
     completionHandler:(void (^)(AWSmediaconvertUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertUntagResourceResponse *> * _Nonnull task) {
        AWSmediaconvertUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertUpdateJobTemplateResponse *> *)updateJobTemplate:(AWSmediaconvertUpdateJobTemplateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2017-08-29/jobTemplates/{name}"
                  targetPrefix:@""
                 operationName:@"UpdateJobTemplate"
                   outputClass:[AWSmediaconvertUpdateJobTemplateResponse class]];
}

- (void)updateJobTemplate:(AWSmediaconvertUpdateJobTemplateRequest *)request
     completionHandler:(void (^)(AWSmediaconvertUpdateJobTemplateResponse *response, NSError *error))completionHandler {
    [[self updateJobTemplate:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertUpdateJobTemplateResponse *> * _Nonnull task) {
        AWSmediaconvertUpdateJobTemplateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertUpdatePresetResponse *> *)updatePreset:(AWSmediaconvertUpdatePresetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2017-08-29/presets/{name}"
                  targetPrefix:@""
                 operationName:@"UpdatePreset"
                   outputClass:[AWSmediaconvertUpdatePresetResponse class]];
}

- (void)updatePreset:(AWSmediaconvertUpdatePresetRequest *)request
     completionHandler:(void (^)(AWSmediaconvertUpdatePresetResponse *response, NSError *error))completionHandler {
    [[self updatePreset:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertUpdatePresetResponse *> * _Nonnull task) {
        AWSmediaconvertUpdatePresetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmediaconvertUpdateQueueResponse *> *)updateQueue:(AWSmediaconvertUpdateQueueRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/2017-08-29/queues/{name}"
                  targetPrefix:@""
                 operationName:@"UpdateQueue"
                   outputClass:[AWSmediaconvertUpdateQueueResponse class]];
}

- (void)updateQueue:(AWSmediaconvertUpdateQueueRequest *)request
     completionHandler:(void (^)(AWSmediaconvertUpdateQueueResponse *response, NSError *error))completionHandler {
    [[self updateQueue:request] continueWithBlock:^id _Nullable(AWSTask<AWSmediaconvertUpdateQueueResponse *> * _Nonnull task) {
        AWSmediaconvertUpdateQueueResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
