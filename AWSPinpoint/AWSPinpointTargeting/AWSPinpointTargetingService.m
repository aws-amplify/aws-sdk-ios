//
// Copyright 2010-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSPinpointTargetingService.h"
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSPinpointTargetingResources.h"

static NSString *const AWSInfoPinpointTargeting = @"PinpointTargeting";
NSString *const AWSPinpointTargetingSDKVersion = @"2.9.9";


@interface AWSPinpointTargetingResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSPinpointTargetingResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSPinpointTargetingErrorBadRequest),
                            @"ForbiddenException" : @(AWSPinpointTargetingErrorForbidden),
                            @"InternalServerErrorException" : @(AWSPinpointTargetingErrorInternalServerError),
                            @"MethodNotAllowedException" : @(AWSPinpointTargetingErrorMethodNotAllowed),
                            @"NotFoundException" : @(AWSPinpointTargetingErrorNotFound),
                            @"TooManyRequestsException" : @(AWSPinpointTargetingErrorTooManyRequests),
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

	if (*error) {
        NSMutableDictionary *richUserInfo = [NSMutableDictionary dictionaryWithDictionary:(*error).userInfo];
        [richUserInfo setObject:@"responseStatusCode" forKey:@([response statusCode])];
        [richUserInfo setObject:@"responseHeaders" forKey:[response allHeaderFields]];
        [richUserInfo setObject:@"responseDataSize" forKey:@(data?[data length]:0)];
        *error = [NSError errorWithDomain:(*error).domain
                                     code:(*error).code
                                 userInfo:richUserInfo];
        
    }
    
    if (!*error && [responseObject isKindOfClass:[NSDictionary class]]) {
        NSString *errorTypeHeader = [[[[response allHeaderFields] objectForKey:@"x-amzn-ErrorType"] componentsSeparatedByString:@":"] firstObject];
        
        //server may also return error message in the body, need to catch it.
        if (errorTypeHeader == nil) {
            errorTypeHeader = [responseObject objectForKey:@"__type"];
        }
        
        if (errorCodeDictionary[[[errorTypeHeader componentsSeparatedByString:@"#"] lastObject]]) {
            if (error) {
                NSMutableDictionary *userInfo = [@{
                                                   NSLocalizedFailureReasonErrorKey : errorTypeHeader,
                                                   @"responseStatusCode" : @([response statusCode]),
                                                   @"responseHeaders" : [response allHeaderFields],
                                                   @"responseDataSize" : @(data?[data length]:0),
                                                   } mutableCopy];
                [userInfo addEntriesFromDictionary:responseObject];
                *error = [NSError errorWithDomain:AWSPinpointTargetingErrorDomain
                                             code:[[errorCodeDictionary objectForKey:[[errorTypeHeader componentsSeparatedByString:@"#"] lastObject]] integerValue]
                                         userInfo:userInfo];
            }
            return responseObject;
        } else if ([[errorTypeHeader componentsSeparatedByString:@"#"] lastObject]) {
            if (error) {
                NSMutableDictionary *userInfo = [@{
                                                   NSLocalizedFailureReasonErrorKey : errorTypeHeader,
                                                   @"responseStatusCode" : @([response statusCode]),
                                                   @"responseHeaders" : [response allHeaderFields],
                                                   @"responseDataSize" : @(data?[data length]:0),
                                                   } mutableCopy];
                [userInfo addEntriesFromDictionary:responseObject];
                *error = [NSError errorWithDomain:AWSPinpointTargetingErrorDomain
                                             code:AWSPinpointTargetingErrorUnknown
                                         userInfo:userInfo];
            }
            return responseObject;
        } else if (response.statusCode/100 != 2) {
            //should be an error if not a 2xx response.
            if (error) {
                *error = [NSError errorWithDomain:AWSPinpointTargetingErrorDomain
                                             code:AWSPinpointTargetingErrorUnknown
                                         userInfo:responseObject];
            } 
            return responseObject;
        }
        
        
        if (self.outputClass) {
            responseObject = [AWSMTLJSONAdapter modelOfClass:self.outputClass
                                          fromJSONDictionary:responseObject
                                                       error:error];
        }
    }
    
    if (responseObject == nil ||
        ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject count] == 0)) {
        return @{@"responseStatusCode" : @([response statusCode]),
                 @"responseHeaders" : [response allHeaderFields],
                 @"responseDataSize" : @(data?[data length]:0),
                 };
    }
	
    return responseObject;
}

@end

@interface AWSPinpointTargetingRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSPinpointTargetingRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSPinpointTargeting()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSPinpointTargeting

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSPinpointTargetingSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSPinpointTargeting versions need to match. Check your SDK installation. AWSCore: %@ AWSPinpointTargeting: %@", AWSiOSSDKVersion, AWSPinpointTargetingSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultPinpointTargeting {
    static AWSPinpointTargeting *_defaultPinpointTargeting = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoPinpointTargeting];
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
        _defaultPinpointTargeting = [[AWSPinpointTargeting alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultPinpointTargeting;
}

+ (void)registerPinpointTargetingWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSPinpointTargeting alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)PinpointTargetingForKey:(NSString *)key {
    @synchronized(self) {
        AWSPinpointTargeting *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoPinpointTargeting
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSPinpointTargeting registerPinpointTargetingWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removePinpointTargetingForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultPinpointTargeting` or `+ PinpointTargetingForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceMobileTargeting
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceMobileTargeting];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSPinpointTargetingRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSPinpointTargetingResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSPinpointTargetingResponseSerializer alloc] initWithJSONDefinition:[[AWSPinpointTargetingResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSPinpointTargetingCreateAppResponse *> *)createApp:(AWSPinpointTargetingCreateAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps"
                  targetPrefix:@""
                 operationName:@"CreateApp"
                   outputClass:[AWSPinpointTargetingCreateAppResponse class]];
}

