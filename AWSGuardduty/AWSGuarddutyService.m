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

#import "AWSGuarddutyService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSGuarddutyResources.h"

static NSString *const AWSInfoGuardduty = @"Guardduty";
NSString *const AWSGuarddutySDKVersion = @"2.13.4";


@interface AWSGuarddutyResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSGuarddutyResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSGuarddutyErrorBadRequest),
                            @"InternalServerErrorException" : @(AWSGuarddutyErrorInternalServerError),
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
                    *error = [NSError errorWithDomain:AWSGuarddutyErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSGuarddutyErrorDomain
                                                 code:AWSGuarddutyErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSGuarddutyErrorDomain
                                     code:AWSGuarddutyErrorUnknown
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

@interface AWSGuarddutyRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSGuarddutyRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSGuardduty()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSGuardduty

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSGuarddutySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSGuardduty versions need to match. Check your SDK installation. AWSCore: %@ AWSGuardduty: %@", AWSiOSSDKVersion, AWSGuarddutySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultGuardduty {
    static AWSGuardduty *_defaultGuardduty = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoGuardduty];
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
        _defaultGuardduty = [[AWSGuardduty alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultGuardduty;
}

+ (void)registerGuarddutyWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSGuardduty alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)GuarddutyForKey:(NSString *)key {
    @synchronized(self) {
        AWSGuardduty *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoGuardduty
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSGuardduty registerGuarddutyWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeGuarddutyForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultGuardduty` or `+ GuarddutyForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceGuardduty
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceGuardduty];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSGuarddutyRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSGuarddutyResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSGuarddutyResponseSerializer alloc] initWithJSONDefinition:[[AWSGuarddutyResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSGuarddutyAcceptInvitationResponse *> *)acceptInvitation:(AWSGuarddutyAcceptInvitationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/master"
                  targetPrefix:@""
                 operationName:@"AcceptInvitation"
                   outputClass:[AWSGuarddutyAcceptInvitationResponse class]];
}

