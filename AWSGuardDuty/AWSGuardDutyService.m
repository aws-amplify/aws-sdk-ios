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

#import "AWSGuardDutyService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSGuardDutyResources.h"

static NSString *const AWSInfoGuardDuty = @"GuardDuty";
NSString *const AWSGuardDutySDKVersion = @"2.13.3";


@interface AWSGuardDutyResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSGuardDutyResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSGuardDutyErrorBadRequest),
                            @"InternalServerErrorException" : @(AWSGuardDutyErrorInternalServerError),
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
                    *error = [NSError errorWithDomain:AWSGuardDutyErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSGuardDutyErrorDomain
                                                 code:AWSGuardDutyErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSGuardDutyErrorDomain
                                     code:AWSGuardDutyErrorUnknown
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

@interface AWSGuardDutyRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSGuardDutyRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSGuardDuty()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSGuardDuty

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSGuardDutySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSGuardDuty versions need to match. Check your SDK installation. AWSCore: %@ AWSGuardDuty: %@", AWSiOSSDKVersion, AWSGuardDutySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultGuardDuty {
    static AWSGuardDuty *_defaultGuardDuty = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoGuardDuty];
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
        _defaultGuardDuty = [[AWSGuardDuty alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultGuardDuty;
}

+ (void)registerGuardDutyWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSGuardDuty alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)GuardDutyForKey:(NSString *)key {
    @synchronized(self) {
        AWSGuardDuty *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoGuardDuty
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSGuardDuty registerGuardDutyWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeGuardDutyForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultGuardDuty` or `+ GuardDutyForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceGuardDuty
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceGuardDuty];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSGuardDutyRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSGuardDutyResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSGuardDutyResponseSerializer alloc] initWithJSONDefinition:[[AWSGuardDutyResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSGuardDutyAcceptInvitationResponse *> *)acceptInvitation:(AWSGuardDutyAcceptInvitationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/master"
                  targetPrefix:@""
                 operationName:@"AcceptInvitation"
                   outputClass:[AWSGuardDutyAcceptInvitationResponse class]];
}