- (void)createApp:(AWSPinpointTargetingCreateAppRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingCreateAppResponse *response, NSError *error))completionHandler {
    [[self createApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingCreateAppResponse *> * _Nonnull task) {
        AWSPinpointTargetingCreateAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingCreateCampaignResponse *> *)createCampaign:(AWSPinpointTargetingCreateCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/campaigns"
                  targetPrefix:@""
                 operationName:@"CreateCampaign"
                   outputClass:[AWSPinpointTargetingCreateCampaignResponse class]];
}

- (void)createCampaign:(AWSPinpointTargetingCreateCampaignRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingCreateCampaignResponse *response, NSError *error))completionHandler {
    [[self createCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingCreateCampaignResponse *> * _Nonnull task) {
        AWSPinpointTargetingCreateCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingCreateExportJobResponse *> *)createExportJob:(AWSPinpointTargetingCreateExportJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/jobs/export"
                  targetPrefix:@""
                 operationName:@"CreateExportJob"
                   outputClass:[AWSPinpointTargetingCreateExportJobResponse class]];
}

- (void)createExportJob:(AWSPinpointTargetingCreateExportJobRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingCreateExportJobResponse *response, NSError *error))completionHandler {
    [[self createExportJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingCreateExportJobResponse *> * _Nonnull task) {
        AWSPinpointTargetingCreateExportJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingCreateImportJobResponse *> *)createImportJob:(AWSPinpointTargetingCreateImportJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/jobs/import"
                  targetPrefix:@""
                 operationName:@"CreateImportJob"
                   outputClass:[AWSPinpointTargetingCreateImportJobResponse class]];
}

- (void)createImportJob:(AWSPinpointTargetingCreateImportJobRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingCreateImportJobResponse *response, NSError *error))completionHandler {
    [[self createImportJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingCreateImportJobResponse *> * _Nonnull task) {
        AWSPinpointTargetingCreateImportJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingCreateSegmentResponse *> *)createSegment:(AWSPinpointTargetingCreateSegmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/segments"
                  targetPrefix:@""
                 operationName:@"CreateSegment"
                   outputClass:[AWSPinpointTargetingCreateSegmentResponse class]];
}

- (void)createSegment:(AWSPinpointTargetingCreateSegmentRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingCreateSegmentResponse *response, NSError *error))completionHandler {
    [[self createSegment:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingCreateSegmentResponse *> * _Nonnull task) {
        AWSPinpointTargetingCreateSegmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteAdmChannelResponse *> *)deleteAdmChannel:(AWSPinpointTargetingDeleteAdmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/adm"
                  targetPrefix:@""
                 operationName:@"DeleteAdmChannel"
                   outputClass:[AWSPinpointTargetingDeleteAdmChannelResponse class]];
}

- (void)deleteAdmChannel:(AWSPinpointTargetingDeleteAdmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteAdmChannelResponse *response, NSError *error))completionHandler {
    [[self deleteAdmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteAdmChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteAdmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteApnsChannelResponse *> *)deleteApnsChannel:(AWSPinpointTargetingDeleteApnsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/apns"
                  targetPrefix:@""
                 operationName:@"DeleteApnsChannel"
                   outputClass:[AWSPinpointTargetingDeleteApnsChannelResponse class]];
}

- (void)deleteApnsChannel:(AWSPinpointTargetingDeleteApnsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteApnsChannelResponse *response, NSError *error))completionHandler {
    [[self deleteApnsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteApnsChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteApnsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteApnsSandboxChannelResponse *> *)deleteApnsSandboxChannel:(AWSPinpointTargetingDeleteApnsSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/apns_sandbox"
                  targetPrefix:@""
                 operationName:@"DeleteApnsSandboxChannel"
                   outputClass:[AWSPinpointTargetingDeleteApnsSandboxChannelResponse class]];
}

- (void)deleteApnsSandboxChannel:(AWSPinpointTargetingDeleteApnsSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteApnsSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self deleteApnsSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteApnsSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteApnsSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteApnsVoipChannelResponse *> *)deleteApnsVoipChannel:(AWSPinpointTargetingDeleteApnsVoipChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip"
                  targetPrefix:@""
                 operationName:@"DeleteApnsVoipChannel"
                   outputClass:[AWSPinpointTargetingDeleteApnsVoipChannelResponse class]];
}

- (void)deleteApnsVoipChannel:(AWSPinpointTargetingDeleteApnsVoipChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteApnsVoipChannelResponse *response, NSError *error))completionHandler {
    [[self deleteApnsVoipChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteApnsVoipChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteApnsVoipChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse *> *)deleteApnsVoipSandboxChannel:(AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip_sandbox"
                  targetPrefix:@""
                 operationName:@"DeleteApnsVoipSandboxChannel"
                   outputClass:[AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse class]];
}

- (void)deleteApnsVoipSandboxChannel:(AWSPinpointTargetingDeleteApnsVoipSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self deleteApnsVoipSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteApnsVoipSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteAppResponse *> *)deleteApp:(AWSPinpointTargetingDeleteAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}"
                  targetPrefix:@""
                 operationName:@"DeleteApp"
                   outputClass:[AWSPinpointTargetingDeleteAppResponse class]];
}