- (void)acceptInvitation:(AWSGuarddutyAcceptInvitationRequest *)request
     completionHandler:(void (^)(AWSGuarddutyAcceptInvitationResponse *response, NSError *error))completionHandler {
    [[self acceptInvitation:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyAcceptInvitationResponse *> * _Nonnull task) {
        AWSGuarddutyAcceptInvitationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyArchiveFindingsResponse *> *)archiveFindings:(AWSGuarddutyArchiveFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/archive"
                  targetPrefix:@""
                 operationName:@"ArchiveFindings"
                   outputClass:[AWSGuarddutyArchiveFindingsResponse class]];
}

- (void)archiveFindings:(AWSGuarddutyArchiveFindingsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyArchiveFindingsResponse *response, NSError *error))completionHandler {
    [[self archiveFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyArchiveFindingsResponse *> * _Nonnull task) {
        AWSGuarddutyArchiveFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyCreateDetectorResponse *> *)createDetector:(AWSGuarddutyCreateDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector"
                  targetPrefix:@""
                 operationName:@"CreateDetector"
                   outputClass:[AWSGuarddutyCreateDetectorResponse class]];
}

- (void)createDetector:(AWSGuarddutyCreateDetectorRequest *)request
     completionHandler:(void (^)(AWSGuarddutyCreateDetectorResponse *response, NSError *error))completionHandler {
    [[self createDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyCreateDetectorResponse *> * _Nonnull task) {
        AWSGuarddutyCreateDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyCreateFilterResponse *> *)createFilter:(AWSGuarddutyCreateFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/filter"
                  targetPrefix:@""
                 operationName:@"CreateFilter"
                   outputClass:[AWSGuarddutyCreateFilterResponse class]];
}

- (void)createFilter:(AWSGuarddutyCreateFilterRequest *)request
     completionHandler:(void (^)(AWSGuarddutyCreateFilterResponse *response, NSError *error))completionHandler {
    [[self createFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyCreateFilterResponse *> * _Nonnull task) {
        AWSGuarddutyCreateFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyCreateIPSetResponse *> *)createIPSet:(AWSGuarddutyCreateIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/ipset"
                  targetPrefix:@""
                 operationName:@"CreateIPSet"
                   outputClass:[AWSGuarddutyCreateIPSetResponse class]];
}

- (void)createIPSet:(AWSGuarddutyCreateIPSetRequest *)request
     completionHandler:(void (^)(AWSGuarddutyCreateIPSetResponse *response, NSError *error))completionHandler {
    [[self createIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyCreateIPSetResponse *> * _Nonnull task) {
        AWSGuarddutyCreateIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyCreateMembersResponse *> *)createMembers:(AWSGuarddutyCreateMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member"
                  targetPrefix:@""
                 operationName:@"CreateMembers"
                   outputClass:[AWSGuarddutyCreateMembersResponse class]];
}

- (void)createMembers:(AWSGuarddutyCreateMembersRequest *)request
     completionHandler:(void (^)(AWSGuarddutyCreateMembersResponse *response, NSError *error))completionHandler {
    [[self createMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyCreateMembersResponse *> * _Nonnull task) {
        AWSGuarddutyCreateMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyCreatePublishingDestinationResponse *> *)createPublishingDestination:(AWSGuarddutyCreatePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/publishingDestination"
                  targetPrefix:@""
                 operationName:@"CreatePublishingDestination"
                   outputClass:[AWSGuarddutyCreatePublishingDestinationResponse class]];
}

- (void)createPublishingDestination:(AWSGuarddutyCreatePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSGuarddutyCreatePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self createPublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyCreatePublishingDestinationResponse *> * _Nonnull task) {
        AWSGuarddutyCreatePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyCreateSampleFindingsResponse *> *)createSampleFindings:(AWSGuarddutyCreateSampleFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/create"
                  targetPrefix:@""
                 operationName:@"CreateSampleFindings"
                   outputClass:[AWSGuarddutyCreateSampleFindingsResponse class]];
}

- (void)createSampleFindings:(AWSGuarddutyCreateSampleFindingsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyCreateSampleFindingsResponse *response, NSError *error))completionHandler {
    [[self createSampleFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyCreateSampleFindingsResponse *> * _Nonnull task) {
        AWSGuarddutyCreateSampleFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyCreateThreatIntelSetResponse *> *)createThreatIntelSet:(AWSGuarddutyCreateThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/threatintelset"
                  targetPrefix:@""
                 operationName:@"CreateThreatIntelSet"
                   outputClass:[AWSGuarddutyCreateThreatIntelSetResponse class]];
}

- (void)createThreatIntelSet:(AWSGuarddutyCreateThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSGuarddutyCreateThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self createThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyCreateThreatIntelSetResponse *> * _Nonnull task) {
        AWSGuarddutyCreateThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDeclineInvitationsResponse *> *)declineInvitations:(AWSGuarddutyDeclineInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/invitation/decline"
                  targetPrefix:@""
                 operationName:@"DeclineInvitations"
                   outputClass:[AWSGuarddutyDeclineInvitationsResponse class]];
}

- (void)declineInvitations:(AWSGuarddutyDeclineInvitationsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDeclineInvitationsResponse *response, NSError *error))completionHandler {
    [[self declineInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDeclineInvitationsResponse *> * _Nonnull task) {
        AWSGuarddutyDeclineInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDeleteDetectorResponse *> *)deleteDetector:(AWSGuarddutyDeleteDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}"
                  targetPrefix:@""
                 operationName:@"DeleteDetector"
                   outputClass:[AWSGuarddutyDeleteDetectorResponse class]];
}

- (void)deleteDetector:(AWSGuarddutyDeleteDetectorRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDeleteDetectorResponse *response, NSError *error))completionHandler {
    [[self deleteDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDeleteDetectorResponse *> * _Nonnull task) {
        AWSGuarddutyDeleteDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDeleteFilterResponse *> *)deleteFilter:(AWSGuarddutyDeleteFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/filter/{filterName}"
                  targetPrefix:@""
                 operationName:@"DeleteFilter"
                   outputClass:[AWSGuarddutyDeleteFilterResponse class]];
}

- (void)deleteFilter:(AWSGuarddutyDeleteFilterRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDeleteFilterResponse *response, NSError *error))completionHandler {
    [[self deleteFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDeleteFilterResponse *> * _Nonnull task) {
        AWSGuarddutyDeleteFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDeleteIPSetResponse *> *)deleteIPSet:(AWSGuarddutyDeleteIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/ipset/{ipSetId}"
                  targetPrefix:@""
                 operationName:@"DeleteIPSet"
                   outputClass:[AWSGuarddutyDeleteIPSetResponse class]];
}

- (void)deleteIPSet:(AWSGuarddutyDeleteIPSetRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDeleteIPSetResponse *response, NSError *error))completionHandler {
    [[self deleteIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDeleteIPSetResponse *> * _Nonnull task) {
        AWSGuarddutyDeleteIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDeleteInvitationsResponse *> *)deleteInvitations:(AWSGuarddutyDeleteInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/invitation/delete"
                  targetPrefix:@""
                 operationName:@"DeleteInvitations"
                   outputClass:[AWSGuarddutyDeleteInvitationsResponse class]];
}

- (void)deleteInvitations:(AWSGuarddutyDeleteInvitationsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDeleteInvitationsResponse *response, NSError *error))completionHandler {
    [[self deleteInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDeleteInvitationsResponse *> * _Nonnull task) {
        AWSGuarddutyDeleteInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDeleteMembersResponse *> *)deleteMembers:(AWSGuarddutyDeleteMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/delete"
                  targetPrefix:@""
                 operationName:@"DeleteMembers"
                   outputClass:[AWSGuarddutyDeleteMembersResponse class]];
}

- (void)deleteMembers:(AWSGuarddutyDeleteMembersRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDeleteMembersResponse *response, NSError *error))completionHandler {
    [[self deleteMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDeleteMembersResponse *> * _Nonnull task) {
        AWSGuarddutyDeleteMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDeletePublishingDestinationResponse *> *)deletePublishingDestination:(AWSGuarddutyDeletePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/publishingDestination/{destinationId}"
                  targetPrefix:@""
                 operationName:@"DeletePublishingDestination"
                   outputClass:[AWSGuarddutyDeletePublishingDestinationResponse class]];
}

- (void)deletePublishingDestination:(AWSGuarddutyDeletePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDeletePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self deletePublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDeletePublishingDestinationResponse *> * _Nonnull task) {
        AWSGuarddutyDeletePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDeleteThreatIntelSetResponse *> *)deleteThreatIntelSet:(AWSGuarddutyDeleteThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/threatintelset/{threatIntelSetId}"
                  targetPrefix:@""
                 operationName:@"DeleteThreatIntelSet"
                   outputClass:[AWSGuarddutyDeleteThreatIntelSetResponse class]];
}

- (void)deleteThreatIntelSet:(AWSGuarddutyDeleteThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDeleteThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self deleteThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDeleteThreatIntelSetResponse *> * _Nonnull task) {
        AWSGuarddutyDeleteThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDescribeOrganizationConfigurationResponse *> *)describeOrganizationConfiguration:(AWSGuarddutyDescribeOrganizationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/admin"
                  targetPrefix:@""
                 operationName:@"DescribeOrganizationConfiguration"
                   outputClass:[AWSGuarddutyDescribeOrganizationConfigurationResponse class]];
}

