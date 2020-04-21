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

#import "AWSguarddutyService.h"
#import <AWSCore/AWSCategory.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSService.h>
#import <AWSCore/AWSURLRequestSerialization.h>
#import <AWSCore/AWSURLResponseSerialization.h>
#import <AWSCore/AWSURLRequestRetryHandler.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>
#import "AWSguarddutyResources.h"

static NSString *const AWSInfoguardduty = @"guardduty";
NSString *const AWSguarddutySDKVersion = @"2.13.2";


@interface AWSguarddutyResponseSerializer : AWSJSONResponseSerializer

@end

@implementation AWSguarddutyResponseSerializer

#pragma mark - Service errors

static NSDictionary *errorCodeDictionary = nil;
+ (void)initialize {
    errorCodeDictionary = @{
                            @"BadRequestException" : @(AWSguarddutyErrorBadRequest),
                            @"InternalServerErrorException" : @(AWSguarddutyErrorInternalServerError),
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
                    *error = [NSError errorWithDomain:AWSguarddutyErrorDomain
                                                 code:[[errorCodeDictionary objectForKey:errorTypeHeader] integerValue]
                                             userInfo:userInfo];
                }
                return responseObject;
            } else if (errorTypeHeader) {
                if (error) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : [responseObject objectForKey:@"message"]?[responseObject objectForKey:@"message"]:[NSNull null], NSLocalizedFailureReasonErrorKey: errorTypeString};
                    *error = [NSError errorWithDomain:AWSguarddutyErrorDomain
                                                 code:AWSguarddutyErrorUnknown
                                             userInfo:userInfo];
                }
                return responseObject;
            }
        }
    }

    if (!*error && response.statusCode/100 != 2) {
        *error = [NSError errorWithDomain:AWSguarddutyErrorDomain
                                     code:AWSguarddutyErrorUnknown
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

@interface AWSguarddutyRequestRetryHandler : AWSURLRequestRetryHandler

@end

@implementation AWSguarddutyRequestRetryHandler

@end

@interface AWSRequest()

@property (nonatomic, strong) AWSNetworkingRequest *internalRequest;

@end

@interface AWSguardduty()

@property (nonatomic, strong) AWSNetworking *networking;
@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@interface AWSEndpoint()

- (void) setRegion:(AWSRegionType)regionType service:(AWSServiceType)serviceType;

@end

@implementation AWSguardduty

+ (void)initialize {
    [super initialize];

    if (![AWSiOSSDKVersion isEqualToString:AWSguarddutySDKVersion]) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:[NSString stringWithFormat:@"AWSCore and AWSguardduty versions need to match. Check your SDK installation. AWSCore: %@ AWSguardduty: %@", AWSiOSSDKVersion, AWSguarddutySDKVersion]
                                     userInfo:nil];
    }
}

#pragma mark - Setup

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultguardduty {
    static AWSguardduty *_defaultguardduty = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AWSServiceConfiguration *serviceConfiguration = nil;
        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] defaultServiceInfo:AWSInfoguardduty];
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
        _defaultguardduty = [[AWSguardduty alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultguardduty;
}

+ (void)registerguarddutyWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[AWSguardduty alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)guarddutyForKey:(NSString *)key {
    @synchronized(self) {
        AWSguardduty *serviceClient = [_serviceClients objectForKey:key];
        if (serviceClient) {
            return serviceClient;
        }

        AWSServiceInfo *serviceInfo = [[AWSInfo defaultAWSInfo] serviceInfo:AWSInfoguardduty
                                                                     forKey:key];
        if (serviceInfo) {
            AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:serviceInfo.region
                                                                                        credentialsProvider:serviceInfo.cognitoCredentialsProvider];
            [AWSguardduty registerguarddutyWithConfiguration:serviceConfiguration
                                                                forKey:key];
        }

        return [_serviceClients objectForKey:key];
    }
}