- (void)deleteApp:(AWSPinpointTargetingDeleteAppRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteAppResponse *response, NSError *error))completionHandler {
    [[self deleteApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteAppResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteBaiduChannelResponse *> *)deleteBaiduChannel:(AWSPinpointTargetingDeleteBaiduChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/baidu"
                  targetPrefix:@""
                 operationName:@"DeleteBaiduChannel"
                   outputClass:[AWSPinpointTargetingDeleteBaiduChannelResponse class]];
}

- (void)deleteBaiduChannel:(AWSPinpointTargetingDeleteBaiduChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteBaiduChannelResponse *response, NSError *error))completionHandler {
    [[self deleteBaiduChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteBaiduChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteBaiduChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteCampaignResponse *> *)deleteCampaign:(AWSPinpointTargetingDeleteCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}"
                  targetPrefix:@""
                 operationName:@"DeleteCampaign"
                   outputClass:[AWSPinpointTargetingDeleteCampaignResponse class]];
}

- (void)deleteCampaign:(AWSPinpointTargetingDeleteCampaignRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteCampaignResponse *response, NSError *error))completionHandler {
    [[self deleteCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteCampaignResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteEmailChannelResponse *> *)deleteEmailChannel:(AWSPinpointTargetingDeleteEmailChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/email"
                  targetPrefix:@""
                 operationName:@"DeleteEmailChannel"
                   outputClass:[AWSPinpointTargetingDeleteEmailChannelResponse class]];
}

- (void)deleteEmailChannel:(AWSPinpointTargetingDeleteEmailChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteEmailChannelResponse *response, NSError *error))completionHandler {
    [[self deleteEmailChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteEmailChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteEmailChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteEndpointResponse *> *)deleteEndpoint:(AWSPinpointTargetingDeleteEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/endpoints/{endpoint-id}"
                  targetPrefix:@""
                 operationName:@"DeleteEndpoint"
                   outputClass:[AWSPinpointTargetingDeleteEndpointResponse class]];
}

- (void)deleteEndpoint:(AWSPinpointTargetingDeleteEndpointRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteEndpointResponse *response, NSError *error))completionHandler {
    [[self deleteEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteEndpointResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteEventStreamResponse *> *)deleteEventStream:(AWSPinpointTargetingDeleteEventStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/eventstream"
                  targetPrefix:@""
                 operationName:@"DeleteEventStream"
                   outputClass:[AWSPinpointTargetingDeleteEventStreamResponse class]];
}

- (void)deleteEventStream:(AWSPinpointTargetingDeleteEventStreamRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteEventStreamResponse *response, NSError *error))completionHandler {
    [[self deleteEventStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteEventStreamResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteEventStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteGcmChannelResponse *> *)deleteGcmChannel:(AWSPinpointTargetingDeleteGcmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/gcm"
                  targetPrefix:@""
                 operationName:@"DeleteGcmChannel"
                   outputClass:[AWSPinpointTargetingDeleteGcmChannelResponse class]];
}

- (void)deleteGcmChannel:(AWSPinpointTargetingDeleteGcmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteGcmChannelResponse *response, NSError *error))completionHandler {
    [[self deleteGcmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteGcmChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteGcmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteSegmentResponse *> *)deleteSegment:(AWSPinpointTargetingDeleteSegmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}"
                  targetPrefix:@""
                 operationName:@"DeleteSegment"
                   outputClass:[AWSPinpointTargetingDeleteSegmentResponse class]];
}

- (void)deleteSegment:(AWSPinpointTargetingDeleteSegmentRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteSegmentResponse *response, NSError *error))completionHandler {
    [[self deleteSegment:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteSegmentResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteSegmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteSmsChannelResponse *> *)deleteSmsChannel:(AWSPinpointTargetingDeleteSmsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/sms"
                  targetPrefix:@""
                 operationName:@"DeleteSmsChannel"
                   outputClass:[AWSPinpointTargetingDeleteSmsChannelResponse class]];
}

- (void)deleteSmsChannel:(AWSPinpointTargetingDeleteSmsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteSmsChannelResponse *response, NSError *error))completionHandler {
    [[self deleteSmsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteSmsChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteSmsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteUserEndpointsResponse *> *)deleteUserEndpoints:(AWSPinpointTargetingDeleteUserEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/users/{user-id}"
                  targetPrefix:@""
                 operationName:@"DeleteUserEndpoints"
                   outputClass:[AWSPinpointTargetingDeleteUserEndpointsResponse class]];
}

- (void)deleteUserEndpoints:(AWSPinpointTargetingDeleteUserEndpointsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteUserEndpointsResponse *response, NSError *error))completionHandler {
    [[self deleteUserEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteUserEndpointsResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteUserEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingDeleteVoiceChannelResponse *> *)deleteVoiceChannel:(AWSPinpointTargetingDeleteVoiceChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/apps/{application-id}/channels/voice"
                  targetPrefix:@""
                 operationName:@"DeleteVoiceChannel"
                   outputClass:[AWSPinpointTargetingDeleteVoiceChannelResponse class]];
}

- (void)deleteVoiceChannel:(AWSPinpointTargetingDeleteVoiceChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingDeleteVoiceChannelResponse *response, NSError *error))completionHandler {
    [[self deleteVoiceChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingDeleteVoiceChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingDeleteVoiceChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetAdmChannelResponse *> *)getAdmChannel:(AWSPinpointTargetingGetAdmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/adm"
                  targetPrefix:@""
                 operationName:@"GetAdmChannel"
                   outputClass:[AWSPinpointTargetingGetAdmChannelResponse class]];
}

- (void)getAdmChannel:(AWSPinpointTargetingGetAdmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetAdmChannelResponse *response, NSError *error))completionHandler {
    [[self getAdmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetAdmChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetAdmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetApnsChannelResponse *> *)getApnsChannel:(AWSPinpointTargetingGetApnsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/apns"
                  targetPrefix:@""
                 operationName:@"GetApnsChannel"
                   outputClass:[AWSPinpointTargetingGetApnsChannelResponse class]];
}

- (void)getApnsChannel:(AWSPinpointTargetingGetApnsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetApnsChannelResponse *response, NSError *error))completionHandler {
    [[self getApnsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetApnsChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetApnsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetApnsSandboxChannelResponse *> *)getApnsSandboxChannel:(AWSPinpointTargetingGetApnsSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/apns_sandbox"
                  targetPrefix:@""
                 operationName:@"GetApnsSandboxChannel"
                   outputClass:[AWSPinpointTargetingGetApnsSandboxChannelResponse class]];
}

- (void)getApnsSandboxChannel:(AWSPinpointTargetingGetApnsSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetApnsSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self getApnsSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetApnsSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetApnsSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetApnsVoipChannelResponse *> *)getApnsVoipChannel:(AWSPinpointTargetingGetApnsVoipChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip"
                  targetPrefix:@""
                 operationName:@"GetApnsVoipChannel"
                   outputClass:[AWSPinpointTargetingGetApnsVoipChannelResponse class]];
}

