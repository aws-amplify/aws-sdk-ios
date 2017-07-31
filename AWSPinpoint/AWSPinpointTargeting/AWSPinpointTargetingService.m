//
// Copyright 2010-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
static NSString *const AWSPinpointTargetingSDKVersion = @"2.5.9";


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
                                           reason:@"The service configuration is `nil`. You need to configure `Info.plist` or set `defaultServiceConfiguration` before using this method."
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

#pragma mark -

@end
