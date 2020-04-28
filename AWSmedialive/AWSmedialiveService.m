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

#import "AWSmedialiveService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSmedialiveResources.h"

static NSString *const AWSInfomedialive = @"medialive";
NSString *const AWSmedialiveSDKVersion = @"2.13.2";


@interface AWSmedialiveResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSmedialiveResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadGatewayException" : @(AWSmedialiveErrorBadGateway),
                            @"BadRequestException" : @(AWSmedialiveErrorBadRequest),
                            @"ConflictException" : @(AWSmedialiveErrorConflict),
                            @"ForbiddenException" : @(AWSmedialiveErrorForbidden),
                            @"GatewayTimeoutException" : @(AWSmedialiveErrorGatewayTimeout),
                            @"InternalServerErrorException" : @(AWSmedialiveErrorInternalServerError),
                            @"NotFoundException" : @(AWSmedialiveErrorNotFound),
                            @"TooManyRequestsException" : @(AWSmedialiveErrorTooManyRequests),
                            @"UnprocessableEntityException" : @(AWSmedialiveErrorUnprocessableEntity),
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
                    *error = [NSError errorWithDomain:AWSmedialiveErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSmedialiveErrorDomain
                                                 code:AWSmedialiveErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSmedialiveErrorDomain
                                     code:AWSmedialiveErrorUnknown
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

@interface AWSmedialiveRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSmedialiveRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSmedialive()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSmedialive

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSmedialiveSDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSmedialive versions need to match. Check your SDK installation. AWSCore: %@ AWSmedialive: %@", AWSiOSSDKVersion, AWSmedialiveSDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultmedialive {
    static AWSmedialive *_defaultmedialive = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfomedialive];
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
        _defaultmedialive = [[AWSmedialive alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultmedialive;
}

+ (void)registermedialiveWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSmedialive alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)medialiveForKey:(NSString *)key {
    @synchronized(self) {
        AWSmedialive *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfomedialive
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSmedialive registermedialiveWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removemedialiveForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultmedialive` or `+ medialiveForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServicemedialive
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServicemedialive];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSmedialiveRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSmedialiveResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSmedialiveResponseSerializer alloc] initWithJSONDefinition:[[AWSmedialiveResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSmedialiveBatchUpdateScheduleResponse *> *)batchUpdateSchedule:(AWSmedialiveBatchUpdateScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/channels/{channelId}/schedule"
                  targetPrefix:@""
                 operationName:@"BatchUpdateSchedule"
                   outputClass:[AWSmedialiveBatchUpdateScheduleResponse class]];
}