- (void)getApnsVoipChannel:(AWSPinpointTargetingGetApnsVoipChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetApnsVoipChannelResponse *response, NSError *error))completionHandler {
    [[self getApnsVoipChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetApnsVoipChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetApnsVoipChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetApnsVoipSandboxChannelResponse *> *)getApnsVoipSandboxChannel:(AWSPinpointTargetingGetApnsVoipSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip_sandbox"
                  targetPrefix:@""
                 operationName:@"GetApnsVoipSandboxChannel"
                   outputClass:[AWSPinpointTargetingGetApnsVoipSandboxChannelResponse class]];
}

- (void)getApnsVoipSandboxChannel:(AWSPinpointTargetingGetApnsVoipSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetApnsVoipSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self getApnsVoipSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetApnsVoipSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetApnsVoipSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetAppResponse *> *)getApp:(AWSPinpointTargetingGetAppRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}"
                  targetPrefix:@""
                 operationName:@"GetApp"
                   outputClass:[AWSPinpointTargetingGetAppResponse class]];
}

- (void)getApp:(AWSPinpointTargetingGetAppRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetAppResponse *response, NSError *error))completionHandler {
    [[self getApp:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetAppResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetAppResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetApplicationSettingsResponse *> *)getApplicationSettings:(AWSPinpointTargetingGetApplicationSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/settings"
                  targetPrefix:@""
                 operationName:@"GetApplicationSettings"
                   outputClass:[AWSPinpointTargetingGetApplicationSettingsResponse class]];
}

- (void)getApplicationSettings:(AWSPinpointTargetingGetApplicationSettingsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetApplicationSettingsResponse *response, NSError *error))completionHandler {
    [[self getApplicationSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetApplicationSettingsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetApplicationSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetAppsResponse *> *)getApps:(AWSPinpointTargetingGetAppsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps"
                  targetPrefix:@""
                 operationName:@"GetApps"
                   outputClass:[AWSPinpointTargetingGetAppsResponse class]];
}

- (void)getApps:(AWSPinpointTargetingGetAppsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetAppsResponse *response, NSError *error))completionHandler {
    [[self getApps:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetAppsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetAppsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetBaiduChannelResponse *> *)getBaiduChannel:(AWSPinpointTargetingGetBaiduChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/baidu"
                  targetPrefix:@""
                 operationName:@"GetBaiduChannel"
                   outputClass:[AWSPinpointTargetingGetBaiduChannelResponse class]];
}

- (void)getBaiduChannel:(AWSPinpointTargetingGetBaiduChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetBaiduChannelResponse *response, NSError *error))completionHandler {
    [[self getBaiduChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetBaiduChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetBaiduChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetCampaignResponse *> *)getCampaign:(AWSPinpointTargetingGetCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}"
                  targetPrefix:@""
                 operationName:@"GetCampaign"
                   outputClass:[AWSPinpointTargetingGetCampaignResponse class]];
}

- (void)getCampaign:(AWSPinpointTargetingGetCampaignRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetCampaignResponse *response, NSError *error))completionHandler {
    [[self getCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetCampaignResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetCampaignActivitiesResponse *> *)getCampaignActivities:(AWSPinpointTargetingGetCampaignActivitiesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}/activities"
                  targetPrefix:@""
                 operationName:@"GetCampaignActivities"
                   outputClass:[AWSPinpointTargetingGetCampaignActivitiesResponse class]];
}

- (void)getCampaignActivities:(AWSPinpointTargetingGetCampaignActivitiesRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetCampaignActivitiesResponse *response, NSError *error))completionHandler {
    [[self getCampaignActivities:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetCampaignActivitiesResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetCampaignActivitiesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetCampaignVersionResponse *> *)getCampaignVersion:(AWSPinpointTargetingGetCampaignVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}/versions/{version}"
                  targetPrefix:@""
                 operationName:@"GetCampaignVersion"
                   outputClass:[AWSPinpointTargetingGetCampaignVersionResponse class]];
}

