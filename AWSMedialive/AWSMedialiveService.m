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

#import "AWSMedialiveService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSMedialiveResources.h"

static NSString *const AWSInfoMedialive = @"Medialive";
NSString *const AWSMedialiveSDKVersion = @"2.13.4";


@interface AWSMedialiveResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSMedialiveResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadGatewayException" : @(AWSMedialiveErrorBadGateway),
                            @"BadRequestException" : @(AWSMedialiveErrorBadRequest),
                            @"ConflictException" : @(AWSMedialiveErrorConflict),
                            @"ForbiddenException" : @(AWSMedialiveErrorForbidden),
                            @"GatewayTimeoutException" : @(AWSMedialiveErrorGatewayTimeout),
                            @"InternalServerErrorException" : @(AWSMedialiveErrorInternalServerError),
                            @"NotFoundException" : @(AWSMedialiveErrorNotFound),
                            @"TooManyRequestsException" : @(AWSMedialiveErrorTooManyRequests),
                            @"UnprocessableEntityException" : @(AWSMedialiveErrorUnprocessableEntity),
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
                    *error = [NSError errorWithDomain:AWSMedialiveErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSMedialiveErrorDomain
                                                 code:AWSMedialiveErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSMedialiveErrorDomain
                                     code:AWSMedialiveErrorUnknown
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

@interface AWSMedialiveRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSMedialiveRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSMedialive()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSMedialive

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSMedialiveSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSMedialive versions need to match. Check your SDK installation. AWSCore: %@ AWSMedialive: %@", AWSiOSSDKVersion, AWSMedialiveSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultMedialive {
    static AWSMedialive *_defaultMedialive = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoMedialive];
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
        _defaultMedialive = [[AWSMedialive alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultMedialive;
}

+ (void)registerMedialiveWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSMedialive alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)MedialiveForKey:(NSString *)key {
    @synchronized(self) {
        AWSMedialive *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoMedialive
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSMedialive registerMedialiveWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeMedialiveForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultMedialive` or `+ MedialiveForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceMedialive
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceMedialive];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSMedialiveRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSMedialiveResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSMedialiveResponseSerializer alloc] initWithJSONDefinition:[[AWSMedialiveResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSMedialiveBatchUpdateScheduleResponse *> *)batchUpdateSchedule:(AWSMedialiveBatchUpdateScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/channels/{channelId}/schedule"
                  targetPrefix:@""
                 operationName:@"BatchUpdateSchedule"
                   outputClass:[AWSMedialiveBatchUpdateScheduleResponse class]];
}