- (void)batchUpdateSchedule:(AWSmedialiveBatchUpdateScheduleRequest *)request
     completionHandler:(void (^)(AWSmedialiveBatchUpdateScheduleResponse *response, NSError *error))completionHandler {
    [[self batchUpdateSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveBatchUpdateScheduleResponse *> * _Nonnull task) {
        AWSmedialiveBatchUpdateScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveCreateChannelResponse *> *)createChannel:(AWSmedialiveCreateChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/channels"
                  targetPrefix:@""
                 operationName:@"CreateChannel"
                   outputClass:[AWSmedialiveCreateChannelResponse class]];
}

- (void)createChannel:(AWSmedialiveCreateChannelRequest *)request
     completionHandler:(void (^)(AWSmedialiveCreateChannelResponse *response, NSError *error))completionHandler {
    [[self createChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveCreateChannelResponse *> * _Nonnull task) {
        AWSmedialiveCreateChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveCreateInputResponse *> *)createInput:(AWSmedialiveCreateInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/inputs"
                  targetPrefix:@""
                 operationName:@"CreateInput"
                   outputClass:[AWSmedialiveCreateInputResponse class]];
}

- (void)createInput:(AWSmedialiveCreateInputRequest *)request
     completionHandler:(void (^)(AWSmedialiveCreateInputResponse *response, NSError *error))completionHandler {
    [[self createInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveCreateInputResponse *> * _Nonnull task) {
        AWSmedialiveCreateInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveCreateInputSecurityGroupResponse *> *)createInputSecurityGroup:(AWSmedialiveCreateInputSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/inputSecurityGroups"
                  targetPrefix:@""
                 operationName:@"CreateInputSecurityGroup"
                   outputClass:[AWSmedialiveCreateInputSecurityGroupResponse class]];
}

- (void)createInputSecurityGroup:(AWSmedialiveCreateInputSecurityGroupRequest *)request
     completionHandler:(void (^)(AWSmedialiveCreateInputSecurityGroupResponse *response, NSError *error))completionHandler {
    [[self createInputSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveCreateInputSecurityGroupResponse *> * _Nonnull task) {
        AWSmedialiveCreateInputSecurityGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveCreateMultiplexResponse *> *)createMultiplex:(AWSmedialiveCreateMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/multiplexes"
                  targetPrefix:@""
                 operationName:@"CreateMultiplex"
                   outputClass:[AWSmedialiveCreateMultiplexResponse class]];
}

- (void)createMultiplex:(AWSmedialiveCreateMultiplexRequest *)request
     completionHandler:(void (^)(AWSmedialiveCreateMultiplexResponse *response, NSError *error))completionHandler {
    [[self createMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveCreateMultiplexResponse *> * _Nonnull task) {
        AWSmedialiveCreateMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveCreateMultiplexProgramResponse *> *)createMultiplexProgram:(AWSmedialiveCreateMultiplexProgramRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/multiplexes/{multiplexId}/programs"
                  targetPrefix:@""
                 operationName:@"CreateMultiplexProgram"
                   outputClass:[AWSmedialiveCreateMultiplexProgramResponse class]];
}

- (void)createMultiplexProgram:(AWSmedialiveCreateMultiplexProgramRequest *)request
     completionHandler:(void (^)(AWSmedialiveCreateMultiplexProgramResponse *response, NSError *error))completionHandler {
    [[self createMultiplexProgram:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveCreateMultiplexProgramResponse *> * _Nonnull task) {
        AWSmedialiveCreateMultiplexProgramResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)createTags:(AWSmedialiveCreateTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"CreateTags"
                   outputClass:nil];
}

- (void)createTags:(AWSmedialiveCreateTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self createTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDeleteChannelResponse *> *)deleteChannel:(AWSmedialiveDeleteChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/channels/{channelId}"
                  targetPrefix:@""
                 operationName:@"DeleteChannel"
                   outputClass:[AWSmedialiveDeleteChannelResponse class]];
}

- (void)deleteChannel:(AWSmedialiveDeleteChannelRequest *)request
     completionHandler:(void (^)(AWSmedialiveDeleteChannelResponse *response, NSError *error))completionHandler {
    [[self deleteChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDeleteChannelResponse *> * _Nonnull task) {
        AWSmedialiveDeleteChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDeleteInputResponse *> *)deleteInput:(AWSmedialiveDeleteInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/inputs/{inputId}"
                  targetPrefix:@""
                 operationName:@"DeleteInput"
                   outputClass:[AWSmedialiveDeleteInputResponse class]];
}

- (void)deleteInput:(AWSmedialiveDeleteInputRequest *)request
     completionHandler:(void (^)(AWSmedialiveDeleteInputResponse *response, NSError *error))completionHandler {
    [[self deleteInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDeleteInputResponse *> * _Nonnull task) {
        AWSmedialiveDeleteInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDeleteInputSecurityGroupResponse *> *)deleteInputSecurityGroup:(AWSmedialiveDeleteInputSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/inputSecurityGroups/{inputSecurityGroupId}"
                  targetPrefix:@""
                 operationName:@"DeleteInputSecurityGroup"
                   outputClass:[AWSmedialiveDeleteInputSecurityGroupResponse class]];
}

- (void)deleteInputSecurityGroup:(AWSmedialiveDeleteInputSecurityGroupRequest *)request
     completionHandler:(void (^)(AWSmedialiveDeleteInputSecurityGroupResponse *response, NSError *error))completionHandler {
    [[self deleteInputSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDeleteInputSecurityGroupResponse *> * _Nonnull task) {
        AWSmedialiveDeleteInputSecurityGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDeleteMultiplexResponse *> *)deleteMultiplex:(AWSmedialiveDeleteMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/multiplexes/{multiplexId}"
                  targetPrefix:@""
                 operationName:@"DeleteMultiplex"
                   outputClass:[AWSmedialiveDeleteMultiplexResponse class]];
}

- (void)deleteMultiplex:(AWSmedialiveDeleteMultiplexRequest *)request
     completionHandler:(void (^)(AWSmedialiveDeleteMultiplexResponse *response, NSError *error))completionHandler {
    [[self deleteMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDeleteMultiplexResponse *> * _Nonnull task) {
        AWSmedialiveDeleteMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDeleteMultiplexProgramResponse *> *)deleteMultiplexProgram:(AWSmedialiveDeleteMultiplexProgramRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/multiplexes/{multiplexId}/programs/{programName}"
                  targetPrefix:@""
                 operationName:@"DeleteMultiplexProgram"
                   outputClass:[AWSmedialiveDeleteMultiplexProgramResponse class]];
}

- (void)deleteMultiplexProgram:(AWSmedialiveDeleteMultiplexProgramRequest *)request
     completionHandler:(void (^)(AWSmedialiveDeleteMultiplexProgramResponse *response, NSError *error))completionHandler {
    [[self deleteMultiplexProgram:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDeleteMultiplexProgramResponse *> * _Nonnull task) {
        AWSmedialiveDeleteMultiplexProgramResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDeleteReservationResponse *> *)deleteReservation:(AWSmedialiveDeleteReservationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/reservations/{reservationId}"
                  targetPrefix:@""
                 operationName:@"DeleteReservation"
                   outputClass:[AWSmedialiveDeleteReservationResponse class]];
}

- (void)deleteReservation:(AWSmedialiveDeleteReservationRequest *)request
     completionHandler:(void (^)(AWSmedialiveDeleteReservationResponse *response, NSError *error))completionHandler {
    [[self deleteReservation:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDeleteReservationResponse *> * _Nonnull task) {
        AWSmedialiveDeleteReservationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDeleteScheduleResponse *> *)deleteSchedule:(AWSmedialiveDeleteScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/channels/{channelId}/schedule"
                  targetPrefix:@""
                 operationName:@"DeleteSchedule"
                   outputClass:[AWSmedialiveDeleteScheduleResponse class]];
}

- (void)deleteSchedule:(AWSmedialiveDeleteScheduleRequest *)request
     completionHandler:(void (^)(AWSmedialiveDeleteScheduleResponse *response, NSError *error))completionHandler {
    [[self deleteSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDeleteScheduleResponse *> * _Nonnull task) {
        AWSmedialiveDeleteScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask *)deleteTags:(AWSmedialiveDeleteTagsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/prod/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"DeleteTags"
                   outputClass:nil];
}

- (void)deleteTags:(AWSmedialiveDeleteTagsRequest *)request
     completionHandler:(void (^)(NSError *error))completionHandler {
    [[self deleteTags:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDescribeChannelResponse *> *)describeChannel:(AWSmedialiveDescribeChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/channels/{channelId}"
                  targetPrefix:@""
                 operationName:@"DescribeChannel"
                   outputClass:[AWSmedialiveDescribeChannelResponse class]];
}

- (void)describeChannel:(AWSmedialiveDescribeChannelRequest *)request
     completionHandler:(void (^)(AWSmedialiveDescribeChannelResponse *response, NSError *error))completionHandler {
    [[self describeChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDescribeChannelResponse *> * _Nonnull task) {
        AWSmedialiveDescribeChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDescribeInputResponse *> *)describeInput:(AWSmedialiveDescribeInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/inputs/{inputId}"
                  targetPrefix:@""
                 operationName:@"DescribeInput"
                   outputClass:[AWSmedialiveDescribeInputResponse class]];
}

- (void)describeInput:(AWSmedialiveDescribeInputRequest *)request
     completionHandler:(void (^)(AWSmedialiveDescribeInputResponse *response, NSError *error))completionHandler {
    [[self describeInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDescribeInputResponse *> * _Nonnull task) {
        AWSmedialiveDescribeInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDescribeInputSecurityGroupResponse *> *)describeInputSecurityGroup:(AWSmedialiveDescribeInputSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/inputSecurityGroups/{inputSecurityGroupId}"
                  targetPrefix:@""
                 operationName:@"DescribeInputSecurityGroup"
                   outputClass:[AWSmedialiveDescribeInputSecurityGroupResponse class]];
}

- (void)describeInputSecurityGroup:(AWSmedialiveDescribeInputSecurityGroupRequest *)request
     completionHandler:(void (^)(AWSmedialiveDescribeInputSecurityGroupResponse *response, NSError *error))completionHandler {
    [[self describeInputSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDescribeInputSecurityGroupResponse *> * _Nonnull task) {
        AWSmedialiveDescribeInputSecurityGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDescribeMultiplexResponse *> *)describeMultiplex:(AWSmedialiveDescribeMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/multiplexes/{multiplexId}"
                  targetPrefix:@""
                 operationName:@"DescribeMultiplex"
                   outputClass:[AWSmedialiveDescribeMultiplexResponse class]];
}

- (void)describeMultiplex:(AWSmedialiveDescribeMultiplexRequest *)request
     completionHandler:(void (^)(AWSmedialiveDescribeMultiplexResponse *response, NSError *error))completionHandler {
    [[self describeMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDescribeMultiplexResponse *> * _Nonnull task) {
        AWSmedialiveDescribeMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDescribeMultiplexProgramResponse *> *)describeMultiplexProgram:(AWSmedialiveDescribeMultiplexProgramRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/multiplexes/{multiplexId}/programs/{programName}"
                  targetPrefix:@""
                 operationName:@"DescribeMultiplexProgram"
                   outputClass:[AWSmedialiveDescribeMultiplexProgramResponse class]];
}

- (void)describeMultiplexProgram:(AWSmedialiveDescribeMultiplexProgramRequest *)request
     completionHandler:(void (^)(AWSmedialiveDescribeMultiplexProgramResponse *response, NSError *error))completionHandler {
    [[self describeMultiplexProgram:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDescribeMultiplexProgramResponse *> * _Nonnull task) {
        AWSmedialiveDescribeMultiplexProgramResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDescribeOfferingResponse *> *)describeOffering:(AWSmedialiveDescribeOfferingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/offerings/{offeringId}"
                  targetPrefix:@""
                 operationName:@"DescribeOffering"
                   outputClass:[AWSmedialiveDescribeOfferingResponse class]];
}

- (void)describeOffering:(AWSmedialiveDescribeOfferingRequest *)request
     completionHandler:(void (^)(AWSmedialiveDescribeOfferingResponse *response, NSError *error))completionHandler {
    [[self describeOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDescribeOfferingResponse *> * _Nonnull task) {
        AWSmedialiveDescribeOfferingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDescribeReservationResponse *> *)describeReservation:(AWSmedialiveDescribeReservationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/reservations/{reservationId}"
                  targetPrefix:@""
                 operationName:@"DescribeReservation"
                   outputClass:[AWSmedialiveDescribeReservationResponse class]];
}

- (void)describeReservation:(AWSmedialiveDescribeReservationRequest *)request
     completionHandler:(void (^)(AWSmedialiveDescribeReservationResponse *response, NSError *error))completionHandler {
    [[self describeReservation:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDescribeReservationResponse *> * _Nonnull task) {
        AWSmedialiveDescribeReservationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveDescribeScheduleResponse *> *)describeSchedule:(AWSmedialiveDescribeScheduleRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/channels/{channelId}/schedule"
                  targetPrefix:@""
                 operationName:@"DescribeSchedule"
                   outputClass:[AWSmedialiveDescribeScheduleResponse class]];
}

- (void)describeSchedule:(AWSmedialiveDescribeScheduleRequest *)request
     completionHandler:(void (^)(AWSmedialiveDescribeScheduleResponse *response, NSError *error))completionHandler {
    [[self describeSchedule:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveDescribeScheduleResponse *> * _Nonnull task) {
        AWSmedialiveDescribeScheduleResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveListChannelsResponse *> *)listChannels:(AWSmedialiveListChannelsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/channels"
                  targetPrefix:@""
                 operationName:@"ListChannels"
                   outputClass:[AWSmedialiveListChannelsResponse class]];
}

- (void)listChannels:(AWSmedialiveListChannelsRequest *)request
     completionHandler:(void (^)(AWSmedialiveListChannelsResponse *response, NSError *error))completionHandler {
    [[self listChannels:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveListChannelsResponse *> * _Nonnull task) {
        AWSmedialiveListChannelsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveListInputSecurityGroupsResponse *> *)listInputSecurityGroups:(AWSmedialiveListInputSecurityGroupsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/inputSecurityGroups"
                  targetPrefix:@""
                 operationName:@"ListInputSecurityGroups"
                   outputClass:[AWSmedialiveListInputSecurityGroupsResponse class]];
}

- (void)listInputSecurityGroups:(AWSmedialiveListInputSecurityGroupsRequest *)request
     completionHandler:(void (^)(AWSmedialiveListInputSecurityGroupsResponse *response, NSError *error))completionHandler {
    [[self listInputSecurityGroups:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveListInputSecurityGroupsResponse *> * _Nonnull task) {
        AWSmedialiveListInputSecurityGroupsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveListInputsResponse *> *)listInputs:(AWSmedialiveListInputsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/inputs"
                  targetPrefix:@""
                 operationName:@"ListInputs"
                   outputClass:[AWSmedialiveListInputsResponse class]];
}

- (void)listInputs:(AWSmedialiveListInputsRequest *)request
     completionHandler:(void (^)(AWSmedialiveListInputsResponse *response, NSError *error))completionHandler {
    [[self listInputs:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveListInputsResponse *> * _Nonnull task) {
        AWSmedialiveListInputsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveListMultiplexProgramsResponse *> *)listMultiplexPrograms:(AWSmedialiveListMultiplexProgramsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/multiplexes/{multiplexId}/programs"
                  targetPrefix:@""
                 operationName:@"ListMultiplexPrograms"
                   outputClass:[AWSmedialiveListMultiplexProgramsResponse class]];
}

- (void)listMultiplexPrograms:(AWSmedialiveListMultiplexProgramsRequest *)request
     completionHandler:(void (^)(AWSmedialiveListMultiplexProgramsResponse *response, NSError *error))completionHandler {
    [[self listMultiplexPrograms:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveListMultiplexProgramsResponse *> * _Nonnull task) {
        AWSmedialiveListMultiplexProgramsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveListMultiplexesResponse *> *)listMultiplexes:(AWSmedialiveListMultiplexesRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/multiplexes"
                  targetPrefix:@""
                 operationName:@"ListMultiplexes"
                   outputClass:[AWSmedialiveListMultiplexesResponse class]];
}

- (void)listMultiplexes:(AWSmedialiveListMultiplexesRequest *)request
     completionHandler:(void (^)(AWSmedialiveListMultiplexesResponse *response, NSError *error))completionHandler {
    [[self listMultiplexes:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveListMultiplexesResponse *> * _Nonnull task) {
        AWSmedialiveListMultiplexesResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveListOfferingsResponse *> *)listOfferings:(AWSmedialiveListOfferingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/offerings"
                  targetPrefix:@""
                 operationName:@"ListOfferings"
                   outputClass:[AWSmedialiveListOfferingsResponse class]];
}

- (void)listOfferings:(AWSmedialiveListOfferingsRequest *)request
     completionHandler:(void (^)(AWSmedialiveListOfferingsResponse *response, NSError *error))completionHandler {
    [[self listOfferings:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveListOfferingsResponse *> * _Nonnull task) {
        AWSmedialiveListOfferingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveListReservationsResponse *> *)listReservations:(AWSmedialiveListReservationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/reservations"
                  targetPrefix:@""
                 operationName:@"ListReservations"
                   outputClass:[AWSmedialiveListReservationsResponse class]];
}

- (void)listReservations:(AWSmedialiveListReservationsRequest *)request
     completionHandler:(void (^)(AWSmedialiveListReservationsResponse *response, NSError *error))completionHandler {
    [[self listReservations:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveListReservationsResponse *> * _Nonnull task) {
        AWSmedialiveListReservationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveListTagsForResourceResponse *> *)listTagsForResource:(AWSmedialiveListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/prod/tags/{resource-arn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSmedialiveListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSmedialiveListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSmedialiveListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveListTagsForResourceResponse *> * _Nonnull task) {
        AWSmedialiveListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialivePurchaseOfferingResponse *> *)purchaseOffering:(AWSmedialivePurchaseOfferingRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/offerings/{offeringId}/purchase"
                  targetPrefix:@""
                 operationName:@"PurchaseOffering"
                   outputClass:[AWSmedialivePurchaseOfferingResponse class]];
}

- (void)purchaseOffering:(AWSmedialivePurchaseOfferingRequest *)request
     completionHandler:(void (^)(AWSmedialivePurchaseOfferingResponse *response, NSError *error))completionHandler {
    [[self purchaseOffering:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialivePurchaseOfferingResponse *> * _Nonnull task) {
        AWSmedialivePurchaseOfferingResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveStartChannelResponse *> *)startChannel:(AWSmedialiveStartChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/channels/{channelId}/start"
                  targetPrefix:@""
                 operationName:@"StartChannel"
                   outputClass:[AWSmedialiveStartChannelResponse class]];
}

- (void)startChannel:(AWSmedialiveStartChannelRequest *)request
     completionHandler:(void (^)(AWSmedialiveStartChannelResponse *response, NSError *error))completionHandler {
    [[self startChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveStartChannelResponse *> * _Nonnull task) {
        AWSmedialiveStartChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveStartMultiplexResponse *> *)startMultiplex:(AWSmedialiveStartMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/multiplexes/{multiplexId}/start"
                  targetPrefix:@""
                 operationName:@"StartMultiplex"
                   outputClass:[AWSmedialiveStartMultiplexResponse class]];
}

- (void)startMultiplex:(AWSmedialiveStartMultiplexRequest *)request
     completionHandler:(void (^)(AWSmedialiveStartMultiplexResponse *response, NSError *error))completionHandler {
    [[self startMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveStartMultiplexResponse *> * _Nonnull task) {
        AWSmedialiveStartMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveStopChannelResponse *> *)stopChannel:(AWSmedialiveStopChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/channels/{channelId}/stop"
                  targetPrefix:@""
                 operationName:@"StopChannel"
                   outputClass:[AWSmedialiveStopChannelResponse class]];
}

- (void)stopChannel:(AWSmedialiveStopChannelRequest *)request
     completionHandler:(void (^)(AWSmedialiveStopChannelResponse *response, NSError *error))completionHandler {
    [[self stopChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveStopChannelResponse *> * _Nonnull task) {
        AWSmedialiveStopChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveStopMultiplexResponse *> *)stopMultiplex:(AWSmedialiveStopMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/prod/multiplexes/{multiplexId}/stop"
                  targetPrefix:@""
                 operationName:@"StopMultiplex"
                   outputClass:[AWSmedialiveStopMultiplexResponse class]];
}

- (void)stopMultiplex:(AWSmedialiveStopMultiplexRequest *)request
     completionHandler:(void (^)(AWSmedialiveStopMultiplexResponse *response, NSError *error))completionHandler {
    [[self stopMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveStopMultiplexResponse *> * _Nonnull task) {
        AWSmedialiveStopMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveUpdateChannelResponse *> *)updateChannel:(AWSmedialiveUpdateChannelRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/channels/{channelId}"
                  targetPrefix:@""
                 operationName:@"UpdateChannel"
                   outputClass:[AWSmedialiveUpdateChannelResponse class]];
}

- (void)updateChannel:(AWSmedialiveUpdateChannelRequest *)request
     completionHandler:(void (^)(AWSmedialiveUpdateChannelResponse *response, NSError *error))completionHandler {
    [[self updateChannel:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveUpdateChannelResponse *> * _Nonnull task) {
        AWSmedialiveUpdateChannelResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveUpdateChannelClassResponse *> *)updateChannelClass:(AWSmedialiveUpdateChannelClassRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/channels/{channelId}/channelClass"
                  targetPrefix:@""
                 operationName:@"UpdateChannelClass"
                   outputClass:[AWSmedialiveUpdateChannelClassResponse class]];
}

- (void)updateChannelClass:(AWSmedialiveUpdateChannelClassRequest *)request
     completionHandler:(void (^)(AWSmedialiveUpdateChannelClassResponse *response, NSError *error))completionHandler {
    [[self updateChannelClass:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveUpdateChannelClassResponse *> * _Nonnull task) {
        AWSmedialiveUpdateChannelClassResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveUpdateInputResponse *> *)updateInput:(AWSmedialiveUpdateInputRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/inputs/{inputId}"
                  targetPrefix:@""
                 operationName:@"UpdateInput"
                   outputClass:[AWSmedialiveUpdateInputResponse class]];
}

- (void)updateInput:(AWSmedialiveUpdateInputRequest *)request
     completionHandler:(void (^)(AWSmedialiveUpdateInputResponse *response, NSError *error))completionHandler {
    [[self updateInput:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveUpdateInputResponse *> * _Nonnull task) {
        AWSmedialiveUpdateInputResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveUpdateInputSecurityGroupResponse *> *)updateInputSecurityGroup:(AWSmedialiveUpdateInputSecurityGroupRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/inputSecurityGroups/{inputSecurityGroupId}"
                  targetPrefix:@""
                 operationName:@"UpdateInputSecurityGroup"
                   outputClass:[AWSmedialiveUpdateInputSecurityGroupResponse class]];
}

- (void)updateInputSecurityGroup:(AWSmedialiveUpdateInputSecurityGroupRequest *)request
     completionHandler:(void (^)(AWSmedialiveUpdateInputSecurityGroupResponse *response, NSError *error))completionHandler {
    [[self updateInputSecurityGroup:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveUpdateInputSecurityGroupResponse *> * _Nonnull task) {
        AWSmedialiveUpdateInputSecurityGroupResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveUpdateMultiplexResponse *> *)updateMultiplex:(AWSmedialiveUpdateMultiplexRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/multiplexes/{multiplexId}"
                  targetPrefix:@""
                 operationName:@"UpdateMultiplex"
                   outputClass:[AWSmedialiveUpdateMultiplexResponse class]];
}

- (void)updateMultiplex:(AWSmedialiveUpdateMultiplexRequest *)request
     completionHandler:(void (^)(AWSmedialiveUpdateMultiplexResponse *response, NSError *error))completionHandler {
    [[self updateMultiplex:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveUpdateMultiplexResponse *> * _Nonnull task) {
        AWSmedialiveUpdateMultiplexResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveUpdateMultiplexProgramResponse *> *)updateMultiplexProgram:(AWSmedialiveUpdateMultiplexProgramRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/multiplexes/{multiplexId}/programs/{programName}"
                  targetPrefix:@""
                 operationName:@"UpdateMultiplexProgram"
                   outputClass:[AWSmedialiveUpdateMultiplexProgramResponse class]];
}

- (void)updateMultiplexProgram:(AWSmedialiveUpdateMultiplexProgramRequest *)request
     completionHandler:(void (^)(AWSmedialiveUpdateMultiplexProgramResponse *response, NSError *error))completionHandler {
    [[self updateMultiplexProgram:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveUpdateMultiplexProgramResponse *> * _Nonnull task) {
        AWSmedialiveUpdateMultiplexProgramResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSmedialiveUpdateReservationResponse *> *)updateReservation:(AWSmedialiveUpdateReservationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPUT
                     URLString:@"/prod/reservations/{reservationId}"
                  targetPrefix:@""
                 operationName:@"UpdateReservation"
                   outputClass:[AWSmedialiveUpdateReservationResponse class]];
}

- (void)updateReservation:(AWSmedialiveUpdateReservationRequest *)request
     completionHandler:(void (^)(AWSmedialiveUpdateReservationResponse *response, NSError *error))completionHandler {
    [[self updateReservation:request] continueWithBlock:^id _Nullable(AWSTask<AWSmedialiveUpdateReservationResponse *> * _Nonnull task) {
        AWSmedialiveUpdateReservationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