- (void)getCampaignVersion:(AWSPinpointTargetingGetCampaignVersionRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetCampaignVersionResponse *response, NSError *error))completionHandler {
    [[self getCampaignVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetCampaignVersionResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetCampaignVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetCampaignVersionsResponse *> *)getCampaignVersions:(AWSPinpointTargetingGetCampaignVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}/versions"
                  targetPrefix:@""
                 operationName:@"GetCampaignVersions"
                   outputClass:[AWSPinpointTargetingGetCampaignVersionsResponse class]];
}

- (void)getCampaignVersions:(AWSPinpointTargetingGetCampaignVersionsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetCampaignVersionsResponse *response, NSError *error))completionHandler {
    [[self getCampaignVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetCampaignVersionsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetCampaignVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetCampaignsResponse *> *)getCampaigns:(AWSPinpointTargetingGetCampaignsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/campaigns"
                  targetPrefix:@""
                 operationName:@"GetCampaigns"
                   outputClass:[AWSPinpointTargetingGetCampaignsResponse class]];
}

- (void)getCampaigns:(AWSPinpointTargetingGetCampaignsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetCampaignsResponse *response, NSError *error))completionHandler {
    [[self getCampaigns:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetCampaignsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetCampaignsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetChannelsResponse *> *)getChannels:(AWSPinpointTargetingGetChannelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels"
                  targetPrefix:@""
                 operationName:@"GetChannels"
                   outputClass:[AWSPinpointTargetingGetChannelsResponse class]];
}

- (void)getChannels:(AWSPinpointTargetingGetChannelsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetChannelsResponse *response, NSError *error))completionHandler {
    [[self getChannels:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetChannelsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetChannelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetEmailChannelResponse *> *)getEmailChannel:(AWSPinpointTargetingGetEmailChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/email"
                  targetPrefix:@""
                 operationName:@"GetEmailChannel"
                   outputClass:[AWSPinpointTargetingGetEmailChannelResponse class]];
}

- (void)getEmailChannel:(AWSPinpointTargetingGetEmailChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetEmailChannelResponse *response, NSError *error))completionHandler {
    [[self getEmailChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetEmailChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetEmailChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetEndpointResponse *> *)getEndpoint:(AWSPinpointTargetingGetEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/endpoints/{endpoint-id}"
                  targetPrefix:@""
                 operationName:@"GetEndpoint"
                   outputClass:[AWSPinpointTargetingGetEndpointResponse class]];
}

- (void)getEndpoint:(AWSPinpointTargetingGetEndpointRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetEndpointResponse *response, NSError *error))completionHandler {
    [[self getEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetEndpointResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetEventStreamResponse *> *)getEventStream:(AWSPinpointTargetingGetEventStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/eventstream"
                  targetPrefix:@""
                 operationName:@"GetEventStream"
                   outputClass:[AWSPinpointTargetingGetEventStreamResponse class]];
}

- (void)getEventStream:(AWSPinpointTargetingGetEventStreamRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetEventStreamResponse *response, NSError *error))completionHandler {
    [[self getEventStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetEventStreamResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetEventStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetExportJobResponse *> *)getExportJob:(AWSPinpointTargetingGetExportJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/jobs/export/{job-id}"
                  targetPrefix:@""
                 operationName:@"GetExportJob"
                   outputClass:[AWSPinpointTargetingGetExportJobResponse class]];
}

- (void)getExportJob:(AWSPinpointTargetingGetExportJobRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetExportJobResponse *response, NSError *error))completionHandler {
    [[self getExportJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetExportJobResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetExportJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetExportJobsResponse *> *)getExportJobs:(AWSPinpointTargetingGetExportJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/jobs/export"
                  targetPrefix:@""
                 operationName:@"GetExportJobs"
                   outputClass:[AWSPinpointTargetingGetExportJobsResponse class]];
}

- (void)getExportJobs:(AWSPinpointTargetingGetExportJobsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetExportJobsResponse *response, NSError *error))completionHandler {
    [[self getExportJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetExportJobsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetExportJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetGcmChannelResponse *> *)getGcmChannel:(AWSPinpointTargetingGetGcmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/gcm"
                  targetPrefix:@""
                 operationName:@"GetGcmChannel"
                   outputClass:[AWSPinpointTargetingGetGcmChannelResponse class]];
}

- (void)getGcmChannel:(AWSPinpointTargetingGetGcmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetGcmChannelResponse *response, NSError *error))completionHandler {
    [[self getGcmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetGcmChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetGcmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetImportJobResponse *> *)getImportJob:(AWSPinpointTargetingGetImportJobRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/jobs/import/{job-id}"
                  targetPrefix:@""
                 operationName:@"GetImportJob"
                   outputClass:[AWSPinpointTargetingGetImportJobResponse class]];
}

- (void)getImportJob:(AWSPinpointTargetingGetImportJobRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetImportJobResponse *response, NSError *error))completionHandler {
    [[self getImportJob:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetImportJobResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetImportJobResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetImportJobsResponse *> *)getImportJobs:(AWSPinpointTargetingGetImportJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/jobs/import"
                  targetPrefix:@""
                 operationName:@"GetImportJobs"
                   outputClass:[AWSPinpointTargetingGetImportJobsResponse class]];
}

- (void)getImportJobs:(AWSPinpointTargetingGetImportJobsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetImportJobsResponse *response, NSError *error))completionHandler {
    [[self getImportJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetImportJobsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetImportJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetSegmentResponse *> *)getSegment:(AWSPinpointTargetingGetSegmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}"
                  targetPrefix:@""
                 operationName:@"GetSegment"
                   outputClass:[AWSPinpointTargetingGetSegmentResponse class]];
}