+ (void)removeguarddutyForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultguardduty` or `+ guarddutyForKey:` instead."
                                 userInfo:nil];
    return nil;
}

#pragma mark -

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];
       	
        if(!configuration.endpoint){
            _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceguardduty
                                                         useUnsafeURL:NO];
        }else{
            [_configuration.endpoint setRegion:_configuration.regionType
                                      service:AWSServiceguardduty];
        }
       	
        AWSSignatureV4Signer *signer = [[AWSSignatureV4Signer alloc] initWithCredentialsProvider:_configuration.credentialsProvider
                                                                                        endpoint:_configuration.endpoint];
        AWSNetworkingRequestInterceptor *baseInterceptor = [[AWSNetworkingRequestInterceptor alloc] initWithUserAgent:_configuration.userAgent];
        _configuration.requestInterceptors = @[baseInterceptor, signer];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.retryHandler = [[AWSguarddutyRequestRetryHandler alloc] initWithMaximumRetryCount:_configuration.maxRetryCount];
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
        networkingRequest.requestSerializer = [[AWSJSONRequestSerializer alloc] initWithJSONDefinition:[[AWSguarddutyResources sharedInstance] JSONObject]
                                                                                                   actionName:operationName];
        networkingRequest.responseSerializer = [[AWSguarddutyResponseSerializer alloc] initWithJSONDefinition:[[AWSguarddutyResources sharedInstance] JSONObject]
                                                                                             actionName:operationName
                                                                                            outputClass:outputClass];
        
        return [self.networking sendRequest:networkingRequest];
    }
}

#pragma mark - Service method

- (AWSTask<AWSguarddutyAcceptInvitationResponse *> *)acceptInvitation:(AWSguarddutyAcceptInvitationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/master"
                  targetPrefix:@""
                 operationName:@"AcceptInvitation"
                   outputClass:[AWSguarddutyAcceptInvitationResponse class]];
}

- (void)acceptInvitation:(AWSguarddutyAcceptInvitationRequest *)request
     completionHandler:(void (^)(AWSguarddutyAcceptInvitationResponse *response, NSError *error))completionHandler {
    [[self acceptInvitation:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyAcceptInvitationResponse *> * _Nonnull task) {
        AWSguarddutyAcceptInvitationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyArchiveFindingsResponse *> *)archiveFindings:(AWSguarddutyArchiveFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/archive"
                  targetPrefix:@""
                 operationName:@"ArchiveFindings"
                   outputClass:[AWSguarddutyArchiveFindingsResponse class]];
}

- (void)archiveFindings:(AWSguarddutyArchiveFindingsRequest *)request
     completionHandler:(void (^)(AWSguarddutyArchiveFindingsResponse *response, NSError *error))completionHandler {
    [[self archiveFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyArchiveFindingsResponse *> * _Nonnull task) {
        AWSguarddutyArchiveFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyCreateDetectorResponse *> *)createDetector:(AWSguarddutyCreateDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector"
                  targetPrefix:@""
                 operationName:@"CreateDetector"
                   outputClass:[AWSguarddutyCreateDetectorResponse class]];
}

- (void)createDetector:(AWSguarddutyCreateDetectorRequest *)request
     completionHandler:(void (^)(AWSguarddutyCreateDetectorResponse *response, NSError *error))completionHandler {
    [[self createDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyCreateDetectorResponse *> * _Nonnull task) {
        AWSguarddutyCreateDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyCreateFilterResponse *> *)createFilter:(AWSguarddutyCreateFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/filter"
                  targetPrefix:@""
                 operationName:@"CreateFilter"
                   outputClass:[AWSguarddutyCreateFilterResponse class]];
}

- (void)createFilter:(AWSguarddutyCreateFilterRequest *)request
     completionHandler:(void (^)(AWSguarddutyCreateFilterResponse *response, NSError *error))completionHandler {
    [[self createFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyCreateFilterResponse *> * _Nonnull task) {
        AWSguarddutyCreateFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyCreateIPSetResponse *> *)createIPSet:(AWSguarddutyCreateIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/ipset"
                  targetPrefix:@""
                 operationName:@"CreateIPSet"
                   outputClass:[AWSguarddutyCreateIPSetResponse class]];
}

- (void)createIPSet:(AWSguarddutyCreateIPSetRequest *)request
     completionHandler:(void (^)(AWSguarddutyCreateIPSetResponse *response, NSError *error))completionHandler {
    [[self createIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyCreateIPSetResponse *> * _Nonnull task) {
        AWSguarddutyCreateIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyCreateMembersResponse *> *)createMembers:(AWSguarddutyCreateMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member"
                  targetPrefix:@""
                 operationName:@"CreateMembers"
                   outputClass:[AWSguarddutyCreateMembersResponse class]];
}

- (void)createMembers:(AWSguarddutyCreateMembersRequest *)request
     completionHandler:(void (^)(AWSguarddutyCreateMembersResponse *response, NSError *error))completionHandler {
    [[self createMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyCreateMembersResponse *> * _Nonnull task) {
        AWSguarddutyCreateMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyCreatePublishingDestinationResponse *> *)createPublishingDestination:(AWSguarddutyCreatePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/publishingDestination"
                  targetPrefix:@""
                 operationName:@"CreatePublishingDestination"
                   outputClass:[AWSguarddutyCreatePublishingDestinationResponse class]];
}

- (void)createPublishingDestination:(AWSguarddutyCreatePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSguarddutyCreatePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self createPublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyCreatePublishingDestinationResponse *> * _Nonnull task) {
        AWSguarddutyCreatePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyCreateSampleFindingsResponse *> *)createSampleFindings:(AWSguarddutyCreateSampleFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/create"
                  targetPrefix:@""
                 operationName:@"CreateSampleFindings"
                   outputClass:[AWSguarddutyCreateSampleFindingsResponse class]];
}

- (void)createSampleFindings:(AWSguarddutyCreateSampleFindingsRequest *)request
     completionHandler:(void (^)(AWSguarddutyCreateSampleFindingsResponse *response, NSError *error))completionHandler {
    [[self createSampleFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyCreateSampleFindingsResponse *> * _Nonnull task) {
        AWSguarddutyCreateSampleFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyCreateThreatIntelSetResponse *> *)createThreatIntelSet:(AWSguarddutyCreateThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/threatintelset"
                  targetPrefix:@""
                 operationName:@"CreateThreatIntelSet"
                   outputClass:[AWSguarddutyCreateThreatIntelSetResponse class]];
}

- (void)createThreatIntelSet:(AWSguarddutyCreateThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSguarddutyCreateThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self createThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyCreateThreatIntelSetResponse *> * _Nonnull task) {
        AWSguarddutyCreateThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDeclineInvitationsResponse *> *)declineInvitations:(AWSguarddutyDeclineInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/invitation/decline"
                  targetPrefix:@""
                 operationName:@"DeclineInvitations"
                   outputClass:[AWSguarddutyDeclineInvitationsResponse class]];
}

- (void)declineInvitations:(AWSguarddutyDeclineInvitationsRequest *)request
     completionHandler:(void (^)(AWSguarddutyDeclineInvitationsResponse *response, NSError *error))completionHandler {
    [[self declineInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDeclineInvitationsResponse *> * _Nonnull task) {
        AWSguarddutyDeclineInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDeleteDetectorResponse *> *)deleteDetector:(AWSguarddutyDeleteDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}"
                  targetPrefix:@""
                 operationName:@"DeleteDetector"
                   outputClass:[AWSguarddutyDeleteDetectorResponse class]];
}

- (void)deleteDetector:(AWSguarddutyDeleteDetectorRequest *)request
     completionHandler:(void (^)(AWSguarddutyDeleteDetectorResponse *response, NSError *error))completionHandler {
    [[self deleteDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDeleteDetectorResponse *> * _Nonnull task) {
        AWSguarddutyDeleteDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDeleteFilterResponse *> *)deleteFilter:(AWSguarddutyDeleteFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/filter/{filterName}"
                  targetPrefix:@""
                 operationName:@"DeleteFilter"
                   outputClass:[AWSguarddutyDeleteFilterResponse class]];
}

- (void)deleteFilter:(AWSguarddutyDeleteFilterRequest *)request
     completionHandler:(void (^)(AWSguarddutyDeleteFilterResponse *response, NSError *error))completionHandler {
    [[self deleteFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDeleteFilterResponse *> * _Nonnull task) {
        AWSguarddutyDeleteFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDeleteIPSetResponse *> *)deleteIPSet:(AWSguarddutyDeleteIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/ipset/{ipSetId}"
                  targetPrefix:@""
                 operationName:@"DeleteIPSet"
                   outputClass:[AWSguarddutyDeleteIPSetResponse class]];
}

- (void)deleteIPSet:(AWSguarddutyDeleteIPSetRequest *)request
     completionHandler:(void (^)(AWSguarddutyDeleteIPSetResponse *response, NSError *error))completionHandler {
    [[self deleteIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDeleteIPSetResponse *> * _Nonnull task) {
        AWSguarddutyDeleteIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDeleteInvitationsResponse *> *)deleteInvitations:(AWSguarddutyDeleteInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/invitation/delete"
                  targetPrefix:@""
                 operationName:@"DeleteInvitations"
                   outputClass:[AWSguarddutyDeleteInvitationsResponse class]];
}

- (void)deleteInvitations:(AWSguarddutyDeleteInvitationsRequest *)request
     completionHandler:(void (^)(AWSguarddutyDeleteInvitationsResponse *response, NSError *error))completionHandler {
    [[self deleteInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDeleteInvitationsResponse *> * _Nonnull task) {
        AWSguarddutyDeleteInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDeleteMembersResponse *> *)deleteMembers:(AWSguarddutyDeleteMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/delete"
                  targetPrefix:@""
                 operationName:@"DeleteMembers"
                   outputClass:[AWSguarddutyDeleteMembersResponse class]];
}

- (void)deleteMembers:(AWSguarddutyDeleteMembersRequest *)request
     completionHandler:(void (^)(AWSguarddutyDeleteMembersResponse *response, NSError *error))completionHandler {
    [[self deleteMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDeleteMembersResponse *> * _Nonnull task) {
        AWSguarddutyDeleteMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDeletePublishingDestinationResponse *> *)deletePublishingDestination:(AWSguarddutyDeletePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/publishingDestination/{destinationId}"
                  targetPrefix:@""
                 operationName:@"DeletePublishingDestination"
                   outputClass:[AWSguarddutyDeletePublishingDestinationResponse class]];
}

- (void)deletePublishingDestination:(AWSguarddutyDeletePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSguarddutyDeletePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self deletePublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDeletePublishingDestinationResponse *> * _Nonnull task) {
        AWSguarddutyDeletePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDeleteThreatIntelSetResponse *> *)deleteThreatIntelSet:(AWSguarddutyDeleteThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/detector/{detectorId}/threatintelset/{threatIntelSetId}"
                  targetPrefix:@""
                 operationName:@"DeleteThreatIntelSet"
                   outputClass:[AWSguarddutyDeleteThreatIntelSetResponse class]];
}

- (void)deleteThreatIntelSet:(AWSguarddutyDeleteThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSguarddutyDeleteThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self deleteThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDeleteThreatIntelSetResponse *> * _Nonnull task) {
        AWSguarddutyDeleteThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDescribeOrganizationConfigurationResponse *> *)describeOrganizationConfiguration:(AWSguarddutyDescribeOrganizationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/admin"
                  targetPrefix:@""
                 operationName:@"DescribeOrganizationConfiguration"
                   outputClass:[AWSguarddutyDescribeOrganizationConfigurationResponse class]];
}

- (void)describeOrganizationConfiguration:(AWSguarddutyDescribeOrganizationConfigurationRequest *)request
     completionHandler:(void (^)(AWSguarddutyDescribeOrganizationConfigurationResponse *response, NSError *error))completionHandler {
    [[self describeOrganizationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDescribeOrganizationConfigurationResponse *> * _Nonnull task) {
        AWSguarddutyDescribeOrganizationConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDescribePublishingDestinationResponse *> *)describePublishingDestination:(AWSguarddutyDescribePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/publishingDestination/{destinationId}"
                  targetPrefix:@""
                 operationName:@"DescribePublishingDestination"
                   outputClass:[AWSguarddutyDescribePublishingDestinationResponse class]];
}

- (void)describePublishingDestination:(AWSguarddutyDescribePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSguarddutyDescribePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self describePublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDescribePublishingDestinationResponse *> * _Nonnull task) {
        AWSguarddutyDescribePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDisableOrganizationAdminAccountResponse *> *)disableOrganizationAdminAccount:(AWSguarddutyDisableOrganizationAdminAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/admin/disable"
                  targetPrefix:@""
                 operationName:@"DisableOrganizationAdminAccount"
                   outputClass:[AWSguarddutyDisableOrganizationAdminAccountResponse class]];
}

- (void)disableOrganizationAdminAccount:(AWSguarddutyDisableOrganizationAdminAccountRequest *)request
     completionHandler:(void (^)(AWSguarddutyDisableOrganizationAdminAccountResponse *response, NSError *error))completionHandler {
    [[self disableOrganizationAdminAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDisableOrganizationAdminAccountResponse *> * _Nonnull task) {
        AWSguarddutyDisableOrganizationAdminAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDisassociateFromMasterAccountResponse *> *)disassociateFromMasterAccount:(AWSguarddutyDisassociateFromMasterAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/master/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateFromMasterAccount"
                   outputClass:[AWSguarddutyDisassociateFromMasterAccountResponse class]];
}

- (void)disassociateFromMasterAccount:(AWSguarddutyDisassociateFromMasterAccountRequest *)request
     completionHandler:(void (^)(AWSguarddutyDisassociateFromMasterAccountResponse *response, NSError *error))completionHandler {
    [[self disassociateFromMasterAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDisassociateFromMasterAccountResponse *> * _Nonnull task) {
        AWSguarddutyDisassociateFromMasterAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyDisassociateMembersResponse *> *)disassociateMembers:(AWSguarddutyDisassociateMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/disassociate"
                  targetPrefix:@""
                 operationName:@"DisassociateMembers"
                   outputClass:[AWSguarddutyDisassociateMembersResponse class]];
}

- (void)disassociateMembers:(AWSguarddutyDisassociateMembersRequest *)request
     completionHandler:(void (^)(AWSguarddutyDisassociateMembersResponse *response, NSError *error))completionHandler {
    [[self disassociateMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyDisassociateMembersResponse *> * _Nonnull task) {
        AWSguarddutyDisassociateMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyEnableOrganizationAdminAccountResponse *> *)enableOrganizationAdminAccount:(AWSguarddutyEnableOrganizationAdminAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/admin/enable"
                  targetPrefix:@""
                 operationName:@"EnableOrganizationAdminAccount"
                   outputClass:[AWSguarddutyEnableOrganizationAdminAccountResponse class]];
}

- (void)enableOrganizationAdminAccount:(AWSguarddutyEnableOrganizationAdminAccountRequest *)request
     completionHandler:(void (^)(AWSguarddutyEnableOrganizationAdminAccountResponse *response, NSError *error))completionHandler {
    [[self enableOrganizationAdminAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyEnableOrganizationAdminAccountResponse *> * _Nonnull task) {
        AWSguarddutyEnableOrganizationAdminAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyGetDetectorResponse *> *)getDetector:(AWSguarddutyGetDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}"
                  targetPrefix:@""
                 operationName:@"GetDetector"
                   outputClass:[AWSguarddutyGetDetectorResponse class]];
}

- (void)getDetector:(AWSguarddutyGetDetectorRequest *)request
     completionHandler:(void (^)(AWSguarddutyGetDetectorResponse *response, NSError *error))completionHandler {
    [[self getDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyGetDetectorResponse *> * _Nonnull task) {
        AWSguarddutyGetDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyGetFilterResponse *> *)getFilter:(AWSguarddutyGetFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/filter/{filterName}"
                  targetPrefix:@""
                 operationName:@"GetFilter"
                   outputClass:[AWSguarddutyGetFilterResponse class]];
}

- (void)getFilter:(AWSguarddutyGetFilterRequest *)request
     completionHandler:(void (^)(AWSguarddutyGetFilterResponse *response, NSError *error))completionHandler {
    [[self getFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyGetFilterResponse *> * _Nonnull task) {
        AWSguarddutyGetFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyGetFindingsResponse *> *)getFindings:(AWSguarddutyGetFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/get"
                  targetPrefix:@""
                 operationName:@"GetFindings"
                   outputClass:[AWSguarddutyGetFindingsResponse class]];
}

- (void)getFindings:(AWSguarddutyGetFindingsRequest *)request
     completionHandler:(void (^)(AWSguarddutyGetFindingsResponse *response, NSError *error))completionHandler {
    [[self getFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyGetFindingsResponse *> * _Nonnull task) {
        AWSguarddutyGetFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyGetFindingsStatisticsResponse *> *)getFindingsStatistics:(AWSguarddutyGetFindingsStatisticsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/statistics"
                  targetPrefix:@""
                 operationName:@"GetFindingsStatistics"
                   outputClass:[AWSguarddutyGetFindingsStatisticsResponse class]];
}

- (void)getFindingsStatistics:(AWSguarddutyGetFindingsStatisticsRequest *)request
     completionHandler:(void (^)(AWSguarddutyGetFindingsStatisticsResponse *response, NSError *error))completionHandler {
    [[self getFindingsStatistics:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyGetFindingsStatisticsResponse *> * _Nonnull task) {
        AWSguarddutyGetFindingsStatisticsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyGetIPSetResponse *> *)getIPSet:(AWSguarddutyGetIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/ipset/{ipSetId}"
                  targetPrefix:@""
                 operationName:@"GetIPSet"
                   outputClass:[AWSguarddutyGetIPSetResponse class]];
}

- (void)getIPSet:(AWSguarddutyGetIPSetRequest *)request
     completionHandler:(void (^)(AWSguarddutyGetIPSetResponse *response, NSError *error))completionHandler {
    [[self getIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyGetIPSetResponse *> * _Nonnull task) {
        AWSguarddutyGetIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyGetInvitationsCountResponse *> *)getInvitationsCount:(AWSguarddutyGetInvitationsCountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/invitation/count"
                  targetPrefix:@""
                 operationName:@"GetInvitationsCount"
                   outputClass:[AWSguarddutyGetInvitationsCountResponse class]];
}

- (void)getInvitationsCount:(AWSguarddutyGetInvitationsCountRequest *)request
     completionHandler:(void (^)(AWSguarddutyGetInvitationsCountResponse *response, NSError *error))completionHandler {
    [[self getInvitationsCount:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyGetInvitationsCountResponse *> * _Nonnull task) {
        AWSguarddutyGetInvitationsCountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyGetMasterAccountResponse *> *)getMasterAccount:(AWSguarddutyGetMasterAccountRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/master"
                  targetPrefix:@""
                 operationName:@"GetMasterAccount"
                   outputClass:[AWSguarddutyGetMasterAccountResponse class]];
}

- (void)getMasterAccount:(AWSguarddutyGetMasterAccountRequest *)request
     completionHandler:(void (^)(AWSguarddutyGetMasterAccountResponse *response, NSError *error))completionHandler {
    [[self getMasterAccount:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyGetMasterAccountResponse *> * _Nonnull task) {
        AWSguarddutyGetMasterAccountResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyGetMembersResponse *> *)getMembers:(AWSguarddutyGetMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/get"
                  targetPrefix:@""
                 operationName:@"GetMembers"
                   outputClass:[AWSguarddutyGetMembersResponse class]];
}

- (void)getMembers:(AWSguarddutyGetMembersRequest *)request
     completionHandler:(void (^)(AWSguarddutyGetMembersResponse *response, NSError *error))completionHandler {
    [[self getMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyGetMembersResponse *> * _Nonnull task) {
        AWSguarddutyGetMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyGetThreatIntelSetResponse *> *)getThreatIntelSet:(AWSguarddutyGetThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/threatintelset/{threatIntelSetId}"
                  targetPrefix:@""
                 operationName:@"GetThreatIntelSet"
                   outputClass:[AWSguarddutyGetThreatIntelSetResponse class]];
}

- (void)getThreatIntelSet:(AWSguarddutyGetThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSguarddutyGetThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self getThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyGetThreatIntelSetResponse *> * _Nonnull task) {
        AWSguarddutyGetThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyInviteMembersResponse *> *)inviteMembers:(AWSguarddutyInviteMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/invite"
                  targetPrefix:@""
                 operationName:@"InviteMembers"
                   outputClass:[AWSguarddutyInviteMembersResponse class]];
}

- (void)inviteMembers:(AWSguarddutyInviteMembersRequest *)request
     completionHandler:(void (^)(AWSguarddutyInviteMembersResponse *response, NSError *error))completionHandler {
    [[self inviteMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyInviteMembersResponse *> * _Nonnull task) {
        AWSguarddutyInviteMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyListDetectorsResponse *> *)listDetectors:(AWSguarddutyListDetectorsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector"
                  targetPrefix:@""
                 operationName:@"ListDetectors"
                   outputClass:[AWSguarddutyListDetectorsResponse class]];
}

- (void)listDetectors:(AWSguarddutyListDetectorsRequest *)request
     completionHandler:(void (^)(AWSguarddutyListDetectorsResponse *response, NSError *error))completionHandler {
    [[self listDetectors:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyListDetectorsResponse *> * _Nonnull task) {
        AWSguarddutyListDetectorsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyListFiltersResponse *> *)listFilters:(AWSguarddutyListFiltersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/filter"
                  targetPrefix:@""
                 operationName:@"ListFilters"
                   outputClass:[AWSguarddutyListFiltersResponse class]];
}

- (void)listFilters:(AWSguarddutyListFiltersRequest *)request
     completionHandler:(void (^)(AWSguarddutyListFiltersResponse *response, NSError *error))completionHandler {
    [[self listFilters:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyListFiltersResponse *> * _Nonnull task) {
        AWSguarddutyListFiltersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyListFindingsResponse *> *)listFindings:(AWSguarddutyListFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings"
                  targetPrefix:@""
                 operationName:@"ListFindings"
                   outputClass:[AWSguarddutyListFindingsResponse class]];
}

- (void)listFindings:(AWSguarddutyListFindingsRequest *)request
     completionHandler:(void (^)(AWSguarddutyListFindingsResponse *response, NSError *error))completionHandler {
    [[self listFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyListFindingsResponse *> * _Nonnull task) {
        AWSguarddutyListFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyListIPSetsResponse *> *)listIPSets:(AWSguarddutyListIPSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/ipset"
                  targetPrefix:@""
                 operationName:@"ListIPSets"
                   outputClass:[AWSguarddutyListIPSetsResponse class]];
}

- (void)listIPSets:(AWSguarddutyListIPSetsRequest *)request
     completionHandler:(void (^)(AWSguarddutyListIPSetsResponse *response, NSError *error))completionHandler {
    [[self listIPSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyListIPSetsResponse *> * _Nonnull task) {
        AWSguarddutyListIPSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyListInvitationsResponse *> *)listInvitations:(AWSguarddutyListInvitationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/invitation"
                  targetPrefix:@""
                 operationName:@"ListInvitations"
                   outputClass:[AWSguarddutyListInvitationsResponse class]];
}

- (void)listInvitations:(AWSguarddutyListInvitationsRequest *)request
     completionHandler:(void (^)(AWSguarddutyListInvitationsResponse *response, NSError *error))completionHandler {
    [[self listInvitations:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyListInvitationsResponse *> * _Nonnull task) {
        AWSguarddutyListInvitationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyListMembersResponse *> *)listMembers:(AWSguarddutyListMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/member"
                  targetPrefix:@""
                 operationName:@"ListMembers"
                   outputClass:[AWSguarddutyListMembersResponse class]];
}

- (void)listMembers:(AWSguarddutyListMembersRequest *)request
     completionHandler:(void (^)(AWSguarddutyListMembersResponse *response, NSError *error))completionHandler {
    [[self listMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyListMembersResponse *> * _Nonnull task) {
        AWSguarddutyListMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyListOrganizationAdminAccountsResponse *> *)listOrganizationAdminAccounts:(AWSguarddutyListOrganizationAdminAccountsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/admin"
                  targetPrefix:@""
                 operationName:@"ListOrganizationAdminAccounts"
                   outputClass:[AWSguarddutyListOrganizationAdminAccountsResponse class]];
}

- (void)listOrganizationAdminAccounts:(AWSguarddutyListOrganizationAdminAccountsRequest *)request
     completionHandler:(void (^)(AWSguarddutyListOrganizationAdminAccountsResponse *response, NSError *error))completionHandler {
    [[self listOrganizationAdminAccounts:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyListOrganizationAdminAccountsResponse *> * _Nonnull task) {
        AWSguarddutyListOrganizationAdminAccountsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyListPublishingDestinationsResponse *> *)listPublishingDestinations:(AWSguarddutyListPublishingDestinationsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/publishingDestination"
                  targetPrefix:@""
                 operationName:@"ListPublishingDestinations"
                   outputClass:[AWSguarddutyListPublishingDestinationsResponse class]];
}

- (void)listPublishingDestinations:(AWSguarddutyListPublishingDestinationsRequest *)request
     completionHandler:(void (^)(AWSguarddutyListPublishingDestinationsResponse *response, NSError *error))completionHandler {
    [[self listPublishingDestinations:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyListPublishingDestinationsResponse *> * _Nonnull task) {
        AWSguarddutyListPublishingDestinationsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyListTagsForResourceResponse *> *)listTagsForResource:(AWSguarddutyListTagsForResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"ListTagsForResource"
                   outputClass:[AWSguarddutyListTagsForResourceResponse class]];
}

- (void)listTagsForResource:(AWSguarddutyListTagsForResourceRequest *)request
     completionHandler:(void (^)(AWSguarddutyListTagsForResourceResponse *response, NSError *error))completionHandler {
    [[self listTagsForResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyListTagsForResourceResponse *> * _Nonnull task) {
        AWSguarddutyListTagsForResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyListThreatIntelSetsResponse *> *)listThreatIntelSets:(AWSguarddutyListThreatIntelSetsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodGET
                     URLString:@"/detector/{detectorId}/threatintelset"
                  targetPrefix:@""
                 operationName:@"ListThreatIntelSets"
                   outputClass:[AWSguarddutyListThreatIntelSetsResponse class]];
}

- (void)listThreatIntelSets:(AWSguarddutyListThreatIntelSetsRequest *)request
     completionHandler:(void (^)(AWSguarddutyListThreatIntelSetsResponse *response, NSError *error))completionHandler {
    [[self listThreatIntelSets:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyListThreatIntelSetsResponse *> * _Nonnull task) {
        AWSguarddutyListThreatIntelSetsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyStartMonitoringMembersResponse *> *)startMonitoringMembers:(AWSguarddutyStartMonitoringMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/start"
                  targetPrefix:@""
                 operationName:@"StartMonitoringMembers"
                   outputClass:[AWSguarddutyStartMonitoringMembersResponse class]];
}

- (void)startMonitoringMembers:(AWSguarddutyStartMonitoringMembersRequest *)request
     completionHandler:(void (^)(AWSguarddutyStartMonitoringMembersResponse *response, NSError *error))completionHandler {
    [[self startMonitoringMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyStartMonitoringMembersResponse *> * _Nonnull task) {
        AWSguarddutyStartMonitoringMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyStopMonitoringMembersResponse *> *)stopMonitoringMembers:(AWSguarddutyStopMonitoringMembersRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/member/stop"
                  targetPrefix:@""
                 operationName:@"StopMonitoringMembers"
                   outputClass:[AWSguarddutyStopMonitoringMembersResponse class]];
}

- (void)stopMonitoringMembers:(AWSguarddutyStopMonitoringMembersRequest *)request
     completionHandler:(void (^)(AWSguarddutyStopMonitoringMembersResponse *response, NSError *error))completionHandler {
    [[self stopMonitoringMembers:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyStopMonitoringMembersResponse *> * _Nonnull task) {
        AWSguarddutyStopMonitoringMembersResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyTagResourceResponse *> *)tagResource:(AWSguarddutyTagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"TagResource"
                   outputClass:[AWSguarddutyTagResourceResponse class]];
}

- (void)tagResource:(AWSguarddutyTagResourceRequest *)request
     completionHandler:(void (^)(AWSguarddutyTagResourceResponse *response, NSError *error))completionHandler {
    [[self tagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyTagResourceResponse *> * _Nonnull task) {
        AWSguarddutyTagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyUnarchiveFindingsResponse *> *)unarchiveFindings:(AWSguarddutyUnarchiveFindingsRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/unarchive"
                  targetPrefix:@""
                 operationName:@"UnarchiveFindings"
                   outputClass:[AWSguarddutyUnarchiveFindingsResponse class]];
}

- (void)unarchiveFindings:(AWSguarddutyUnarchiveFindingsRequest *)request
     completionHandler:(void (^)(AWSguarddutyUnarchiveFindingsResponse *response, NSError *error))completionHandler {
    [[self unarchiveFindings:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyUnarchiveFindingsResponse *> * _Nonnull task) {
        AWSguarddutyUnarchiveFindingsResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyUntagResourceResponse *> *)untagResource:(AWSguarddutyUntagResourceRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodDELETE
                     URLString:@"/tags/{resourceArn}"
                  targetPrefix:@""
                 operationName:@"UntagResource"
                   outputClass:[AWSguarddutyUntagResourceResponse class]];
}

- (void)untagResource:(AWSguarddutyUntagResourceRequest *)request
     completionHandler:(void (^)(AWSguarddutyUntagResourceResponse *response, NSError *error))completionHandler {
    [[self untagResource:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyUntagResourceResponse *> * _Nonnull task) {
        AWSguarddutyUntagResourceResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyUpdateDetectorResponse *> *)updateDetector:(AWSguarddutyUpdateDetectorRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}"
                  targetPrefix:@""
                 operationName:@"UpdateDetector"
                   outputClass:[AWSguarddutyUpdateDetectorResponse class]];
}

- (void)updateDetector:(AWSguarddutyUpdateDetectorRequest *)request
     completionHandler:(void (^)(AWSguarddutyUpdateDetectorResponse *response, NSError *error))completionHandler {
    [[self updateDetector:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyUpdateDetectorResponse *> * _Nonnull task) {
        AWSguarddutyUpdateDetectorResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyUpdateFilterResponse *> *)updateFilter:(AWSguarddutyUpdateFilterRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/filter/{filterName}"
                  targetPrefix:@""
                 operationName:@"UpdateFilter"
                   outputClass:[AWSguarddutyUpdateFilterResponse class]];
}

- (void)updateFilter:(AWSguarddutyUpdateFilterRequest *)request
     completionHandler:(void (^)(AWSguarddutyUpdateFilterResponse *response, NSError *error))completionHandler {
    [[self updateFilter:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyUpdateFilterResponse *> * _Nonnull task) {
        AWSguarddutyUpdateFilterResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyUpdateFindingsFeedbackResponse *> *)updateFindingsFeedback:(AWSguarddutyUpdateFindingsFeedbackRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/findings/feedback"
                  targetPrefix:@""
                 operationName:@"UpdateFindingsFeedback"
                   outputClass:[AWSguarddutyUpdateFindingsFeedbackResponse class]];
}

- (void)updateFindingsFeedback:(AWSguarddutyUpdateFindingsFeedbackRequest *)request
     completionHandler:(void (^)(AWSguarddutyUpdateFindingsFeedbackResponse *response, NSError *error))completionHandler {
    [[self updateFindingsFeedback:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyUpdateFindingsFeedbackResponse *> * _Nonnull task) {
        AWSguarddutyUpdateFindingsFeedbackResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyUpdateIPSetResponse *> *)updateIPSet:(AWSguarddutyUpdateIPSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/ipset/{ipSetId}"
                  targetPrefix:@""
                 operationName:@"UpdateIPSet"
                   outputClass:[AWSguarddutyUpdateIPSetResponse class]];
}

- (void)updateIPSet:(AWSguarddutyUpdateIPSetRequest *)request
     completionHandler:(void (^)(AWSguarddutyUpdateIPSetResponse *response, NSError *error))completionHandler {
    [[self updateIPSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyUpdateIPSetResponse *> * _Nonnull task) {
        AWSguarddutyUpdateIPSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyUpdateOrganizationConfigurationResponse *> *)updateOrganizationConfiguration:(AWSguarddutyUpdateOrganizationConfigurationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/admin"
                  targetPrefix:@""
                 operationName:@"UpdateOrganizationConfiguration"
                   outputClass:[AWSguarddutyUpdateOrganizationConfigurationResponse class]];
}

- (void)updateOrganizationConfiguration:(AWSguarddutyUpdateOrganizationConfigurationRequest *)request
     completionHandler:(void (^)(AWSguarddutyUpdateOrganizationConfigurationResponse *response, NSError *error))completionHandler {
    [[self updateOrganizationConfiguration:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyUpdateOrganizationConfigurationResponse *> * _Nonnull task) {
        AWSguarddutyUpdateOrganizationConfigurationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyUpdatePublishingDestinationResponse *> *)updatePublishingDestination:(AWSguarddutyUpdatePublishingDestinationRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/publishingDestination/{destinationId}"
                  targetPrefix:@""
                 operationName:@"UpdatePublishingDestination"
                   outputClass:[AWSguarddutyUpdatePublishingDestinationResponse class]];
}

- (void)updatePublishingDestination:(AWSguarddutyUpdatePublishingDestinationRequest *)request
     completionHandler:(void (^)(AWSguarddutyUpdatePublishingDestinationResponse *response, NSError *error))completionHandler {
    [[self updatePublishingDestination:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyUpdatePublishingDestinationResponse *> * _Nonnull task) {
        AWSguarddutyUpdatePublishingDestinationResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

- (AWSTask<AWSguarddutyUpdateThreatIntelSetResponse *> *)updateThreatIntelSet:(AWSguarddutyUpdateThreatIntelSetRequest *)request {
    return [self invokeRequest:request
                    HTTPMethod:AWSHTTPMethodPOST
                     URLString:@"/detector/{detectorId}/threatintelset/{threatIntelSetId}"
                  targetPrefix:@""
                 operationName:@"UpdateThreatIntelSet"
                   outputClass:[AWSguarddutyUpdateThreatIntelSetResponse class]];
}

- (void)updateThreatIntelSet:(AWSguarddutyUpdateThreatIntelSetRequest *)request
     completionHandler:(void (^)(AWSguarddutyUpdateThreatIntelSetResponse *response, NSError *error))completionHandler {
    [[self updateThreatIntelSet:request] continueWithBlock:^id _Nullable(AWSTask<AWSguarddutyUpdateThreatIntelSetResponse *> * _Nonnull task) {
        AWSguarddutyUpdateThreatIntelSetResponse *result = task.result;
        NSError *error = task.error;

        if (completionHandler) {
            completionHandler(result, error);
        }

        return nil;
    }];
}

#pragma mark -

@end