- (void)describeOrganizationConfiguration:(AWSGuarddutyDescribeOrganizationConfigurationRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDescribeOrganizationConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeOrganizationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDescribeOrganizationConfigurationResponse *> * _Nonnull task) {
        AWSGuarddutyDescribeOrganizationConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDescribePublishingDestinationResponse *> *)describePublishingDestination:(AWSGuarddutyDescribePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/publishingDestination/{destinationId}"
                  targetPrefix:@""
                 operationName:@"DescribePublishingDestination"
                   outputClass:[AWSGuarddutyDescribePublishingDestinationResponse class]];
}

- (void)describePublishingDestination:(AWSGuarddutyDescribePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDescribePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self describePublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDescribePublishingDestinationResponse *> * _Nonnull task) {
        AWSGuarddutyDescribePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDisableOrganizationAdminAccountResponse *> *)disableOrganizationAdminAccount:(AWSGuarddutyDisableOrganizationAdminAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/admin/disable"
                  targetPrefix:@""
                 operationName:@"DisableOrganizationAdminAccount"
                   outputClass:[AWSGuarddutyDisableOrganizationAdminAccountResponse class]];
}

- (void)disableOrganizationAdminAccount:(AWSGuarddutyDisableOrganizationAdminAccountRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDisableOrganizationAdminAccountResponse *response, NSError *error))completionHandler {
    [[self disableOrganizationAdminAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDisableOrganizationAdminAccountResponse *> * _Nonnull task) {
        AWSGuarddutyDisableOrganizationAdminAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDisassociateFromMasterAccountResponse *> *)disassociateFromMasterAccount:(AWSGuarddutyDisassociateFromMasterAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/master/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateFromMasterAccount"
                   outputClass:[AWSGuarddutyDisassociateFromMasterAccountResponse class]];
}

- (void)disassociateFromMasterAccount:(AWSGuarddutyDisassociateFromMasterAccountRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDisassociateFromMasterAccountResponse *response, NSError *error))completionHandler {
    [[self disassociateFromMasterAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDisassociateFromMasterAccountResponse *> * _Nonnull task) {
        AWSGuarddutyDisassociateFromMasterAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyDisassociateMembersResponse *> *)disassociateMembers:(AWSGuarddutyDisassociateMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateMembers"
                   outputClass:[AWSGuarddutyDisassociateMembersResponse class]];
}

- (void)disassociateMembers:(AWSGuarddutyDisassociateMembersRequest *)request
     completionHandler:(void (^)(AWSGuarddutyDisassociateMembersResponse *response, NSError *error))completionHandler {
    [[self disassociateMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyDisassociateMembersResponse *> * _Nonnull task) {
        AWSGuarddutyDisassociateMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyEnableOrganizationAdminAccountResponse *> *)enableOrganizationAdminAccount:(AWSGuarddutyEnableOrganizationAdminAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/admin/enable"
                  targetPrefix:@""
                 operationName:@"EnableOrganizationAdminAccount"
                   outputClass:[AWSGuarddutyEnableOrganizationAdminAccountResponse class]];
}

- (void)enableOrganizationAdminAccount:(AWSGuarddutyEnableOrganizationAdminAccountRequest *)request
     completionHandler:(void (^)(AWSGuarddutyEnableOrganizationAdminAccountResponse *response, NSError *error))completionHandler {
    [[self enableOrganizationAdminAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyEnableOrganizationAdminAccountResponse *> * _Nonnull task) {
        AWSGuarddutyEnableOrganizationAdminAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyGetDetectorResponse *> *)getDetector:(AWSGuarddutyGetDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}"
                  targetPrefix:@""
                 operationName:@"GetDetector"
                   outputClass:[AWSGuarddutyGetDetectorResponse class]];
}

- (void)getDetector:(AWSGuarddutyGetDetectorRequest *)request
     completionHandler:(void (^)(AWSGuarddutyGetDetectorResponse *response, NSError *error))completionHandler {
    [[self getDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyGetDetectorResponse *> * _Nonnull task) {
        AWSGuarddutyGetDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyGetFilterResponse *> *)getFilter:(AWSGuarddutyGetFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/filter/{filterName}"
                  targetPrefix:@""
                 operationName:@"GetFilter"
                   outputClass:[AWSGuarddutyGetFilterResponse class]];
}

- (void)getFilter:(AWSGuarddutyGetFilterRequest *)request
     completionHandler:(void (^)(AWSGuarddutyGetFilterResponse *response, NSError *error))completionHandler {
    [[self getFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyGetFilterResponse *> * _Nonnull task) {
        AWSGuarddutyGetFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyGetFindingsResponse *> *)getFindings:(AWSGuarddutyGetFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/get"
                  targetPrefix:@""
                 operationName:@"GetFindings"
                   outputClass:[AWSGuarddutyGetFindingsResponse class]];
}

- (void)getFindings:(AWSGuarddutyGetFindingsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyGetFindingsResponse *response, NSError *error))completionHandler {
    [[self getFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyGetFindingsResponse *> * _Nonnull task) {
        AWSGuarddutyGetFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyGetFindingsStatisticsResponse *> *)getFindingsStatistics:(AWSGuarddutyGetFindingsStatisticsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/statistics"
                  targetPrefix:@""
                 operationName:@"GetFindingsStatistics"
                   outputClass:[AWSGuarddutyGetFindingsStatisticsResponse class]];
}

- (void)getFindingsStatistics:(AWSGuarddutyGetFindingsStatisticsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyGetFindingsStatisticsResponse *response, NSError *error))completionHandler {
    [[self getFindingsStatistics:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyGetFindingsStatisticsResponse *> * _Nonnull task) {
        AWSGuarddutyGetFindingsStatisticsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyGetIPSetResponse *> *)getIPSet:(AWSGuarddutyGetIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/ipset/{ipSetId}"
                  targetPrefix:@""
                 operationName:@"GetIPSet"
                   outputClass:[AWSGuarddutyGetIPSetResponse class]];
}

- (void)getIPSet:(AWSGuarddutyGetIPSetRequest *)request
     completionHandler:(void (^)(AWSGuarddutyGetIPSetResponse *response, NSError *error))completionHandler {
    [[self getIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyGetIPSetResponse *> * _Nonnull task) {
        AWSGuarddutyGetIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyGetInvitationsCountResponse *> *)getInvitationsCount:(AWSGuarddutyGetInvitationsCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/invitation/count"
                  targetPrefix:@""
                 operationName:@"GetInvitationsCount"
                   outputClass:[AWSGuarddutyGetInvitationsCountResponse class]];
}

- (void)getInvitationsCount:(AWSGuarddutyGetInvitationsCountRequest *)request
     completionHandler:(void (^)(AWSGuarddutyGetInvitationsCountResponse *response, NSError *error))completionHandler {
    [[self getInvitationsCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyGetInvitationsCountResponse *> * _Nonnull task) {
        AWSGuarddutyGetInvitationsCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyGetMasterAccountResponse *> *)getMasterAccount:(AWSGuarddutyGetMasterAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/master"
                  targetPrefix:@""
                 operationName:@"GetMasterAccount"
                   outputClass:[AWSGuarddutyGetMasterAccountResponse class]];
}

- (void)getMasterAccount:(AWSGuarddutyGetMasterAccountRequest *)request
     completionHandler:(void (^)(AWSGuarddutyGetMasterAccountResponse *response, NSError *error))completionHandler {
    [[self getMasterAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyGetMasterAccountResponse *> * _Nonnull task) {
        AWSGuarddutyGetMasterAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyGetMembersResponse *> *)getMembers:(AWSGuarddutyGetMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/get"
                  targetPrefix:@""
                 operationName:@"GetMembers"
                   outputClass:[AWSGuarddutyGetMembersResponse class]];
}

- (void)getMembers:(AWSGuarddutyGetMembersRequest *)request
     completionHandler:(void (^)(AWSGuarddutyGetMembersResponse *response, NSError *error))completionHandler {
    [[self getMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyGetMembersResponse *> * _Nonnull task) {
        AWSGuarddutyGetMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyGetThreatIntelSetResponse *> *)getThreatIntelSet:(AWSGuarddutyGetThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/threatintelset/{threatIntelSetId}"
                  targetPrefix:@""
                 operationName:@"GetThreatIntelSet"
                   outputClass:[AWSGuarddutyGetThreatIntelSetResponse class]];
}

- (void)getThreatIntelSet:(AWSGuarddutyGetThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSGuarddutyGetThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self getThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyGetThreatIntelSetResponse *> * _Nonnull task) {
        AWSGuarddutyGetThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyInviteMembersResponse *> *)inviteMembers:(AWSGuarddutyInviteMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/invite"
                  targetPrefix:@""
                 operationName:@"InviteMembers"
                   outputClass:[AWSGuarddutyInviteMembersResponse class]];
}

- (void)inviteMembers:(AWSGuarddutyInviteMembersRequest *)request
     completionHandler:(void (^)(AWSGuarddutyInviteMembersResponse *response, NSError *error))completionHandler {
    [[self inviteMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyInviteMembersResponse *> * _Nonnull task) {
        AWSGuarddutyInviteMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyListDetectorsResponse *> *)listDetectors:(AWSGuarddutyListDetectorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector"
                  targetPrefix:@""
                 operationName:@"ListDetectors"
                   outputClass:[AWSGuarddutyListDetectorsResponse class]];
}

- (void)listDetectors:(AWSGuarddutyListDetectorsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyListDetectorsResponse *response, NSError *error))completionHandler {
    [[self listDetectors:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyListDetectorsResponse *> * _Nonnull task) {
        AWSGuarddutyListDetectorsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyListFiltersResponse *> *)listFilters:(AWSGuarddutyListFiltersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/filter"
                  targetPrefix:@""
                 operationName:@"ListFilters"
                   outputClass:[AWSGuarddutyListFiltersResponse class]];
}

- (void)listFilters:(AWSGuarddutyListFiltersRequest *)request
     completionHandler:(void (^)(AWSGuarddutyListFiltersResponse *response, NSError *error))completionHandler {
    [[self listFilters:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyListFiltersResponse *> * _Nonnull task) {
        AWSGuarddutyListFiltersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyListFindingsResponse *> *)listFindings:(AWSGuarddutyListFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings"
                  targetPrefix:@""
                 operationName:@"ListFindings"
                   outputClass:[AWSGuarddutyListFindingsResponse class]];
}

- (void)listFindings:(AWSGuarddutyListFindingsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyListFindingsResponse *response, NSError *error))completionHandler {
    [[self listFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyListFindingsResponse *> * _Nonnull task) {
        AWSGuarddutyListFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyListIPSetsResponse *> *)listIPSets:(AWSGuarddutyListIPSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/ipset"
                  targetPrefix:@""
                 operationName:@"ListIPSets"
                   outputClass:[AWSGuarddutyListIPSetsResponse class]];
}

- (void)listIPSets:(AWSGuarddutyListIPSetsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyListIPSetsResponse *response, NSError *error))completionHandler {
    [[self listIPSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyListIPSetsResponse *> * _Nonnull task) {
        AWSGuarddutyListIPSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyListInvitationsResponse *> *)listInvitations:(AWSGuarddutyListInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/invitation"
                  targetPrefix:@""
                 operationName:@"ListInvitations"
                   outputClass:[AWSGuarddutyListInvitationsResponse class]];
}

- (void)listInvitations:(AWSGuarddutyListInvitationsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyListInvitationsResponse *response, NSError *error))completionHandler {
    [[self listInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyListInvitationsResponse *> * _Nonnull task) {
        AWSGuarddutyListInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyListMembersResponse *> *)listMembers:(AWSGuarddutyListMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/member"
                  targetPrefix:@""
                 operationName:@"ListMembers"
                   outputClass:[AWSGuarddutyListMembersResponse class]];
}

- (void)listMembers:(AWSGuarddutyListMembersRequest *)request
     completionHandler:(void (^)(AWSGuarddutyListMembersResponse *response, NSError *error))completionHandler {
    [[self listMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyListMembersResponse *> * _Nonnull task) {
        AWSGuarddutyListMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyListOrganizationAdminAccountsResponse *> *)listOrganizationAdminAccounts:(AWSGuarddutyListOrganizationAdminAccountsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/admin"
                  targetPrefix:@""
                 operationName:@"ListOrganizationAdminAccounts"
                   outputClass:[AWSGuarddutyListOrganizationAdminAccountsResponse class]];
}

- (void)listOrganizationAdminAccounts:(AWSGuarddutyListOrganizationAdminAccountsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyListOrganizationAdminAccountsResponse *response, NSError *error))completionHandler {
    [[self listOrganizationAdminAccounts:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyListOrganizationAdminAccountsResponse *> * _Nonnull task) {
        AWSGuarddutyListOrganizationAdminAccountsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyListPublishingDestinationsResponse *> *)listPublishingDestinations:(AWSGuarddutyListPublishingDestinationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/publishingDestination"
                  targetPrefix:@""
                 operationName:@"ListPublishingDestinations"
                   outputClass:[AWSGuarddutyListPublishingDestinationsResponse class]];
}

- (void)listPublishingDestinations:(AWSGuarddutyListPublishingDestinationsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyListPublishingDestinationsResponse *response, NSError *error))completionHandler {
    [[self listPublishingDestinations:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyListPublishingDestinationsResponse *> * _Nonnull task) {
        AWSGuarddutyListPublishingDestinationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyListTagsForResourceResponse *> *)listTagsForResource:(AWSGuarddutyListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSGuarddutyListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSGuarddutyListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSGuarddutyListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyListTagsForResourceResponse *> * _Nonnull task) {
        AWSGuarddutyListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyListThreatIntelSetsResponse *> *)listThreatIntelSets:(AWSGuarddutyListThreatIntelSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/threatintelset"
                  targetPrefix:@""
                 operationName:@"ListThreatIntelSets"
                   outputClass:[AWSGuarddutyListThreatIntelSetsResponse class]];
}

- (void)listThreatIntelSets:(AWSGuarddutyListThreatIntelSetsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyListThreatIntelSetsResponse *response, NSError *error))completionHandler {
    [[self listThreatIntelSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyListThreatIntelSetsResponse *> * _Nonnull task) {
        AWSGuarddutyListThreatIntelSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyStartMonitoringMembersResponse *> *)startMonitoringMembers:(AWSGuarddutyStartMonitoringMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/start"
                  targetPrefix:@""
                 operationName:@"StartMonitoringMembers"
                   outputClass:[AWSGuarddutyStartMonitoringMembersResponse class]];
}

- (void)startMonitoringMembers:(AWSGuarddutyStartMonitoringMembersRequest *)request
     completionHandler:(void (^)(AWSGuarddutyStartMonitoringMembersResponse *response, NSError *error))completionHandler {
    [[self startMonitoringMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyStartMonitoringMembersResponse *> * _Nonnull task) {
        AWSGuarddutyStartMonitoringMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyStopMonitoringMembersResponse *> *)stopMonitoringMembers:(AWSGuarddutyStopMonitoringMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/stop"
                  targetPrefix:@""
                 operationName:@"StopMonitoringMembers"
                   outputClass:[AWSGuarddutyStopMonitoringMembersResponse class]];
}

- (void)stopMonitoringMembers:(AWSGuarddutyStopMonitoringMembersRequest *)request
     completionHandler:(void (^)(AWSGuarddutyStopMonitoringMembersResponse *response, NSError *error))completionHandler {
    [[self stopMonitoringMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyStopMonitoringMembersResponse *> * _Nonnull task) {
        AWSGuarddutyStopMonitoringMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyTagResourceResponse *> *)tagResource:(AWSGuarddutyTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSGuarddutyTagResourceResponse class]];
}

- (void)tagResource:(AWSGuarddutyTagResourceRequest *)request
     completionHandler:(void (^)(AWSGuarddutyTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyTagResourceResponse *> * _Nonnull task) {
        AWSGuarddutyTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyUnarchiveFindingsResponse *> *)unarchiveFindings:(AWSGuarddutyUnarchiveFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/unarchive"
                  targetPrefix:@""
                 operationName:@"UnarchiveFindings"
                   outputClass:[AWSGuarddutyUnarchiveFindingsResponse class]];
}

- (void)unarchiveFindings:(AWSGuarddutyUnarchiveFindingsRequest *)request
     completionHandler:(void (^)(AWSGuarddutyUnarchiveFindingsResponse *response, NSError *error))completionHandler {
    [[self unarchiveFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyUnarchiveFindingsResponse *> * _Nonnull task) {
        AWSGuarddutyUnarchiveFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyUntagResourceResponse *> *)untagResource:(AWSGuarddutyUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSGuarddutyUntagResourceResponse class]];
}

- (void)untagResource:(AWSGuarddutyUntagResourceRequest *)request
     completionHandler:(void (^)(AWSGuarddutyUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyUntagResourceResponse *> * _Nonnull task) {
        AWSGuarddutyUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyUpdateDetectorResponse *> *)updateDetector:(AWSGuarddutyUpdateDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}"
                  targetPrefix:@""
                 operationName:@"UpdateDetector"
                   outputClass:[AWSGuarddutyUpdateDetectorResponse class]];
}

- (void)updateDetector:(AWSGuarddutyUpdateDetectorRequest *)request
     completionHandler:(void (^)(AWSGuarddutyUpdateDetectorResponse *response, NSError *error))completionHandler {
    [[self updateDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyUpdateDetectorResponse *> * _Nonnull task) {
        AWSGuarddutyUpdateDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyUpdateFilterResponse *> *)updateFilter:(AWSGuarddutyUpdateFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/filter/{filterName}"
                  targetPrefix:@""
                 operationName:@"UpdateFilter"
                   outputClass:[AWSGuarddutyUpdateFilterResponse class]];
}

- (void)updateFilter:(AWSGuarddutyUpdateFilterRequest *)request
     completionHandler:(void (^)(AWSGuarddutyUpdateFilterResponse *response, NSError *error))completionHandler {
    [[self updateFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyUpdateFilterResponse *> * _Nonnull task) {
        AWSGuarddutyUpdateFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyUpdateFindingsFeedbackResponse *> *)updateFindingsFeedback:(AWSGuarddutyUpdateFindingsFeedbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/feedback"
                  targetPrefix:@""
                 operationName:@"UpdateFindingsFeedback"
                   outputClass:[AWSGuarddutyUpdateFindingsFeedbackResponse class]];
}

- (void)updateFindingsFeedback:(AWSGuarddutyUpdateFindingsFeedbackRequest *)request
     completionHandler:(void (^)(AWSGuarddutyUpdateFindingsFeedbackResponse *response, NSError *error))completionHandler {
    [[self updateFindingsFeedback:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyUpdateFindingsFeedbackResponse *> * _Nonnull task) {
        AWSGuarddutyUpdateFindingsFeedbackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyUpdateIPSetResponse *> *)updateIPSet:(AWSGuarddutyUpdateIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/ipset/{ipSetId}"
                  targetPrefix:@""
                 operationName:@"UpdateIPSet"
                   outputClass:[AWSGuarddutyUpdateIPSetResponse class]];
}

- (void)updateIPSet:(AWSGuarddutyUpdateIPSetRequest *)request
     completionHandler:(void (^)(AWSGuarddutyUpdateIPSetResponse *response, NSError *error))completionHandler {
    [[self updateIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyUpdateIPSetResponse *> * _Nonnull task) {
        AWSGuarddutyUpdateIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyUpdateOrganizationConfigurationResponse *> *)updateOrganizationConfiguration:(AWSGuarddutyUpdateOrganizationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/admin"
                  targetPrefix:@""
                 operationName:@"UpdateOrganizationConfiguration"
                   outputClass:[AWSGuarddutyUpdateOrganizationConfigurationResponse class]];
}

- (void)updateOrganizationConfiguration:(AWSGuarddutyUpdateOrganizationConfigurationRequest *)request
     completionHandler:(void (^)(AWSGuarddutyUpdateOrganizationConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateOrganizationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyUpdateOrganizationConfigurationResponse *> * _Nonnull task) {
        AWSGuarddutyUpdateOrganizationConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyUpdatePublishingDestinationResponse *> *)updatePublishingDestination:(AWSGuarddutyUpdatePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/publishingDestination/{destinationId}"
                  targetPrefix:@""
                 operationName:@"UpdatePublishingDestination"
                   outputClass:[AWSGuarddutyUpdatePublishingDestinationResponse class]];
}

- (void)updatePublishingDestination:(AWSGuarddutyUpdatePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSGuarddutyUpdatePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self updatePublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyUpdatePublishingDestinationResponse *> * _Nonnull task) {
        AWSGuarddutyUpdatePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSGuarddutyUpdateThreatIntelSetResponse *> *)updateThreatIntelSet:(AWSGuarddutyUpdateThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/threatintelset/{threatIntelSetId}"
                  targetPrefix:@""
                 operationName:@"UpdateThreatIntelSet"
                   outputClass:[AWSGuarddutyUpdateThreatIntelSetResponse class]];
}

- (void)updateThreatIntelSet:(AWSGuarddutyUpdateThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSGuarddutyUpdateThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self updateThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSGuarddutyUpdateThreatIntelSetResponse *> * _Nonnull task) {
        AWSGuarddutyUpdateThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