- (void)getSegment:(AWSPinpointTargetingGetSegmentRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetSegmentResponse *response, NSError *error))completionHandler {
    [[self getSegment:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetSegmentResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetSegmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetSegmentExportJobsResponse *> *)getSegmentExportJobs:(AWSPinpointTargetingGetSegmentExportJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}/jobs/export"
                  targetPrefix:@""
                 operationName:@"GetSegmentExportJobs"
                   outputClass:[AWSPinpointTargetingGetSegmentExportJobsResponse class]];
}

- (void)getSegmentExportJobs:(AWSPinpointTargetingGetSegmentExportJobsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetSegmentExportJobsResponse *response, NSError *error))completionHandler {
    [[self getSegmentExportJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetSegmentExportJobsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetSegmentExportJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetSegmentImportJobsResponse *> *)getSegmentImportJobs:(AWSPinpointTargetingGetSegmentImportJobsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}/jobs/import"
                  targetPrefix:@""
                 operationName:@"GetSegmentImportJobs"
                   outputClass:[AWSPinpointTargetingGetSegmentImportJobsResponse class]];
}

- (void)getSegmentImportJobs:(AWSPinpointTargetingGetSegmentImportJobsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetSegmentImportJobsResponse *response, NSError *error))completionHandler {
    [[self getSegmentImportJobs:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetSegmentImportJobsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetSegmentImportJobsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetSegmentVersionResponse *> *)getSegmentVersion:(AWSPinpointTargetingGetSegmentVersionRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}/versions/{version}"
                  targetPrefix:@""
                 operationName:@"GetSegmentVersion"
                   outputClass:[AWSPinpointTargetingGetSegmentVersionResponse class]];
}

- (void)getSegmentVersion:(AWSPinpointTargetingGetSegmentVersionRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetSegmentVersionResponse *response, NSError *error))completionHandler {
    [[self getSegmentVersion:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetSegmentVersionResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetSegmentVersionResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetSegmentVersionsResponse *> *)getSegmentVersions:(AWSPinpointTargetingGetSegmentVersionsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}/versions"
                  targetPrefix:@""
                 operationName:@"GetSegmentVersions"
                   outputClass:[AWSPinpointTargetingGetSegmentVersionsResponse class]];
}

- (void)getSegmentVersions:(AWSPinpointTargetingGetSegmentVersionsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetSegmentVersionsResponse *response, NSError *error))completionHandler {
    [[self getSegmentVersions:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetSegmentVersionsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetSegmentVersionsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetSegmentsResponse *> *)getSegments:(AWSPinpointTargetingGetSegmentsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/segments"
                  targetPrefix:@""
                 operationName:@"GetSegments"
                   outputClass:[AWSPinpointTargetingGetSegmentsResponse class]];
}

- (void)getSegments:(AWSPinpointTargetingGetSegmentsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetSegmentsResponse *response, NSError *error))completionHandler {
    [[self getSegments:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetSegmentsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetSegmentsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetSmsChannelResponse *> *)getSmsChannel:(AWSPinpointTargetingGetSmsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/sms"
                  targetPrefix:@""
                 operationName:@"GetSmsChannel"
                   outputClass:[AWSPinpointTargetingGetSmsChannelResponse class]];
}

- (void)getSmsChannel:(AWSPinpointTargetingGetSmsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetSmsChannelResponse *response, NSError *error))completionHandler {
    [[self getSmsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetSmsChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetSmsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetUserEndpointsResponse *> *)getUserEndpoints:(AWSPinpointTargetingGetUserEndpointsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/users/{user-id}"
                  targetPrefix:@""
                 operationName:@"GetUserEndpoints"
                   outputClass:[AWSPinpointTargetingGetUserEndpointsResponse class]];
}

- (void)getUserEndpoints:(AWSPinpointTargetingGetUserEndpointsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetUserEndpointsResponse *response, NSError *error))completionHandler {
    [[self getUserEndpoints:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetUserEndpointsResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetUserEndpointsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingGetVoiceChannelResponse *> *)getVoiceChannel:(AWSPinpointTargetingGetVoiceChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/apps/{application-id}/channels/voice"
                  targetPrefix:@""
                 operationName:@"GetVoiceChannel"
                   outputClass:[AWSPinpointTargetingGetVoiceChannelResponse class]];
}

- (void)getVoiceChannel:(AWSPinpointTargetingGetVoiceChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingGetVoiceChannelResponse *response, NSError *error))completionHandler {
    [[self getVoiceChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingGetVoiceChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingGetVoiceChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingListTagsForResourceResponse *> *)listTagsForResource:(AWSPinpointTargetingListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/v1/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSPinpointTargetingListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSPinpointTargetingListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingListTagsForResourceResponse *> * _Nonnull task) {
        AWSPinpointTargetingListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingPhoneNumberValidateResponse *> *)phoneNumberValidate:(AWSPinpointTargetingPhoneNumberValidateRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/phone/number/validate"
                  targetPrefix:@""
                 operationName:@"PhoneNumberValidate"
                   outputClass:[AWSPinpointTargetingPhoneNumberValidateResponse class]];
}

- (void)phoneNumberValidate:(AWSPinpointTargetingPhoneNumberValidateRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingPhoneNumberValidateResponse *response, NSError *error))completionHandler {
    [[self phoneNumberValidate:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingPhoneNumberValidateResponse *> * _Nonnull task) {
        AWSPinpointTargetingPhoneNumberValidateResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingPutEventStreamResponse *> *)putEventStream:(AWSPinpointTargetingPutEventStreamRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/eventstream"
                  targetPrefix:@""
                 operationName:@"PutEventStream"
                   outputClass:[AWSPinpointTargetingPutEventStreamResponse class]];
}

- (void)putEventStream:(AWSPinpointTargetingPutEventStreamRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingPutEventStreamResponse *response, NSError *error))completionHandler {
    [[self putEventStream:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingPutEventStreamResponse *> * _Nonnull task) {
        AWSPinpointTargetingPutEventStreamResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingPutEventsResponse *> *)putEvents:(AWSPinpointTargetingPutEventsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/events"
                  targetPrefix:@""
                 operationName:@"PutEvents"
                   outputClass:[AWSPinpointTargetingPutEventsResponse class]];
}

- (void)putEvents:(AWSPinpointTargetingPutEventsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingPutEventsResponse *response, NSError *error))completionHandler {
    [[self putEvents:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingPutEventsResponse *> * _Nonnull task) {
        AWSPinpointTargetingPutEventsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingRemoveAttributesResponse *> *)removeAttributes:(AWSPinpointTargetingRemoveAttributesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/attributes/{attribute-type}"
                  targetPrefix:@""
                 operationName:@"RemoveAttributes"
                   outputClass:[AWSPinpointTargetingRemoveAttributesResponse class]];
}

- (void)removeAttributes:(AWSPinpointTargetingRemoveAttributesRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingRemoveAttributesResponse *response, NSError *error))completionHandler {
    [[self removeAttributes:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingRemoveAttributesResponse *> * _Nonnull task) {
        AWSPinpointTargetingRemoveAttributesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingSendMessagesResponse *> *)sendMessages:(AWSPinpointTargetingSendMessagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/messages"
                  targetPrefix:@""
                 operationName:@"SendMessages"
                   outputClass:[AWSPinpointTargetingSendMessagesResponse class]];
}

- (void)sendMessages:(AWSPinpointTargetingSendMessagesRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingSendMessagesResponse *response, NSError *error))completionHandler {
    [[self sendMessages:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingSendMessagesResponse *> * _Nonnull task) {
        AWSPinpointTargetingSendMessagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingSendUsersMessagesResponse *> *)sendUsersMessages:(AWSPinpointTargetingSendUsersMessagesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/apps/{application-id}/users-messages"
                  targetPrefix:@""
                 operationName:@"SendUsersMessages"
                   outputClass:[AWSPinpointTargetingSendUsersMessagesResponse class]];
}

- (void)sendUsersMessages:(AWSPinpointTargetingSendUsersMessagesRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingSendUsersMessagesResponse *response, NSError *error))completionHandler {
    [[self sendUsersMessages:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingSendUsersMessagesResponse *> * _Nonnull task) {
        AWSPinpointTargetingSendUsersMessagesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)tagResource:(AWSPinpointTargetingTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/v1/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:nil];
}

- (void)tagResource:(AWSPinpointTargetingTagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask *)untagResource:(AWSPinpointTargetingUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/v1/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:nil];
}