- (void)acceptInvitation:(AWSGuardDutyAcceptInvitationRequest *)request
     completionHandler:(void (^)(AWSGuardDutyAcceptInvitationResponse *response, NSError *error))completionHandler {
    [[self acceptInvitation:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyAcceptInvitationResponse *> * _Nonnull task) {
        AWSGuardDutyAcceptInvitationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyArchiveFindingsResponse *> *)archiveFindings:(AWSGuardDutyArchiveFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/archive"
                  targetPrefix:@""
                 operationName:@"ArchiveFindings"
                   outputClass:[AWSGuardDutyArchiveFindingsResponse class]];
}

- (void)archiveFindings:(AWSGuardDutyArchiveFindingsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyArchiveFindingsResponse *response, NSError *error))completionHandler {
    [[self archiveFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyArchiveFindingsResponse *> * _Nonnull task) {
        AWSGuardDutyArchiveFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyCreateDetectorResponse *> *)createDetector:(AWSGuardDutyCreateDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector"
                  targetPrefix:@""
                 operationName:@"CreateDetector"
                   outputClass:[AWSGuardDutyCreateDetectorResponse class]];
}

- (void)createDetector:(AWSGuardDutyCreateDetectorRequest *)request
     completionHandler:(void (^)(AWSGuardDutyCreateDetectorResponse *response, NSError *error))completionHandler {
    [[self createDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyCreateDetectorResponse *> * _Nonnull task) {
        AWSGuardDutyCreateDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyCreateFilterResponse *> *)createFilter:(AWSGuardDutyCreateFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/filter"
                  targetPrefix:@""
                 operationName:@"CreateFilter"
                   outputClass:[AWSGuardDutyCreateFilterResponse class]];
}

- (void)createFilter:(AWSGuardDutyCreateFilterRequest *)request
     completionHandler:(void (^)(AWSGuardDutyCreateFilterResponse *response, NSError *error))completionHandler {
    [[self createFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyCreateFilterResponse *> * _Nonnull task) {
        AWSGuardDutyCreateFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyCreateIPSetResponse *> *)createIPSet:(AWSGuardDutyCreateIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/ipset"
                  targetPrefix:@""
                 operationName:@"CreateIPSet"
                   outputClass:[AWSGuardDutyCreateIPSetResponse class]];
}

- (void)createIPSet:(AWSGuardDutyCreateIPSetRequest *)request
     completionHandler:(void (^)(AWSGuardDutyCreateIPSetResponse *response, NSError *error))completionHandler {
    [[self createIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyCreateIPSetResponse *> * _Nonnull task) {
        AWSGuardDutyCreateIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyCreateMembersResponse *> *)createMembers:(AWSGuardDutyCreateMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member"
                  targetPrefix:@""
                 operationName:@"CreateMembers"
                   outputClass:[AWSGuardDutyCreateMembersResponse class]];
}

- (void)createMembers:(AWSGuardDutyCreateMembersRequest *)request
     completionHandler:(void (^)(AWSGuardDutyCreateMembersResponse *response, NSError *error))completionHandler {
    [[self createMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyCreateMembersResponse *> * _Nonnull task) {
        AWSGuardDutyCreateMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyCreatePublishingDestinationResponse *> *)createPublishingDestination:(AWSGuardDutyCreatePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/publishingDestination"
                  targetPrefix:@""
                 operationName:@"CreatePublishingDestination"
                   outputClass:[AWSGuardDutyCreatePublishingDestinationResponse class]];
}

- (void)createPublishingDestination:(AWSGuardDutyCreatePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSGuardDutyCreatePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self createPublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyCreatePublishingDestinationResponse *> * _Nonnull task) {
        AWSGuardDutyCreatePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyCreateSampleFindingsResponse *> *)createSampleFindings:(AWSGuardDutyCreateSampleFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/create"
                  targetPrefix:@""
                 operationName:@"CreateSampleFindings"
                   outputClass:[AWSGuardDutyCreateSampleFindingsResponse class]];
}

- (void)createSampleFindings:(AWSGuardDutyCreateSampleFindingsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyCreateSampleFindingsResponse *response, NSError *error))completionHandler {
    [[self createSampleFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyCreateSampleFindingsResponse *> * _Nonnull task) {
        AWSGuardDutyCreateSampleFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyCreateThreatIntelSetResponse *> *)createThreatIntelSet:(AWSGuardDutyCreateThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/threatintelset"
                  targetPrefix:@""
                 operationName:@"CreateThreatIntelSet"
                   outputClass:[AWSGuardDutyCreateThreatIntelSetResponse class]];
}

- (void)createThreatIntelSet:(AWSGuardDutyCreateThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSGuardDutyCreateThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self createThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyCreateThreatIntelSetResponse *> * _Nonnull task) {
        AWSGuardDutyCreateThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDeclineInvitationsResponse *> *)declineInvitations:(AWSGuardDutyDeclineInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/invitation/decline"
                  targetPrefix:@""
                 operationName:@"DeclineInvitations"
                   outputClass:[AWSGuardDutyDeclineInvitationsResponse class]];
}

- (void)declineInvitations:(AWSGuardDutyDeclineInvitationsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDeclineInvitationsResponse *response, NSError *error))completionHandler {
    [[self declineInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDeclineInvitationsResponse *> * _Nonnull task) {
        AWSGuardDutyDeclineInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDeleteDetectorResponse *> *)deleteDetector:(AWSGuardDutyDeleteDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}"
                  targetPrefix:@""
                 operationName:@"DeleteDetector"
                   outputClass:[AWSGuardDutyDeleteDetectorResponse class]];
}

- (void)deleteDetector:(AWSGuardDutyDeleteDetectorRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDeleteDetectorResponse *response, NSError *error))completionHandler {
    [[self deleteDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDeleteDetectorResponse *> * _Nonnull task) {
        AWSGuardDutyDeleteDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDeleteFilterResponse *> *)deleteFilter:(AWSGuardDutyDeleteFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/filter/{filterName}"
                  targetPrefix:@""
                 operationName:@"DeleteFilter"
                   outputClass:[AWSGuardDutyDeleteFilterResponse class]];
}

- (void)deleteFilter:(AWSGuardDutyDeleteFilterRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDeleteFilterResponse *response, NSError *error))completionHandler {
    [[self deleteFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDeleteFilterResponse *> * _Nonnull task) {
        AWSGuardDutyDeleteFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDeleteIPSetResponse *> *)deleteIPSet:(AWSGuardDutyDeleteIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/ipset/{ipSetId}"
                  targetPrefix:@""
                 operationName:@"DeleteIPSet"
                   outputClass:[AWSGuardDutyDeleteIPSetResponse class]];
}

- (void)deleteIPSet:(AWSGuardDutyDeleteIPSetRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDeleteIPSetResponse *response, NSError *error))completionHandler {
    [[self deleteIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDeleteIPSetResponse *> * _Nonnull task) {
        AWSGuardDutyDeleteIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDeleteInvitationsResponse *> *)deleteInvitations:(AWSGuardDutyDeleteInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/invitation/delete"
                  targetPrefix:@""
                 operationName:@"DeleteInvitations"
                   outputClass:[AWSGuardDutyDeleteInvitationsResponse class]];
}

- (void)deleteInvitations:(AWSGuardDutyDeleteInvitationsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDeleteInvitationsResponse *response, NSError *error))completionHandler {
    [[self deleteInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDeleteInvitationsResponse *> * _Nonnull task) {
        AWSGuardDutyDeleteInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDeleteMembersResponse *> *)deleteMembers:(AWSGuardDutyDeleteMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/delete"
                  targetPrefix:@""
                 operationName:@"DeleteMembers"
                   outputClass:[AWSGuardDutyDeleteMembersResponse class]];
}

- (void)deleteMembers:(AWSGuardDutyDeleteMembersRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDeleteMembersResponse *response, NSError *error))completionHandler {
    [[self deleteMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDeleteMembersResponse *> * _Nonnull task) {
        AWSGuardDutyDeleteMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDeletePublishingDestinationResponse *> *)deletePublishingDestination:(AWSGuardDutyDeletePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/publishingDestination/{destinationId}"
                  targetPrefix:@""
                 operationName:@"DeletePublishingDestination"
                   outputClass:[AWSGuardDutyDeletePublishingDestinationResponse class]];
}

- (void)deletePublishingDestination:(AWSGuardDutyDeletePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDeletePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self deletePublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDeletePublishingDestinationResponse *> * _Nonnull task) {
        AWSGuardDutyDeletePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDeleteThreatIntelSetResponse *> *)deleteThreatIntelSet:(AWSGuardDutyDeleteThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/threatintelset/{threatIntelSetId}"
                  targetPrefix:@""
                 operationName:@"DeleteThreatIntelSet"
                   outputClass:[AWSGuardDutyDeleteThreatIntelSetResponse class]];
}

- (void)deleteThreatIntelSet:(AWSGuardDutyDeleteThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDeleteThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self deleteThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDeleteThreatIntelSetResponse *> * _Nonnull task) {
        AWSGuardDutyDeleteThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDescribeOrganizationConfigurationResponse *> *)describeOrganizationConfiguration:(AWSGuardDutyDescribeOrganizationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/admin"
                  targetPrefix:@""
                 operationName:@"DescribeOrganizationConfiguration"
                   outputClass:[AWSGuardDutyDescribeOrganizationConfigurationResponse class]];
}