- (void)batchUpdateSchedule:(AWSMedialiveBatchUpdateScheduleRequest *)request
     completionHandler:(void (^)(AWSMedialiveBatchUpdateScheduleResponse *response, NSError *error))completionHandler {
    [[self batchUpdateSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveBatchUpdateScheduleResponse *> * _Nonnull task) {
        AWSMedialiveBatchUpdateScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveCreateChannelResponse *> *)createChannel:(AWSMedialiveCreateChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/channels"
                  targetPrefix:@""
                 operationName:@"CreateChannel"
                   outputClass:[AWSMedialiveCreateChannelResponse class]];
}

- (void)createChannel:(AWSMedialiveCreateChannelRequest *)request
     completionHandler:(void (^)(AWSMedialiveCreateChannelResponse *response, NSError *error))completionHandler {
    [[self createChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveCreateChannelResponse *> * _Nonnull task) {
        AWSMedialiveCreateChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveCreateInputResponse *> *)createInput:(AWSMedialiveCreateInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/inputs"
                  targetPrefix:@""
                 operationName:@"CreateInput"
                   outputClass:[AWSMedialiveCreateInputResponse class]];
}

- (void)createInput:(AWSMedialiveCreateInputRequest *)request
     completionHandler:(void (^)(AWSMedialiveCreateInputResponse *response, NSError *error))completionHandler {
    [[self createInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveCreateInputResponse *> * _Nonnull task) {
        AWSMedialiveCreateInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveCreateInputSecurityGroupResponse *> *)createInputSecurityGroup:(AWSMedialiveCreateInputSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/inputSecurityGroups"
                  targetPrefix:@""
                 operationName:@"CreateInputSecurityGroup"
                   outputClass:[AWSMedialiveCreateInputSecurityGroupResponse class]];
}

- (void)createInputSecurityGroup:(AWSMedialiveCreateInputSecurityGroupRequest *)request
     completionHandler:(void (^)(AWSMedialiveCreateInputSecurityGroupResponse *response, NSError *error))completionHandler {
    [[self createInputSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveCreateInputSecurityGroupResponse *> * _Nonnull task) {
        AWSMedialiveCreateInputSecurityGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveCreateMultiplexResponse *> *)createMultiplex:(AWSMedialiveCreateMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/multiplexes"
                  targetPrefix:@""
                 operationName:@"CreateMultiplex"
                   outputClass:[AWSMedialiveCreateMultiplexResponse class]];
}

- (void)createMultiplex:(AWSMedialiveCreateMultiplexRequest *)request
     completionHandler:(void (^)(AWSMedialiveCreateMultiplexResponse *response, NSError *error))completionHandler {
    [[self createMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveCreateMultiplexResponse *> * _Nonnull task) {
        AWSMedialiveCreateMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveCreateMultiplexProgramResponse *> *)createMultiplexProgram:(AWSMedialiveCreateMultiplexProgramRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/multiplexes/{multiplexId}/programs"
                  targetPrefix:@""
                 operationName:@"CreateMultiplexProgram"
                   outputClass:[AWSMedialiveCreateMultiplexProgramResponse class]];
}

- (void)createMultiplexProgram:(AWSMedialiveCreateMultiplexProgramRequest *)request
     completionHandler:(void (^)(AWSMedialiveCreateMultiplexProgramResponse *response, NSError *error))completionHandler {
    [[self createMultiplexProgram:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveCreateMultiplexProgramResponse *> * _Nonnull task) {
        AWSMedialiveCreateMultiplexProgramResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createTags:(AWSMedialiveCreateTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"CreateTags"
                   outputClass:nil];
}

- (void)createTags:(AWSMedialiveCreateTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDeleteChannelResponse *> *)deleteChannel:(AWSMedialiveDeleteChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/channels/{channelId}"
                  targetPrefix:@""
                 operationName:@"DeleteChannel"
                   outputClass:[AWSMedialiveDeleteChannelResponse class]];
}

- (void)deleteChannel:(AWSMedialiveDeleteChannelRequest *)request
     completionHandler:(void (^)(AWSMedialiveDeleteChannelResponse *response, NSError *error))completionHandler {
    [[self deleteChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDeleteChannelResponse *> * _Nonnull task) {
        AWSMedialiveDeleteChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDeleteInputResponse *> *)deleteInput:(AWSMedialiveDeleteInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/inputs/{inputId}"
                  targetPrefix:@""
                 operationName:@"DeleteInput"
                   outputClass:[AWSMedialiveDeleteInputResponse class]];
}

- (void)deleteInput:(AWSMedialiveDeleteInputRequest *)request
     completionHandler:(void (^)(AWSMedialiveDeleteInputResponse *response, NSError *error))completionHandler {
    [[self deleteInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDeleteInputResponse *> * _Nonnull task) {
        AWSMedialiveDeleteInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDeleteInputSecurityGroupResponse *> *)deleteInputSecurityGroup:(AWSMedialiveDeleteInputSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/inputSecurityGroups/{inputSecurityGroupId}"
                  targetPrefix:@""
                 operationName:@"DeleteInputSecurityGroup"
                   outputClass:[AWSMedialiveDeleteInputSecurityGroupResponse class]];
}

- (void)deleteInputSecurityGroup:(AWSMedialiveDeleteInputSecurityGroupRequest *)request
     completionHandler:(void (^)(AWSMedialiveDeleteInputSecurityGroupResponse *response, NSError *error))completionHandler {
    [[self deleteInputSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDeleteInputSecurityGroupResponse *> * _Nonnull task) {
        AWSMedialiveDeleteInputSecurityGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDeleteMultiplexResponse *> *)deleteMultiplex:(AWSMedialiveDeleteMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/multiplexes/{multiplexId}"
                  targetPrefix:@""
                 operationName:@"DeleteMultiplex"
                   outputClass:[AWSMedialiveDeleteMultiplexResponse class]];
}

- (void)deleteMultiplex:(AWSMedialiveDeleteMultiplexRequest *)request
     completionHandler:(void (^)(AWSMedialiveDeleteMultiplexResponse *response, NSError *error))completionHandler {
    [[self deleteMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDeleteMultiplexResponse *> * _Nonnull task) {
        AWSMedialiveDeleteMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDeleteMultiplexProgramResponse *> *)deleteMultiplexProgram:(AWSMedialiveDeleteMultiplexProgramRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/multiplexes/{multiplexId}/programs/{programName}"
                  targetPrefix:@""
                 operationName:@"DeleteMultiplexProgram"
                   outputClass:[AWSMedialiveDeleteMultiplexProgramResponse class]];
}

- (void)deleteMultiplexProgram:(AWSMedialiveDeleteMultiplexProgramRequest *)request
     completionHandler:(void (^)(AWSMedialiveDeleteMultiplexProgramResponse *response, NSError *error))completionHandler {
    [[self deleteMultiplexProgram:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDeleteMultiplexProgramResponse *> * _Nonnull task) {
        AWSMedialiveDeleteMultiplexProgramResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDeleteReservationResponse *> *)deleteReservation:(AWSMedialiveDeleteReservationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/reservations/{reservationId}"
                  targetPrefix:@""
                 operationName:@"DeleteReservation"
                   outputClass:[AWSMedialiveDeleteReservationResponse class]];
}

- (void)deleteReservation:(AWSMedialiveDeleteReservationRequest *)request
     completionHandler:(void (^)(AWSMedialiveDeleteReservationResponse *response, NSError *error))completionHandler {
    [[self deleteReservation:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDeleteReservationResponse *> * _Nonnull task) {
        AWSMedialiveDeleteReservationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDeleteScheduleResponse *> *)deleteSchedule:(AWSMedialiveDeleteScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/channels/{channelId}/schedule"
                  targetPrefix:@""
                 operationName:@"DeleteSchedule"
                   outputClass:[AWSMedialiveDeleteScheduleResponse class]];
}

- (void)deleteSchedule:(AWSMedialiveDeleteScheduleRequest *)request
     completionHandler:(void (^)(AWSMedialiveDeleteScheduleResponse *response, NSError *error))completionHandler {
    [[self deleteSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDeleteScheduleResponse *> * _Nonnull task) {
        AWSMedialiveDeleteScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteTags:(AWSMedialiveDeleteTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"DeleteTags"
                   outputClass:nil];
}

- (void)deleteTags:(AWSMedialiveDeleteTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDescribeChannelResponse *> *)describeChannel:(AWSMedialiveDescribeChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/channels/{channelId}"
                  targetPrefix:@""
                 operationName:@"DescribeChannel"
                   outputClass:[AWSMedialiveDescribeChannelResponse class]];
}

- (void)describeChannel:(AWSMedialiveDescribeChannelRequest *)request
     completionHandler:(void (^)(AWSMedialiveDescribeChannelResponse *response, NSError *error))completionHandler {
    [[self describeChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDescribeChannelResponse *> * _Nonnull task) {
        AWSMedialiveDescribeChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDescribeInputResponse *> *)describeInput:(AWSMedialiveDescribeInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/inputs/{inputId}"
                  targetPrefix:@""
                 operationName:@"DescribeInput"
                   outputClass:[AWSMedialiveDescribeInputResponse class]];
}

- (void)describeInput:(AWSMedialiveDescribeInputRequest *)request
     completionHandler:(void (^)(AWSMedialiveDescribeInputResponse *response, NSError *error))completionHandler {
    [[self describeInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDescribeInputResponse *> * _Nonnull task) {
        AWSMedialiveDescribeInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDescribeInputDeviceResponse *> *)describeInputDevice:(AWSMedialiveDescribeInputDeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/inputDevices/{inputDeviceId}"
                  targetPrefix:@""
                 operationName:@"DescribeInputDevice"
                   outputClass:[AWSMedialiveDescribeInputDeviceResponse class]];
}

- (void)describeInputDevice:(AWSMedialiveDescribeInputDeviceRequest *)request
     completionHandler:(void (^)(AWSMedialiveDescribeInputDeviceResponse *response, NSError *error))completionHandler {
    [[self describeInputDevice:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDescribeInputDeviceResponse *> * _Nonnull task) {
        AWSMedialiveDescribeInputDeviceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDescribeInputSecurityGroupResponse *> *)describeInputSecurityGroup:(AWSMedialiveDescribeInputSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/inputSecurityGroups/{inputSecurityGroupId}"
                  targetPrefix:@""
                 operationName:@"DescribeInputSecurityGroup"
                   outputClass:[AWSMedialiveDescribeInputSecurityGroupResponse class]];
}

- (void)describeInputSecurityGroup:(AWSMedialiveDescribeInputSecurityGroupRequest *)request
     completionHandler:(void (^)(AWSMedialiveDescribeInputSecurityGroupResponse *response, NSError *error))completionHandler {
    [[self describeInputSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDescribeInputSecurityGroupResponse *> * _Nonnull task) {
        AWSMedialiveDescribeInputSecurityGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDescribeMultiplexResponse *> *)describeMultiplex:(AWSMedialiveDescribeMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/multiplexes/{multiplexId}"
                  targetPrefix:@""
                 operationName:@"DescribeMultiplex"
                   outputClass:[AWSMedialiveDescribeMultiplexResponse class]];
}

- (void)describeMultiplex:(AWSMedialiveDescribeMultiplexRequest *)request
     completionHandler:(void (^)(AWSMedialiveDescribeMultiplexResponse *response, NSError *error))completionHandler {
    [[self describeMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDescribeMultiplexResponse *> * _Nonnull task) {
        AWSMedialiveDescribeMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDescribeMultiplexProgramResponse *> *)describeMultiplexProgram:(AWSMedialiveDescribeMultiplexProgramRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/multiplexes/{multiplexId}/programs/{programName}"
                  targetPrefix:@""
                 operationName:@"DescribeMultiplexProgram"
                   outputClass:[AWSMedialiveDescribeMultiplexProgramResponse class]];
}

- (void)describeMultiplexProgram:(AWSMedialiveDescribeMultiplexProgramRequest *)request
     completionHandler:(void (^)(AWSMedialiveDescribeMultiplexProgramResponse *response, NSError *error))completionHandler {
    [[self describeMultiplexProgram:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDescribeMultiplexProgramResponse *> * _Nonnull task) {
        AWSMedialiveDescribeMultiplexProgramResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDescribeOfferingResponse *> *)describeOffering:(AWSMedialiveDescribeOfferingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/offerings/{offeringId}"
                  targetPrefix:@""
                 operationName:@"DescribeOffering"
                   outputClass:[AWSMedialiveDescribeOfferingResponse class]];
}

- (void)describeOffering:(AWSMedialiveDescribeOfferingRequest *)request
     completionHandler:(void (^)(AWSMedialiveDescribeOfferingResponse *response, NSError *error))completionHandler {
    [[self describeOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDescribeOfferingResponse *> * _Nonnull task) {
        AWSMedialiveDescribeOfferingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDescribeReservationResponse *> *)describeReservation:(AWSMedialiveDescribeReservationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/reservations/{reservationId}"
                  targetPrefix:@""
                 operationName:@"DescribeReservation"
                   outputClass:[AWSMedialiveDescribeReservationResponse class]];
}

- (void)describeReservation:(AWSMedialiveDescribeReservationRequest *)request
     completionHandler:(void (^)(AWSMedialiveDescribeReservationResponse *response, NSError *error))completionHandler {
    [[self describeReservation:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDescribeReservationResponse *> * _Nonnull task) {
        AWSMedialiveDescribeReservationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveDescribeScheduleResponse *> *)describeSchedule:(AWSMedialiveDescribeScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/channels/{channelId}/schedule"
                  targetPrefix:@""
                 operationName:@"DescribeSchedule"
                   outputClass:[AWSMedialiveDescribeScheduleResponse class]];
}

- (void)describeSchedule:(AWSMedialiveDescribeScheduleRequest *)request
     completionHandler:(void (^)(AWSMedialiveDescribeScheduleResponse *response, NSError *error))completionHandler {
    [[self describeSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveDescribeScheduleResponse *> * _Nonnull task) {
        AWSMedialiveDescribeScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveListChannelsResponse *> *)listChannels:(AWSMedialiveListChannelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/channels"
                  targetPrefix:@""
                 operationName:@"ListChannels"
                   outputClass:[AWSMedialiveListChannelsResponse class]];
}

- (void)listChannels:(AWSMedialiveListChannelsRequest *)request
     completionHandler:(void (^)(AWSMedialiveListChannelsResponse *response, NSError *error))completionHandler {
    [[self listChannels:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveListChannelsResponse *> * _Nonnull task) {
        AWSMedialiveListChannelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveListInputDevicesResponse *> *)listInputDevices:(AWSMedialiveListInputDevicesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/inputDevices"
                  targetPrefix:@""
                 operationName:@"ListInputDevices"
                   outputClass:[AWSMedialiveListInputDevicesResponse class]];
}

- (void)listInputDevices:(AWSMedialiveListInputDevicesRequest *)request
     completionHandler:(void (^)(AWSMedialiveListInputDevicesResponse *response, NSError *error))completionHandler {
    [[self listInputDevices:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveListInputDevicesResponse *> * _Nonnull task) {
        AWSMedialiveListInputDevicesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveListInputSecurityGroupsResponse *> *)listInputSecurityGroups:(AWSMedialiveListInputSecurityGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/inputSecurityGroups"
                  targetPrefix:@""
                 operationName:@"ListInputSecurityGroups"
                   outputClass:[AWSMedialiveListInputSecurityGroupsResponse class]];
}

- (void)listInputSecurityGroups:(AWSMedialiveListInputSecurityGroupsRequest *)request
     completionHandler:(void (^)(AWSMedialiveListInputSecurityGroupsResponse *response, NSError *error))completionHandler {
    [[self listInputSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveListInputSecurityGroupsResponse *> * _Nonnull task) {
        AWSMedialiveListInputSecurityGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveListInputsResponse *> *)listInputs:(AWSMedialiveListInputsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/inputs"
                  targetPrefix:@""
                 operationName:@"ListInputs"
                   outputClass:[AWSMedialiveListInputsResponse class]];
}

- (void)listInputs:(AWSMedialiveListInputsRequest *)request
     completionHandler:(void (^)(AWSMedialiveListInputsResponse *response, NSError *error))completionHandler {
    [[self listInputs:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveListInputsResponse *> * _Nonnull task) {
        AWSMedialiveListInputsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveListMultiplexProgramsResponse *> *)listMultiplexPrograms:(AWSMedialiveListMultiplexProgramsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/multiplexes/{multiplexId}/programs"
                  targetPrefix:@""
                 operationName:@"ListMultiplexPrograms"
                   outputClass:[AWSMedialiveListMultiplexProgramsResponse class]];
}

- (void)listMultiplexPrograms:(AWSMedialiveListMultiplexProgramsRequest *)request
     completionHandler:(void (^)(AWSMedialiveListMultiplexProgramsResponse *response, NSError *error))completionHandler {
    [[self listMultiplexPrograms:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveListMultiplexProgramsResponse *> * _Nonnull task) {
        AWSMedialiveListMultiplexProgramsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveListMultiplexesResponse *> *)listMultiplexes:(AWSMedialiveListMultiplexesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/multiplexes"
                  targetPrefix:@""
                 operationName:@"ListMultiplexes"
                   outputClass:[AWSMedialiveListMultiplexesResponse class]];
}

- (void)listMultiplexes:(AWSMedialiveListMultiplexesRequest *)request
     completionHandler:(void (^)(AWSMedialiveListMultiplexesResponse *response, NSError *error))completionHandler {
    [[self listMultiplexes:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveListMultiplexesResponse *> * _Nonnull task) {
        AWSMedialiveListMultiplexesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveListOfferingsResponse *> *)listOfferings:(AWSMedialiveListOfferingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/offerings"
                  targetPrefix:@""
                 operationName:@"ListOfferings"
                   outputClass:[AWSMedialiveListOfferingsResponse class]];
}

- (void)listOfferings:(AWSMedialiveListOfferingsRequest *)request
     completionHandler:(void (^)(AWSMedialiveListOfferingsResponse *response, NSError *error))completionHandler {
    [[self listOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveListOfferingsResponse *> * _Nonnull task) {
        AWSMedialiveListOfferingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveListReservationsResponse *> *)listReservations:(AWSMedialiveListReservationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/reservations"
                  targetPrefix:@""
                 operationName:@"ListReservations"
                   outputClass:[AWSMedialiveListReservationsResponse class]];
}

- (void)listReservations:(AWSMedialiveListReservationsRequest *)request
     completionHandler:(void (^)(AWSMedialiveListReservationsResponse *response, NSError *error))completionHandler {
    [[self listReservations:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveListReservationsResponse *> * _Nonnull task) {
        AWSMedialiveListReservationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveListTagsForResourceResponse *> *)listTagsForResource:(AWSMedialiveListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSMedialiveListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSMedialiveListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSMedialiveListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveListTagsForResourceResponse *> * _Nonnull task) {
        AWSMedialiveListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialivePurchaseOfferingResponse *> *)purchaseOffering:(AWSMedialivePurchaseOfferingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/offerings/{offeringId}/purchase"
                  targetPrefix:@""
                 operationName:@"PurchaseOffering"
                   outputClass:[AWSMedialivePurchaseOfferingResponse class]];
}

- (void)purchaseOffering:(AWSMedialivePurchaseOfferingRequest *)request
     completionHandler:(void (^)(AWSMedialivePurchaseOfferingResponse *response, NSError *error))completionHandler {
    [[self purchaseOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialivePurchaseOfferingResponse *> * _Nonnull task) {
        AWSMedialivePurchaseOfferingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveStartChannelResponse *> *)startChannel:(AWSMedialiveStartChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/channels/{channelId}/start"
                  targetPrefix:@""
                 operationName:@"StartChannel"
                   outputClass:[AWSMedialiveStartChannelResponse class]];
}

- (void)startChannel:(AWSMedialiveStartChannelRequest *)request
     completionHandler:(void (^)(AWSMedialiveStartChannelResponse *response, NSError *error))completionHandler {
    [[self startChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveStartChannelResponse *> * _Nonnull task) {
        AWSMedialiveStartChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveStartMultiplexResponse *> *)startMultiplex:(AWSMedialiveStartMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/multiplexes/{multiplexId}/start"
                  targetPrefix:@""
                 operationName:@"StartMultiplex"
                   outputClass:[AWSMedialiveStartMultiplexResponse class]];
}

- (void)startMultiplex:(AWSMedialiveStartMultiplexRequest *)request
     completionHandler:(void (^)(AWSMedialiveStartMultiplexResponse *response, NSError *error))completionHandler {
    [[self startMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveStartMultiplexResponse *> * _Nonnull task) {
        AWSMedialiveStartMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveStopChannelResponse *> *)stopChannel:(AWSMedialiveStopChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/channels/{channelId}/stop"
                  targetPrefix:@""
                 operationName:@"StopChannel"
                   outputClass:[AWSMedialiveStopChannelResponse class]];
}

- (void)stopChannel:(AWSMedialiveStopChannelRequest *)request
     completionHandler:(void (^)(AWSMedialiveStopChannelResponse *response, NSError *error))completionHandler {
    [[self stopChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveStopChannelResponse *> * _Nonnull task) {
        AWSMedialiveStopChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveStopMultiplexResponse *> *)stopMultiplex:(AWSMedialiveStopMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/multiplexes/{multiplexId}/stop"
                  targetPrefix:@""
                 operationName:@"StopMultiplex"
                   outputClass:[AWSMedialiveStopMultiplexResponse class]];
}

- (void)stopMultiplex:(AWSMedialiveStopMultiplexRequest *)request
     completionHandler:(void (^)(AWSMedialiveStopMultiplexResponse *response, NSError *error))completionHandler {
    [[self stopMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveStopMultiplexResponse *> * _Nonnull task) {
        AWSMedialiveStopMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveUpdateChannelResponse *> *)updateChannel:(AWSMedialiveUpdateChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/channels/{channelId}"
                  targetPrefix:@""
                 operationName:@"UpdateChannel"
                   outputClass:[AWSMedialiveUpdateChannelResponse class]];
}

- (void)updateChannel:(AWSMedialiveUpdateChannelRequest *)request
     completionHandler:(void (^)(AWSMedialiveUpdateChannelResponse *response, NSError *error))completionHandler {
    [[self updateChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveUpdateChannelResponse *> * _Nonnull task) {
        AWSMedialiveUpdateChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveUpdateChannelClassResponse *> *)updateChannelClass:(AWSMedialiveUpdateChannelClassRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/channels/{channelId}/channelClass"
                  targetPrefix:@""
                 operationName:@"UpdateChannelClass"
                   outputClass:[AWSMedialiveUpdateChannelClassResponse class]];
}

- (void)updateChannelClass:(AWSMedialiveUpdateChannelClassRequest *)request
     completionHandler:(void (^)(AWSMedialiveUpdateChannelClassResponse *response, NSError *error))completionHandler {
    [[self updateChannelClass:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveUpdateChannelClassResponse *> * _Nonnull task) {
        AWSMedialiveUpdateChannelClassResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveUpdateInputResponse *> *)updateInput:(AWSMedialiveUpdateInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/inputs/{inputId}"
                  targetPrefix:@""
                 operationName:@"UpdateInput"
                   outputClass:[AWSMedialiveUpdateInputResponse class]];
}

- (void)updateInput:(AWSMedialiveUpdateInputRequest *)request
     completionHandler:(void (^)(AWSMedialiveUpdateInputResponse *response, NSError *error))completionHandler {
    [[self updateInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveUpdateInputResponse *> * _Nonnull task) {
        AWSMedialiveUpdateInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveUpdateInputDeviceResponse *> *)updateInputDevice:(AWSMedialiveUpdateInputDeviceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/inputDevices/{inputDeviceId}"
                  targetPrefix:@""
                 operationName:@"UpdateInputDevice"
                   outputClass:[AWSMedialiveUpdateInputDeviceResponse class]];
}

- (void)updateInputDevice:(AWSMedialiveUpdateInputDeviceRequest *)request
     completionHandler:(void (^)(AWSMedialiveUpdateInputDeviceResponse *response, NSError *error))completionHandler {
    [[self updateInputDevice:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveUpdateInputDeviceResponse *> * _Nonnull task) {
        AWSMedialiveUpdateInputDeviceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveUpdateInputSecurityGroupResponse *> *)updateInputSecurityGroup:(AWSMedialiveUpdateInputSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/inputSecurityGroups/{inputSecurityGroupId}"
                  targetPrefix:@""
                 operationName:@"UpdateInputSecurityGroup"
                   outputClass:[AWSMedialiveUpdateInputSecurityGroupResponse class]];
}

- (void)updateInputSecurityGroup:(AWSMedialiveUpdateInputSecurityGroupRequest *)request
     completionHandler:(void (^)(AWSMedialiveUpdateInputSecurityGroupResponse *response, NSError *error))completionHandler {
    [[self updateInputSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveUpdateInputSecurityGroupResponse *> * _Nonnull task) {
        AWSMedialiveUpdateInputSecurityGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveUpdateMultiplexResponse *> *)updateMultiplex:(AWSMedialiveUpdateMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/multiplexes/{multiplexId}"
                  targetPrefix:@""
                 operationName:@"UpdateMultiplex"
                   outputClass:[AWSMedialiveUpdateMultiplexResponse class]];
}

- (void)updateMultiplex:(AWSMedialiveUpdateMultiplexRequest *)request
     completionHandler:(void (^)(AWSMedialiveUpdateMultiplexResponse *response, NSError *error))completionHandler {
    [[self updateMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveUpdateMultiplexResponse *> * _Nonnull task) {
        AWSMedialiveUpdateMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveUpdateMultiplexProgramResponse *> *)updateMultiplexProgram:(AWSMedialiveUpdateMultiplexProgramRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/multiplexes/{multiplexId}/programs/{programName}"
                  targetPrefix:@""
                 operationName:@"UpdateMultiplexProgram"
                   outputClass:[AWSMedialiveUpdateMultiplexProgramResponse class]];
}

- (void)updateMultiplexProgram:(AWSMedialiveUpdateMultiplexProgramRequest *)request
     completionHandler:(void (^)(AWSMedialiveUpdateMultiplexProgramResponse *response, NSError *error))completionHandler {
    [[self updateMultiplexProgram:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveUpdateMultiplexProgramResponse *> * _Nonnull task) {
        AWSMedialiveUpdateMultiplexProgramResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSMedialiveUpdateReservationResponse *> *)updateReservation:(AWSMedialiveUpdateReservationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/reservations/{reservationId}"
                  targetPrefix:@""
                 operationName:@"UpdateReservation"
                   outputClass:[AWSMedialiveUpdateReservationResponse class]];
}

- (void)updateReservation:(AWSMedialiveUpdateReservationRequest *)request
     completionHandler:(void (^)(AWSMedialiveUpdateReservationResponse *response, NSError *error))completionHandler {
    [[self updateReservation:request] continueWithBlock:^id _Nullable(AWSTask<AWSMedialiveUpdateReservationResponse *> * _Nonnull task) {
        AWSMedialiveUpdateReservationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