- (void)untagResource:(AWSPinpointTargetingUntagResourceRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateAdmChannelResponse *> *)updateAdmChannel:(AWSPinpointTargetingUpdateAdmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/adm"
                  targetPrefix:@""
                 operationName:@"UpdateAdmChannel"
                   outputClass:[AWSPinpointTargetingUpdateAdmChannelResponse class]];
}

- (void)updateAdmChannel:(AWSPinpointTargetingUpdateAdmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateAdmChannelResponse *response, NSError *error))completionHandler {
    [[self updateAdmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateAdmChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateAdmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateApnsChannelResponse *> *)updateApnsChannel:(AWSPinpointTargetingUpdateApnsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/apns"
                  targetPrefix:@""
                 operationName:@"UpdateApnsChannel"
                   outputClass:[AWSPinpointTargetingUpdateApnsChannelResponse class]];
}

- (void)updateApnsChannel:(AWSPinpointTargetingUpdateApnsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateApnsChannelResponse *response, NSError *error))completionHandler {
    [[self updateApnsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateApnsChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateApnsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateApnsSandboxChannelResponse *> *)updateApnsSandboxChannel:(AWSPinpointTargetingUpdateApnsSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/apns_sandbox"
                  targetPrefix:@""
                 operationName:@"UpdateApnsSandboxChannel"
                   outputClass:[AWSPinpointTargetingUpdateApnsSandboxChannelResponse class]];
}

- (void)updateApnsSandboxChannel:(AWSPinpointTargetingUpdateApnsSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateApnsSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self updateApnsSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateApnsSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateApnsSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateApnsVoipChannelResponse *> *)updateApnsVoipChannel:(AWSPinpointTargetingUpdateApnsVoipChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip"
                  targetPrefix:@""
                 operationName:@"UpdateApnsVoipChannel"
                   outputClass:[AWSPinpointTargetingUpdateApnsVoipChannelResponse class]];
}