- (void)describeOrganizationConfiguration:(AWSGuardDutyDescribeOrganizationConfigurationRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDescribeOrganizationConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeOrganizationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDescribeOrganizationConfigurationResponse *> * _Nonnull task) {
        AWSGuardDutyDescribeOrganizationConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDescribePublishingDestinationResponse *> *)describePublishingDestination:(AWSGuardDutyDescribePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/publishingDestination/{destinationId}"
                  targetPrefix:@""
                 operationName:@"DescribePublishingDestination"
                   outputClass:[AWSGuardDutyDescribePublishingDestinationResponse class]];
}

- (void)describePublishingDestination:(AWSGuardDutyDescribePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDescribePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self describePublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDescribePublishingDestinationResponse *> * _Nonnull task) {
        AWSGuardDutyDescribePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDisableOrganizationAdminAccountResponse *> *)disableOrganizationAdminAccount:(AWSGuardDutyDisableOrganizationAdminAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/admin/disable"
                  targetPrefix:@""
                 operationName:@"DisableOrganizationAdminAccount"
                   outputClass:[AWSGuardDutyDisableOrganizationAdminAccountResponse class]];
}

- (void)disableOrganizationAdminAccount:(AWSGuardDutyDisableOrganizationAdminAccountRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDisableOrganizationAdminAccountResponse *response, NSError *error))completionHandler {
    [[self disableOrganizationAdminAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDisableOrganizationAdminAccountResponse *> * _Nonnull task) {
        AWSGuardDutyDisableOrganizationAdminAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDisassociateFromMasterAccountResponse *> *)disassociateFromMasterAccount:(AWSGuardDutyDisassociateFromMasterAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/master/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateFromMasterAccount"
                   outputClass:[AWSGuardDutyDisassociateFromMasterAccountResponse class]];
}

- (void)disassociateFromMasterAccount:(AWSGuardDutyDisassociateFromMasterAccountRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDisassociateFromMasterAccountResponse *response, NSError *error))completionHandler {
    [[self disassociateFromMasterAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDisassociateFromMasterAccountResponse *> * _Nonnull task) {
        AWSGuardDutyDisassociateFromMasterAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyDisassociateMembersResponse *> *)disassociateMembers:(AWSGuardDutyDisassociateMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateMembers"
                   outputClass:[AWSGuardDutyDisassociateMembersResponse class]];
}

- (void)disassociateMembers:(AWSGuardDutyDisassociateMembersRequest *)request
     completionHandler:(void (^)(AWSGuardDutyDisassociateMembersResponse *response, NSError *error))completionHandler {
    [[self disassociateMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyDisassociateMembersResponse *> * _Nonnull task) {
        AWSGuardDutyDisassociateMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyEnableOrganizationAdminAccountResponse *> *)enableOrganizationAdminAccount:(AWSGuardDutyEnableOrganizationAdminAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/admin/enable"
                  targetPrefix:@""
                 operationName:@"EnableOrganizationAdminAccount"
                   outputClass:[AWSGuardDutyEnableOrganizationAdminAccountResponse class]];
}

- (void)enableOrganizationAdminAccount:(AWSGuardDutyEnableOrganizationAdminAccountRequest *)request
     completionHandler:(void (^)(AWSGuardDutyEnableOrganizationAdminAccountResponse *response, NSError *error))completionHandler {
    [[self enableOrganizationAdminAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyEnableOrganizationAdminAccountResponse *> * _Nonnull task) {
        AWSGuardDutyEnableOrganizationAdminAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyGetDetectorResponse *> *)getDetector:(AWSGuardDutyGetDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}"
                  targetPrefix:@""
                 operationName:@"GetDetector"
                   outputClass:[AWSGuardDutyGetDetectorResponse class]];
}

- (void)getDetector:(AWSGuardDutyGetDetectorRequest *)request
     completionHandler:(void (^)(AWSGuardDutyGetDetectorResponse *response, NSError *error))completionHandler {
    [[self getDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyGetDetectorResponse *> * _Nonnull task) {
        AWSGuardDutyGetDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyGetFilterResponse *> *)getFilter:(AWSGuardDutyGetFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/filter/{filterName}"
                  targetPrefix:@""
                 operationName:@"GetFilter"
                   outputClass:[AWSGuardDutyGetFilterResponse class]];
}

- (void)getFilter:(AWSGuardDutyGetFilterRequest *)request
     completionHandler:(void (^)(AWSGuardDutyGetFilterResponse *response, NSError *error))completionHandler {
    [[self getFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyGetFilterResponse *> * _Nonnull task) {
        AWSGuardDutyGetFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyGetFindingsResponse *> *)getFindings:(AWSGuardDutyGetFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/get"
                  targetPrefix:@""
                 operationName:@"GetFindings"
                   outputClass:[AWSGuardDutyGetFindingsResponse class]];
}

- (void)getFindings:(AWSGuardDutyGetFindingsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyGetFindingsResponse *response, NSError *error))completionHandler {
    [[self getFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyGetFindingsResponse *> * _Nonnull task) {
        AWSGuardDutyGetFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyGetFindingsStatisticsResponse *> *)getFindingsStatistics:(AWSGuardDutyGetFindingsStatisticsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/statistics"
                  targetPrefix:@""
                 operationName:@"GetFindingsStatistics"
                   outputClass:[AWSGuardDutyGetFindingsStatisticsResponse class]];
}

- (void)getFindingsStatistics:(AWSGuardDutyGetFindingsStatisticsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyGetFindingsStatisticsResponse *response, NSError *error))completionHandler {
    [[self getFindingsStatistics:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyGetFindingsStatisticsResponse *> * _Nonnull task) {
        AWSGuardDutyGetFindingsStatisticsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyGetIPSetResponse *> *)getIPSet:(AWSGuardDutyGetIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/ipset/{ipSetId}"
                  targetPrefix:@""
                 operationName:@"GetIPSet"
                   outputClass:[AWSGuardDutyGetIPSetResponse class]];
}

- (void)getIPSet:(AWSGuardDutyGetIPSetRequest *)request
     completionHandler:(void (^)(AWSGuardDutyGetIPSetResponse *response, NSError *error))completionHandler {
    [[self getIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyGetIPSetResponse *> * _Nonnull task) {
        AWSGuardDutyGetIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyGetInvitationsCountResponse *> *)getInvitationsCount:(AWSGuardDutyGetInvitationsCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/invitation/count"
                  targetPrefix:@""
                 operationName:@"GetInvitationsCount"
                   outputClass:[AWSGuardDutyGetInvitationsCountResponse class]];
}

- (void)getInvitationsCount:(AWSGuardDutyGetInvitationsCountRequest *)request
     completionHandler:(void (^)(AWSGuardDutyGetInvitationsCountResponse *response, NSError *error))completionHandler {
    [[self getInvitationsCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyGetInvitationsCountResponse *> * _Nonnull task) {
        AWSGuardDutyGetInvitationsCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyGetMasterAccountResponse *> *)getMasterAccount:(AWSGuardDutyGetMasterAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/master"
                  targetPrefix:@""
                 operationName:@"GetMasterAccount"
                   outputClass:[AWSGuardDutyGetMasterAccountResponse class]];
}

- (void)getMasterAccount:(AWSGuardDutyGetMasterAccountRequest *)request
     completionHandler:(void (^)(AWSGuardDutyGetMasterAccountResponse *response, NSError *error))completionHandler {
    [[self getMasterAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyGetMasterAccountResponse *> * _Nonnull task) {
        AWSGuardDutyGetMasterAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyGetMembersResponse *> *)getMembers:(AWSGuardDutyGetMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/get"
                  targetPrefix:@""
                 operationName:@"GetMembers"
                   outputClass:[AWSGuardDutyGetMembersResponse class]];
}

- (void)getMembers:(AWSGuardDutyGetMembersRequest *)request
     completionHandler:(void (^)(AWSGuardDutyGetMembersResponse *response, NSError *error))completionHandler {
    [[self getMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyGetMembersResponse *> * _Nonnull task) {
        AWSGuardDutyGetMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyGetThreatIntelSetResponse *> *)getThreatIntelSet:(AWSGuardDutyGetThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/threatintelset/{threatIntelSetId}"
                  targetPrefix:@""
                 operationName:@"GetThreatIntelSet"
                   outputClass:[AWSGuardDutyGetThreatIntelSetResponse class]];
}

- (void)getThreatIntelSet:(AWSGuardDutyGetThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSGuardDutyGetThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self getThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyGetThreatIntelSetResponse *> * _Nonnull task) {
        AWSGuardDutyGetThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyInviteMembersResponse *> *)inviteMembers:(AWSGuardDutyInviteMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/invite"
                  targetPrefix:@""
                 operationName:@"InviteMembers"
                   outputClass:[AWSGuardDutyInviteMembersResponse class]];
}

- (void)inviteMembers:(AWSGuardDutyInviteMembersRequest *)request
     completionHandler:(void (^)(AWSGuardDutyInviteMembersResponse *response, NSError *error))completionHandler {
    [[self inviteMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyInviteMembersResponse *> * _Nonnull task) {
        AWSGuardDutyInviteMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyListDetectorsResponse *> *)listDetectors:(AWSGuardDutyListDetectorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector"
                  targetPrefix:@""
                 operationName:@"ListDetectors"
                   outputClass:[AWSGuardDutyListDetectorsResponse class]];
}

- (void)listDetectors:(AWSGuardDutyListDetectorsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyListDetectorsResponse *response, NSError *error))completionHandler {
    [[self listDetectors:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyListDetectorsResponse *> * _Nonnull task) {
        AWSGuardDutyListDetectorsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyListFiltersResponse *> *)listFilters:(AWSGuardDutyListFiltersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/filter"
                  targetPrefix:@""
                 operationName:@"ListFilters"
                   outputClass:[AWSGuardDutyListFiltersResponse class]];
}

- (void)listFilters:(AWSGuardDutyListFiltersRequest *)request
     completionHandler:(void (^)(AWSGuardDutyListFiltersResponse *response, NSError *error))completionHandler {
    [[self listFilters:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyListFiltersResponse *> * _Nonnull task) {
        AWSGuardDutyListFiltersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyListFindingsResponse *> *)listFindings:(AWSGuardDutyListFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings"
                  targetPrefix:@""
                 operationName:@"ListFindings"
                   outputClass:[AWSGuardDutyListFindingsResponse class]];
}

- (void)listFindings:(AWSGuardDutyListFindingsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyListFindingsResponse *response, NSError *error))completionHandler {
    [[self listFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyListFindingsResponse *> * _Nonnull task) {
        AWSGuardDutyListFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyListIPSetsResponse *> *)listIPSets:(AWSGuardDutyListIPSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/ipset"
                  targetPrefix:@""
                 operationName:@"ListIPSets"
                   outputClass:[AWSGuardDutyListIPSetsResponse class]];
}

- (void)listIPSets:(AWSGuardDutyListIPSetsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyListIPSetsResponse *response, NSError *error))completionHandler {
    [[self listIPSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyListIPSetsResponse *> * _Nonnull task) {
        AWSGuardDutyListIPSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyListInvitationsResponse *> *)listInvitations:(AWSGuardDutyListInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/invitation"
                  targetPrefix:@""
                 operationName:@"ListInvitations"
                   outputClass:[AWSGuardDutyListInvitationsResponse class]];
}

- (void)listInvitations:(AWSGuardDutyListInvitationsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyListInvitationsResponse *response, NSError *error))completionHandler {
    [[self listInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyListInvitationsResponse *> * _Nonnull task) {
        AWSGuardDutyListInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyListMembersResponse *> *)listMembers:(AWSGuardDutyListMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/member"
                  targetPrefix:@""
                 operationName:@"ListMembers"
                   outputClass:[AWSGuardDutyListMembersResponse class]];
}

- (void)listMembers:(AWSGuardDutyListMembersRequest *)request
     completionHandler:(void (^)(AWSGuardDutyListMembersResponse *response, NSError *error))completionHandler {
    [[self listMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyListMembersResponse *> * _Nonnull task) {
        AWSGuardDutyListMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyListOrganizationAdminAccountsResponse *> *)listOrganizationAdminAccounts:(AWSGuardDutyListOrganizationAdminAccountsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/admin"
                  targetPrefix:@""
                 operationName:@"ListOrganizationAdminAccounts"
                   outputClass:[AWSGuardDutyListOrganizationAdminAccountsResponse class]];
}

- (void)listOrganizationAdminAccounts:(AWSGuardDutyListOrganizationAdminAccountsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyListOrganizationAdminAccountsResponse *response, NSError *error))completionHandler {
    [[self listOrganizationAdminAccounts:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyListOrganizationAdminAccountsResponse *> * _Nonnull task) {
        AWSGuardDutyListOrganizationAdminAccountsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyListPublishingDestinationsResponse *> *)listPublishingDestinations:(AWSGuardDutyListPublishingDestinationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/publishingDestination"
                  targetPrefix:@""
                 operationName:@"ListPublishingDestinations"
                   outputClass:[AWSGuardDutyListPublishingDestinationsResponse class]];
}

- (void)listPublishingDestinations:(AWSGuardDutyListPublishingDestinationsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyListPublishingDestinationsResponse *response, NSError *error))completionHandler {
    [[self listPublishingDestinations:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyListPublishingDestinationsResponse *> * _Nonnull task) {
        AWSGuardDutyListPublishingDestinationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyListTagsForResourceResponse *> *)listTagsForResource:(AWSGuardDutyListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSGuardDutyListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSGuardDutyListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSGuardDutyListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyListTagsForResourceResponse *> * _Nonnull task) {
        AWSGuardDutyListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyListThreatIntelSetsResponse *> *)listThreatIntelSets:(AWSGuardDutyListThreatIntelSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/threatintelset"
                  targetPrefix:@""
                 operationName:@"ListThreatIntelSets"
                   outputClass:[AWSGuardDutyListThreatIntelSetsResponse class]];
}

- (void)listThreatIntelSets:(AWSGuardDutyListThreatIntelSetsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyListThreatIntelSetsResponse *response, NSError *error))completionHandler {
    [[self listThreatIntelSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyListThreatIntelSetsResponse *> * _Nonnull task) {
        AWSGuardDutyListThreatIntelSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyStartMonitoringMembersResponse *> *)startMonitoringMembers:(AWSGuardDutyStartMonitoringMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/start"
                  targetPrefix:@""
                 operationName:@"StartMonitoringMembers"
                   outputClass:[AWSGuardDutyStartMonitoringMembersResponse class]];
}

- (void)startMonitoringMembers:(AWSGuardDutyStartMonitoringMembersRequest *)request
     completionHandler:(void (^)(AWSGuardDutyStartMonitoringMembersResponse *response, NSError *error))completionHandler {
    [[self startMonitoringMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyStartMonitoringMembersResponse *> * _Nonnull task) {
        AWSGuardDutyStartMonitoringMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyStopMonitoringMembersResponse *> *)stopMonitoringMembers:(AWSGuardDutyStopMonitoringMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/stop"
                  targetPrefix:@""
                 operationName:@"StopMonitoringMembers"
                   outputClass:[AWSGuardDutyStopMonitoringMembersResponse class]];
}

- (void)stopMonitoringMembers:(AWSGuardDutyStopMonitoringMembersRequest *)request
     completionHandler:(void (^)(AWSGuardDutyStopMonitoringMembersResponse *response, NSError *error))completionHandler {
    [[self stopMonitoringMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyStopMonitoringMembersResponse *> * _Nonnull task) {
        AWSGuardDutyStopMonitoringMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyTagResourceResponse *> *)tagResource:(AWSGuardDutyTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSGuardDutyTagResourceResponse class]];
}

- (void)tagResource:(AWSGuardDutyTagResourceRequest *)request
     completionHandler:(void (^)(AWSGuardDutyTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyTagResourceResponse *> * _Nonnull task) {
        AWSGuardDutyTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyUnarchiveFindingsResponse *> *)unarchiveFindings:(AWSGuardDutyUnarchiveFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/unarchive"
                  targetPrefix:@""
                 operationName:@"UnarchiveFindings"
                   outputClass:[AWSGuardDutyUnarchiveFindingsResponse class]];
}

- (void)unarchiveFindings:(AWSGuardDutyUnarchiveFindingsRequest *)request
     completionHandler:(void (^)(AWSGuardDutyUnarchiveFindingsResponse *response, NSError *error))completionHandler {
    [[self unarchiveFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyUnarchiveFindingsResponse *> * _Nonnull task) {
        AWSGuardDutyUnarchiveFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyUntagResourceResponse *> *)untagResource:(AWSGuardDutyUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSGuardDutyUntagResourceResponse class]];
}

- (void)untagResource:(AWSGuardDutyUntagResourceRequest *)request
     completionHandler:(void (^)(AWSGuardDutyUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyUntagResourceResponse *> * _Nonnull task) {
        AWSGuardDutyUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyUpdateDetectorResponse *> *)updateDetector:(AWSGuardDutyUpdateDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}"
                  targetPrefix:@""
                 operationName:@"UpdateDetector"
                   outputClass:[AWSGuardDutyUpdateDetectorResponse class]];
}

- (void)updateDetector:(AWSGuardDutyUpdateDetectorRequest *)request
     completionHandler:(void (^)(AWSGuardDutyUpdateDetectorResponse *response, NSError *error))completionHandler {
    [[self updateDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyUpdateDetectorResponse *> * _Nonnull task) {
        AWSGuardDutyUpdateDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyUpdateFilterResponse *> *)updateFilter:(AWSGuardDutyUpdateFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/filter/{filterName}"
                  targetPrefix:@""
                 operationName:@"UpdateFilter"
                   outputClass:[AWSGuardDutyUpdateFilterResponse class]];
}

- (void)updateFilter:(AWSGuardDutyUpdateFilterRequest *)request
     completionHandler:(void (^)(AWSGuardDutyUpdateFilterResponse *response, NSError *error))completionHandler {
    [[self updateFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyUpdateFilterResponse *> * _Nonnull task) {
        AWSGuardDutyUpdateFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyUpdateFindingsFeedbackResponse *> *)updateFindingsFeedback:(AWSGuardDutyUpdateFindingsFeedbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/feedback"
                  targetPrefix:@""
                 operationName:@"UpdateFindingsFeedback"
                   outputClass:[AWSGuardDutyUpdateFindingsFeedbackResponse class]];
}

- (void)updateFindingsFeedback:(AWSGuardDutyUpdateFindingsFeedbackRequest *)request
     completionHandler:(void (^)(AWSGuardDutyUpdateFindingsFeedbackResponse *response, NSError *error))completionHandler {
    [[self updateFindingsFeedback:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyUpdateFindingsFeedbackResponse *> * _Nonnull task) {
        AWSGuardDutyUpdateFindingsFeedbackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyUpdateIPSetResponse *> *)updateIPSet:(AWSGuardDutyUpdateIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/ipset/{ipSetId}"
                  targetPrefix:@""
                 operationName:@"UpdateIPSet"
                   outputClass:[AWSGuardDutyUpdateIPSetResponse class]];
}

- (void)updateIPSet:(AWSGuardDutyUpdateIPSetRequest *)request
     completionHandler:(void (^)(AWSGuardDutyUpdateIPSetResponse *response, NSError *error))completionHandler {
    [[self updateIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyUpdateIPSetResponse *> * _Nonnull task) {
        AWSGuardDutyUpdateIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyUpdateOrganizationConfigurationResponse *> *)updateOrganizationConfiguration:(AWSGuardDutyUpdateOrganizationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/admin"
                  targetPrefix:@""
                 operationName:@"UpdateOrganizationConfiguration"
                   outputClass:[AWSGuardDutyUpdateOrganizationConfigurationResponse class]];
}

- (void)updateOrganizationConfiguration:(AWSGuardDutyUpdateOrganizationConfigurationRequest *)request
     completionHandler:(void (^)(AWSGuardDutyUpdateOrganizationConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateOrganizationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyUpdateOrganizationConfigurationResponse *> * _Nonnull task) {
        AWSGuardDutyUpdateOrganizationConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyUpdatePublishingDestinationResponse *> *)updatePublishingDestination:(AWSGuardDutyUpdatePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/publishingDestination/{destinationId}"
                  targetPrefix:@""
                 operationName:@"UpdatePublishingDestination"
                   outputClass:[AWSGuardDutyUpdatePublishingDestinationResponse class]];
}

- (void)updatePublishingDestination:(AWSGuardDutyUpdatePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSGuardDutyUpdatePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self updatePublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyUpdatePublishingDestinationResponse *> * _Nonnull task) {
        AWSGuardDutyUpdatePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuardDutyUpdateThreatIntelSetResponse *> *)updateThreatIntelSet:(AWSGuardDutyUpdateThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/threatintelset/{threatIntelSetId}"
                  targetPrefix:@""
                 operationName:@"UpdateThreatIntelSet"
                   outputClass:[AWSGuardDutyUpdateThreatIntelSetResponse class]];
}

- (void)updateThreatIntelSet:(AWSGuardDutyUpdateThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSGuardDutyUpdateThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self updateThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuardDutyUpdateThreatIntelSetResponse *> * _Nonnull task) {
        AWSGuardDutyUpdateThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