- (void)updateApnsVoipChannel:(AWSPinpointTargetingUpdateApnsVoipChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateApnsVoipChannelResponse *response, NSError *error))completionHandler {
    [[self updateApnsVoipChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateApnsVoipChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateApnsVoipChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse *> *)updateApnsVoipSandboxChannel:(AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/apns_voip_sandbox"
                  targetPrefix:@""
                 operationName:@"UpdateApnsVoipSandboxChannel"
                   outputClass:[AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse class]];
}

- (void)updateApnsVoipSandboxChannel:(AWSPinpointTargetingUpdateApnsVoipSandboxChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse *response, NSError *error))completionHandler {
    [[self updateApnsVoipSandboxChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateApnsVoipSandboxChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateApplicationSettingsResponse *> *)updateApplicationSettings:(AWSPinpointTargetingUpdateApplicationSettingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/settings"
                  targetPrefix:@""
                 operationName:@"UpdateApplicationSettings"
                   outputClass:[AWSPinpointTargetingUpdateApplicationSettingsResponse class]];
}

- (void)updateApplicationSettings:(AWSPinpointTargetingUpdateApplicationSettingsRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateApplicationSettingsResponse *response, NSError *error))completionHandler {
    [[self updateApplicationSettings:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateApplicationSettingsResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateApplicationSettingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateBaiduChannelResponse *> *)updateBaiduChannel:(AWSPinpointTargetingUpdateBaiduChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/baidu"
                  targetPrefix:@""
                 operationName:@"UpdateBaiduChannel"
                   outputClass:[AWSPinpointTargetingUpdateBaiduChannelResponse class]];
}

- (void)updateBaiduChannel:(AWSPinpointTargetingUpdateBaiduChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateBaiduChannelResponse *response, NSError *error))completionHandler {
    [[self updateBaiduChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateBaiduChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateBaiduChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateCampaignResponse *> *)updateCampaign:(AWSPinpointTargetingUpdateCampaignRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/campaigns/{campaign-id}"
                  targetPrefix:@""
                 operationName:@"UpdateCampaign"
                   outputClass:[AWSPinpointTargetingUpdateCampaignResponse class]];
}

- (void)updateCampaign:(AWSPinpointTargetingUpdateCampaignRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateCampaignResponse *response, NSError *error))completionHandler {
    [[self updateCampaign:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateCampaignResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateCampaignResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateEmailChannelResponse *> *)updateEmailChannel:(AWSPinpointTargetingUpdateEmailChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/email"
                  targetPrefix:@""
                 operationName:@"UpdateEmailChannel"
                   outputClass:[AWSPinpointTargetingUpdateEmailChannelResponse class]];
}

- (void)updateEmailChannel:(AWSPinpointTargetingUpdateEmailChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateEmailChannelResponse *response, NSError *error))completionHandler {
    [[self updateEmailChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateEmailChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateEmailChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateEndpointResponse *> *)updateEndpoint:(AWSPinpointTargetingUpdateEndpointRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/endpoints/{endpoint-id}"
                  targetPrefix:@""
                 operationName:@"UpdateEndpoint"
                   outputClass:[AWSPinpointTargetingUpdateEndpointResponse class]];
}

- (void)updateEndpoint:(AWSPinpointTargetingUpdateEndpointRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateEndpointResponse *response, NSError *error))completionHandler {
    [[self updateEndpoint:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateEndpointResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateEndpointResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateEndpointsBatchResponse *> *)updateEndpointsBatch:(AWSPinpointTargetingUpdateEndpointsBatchRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/endpoints"
                  targetPrefix:@""
                 operationName:@"UpdateEndpointsBatch"
                   outputClass:[AWSPinpointTargetingUpdateEndpointsBatchResponse class]];
}

- (void)updateEndpointsBatch:(AWSPinpointTargetingUpdateEndpointsBatchRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateEndpointsBatchResponse *response, NSError *error))completionHandler {
    [[self updateEndpointsBatch:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateEndpointsBatchResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateEndpointsBatchResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateGcmChannelResponse *> *)updateGcmChannel:(AWSPinpointTargetingUpdateGcmChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/gcm"
                  targetPrefix:@""
                 operationName:@"UpdateGcmChannel"
                   outputClass:[AWSPinpointTargetingUpdateGcmChannelResponse class]];
}

- (void)updateGcmChannel:(AWSPinpointTargetingUpdateGcmChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateGcmChannelResponse *response, NSError *error))completionHandler {
    [[self updateGcmChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateGcmChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateGcmChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateSegmentResponse *> *)updateSegment:(AWSPinpointTargetingUpdateSegmentRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/segments/{segment-id}"
                  targetPrefix:@""
                 operationName:@"UpdateSegment"
                   outputClass:[AWSPinpointTargetingUpdateSegmentResponse class]];
}

- (void)updateSegment:(AWSPinpointTargetingUpdateSegmentRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateSegmentResponse *response, NSError *error))completionHandler {
    [[self updateSegment:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateSegmentResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateSegmentResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateSmsChannelResponse *> *)updateSmsChannel:(AWSPinpointTargetingUpdateSmsChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/sms"
                  targetPrefix:@""
                 operationName:@"UpdateSmsChannel"
                   outputClass:[AWSPinpointTargetingUpdateSmsChannelResponse class]];
}

- (void)updateSmsChannel:(AWSPinpointTargetingUpdateSmsChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateSmsChannelResponse *response, NSError *error))completionHandler {
    [[self updateSmsChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateSmsChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateSmsChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSPinpointTargetingUpdateVoiceChannelResponse *> *)updateVoiceChannel:(AWSPinpointTargetingUpdateVoiceChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/v1/apps/{application-id}/channels/voice"
                  targetPrefix:@""
                 operationName:@"UpdateVoiceChannel"
                   outputClass:[AWSPinpointTargetingUpdateVoiceChannelResponse class]];
}

- (void)updateVoiceChannel:(AWSPinpointTargetingUpdateVoiceChannelRequest *)request
     completionHandler:(void (^)(AWSPinpointTargetingUpdateVoiceChannelResponse *response, NSError *error))completionHandler {
    [[self updateVoiceChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSPinpointTargetingUpdateVoiceChannelResponse *> * _Nonnull task) {
        AWSPinpointTargetingUpdateVoiceChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
